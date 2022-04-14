from django.urls import path
from django.urls.conf import include
from rest_framework_nested import routers
from . import views

router = routers.DefaultRouter()

router.register('students', views.StudentViewSet)




# URLConf
urlpatterns = router.urls 
