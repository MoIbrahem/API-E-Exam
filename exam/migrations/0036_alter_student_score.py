# Generated by Django 4.0.4 on 2022-05-06 22:28

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0035_alter_student_score'),
    ]

    operations = [
        migrations.AlterField(
            model_name='student',
            name='score',
            field=models.IntegerField(default=0, validators=[django.core.validators.MinValueValidator(0)]),
        ),
    ]