from django.urls import path
from . import views

urlpatterns = [
    path('', views.item_list, name='item_list'),
    path('<slug:category_slug>/', views.item_list, name='category_detail'),
    path('<slug:category_slug>/<slug:item_slug>/', views.item_detail, name='item_detail'),
    path('submit_review/<int:product_id>/', views.item_detail, name='submit_review'),
]