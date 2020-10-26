from flask import Flask, render_template
import socket
app = Flask(__name__)

@app.route("/")
def hello():
    myhost = socket.gethostname()
    host_ip = socket.gethostbyname(myhost) 
    return render_template(
        "app.html",
        myhostname=myhost,
        ip=host_ip
    )

if __name__ == "__main__":
   app.run(debug=True, host='0.0.0.0')
