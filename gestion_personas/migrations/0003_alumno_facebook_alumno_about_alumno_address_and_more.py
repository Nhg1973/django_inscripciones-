# Generated by Django 4.1.7 on 2023-04-11 21:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('gestion_personas', '0002_alumno_rol_docente_rol_ingresopersona_rol_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='alumno',
            name='Facebook',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='alumno',
            name='about',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='alumno',
            name='address',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='alumno',
            name='company',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='alumno',
            name='country',
            field=models.CharField(blank=True, max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='alumno',
            name='firstName',
            field=models.CharField(default='alumno', max_length=50),
        ),
        migrations.AddField(
            model_name='alumno',
            name='instagram',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='alumno',
            name='job',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='alumno',
            name='lastName',
            field=models.CharField(default='alumno', max_length=50),
        ),
        migrations.AddField(
            model_name='alumno',
            name='linkedin',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='alumno',
            name='phone',
            field=models.CharField(blank=True, max_length=20, null=True),
        ),
        migrations.AddField(
            model_name='alumno',
            name='twitter',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]
