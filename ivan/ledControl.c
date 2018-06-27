#include <wiringPi.h>
#include "pinout.h"

int main(int argc, char const *argv[])
{
	wiringPiSetup();
	pinMode(LED1,OUTPUT);
	pinMode(LED2,OUTPUT);
	pinMode(LED3,OUTPUT);
	pinMode(LED4,OUTPUT);

	for(int i = 0 , i<argc ; i++)
	{
		printf("%d -> %s\n", i, argv[i]);
	}
	// while(1)
	{
		// digitalWrite(LED1);
	}

	return 0;
}