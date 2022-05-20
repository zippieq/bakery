from django.db import models
from django.db.models.deletion import CASCADE
from django.urls import reverse

# Create your models here.
class Category(models.Model):
    name        = models.CharField(max_length=50, unique=True)
    slug        = models.SlugField(max_length=50, unique=True)
    description = models.TextField(max_length=255, blank=True)
    image       = models.ImageField(upload_to ='categories/', blank=True)

    class Meta:
        verbose_name = 'Category'
        verbose_name_plural = 'Categories'

    def get_url(self):
        return reverse('category_detail', args=[self.slug])

    def __str__(self):
        return self.name

class Item(models.Model):
    category    = models.ForeignKey(Category, on_delete = models.CASCADE) 
    name        = models.CharField(max_length=150, unique=True)
    slug        = models.SlugField(max_length=150, unique=True)
    description = models.TextField(max_length=300, blank=True)
    price       = models.IntegerField()
    image       = models.ImageField(upload_to ='items/')
    stock       = models.IntegerField()
    is_active   = models.BooleanField(default=True)

    def get_url(self):
        return reverse('item_detail', args=[self.category.slug, self.slug])

    def __str__(self):
        return self.name

class Review(models.Model):
    item        = models.ForeignKey(Item, on_delete = CASCADE)
    user        = models.ForeignKey('users.Account', on_delete = CASCADE)
    comment     = models.TextField(max_length=255, blank=True)
    rating      = models.IntegerField()
    created_at  = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.comment