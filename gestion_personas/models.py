from django.db import models
from django.contrib.auth.models import User


class IngresoPersona(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    rol = models.CharField(max_length=50, default='ingresoPersona')

    def __str__(self):
            return f"Ingreso @{self.user.username}"
    
    class Meta:
        verbose_name_plural = "ingresoPersona"
    
class Inscripto(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to="alumno", default='defaul.jpg')
    rol = models.CharField(max_length=50, default='inscripto')



    def __str__(self):
        return f"Inscripto @{self.user.username}"
    class Meta:
        verbose_name_plural = "Inscriptos"

class Alumno(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to="alumno", default='defaul.jpg')
    rol = models.CharField(max_length=50, default='alumno')
    nombre = models.CharField(max_length=50, default='alumno')
    apellido = models.CharField(max_length=50, default='alumno')
    about = models.TextField(blank=True, null=True)
    que = models.CharField(max_length=100, blank=True, null=True)
    donde = models.CharField(max_length=100, blank=True, null=True)
    pais = models.CharField(max_length=50, blank=True, null=True)
    direccion = models.CharField(max_length=200, blank=True, null=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    twitter = models.CharField(max_length=100, blank=True, null=True)
    facebook = models.CharField(max_length=100, blank=True, null=True)
    instagram = models.CharField(max_length=100, blank=True, null=True)
    linkedin = models.CharField(max_length=100, blank=True, null=True)
    
    def __str__(self):
        return f"Alumno @{self.user.username}"
    class Meta:
        verbose_name_plural = "Alumnos"


class Docente(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to="docentes", default='defaul.jpg')
    rol = models.CharField(max_length=50, default='docente')
 

    def __str__(self):
        return f"Docente @{self.user.username}"
    class Meta:
        verbose_name_plural = "Docentes"

class Tutor(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    photo = models.ImageField(upload_to="tutor", default='defaul.jpg')
    rol = models.CharField(max_length=50, default='tutor')

    def __str__(self):
        return f"Tutor @{self.user.username}"

    def get_solicitudes_gestionar(self):
        from gestion_personas.models import Alumno  # Importación diferida
        from gestion_cursos.models import Curso, SolicitudInscripcion  # Importación diferida

        cursos_tutor = Curso.objects.all()
        solicitudes = SolicitudInscripcion.objects.filter(curso__in=cursos_tutor)
        return solicitudes

    class Meta:
        verbose_name_plural = "Tutores"
        
    
    class Meta:
        verbose_name_plural = "Tutores"








