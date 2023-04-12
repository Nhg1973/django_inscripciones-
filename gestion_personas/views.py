from django.shortcuts import render, redirect
from gestion_personas.models import Alumno
from django.contrib.auth.models import User
from django.contrib.auth import login


def dashboard(request):
     titulo = 'Personal'
     context = {

        'titulo':titulo
    }
    
     return render(request, 'dashboard.html', context)

def registro(request):
     
     titulo = 'Registro'
     context = {

          'titulo':titulo
     }
     if request.method == 'GET':
          return render(request, 'auth/pages-register.html',context)

     else:
          if request.method == 'POST':
               
                   
                    user = request.user
                    nombre = request.POST.get('firstName')
                    apellido = request.POST.get('lastName')
                    about = request.POST.get('about')
                    que = request.POST.get('company')
                    donde = request.POST.get('job')
                    pais = request.POST.get('country')
                    direccion = request.POST.get('address')
                    telefono = request.POST.get('phone')
                    twitter = request.POST.get('twitter')
                    facebook = request.POST.get('Facebook')
                    instagram = request.POST.get('instagram')
                    linkedin = request.POST.get('linkedin')
                    
                    alumno = Alumno(
                         user=user,
                         nombre=nombre,
                         apellido=apellido,
                         about=about,
                         que=que,
                         donde=donde,
                         pais=pais,
                         direccion=direccion,
                         telefono=telefono,
                         twitter=twitter,
                         facebook=facebook,
                         instagram=instagram,
                         linkedin=linkedin
                    )

                    alumno.save()
               
                    return render(request, 'dashboard.html', context)
               

          return render(request, 'auth/pages-register.html', {
               'error': 'Las contraseñas NO son iguales'
          },context)

