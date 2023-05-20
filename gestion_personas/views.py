from django.shortcuts import render, redirect, get_object_or_404
from gestion_cursos.models import Categoria, Curso, Inscripcion
from gestion_personas.models import Alumno, Docente, IngresoPersona, Tutor
from django.contrib.auth.models import User
from django.contrib import messages
from django.contrib.auth.decorators import login_required

from publico.fomrs.user_registration_form import ProfileEditForm
from django.contrib import messages



@login_required
def dashboard(request):
     titulo = 'Dashboard'
     rol = request.GET.get('rol')
     photo = request.GET.get('photo', None)

     if(rol == 'tutor'):
          user = request.user
          docentes = Docente.objects.all()
          cursos = Curso.objects.all()
          alumnos = Alumno.objects.all()
          docente = Tutor.objects.get(user=user)
          cursos_con_alumnos = {}
          for curso in cursos:
               inscripciones = Inscripcion.objects.filter(curso=curso)
               alumnos = [inscripcion.alumno for inscripcion in inscripciones]
               cursos_con_alumnos[curso.nombre] = alumnos               
          context = {
                    'titulo':titulo,
                    'user': user,
                    'alumnos' :  alumnos,
                    'docentes': docente,
                    'cursos_con_alumnos': cursos_con_alumnos,
                    'photo':docente.photo
          }
          return render(request, 'dashboardTutor.html', context)
     
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
                    'photo':docente.photo
          }
          return render(request, 'dashboard.html', context)
     else:
          user = request.user
          alumno = Alumno.objects.get(user=user)
          # Obtiene el contenido del contexto de la vista dashboardAlumnos
          cursos = Curso.objects.all()
          profesores = Docente.objects.all()
          context = {
               'cursos': cursos,
               'profesores': profesores,
               'titulo': 'Dashboard Alumnos',
               'user': user,
               'alumno': alumno, 
               'photo': alumno.photo
          }
          return render(request, 'DashboardAlumnos.html', context)


def registro(request):
    titulo = 'Registro'
    context = {'titulo':titulo}

    if request.method == 'GET':
        form = ProfileEditForm()
        context['form'] = form
        return render(request, 'auth/pages-register.html', context)
    
    elif request.method == 'POST':
        form = ProfileEditForm(request.POST)
        if form.is_valid():
            user = request.user
            ingreso_persona = get_object_or_404(IngresoPersona, user=user)

            alumno = Alumno(
                user=user,
                nombre=form.cleaned_data['firstName'],
                apellido=form.cleaned_data['lastName'],
                about=form.cleaned_data['about'],
                que=form.cleaned_data['company'],
                donde=form.cleaned_data['job'],
                pais=form.cleaned_data['country'],
                direccion=form.cleaned_data['address'],
                telefono=form.cleaned_data['phone'],
                twitter=form.cleaned_data['twitter'],
                facebook=form.cleaned_data['facebook'],
            )
            
            alumno.save()
            # Eliminar instancia de IngresoPersona
            ingreso_persona.delete()

            messages.set_level(request, messages.SUCCESS)
            messages.success(request, 'Ya estas registrado puedes seleccionar los cursos en los que quieras participar')

            # Obtiene el contenido del contexto de la vista dashboardAlumnos
            cursos = Curso.objects.all()
            profesores = Docente.objects.all()
            context_dashboard = {
                'cursos': cursos,
                'profesores': profesores,
                'titulo': 'Dashboard Alumnos',
            }
            # Agrega el contenido de la vista dashboardAlumnos al contexto actual
            context.update(context_dashboard)
            context.update({
                'user': user,
                'alumno': alumno, 
                'photo': alumno.photo
            })

            return render(request, 'DashboardAlumnos.html', context)
        else:
            # Agregar errores al contexto y mostrarlos en la página
            context['form'] = form
            messages.error(request, 'Por favor corrija los errores en el formulario.')
            return render(request, 'users-profile.html', context)
    else:
        return render(request, 'auth/pages-register.html', {'error':'Las de contenido'}, context)



def cargaDatos(request):
     return render(request, 'users-profile.html')


def dasboardAlumnos(request):
     
     return render(request, 'DashboardAlumnos.html')