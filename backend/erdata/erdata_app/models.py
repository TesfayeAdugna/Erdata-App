from django.db import models
from django.contrib.auth.models import User

class Children(models.Model):
    first_name = models.CharField(max_length=20)
    last_name = models.CharField(max_length=20)
    gender_choices = (('male', 'male'), ('female', 'female'))
    gender = models.CharField(max_length=10,choices = gender_choices)
    birth_date = models.DateField()
    photos = models.ImageField()
    description = models.TextField()
    bank_account = models.CharField(max_length=40)
    kebele = models.CharField(max_length=30)
    woreda = models.CharField(max_length=30)
    zone = models.CharField(max_length=30)
    region = models.CharField(max_length=50)
    regesterd_date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.first_name


class Suggestion(models.Model):

    regesterd_date = models.DateField(auto_now_add=True)
    child_name = models.CharField(max_length=30)
    gender_choices = (('male', 'male'), ('female', 'female'))
    gender = models.CharField(max_length=10,choices = gender_choices)
    age = models.PositiveIntegerField()
    description = models.TextField()

    def __str__(self):
        return self.child_name

