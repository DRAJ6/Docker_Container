FROM python:3.8-alpine

RUN mkdir /lab1
WORKDIR /lab1
#RUN apk --no-cache add musl-dev linux-headers g++

# RUN apk add --update --no-cache py3-numpy
# ENV PYTHONPATH=/usr/lib/python3.8/site-packages

ADD repositories /etc/apk/repositories
RUN apk add --update python python-dev gfortran py-pip build-base py-numpy@community

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

LABEL maintainer="Dheeraj <jadheeraj.inbox@gmail.com>" \version="1.0"


CMD ["python", "src/lab1.py"]
