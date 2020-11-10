FROM python:3.9-slim

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt

RUN apt-get update && \
        pip install --upgrade pip && \
        apt-get install -y --no-install-recommends \
                python3-dev gcc libc-dev apt-utils build-essential && \
        pip install -r requirements.txt

WORKDIR /app
COPY ./run.py /app/run.py
