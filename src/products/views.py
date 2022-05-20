from django.shortcuts import render, get_object_or_404
from products.models import Category, Item
from django.core.paginator import Paginator

# Create your views here.
def item_list(request, category_slug=None):
    if category_slug is not None:
        categories = get_object_or_404(Category, slug=category_slug)
        items = Item.objects.all().filter(category=categories, is_active=True)
    else:
        items = Item.objects.all().filter(is_active=True).order_by('id')
    
    context = {
        'items': items,
    }
    return render(request, 'products/item_list.html', context)

def item_detail(request, category_slug, item_slug):
    item = get_object_or_404(Item, slug=item_slug, category__slug=category_slug, is_active=True)
    context = {
        'item': item,
    }
    return render(request, 'products/item_detail.html', context)