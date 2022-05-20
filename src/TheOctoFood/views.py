from django.shortcuts import render
from django.db.models import Q
from products.models import Category, Item

def home(request):
    categories = Category.objects.all()
    context = {
        'categories': categories
    }
    return render(request, 'main/home.html', context)

def search(request):
    if 'q' in request.GET:
        q = request.GET.get('q')
        items = Item.objects.filter(Q(name__icontains=q) | Q(description__icontains=q))
    context = {
        'items': items,
        'q': q,
    }
    return render(request, 'products/item_list.html', context=context)