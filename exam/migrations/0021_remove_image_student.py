# Generated by Django 4.0.4 on 2022-04-26 12:02

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0020_alter_image_image'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='image',
            name='student',
        ),
    ]
