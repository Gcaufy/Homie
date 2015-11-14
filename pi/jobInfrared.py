#!/usr/bin/python
import driver.infrared.infrared as infrared
import requests
import time


url = 'http://homie.com/api/v1/infrared'

def post():
	data = {"time": str(time.time())}
	r = requests.post(url, data)

infrared.init(23)

while True:
	v = infrared.detect()
	if v == True:
        if changed == True:
            post()
            changed = False
    else:
        changed = True
    time.sleep(2)

