from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.

class User(AbstractUser):
  email = models.EmailField(unique=True)

  TYPE_STUDENT = 'STD'
  TYPE_PROF = 'PRF'

  TYPE_CHOICES = [
        (TYPE_STUDENT, 'Student'),
        (TYPE_PROF, 'Professor'),
    ]

  profile_type = models.CharField(
        max_length=3, choices=TYPE_CHOICES, null= True)