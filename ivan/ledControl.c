#include <wiringPi.h>
#include <stdio.h>
#include "pinout.h"

int main(int argc, char const *argv[])
{
	wiringPiSetup();
	pinMode(LED1,OUTPUT);
	pinMode(LED2,OUTPUT);
	pinMode(LED3,OUTPUT);
	pinMode(LED4,OUTPUT);

	printf("1 -> %s\n", argv[1]);
	printf("2 -> %s\n", argv[2]);
	printf("3 -> %s\n", argv[3]);
	printf("4 -> %s\n", argv[4]);

	return 0;
}
