int mineCount = 50;
int flagCount = mineCount;
int timer = 0;
tile[][] board = new tile[20][20];
boolean flagMode = false;
class tile {
  int id;
  float xPos, yPos;
  boolean isRevealed, isFlagged = false;
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
    if (isFlagged) {
      return;
    } else {
      fill(200);
      square(xPos, yPos, 20);
      fill(255, 0, 0);
      textSize(15);
      switch (id) {
      case -1:
        fill(0);
        break;
      case 0:
        fill(200);
        break;
      case 1:
        fill(0, 0, 255);
        break;
      case 2:
        fill(0, 200, 0);
        break;
      case 3:
        fill(255, 0, 0);
        break;
      case 4:
        fill(100, 100, 255);
        break;
      case 5:
        fill(255, 100, 100);
        break;
      case 6:
        fill(255, 200, 200);
        break;
      case 7:
        fill(255, 0, 255);
        break;
      case 8:
        fill(0, 255, 255);
        break;
      default:
        break;
      }
      if (id == 0) {
      } else if (id == -1) {
        text("M", xPos+7, yPos+15);
        revealBoard();
        textSize(200);
        text("Game Over",0,0);
      } else {
        text(id, xPos+7, yPos+15);
      }
      isRevealed = true;
    }
  }
  void flag() {
    if (isRevealed) {
      return;
    } else {
      if (!isFlagged) {
        fill(255, 0, 0);
        square(xPos, yPos, 20);
        flagCount++;
        isFlagged = true;
      } else {
        fill(100);
        square(xPos, yPos, 20);
        flagCount--;
        isFlagged = false;
      }
    }
  }
  int assignNumber(int x, int y) {
    int[] arr = {-1, 0, 1};
    int result = 0;
    for (int i : arr) {
      for (int j : arr) {
        if ((x+i<0 || x+i>board.length-1) || (y+j<1 || y+j>board[0].length-1)) {
          continue;
        } else {
          if (i == 0 && j == 0) {
            continue;
          } else {
            if (board[x+i][y+j].id == -1) {
              result++;
            }
          }
        }
      }
    }
    return result;
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
  generateMines();
  revealBoard();
}

void draw() {
  int timerCount = millis();
  //if (timerCount >= 1000) {
  //  timer += 1;
  //}
  textSize(100);
  //text(timer, 200, 200);
  fill(255, 0, 0);
  text(flagCount, 650, 150);
  if (!flagMode) {
    fill(100);
    rect(575, 100, 50, 50);
  } else {
    fill(200, 0, 0);
    rect(575, 100, 50, 50);
  }
}

void mouseClicked() {
  if ((mouseX>=(width-(board.length*20))/2 && mouseX<=((width-(board.length*20))/2)+(board.length*board[0].length)) && (mouseY>=(height-(board[0].length*20))/2 && mouseY<=((height-(board[0].length*20))/2)+(board.length*board[0].length))) {
    if (!flagMode) {
      board[(mouseX-(width-(board.length*20))/2)/20][(mouseY-(height-(board[0].length*20))/2)/20].reveal();
    } else {
      board[(mouseX-(width-(board.length*20))/2)/20][(mouseY-(height-(board[0].length*20))/2)/20].flag();
    }
  }
  if ((mouseX>=575 && mouseX<=625) && (mouseY>=100 && mouseY<=150)) {
    flagMode = !flagMode;
  }
}

void generateBoard(tile[][] arr) {
  for (int i=0; i<arr.length; i++) {
    for (int j=0; j<arr[0].length; j++) {
      arr[i][j].build((i*20)+((width-(arr.length*20))/2), (j*20)+((height-(arr[0].length*20))/2));
    }
  }
}

void generateMines() {
  int randNumX;
  int randNumY;
  for (int i=0; i<mineCount; i++) {
    randNumX = (int)random(board.length);
    randNumY = (int)random(board[0].length);
    while (board[randNumX][randNumY].id == -1) {
      randNumX = (int)random(board.length);
      randNumY = (int)random(board[0].length);
    }
    board[randNumX][randNumY].id = -1;
  }
  for (int i=0; i<board.length; i++) {
    for (int j=0; j<board[0].length; j++) {
      if (board[i][j].id == -1) {
        continue;
      } else {
        board[i][j].id = board[i][j].assignNumber(i, j);
      }
    }
  }
}
void revealBoard() {
  for (int i=0; i<board.length; i++) {
    for (int j=0; j<board[0].length; j++) {
      board[i][j].reveal();
    }
  }
}
