# Generated by Django 4.0.2 on 2022-06-05 06:53

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('erdata_app', '0004_remove_suggestion_brith_date_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='children',
            name='photos',
        ),
    ]
