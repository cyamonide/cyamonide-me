# Generated by Django 2.1 on 2018-09-04 20:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('notes', '0005_auto_20180901_1514'),
    ]

    operations = [
        migrations.AlterField(
            model_name='notesentry',
            name='template_name',
            field=models.CharField(blank=True, default='', max_length=255),
        ),
    ]
