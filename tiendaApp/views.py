from django.shortcuts import render,redirect, get_object_or_404
from .forms import ProductoForm
from .models import Producto, Carrito, Compra
from django.contrib import messages
from django.http import JsonResponse
from django.db import transaction

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

def edit_product(request):
    productos = Producto.objects.all()
    return render(request, 'tiendaApp/edit_product.html', {'productos': productos})

def historial_compras(request):
    compras = Compra.objects.all()
    return render(request, 'tiendaApp/historial_compras.html', {'compras': compras})

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

    if request.user.is_authenticated:
        carrito, created = Carrito.objects.get_or_create(usuario=request.user, producto=producto)
        if not created:
            carrito.cantidad += 1
            carrito.save()

    return redirect('home')

def ver_carrito(request):
    if request.user.is_authenticated:
        carrito_items = request.user.carrito_set.all()
        total = sum(item.subtotal() for item in carrito_items)
        return render(request, 'tiendaApp/ver_carrito.html', {'carrito_items': carrito_items, 'total': total})
    else:
        return render(request, 'tiendaApp/ver_carrito.html', {'carrito_items': None, 'total': 0})
    
def carrito_total(request):
    total_carrito = 0
    if request.user.is_authenticated:
        carrito_items = Carrito.objects.filter(usuario=request.user)
        total_carrito = sum(item.subtotal() for item in carrito_items)
    return {'total_carrito': total_carrito}

def actualizar_carrito(request):
    if request.method == 'POST':
        producto_id = request.POST.get('producto_id')
        cantidad = int(request.POST.get('cantidad'))

        carritos = Carrito.objects.filter(producto__id=producto_id)

        if carritos.exists():
            carrito = carritos.first()
            carrito.cantidad = cantidad
            carrito.save()
            messages.success(request, 'Cantidad actualizada exitosamente.')
        else:
            messages.error(request, 'El producto no se encuentra en el carrito.')

    return redirect('ver_carrito')

def eliminar_del_carrito(request):
    if request.method == 'POST':
        producto_id = request.POST.get('producto_id')

        try:
            carrito_items = Carrito.objects.filter(producto__id=producto_id)

            if carrito_items.exists():
                carrito_items.delete()
                messages.success(request, 'Producto eliminado del carrito.')
            else:
                messages.error(request, 'El producto no se encuentra en el carrito.')
        except Carrito.DoesNotExist:
            messages.error(request, 'El producto no se encuentra en el carrito.')

    return redirect('ver_carrito')

@transaction.atomic
def realizar_compra(request):
    try:
        if request.method == 'POST':
            data = request.POST
            productos_ids = [int(id) for id in data.getlist('producto_id')]
            total_compra = data.get('total')

            if not request.user.is_authenticated:
                raise ValueError("Usuario no autenticado.")

            productos_carrito = Producto.objects.filter(id__in=productos_ids)

            for producto in productos_carrito:
                if producto.cantidad_disponible < 1:
                    raise ValueError(f"No hay suficiente stock para el producto: {producto.nombre}")

            with transaction.atomic():
                nueva_compra = Compra.objects.create(
                    usuario=request.user,
                    total=total_compra
                )

                for producto in productos_carrito:
                    nueva_compra.productos.add(producto)
                    producto.cantidad_disponible -= 1
                    producto.save()

                Carrito.objects.filter(usuario=request.user, producto__in=productos_carrito).delete()
                request.user.carrito_set.all().delete()

        return redirect('ver_carrito')
    except Exception as e:
        print(f"Error en la vista realizar_compra: {e}")
        return JsonResponse({'success': False, 'error': str(e)}, status=500)

def vaciar_carrito(request):
    if request.user.is_authenticated:
        request.user.carrito_set.all().delete()
    
    return redirect('ver_carrito')