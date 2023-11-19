"""
URL configuration for tiendaCore project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from tiendaApp import views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import LoginView, LogoutView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', LoginView.as_view(), name='login'),
    path('logout/', LogoutView.as_view(), name='logout'),
    path('', views.home, name = 'home'),
    path('buscar/', views.buscar_productos, name='buscar_productos'),
    path('xbox_360/', views.xbox_360, name = 'xbox_360'),
    path('xbox_one/', views.xbox_one, name = 'xbox_one'),
    path('xbox_x/', views.xbox_x, name = 'xbox_x'),
    path('ps3/', views.ps3, name = 'ps3'),
    path('ps4/', views.ps4, name = 'ps4'),
    path('ps5/', views.ps5, name = 'ps5'),
    path('add_product/', views.add_product, name = 'add_product'),
    path('edit_product/', views.edit_product, name = 'edit_product'),
    path('edit/<int:producto_id>/', views.editar_producto, name='editar_producto'),
    path('eliminar_producto/<int:producto_id>/', views.eliminar_producto, name='eliminar_producto'),
    path('agregar_al_carrito/<int:producto_id>/', views.agregar_al_carrito, name='agregar_al_carrito'),
    path('ver_carrito/', views.ver_carrito, name='ver_carrito'),
    path('actualizar_carrito/', views.actualizar_carrito, name='actualizar_carrito'),
    path('eliminar_del_carrito/', views.eliminar_del_carrito, name='eliminar_del_carrito'),
    path('realizar_compra/', views.realizar_compra, name='realizar_compra'),
    path('vaciar_carrito/', views.vaciar_carrito, name='vaciar_carrito'),
    path('historial_compras/', views.historial_compras, name='historial_compras'),
] + static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
