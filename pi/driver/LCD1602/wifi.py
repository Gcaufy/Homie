#!/user/bin/env python 
# -*- coding: utf-8 -*-  
# @Author: Gcaufy  
# @Date:   2014-12-26 10:02:21  
import smbus
import time
import sys
import LCD1602 as LCD
import os
if __name__ == '__main__':  

    lcd = LCD.LCD1602_I2C()
    refresh = ''
    pos1 = 0
    pos2 = 0
    while True:
        if (refresh == 'x'):
            refresh = '+'
        else:
            refresh = 'x'
        ip = os.popen("/sbin/ifconfig wlan0 | grep 'inet addr' | awk '{print $2}'").read()
        ip = ip[5:-1]
        ssid = os.popen("/sbin/iwconfig wlan0 | grep 'ESSID' | awk '{print $4}'").read()[7:-2]
        lcd.clear()
        if (ip + ssid == ''):
            lcd.display(' ' + refresh + ' ' + ' Wating...' + refresh, 0, 1)
        else:
            if (len(ssid) + pos1 > 16):
                pos1 = 0
            lcd.display(ssid, pos1, 0)
            if (len(ip) + pos2 > 16):
                pos2 = 0
            lcd.display(ip, pos2, 1)
        time.sleep(2)
        pos1 += 1
        pos2 += 1

