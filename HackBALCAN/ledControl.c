#include <wiringPi.h>
#include "pinout.h"

int main()
{
  wiringPiSetup();
  pinMode(LED1,OUTPUT);
  pinMode(LED2,OUTPUT);
  pinMode(LED3,OUTPUT);
  pinMode(LED4,OUTPUT);

  while(1)
  {
    digitalWrite(LED1,digitalRead(BUT1));
    digitalWrite(LED2,digitalRead(BUT2));
    digitalWrite(LED3,digitalRead(BUT3));
    digitalWrite(LED4,digitalRead(BUT4));
  }
  return 0;
}