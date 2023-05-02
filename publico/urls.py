from django.contrib import admin
from django.urls import path
from .views import *


urlpatterns = [
    path('',home, name='home'),
    path('login/',logIn, name='logIn'),
    path('register/',register, name='register'),
    path('logout/',logOut, name='logOut'),
    path('forgot-password/',forgot, name='forgot'),
    path('nosotros/',nosotros, name='nosotros'),
    path('cursos/',cursos, name='cursos'),
    path('docentes/',docentes, name='docentes'),
    path('contactos/',contactos, name='contactos'),
    path('carga-datos/', carga_datos, name='carga_datos')
]