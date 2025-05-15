""" this file handles test cases """

import requests

def test_healthz():
    """ send a health check request to application """
    r = requests.get("http://localhost:5000/healthz")
    assert r.status_code == 200
