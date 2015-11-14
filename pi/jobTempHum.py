#!/usr/bin/python
import driver.dht.dht as dht
import requests
import time
import json

def post():
    url = 'http://homie.com/api/v1/temp_hum'
    (temp, hum) = dht.getData(4)
    data = {"temp": str(temp), "hum": str(hum), "time": str(time.time())}

    r = requests.post(url, data)

post()
