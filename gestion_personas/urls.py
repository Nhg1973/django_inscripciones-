from django.urls import path
from .views import *
from . import templates

urlpatterns = [
    path('',dashboard, name='dashboard' ),
    path('registro/',registro, name='registro'),
    path('carga_datos',cargaDatos, name='cargaDatos')
]