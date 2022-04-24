from operator import truediv
from venv import create
from rest_framework import response
from exam import pagination
from exam.permissions import FullDjangoModelPermissions, IsAdminOrReadOnly, ViewStudentHistoryPermission
from exam.pagination import DefaultPagination
from django.db.models.aggregates import Count
from django.shortcuts import get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.decorators import action, permission_classes, api_view
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.mixins import CreateModelMixin, DestroyModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework.permissions import IsAdminUser, IsAuthenticated, IsAuthenticatedOrReadOnly, AllowAny, \
    DjangoModelPermissions, DjangoModelPermissionsOrAnonReadOnly
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework import status
# from .filters import ProductFilter
from .models import Exam, RightAnswer, Student, Subject, Department, Level
from .serializers import *
from model_utils.managers import InheritanceQuerySet
import requests
from django.shortcuts import render


# Create your views here.

class StudentViewSet(ModelViewSet):
    queryset = Student.objects.prefetch_related('results').all()
    serializer_class = StudentSerializer
    permission_classes = [IsAdminUser]

    @action(detail=True, permission_classes=[ViewStudentHistoryPermission])
    def history(self, request, pk):
        return Response('ok')

    @action(detail=False, methods=['GET', 'PUT', 'PATCH'], permission_classes=[IsAuthenticated])
    def me(self, request):
        student = Student.objects.get(
            user_id=request.user.id)
        if request.method == 'GET':
            serializer = StudentSerializer(student)
            return Response(serializer.data)
        elif request.method == 'PUT':
            serializer = StudentSerializer(student, data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save()
            return Response(serializer.data)


class ExamViewSet(ModelViewSet):
    http_method_names = ['get', 'patch', 'delete', 'head', 'options']
    pagination_class = DefaultPagination
    serializer_class = ExamSerializer

    def get_permissions(self):
        if self.request.method in ['PATCH', 'DELETE']:
            return [IsAdminUser()]
        return [IsAuthenticatedOrReadOnly()]

    def get_queryset(self):

        user = self.request.user

        if user.is_staff:
            return Exam.objects.all()

        student_id = Student.objects.only('id').get(user_id=user.id)

        level_id = Level.objects.only('id').get(student_level=student_id)
        department_id = Department.objects.only('id').get(student_department=student_id)

        subjects = Subject.objects.only('id').filter(level=level_id, departments=department_id)

        return Exam.objects.select_related('subject').filter(subject_id__in=subjects)


class ExamQuestionViewSet(ModelViewSet):
    http_method_names = ['get', 'post', 'delete', 'head', 'options']

    pagination_class = DefaultPagination

    def get_permissions(self):
        if self.request.method in ['DELETE']:
            return [IsAdminUser()]
        return [IsAuthenticatedOrReadOnly()]

    def get_serializer_class(self):
        if self.request.method == 'POST':
            return CreateExamQuestionSerializer
        return ExamQuestionSerializer

    def get_serializer_context(self):
        return {'user_id': self.request.user.id, }

    def create(self, request, *args, **kwargs):
        
        serializer = CreateExamQuestionSerializer(data=request.data,
                                                  context={'user_id': self.request.user.id})
        serializer.is_valid(raise_exception=True)
        sub = serializer.save()
        serializer = QuestionSerializer(sub, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        user = self.request.user
        return[]
        # sub__id = create(self,self.request)

        # subject_id = Subject.objects.only('id').get(exam = ex)
        # return Subject.objects.select_related('questions').filter(subject_id= subject_id)


class RightAnswerViewSet(ModelViewSet):
    http_method_names = ['get', 'post', 'delete', 'head', 'options']
    def get_permissions(self):
        if self.request.method in ['DELETE']:
            return [IsAdminUser()]
        return [IsAuthenticatedOrReadOnly()]

    

    def get_serializer_class(self):
        if self.request.method == 'POST':
            return CheckRightAnswerSerializer
        return RightAnswerSerializer

    def get_serializer_context(self):
        return {'user_id': self.request.user.id, }

    def create(self, request, *args, **kwargs):
        serializer = CheckRightAnswerSerializer(data=request.data,
                                                  context={'user_id': self.request.user.id})
        serializer.is_valid(raise_exception=True)
        sub = serializer.save()
        serializer = RightAnswerSerializer(sub, many=True)
        return Response(serializer.data)

    def get_queryset(self):
        user = self.request.user
        if user.is_staff:
            return RightAnswer.objects.all()
        return []