from dataclasses import fields
import django_filters
from django_filters.rest_framework import FilterSet
from .models import Exam, Result, Student, Level, Subject, Department


class ExamtFilter(FilterSet):
    class Meta:
        model = Exam
        fields = {
        'subject_id': ['exact'],
    }


class ResultFilter(FilterSet):
    class Meta:
        model = Result
        fields = {
        'exam__subject': ['exact'],
        'degree': ['gt', 'lt']
    }
