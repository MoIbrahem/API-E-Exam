# Generated by Django 4.0.4 on 2022-04-26 10:16

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0018_remove_image_person_image_student'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='question',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, related_name='images', to='exam.question'),
        ),
    ]
