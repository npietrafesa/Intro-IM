//TRANSMITTER CODE
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

//radio pin setup
const int CEPIN = 9;
const int CSNPIN = 10;
RF24 radio(CEPIN, CSNPIN);  // CE, CSN

//address the radio will operate on
const byte address[6] = "00030";

int processingRaw = 0; //handles data processing will send over

void setup() {
  Serial.begin(9600);

  //radio setup
  boolean retval = radio.begin();   //Starting the Wireless communication
  radio.openWritingPipe(address);  //destination address
  radio.setPALevel(RF24_PA_MIN);   // min or max
  radio.stopListening();           //This sets the module as transmitter
}
void loop() {
  // read input data from processing, if there is any
  if (Serial.available() > 0) {
    processingRaw = Serial.read();
    Serial.print("Transmitter Received: ");
    Serial.println(processingRaw, DEC);
  }
  //send over data from processing to receiver
  int data = processingRaw;
  if (data != 0) {
    Serial.print( "Transmitter Sending: " );
    Serial.println(data);
    radio.write(&data, sizeof(data));
  }
}
