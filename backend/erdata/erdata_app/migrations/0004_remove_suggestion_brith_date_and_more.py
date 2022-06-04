# Generated by Django 4.0.2 on 2022-06-04 03:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('erdata_app', '0003_suggestion'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='suggestion',
            name='brith_date',
        ),
        migrations.RemoveField(
            model_name='suggestion',
            name='suggested_by',
        ),
        migrations.AddField(
            model_name='suggestion',
            name='age',
            field=models.PositiveIntegerField(default=10),
            preserve_default=False,
        ),
    ]