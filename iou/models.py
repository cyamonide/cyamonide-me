from django.db import models
from django.utils import timezone

# Create your models here.

class Transaction(models.Model):
  author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
  title = models.CharField(max_length=255)
  notes = models.CharField(max_length=255)
  party = models.ForeignKey('Person', on_delete=models.CASCADE)
  group_pk = models.IntegerField(default=-1)
  amount = models.DecimalField(default=0, max_digits=8, decimal_places=2)
  transaction_date = models.DateTimeField(default=timezone.now)
  reference_info = models.CharField(max_length=255)

  def __str__(self):
    return self.title

class Person(models.Model):
  name = models.CharField(max_length=255)
  balance = models.DecimalField(default=0, max_digits=8, decimal_places=2)

  def __str__(self):
    return self.name
