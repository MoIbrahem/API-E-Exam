from re import S
from django.db import transaction
from django.db.models import Prefetch
from pyparsing import null_debug_action
from rest_framework import serializers
from django.utils import timezone
from .models import *
import random
from itertools import chain
import json

class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = ['id', 'title']

class TypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Type
        fields = ['title']

class QuestionImageSerializer(serializers.ModelSerializer):
    def create(self, validated_data):
        question_id = self.context['question_id']
        return Image.objects.create(question_id=question_id, **validated_data)
    class Meta:
        model = Image
        fields = ['id','image']

class departmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = ['id','title']

class levelSerializer(serializers.ModelSerializer):
    class Meta:
        model = Level
        fields = ['id','title']

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = ['id', 'title' ,  'type' , 'images', 'answer']
    answer = AnswerSerializer(many = True)
    type = TypeSerializer()
    images = QuestionImageSerializer(many=True, read_only=True)

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

class ValidationSerializer(serializers.Serializer):
    def validate_exam__id(self, exam__id):
        timenow = timezone.now()
        print(timenow)
        student = Student.objects.get(user_id=self.context['user_id'])
   
        if not Exam.objects.filter(pk=exam__id).exists():
            raise serializers.ValidationError(
                'No exam with the given ID was found.')
        if ExamQuestion.objects.filter(exam_id=exam__id).count() == 0:
            raise serializers.ValidationError('The exam is empty.')
        if Exam.objects.only('starts_at').get(id=exam__id).starts_at > timenow:
            raise serializers.ValidationError('The exam has not started yet.')
        if Exam.objects.only('ends_at').get(id=exam__id).ends_at < timenow :
            raise serializers.ValidationError('The exam has ended.')
        if Result.objects.filter(exam_id = exam__id, student_id = student.id).exists():
            raise serializers.ValidationError('You have already taken this exam before.')
        return exam__id
    
class CreateExamQuestionSerializer(ValidationSerializer):
    exam__id = serializers.IntegerField()
    

    def save(self, **kwargs):
        exam__id = self.validated_data['exam__id']
        sub = Exam.objects.only('subject').get(id= exam__id)
        subject_id = sub.subject_id
        eqs = ExamQuestion.objects.filter(exam_id = exam__id)
        questions = Question.objects.filter(subject_id=subject_id)

        def randomquestions(query, quantity, nops):
            output = []
            i = 0
            while i in range(quantity):
                n = random.randint(0, len(query)-1)

                if query[n] not in output or quantity >= nops :
                    output.append(query[n])
                else:
                    quantity += 1
                print(i)
                i +=1
                
            print(quantity)
            # print(output)
            return output
        
        Qqueryset = []
        for eq in eqs.iterator():
            # print(eq)
            quantity = eq.quantity
            chapter = eq.chapter_id
            difficulty = eq.difficulty_id
            type = eq.type_id
            quantity = eq.quantity
            # query = questions.filter(chapter_id=chapter, difficulty_id=difficulty, type_id=type)
            query = questions.prefetch_related(Prefetch('answer',
                    queryset=Answer.objects.order_by('?'))).filter(chapter_id=chapter, difficulty_id=difficulty, type_id=type)
        
            nops = len(query) #// number of obtions available to random from
            if nops != 0 :
                if len(Qqueryset) > 0:
                    Qqueryset[0] = chain(Qqueryset[0], randomquestions(query, quantity, nops))
                else:
                    Qqueryset.append(randomquestions(query, quantity, nops))       
       
        if len(Qqueryset)> 0:
            return Qqueryset[0] 
        else:
           raise serializers.ValidationError('The exam is empty, contact your professsor for lack of questions')   
        
    

class ExamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Exam
        fields = ['id', 'title', 'subject', 'starts_at', 'ends_at']
        read_only_fields = ['id', 'title', 'subject', 'starts_at', 'ends_at']
    subject = SubjectSerializer()
    
class SimpleExamSerializer(serializers.ModelSerializer):
    class Meta:
        model = Exam
        fields = ['subject']
        read_only_fields = ['subject']

class StudentSerializer(serializers.ModelSerializer):
    user_id = serializers.IntegerField(read_only=True)
    overall_level_rank = serializers.IntegerField(read_only=True)
    # department = departmentSerializer()
    # level = levelSerializer()

    class Meta:
        model = Student
        fields = ['id', 'user_id' , 'phone', 'birth_date','level','department','score','overall_level_rank']
        read_only_fields = ['score']

class StudentGetSerializer(serializers.ModelSerializer):
    user_id = serializers.IntegerField(read_only=True)
    overall_level_rank = serializers.IntegerField(read_only=True)
    department = departmentSerializer()
    level = levelSerializer()

    class Meta:
        model = Student
        fields = ['id', 'user_id' , 'phone', 'birth_date','level','department','score','overall_level_rank']
        read_only_fields = ['score']       

class RightAnswerSerializer(serializers.ModelSerializer):
    

    class Meta:
        model = RightAnswer
        fields = ['questions', 'answers']



class CheckRightAnswerSerializer(ValidationSerializer):

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
            score = (degree/count)*100
            
            Student.objects.filter(id = student.id).update(score = student.score + score)
            Result.objects.create(exam_id=exam__id, student = student, degree = degree, total = count ,score=score)
            return Result.objects.filter(exam_id=exam__id, student= student)

    
    def validate_student_answer(self, student_answer):

        # for i in student_answer:
        #     if not Question.objects.filter(id = i.questions).exists():
        #         raise serializers.ValidationError(
        #         'No question with the given ID was found.')

        return student_answer

class ResultSerializer(serializers.ModelSerializer):
    ranking = serializers.IntegerField(read_only = True)
    class Meta:
        model = Result
        fields = ['exam', 'student' ,'degree', 'total', 'score', 'ranking']
        read_only_fields = ['degree', 'total', 'score']
