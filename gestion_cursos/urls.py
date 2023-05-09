from django.urls import include, path
from .views import (
    CategoriaAltaView,
    CategoriaCreateView,
    CategoriaUpdateView,
    CategoriaDeleteView,
    CategoriaListView,
    ver_alumno,
    seleccionar_cursos,

)

app_name = 'gestion'

urlpatterns = [
    path('ver-alumno/<int:id>/', ver_alumno, name='ver_alumno'),
    path('seleccionar-cursos/', seleccionar_cursos, name='seleccionar_cursos'),
    path('crear/', CategoriaCreateView.as_view(), name='crear_categoria'),
    path('categorias/<int:pk>/editar/', CategoriaUpdateView.as_view(), name='editar_categoria'),
    path('categorias/<int:pk>/eliminar/', CategoriaDeleteView.as_view(), name='eliminar_categoria'),
    path('categorias/<int:pk>/alta/', CategoriaAltaView.as_view(), name='dar_alta_categoria'),
    path('categorias/', CategoriaListView.as_view(), name='categorias'),

]
