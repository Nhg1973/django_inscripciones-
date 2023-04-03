from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from gestion_cursos.models import Categoria, Curso
from gestion_personas.models import Alumno, Docente


def home(request):
    categorias = Categoria.objects.all()
    cursos = Curso.objects.all()
    alumnos = Alumno.objects.all()
    profesores = Docente.objects.all()
    context = {
        'categorias': categorias,
        'cursos': cursos,
        'alumnos': alumnos,
        'profesores': profesores
    }
    return render(request, 'home/index.html', context)


def logIn(request):
    if request.method == 'POST':
        user = authenticate(
            request, username=request.POST['username'], password=request.POST['password'])
        if user is None:
            return render(request, 'auth/pages_login.html',{
                'error':'Usuario o Contraseña incorrecta'
            })
        else:
            login(request,user)
            return redirect('dashboard')
    else:
        return render(request, 'auth/pages-login.html')

def logOut(request):
    logout(request)
    return redirect("home")


def register(request):
    if request.method == 'GET':
        return render(request, 'auth/pages-register.html')

    else:
        if request.POST['password1'] == request.POST['password2']:
            try:
                user = User.objects.create_user(
                    request.POST['username'], 
                    request.POST['email'],
                    request.POST['password1'])
                
                user.save()
                login(request, user)
                return redirect('dashboard')
            except:
                return render(request, 'auth/register.html', {
                    'error': 'El Usuario ya existe'
                })

        return render(request, 'auth/register.html', {
            'error': 'Las contraseñas NO son iguales'
        })


def forgot(request):#falta formulario de recuperacion de contraseña
    return render(request, '#')

def nosotros(request):
    
     return render(request, 'home/pages-faq.html')

def cursos(request):
    
     return render(request, 'pricing.html')

def docentes(request):
    
     return render(request, 'pages-faq.html')

def contactos(request):
    
     return render(request, 'auth/pages-contact.html')
