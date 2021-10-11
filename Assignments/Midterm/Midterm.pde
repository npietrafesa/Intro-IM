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
    square(xPos, yPos, 20);
    fill(255, 0, 0);
    textSize(15);
    text(id, xPos+7, yPos+15);
    isRevealed = true;
  }
}

void setup() {
  size(1200, 800);
  background(0, 100, 100);
  for (int i=0; i<board.length; i++) {
    for (int j=0; j<board[0].length; j++) {
      board[i][j] = new tile();
    }
  }
  generateBoard(board);
}

void draw() {
  int timerCount = millis();
  if (timerCount >= 1000) {
    timer += 1;
  }
  textSize(100);
  text(timer, 200, 200);
  text(mineCount, 200, 400);
}

void mouseClicked() {
  if ((mouseX>=(width-(board.length*20))/2 && mouseX<=((width-(board.length*20))/2)+(board.length*board[0].length)) && (mouseY>=(height-(board[0].length*20))/2 && mouseY<=((height-(board[0].length*20))/2)+(board.length*board[0].length))) {
    board[(mouseX-(width-(board.length*20))/2)/20][(mouseY-(height-(board[0].length*20))/2)/20].reveal();
  }
}

void generateBoard(tile[][] arr) {
  for (int i=0; i<arr.length; i++) {
    for (int j=0; j<arr[0].length; j++) {
      arr[i][j].build((i*20)+((width-(arr.length*20))/2), (j*20)+((height-(arr[0].length*20))/2));
    }
  }
}

void generate() {
  int randNumX;
  int randNumY;
  for (int i=0; i<mineCount; i++) {
    randNumX = (int)random(board.length);
    randNumY = (int)random(board[0].length);
    
  }
}
