/* A Simple GPIO application
*  Written by Derek Molloy for the book "Exploring Raspberry Pi" */

#include<iostream>
#include<unistd.h>  // for the usleep() function
#include"GPIO.h"
using namespace exploringRPi;
using namespace std;

int main(){
   GPIO outGPIO(17), inGPIO(27);    // pin 11 and pin 13
   outGPIO.setDirection(OUTPUT);    // basic output example

   inGPIO.setDirection(INPUT);      // basic input example

   outGPIO.streamOpen();            // fast write example
   for (int i=0; i<10000000; i++){   // write many times
      while(inGPIO.getValue() == 0) {
         ;
      }
      outGPIO.streamWrite(HIGH);    // high
      outGPIO.streamWrite(LOW);     // immediately low, repeat
      while(inGPIO.getValue() == 1) {
         ;
      }
   }
   outGPIO.streamClose();           // close the stream
   return 0;
}
