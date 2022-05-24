from unittest import result
from django.contrib import admin
from django.db.models.aggregates import Count
from django.db.models.query import QuerySet
from django.utils.html import format_html, urlencode
from django.urls import reverse
from guardian.admin import GuardedModelAdmin
from guardian.shortcuts import get_objects_for_user
from . import models


# Register your models here.



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
    list_display = ['__str__','results_number','level','department','score','overall_level_rank']
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
    
    def has_module_permission(self, request):
        if request.user.is_superuser:
            return True
        else:
            return False

@admin.register(models.Level)
class LevelAdmin(admin.ModelAdmin):
    list_display = ['title', 'placed_at', 'departments_number']
    ordering = ['title', 'placed_at']
    search_fields = ['title']
    list_filter = ['title']
    autocomplete_fields = ['departments']

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
    ordering = ['title']
    search_fields = ['title']
    autocomplete_fields = ['levels']
    # list_filter = ['title', FilterByLevel]
    list_filter = ['title']
    def level(self, obj):
        return "\n".join([level.title for level in obj.levels.all()])


@admin.register(models.Chapter)
class ChapterAdmin(admin.ModelAdmin):
    list_display = ['title', 'subjects_n']
    ordering = ['title']
    search_fields = ['title']
    list_filter = ['subjects']
    @admin.display(ordering='subjects')
    def subjects_n(self, chapter):
        url = (
                reverse('admin:exam_subject_changelist')
                + '?'
                + urlencode({
            'chapter__id': str(chapter.id)
        }))
        return format_html('<a href="{}">{} </a>', url, "\n".join([subject.title for subject in chapter.subjects.all()]))

    def has_module_permission(self, request):
        if request.user.is_superuser:
            return True
        else:
            return False



@admin.register(models.Difficulty)
class DifficultyAdmin(admin.ModelAdmin):
    list_display = ['title']
    search_fields = ['title']

    def has_module_permission(self, request):
        if request.user.is_superuser:
            return True
        else:
            return False


@admin.register(models.Type)
class TypeAdmin(admin.ModelAdmin):
    list_display = ['title','inputType']
    search_fields = ['title']

    def has_module_permission(self, request):
        if request.user.is_superuser:
            return True
        else:
            return False


class AnswerInline(admin.TabularInline):
    model = models.Question.answer.through


@admin.register(models.Answer)
class AnswerAdmin(admin.ModelAdmin):
    autocomplete_fields = ['question']
    search_fields = ['title']

    def has_module_permission(self, request):
        if request.user.is_superuser:
            return True
        else:
            return False

class RightAnswerInline(admin.TabularInline):
    extra = 1
    model = models.RightAnswer
    autocomplete_fields = ['answers']
    


class QuestionImageInline(admin.TabularInline):
    model = models.Image
    readonly_fields = ['thumbnail']

    def thumbnail(self, instance):
        if instance.image.name != '':
            return format_html(f'<img src="{instance.image.url}" class="thumbnail" />')
        return ''

@admin.register(models.RightAnswer)
class RightAnswerAdmin(admin.ModelAdmin):
    list_display = ['questions', 'rightanswers']
    autocomplete_fields = ['answers']
    
    def rightanswers(self, obj):
        return "\n / ".join([p.title for p in obj.answers.all()])
    def has_module_permission(self, request):
        if request.user.is_superuser:
            return True
        else:
            return False
@admin.register(models.Question)
class QuestinAdmin(admin.ModelAdmin):
    inlines = [RightAnswerInline, QuestionImageInline]  # , AnswerInline]
    list_display = ['title', 'answers', 'chapter', 'subject', 'type', 'difficulty']
    ordering = ['title', 'chapter', 'subject', 'type', 'difficulty']
    search_fields = ['title','chapter','subject','type','difficulty']
    list_filter = ['subject', 'chapter', 'difficulty', 'type']
    autocomplete_fields = ['answer', 'chapter','subject','type','difficulty']
    def answers(self, obj):
        return "\n".join([answer.title for answer in obj.answer.all()])

    class Media:
        css = {
            'all': ['exam/style.css']
        }

    def has_module_permission(self, request):
        if request.user.is_superuser:
            return True
        else:
            return False

