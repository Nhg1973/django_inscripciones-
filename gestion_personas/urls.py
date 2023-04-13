from django.urls import path
from .views import *


urlpatterns = [
    path('',dashboard, name='dashboard' ),
    path('registro/',registro, name='registro'),
    path('carga_datos',cargaDatos, name='cargaDatos'),
]