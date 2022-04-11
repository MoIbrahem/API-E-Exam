# from turtle import title
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
    placed_at = models.DateTimeField(auto_now=True)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']


class Department(models.Model):
    title = models.CharField(max_length=255)
    levels = models.ManyToManyField(Level, related_name='departments')

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
    departments = models.ManyToManyField(Department)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']


class Chapter(models.Model):
    title = models.CharField(max_length=255)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE, null=True)
    # question = models.ForeignKey(
    #     'Question', on_delete=models.SET_NULL, null=True, related_name='+', blank=True)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']


class Difficulty(models.Model):
    DEFICULTY_EASY = 'E'
    DEFICULTY_MEDIUM = 'M'
    DEFICULTY_HARD = 'H'

    DEFICULTY_CHOICES = [
        (DEFICULTY_EASY, 'Easy'),
        (DEFICULTY_MEDIUM, 'Medium'),
        (DEFICULTY_HARD, 'Hard'),
    ]

    title = models.CharField(
        max_length=1, choices=DEFICULTY_CHOICES, default=DEFICULTY_MEDIUM)

    # question = models.ForeignKey(
    #     'Question', on_delete=models.SET_NULL, null=True, related_name='+', blank=True)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']


class Type(models.Model):
    TYPE_TRUE_OR_FALSE = 'TOF'
    TYPE_MCQ = 'MCQ'

    TYPE_CHOICES = [
        (TYPE_TRUE_OR_FALSE, 'True or false'),
        (TYPE_MCQ, 'MCQ'),
    ]

    title = models.CharField(
        max_length=3, choices=TYPE_CHOICES)

    # question = models.ForeignKey(
    #     'Question', on_delete=models.SET_NULL, null=True, related_name='+', blank=True)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']


class Answer(models.Model):
    title = models.CharField(max_length=255)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']


class Question(models.Model):
    title = models.CharField(max_length=255)
    chapter = models.ForeignKey(Chapter, on_delete=models.PROTECT)
    difficulty = models.ForeignKey(Difficulty, on_delete=models.PROTECT)
    type = models.ForeignKey(Type, on_delete=models.PROTECT)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    answer = models.ManyToManyField(Answer)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']


class RightAnswer(models.Model):
    questions = models.ForeignKey(Question, on_delete=models.CASCADE)
    answers = models.ManyToManyField(Answer)

    # class Meta:
    #     unique_together = [['question', 'answer']]


class Person(models.Model):
    phone = models.CharField(max_length=255)
    birth_date = models.DateField(null=True, blank=True)
    user = models.OneToOneField(
        settings.AUTH_USER_MODEL, on_delete=models.CASCADE)


    class Meta:
        ordering = ['user__first_name', 'user__last_name']


class Student(Person):
    # results = models.ForeignKey(Result)
    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name}'

    class Meta:
        ordering = ['user__first_name', 'user__last_name']


class Professor(Person):
    subjects = models.ManyToManyField(Subject)

    def __str__(self):
        return f'{self.first_name} {self.last_name}'

    class Meta:
        ordering = ['user__first_name', 'user__last_name']


class Exam(models.Model):
    title = models.CharField(max_length=255)
    subject = models.ForeignKey(Subject, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    starts_at = models.DateTimeField(blank=True)
    ends_at = models.DateTimeField(blank=True)

    def __str__(self) -> str:
        return self.title

    class Meta:
        ordering = ['title']


class ExamQuestion(models.Model):
    exam = models.ForeignKey(Exam, on_delete=models.CASCADE)
    chapter = models.ForeignKey(Chapter, on_delete=models.CASCADE, related_name='chapters')
    difficulty = models.ForeignKey(Difficulty, on_delete=models.CASCADE)
    type = models.ForeignKey(Type, on_delete=models.CASCADE)
    quantity = models.IntegerField(validators=[MinValueValidator(1)])

    class Meta:
        unique_together = [['exam', 'chapter', 'difficulty', 'type']]


class Result(models.Model):
    exam = models.ForeignKey(Exam, on_delete=models.CASCADE, related_name='exam')
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='student')
    degree = models.IntegerField(validators=[MinValueValidator(0)])

    class Meta:
        unique_together = [['exam', 'student']]
