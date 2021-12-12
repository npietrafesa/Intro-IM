//RECEIVER CODE
#include <SPI.h>
#include <nRF24L01.h>
#include <RF24.h>

//radio pin setup
const int CEPIN = 9;
const int CSNPIN = 10;
RF24 radio(CEPIN, CSNPIN);  // CE, CSN

//address the radio will operate on
const byte address[6] = "00001";

// motor controller pins
const int ain1Pin = 3;
const int ain2Pin = 4;
const int pwmAPin = 5;

const int bin1Pin = 8;
const int bin2Pin = 7;
const int pwmBPin = 6;


void setup() {

  //init motors
  pinMode(ain1Pin, OUTPUT);
  pinMode(ain2Pin, OUTPUT);
  pinMode(bin1Pin, OUTPUT);
  pinMode(bin2Pin, OUTPUT);
  Serial.begin(9600);

  // radio setup
  if (!radio.begin()) {
    Serial.println("Radio Initialization Failed");
    while (1)
      ;
  } else {
    Serial.println("Radio Successfully Initialized");
  }
  radio.openReadingPipe(0, address);  // Destination address
  radio.setPALevel(RF24_PA_MIN);      // Min or max
  radio.startListening();             // sets  module as receiver
}
void loop() {
  uint8_t pipeNum;
  if (radio.available(&pipeNum))  //Looking for the data.
  {
    int data;

    Serial.print("Incoming data from transmitter ");
    Serial.println(pipeNum);
    radio.read(&data, sizeof(data));  //Reading the data
    Serial.print("Receiver received: ");
    Serial.println(data);

    //see transmitter code for info about the data.
    if (data == 1) { //turn right
      analogWrite(pwmAPin, 100);
      digitalWrite(ain1Pin, LOW);
      digitalWrite(ain2Pin, HIGH);
      analogWrite(pwmBPin, 100);
      digitalWrite(bin1Pin, LOW);
      digitalWrite(bin2Pin, HIGH);
    } else if (data == 2) { //move fwd
      digitalWrite(ain1Pin, HIGH);
      digitalWrite(ain2Pin, LOW);
      digitalWrite(bin1Pin, LOW);
      digitalWrite(bin2Pin, HIGH);
      analogWrite(pwmAPin, 255);
      analogWrite(pwmBPin, 255);
    } else if (data == 3) { //turn left
      digitalWrite(ain1Pin, HIGH);
      digitalWrite(ain2Pin, LOW);
      digitalWrite(bin1Pin, HIGH);
      digitalWrite(bin2Pin, LOW);
      analogWrite(pwmAPin, 255);
      analogWrite(pwmBPin, 255);
    } else if (data == 4) { //move back
      digitalWrite(ain1Pin, LOW);
      digitalWrite(ain2Pin, HIGH);
      digitalWrite(bin1Pin, HIGH);
      digitalWrite(bin2Pin, LOW);
      analogWrite(pwmAPin, 255);
      analogWrite(pwmBPin, 255);
    } else {
      stop();
    }
  } else {
    stop();
  }
  //delay(5);
}

void moveForward(int speed, unsigned long time) {
  digitalWrite(ain1Pin, HIGH);
  digitalWrite(ain2Pin, LOW);
  digitalWrite(bin1Pin, LOW);
  digitalWrite(bin2Pin, HIGH);
  analogWrite(pwmAPin, speed);
  analogWrite(pwmBPin, speed);
  delay(time);
}

void moveBackward(int speed, unsigned long time) {
  digitalWrite(ain1Pin, LOW);
  digitalWrite(ain2Pin, HIGH);
  digitalWrite(bin1Pin, HIGH);
  digitalWrite(bin2Pin, LOW);
  analogWrite(pwmAPin, speed);
  analogWrite(pwmBPin, speed);
  delay(time);
}

void turnLeft(int speed, unsigned long time) {
  digitalWrite(ain1Pin, HIGH);
  digitalWrite(ain2Pin, LOW);
  digitalWrite(bin1Pin, HIGH);
  digitalWrite(bin2Pin, LOW);
  analogWrite(pwmAPin, speed);
  analogWrite(pwmBPin, speed);
  delay(time);
}

void turnRight(int speed, unsigned long time) {
  digitalWrite(ain1Pin, LOW);
  digitalWrite(ain2Pin, HIGH);
  digitalWrite(bin1Pin, LOW);
  digitalWrite(bin2Pin, HIGH);
  analogWrite(pwmAPin, speed);
  analogWrite(pwmBPin, speed);
  delay(time);
}

void stop() { //stops motors
  digitalWrite(ain1Pin, LOW);
  digitalWrite(ain2Pin, LOW);
  digitalWrite(bin1Pin, LOW);
  digitalWrite(bin2Pin, LOW);
  analogWrite(pwmAPin, 0);
  analogWrite(pwmBPin, 0);
}

void doDonut() {
  turnLeft(100, 5000);
}

void moveDemo() {
  moveForward(50, 500);
  turnRight(100, 1000);
  moveBackwards(200, 500);
  turnLeft(50, 500);
}
