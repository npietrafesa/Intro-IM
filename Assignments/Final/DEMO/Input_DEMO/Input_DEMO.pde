import processing.serial.*;
Serial robot;
String val;
int clicks = 0;
boolean moveSig = false;
void setup() {
  size(200, 200);
  robot = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  background(200);
  //if (robot.available() > 0)
  //{  // If data is available,
  //  val = robot.readStringUntil('\n');         // read it and store it in val
  //  println(val);
  //}
  if (moveSig) {
    robot.write(1);
  } else {
    robot.write(0);
  }
  println(clicks);
  println(moveSig);
}

//void mouseClicked() {
// clicks++;
// if (clicks%2 == 1) {
//   moveSig = true;
// } else {
//   moveSig = false;
// }
//}

void keyPressed() {
  if (key == 'w') {
    moveSig = true;
  }
}

void keyReleased() {
 moveSig = false;
}
