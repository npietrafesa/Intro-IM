//int DISPLAY_WIDTH = 1200;
//int DISPLAY_HEIGHT = 800;
int mineCount = 0;
int timer = 0;
tile[][] board = new tile[20][20];
class tile {
  int id;
  float xPos, yPos;
  boolean isRevealed;
  tile() {
    id = 0;
    isRevealed = false;
  }

  void build(float x, float y) {
    xPos = x;
    yPos = y;
    fill(100);
    stroke(0);
    square(xPos, yPos, 20);
  }
  void reveal() {
    fill(200);
    //stroke()
    square(xPos, yPos, 20);
    fill(255, 0, 0);
    textSize(15);
    text(id, xPos-3, yPos+5);
    isRevealed = true;
  }
}

void setup() {
  size(1200, 800);
  background(0, 100, 100);
  rectMode(CENTER);
  textMode(CENTER);

  for (int i=0; i<board.length; i++) {
    for (int j=0; j<board[0].length; j++) {
      board[i][j] = new tile();
    }
  }
  generateBoard(board);
  //println(board.length, board[0].length, board.length*board[0].length);
  board[2][3].reveal();
  board[5][3].reveal();
  board[7][1].reveal();
}

void draw() {
  int timerCount = millis();
  if (timerCount >= 1000) {
    timer += 1;
  }
  textSize(100);
  text(timer, 200, 200);
  text(mineCount, 200, 400);
  println(mouseX, mouseY);
  println((mouseX-(width/3))/20,(mouseY-(height/4))/20);
  if ((mouseX>=width/3 && mouseX<=(width/3)+(board.length*board[0].length)) && (mouseY>=height/4 && mouseY<=(height/4)+(board.length*board[0].length)))  {
    println("true");
  } else {
    println("false");
  }
}

void mouseClicked() {
  if ((mouseX>=width/3 && mouseX<=(width/3)+(board.length*board[0].length)) && (mouseY>=height/4 && mouseY<=(height/4)+(board.length*board[0].length))) {
    board[(mouseX-(width/3))/20][(mouseY-(height/4))/20].reveal();
  }
}

void generateBoard(tile[][] arr) {
  for (int i=0; i<arr.length; i++) {
    for (int j=0; j<arr[0].length; j++) {
      arr[i][j].build((i*20)+(width/3), (j*20)+(height/4));
    }
  }
}
