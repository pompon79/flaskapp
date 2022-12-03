import requests
from flask import Flask, render_template
from prometheus_flask_exporter import PrometheusMetrics
import socket

app = Flask(__name__)
metrics = PrometheusMetrics(app)

@app.route("/")
def hello():
    myhost = socket.gethostname()
    host_ip = socket.gethostbyname(myhost)
    return render_template(
        "app.html",
        myhostname=myhost,
        ip=host_ip
    )
