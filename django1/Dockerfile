FROM python:latest

RUN apt update && apt install -y wget 
WORKDIR /opt/django
RUN wget "https://gitlab.com/chumkaska1/django_blog/-/archive/master/django_blog-master.tar.gz"
RUN tar -xzf django_blog-master.tar.gz
WORKDIR /opt/django/django_blog-master
#ADD django_blog-master/ /django_blog-master/
#WORKDIR /django_blog-master/
RUN pip install -r requirements.txt
