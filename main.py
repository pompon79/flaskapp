import requests
from flask import Flask, render_template
import socket
app = Flask(__name__)

@app.route("/")
def hello():
    url = 'https://randomfox.ca/floof/'
    r = requests.get(url)
    obj = r.json()
    random_pic = obj['image']
    myhost = socket.gethostname()
    host_ip = socket.gethostbyname(myhost)
    return render_template(
        "app.html",
        myhostname=myhost,
        ip=host_ip,
        pic=random_pic
    )
