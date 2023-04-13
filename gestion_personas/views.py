from django.shortcuts import render, redirect
from gestion_cursos.models import Curso, Inscripcion
from gestion_personas.models import Alumno, Docente
from django.contrib.auth.models import User
from django.contrib.auth.decorators import login_required

@login_required
def dashboard(request):
     titulo = 'Dashboard'
     rol = request.GET.get('rol')
     photo = request.GET.get('photo', None)
     

     if(rol == 'docente'):
          user = request.user
          docente = Docente.objects.get(user=user)
          cursos = Curso.objects.filter(docente_titular=docente)
          cursos_con_alumnos = {}

          for curso in cursos:
               inscripciones = Inscripcion.objects.filter(curso=curso)
               alumnos = [inscripcion.alumno for inscripcion in inscripciones]
               cursos_con_alumnos[curso.nombre] = alumnos 
               
               
          context = {
                    'titulo':titulo,
                    'user': user,
                    'docente': docente,
                    'cursos_con_alumnos': cursos_con_alumnos,
                    'photo':photo
          }

          return render(request, 'dashboard.html', context)
     else:
          context = {
                    'photo':photo
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

def cargaDatos(request):
     return render(request, 'users-profile.html')