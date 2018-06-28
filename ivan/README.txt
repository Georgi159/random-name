Button reading constantly polls the state of the 4 buttons and writes it to /tmp/button_values.io
Starting :

	#nohup ./buttonRead.out &

nohup	- detaches the process from the session so that it can continue running after the session is closed
&		- starts the process in background

Output format of /tmp/button_values.io when button 2 is pressed :

	#cat /tmp/button_values.io 
	B1 0
	B2 1
	B3 0
	B4 0




LED control is done by calling :

	#./ledControl.out 0 1 0 2

0 1 0 1 --> state of the LEDs

0 - Turn off
1 - Turn on
2 - Don't change

For compiling use the following :

	#gcc -Wall filename.c -o filename.out -lwiringPi
