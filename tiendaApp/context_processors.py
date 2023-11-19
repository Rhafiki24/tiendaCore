from .models import Carrito

def carrito_total(request):
    total_carrito = 0
    if request.user.is_authenticated:
        carrito_items = Carrito.objects.filter(usuario=request.user)
        total_carrito = sum(item.subtotal() for item in carrito_items)
    return {'total_carrito': total_carrito}