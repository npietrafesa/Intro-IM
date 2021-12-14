import processing.serial.*;
Serial robot;
String val;
int raw;
boolean isAutoCodeExecuting = false;
boolean execDonut = false;
boolean execDemoMove = false;
void setup() {
  size(800, 800);
  rectMode(CENTER);
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
  
    fill(255);
  rect(400, 220, 150, 150, 20);
  rect(400, 580, 150, 150, 20);
  rect(220, 400, 150, 150, 20);
  rect(580, 400, 150, 150, 20);

  rect(150, 150, 200, 150, 20);
  rect(650, 150, 200, 150, 20);

  fill(0);
  triangle(365, 255, 435, 255, 400, 175);
  triangle(365, 545, 435, 545, 400, 625);
  triangle(255, 435, 255, 365, 175, 400);
  triangle(545, 435, 545, 365, 625, 400);

  if ((mouseX >= 325 && mouseX <= 475) && (mouseY >= 145 && mouseY <= 295) && !mousePressed) {
    fill(225);
    rect(400, 220, 150, 150, 20);
    fill(0);
    triangle(365, 255, 435, 255, 400, 175);
  } else if ((mouseX >= 325 && mouseX <= 475) && (mouseY >= 505 && mouseY <= 655) && !mousePressed) {
    fill(225);
    rect(400, 580, 150, 150, 20);
    fill(0);
    triangle(365, 545, 435, 545, 400, 625);
  } else if ((mouseX >= 145 && mouseX <= 295) && (mouseY >= 325 && mouseY <= 475) && !mousePressed) {
    fill(225);
    rect(220, 400, 150, 150, 20);
    fill(0);
    triangle(255, 435, 255, 365, 175, 400);
  } else if ((mouseX >= 505 && mouseX <= 655) && (mouseY >= 325 && mouseY <= 475) && !mousePressed) {
    fill(225);
    rect(580, 400, 150, 150, 20);
    fill(0);
    triangle(545, 435, 545, 365, 625, 400);
  } else if ((mouseX >= 50 && mouseX <= 250) && (mouseY >= 75 && mouseY <= 225) && !mousePressed) {
    fill(225);
    rect(150, 150, 200, 150, 20);
  } else if ((mouseX >= 575 && mouseX <= 725) && (mouseY >= 75 && mouseY <= 225) && !mousePressed) {
    fill(225);
    rect(650, 150, 200, 150, 20);
  }

  if (((mouseX >= 325 && mouseX <= 475) && (mouseY >= 145 && mouseY <= 295) && mousePressed) || (keyPressed && (keyCode == UP || key == 'W' || key == 'w'))) {
    fill(100);
    rect(400, 220, 150, 150, 20);
    fill(0);
    triangle(365, 255, 435, 255, 400, 175);
  } else if (((mouseX >= 325 && mouseX <= 475) && (mouseY >= 505 && mouseY <= 655) && mousePressed) || (keyPressed && (keyCode == DOWN || key == 'S' || key == 's'))) {
    fill(100);
    rect(400, 580, 150, 150, 20);
    fill(0);
    triangle(365, 545, 435, 545, 400, 625);
  } else if (((mouseX >= 145 && mouseX <= 295) && (mouseY >= 325 && mouseY <= 475) && mousePressed) || (keyPressed && (keyCode == LEFT || key == 'A' || key == 'a'))) {
    fill(100);
    rect(220, 400, 150, 150, 20);
    fill(0);
    triangle(255, 435, 255, 365, 175, 400);
  } else if (((mouseX >= 505 && mouseX <= 655) && (mouseY >= 325 && mouseY <= 475) && mousePressed) || (keyPressed && (keyCode == RIGHT || key == 'D' || key == 'd'))) {
    fill(100);
    rect(580, 400, 150, 150, 20);
    fill(0);
    triangle(545, 435, 545, 365, 625, 400);
  } else if ((mouseX >= 50 && mouseX <= 250) && (mouseY >= 75 && mouseY <= 225) && mousePressed) {
    fill(100);
    rect(150, 150, 200, 150, 20);
  } else if ((mouseX >= 575 && mouseX <= 725) && (mouseY >= 75 && mouseY <= 225) && mousePressed) {
    fill(100);
    rect(650, 150, 200, 150, 20);
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
    if ((mouseX >= 50 && mouseX <= 250) && (mouseY >= 75 && mouseY <= 225) && mousePressed) {
    //robot.write(5);
  }
}
