#include <wiringPi.h>
#include <stdio.h>
#include <string.h>
#include "pinout.h"

#define ERROR_STRING "OPAAA nekoi podade skapana stojnost !!!\n"

int main(int argc, char const *argv[])
{
	wiringPiSetup();
	pinMode(LED1,OUTPUT);
	pinMode(LED2,OUTPUT);
	pinMode(LED3,OUTPUT);
	pinMode(LED4,OUTPUT);

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