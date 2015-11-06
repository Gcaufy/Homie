#!/usr/bin/python
import RPi.GPIO as GPIO
import time
import signal
from PiSoftPwm import *

led_pin_red   = 17
led_pin_green = 18
led_pin_blue  = 23

red = PiSoftPwm(0.01, 255, led_pin_red, GPIO.BCM)
green = PiSoftPwm(0.01, 255, led_pin_green, GPIO.BCM)
blue = PiSoftPwm(0.01, 255, led_pin_blue, GPIO.BCM)

# Called on process interruption. Set all pins to "Input" default mode.
def endProcess(signalnum = None, handler = None):
    red.stop()
    green.stop()
    blue.stop()
    GPIO.cleanup()
    exit(0)

# Prepare handlers for process exit
def led_init():
    signal.signal(signal.SIGTERM, endProcess)
    signal.signal(signal.SIGINT, endProcess)
    red.start(0)
    green.start(0)
    blue.start(0)

def led_rgb(r, g, b):
    red.changeNbSlicesOn(r)
    green.changeNbSlicesOn(g)
    blue.changeNbSlicesOn(b)

led_init()

if '__main__' == __name__:
    while True:
        i = 0
        while i < 255: 
            led_rgb(i, 0, 0)
            time.sleep(0.01)
            i += 1
        led_rgb(0, 0, 0)    

        i = 0
        while i < 255: 
            led_rgb(0, i, 0)
            time.sleep(0.01)
            i += 1
        led_rgb(0, 0, 0)
    
        i = 0
        while i < 255: 
            led_rgb(0, 0, i)
            time.sleep(0.01)
            i += 1
        led_rgb(0, 0, 0)

