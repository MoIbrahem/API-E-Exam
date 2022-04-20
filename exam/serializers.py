from asyncore import read
from decimal import Decimal
from time import time
from django.db import transaction
from rest_framework import fields, serializers
import datetime
from django.utils import timezone
# from .signals import order_created
# from core.serializers import *
# from core.models import *
from .models import Answer, Chapter, Difficulty, Exam, ExamQuestion, Question, Result, Student, Subject, Type
import random
from itertools import chain

class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ['id', 'title']

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ['id', 'title', 'type', 'answer']
    answer = AnswerSerializer(many = True
    )

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
        # print(self.validated_data['exam__id'])
        sub = Exam.objects.only('subject').get(id= exam__id)
        # print(sub.subject_id)
        subject_id = sub.subject_id
        eqs = ExamQuestion.objects.filter(exam_id = exam__id)
        # print(eqs)
        questions = Question.objects.filter(subject_id=subject_id)
        # print(questions)
       
        # print(chapters)

        # return questions
        def randomquestions(query, quantity, nops):
            output = []
            for i in range(quantity):
                n = random.randint(0, len(query)-1)
                # print(quantity)
                # print(quantity)
                # print(n)
                if query[n] not in output:
                    output.append(query[n])

                elif quantity >= nops:
                    output.append(query[n])
                else:
                    quantity += 1
            return output
        
        queryset = []
        for eq in eqs.iterator():
            # print(eq)
            quantity = eq.quantity
            chapter = eq.chapter_id
            difficulty = eq.difficulty_id
            type = eq.type_id
            quantity = eq.quantity
            query = questions.filter(chapter_id=chapter, difficulty_id=difficulty, type_id=type)

            # query = questions.filter(chapter_id=eq.chapter.id, difficulty_id=eq.difficulty.id, type_id=eq.type.id)
            
        
            nops = len(query) #// number of obtions available to random from


            # print(randomquestions(query, quantity, nops))
            
            if len(queryset) > 0:
                queryset[0] = chain(queryset[0], randomquestions(query, quantity, nops))
            else:
                queryset.append(randomquestions(query, quantity, nops))       
        return queryset[0]   
        

    def validate_exam__id(self, exam__id):
        timenow = timezone.now()
        print(timenow)
   
        if not Exam.objects.filter(pk=exam__id).exists():
            raise serializers.ValidationError(
                'No exam with the given ID was found.')
        if Exam.objects.filter(id=exam__id).count() == 0:
            raise serializers.ValidationError('The exam is empty.')
        if Exam.objects.only('starts_at').get(id=exam__id).starts_at > timenow:
            raise serializers.ValidationError('The exam has not started yet.')
        if Exam.objects.only('ends_at').get(id=exam__id).ends_at < timenow :
            raise serializers.ValidationError('The exam has ended.')
        return exam__id
    

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
