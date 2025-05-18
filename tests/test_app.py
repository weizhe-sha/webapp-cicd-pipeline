""" this file handles test cases """

import requests

def test_healthz():
    """ send a health check request to application """
    r = requests.get("http://proa-webapp.azurewebsites.net:5000/healthz", timeout=30)
    assert r.status_code == 200

def test_home():
    """ send request to home page"""
    r = requests.get("http://proa-webapp.azurewebsites.net:5000/", timeout=30)
    assert r.status_code == 200
    assert b"Hello, world!" in r.data
