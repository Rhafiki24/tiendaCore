from django.shortcuts import render,redirect, get_object_or_404
from .forms import ProductoForm
from .models import Producto, Carrito

# Create your views here.

def home(request):
    productos = Producto.objects.all()
    return render(request, 'tiendaApp/index.html', {'productos': productos})

def xbox_360(request):
    productos = Producto.objects.filter(categoria='Xbox 360')
    return render(request, 'tiendaApp/index.html', {'productos': productos})

def xbox_one(request):
    productos = Producto.objects.filter(categoria='Xbox One')
    return render(request, 'tiendaApp/index.html', {'productos': productos})

def xbox_x(request):
    productos = Producto.objects.filter(categoria='Xbox X')
    return render(request, 'tiendaApp/index.html', {'productos': productos})

def ps3(request):
    productos = Producto.objects.filter(categoria='PS3')
    return render(request, 'tiendaApp/index.html', {'productos': productos})

def ps4(request):
    productos = Producto.objects.filter(categoria='PS4')
    return render(request, 'tiendaApp/index.html', {'productos': productos})

def ps5(request):
    productos = Producto.objects.filter(categoria='PS5')
    return render(request, 'tiendaApp/index.html', {'productos': productos})

def add_product(request):
    return render(request, 'tiendaApp/add_product.html')

def edit_product(request):
    productos = Producto.objects.all()
    return render(request, 'tiendaApp/edit_product.html', {'productos': productos})

def buscar_productos(request):
    if request.method == 'POST':
        busqueda = request.POST.get('busqueda', '')
        productos = Producto.objects.filter(nombre__icontains=busqueda)
        return render(request, 'tiendaApp/resultados_busqueda.html', {'productos': productos, 'busqueda': busqueda})
    else:
        return render(request, 'tiendaApp/resultados_busqueda.html', {})

def add_product(request):
    if request.method == 'POST':
        form = ProductoForm(request.POST, request.FILES)
        if form.is_valid():
            form.save()
            return redirect('home')
    else:
        form = ProductoForm()

    return render(request, 'tiendaApp/add_product.html', {'form': form})

def editar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)

    if request.method == 'POST':
        form = ProductoForm(request.POST, instance=producto)
        if form.is_valid():
            form.save()
            return redirect('edit_product')
    else:
        form = ProductoForm(instance=producto)

    return render(request, 'tiendaApp/edicion.html', {'form': form, 'producto': producto})

def eliminar_producto(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    producto.delete()
    return redirect('edit_product')

def agregar_al_carrito(request, producto_id):
    producto = get_object_or_404(Producto, id=producto_id)
    carrito, creado = Carrito.objects.get_or_create(usuario=request.user, producto=producto)
    
    if not creado:
        carrito.cantidad += 1
        carrito.save()
    return redirect('home')

def ver_carrito(request):
    carrito = Carrito.objects.filter(usuario=request.user)
    total = sum(item.subtotal() for item in carrito)
    return render(request, 'tiendaApp/ver_carrito.html', {'carrito': carrito, 'total': total})

from django.shortcuts import get_object_or_404
