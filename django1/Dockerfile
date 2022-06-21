FROM python:latest

RUN apt update && apt install -y wget 
RUN mkdir /root/.ssh
WORKDIR /opt/django
RUN wget "https://github.com/vafokin/django_blog_dockerlab/archive/refs/heads/main.zip"
RUN unzip main.zip
WORKDIR /opt/django/django_blog_dockerlab-main
RUN pip install -r requirements.txt
