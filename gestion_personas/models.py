from django.db import models
from django.contrib.auth.models import AbstractUser
from django.contrib.auth.models import Group, Permission
from django.utils.translation import gettext as _



class Persona(AbstractUser):
    
    groups = models.ManyToManyField(
        Group,
        verbose_name=_('groups'),
        blank=True,
        related_name='persona'
    )
    user_permissions = models.ManyToManyField(
        Permission,
        verbose_name=_('user permissions'),
        blank=True,
        related_name='persona'
    )
    nombre = models.CharField(max_length=50)
    apellido = models.CharField(max_length=50)
    numero_documento = models.CharField(max_length=20)
    edad = models.IntegerField()
    email = models.EmailField(unique=True)
    telefono = models.CharField(max_length=15, blank=True)
    direccion = models.CharField(max_length=100, blank=True)
    ciudad = models.CharField(max_length=50, blank=True)
    provincia = models.CharField(max_length=50, blank=True)
    pais = models.CharField(max_length=50, blank=True)

    def __str__(self):
        return f"{self.nombre} {self.apellido}"


class Alumno(Persona):
    photo = models.ImageField(upload_to="alumno", default='defaul.jpg')
    
    def __str__(self):
        return f"{self.nombre} - {self.apellido}"


class Docente(Persona):
    photo = models.ImageField(upload_to="docentes", default='defaul.jpg')
    
    def __str__(self):
        return f"{self.nombre} - {self.apellido}"


class Tutor(Persona):
    photo = models.ImageField(upload_to="tutor", default='defaul.jpg')
    
    def __str__(self):
        return f"{self.nombre} - {self.apellido}"
