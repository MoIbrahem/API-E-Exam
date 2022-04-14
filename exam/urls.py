from django.urls import path
<<<<<<< HEAD
from rest_framework.routers import DefaultRouter
from . import views

# URLConf

router = DefaultRouter()
router.register('exams', views.ExamViewSet)
urlpatterns = router.urls

# urlpatterns = [
#     path('test/', views.test)
# ]
=======
from django.urls.conf import include
from rest_framework_nested import routers
from . import views

router = routers.DefaultRouter()

router.register('students', views.StudentViewSet)




# URLConf
urlpatterns = router.urls 
>>>>>>> origin/master
