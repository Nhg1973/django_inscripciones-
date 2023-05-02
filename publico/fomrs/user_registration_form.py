from django import forms
import re
from django.forms import ValidationError

def solo_caracteres(value):
    if not re.match(r'^[\w\s,.?!]+$', value):
        raise ValidationError('El campo no puede contener caracteres especiales. %(valor)s',
                              code='invalid',
                              params={'valor': value})



def custom_validate_email(value):
    email_regex = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
    if not re.match(email_regex, value):
        raise ValidationError('Correo electrónico inválido')

class ProfileEditForm(forms.Form):
    profile_image = forms.ImageField(required=False)
    username = forms.CharField(max_length=100, validators=(solo_caracteres,),widget=forms.TextInput(attrs={'class': 'form-control'}))
    firstName = forms.CharField(max_length=100, validators=(solo_caracteres,),widget=forms.TextInput(attrs={'class': 'form-control'}))
    lastName = forms.CharField(max_length=100, validators=(solo_caracteres,),widget=forms.TextInput(attrs={'class': 'form-control'}))
    about = forms.CharField(widget=forms.Textarea(attrs={'class': 'form-control'}))
    company = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    job = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    country = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    address = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    phone = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    email = forms.EmailField(validators=(custom_validate_email,),widget=forms.EmailInput(attrs={'class': 'form-control'}))
    twitter = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
    facebook = forms.CharField(max_length=100, widget=forms.TextInput(attrs={'class': 'form-control'}))
   
    def clean(self):
        cleaned_data = super().clean()
        required_fields = ['username', 'firstName', 'lastName', 'about', 'company', 'job', 'country', 'address', 'phone', 'email']
        for field in required_fields:
            if not cleaned_data.get(field):
                raise forms.ValidationError('Por favor completa todos los campos requeridos.')

        return cleaned_data
