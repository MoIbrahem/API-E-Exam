from pyexpat import model
from django.contrib import admin, messages
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.db.models.aggregates import Count
from django.db.models.query import QuerySet
from django.utils.html import format_html, urlencode
from django.urls import reverse
from . import models


# Register your models here.
@admin.register(models.User)
class UserAdmin(BaseUserAdmin):
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2', 'email', 'first_name', 'last_name'),
        }),
    )

@admin.register(models.Person)
class PersonAdmin(admin.ModelAdmin):
    list_display = ['__str__']
    search_fields = ['first_name__istartswith', 'last_name__istartswith']
    ordering = ['user__first_name', 'user__last_name']
    list_per_page = 10
    autocomplete_fields = [ 'user']


    

@admin.register(models.Professor)
class ProfessorAdmin(PersonAdmin):
    list_display = ['__str__','subjects_number']
    autocomplete_fields = ['subjects', 'user']
    @admin.display(ordering='subjects_number')
    def subjects_number(self, person):
        url = (
                reverse('admin:exam_subject_changelist')
                + '?'
                + urlencode({
            'person__id': str(person.id)
        }))
        return format_html('<a href="{}">{} subject </a>', url, person.subjects_number)

    def get_queryset(self, request):
        return super().get_queryset(request).annotate(
            subjects_number=Count('subjects')
        )
    
@admin.register(models.Student)
class StudentAdmin(PersonAdmin):
    list_display = ['__str__','results_number','level','department']
    autocomplete_fields = ['level', 'user','department']

    @admin.display(ordering='subjects_number')
    def results_number(self, person):
        url = (
                reverse('admin:exam_result_changelist')
                + '?'
                + urlencode({
            'person__id': str(person.id)
        }))
        return format_html('<a href="{}">{} results </a>', url, person.results_number)

    def get_queryset(self, request):
        return super().get_queryset(request).annotate(
            results_number=Count('results')
        )
    

@admin.register(models.Level)
class LevelAdmin(admin.ModelAdmin):
    list_display = ['title', 'placed_at', 'departments_number']
    search_fields = ['title']
    list_filter = ['title']

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

# class FilterByLevel(admin.SimpleListFilter):
#     title = 'level'
#     parameter_name = 'level'

#     def lookups(self, request, model_admin):
#         return [
#             ('=1', '1'),
#         ]

#     def queryset(self, request, queryset):
#         if self.value() == '=1':
#             return queryset.filter(id__exact=1)




@admin.register(models.Department)
class DepartmentAdmin(admin.ModelAdmin):
    list_display = ['title', 'level']
    search_fields = ['title']
    # list_filter = ['title', FilterByLevel]
    list_filter = ['title']
    def level(self, obj):
        return "\n".join([level.title for level in obj.levels.all()])


@admin.register(models.Chapter)
class ChapterAdmin(admin.ModelAdmin):
    list_display = ['title', 'subjects']
    search_fields = ['title']
    list_filter = ['subject']
    @admin.display(ordering='subjects')
    def subjects(self, chapter):
        url = (
                reverse('admin:exam_subject_changelist')
                + '?'
                + urlencode({
            'chapter__id': str(chapter.id)
        }))
        return format_html('<a href="{}">{} </a>', url, chapter.subject.title)




@admin.register(models.Difficulty)
class DifficultyAdmin(admin.ModelAdmin):
    list_display = ['title']
    search_fields = ['title']


@admin.register(models.Type)
class TypeAdmin(admin.ModelAdmin):
    list_display = ['title']
    search_fields = ['title']


class AnswerInline(admin.TabularInline):
    model = models.Question.answer.through


@admin.register(models.Answer)
class AnswerAdmin(admin.ModelAdmin):
    autocomplete_fields = ['question']
    search_fields = ['title']

class RightAnswerInline(admin.TabularInline):
    extra = 1
    model = models.RightAnswer
    autocomplete_fields = ['answers']


@admin.register(models.RightAnswer)
class RightAnswerAdmin(admin.ModelAdmin):
    autocomplete_fields = ['answers']

@admin.register(models.Question)
class QuestinAdmin(admin.ModelAdmin):
    inlines = [RightAnswerInline]  # , AnswerInline]
    list_display = ['title', 'answers', 'chapter', 'subject', 'type', 'difficulty']
    search_fields = ['title','chapter','subject','type','difficulty']
    list_filter = ['subject', 'chapter', 'difficulty', 'type']
    autocomplete_fields = ['answer', 'chapter','subject','type','difficulty']
    def answers(self, obj):
        return "\n".join([answer.title for answer in obj.answer.all()])



@admin.register(models.Subject)
class SubjectAdmin(admin.ModelAdmin):
    list_display = ['title', 'department', 'level', 'professors', 'hours', 'exam', 'question']
    search_fields = ['title']
    list_filter = ['level', 'departments', 'hours']
    prepopulated_fields = {
        'slug': ['title']
    }
    autocomplete_fields = ['level', 'departments']

    def professors(self, obj):
        return "\n".join([professor.__str__() for professor in obj.professor_set.all()])

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
    autocomplete_fields = ['chapter', 'difficulty', 'type']
    extra = 1
    model = models.ExamQuestion


@admin.register(models.Exam)
class ExamAdmin(admin.ModelAdmin):
    inlines = [ExamQustionInline]
    list_display = ['title', 'subject', 'created_at', 'starts_at', 'ends_at']
    search_fields = ['title', 'subject', 'created_at']
    list_filter = ['subject', 'created_at']


@admin.register(models.Result)
class ResultAdmin(admin.ModelAdmin):
    list_display = ['exam', 'student', 'degree']
    search_fields = ['title', 'subject', 'created_at']
    list_filter = ['exam', 'student', 'degree']
