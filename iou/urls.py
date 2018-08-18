from django.urls import path
from . import views

urlpatterns = [
	path('', views.entries_list, name='entries_list'),
	path('add_entry/', views.entry_add, name='entry_add'),
]
