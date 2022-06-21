FROM python:latest

RUN apt update && apt install -y wget 
WORKDIR /opt/django
RUN wget "https://gitlab.com/qwerty0147/django-blog-dockerlab/-/archive/master/django-blog-dockerlab-master.tar.gz"
RUN tar -xzf django_blog-dockerlab-master.tar.gz
WORKDIR /opt/django/django_blog-dockerlab-master
#ADD django_blog-master/ /django_blog-master/
#WORKDIR /django_blog-master/
RUN pip install -r requirements.txt
