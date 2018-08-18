from django.db import models
from django.utils import timezone

# Create your models here.

class Entry(models.Model):
	author = models.ForeignKey('auth.User', on_delete=models.CASCADE)
	title = models.CharField(max_length=255)
	payee = models.CharField(max_length=255)
	amount = models.DecimalField(default = 0, max_digits=8, decimal_places=2)
	transaction_date = models.DateTimeField(default = timezone.now)
	ref = models.CharField(max_length=255)

	def __str__(self):
		return self.title
