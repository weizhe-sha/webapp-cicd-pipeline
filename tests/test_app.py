""" this file handles test cases """

import requests

def test_healthz():
    """ send a health check request to application """
    r = requests.get("http://localhost:5000/healthz", timeout=5)
    assert r.status_code == 200

def test_home():
    r = requests.get("http://localhost:5000/", timeout=5)
    assert r.status_code == 200
    assert b"Hello, world!" in r.data
