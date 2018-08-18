from django.shortcuts import render
from .models import Entry

# Create your views here.

def entries_list(request):
	entries = Entry.objects.order_by('transaction_date').reverse()
	return render(request, 'iou/entry_list.html', {'entries': entries})

def entry_add(request):
	return render(request, 'iou/entry_add/html', {})
