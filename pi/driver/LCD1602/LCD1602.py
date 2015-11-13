#!/user/bin/env python 
# -*- coding: utf-8 -*-  
# @Author: Gcaufy  
# @Date:   2014-12-26 10:02:21  
import time
import smbus
import os

LCD1602_I2C_ADDR = 0x27

def _getDefaultAddr():
    addr = os.popen("ls /dev/i2c*").read()[9:-1]
    if (addr == ""):
        raise Exception('Please enable your i2c and try again.')
    return int(addr)

class LCD1602_I2C():
    def __init__(self, addr = LCD1602_I2C_ADDR, bg = 1, smbusNo = None):
        self._bg = bg if bg is not None else 1
        self._addr = addr

        # In Case some user user i2c-0
        if (smbusNo == None):
            smbusNo = _getDefaultAddr()
        self._i2c = smbus.SMBus(smbusNo)

        self.writeCommand(0x33) # Must initialize to 8-line mode at first
        time.sleep(0.005)
        self.writeCommand(0x32) # Then initialize to 4-line mode
        time.sleep(0.005)
        self.writeCommand(0x28) # 2 Lines & 5*7 dots
        time.sleep(0.005)
        self.writeCommand(0x0C) # Enable display without cursor
        time.sleep(0.005)
        self.clear()
        self.write(0x08)

    def __del__(self):
        self.clear()
        self.lightOff()


    def display(self, str, x = 0, y = 0):
        if (x < 0):
            x = 0
        if (x > 15):
            x = 15
        if (y < 0):
            y = 0
        if (y > 1):
            y = 1

        # Move cursor
        addr = 0x80 + 0x40 * y + x
        self.writeCommand(addr)
        
        for chr in str:
            self.writeData(ord(chr))

    def animate(self, str, y = 0, interval = 1, times = -1):
        l = len(str)
        i = 16 - l + 1
        while (times != 0):
            for p in range(i):
                self.clearLine(y)
                self.display(str, p, y)
                time.sleep(interval)
            if (times > 0):
                times -= 1

    def clear(self):
        self.writeCommand(0x01)

    def clearLine(self, y = 0):
        self.display('              ', 0, y)

    def lightOn(self):
        self._bg = 1
        self.write(0x00)

    def lightOff(self):
        self._bg = 0
        self.write(0x00)

    def writeCommand(self, comm):
        # Send bit7-4 firstly
        buf = comm & 0xF0
        buf |= 0x04               # RS = 0, RW = 0, EN = 1
        self.write(buf)
        time.sleep(0.002)
        buf &= 0xFB               # Make EN = 0
        self.write(buf)
        
        # Send bit3-0 secondly
        buf = (comm & 0x0F) << 4
        buf |= 0x04               # RS = 0, RW = 0, EN = 1
        self.write(buf)
        time.sleep(0.002)
        buf &= 0xFB               # Make EN = 0
        self.write(buf)

    def writeData(self, data):
        # Send bit7-4 firstly
        buf = data & 0xF0
        buf |= 0x05               # RS = 1, RW = 0, EN = 1
        self.write(buf)
        time.sleep(0.002)
        buf &= 0xFB               # Make EN = 0
        self.write(buf)
        
        # Send bit3-0 secondly
        buf = (data & 0x0F) << 4
        buf |= 0x05               # RS = 1, RW = 0, EN = 1
        self.write(buf)
        time.sleep(0.002)
        buf &= 0xFB               # Make EN = 0
        self.write(buf)

    def write(self, byte):
        if self._bg == 1:
            byte |= 0x08
        else:
            byte &= 0xF7
        self._i2c.write_byte(self._addr, byte)



if __name__ == '__main__':
    lcd = LCD1602_I2C()
    lcd.clear()
    print '#print str'
    #lcd.display('www.madcoder.cn', 0, 0)
    lcd.display('By Gcaufy', 0, 0)
    time.sleep(1)
    print '#animate'
    lcd.animate('madcoder.cn', 1)
