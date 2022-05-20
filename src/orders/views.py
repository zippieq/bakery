from email.headerregistry import Address
from django.shortcuts import render, redirect
from django.template.loader import render_to_string
from django.core.mail import EmailMessage
from django.http import JsonResponse
from django import forms
from django.contrib.sites.shortcuts import get_current_site
from .models import Transaction, Invoice, Detail
from users.models import Cart, Address
from products.models import Item

import datetime

# Create your views here.
class OrderForm(forms.ModelForm):
    class Meta:
        model = Invoice
        fields = ['first_name', 'last_name', 'phone_number', 'street_address', 'ward', 'district', 'city', 'country', 'notes']

def sendEmail(request, order, trans_id):
    current_site = get_current_site(request=request)
    mail_subject = 'Xác nhận đơn hàng #' + order.invoice_id
    message = render_to_string('mail/invoice.html', {
        'user': request.user,
        'order': order,
        'trans_id': trans_id,
        'domain' : current_site.domain
    })
    to_email = request.user.email
    send_email = EmailMessage(mail_subject, message, to=[to_email])
    send_email.send()

def is_ajax(request):
    return request.META.get('HTTP_X_REQUESTED_WITH') == 'XMLHttpRequest'

def transaction(request):
    try:
        if is_ajax(request) and request.method == 'POST':
            data = request.POST
            id = data['orderID']
            trans_id = data['transID']
            method = data['payment_method']
            status = data['status']

            invoice = Invoice.objects.get(user=request.user, invoice_id=id)
            
            transaction = Transaction(
                user=request.user,
                transaction_id=trans_id,
                method=method,
                amount=invoice.total,
                status=status,
            )
            transaction.save()

            invoice.transaction = transaction
            invoice.save()

            cart_items = Cart.objects.filter(user=request.user)
            for cart_item in cart_items:
                detail = Detail()
                detail.invoice = invoice
                detail.item = cart_item.item
                detail.quantity = cart_item.quantity
                detail.price = cart_item.item.price
                detail.save()

                product = Item.objects.get(category=cart_item.item.category, name=cart_item.item.name)
                product.stock -= cart_item.quantity
                product.save()

            Cart.objects.filter(user=request.user).delete()

            sendEmail(request=request, order=invoice, trans_id=trans_id)

            data = {
                'order_number': invoice.invoice_id,
                'transID': transaction.transaction_id,
            }
        return JsonResponse({"data": data}, status=200)

    except Exception as e:
        return JsonResponse({"error": e}, status=400)


def place_order(request, total=0, quantity=0,):
    current_user = request.user

    if not current_user.is_authenticated:
        return redirect('login')
    
    cart_items = Cart.objects.filter(user=current_user)

    grand_total = 0
    tax = 0

    for cart_item in cart_items:
        total += (cart_item.item.price * cart_item.quantity)
        quantity += cart_item.quantity

    tax = int(total / 10)
    grand_total = total + tax

    if request.method == 'POST':
        form = OrderForm(request.POST)
        if form.is_valid():
            data = Invoice()
            data.user = current_user
            data.first_name = form.cleaned_data['first_name']
            data.last_name = form.cleaned_data['last_name']
            data.phone_number = form.cleaned_data['phone_number']
            data.street_address = form.cleaned_data['street_address']
            data.ward = form.cleaned_data['ward']
            data.district = form.cleaned_data['district']
            data.city = form.cleaned_data['city']
            data.country = form.cleaned_data['country']
            data.notes = form.cleaned_data['notes']
            data.total = grand_total
            data.tax = tax
            data.save()

            try:
                address = Address.objects.get(user=current_user)
            except Exception as e:
                address = Address()
                address.user = current_user
                address.save()
                
            address.street_address = form.cleaned_data['street_address']
            address.ward = form.cleaned_data['ward']
            address.district = form.cleaned_data['district']
            address.city = form.cleaned_data['city']
            address.country = form.cleaned_data['country']
            address.save()
            
            yr = int(datetime.date.today().strftime('%Y'))
            dt = int(datetime.date.today().strftime('%d'))
            mt = int(datetime.date.today().strftime('%m'))
            d = datetime.date(yr, mt, dt)
            current_date = d.strftime("%Y%m%d")
            id = current_date + str(data.id)
            data.invoice_id = id
            data.save()

            invoice = Invoice.objects.get(user=current_user, invoice_id=id)
            context = {
                'order': invoice,
                'cart_items': cart_items,
                'total': total,
                'tax': tax,
                'grand_total': round(grand_total / 22715, 2),
            }
            return render(request, 'orders/place_order.html', context)
        else:
            print("Form is not valid")
    else:
        return redirect('checkout')


def order_completed(request):
    order_number = request.GET.get('order_number')
    transID = request.GET.get('payment_id')

    try:
        invoice = Invoice.objects.get(invoice_id=order_number)
        ordered_products = Detail.objects.filter(invoice=invoice)

        subtotal = 0
        for i in ordered_products:
            subtotal += i.item.price * i.quantity

        transaction = Transaction.objects.get(transaction_id=transID)

        context = {
            'invoice': invoice,
            'ordered_products': ordered_products,
            'order_number': invoice.invoice_id,
            'transID': transaction.transaction_id,
            'payment': transaction,
            'subtotal': subtotal,
        }
        return render(request, 'orders/completed.html', context)
    except Exception as e:
        print(e)
        return redirect('home')