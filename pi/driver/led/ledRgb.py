#!/usr/bin/python
import RPi.GPIO as GPIO
import time
import signal
from PiSoftPwm import *

led_pin_red   = 17
led_pin_green = 22
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
    red.start(255)
    green.start(255)
    blue.start(255)

def led_rgb(r, g, b):
    red.changeNbSlicesOn(r)
    green.changeNbSlicesOn(g)
    blue.changeNbSlicesOn(b)

led_init()

if '__main__' == __name__:
    while True:
        i = 255
        while i > 0: 
            led_rgb(i, 255, 255)
            time.sleep(0.01)
            i -= 1
        led_rgb(255,255,255)    

        i = 255
        while i > 0: 
            led_rgb(255, i, 255)
            time.sleep(0.01)
            i -= 1
        led_rgb(255, 255, 255)
    
        i = 255
        while i > 0: 
            led_rgb(255, 255, i)
            time.sleep(0.01)
            i -= 1
        led_rgb(255, 255, 255)

