#include <wiringPi.h>
#include <stdio.h>
#include <string.h>
#include "pinout.h"

#define drBUT1 !digitalRead(BUT1)
#define drBUT2 !digitalRead(BUT2)
#define drBUT3 !digitalRead(BUT3)
#define drBUT4 !digitalRead(BUT4)


#define OUTPUT_FILE		"/tmp/button_values.io"
#define OUTPUT_STRING	"B1 %d\nB2 %d\nB3 %d\nB4 %d\n"

FILE *fp;
int main(void)
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

	char input[4]={0};
	input[0]=BUT1;
	input[1]=BUT2;
	input[2]=BUT3;
	input[4]=BUT4;

	char change=0;
	for (;;)
	{
		if (input[0]!=drBUT1)
		{
			input[0]=drBUT1;
			change++;
		}
		if (input[1]!=drBUT2)
		{
			input[1]=drBUT2;
			change++;
			// system("killall google_speech; killall sox; echo \"kiled\" >> /tmp/killed");
		}

		if (input[2]!=drBUT3)
		{
			input[2]=drBUT3;
			change++;
		}
		if (input[3]!=drBUT4)
		{
			input[3]=drBUT4;
			change++;
		}

		if (change)
		{
			fp = fopen(OUTPUT_FILE, "w");
			fprintf(fp, "B1 %d\nB2 %d\nB3 %d\nB4 %d\n", input[0],input[1], input[2],input[3]);
			printf("Updated!\n");
			fclose(fp);
			change=0;
		}
		delay(10);
		// system("sleep(0.01)");

	}

	return 0;
}