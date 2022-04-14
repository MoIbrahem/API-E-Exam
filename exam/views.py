from rest_framework import response
from exam.permissions import FullDjangoModelPermissions, IsAdminOrReadOnly, ViewStudentHistoryPermission
from exam.pagination import DefaultPagination
from django.db.models.aggregates import Count
from django.shortcuts import get_object_or_404
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.decorators import action, permission_classes
from rest_framework.filters import SearchFilter, OrderingFilter
from rest_framework.mixins import CreateModelMixin, DestroyModelMixin, RetrieveModelMixin, UpdateModelMixin
from rest_framework.permissions import AllowAny, DjangoModelPermissions, DjangoModelPermissionsOrAnonReadOnly, IsAdminUser, IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet, GenericViewSet
from rest_framework import status
# from .filters import ProductFilter
from .models import  Exam, Student, Subject,Department,Level
from .serializers import  *
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

    @action(detail=False, methods=['GET', 'PUT','PATCH'], permission_classes=[IsAuthenticated])
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
    
    serializer_class = ExamSerializer
    permission_classes = [IsAuthenticated]
    def get_queryset(self):

        user = self.request.user

        if user.is_staff:
            return Exam.objects.all()
        
        # student = Student.objects.only('id', 'level', 'department').get(user_id=user.id)
        level_id = Student.objects.only('level_id').get(user_id=user.id)
        department_id = Student.objects.only('departments_id').get(user_id=user.id)
        subjects = Subject.objects.filter(level_id=level_id,departments=department_id)
        for subject in subjects:
            
            return Exam.objects.filter(subject=subject)