#include <wiringPi.h>
#include <stdio.h>
#include <string.h>
#include "pinout.h"

// enum led_enum{1=LED1, 2=LED1, 3=LED1, 4=LED1};

#define ERROR_STRING "OPAAA nekoi podade skapana stojnost !!!\n"

int main(int argc, char const *argv[])
{
	// enum led_enum leds;
	wiringPiSetup();
	pinMode(LED1,OUTPUT);
	pinMode(LED2,OUTPUT);
	pinMode(LED3,OUTPUT);
	pinMode(LED4,OUTPUT);

	// printf("1 -> %s\n", argv[1]);
	// printf("2 -> %s\n", argv[2]);
	// printf("3 -> %s\n", argv[3]);
	// printf("4 -> %s\n", argv[4]);

	if (strcmp(argv[1], "0") == 0) 
	{
		digitalWrite(LED1, LOW);
	} 
	else if (strcmp(argv[1], "1") == 0)
	{
		digitalWrite(LED1, HIGH);
	}
	else if (strcmp(argv[1], "2") == 0)
	{
		//don't change it //
	}
	else
	{
		printf(ERROR_STRING);
	}

	if (strcmp(argv[2], "0") == 0) 
	{
		digitalWrite(LED2, LOW);
	} 
	else if (strcmp(argv[2], "1") == 0)
	{
		digitalWrite(LED2, HIGH);
	}
	else if (strcmp(argv[2], "2") == 0)
	{
		//don't change it //
	}
	else
	{
		printf(ERROR_STRING);
	}

	if (strcmp(argv[3], "0") == 0) 
	{
		digitalWrite(LED3, LOW);
	} 
	else if (strcmp(argv[3], "1") == 0)
	{
		digitalWrite(LED3, HIGH);
	}
	else if (strcmp(argv[3], "2") == 0)
	{
		//don't change it //
	}
	else
	{
		printf(ERROR_STRING);
	}

	if (strcmp(argv[4], "0") == 0) 
	{
		digitalWrite(LED4, LOW);
	} 
	else if (strcmp(argv[4], "1") == 0)
	{
		digitalWrite(LED4, HIGH);
	}
	else if (strcmp(argv[4], "2") == 0)
	{
		//don't change it //
	}
	else
	{
		printf(ERROR_STRING);
	}

	return 0;
}
