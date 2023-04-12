from django.contrib.auth.models import User
from django.contrib.auth.decorators import user_passes_test


def es_alumno(user):
    return user.is_authenticated and hasattr(user, 'alumno')

def es_docente(user):
    return user.is_authenticated and hasattr(user, 'docente')

def es_tutor(user):
    return user.is_authenticated and hasattr(user, 'tutor')

def es_ingresante(user):
    return user.is_authenticated and hasattr(user, 'ingresoPersona')

def es_inscripto(user):
    return user.is_authenticated and hasattr(user, 'inscripto')
    
user_passes_test(es_alumno, login_url='login')
user_passes_test(es_docente, login_url='login')
user_passes_test(es_tutor, login_url='login')
user_passes_test(es_inscripto, login_url='login')
user_passes_test(es_ingresante, login_url='login')

