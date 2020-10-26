FROM ubuntu:18.04
RUN apt-get update && apt-get install python3 python3-pip python3-setuptools -y 
WORKDIR /usr/src/app
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY app.py .
COPY templates/ /usr/src/app/templates/
EXPOSE 5000
ENV FLASK_APP=app.py
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
CMD python3 app.py 
