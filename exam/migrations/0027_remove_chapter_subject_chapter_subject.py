# Generated by Django 4.0.4 on 2022-05-05 04:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0026_alter_student_score'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='chapter',
            name='subject',
        ),
        migrations.AddField(
            model_name='chapter',
            name='subject',
            field=models.ManyToManyField(null=True, to='exam.subject'),
        ),
    ]
