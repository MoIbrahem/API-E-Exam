# Generated by Django 4.0.3 on 2022-04-10 22:34

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0002_level_placed_at_alter_department_levels'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='examquestion',
            unique_together={('exam', 'chapter', 'difficulty', 'type')},
        ),
    ]
