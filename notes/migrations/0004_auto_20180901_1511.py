# Generated by Django 2.1 on 2018-09-01 19:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('notes', '0003_notesentry_html_path'),
    ]

    operations = [
        migrations.RenameField(
            model_name='notesentry',
            old_name='html_path',
            new_name='html_name',
        ),
    ]
