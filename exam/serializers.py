from decimal import Decimal
from django.db import transaction
from rest_framework import fields, serializers
# from .signals import order_created
# from core.serializers import *
# from core.models import *
from .models import Exam, Question, Result, Student


class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ['id', 'title', 'type', 'answer']


class ExamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Exam
        fields = ['id', 'title', 'subject', 'starts_at', 'ends_at']




class StudentSerializer(serializers.ModelSerializer):
    user_id = serializers.IntegerField(read_only=True)
    # resuts =ResultSerializer(many=True)

    class Meta:
        model = Student
        # fields = ['id', 'user_id', 'phone', 'birth_date', 'adresses']
        fields = ['id', 'user_id', 'phone', 'birth_date','level','department']
