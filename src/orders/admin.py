from calendar import c
from django.contrib import admin
from .models import Transaction, Invoice, Detail

# Register your models here.
class ItemAdmin(admin.ModelAdmin):
    list_display = ['name', 'slug', 'category', 'price', 'stock', 'is_active']
    prepopulated_fields = {'slug': ('name',)}

class TransactionAdmin(admin.ModelAdmin):
    list_display = ['transaction_id', 'user', 'method', 'amount', 'status', 'created_at']

class InvoiceAdmin(admin.ModelAdmin):
    list_display = ['invoice_id', 'transaction', 'street_address', 'ward', 'district', 'city', 'country', 'notes']

class DetailAdmin(admin.ModelAdmin):
    list_display = ['invoice', 'item', 'quantity', 'price']

admin.site.register(Transaction, TransactionAdmin)
admin.site.register(Invoice, InvoiceAdmin)
admin.site.register(Detail, DetailAdmin)