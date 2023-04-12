from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.contrib.auth import login, logout, authenticate
from gestion_cursos.models import Categoria, Curso
from gestion_personas.models import Alumno, Docente, IngresoPersona



def home(request):
    categorias = Categoria.objects.all()
    cursos = Curso.objects.all()
    alumnos = Alumno.objects.all()
    profesores = Docente.objects.all()
    titulo = 'Pública'
    context = {
        'categorias': categorias,
        'cursos': cursos,
        'alumnos': alumnos,
        'profesores': profesores,
        'titulo':titulo
    }
    return render(request, 'home/index.html', context)
    


def logIn(request):
    
    titulo = 'Auth'
    context = {

        'titulo':titulo
    
    }
    if request.method == 'POST':
        user = authenticate(
            request, username=request.POST['username'], password=request.POST['password'])
        if user is None:
            return render(request, 'auth/pages-login.html',{
                'error':'Usuario o Contraseña incorrecta'
            },context)
        else:
            login(request,user)

            context = {
            'user': request.user,
            'rol': 'alumno' if hasattr(request.user, 'alumno') else 'docente' if hasattr(request.user, 'docente') else 'tutor'if hasattr(request.user, 'tutor') else 'ingresante',
            'photo': request.user.alumno.photo if hasattr(request.user, 'alumno') else request.user.docente.photo if hasattr(request.user, 'docente') else request.user.tutor.photo if hasattr(request.user, 'tutor') else 'defaul.jpg',
            }
            if context['rol'] == 'ingresante':
                return render(request, 'users-profile.html', context)
            else:
                # Si no se cumple ninguna de las condiciones anteriores, renderizar la plantilla 'users-profile.html'
                return render(request, 'dashboard.html', context)

    else:
        return render(request, 'auth/pages-login.html',context)

def logOut(request):
    logout(request)
    return redirect("home")


def register(request):
    titulo = 'Auth'
    context = {

        'titulo':titulo
    }
    if request.method == 'GET':
        return render(request, 'auth/pages-register.html',context)

    else:
        if request.POST['password1'] == request.POST['password2']:
            try:
                user = User.objects.create_user(
                    request.POST['username'], 
                    request.POST['email'],
                    request.POST['password1'])
                
                user.save()

                ingreso = IngresoPersona(user=user)
                ingreso.save()
                
                login(request, user)
                return redirect('dashboard')
            except:
                return render(request, 'auth/pages-register.html', {
                    'error': 'El Usuario ya existe'
                },context)

        return render(request, 'auth/pages-register.html', {
            'error': 'Las contraseñas NO son iguales'
        },context)


def forgot(request):#falta formulario de recuperacion de contraseña

    return render(request, '#')

def nosotros(request):
    titulo = 'Auth'
    context = {

        'titulo':titulo
    }
    
    return render(request, 'home/pages-faq.html',context)

def cursos(request):
    
     return render(request, 'pricing.html')

def docentes(request):
    
     return render(request, 'pages-faq.html')

def contactos(request):
    titulo = 'Público'
    context = {

        'titulo':titulo
    }
    
    return render(request, 'auth/pages-contact.html',context)
