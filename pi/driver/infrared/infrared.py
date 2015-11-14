import RPi.GPIO as GPIO
import time

# def init():
#     GPIO.setwarnings(False)
#     GPIO.setmode(GPIO.BCM)
#     GPIO.setup(23,GPIO.IN)
#     pass

# def detect():
#     for i in range(1,101):
#         if GPIO.input(23) == True:
#             print "Someone isclosing!"
#         else:
#             print "Noanybody!"
#         time.sleep(2)

# init()
# detect()

pin = 23
beeppin = 24

def init(pin):
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(pin, GPIO.IN)
    GPIO.setup(beeppin, GPIO.OUT)
    pass

def detect():
    return GPIO.input(pin)


def beep():
    GPIO.output(beeppin, 0)

def shut():
    GPIO.output(beeppin, 1)


if __name__ == '__main__':
    init(23)
    for i in range(1, 50):
        v = detect()
        if v == True:
            print "Someone isclosing!"
        else:
            print "Noanybody!"
        time.sleep(2)