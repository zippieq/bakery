import imp
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager

# Create your models here.
class CustomUserManager(BaseUserManager):
    def create_user(self, username, password, email, first_name, last_name, phone_number, **extra_fields):
        if not username:
            raise ValueError('Username must be set')

        if not email:
            raise ValueError('Email must be set')

        email = self.normalize_email(email)
        user = self.model(
            username=username,
            email=self.normalize_email(email),
            first_name=first_name,
            last_name=last_name,
            phone_number=phone_number,
            **extra_fields
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, username, password, email, first_name, last_name, phone_number, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_active', True)

        return self.create_user(
            username=username, 
            password=password, 
            email=email, 
            first_name=first_name, 
            last_name=last_name, 
            phone_number=phone_number,
            **extra_fields)

class Account(AbstractBaseUser):
    username = models.CharField(max_length=50, unique=True, default='')
    email = models.EmailField(max_length=255, unique=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    phone_number = models.CharField(max_length=50, unique=True)

    is_staff = models.BooleanField(default=False)
    is_superuser = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    date_joined = models.DateTimeField(auto_now_add=True)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name', 'phone_number']

    objects = CustomUserManager()

    def __str__(self):
        return self.username

    def has_perm(self, perm, obj=None):
        return self.is_superuser

    def has_module_perms(self, add_label):
        return True

class Address(models.Model):
    user = models.ForeignKey(Account, on_delete=models.CASCADE)
    street_address = models.CharField(max_length=50)
    ward = models.CharField(max_length=50)
    district = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    country = models.CharField(max_length=50)
    is_default = models.BooleanField(default=False)

    class Meta:
        verbose_name_plural = "Address"

    def __str__(self):
        return self.street_address

class Cart(models.Model):
    user        = models.ForeignKey(Account, on_delete = models.CASCADE)
    item        = models.ForeignKey('products.Item', on_delete = models.CASCADE)
    quantity    = models.IntegerField(default=1)
    is_active   = models.BooleanField(default=True)

    def sub_total(self):
        return self.quantity * self.item.price

    def __unicode__(self):
        return self.item