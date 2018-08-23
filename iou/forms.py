from django import forms

from .models import Transaction, Person

class MyDebtForm(forms.ModelForm):
  
  class Meta:
    model = Transaction
    fields = ('title', 'party', 'amount', 'transaction_date', 'notes', 'reference_info',)

class OtherDebtForm(forms.ModelForm):

  class Meta:
    model = Transaction
    fields = ('title', 'party', 'amount', 'transaction_date', 'notes', 'reference_info',)

class PaymentInForm(forms.ModelForm):

  class Meta:
    model = Transaction
    fields = ('title', 'party', 'amount', 'transaction_date', 'notes', 'reference_info',)

class PaymentOutForm(forms.ModelForm):

  class Meta:
    model = Transaction
    fields = ('title', 'party', 'amount', 'transaction_date', 'notes', 'reference_info',)

class GroupMCForm(forms.Form):
  persons = Person.objects.all()
  OPTIONS = ()

  for person in persons:
    OPTIONS  = OPTIONS + ((str(person.pk), person.name),)
  
  group_persons = forms.MultipleChoiceField(widget=forms.CheckboxSelectMultiple, choices=OPTIONS)
