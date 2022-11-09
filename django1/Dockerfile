FROM python:3.9-bullseye

WORKDIR /opt/django
RUN wget "https://github.com/vafokin/django_blog_dockerlab/archive/refs/heads/main.zip"
RUN unzip main.zip
WORKDIR /opt/django/django_blog_dockerlab-main
RUN pip install -r requirements.txt

