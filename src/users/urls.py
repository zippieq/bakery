from django.urls import path
from . import views

urlpatterns = [
    path('', views.default, name='default'),
    path('register/', views.register, name='register'),
    path('login/', views.login, name='login'),
    path('logout/', views.logout, name='logout'),
    path('dashboard/', views.default, name='dashboard'),
    path('forgot_password/', views.forgot_password, name='forgot_password'),
    path('change_password/', views.change_password, name='change_password'),
    
    path('cart/', views.cart, name='cart'),
    path('add_cart/<int:item_id>/', views.add_cart, name='add_cart'),
    path('remove_cart/<int:cart_id>/', views.remove_cart, name='remove_cart'),
    path('remove_item/<int:cart_id>/', views.remove_item, name='remove_item'),
    path('checkout/', views.checkout, name='checkout'),

    # From mail
    path('activate/<uidb64>/<token>', views.activate, name='activate'),
    path('reset_password/<uidb64>/<token>', views.reset_password, name='reset_password'),
]
