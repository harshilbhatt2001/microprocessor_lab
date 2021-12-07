/**
 * @file toggle_up_down_counter.c
 * @author Harshil Bhatt (harshilbhatt2001@gmail.com)
 * @brief Up counter when SW8 is pressed, else down counter 
 * @version 0.1
 * @date 2021-12-07
 * 
 * @copyright Copyright (c) 2021
 * 
 */
#include<lpc214x.h>
void delay(void);
int main(void)
{ 
	unsigned long int c = 0xFF0000;
	int flag = 0;
	VPBDIV=2;
	T0MCR=(1<<0)|(1<<2);
	T0MR0=2000000;
	T0PR=29;
	IO0DIR = c;  // Configure pins 
	IO0SET = c;
	while(1)
  	{
		if((IO1PIN & 0x00FF0000) == 0xFE0000)
		{
		IO0SET = c;
      		delay();
      		c-=0x10000; //change
      		IO0CLR = 0xFF0000;
		}
		 if((IO1PIN & 0x00FF0000) == 0xFF0000)
		{
			IO0SET = c;
      		delay();
      		c+=0x10000; //change
      		IO0CLR = 0xFF0000;
		}

	}	 
}     

void delay(void)
{
    T0TCR=(1<<0);
    while(!(T0IR&(1<<0)));
    T0IR=(1<<0);
    T0TCR=(1<<1);
}