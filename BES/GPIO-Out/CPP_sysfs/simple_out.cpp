/* A Simple GPIO application
*  Written by Derek Molloy for the book "Exploring Raspberry Pi" */

#include<iostream>
#include<unistd.h>  // for the usleep() function
#include"GPIO.h"
using namespace exploringRPi;
using namespace std;

int main(){
   GPIO outGPIO(17), inGPIO(27);    // pin 11 and pin 13


   while (1) {
	   outGPIO.setDirection(OUTPUT);    // basic output example
	   for (int i=0; i<100; i++){        // flash the LED 
	      outGPIO.setValue(HIGH);       // turn the LED on
	      outGPIO.setValue(LOW);        // turn the LED off
	   }

	   outGPIO.streamOpen();            // fast write example
	   for (int i=0; i<1000; i++){   // write
	      outGPIO.streamWrite(HIGH);    // high
	      outGPIO.streamWrite(LOW);     // immediately low, repeat
	   }
	   outGPIO.streamClose();           // close the stream
	}
   return 0;
}
