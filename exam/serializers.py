from asyncore import read
from decimal import Decimal
from django.db import transaction
from rest_framework import fields, serializers
# from .signals import order_created
# from core.serializers import *
# from core.models import *
from .models import Answer, Chapter, Exam, ExamQuestion, Question, Result, Student, Subject

class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ['id', 'title']

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ['id', 'title', 'type', 'answer']
    answer = AnswerSerializer(many = True)

class SubjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Subject
        fields = [ 'id','title', 'hours']
        read_only_fields = [ 'id','title', 'hours']

class ExamQuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = ExamQuestion
        fields= ['question']
        
    question = QuestionSerializer()

class CreateExamQuestionSerializer(serializers.Serializer):
    exam__id = serializers.IntegerField()

    def save(self, **kwargs):
        exam__id = self.validated_data['exam__id']
        print(self.validated_data['exam__id'])
        sub = Exam.objects.only('subject').get(id= exam__id)
        print(sub.subject_id)
        subject_id = sub.subject_id
        eq = ExamQuestion.objects.filter(exam_id = exam__id)
        print(eq)
        questions = Question.objects.filter(subject_id=subject_id)
        print(questions)
        chapters = Chapter.objects.filter(chapters__in =eq)
        print(chapters)
        return questions

    def validate_exam_id(self, exam__id):
        if not Exam.objects.filter(pk=exam__id).exists():
            raise serializers.ValidationError(
                'No exam with the given ID was found.')
        if Exam.objects.filter(exam_id=exam__id).count() == 0:
            raise serializers.ValidationError('The exam is empty.')
        return 'ok'
    
        
    
    

class ExamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Exam
        fields = ['id', 'title', 'subject', 'starts_at', 'ends_at']
        # fields = ['id', 'title', 'subject', 'starts_at', 'ends_at', 'examquestion']
        read_only_fields = ['id', 'title', 'subject', 'starts_at', 'ends_at']
    subject = SubjectSerializer()
    
class SimpleExamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Exam
        fields = ['subject']
        read_only_fields = ['subject']

class StudentSerializer(serializers.ModelSerializer):
    user_id = serializers.IntegerField(read_only=True)
    # resuts =ResultSerializer(many=True)

    class Meta:
        model = Student
        # fields = ['id', 'user_id', 'phone', 'birth_date', 'adresses']
        fields = ['id', 'user_id', 'phone', 'birth_date','level','department']
