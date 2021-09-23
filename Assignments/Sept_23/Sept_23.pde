class randText { //creation of the randText object is here, its purpose is to create an object that will place random letters, numbers, and symbols at a random location on the screen. //<>// //<>//
  float xPos, yPos;
  color randColor;
  randText() { //initializing the object to have a random position and color
    xPos = random (0, width);
    yPos = random (0, height);
    randColor = color(random(0, 255), random(0, 255), random(0, 255));
  }

  String generateRandomString() { //this method creates the string of random symbols that will be displayed later in text().
    String randomChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890!@#$%^&*()_+{}|[];:<>/?`~.,-="; //a string containing all the random symbols
    String output = ""; //what the method will return
    for (int i=0; i<random(1, 10); i++) { //for loop creates a random string length from 1-10
      int randNum = int(random(randomChars.length())); //generate a random number that will correspond to a position in the string, think of it like the string is an array of chars and it selects string[randNum].
      char randChar = randomChars.charAt(randNum); //with the random number, get the char at that number's position in the string.
      output += randChar; //concatenate this char to the output string
    }
    return output;
  }

  void drawText() { //this will draw the text to the screen with a random color and uses the generateRandomString() method to build the string.
    fill(randColor);
    text(generateRandomString(), xPos, yPos);
  }
}

void setup() {
  size(1000, 800); //setup vars for the environment
  background(0, 0, 0);
  rectMode(CENTER);

  for (int i=0; i<25; i++) { //for the background, I opted to make a "grid" of small squares. These have a white "shadow" to them and are offset by a random number of pixels.
    for (int j=0; j<25; j++) {
      int randX = int(random(15)); //generate an x and y pixel offset
      int randY = int(random(15));
      fill(255, 255, 255);
      rect((i*40)-randX+4, (j*32)-randY+4, 10, 10); //first create the white square, its "shadow", so add 4 pixels to x and y pos so they dont overlap
      fill(167, 44, 135);
      rect((i*40)-randX, (j*32)-randY, 10, 10); //then, create the purpse squares over the white ones
    }
  }

  textSize(50);
  randText[] words = new randText[100]; //once background is done, start generating text
  for (int i=0; i < words.length; i++) { //initialize each object, then draw to the screen.
    words[i] = new randText();
    words[i].drawText();
  }
}
