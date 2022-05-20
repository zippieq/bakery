from django.urls import path
from . import views

urlpatterns = [
    path('place_order/', views.place_order, name='place_order'),
    path('transaction/', views.transaction, name='transaction'),
    path('order_completed/', views.order_completed, name='order_completed'),
]