# Generated by Django 4.0.4 on 2022-05-24 02:19

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0037_type_inputtype'),
    ]

    operations = [
        migrations.AlterField(
            model_name='answer',
            name='title',
            field=models.CharField(max_length=255, verbose_name='Answer'),
        ),
        migrations.AlterField(
            model_name='chapter',
            name='title',
            field=models.CharField(max_length=255, verbose_name='Chapter Name'),
        ),
        migrations.AlterField(
            model_name='department',
            name='title',
            field=models.CharField(max_length=255, verbose_name='Department Name'),
        ),
        migrations.AlterField(
            model_name='difficulty',
            name='title',
            field=models.CharField(choices=[('E', 'Easy'), ('M', 'Medium'), ('H', 'Hard')], default='M', max_length=1, verbose_name='Difficulty Degree'),
        ),
        migrations.AlterField(
            model_name='exam',
            name='title',
            field=models.CharField(max_length=255, verbose_name='Exam Name'),
        ),
        migrations.AlterField(
            model_name='level',
            name='title',
            field=models.CharField(max_length=255, verbose_name='Level Name'),
        ),
        migrations.AlterField(
            model_name='question',
            name='title',
            field=models.CharField(max_length=255, verbose_name='Question'),
        ),
        migrations.AlterField(
            model_name='subject',
            name='title',
            field=models.CharField(max_length=255, verbose_name='Subject Name'),
        ),
        migrations.AlterField(
            model_name='type',
            name='title',
            field=models.CharField(choices=[('TOF', 'True or false'), ('MCQ', 'MCQ')], max_length=3, verbose_name='Type'),
        ),
    ]
