from django import forms
from tiendaApp.models import Producto

class ProductoForm(forms.ModelForm):
    class Meta:
        model = Producto
        fields = ['nombre', 'descripcion', 'cantidad_disponible','precio', 'imagen','categoria']

    nombre = forms.CharField(widget=forms.TextInput(attrs={"class": "form-control"}), max_length=50)
    descripcion = forms.CharField(widget=forms.Textarea(attrs={"class": "form-control"}), max_length=500)
    cantidad_disponible = forms.IntegerField(widget=forms.NumberInput(attrs={"class": "form-control"}))
    precio = forms.IntegerField(widget=forms.NumberInput(attrs={"class": "form-control"}))
    imagen = forms.ImageField(label="Imagen", required=False, widget=forms.FileInput(attrs={"class": "form-control"}))
    categoria = forms.ChoiceField(choices=Producto.CATEGORIAS, widget=forms.Select(attrs={"class": "form-control"}))