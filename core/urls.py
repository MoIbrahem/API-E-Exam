
from django.urls import  re_path
from .views import CustomTokenObtainPairView
from djoser.urls.jwt import urlpatterns as djoserpatterns


custompatterns= [
    
    re_path(r"^jwt/create/?", CustomTokenObtainPairView.as_view(), name="jwt-create"),   
]
urlpatterns = custompatterns + djoserpatterns