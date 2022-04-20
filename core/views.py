from django.shortcuts import render
from rest_framework_simplejwt.views import TokenObtainPairView
from .serializers import *

class CustomTokenObtainPairView(TokenObtainPairView):
    serializer_class = CustomTokenObtainPairSerializer

# Create your views here.
