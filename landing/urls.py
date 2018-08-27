from django.urls import path
from . import views

urlpatterns = [
    path('', views.landing, name='landing'),
    path('resume/', views.resume, name='resume'),
    path('what-i-use/', views.viewSiteTools, name='what-i-use'),
]
