# Generated by Django 4.0.4 on 2022-05-05 04:32

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0031_remove_chapter_subject_chapter_subject'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='chapter',
            name='subject',
        ),
        migrations.AddField(
            model_name='chapter',
            name='subject',
            field=models.ManyToManyField(to='exam.subject'),
        ),
    ]
