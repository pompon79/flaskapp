#FROM python:3.15.2-alpine
FROM --platform linux/amd64 alpine:3.15.3
# 
ENV PYTHONUNBUFFERED=1
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN mkdir /app
WORKDIR /app
ADD requirements.txt /app
ADD main.py /app
COPY templates/ /app/templates
RUN pip3 install -r requirements.txt
CMD ["gunicorn", "-w 2", "-b", "0.0.0.0:5000", "main:app"]
#ENV FLASK_APP=app.py
#ENV LC_ALL=C.UTF-8
#ENV LANG=C.UTF-8
