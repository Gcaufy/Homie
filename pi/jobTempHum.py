#!/usr/bin/python
import driver.dht.dht as dht
import requests
import time
import json

def post():
    url = 'http://homie.com/api/v1/temp_hum'
    rst = dht.getData(4)
    if rst != None:
        (temp, hum) = rst
        data = {"temp": str(temp), "hum": str(hum), "time": str(time.time())}
        print 'Temp is ' + str(temp) + ', Hum is ' + str(hum)
        r = requests.post(url, data)

while True:
    data = post()
    time.sleep(1)