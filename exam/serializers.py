from decimal import Decimal
from django.db import transaction
from rest_framework import fields, serializers
# from .signals import order_created
# from core.serializers import *
# from core.models import *
from .models import Result, Student



class StudentSerializer(serializers.ModelSerializer):
    user_id = serializers.IntegerField(read_only=True)
    # resuts =ResultSerializer(many=True)

    class Meta:
        model = Student
        # fields = ['id', 'user_id', 'phone', 'birth_date', 'adresses']
        fields = ['id', 'user_id', 'phone', 'birth_date']