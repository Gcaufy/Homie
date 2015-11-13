import RPi.GPIO as GPIO
import time

def init():
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(23,GPIO.IN)
    pass

def detct():
    for i in range(1,101):
        if GPIO.input(23) == True:
            print "Someone isclosing!"
        else:
            print "Noanybody!"
        time.sleep(2)


init()
detct()
GPIO.cleanup()
