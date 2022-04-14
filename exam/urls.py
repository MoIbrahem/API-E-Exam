from django.urls import path
from django.urls.conf import include
from rest_framework_nested import routers
from . import views

router = routers.DefaultRouter()

router.register('students', views.StudentViewSet)
router.register('exams', views.ExamViewSet,basename= 'exams')



# URLConf
urlpatterns = router.urls 
