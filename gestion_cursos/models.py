from django.db import models
from django.utils import timezone
from gestion_personas.models import Alumno, Docente, Tutor


class Categoria(models.Model):
    nombre = models.CharField(max_length=255)
    descripcion = models.TextField()
    photo = models.ImageField(upload_to="categorias")

    def __str__(self):
        return self.nombre


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


class Inscripcion(models.Model):
    alumno = models.ForeignKey(Alumno, on_delete=models.CASCADE)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE)
    fecha_inscripcion = models.DateTimeField(auto_now_add=True)
    aceptado = models.BooleanField(default=False)

    def __str__(self):
        return f"{self.alumno} - {self.curso}"

