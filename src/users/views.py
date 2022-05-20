from django import forms
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages, auth
from django.contrib.auth.decorators import login_required
from django.contrib.auth.tokens import default_token_generator
from django.contrib.sites.shortcuts import get_current_site
from django.template.loader import render_to_string
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes
from django.core.mail import EmailMessage
from django.core.exceptions import ObjectDoesNotExist

from .models import Account, Cart, Address
from products.models import Item

# Create your views here.
class RegistrationForm(forms.ModelForm):
    username = forms.CharField(max_length=50)
    email = forms.EmailField(max_length=255)
    first_name = forms.CharField(max_length=50)
    last_name = forms.CharField(max_length=50)
    phone_number = forms.CharField(max_length=50)
    password = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Nhập mật khẩu'}))
    confirm_password = forms.CharField(widget=forms.PasswordInput(attrs={'placeholder': 'Xác nhận'}))

    class Meta:
        model = Account
        fields = ['username', 'email', 'first_name', 'last_name', 'phone_number', 'password', 'confirm_password']

    def __init__(self, *args, **kwargs):
        super(RegistrationForm, self).__init__(*args, **kwargs)
        self.fields['username'].widget.attrs['placeholder'] = 'Nhập username'
        self.fields['email'].widget.attrs['placeholder'] = 'Địa chỉ Email'
        self.fields['first_name'].widget.attrs['placeholder'] = 'Tên'
        self.fields['last_name'].widget.attrs['placeholder'] = 'Họ'
        self.fields['phone_number'].widget.attrs['placeholder'] = 'Số điện thoại'
        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'

    def clean(self):
        cleaned_data = super(RegistrationForm, self).clean()
        password = cleaned_data.get('password')
        confirm_password = cleaned_data.get('confirm_password')
        if password != confirm_password:
            raise forms.ValidationError('Mật khảu không khớp')
        return cleaned_data

def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            email = form.cleaned_data['email']
            first_name = form.cleaned_data['first_name']
            last_name = form.cleaned_data['last_name']
            phone_number = form.cleaned_data['phone_number']
            password = form.cleaned_data['password']

            user = Account.objects.create_user(
                username=username, 
                email=email, 
                first_name=first_name, 
                last_name=last_name, 
                password=password,
                phone_number = phone_number
            )
            user.save()

            current_site = get_current_site(request=request)
            mail_subject = 'Xác nhận địa chỉ email.'
            message = render_to_string('account/mail_activation.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': default_token_generator.make_token(user)
            })
            send_email = EmailMessage(mail_subject, message, to=[email])
            send_email.send()
            messages.success(
                request=request,
                message="Vui lòng xác nhận địa chỉ email!"
            )
            return redirect('register')
        else:
            messages.error(request=request, message="Thất bại!")
    else:
        form = RegistrationForm()
    context = {
        'form': form,
    }
    return render(request, 'account/account_register.html', context)

def login(request):
    if request.method == "POST":
        email = request.POST.get('email')
        password = request.POST.get('password')
        user = auth.authenticate(email=email, password=password)
        if user is not None:
            auth.login(request=request, user=user)
            url = request.META.get('HTTP_REFERER')
            try:
                query = requests.utils.urlparse(url).query
                params = dict(x.split("=") for x in query.split("&"))
                if "next" in params:
                    next_page = params["next"]
                    return redirect(next_page)
            except Exception:
                return redirect('dashboard')
        else:
            messages.error(request=request, message="Thất bại!")
    context = {
        'email': email if 'email' in locals() else '',
        'password': password if 'password' in locals() else '',
    }
    return render(request, 'account/account_login.html', context=context)

@login_required(login_url="login")
def logout(request):
    auth.logout(request)
    messages.success(request=request, message="Đăng xuất thành công!")
    return redirect('login')

