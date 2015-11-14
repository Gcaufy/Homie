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


pin = 23

def init(pin):
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)
    GPIO.setup(pin, GPIO.IN)
    pass

def detect():
    return GPIO.input(pin)

if __name__ == '__main__':
    init(23)
    for i in range(1, 50):
        v = detect()
        if v == True:
            print "Someone isclosing!"
        else:
            print "Noanybody!"
        time.sleep(2)