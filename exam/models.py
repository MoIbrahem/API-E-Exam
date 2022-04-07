from django.contrib import admin
from django.conf import settings
from django.core.validators import MinValueValidator
from django.db import models
from uuid import uuid4
from model_utils.managers import InheritanceManager

# Create your models here.
# Ramadan Kareem

class Level(models.Model):
    title = models.CharField(max_length=255)
    
    def __str__(self) -> str:
            return self.title

    class Meta:
        ordering = ['title']

class Department(models.Model):
    title = models.CharField(max_length=255)
    levels = models.ManyToManyField(Level)
    
    def __str__(self) -> str:
            return self.title

    class Meta:
        ordering = ['title']