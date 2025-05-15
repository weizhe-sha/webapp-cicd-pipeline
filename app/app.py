""" This file handles main application logic. """

from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello():
    """ main function """
    return "Hello, world!"

@app.route("/healthz")
def health():
    """ application is healthy """
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
