from django.urls import path
from rest_framework.routers import DefaultRouter
from . import views

# URLConf

router = DefaultRouter()
router.register('exams', views.ExamViewSet)
urlpatterns = router.urls

# urlpatterns = [
#     path('test/', views.test)
# ]