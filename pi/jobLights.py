#!/usr/bin/python
import requests
import time
import json
import RPi.GPIO as GPIO



GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)

def getData():
    f = open('mock.json')
    data = json.load(f)
    return data
    url = 'http://homie.com'
    r = requests.post(url)
    return r.text
    

data = getData()


for item in data:
    pin = int(item['pin'])
    status = int(item['status'])
    if status == 1:
        status = 0
    else:
        status = 1
    GPIO.setup(pin, GPIO.OUT)
    old = GPIO.input(pin)
    if old != status:
        GPIO.output(pin, status)




# defines = {}

# url = 'http://homie.com'

# def post():
#     data = {"temp": str(temp), "hum": str(hum), "time": str(time.time())}
#     r = requests.post(url, data)

# infrared.init(23)

# while True:
#     v = infrared.detect()
#     if v == True:
#         if changed == True:
#             post()
#             changed = False
#     else:
#         changed = True
#     time.sleep(2)

