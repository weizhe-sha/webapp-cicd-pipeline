''' This file is a broken app '''
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    ''' This is the main function '''
    return "Hello, world!"

@app.route("/healthz")
def health():
    ''' This is the health check function'''
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