@admin.register(models.Subject)
class SubjectAdmin(GuardedModelAdmin):

    list_display = ['title', 'department', 'level', 'professors', 'hours', 'question_count', 'exams_count']
    ordering = ['title', 'hours']
    search_fields = ['title']
    list_filter = ['level', 'departments', 'hours']
    prepopulated_fields = {
        'slug': ['title']
    }
    autocomplete_fields = ['level', 'departments','chapters']

    def professors(self, obj):
        return "\n".join([professor.__str__() for professor in obj.professor_set.all()])

    def department(self, obj):
        return "\n".join([department.title for department in obj.departments.all()])

    @admin.display(ordering=[ 'question_count', 'exam_count'])
    def question_count(self, subject):
        url = (
                reverse('admin:exam_question_changelist')
                + '?'
                + urlencode({
            'subject__id': str(subject.id)
        }))
        return format_html('<a href="{}">{} questions</a>', url, subject.question_set.count())

    def exams_count(self, subject):
        url = (
                reverse('admin:exam_exam_changelist')
                + '?'
                + urlencode({
            'subject__id': str(subject.id)
        }))
        return format_html('<a href="{}">{} exams</a>', url, subject.exam_set.count())

    def has_module_permission(self, request):
        if super().has_module_permission(request):
            return True
        return self.get_model_objects(request).exists()

    def get_queryset(self, request):
        if request.user.is_superuser:
            return super().get_queryset(request)
        data = self.get_model_objects(request)
        return data

    def get_model_objects(self, request, action=None, klass=None):
        opts = self.opts
        actions = [action] if action else ['view','edit','delete']
        klass = klass if klass else opts.model
        model_name = klass._meta.model_name
        return get_objects_for_user(user=request.user, perms=[f'{perm}_{model_name}' for perm in actions], klass=klass, any_perm=True)

    def has_permission(self, request, obj, action):
        opts = self.opts
        code_name = f'{action}_{opts.model_name}'
        if obj:
            return request.user.has_perm(f'{opts.app_label}.{code_name}', obj)
        else:
            return self.get_model_objects(request).exists()

    def has_view_permission(self, request, obj=None):
        return self.has_permission(request, obj, 'view')

    def has_change_permission(self, request, obj=None):
        return self.has_permission(request, obj, 'change')

    def has_delete_permission(self, request, obj=None):
        return self.has_permission(request, obj, 'delete')

class ExamQustionInline(admin.TabularInline):
    autocomplete_fields = ['chapter', 'difficulty', 'type']
    extra = 1
    model = models.ExamQuestion


@admin.register(models.Exam)
class ExamAdmin(admin.ModelAdmin):
    inlines = [ExamQustionInline]
    list_display = ['title', 'subject', 'created_at', 'starts_at', 'ends_at', 'results_count']
    ordering = ['title', 'subject', 'created_at', 'starts_at']
    search_fields = ['title', 'subject', 'created_at']
    list_filter = ['subject', 'created_at']
    autocomplete_fields = ['subject']

    @admin.display(ordering=[ 'results_count'])
    def results_count(self, exam):
        url = (
                reverse('admin:exam_result_changelist')
                + '?'
                + urlencode({
            'exam__id': str(exam.id)
        }))
        return format_html('<a href="{}">{} results</a>', url, exam.exam.count())

    def has_module_permission(self, request):
        if request.user.is_superuser:
            return True
        else:
            return False


class GradeFilter(admin.SimpleListFilter):
    title = 'Grade'
    parameter_name = 'Grade'

    def lookups(self, request, model_admin):
        return [
            ('score<50', 'F'),
            ('50<=score<=64', 'D'),
            ('65<=score<=69', 'C'),
            ('70<=score<=74', 'C+'),
            ('75<=score<=79', 'B'),
            ('80<=score<=84', 'B+'),
            ('85<=score<=89', 'A'),
            ('90<=score<=100', 'A+'),
        ]

    def queryset(self, request, queryset: QuerySet):
        if self.value() == 'score<50':
            return queryset.filter(score__lt=50)
        if self.value() == '50<=score<=64':
            return queryset.filter(score__range=(50, 64))
        if self.value() == '65<=score<=69':
            return queryset.filter(score__range=(65, 69))
        if self.value() == '70<=score<=74':
            return queryset.filter(score__range=(70, 74))
        if self.value() == '75<=score<=79':
            return queryset.filter(score__range=(75, 79))
        if self.value() == '80<=score<=84':
            return queryset.filter(score__range=(80, 84))
        if self.value() == '85<=score<=89':
            return queryset.filter(score__range=(85, 89))
        if self.value() == '90<=score<=100':
            return queryset.filter(score__range=(90, 100))

@admin.register(models.Result)
class ResultAdmin(admin.ModelAdmin):
    list_display = ['exam', 'student', 'degree','total', 'score','ranking']
    ordering = ['exam', 'student', 'degree','total', 'score']
    search_fields = ['title', 'subject', 'created_at']
    list_filter = ['exam', GradeFilter]

    def has_module_permission(self, request):
        if request.user.is_superuser:
            return True
        else:
            return False
