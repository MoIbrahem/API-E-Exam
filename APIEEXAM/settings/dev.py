from .common import *


# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-=d3bt%xpyorn27t9fh+-t3wp=t)4-k!(2a7@!^arh*nu%lp^y$'

# Database
# https://docs.djangoproject.com/en/4.0/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'apiexam',
        'HOST': 'localhost',
        'USER': 'root',
        'PASSWORD': ''
    }
}