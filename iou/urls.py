from django.urls import path
from . import views

urlpatterns = [
	path('', views.transactions_list, name='transactions_list'),
  path('add_my_debt/', views.my_debt_add, name='my_debt_add'),
	path('add_other_debt/', views.other_debt_add, name='other_debt_add'),

]
