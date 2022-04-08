from django.contrib import admin
from django.conf import settings
from django.core.validators import MinValueValidator
from django.db import models
from uuid import uuid4
from model_utils.managers import InheritanceManager
from django.contrib.auth.models import AbstractUser

# Create your models here.
# Ramadan Kareem

class User(AbstractUser):
  email = models.EmailField(unique=True)

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

class Chapter(models.Model):
    title = models.CharField(max_length=255)
    # question = models.ForeignKey(
    #     'Question', on_delete=models.SET_NULL, null=True, related_name='+', blank=True)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']



class Question(models.Model):
    DEFICULTY_EASY = 'E'
    DEFICULTY_MEDIUM = 'M'
    DEFICULTY_HARD = 'H'

    DEFICULTY_CHOICES = [
        (DEFICULTY_EASY, 'Easy'),
        (DEFICULTY_MEDIUM, 'Medium'),
        (DEFICULTY_HARD, 'Hard'),
    ]

    title = models.CharField(max_length=255)
    chapter = models.ForeignKey(Chapter, on_delete=models.PROTECT)
    deficulty = models.CharField(
        max_length=1, choices=DEFICULTY_CHOICES, default=DEFICULTY_MEDIUM)
    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']

class Answer(models.Model):
    title = models.CharField(max_length=255)
    question = models.ManyToManyField(Question, on_delete=models.PROTECT)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']




class Subject(models.Model):
    title = models.CharField(max_length=255)
    slug = models.SlugField()
    description = models.TextField(null=True, blank=True)
    hours = models.IntegerField(validators=[MinValueValidator(1)])
    level = models.ForeignKey(Level, on_delete=models.PROTECT)
    departments = models.ManyToManyField(Department, on_delete=models.PROTECT)

    
    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']

class Person(models.Model):
    phone = models.CharField(max_length=255)
    birth_date = models.DateField(null=True, blank=True)
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE)
    
    @admin.display(ordering='user__first_name')
    def first_name(self):
        return self.user.first_name

    @admin.display(ordering='user__last_name')
    def last_name(self):
        return self.user.last_name
    
    class Meta:
        ordering = ['user__first_name', 'user__last_name']

class Student(Person):
    #results = models.ForeignKey(Result)
    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name}'
    class Meta:
        ordering = ['user__first_name', 'user__last_name']

class Professor(Person):
    subjects = models.ManyToManyField(Subject, on_delete=models.PROTECT)
    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name}'
    class Meta:
        ordering = ['user__first_name', 'user__last_name']
        
class RightAnswer(models.Model):
    questions = models.ForeignKey(Question, on_delete=models.PROTECT)
    answers = models.ManyToManyField(Answer, on_delete=models.PROTECT)

