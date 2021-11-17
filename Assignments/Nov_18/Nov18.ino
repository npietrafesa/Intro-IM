#include "pitches.h"

const int potPin = A5;
const int piezoPin = 10;
const int buttonG = 7;
const int buttonR = 6;
const int buttonB = 5;


void setup() {
  // put your setup code here, to run once:
  pinMode(buttonG, INPUT_PULLUP);
  pinMode(buttonR, INPUT_PULLUP);
  pinMode(buttonB, INPUT_PULLUP);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  int buttonStateG = digitalRead(buttonG);
  int buttonStateR = digitalRead(buttonR);
  int buttonStateB = digitalRead(buttonB);
  int potentiometerState = analogRead(potPin)/250;
  // int piezoState = analogRead(piezoPin);
  //Serial.println(potentiometerState);
  if (buttonStateB == LOW && buttonStateR == LOW && buttonStateG == LOW) {
    tone(piezoPin, NOTE_C2*pow(2, potentiometerState));
  } else if (buttonStateB == LOW && buttonStateR == HIGH && buttonStateG == LOW) {
    tone(piezoPin, NOTE_D2*pow(2, potentiometerState));
  } else if (buttonStateB == HIGH && buttonStateR == LOW && buttonStateG == LOW) {
    tone(piezoPin, NOTE_E2*pow(2, potentiometerState));
  } else if (buttonStateB == LOW && buttonStateR == LOW && buttonStateG == HIGH) {
    tone(piezoPin, NOTE_F2*pow(2, potentiometerState));
  } else if (buttonStateB == LOW && buttonStateR == HIGH && buttonStateG == HIGH) {
    tone(piezoPin, NOTE_G2*pow(2, potentiometerState));
  }else if (buttonStateB == HIGH && buttonStateR == LOW && buttonStateG == HIGH) {
    tone(piezoPin, NOTE_A2*pow(2, potentiometerState));
  }else if (buttonStateB == HIGH && buttonStateR == HIGH && buttonStateG == LOW) {
    tone(piezoPin, NOTE_B2*pow(2, potentiometerState));
  }else {
    noTone(piezoPin);
  }
}
