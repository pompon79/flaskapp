FROM python:3.7-alpine
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
