# Generated by Django 4.0.4 on 2022-04-28 11:41

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0022_result_score_result_total'),
    ]

    operations = [
        migrations.AddField(
            model_name='student',
            name='score',
            field=models.IntegerField(default=0),
            preserve_default=False,
        ),
    ]