def activate(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = Account.objects.get(pk=uid)
    except Exception:
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        user.is_active = True
        user.save()
        messages.success(
            request=request, message="Tài khoản của bạn đã được kích hoạt!")
        return redirect('login')
        
    else:
        messages.error(request=request, message="Không tìm thấy liên kết!")
        return redirect('login')

def forgot_password(request):
    try:
        if request.method == 'POST':
            email = request.POST.get('email')
            user = Account.objects.get(email__exact=email)

            current_site = get_current_site(request=request)
            mail_subject = 'Khôi phục mật khẩu.'
            message = render_to_string('account/mail_reset.html', {
                'user': user,
                'domain': current_site.domain,
                'uid': urlsafe_base64_encode(force_bytes(user.pk)),
                'token': default_token_generator.make_token(user)
            })
            send_email = EmailMessage(mail_subject, message, to=[email])
            send_email.send()

            messages.success(
                request=request, message="Chúng tôi đã gửi cho bạn một email!")

    except Exception:
        messages.error(request=request, message="Tài khoản không tồn tại!")
    finally:
        context = {
            'email': email if 'email' in locals() else '',
        }
        return render(request, "account/account_forgot.html", context=context)

def reset_password(request, uidb64, token):
    try:
        uid = urlsafe_base64_decode(uidb64).decode()
        user = Account.objects.get(pk=uid)
    except Exception:
        user = None

    if user is not None and default_token_generator.check_token(user, token):
        request.session['uid'] = uid
        return redirect('change_password')
    else:
        messages.error(request=request, message="Không tìm thấy liên kết!")
        return redirect('login')

def change_password(request):
    if request.method == 'POST':
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')

        if password == confirm_password:
            uid = request.session.get('uid')
            user = Account.objects.get(pk=uid)
            user.set_password(password)
            user.save()
            messages.success(request, message="Thành công!")
            return redirect('login')
        else:
            messages.error(request, message="Mật khẩu không khớp!")
    return render(request, 'account/account_reset.html')

def default(request):
    return redirect('home')

def cart(request, total=0, quantity=0, cart_items=None):
    try:
        if request.user.is_authenticated:
            cart_items = Cart.objects.all().filter(user=request.user, is_active=True)
        else:
            cart_items = []
            
        for cart_item in cart_items:
            total += cart_item.item.price * cart_item.quantity
            quantity += cart_item.quantity
        
        tax = int(total * 1 / 10)
        grand_total = total + tax

    except ObjectDoesNotExist:
        pass

    print(request.user)
    context = {
        'total': total,
        'quantity': quantity,
        'cart_items': cart_items,
        'tax': tax if "tax" in locals() else "",
        'grand_total': grand_total if "tax" in locals() else 0,
    }
    return render(request, 'account/account_cart.html', context=context)

def add_cart(request, item_id):
    user = request.user
    item = Item.objects.get(pk=item_id)
    if user.is_authenticated:
        try:
            cart_item = Cart.objects.get(user=user, item=item, is_active=True)
            cart_item.quantity += 1
            cart_item.save()
        except ObjectDoesNotExist:
            cart_item = Cart.objects.create(user=user, item=item, quantity=1)
            cart_item.save()
    else:
        return redirect('login')
    
    return redirect('cart')

def remove_cart(request, cart_id):
    cart_item = get_object_or_404(Cart, pk=cart_id, user=request.user)
    try:
        if cart_item.quantity > 1:
            cart_item.quantity -= 1
            cart_item.save()
        else:
            cart_item.delete()
    except Exception:
        pass
    return redirect('cart')

def remove_item(request, cart_id):
    cart_item = get_object_or_404(Cart, pk=cart_id, user=request.user)
    try:
        cart_item.delete()
    except Exception:
        pass
    return redirect('cart')

@login_required(login_url='login')
def checkout(request, total=0, quantity=0, cart_items=None):
    try:
        cart_items = Cart.objects.filter(user=request.user, is_active=True)
        for cart_item in cart_items:
            total += cart_item.item.price * cart_item.quantity
            quantity += cart_item.quantity
        tax = total * 2 / 100
        grand_total = total + tax
    except ObjectDoesNotExist:
        pass

    try:
        address = Address.objects.get(user=request.user)
    except ObjectDoesNotExist:
        address = None

    if address is None:
        address = Address()
        address.user = request.user
        address.street_address = ''
        address.ward = ''
        address.district = ''
        address.city = ''
        address.country = ''

    context = {
        'total': total,
        'quantity': quantity,
        'cart_items': cart_items,
        'tax': tax if "tax" in locals() else "",
        'grand_total': grand_total,
        'address' : address,
    }
    return render(request, 'account/account_checkout.html', context=context)