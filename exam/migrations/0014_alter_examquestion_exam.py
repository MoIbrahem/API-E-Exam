# Generated by Django 4.0.4 on 2022-04-15 03:35

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0013_delete_user'),
    ]

    operations = [
        migrations.AlterField(
            model_name='examquestion',
            name='exam',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='examquestion', to='exam.exam'),
        ),
    ]