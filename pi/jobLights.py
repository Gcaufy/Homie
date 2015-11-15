#!/usr/bin/python
import requests
import time
import json
import RPi.GPIO as GPIO
import subprocess



GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)

def getData():
    # f = open('mock.json')
    # data = json.load(f)
    # return data
    url = 'http://homie.com/api/v1/devices'
    r = requests.get(url)
    return (json.loads(r.text))

pMusic = None

while True:
    data = getData()

    for item in data:
        pin = int(item['pin'])
        status = int(item['status'])
        if status == 1:
            status = 0
        else:
            status = 1

        
        if item['dev_key'] == 'gSkx2IVxmcb1vrRdxLzFNla8':
            if status == 0:
                if pMusic == None:
                    pMusic = subprocess.Popen(['mplayer', '-af', 'volume=0', '/home/pi/mine/project/IHS/music/party.wav'])
                    print 'Started music'
            else:
                if pMusic != None:
                    pMusic.kill()
                    pMusic = None
                    print 'Stop music'


        GPIO.setup(pin, GPIO.OUT)
        old = GPIO.input(pin)
        if old != status:
            print item['name'] + ' Changed to ' + str(status)
            GPIO.output(pin, status)

    time.sleep(3)   

