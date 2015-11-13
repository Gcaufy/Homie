import RPi.GPIO as GPIO


GPIO.setwarnings(False)
GPIO.setmode(GPIO.BCM)
GPIO.setup(14,GPIO.OUT)
GPIO.setup(15,GPIO.OUT)

GPIO.output(14, GPIO.HIGH)
GPIO.output(15, GPIO.LOW)


