from django.shortcuts import render
from gestion_cursos.models import Categoria, Curso

from gestion_personas.models import Alumno, Docente

def ver_alumno(request, id):
    titulo = 'Dashboard Docente'
    user = request.user
    docente = Docente.objects.get(user=user)
    id_alumno = int(id)
    alumno = Alumno.objects.get(id=id_alumno)                    
    context = {
            'titulo':titulo,
            'user': user,
            'docente': docente,
            'photo': docente.photo,
            'alumno': alumno, 
            'photoA': alumno.photo
    }
    return render(request, 'perfil_alumnos.html', context)

def seleccionar_cursos(request):
        titulo = 'Seleccion de Cursos'
        user = request.user
        alumno = Alumno.objects.get(user=user)
        cursos = Curso.objects.all()
        photoA = alumno.photo           
        context = {
                'titulo':titulo,
                'user': user,
                'cursos': cursos, 
                'alumno': alumno, 
                'photoA': alumno.photo
        }
        return render(request, 'Categorias_cursos_select.html')