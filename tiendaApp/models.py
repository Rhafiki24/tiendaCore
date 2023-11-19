from django.db import models
from django.contrib.auth.models import User

# Create your models here.

class Producto(models.Model):
    CATEGORIAS = [
        ('Xbox 360', 'Xbox 360'),
        ('Xbox One', 'Xbox One'),
        ('Xbox X', 'Xbox X'),
        ('PS3', 'PS3'),
        ('PS4', 'PS4'),
        ('PS5', 'PS5'),
    ]
    nombre = models.CharField(null=False, max_length=50)
    descripcion = models.TextField(max_length=500)
    categoria = models.CharField(max_length=20, choices=CATEGORIAS, default='xbox')
    precio = models.IntegerField()
    imagen = models.ImageField(upload_to='images/', null=True, blank=True)
    cantidad_disponible = models.IntegerField(default=0)

class Carrito(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField(default=1)

    def subtotal(self):
        return self.cantidad * self.producto.precio
    
class Compra(models.Model):
    usuario = models.ForeignKey(User, on_delete=models.CASCADE)
    productos = models.ManyToManyField(Producto)
    total = models.IntegerField()
    fecha = models.DateTimeField(auto_now_add=True)