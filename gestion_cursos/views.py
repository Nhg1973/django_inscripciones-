from django.shortcuts import render
from gestion_cursos.models import Curso

from gestion_personas.models import Alumno, Docente

def ver_alumno(request, id):
    titulo = 'Dashboard'
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
