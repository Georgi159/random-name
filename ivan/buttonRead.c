#include <wiringPi.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "pinout.h"

#define drBUT1 !digitalRead(BUT1)
#define drBUT2 !digitalRead(BUT2)
#define drBUT3 !digitalRead(BUT3)
#define drBUT4 !digitalRead(BUT4)

#define LOOP 1

#define OUTPUT_FILE		"/tmp/button_values.io"
#define OUTPUT_STRING	"B1 %d\nB2 %d\nB3 %d\nB4 %d\n"

int main()
{
	wiringPiSetup();
	pinMode(BUT1,INPUT);
	pinMode(BUT2,INPUT);
	pinMode(BUT3,INPUT);
	pinMode(BUT4,INPUT);
	pullUpDnControl(BUT1,PUD_UP);
	pullUpDnControl(BUT2,PUD_UP);
	pullUpDnControl(BUT3,PUD_UP);
	pullUpDnControl(BUT4,PUD_UP);

	char poll_new[30] = { 0 };
	char poll_old[30] = { 0 };

	FILE *fp;

	while(LOOP)
	{
		sprintf(poll_new, OUTPUT_STRING, drBUT1, drBUT2, drBUT3, drBUT4);
		if(strcmp(poll_new, poll_old) != 0)
		{
			fp = fopen(OUTPUT_FILE, "w");
			strcpy(poll_old, poll_new);
			fprintf(fp, poll_new);
			fclose(fp);
		}
		delay(10);
	}

	return 0;
}