from pyexpat import model
from django.contrib import admin, messages
from django.db.models.aggregates import Count
from django.db.models.query import QuerySet
from django.utils.html import format_html, urlencode
from django.urls import reverse
from . import models


# Register your models here.

@admin.register(models.Level)
class LevelAdmin(admin.ModelAdmin):
    list_display = ['title', 'placed_at', 'departments_number']

    @admin.display(ordering='departments_number')
    def departments_number(self, level):
        url = (
                reverse('admin:exam_department_changelist')
                + '?'
                + urlencode({
                    'levels__id': str(level.id)
        }))
        return format_html('<a href="{}">{} departments</a>', url, level.departments_number)

    def get_queryset(self, request):
        return super().get_queryset(request).annotate(
            departments_number=Count('departments')
        )


@admin.register(models.Department)
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ['title', 'level']

    def level(self, obj):
        return "\n".join([level.title for level in obj.levels.all()])



@admin.register(models.Chapter)
class ChapterAdmin(admin.ModelAdmin):
    list_display = ['title']


@admin.register(models.Difficulty)
class DifficultyAdmin(admin.ModelAdmin):
    list_display = ['title']


@admin.register(models.Type)
class TypeAdmin(admin.ModelAdmin):
    list_display = ['title']


class AnswerInline(admin.TabularInline):
    model = models.Question.answer.through


class AnswerInline(admin.TabularInline):
    model = models.Question.answer.through


@admin.register(models.Answer)
class AnswerAdmin(admin.ModelAdmin):
    autocomplete_fields = ['question']


class RightAnswerInline(admin.TabularInline):
    model = models.RightAnswer


@admin.register(models.Question)
class QuestinAdmin(admin.ModelAdmin):
    inlines = [RightAnswerInline]  # , AnswerInline]
    search_fields = ['title']


@admin.register(models.Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_display = ['title', 'department', 'level', 'hours', 'exam', 'question' ]

    def department(self, obj):
        return "\n".join([department.title for department in obj.departments.all()])

    @admin.display(ordering=['exam_count', 'question_count'])
    def exam(self, subject):
        url = (
                reverse('admin:exam_exam_changelist')
                + '?'
                + urlencode({
            'subject__id': str(subject.id)
        }))
        return format_html('<a href="{}">{} exams</a>', url, subject.exams_count)
    
    def question(self, subject):
        url = (
                reverse('admin:exam_question_changelist')
                + '?'
                + urlencode({
            'subject__id': str(subject.id)
        }))
        return format_html('<a href="{}">{} questions</a>', url, subject.question_count)

    def get_queryset(self, request):
        return super().get_queryset(request).annotate(
            exams_count=Count('exam'), question_count=Count('question')
        )
    


class ExamQustionInline(admin.TabularInline):
    model = models.ExamQuestion


@admin.register(models.Exam)
class ExamAdmin(admin.ModelAdmin):
    inlines = [ExamQustionInline]
