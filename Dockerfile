FROM python:3.4

ENV PYTHONUNBUFFERED 1
ENV ENVIRONMENT PRODUCTION


RUN mkdir /code

WORKDIR /code

VOLUME /data

ADD ./requirements /code/requirements
ADD ./requirements.txt /code/requirements.txt

RUN pip install -r requirements.txt

ADD . /code

EXPOSE 8000


CMD gunicorn {{ project_name }}.wsgi:application --name {{ project_name }} --bind 0.0.0.0:8000 --workers 3 --log-level=info




 