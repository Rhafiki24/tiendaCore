# Generated by Django 4.2.6 on 2023-11-15 18:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('tiendaApp', '0006_delete_carritoitem'),
    ]

    operations = [
        migrations.AddField(
            model_name='producto',
            name='cantidad_disponible',
            field=models.IntegerField(default=0),
        ),
    ]
