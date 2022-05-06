# Generated by Django 4.0.3 on 2022-04-10 22:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='level',
            name='placed_at',
            field=models.DateTimeField(auto_now=True),
        ),
        migrations.AlterField(
            model_name='department',
            name='levels',
            field=models.ManyToManyField(related_name='departments', to='exam.level'),
        ),
    ]