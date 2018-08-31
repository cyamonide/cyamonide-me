from django.urls import path
from . import views

urlpatterns = [
	path('', views.notes_list, name='notes-list'),
	path('view_note/<int:pk>/', views.notes_detail, name='post-detail'),
]
