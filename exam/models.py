from importlib.util import decode_source
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

class RightAnswer(models.Model):
    questions = models.ForeignKey(Question, on_delete=models.PROTECT)
    answers = models.ManyToManyField(Answer, on_delete=models.PROTECT)

