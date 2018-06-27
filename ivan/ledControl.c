#include <wiringPi.h>
#include <stdio.h>
#include "pinout.h"

enum led_enum{LED1, LED2, LED3, LED4};

int main(int argc, char const *argv[])
{
	enum led_enum leds;
	wiringPiSetup();
	pinMode(LED1,OUTPUT);
	pinMode(LED2,OUTPUT);
	pinMode(LED3,OUTPUT);
	pinMode(LED4,OUTPUT);

	printf("1 -> %s\n", argv[1]);
	printf("2 -> %s\n", argv[2]);
	printf("3 -> %s\n", argv[3]);
	printf("4 -> %s\n", argv[4]);

	for(int cnt = 1 ; cnt < 5 ; cnt++)
	{
		leds = cnt;

		if (strcmp(argv[1], "0") == 0) 
		{
			digitalWrite(leds, LOW);
		} 
		else if (strcmp(argv[1], "1") == 0)
		{
			digitalWrite(leds, HIGH);
		}
		else if (strcmp(argv[1], "2") == 0)
		{
			//don't change it
		}
		else
		{
			printf("Somethink must be really fucked up!\n");
		}

		printf("%d -> %d\n", cnt, leds);
	}

	return 0;
}
