# Generated by Django 4.0.4 on 2022-04-26 10:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0019_alter_image_question'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='image',
            field=models.ImageField(upload_to='exam/images'),
        ),
    ]
