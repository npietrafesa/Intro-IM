//TRANSMITTER CODE
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>
RF24 radio(CEPIN, CSNPIN);  // CE, CSN

//radio pin setup
const int CEPIN = 9;
const int CSNPIN = 10;

//address the radio will operate on
const byte address[6] = "00001";

// "addresses" of key inputs
const int fwdKey = 0;
const int backKey = 1;
const int leftKey = 2;
const int rightKey = 3;
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
  } else { //set to some arbitrary value if no input data
    processingRaw = 255;
  }
  //compares key address to processing input, if both are the same,
  //set to true (1), else set to false (0).
  //shift bits equal to the address, which each act as a unique code
  //that tells the receiver which mode to execute.
  int right = ((rightKey == processingRaw) ? 1 : 0) << 0; //1
  int fwd = ((fwdKey == processingRaw) ? 1 : 0) << 1; //2
  int left = ((leftKey == processingRaw) ? 1 : 0) << 2; //4
  int back = ((backKey == processingRaw) ? 1 : 0) << 3; //8
  int data = back | left | fwd | right; //data will either be 0 or one of the key values
  if (data) { //if data not 0, send info over to receiver.
    Serial.print( "Transmitter Sending: " );
    Serial.println(data);
    radio.write(&data, sizeof(data));
  }
}
