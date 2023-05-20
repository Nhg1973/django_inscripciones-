
from django.shortcuts import redirect, render
from .models import Categoria, Curso, Inscripcion
from django.contrib.auth.decorators import user_passes_test
from django.views.generic import CreateView, UpdateView, DeleteView, ListView
from django.utils.decorators import method_decorator
from django.urls import reverse_lazy
from django.contrib import messages
from .models import Categoria, SolicitudInscripcion




from gestion_personas.models import Alumno, Docente, Tutor

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



def es_tutor(user):
    return user.is_authenticated and hasattr(user, 'tutor')

@method_decorator(user_passes_test(es_tutor), name='dispatch')
class CategoriaCreateView(CreateView):
    model = Categoria
    fields = ['nombre', 'descripcion', 'photo']
    template_name = 'create_and_edit_categorias.html'

    def form_valid(self, form):
        # Asignamos el tutor actual como el tutor de la nueva categoría
        form.instance.tutor = self.request.user.tutor

        try:
            # Llamamos al método `form_valid` del padre para guardar la categoría en la base de datos
            response = super().form_valid(form)
            messages.success(self.request, 'Categoría creada exitosamente.')
        except Exception as e:
            messages.error(self.request, f'Error al crear categoría: {e}')
            return self.form_invalid(form)

        # Redirigimos a la página de dashboard después de crear la categoría
        return redirect('dashboardTutor.html')

    
@method_decorator(user_passes_test(es_tutor), name='dispatch')
class CategoriaUpdateView(UpdateView):
    model = Categoria
    fields = ['nombre', 'descripcion', 'photo']
    template_name = 'create_and_edit_categorias.html'
    success_url = reverse_lazy('gestion:categorias')

    def post(self, request, *args, **kwargs):
        try:
            response = super().post(request, *args, **kwargs)
            messages.success(request, 'Categoría actualizada exitosamente.')
        except Exception as e:
            messages.error(request, f'Error al actualizar categoría: {e}')
        return redirect('gestion:categorias')
    
    def form_valid(self, form):
        form.instance.tutor = self.request.user.tutor
        return super().form_valid(form)

  
@method_decorator(user_passes_test(es_tutor), name='dispatch')
class CategoriaDeleteView(DeleteView):
    model = Categoria
    success_url = reverse_lazy('gestion:categorias')
    template_name = 'categorias.html'

    def post(self, request, *args, **kwargs):
        categoria = self.get_object()
        categoria.eliminada = True
        categoria.save()
        messages.success(request, 'Categoría suspendida exitosamente.')
        return redirect(self.success_url)

@method_decorator(user_passes_test(es_tutor), name='dispatch')
class CategoriaAltaView(DeleteView):
    model = Categoria
    success_url = reverse_lazy('gestion:categorias')
    template_name = 'categorias.html'

    def post(self, request, *args, **kwargs):
        categoria = self.get_object()
        categoria.eliminada = False
        categoria.save()
        messages.success(request, 'Categoría dada de alta exitosamente.')
        return redirect(self.success_url)



class CategoriaListView(ListView):
    model = Categoria
    template_name = 'categorias.html'



def solicitud_inscripcion(request, curso_id):
    if request.method == 'POST':
        alumno_id = request.POST.get('alumno_id')
        curso = Curso.objects.get(id=curso_id)
        alumno = Alumno.objects.get(id=alumno_id)
        solicitud_existente = SolicitudInscripcion.objects.filter(alumno=alumno, curso=curso).exists()
        if not solicitud_existente:
            solicitud = SolicitudInscripcion(alumno=alumno, curso=curso)
            solicitud.save()
            messages.success(request, 'La solicitud de inscripción se ha enviado correctamente.')
        else:
            messages.error(request, 'Ya existe una solicitud de inscripción para este curso.')
        return redirect('dashboard')
    else:
        curso = Curso.objects.get(id=curso_id)
        alumnos = Alumno.objects.all()
        return render(request, 'solicitud_inscripcion.html', {'curso': curso, 'alumnos': alumnos})


def solicitudes_gestionar_view(request):
    tutor = Tutor.objects.get(user=request.user)  # Obtener instancia del tutor actual
    solicitudes = tutor.get_solicitudes_gestionar()  # Obtener las solicitudes a gestionar

    context = {
        'solicitudes': solicitudes,
    }

    return render(request, 'solicitudes_gestionar.html', context)


def gestion_inscripcion(request):
    if request.method == 'POST':
        solicitud_id = request.POST.get('solicitud_id')
        accion = request.POST.get('accion')

        if accion == 'asignar':
            solicitud = SolicitudInscripcion.objects.get(id=solicitud_id)
            solicitud.estado = 'A'
            solicitud.save()

            # Crear una nueva instancia de Inscripcion con los datos de la solicitud aceptada
            inscripcion = Inscripcion(alumno=solicitud.alumno, curso=solicitud.curso, estado='A')
            inscripcion.save()

            # Eliminar la solicitud aceptada
            solicitud.delete()

        elif accion == 'rechazar':
            solicitud = SolicitudInscripcion.objects.get(id=solicitud_id)
            solicitud.estado = 'R'
            solicitud.save()
            # Realizar otras acciones necesarias para rechazar la solicitud

        elif accion == 'pendiente':
            solicitud = SolicitudInscripcion.objects.get(id=solicitud_id)
            solicitud.estado = 'P'
            solicitud.save()
            # Realizar otras acciones necesarias para poner la solicitud en estado pendiente

    return redirect('gestion:solicitudes-gestionar')
