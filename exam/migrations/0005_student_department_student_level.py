# Generated by Django 4.0.3 on 2022-04-12 00:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0004_chapter_subject'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='department',
            field=models.ManyToManyField(null=True, to='exam.department'),
        ),
        migrations.AddField(
            model_name='student',
            name='level',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.PROTECT, to='exam.level'),
        ),
    ]
