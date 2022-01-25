FROM python:3.9-alpine
LABEL maintainer="Roman's project"

ENV PYTHONUNBUIFFERED 1
COPY ./requirements/base.txt /requirements/base.txt
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .tmp-build-deps gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements/base.txt
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

RUN adduser -D admin
USER admin
