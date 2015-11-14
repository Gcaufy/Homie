#!/usr/bin/python
import driver.dht.dht as dht
import requests
import time
import json

if __name__ == '__main__':
    url = 'http://homie.com'
    (temp, hum) = dht.getData(4)
    data = {"temp": str(temp), "hum": str(hum), "time": str(time.time())}
    headers = {'content-type': 'application/json'}

    r = requests.post(url, data)
    print r.text
