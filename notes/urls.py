from django.urls import path
from . import views

urlpatterns = [
	path('', views.notes_list, name='notes-list'),
  path('view_note/<str:course>/<str:filename>/', views.notes_detail),
]
