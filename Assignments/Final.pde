import processing.serial.*;
Serial robot;
String val;
int raw;
void setup() {
  size(200, 200);
  robot = new Serial(this, Serial.list()[1], 9600);
}

void draw() {
  background(200);
  if (robot.available() > 0)
  {  // If data is available,
    val = robot.readStringUntil('\n');         // read it and store it in val
    println(val);
  }
  if (raw == 0) {
    robot.write(0);
  } else {
    raw = -1;
  }
  //if (!keyPressed) {
  //  robot.write(255);
  //}
  //robot.write(0);
}

void keyPressed() {
  if (key == 'w' || key == 'W' || keyCode == UP) {
    println("Going Forward");
    //raw = 0;
    robot.write(0);
  } else if (key == 's' || key == 'S' || keyCode == DOWN) {
    println("Going Backward");
    robot.write(1);
  } else if (key == 'a' || key == 'A' || keyCode == LEFT) {
    println("Turning Left");
    robot.write(2);
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    println("Turn Right");
    robot.write(3);
  } 
  //else {
  //  robot.write(-1);
  //}
}
