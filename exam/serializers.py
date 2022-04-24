from asyncore import read
from decimal import Decimal
from pyexpat import model
from time import time
from django.db import transaction
from rest_framework import fields, serializers
import datetime
from django.utils import timezone
# from .signals import order_created
# from core.serializers import *
# from core.models import *
from .models import Answer, Chapter, Difficulty, Exam, ExamQuestion, Question, Result, RightAnswer, Student, Subject, Type
import random
from itertools import chain
from collections import OrderedDict
import json

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


class RightAnswerSerializer(serializers.ModelSerializer):
    

    class Meta:
        model = RightAnswer
        fields = ['questions', 'answers']



class CheckRightAnswerSerializer(serializers.Serializer):

    exam__id = serializers.IntegerField()
    student_answer = serializers.JSONField()  
    

    def save(self, **kwargs):

        if self.context['is_staff']:
            return []
        with transaction.atomic():
            exam__id = self.validated_data['exam__id']
            student_answer = self.validated_data['student_answer']
            user_id = self.context['user_id']
            student = Student.objects.get(user_id=self.context['user_id'])
            queryset = []
            for i in student_answer :
                
                query = RightAnswer.objects.filter(questions = list(i.values())[0])
            
                if len(queryset) > 0:
                    queryset[0] = chain(queryset[0], query)
                else:
                    queryset.append(list(query))       
            
            serializer = RightAnswerSerializer(list(queryset[0]), many = True )

            ans = json.loads(json.dumps(serializer.data))
            answersheet = list(ans)
            
            print(student_answer)
            print(answersheet)
            
            degree = 0
            count = 0
            for item in range(len(answersheet)):
                if answersheet[item] == student_answer[item]:
                    degree += 1
                count += 1
                #.
            
            print(degree)
            degree = (degree/count)*100
            Result.objects.create(exam_id=exam__id, student = student, degree=degree)
            return Result.objects.filter(exam_id=exam__id, student= student)

    
    

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
    
    def validate(self, student_answer):

        # for i in student_answer:
        #     if not Question.objects.filter(id = i.questions).exists():
        #         raise serializers.ValidationError(
        #         'No question with the given ID was found.')

        return student_answer

class ResultSerializer(serializers.ModelSerializer):
    class Meta:
        model = Result
        fields = ['exam', 'student' ,'degree']
        read_only_fields = ['degree']

# class GetSpecificResultSerializer(serializers.Serializer):
#     exam__id = serializers.IntegerField()
#     def save(self, **kwargs):
#         exam__id = self.validated_data['exam__id']
#         user = Person.objects.get(user_id=self.context['user_id'])
#         user_is_staff = self.context['is_staff']
#         if self.context['is_staff']:
#             sub = Exam.objects.only('subject').get(id=exam__id)
#             sub = Subject.objects.get(id=sub.id)
#             prof = Professor.objects.get(subjects=sub)
#             if user.id == prof.id:
#                 return Result.objects.filter(exam_id=exam__id)
#         return Result.objects.filter(exam_id=exam__id, student= user)

#     def validate_exam__id(self, exam__id):
#         timenow = timezone.now()
#         print(timenow)

#         if not Exam.objects.filter(pk=exam__id).exists():
#             raise serializers.ValidationError(
#                 'No exam with the given ID was found.')
#         if Exam.objects.filter(id=exam__id).count() == 0:
#             raise serializers.ValidationError('The exam is empty.')
#         if Exam.objects.only('starts_at').get(id=exam__id).starts_at > timenow:
#             raise serializers.ValidationError('The exam has not started yet.')
#         return exam__id 