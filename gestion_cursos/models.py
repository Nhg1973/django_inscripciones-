from django.db import models
from django.utils import timezone
from gestion_personas.models import Alumno, Docente, Tutor


class Categoria(models.Model):
    tutor = models.ForeignKey(Tutor, on_delete=models.CASCADE)
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    photo = models.ImageField(upload_to="categorias")
    eliminada = models.BooleanField(default=False)
    
    def __str__(self):
        return self.nombre
    
    def eliminar(self):
        self.eliminada = True
        self.save()


class Curso(models.Model):
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    photo = models.ImageField(upload_to="cursos")
    fecha_creacion = models.DateTimeField(default=timezone.now)
    activo = models.BooleanField(default=True)
    categoria = models.ForeignKey(Categoria, on_delete=models.PROTECT)
    docente_titular = models.ForeignKey(Docente, on_delete=models.PROTECT)
    fecha_inicio = models.DateField()
    fecha_cierre = models.DateField()
    cupo = models.PositiveIntegerField()
    inscriptos = models.ManyToManyField(Alumno, through='Inscripcion')

    def __str__(self):
        return self.nombre
    

class Proyecto(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE)
    alumno = models.ForeignKey(Alumno, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.nombre} - {self.alumno}"


class Inscripcion(models.Model):
    ESTADO_CHOICES = (
        ('S', 'Solicitado'),
        ('A', 'Aceptado'),
        ('R', 'Rechazado'),
        ('P', 'Pendiente'),
    )
    alumno = models.ForeignKey(Alumno, on_delete=models.CASCADE)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE)
    fecha_inscripcion = models.DateTimeField(auto_now_add=True)
    estado = models.CharField(max_length=1, choices=ESTADO_CHOICES, default='S')

    def __str__(self):
        return f"{self.alumno} - {self.curso}"

class SolicitudInscripcion(models.Model):
    ESTADO_CHOICES = (
        ('S', 'Solicitado'),
        ('A', 'Aceptado'),
        ('R', 'Rechazado'),
        ('P', 'Pendiente'),
    )

    alumno = models.ForeignKey(Alumno, on_delete=models.CASCADE)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE)
    fecha_solicitud = models.DateTimeField(default=timezone.now)
    estado = models.CharField(max_length=1, choices=ESTADO_CHOICES, default='S')

    def __str__(self):
       return f"{self.alumno} - {self.curso}"



