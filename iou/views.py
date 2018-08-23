from django.shortcuts import render, redirect
from .models import Transaction, Person
from .forms import MyDebtForm, OtherDebtForm, PaymentInForm, PaymentOutForm, GroupMCForm

# Create your views here.

def transactions_list(request):
	transactions = Transaction.objects.order_by('transaction_date').reverse()
	return render(request, 'iou/transaction_list.html', {'transactions': transactions})

def my_debt_add(request):
  if request.method == "POST":
    form = MyDebtForm(request.POST)
    if form.is_valid():
      transaction = form.save(commit=False)
      transaction.author = request.user
      transaction.save()
      person = Person.objects.filter(pk=transaction.party.pk)[0]
      person.balance -= transaction.amount
      person.save()
      return redirect('transactions_list')

  else:
    form = MyDebtForm()

  return render(request, 'iou/transaction_add.html', {'form': MyDebtForm})

def other_debt_add(request):
  if request.method == "POST":
    form = OtherDebtForm(request.POST)
    group_mc_form = GroupMCForm(request.POST)
    
    if form.is_valid():
      transaction = form.save(commit=False)
      transaction.author = request.user

      if request.POST.get('is_group', 'off') == 'on' and group_mc_form.is_valid():
        group_persons = group_mc_form.cleaned_data.get('group_persons')
        # divide transaction amount
        transaction.amount /= (len(group_persons)+1)

        for pk in group_persons:
          person = Person.objects.filter(pk=int(pk))[0]
          person.balance += transaction.amount
          person.save()
          
          transaction.party = person
          transaction.pk = None
          transaction.save()
      else:
        transaction.save()

        person = Person.objects.filter(pk=transaction.party.pk)[0]
        person.balance += transaction.amount
        person.save()
      
    return redirect('transactions_list')

  else:
    form = OtherDebtForm()
    group_mc_form = GroupMCForm()

  return render(request, 'iou/other_debt_add.html', {'form': OtherDebtForm, 'group_mc_form': GroupMCForm})

def payment_in_add(request):
  if request.method == "POST":
    form = PaymentInForm(request.POST)
    if form.is_valid():
      transaction = form.save(commit=False)
      transaction.author = request.user
      transaction.save()
      person = Person.objects.filter(pk=transaction.party.pk)[0]
      person.balance -= transaction.amount
      person.save()
      return redirect('transactions_list')

  else:
    form = MyDebtForm()

  return render(request, 'iou/transaction_add.html', {'form': MyDebtForm})

def payment_out_add(request):
  if request.method == "POST":
    form = PaymentOut(request.POST)
    if form.is_valid():
      transaction = form.save(commit=False)
      transaction.author = request.user
      transaction.save()
      person = Person.objects.filter(pk=transaction.party.pk)[0]
      person.balance -= transaction.amount
      person.save()
      return redirect('transactions_list')

  else:
    form = MyDebtForm()

  return render(request, 'iou/transaction_add.html', {'form': MyDebtForm})

