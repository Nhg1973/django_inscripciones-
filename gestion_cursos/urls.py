from django.urls import path
from . import views

app_name = 'gestion'

urlpatterns = [
    path('ver-alumno/<int:id>/', views.ver_alumno, name='ver_alumno'),
]
