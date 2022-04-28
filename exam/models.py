# from turtle import title
from pyexpat import model
from statistics import mode
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

    # def __str__(self) -> str:
    #     return self.questions.id

    # class Meta:
    #     ordering = ['questions']
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
    level = models.ForeignKey(Level,on_delete=models.PROTECT, null=True,related_name='student_level')
    department = models.ForeignKey(Department,on_delete=models.PROTECT, null=True, related_name='student_department')
    score = models.IntegerField(validators=[MinValueValidator(0)])
    
    @property 
    def overall_level_rank(self, *args, **kwargs):
        overll_marks = Student.objects.filter(level= self.level).values_list('score', flat=True).distinct().order_by('-score')
        if self.score == 0:
            rank = 0
        else :
            rank = list(overll_marks).index(self.score) +1
        print(overll_marks)
        return rank

    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name}'

    class Meta:
        ordering = ['user__first_name', 'user__last_name']


class Professor(Person):
    subjects = models.ManyToManyField(Subject)

    def __str__(self):
        return f'{self.user.first_name} {self.user.last_name}'

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
    exam = models.ForeignKey(Exam, on_delete=models.CASCADE, related_name='examquestion')
    chapter = models.ForeignKey(Chapter, on_delete=models.CASCADE, related_name='chapters')
    difficulty = models.ForeignKey(Difficulty, on_delete=models.CASCADE)
    type = models.ForeignKey(Type, on_delete=models.CASCADE)
    quantity = models.IntegerField(validators=[MinValueValidator(1)])

    class Meta:
        unique_together = [['exam', 'chapter', 'difficulty', 'type']]


class Result(models.Model):
    exam = models.ForeignKey(Exam, on_delete=models.CASCADE, related_name='exam')
    student = models.ForeignKey(Student, on_delete=models.CASCADE, related_name='results')
    degree = models.IntegerField(validators=[MinValueValidator(0)])
    total = models.IntegerField(validators=[MinValueValidator(0)])
    score = models.IntegerField(validators=[MinValueValidator(0)])


    @property 
    def ranking(self, *args, **kwargs):
        marks = Result.objects.filter(exam = self.exam).values_list('score', flat=True).distinct().order_by('-score')
        print(marks)
        rank = list(marks).index(self.score) +1
        return rank
    class Meta:
        unique_together = [['exam', 'student']]


class Image(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE,null= True, related_name='images')
    # student = models.OneToOneField(Student, on_delete=models.CASCADE,null= True, related_name='image')
    image = models.ImageField(upload_to='exam/images')