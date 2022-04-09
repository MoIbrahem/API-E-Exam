from pyexpat import model
from django.contrib import admin, messages
from django.db.models.aggregates import Count
from django.db.models.query import QuerySet
from django.utils.html import format_html, urlencode
from django.urls import reverse
from . import models

# Register your models here.

class AnswerInline(admin.TabularInline):
    model = models.Question.answer.through
    



@admin.register(models.Answer)
class AnswerAdmin(admin.ModelAdmin):
    autocomplete_fields = ['question']

class RightAnswerInline(admin.TabularInline):
    model = models.RightAnswer
    
    

@admin.register(models.Question)
class QuestinAdmin(admin.ModelAdmin):
    
    inlines = [RightAnswerInline]#, AnswerInline]
    search_fields = ['title']

@admin.register(models.Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_display = ['title', 'exams']
    @admin.display(ordering='exam_count')
    def exams(self, subject):
        url = (
            reverse('admin:exam_exam_changelist')
            + '?'
            + urlencode({
                'subject__id': str(subject.id)
            }))
        return format_html('<a href="{}">{} exams</a>', url, subject.exams_count)
    
    def get_queryset(self, request):
        return super().get_queryset(request).annotate(
            exams_count=Count('exam')
        )

admin.site.register(models.Chapter)
admin.site.register(models.Level)
admin.site.register(models.Department)
admin.site.register(models.Difficulty)
admin.site.register(models.Type)

class ExamQustionInline(admin.TabularInline):
    model = models.ExamQuestion

@admin.register(models.Exam)
class ExamAdmin(admin.ModelAdmin):
    inlines = [ExamQustionInline]
    
    
