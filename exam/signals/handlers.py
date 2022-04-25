from django.conf import settings
from django.db.models.signals import post_save
from django.dispatch import receiver
from exam.models import Student, Person,Professor


@receiver(post_save, sender=settings.AUTH_USER_MODEL)
def create_Profile_for_new_user(sender, **kwargs):
  if kwargs['created']:
      print(kwargs['created'])
      print(kwargs['instance'])
      print(kwargs['instance'].profile_type)
      if kwargs['instance'].profile_type == 'STD':
        Student.objects.create(user=kwargs['instance'])
      elif kwargs['instance'].profile_type == 'PRF':
        Professor.objects.create(user=kwargs['instance'])


