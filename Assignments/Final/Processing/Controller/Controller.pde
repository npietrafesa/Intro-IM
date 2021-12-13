import processing.serial.*;
Serial robot;
String val;
int raw;
boolean isAutoCodeExecuting = false;
boolean execDonut = false;
boolean execDemoMove = false;
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
  //if (raw == 0) {
  //  robot.write(0);
  //} else {
  //  raw = -1;
  //}
  //if (!keyPressed) {
  //  robot.write(255);
  //}
  //robot.write(0);
  switch (raw) {
    case 1:
    robot.write(1);
    break;
    case 2:
    robot.write(2);
    break;
    case 3:
    robot.write(3);
    break;
    case 4:
    robot.write(4);
    break;
    default:
   // robot.write(0);
    break;
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W' || keyCode == UP) {
    println("Going Forward");
    raw = 1;
    //robot.write(0);
  } else if (key == 's' || key == 'S' || keyCode == DOWN) {
    println("Going Backward");
    raw = 2;
    //robot.write(1);
  } else if (key == 'a' || key == 'A' || keyCode == LEFT) {
    println("Turning Left");
    raw = 3;
    //robot.write(2);
  } else if (key == 'd' || key == 'D' || keyCode == RIGHT) {
    println("Turn Right");
    raw = 4;
    //robot.write(3);
  } 
  //else {
  //  robot.write(-1);
  //}
}

void keyReleased() {
  raw = 0;
}

void mousePressed() {
  
}
