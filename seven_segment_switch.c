/**
 * @file seven_segment_switch.c
 * @author Harshil Bhatt (harshilbhatt2001@dgmail.com)
 * @brief Seven segment displays switch number pressed
 * @version 0.1
 * @date 2021-12-07
 * 
 * @copyright Copyright (c) 2021
 * 
 */
#include<lpc21xx.h>
void delay(void);
int main(void)
{
	unsigned long int c = 0xF0FF0000;
	IO0DIR = c;
	IO0SET = c;
	while(1)
	{
		if((IO1PIN & 0x00FF0000) == 0xFE0000)
			IO0PIN = 0x803F0000;	
		if((IO1PIN & 0x00FF0000) == 0xFD0000)
			IO0PIN = 0x80060000;
		if((IO1PIN & 0x00FF0000) == 0xFB0000)
			IO0PIN = 0x805B0000;
		if((IO1PIN & 0x00FF0000) == 0xF70000)
			IO0PIN = 0x804F0000;
		if((IO1PIN & 0x00FF0000) == 0xEF0000)
			IO0PIN = 0x80660000;
		if((IO1PIN & 0x00FF0000) == 0xDF0000)
			IO0PIN = 0x806D0000;
		if((IO1PIN & 0x00FF0000) == 0xBF0000)
			IO0PIN = 0x807D0000;
		if((IO1PIN & 0x00FF0000) == 0x7F0000)
			IO0PIN = 0x80070000;	
	}
}
