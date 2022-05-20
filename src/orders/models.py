from django.db import models

# Create your models here.
class Transaction(models.Model):
    user = models.ForeignKey('users.Account', on_delete=models.CASCADE)
    transaction_id = models.CharField(max_length=100)
    method = models.CharField(max_length=100)
    amount = models.CharField(max_length=100)
    status = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.transaction_id

class Invoice(models.Model):
    STATUS = (
        ('New', 'New'),
        ('Accepted', 'Accepted'),
        ('Completed', 'Completed'),
        ('Cancelled', 'Cancelled'),
    )
    invoice_id = models.CharField(max_length=100)
    user = models.ForeignKey('users.Account', on_delete=models.SET_NULL, null=True)
    transaction = models.ForeignKey('orders.Transaction', on_delete=models.SET_NULL, null=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    phone_number = models.CharField(max_length=50)
    street_address = models.CharField(max_length=50)
    ward = models.CharField(max_length=50)
    district = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    status = models.CharField(max_length=10, choices=STATUS, default='New')
    notes = models.CharField(max_length=100, blank=True)
    total = models.IntegerField()
    tax = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def full_name(self):
        return "{0} {1}".format(self.first_name, self.last_name)

    def full_address(self):
        return "{0}, {1}, {2}, {3}, {4}".format(self.street_address, self.ward, self.district, self.city, self.country)

    def __str__(self):
        return self.first_name

class Detail(models.Model):
    invoice = models.ForeignKey('orders.Invoice', on_delete=models.CASCADE)
    item = models.ForeignKey('products.Item', on_delete=models.CASCADE)
    quantity = models.IntegerField()
    price = models.IntegerField()

    def __str__(self):
        return self.item.name