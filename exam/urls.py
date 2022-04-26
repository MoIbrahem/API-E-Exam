from django.urls import path
from django.urls.conf import include
from django.urls import path
from rest_framework_nested import routers
from . import views
from rest_framework.routers import DefaultRouter


# URLConf

router = routers.DefaultRouter()

router.register('students', views.StudentViewSet)
router.register('exams', views.ExamViewSet,basename='exams')
router.register('examquestions', views.ExamQuestionViewSet, basename='examquestions')
router.register('rightanswers', views.RightAnswerViewSet,basename='rightanswers')
router.register('results', views.ResultViewSet,basename='results')


# students_router = routers.NestedDefaultRouter(
#     router, 'students', lookup='student')
# students_router.register(
#     'image', views.StudentImageViewSet, basename='student-image')

examquestions_router = routers.NestedDefaultRouter(
    router, 'examquestions', lookup='question')
examquestions_router.register(
    'images', views.QuestionImageViewSet, basename='question-image')

urlpatterns = router.urls +  examquestions_router.urls #+students_router.urls 
# router.register('exams', views.ExamViewSet,basename= 'exams')
# router.register('examquestions', views.ExamQuestionViewSet, basename='examquestions')


# URLConf


# urlpatterns = [
#     path('test/', views.test)
# ]



