FROM python:3.9-alpine
LABEL maintainer="Roman's project"

ENV PYTHONUNBUIFFERED 1
COPY ./requirements/base.txt /requirements/base.txt
RUN pip install -r /requirements/base.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D admin
USER admin