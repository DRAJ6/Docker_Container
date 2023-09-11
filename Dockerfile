FROM alpine:3.16

RUN mkdir /lab1
WORKDIR /lab1
#RUN apk --no-cache add musl-dev linux-headers g++

# RUN apk add --update --no-cache py3-numpy
# ENV PYTHONPATH=/usr/lib/python3.8/site-packages

RUN apk --no-cache --update-cache add  python3 py3-pip py3-arrow  py3-pandas # and py3-anything package need to be compiled
#RUN pip install --no-cache-dir -r requirements.txt

COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

LABEL maintainer="Dheeraj <jadheeraj.inbox@gmail.com>" \version="1.0"


CMD ["python", "src/lab1.py"]
