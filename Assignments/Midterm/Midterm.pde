import processing.sound.*;
enum Background { //control which background
  MENU,
    INSTRUCTIONS,
    CHOOSE_DIFFICULTY,
    GAME,
}
enum Difficulty { //control which difficulty
  EASY,
    MEDIUM,
    HARD,
    NONE
}
int mineCount; //number of mines
int flagCount; //number of flags
int timer; //timer
boolean flagMode = false; //is flag mode on?
boolean gameOver = false; //is game over?
boolean boardSet = false; //is grid set up?
PImage mine; //mine sprite
PImage flag; //flag sprite
SoundFile boom; //explosion sound
SoundFile music; //background music - Nujabes and Shing02 - Luv(sic) part 3 instrumental
Background bg = Background.MENU; //setting up background
Difficulty diff = Difficulty.NONE; //setting up difficulty
tile[][] board; //setting up board

class tile { //tile class which is each individual tile in the grid
  int id; //determines number or mine or blank
  float xPos, yPos; //coords
  boolean isRevealed, isFlagged = false;

  tile() { //constructor
    id = 0;
    isRevealed = false;
  }

  void build(float x, float y) { //builds board with all values hidden
    xPos = x;
    yPos = y;
    fill(100);
    stroke(0);
    square(xPos, yPos, 20);
  }

  void reveal() { //revealing method
    if (isFlagged || isRevealed || gameOver) { //dont reveal if revealed, flagged, or game is over
      return;
    } else {
      fill(200);
      square(xPos, yPos, 20);
      fill(255, 0, 0);
      textSize(15);
      switch (id) { //switch to show the id of the tile
      case -1: //mine
        fill(0);
        break;
      case 0: //blank space
        fill(200);
        break;
      case 1: //rest are self-explanatory. 1-8 adjacesnt mines
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
      if (id == 0) { //dont display text for blank space
      } else if (id == -1) { //if mine is revealed, you lose!
        fill(255, 0, 0);
        square(xPos, yPos, 20);
        image(mine, xPos, yPos);
      } else { //else, reveal tile
        text(id, xPos+7, yPos+15);
      }
      isRevealed = true;
      if (id == 0) { //if blank space revealed, reveal all other blank spaces adjacent until none are left. it does this through recursion.
        int[] arr = {-1, 0, 1}; //array that will iterate through adjacent tiles
        for (int i : arr) {
          for (int j : arr) { //a lot of calculations, its to make it so these will work with the verying board sizes.
          //essentially this checks that it will not reveal tiles out of bounds of the array
            if (((int)((xPos-(width-(board.length*20))/2)/20)+i<0 || (int)((xPos-(width-(board.length*20))/2)/20)+i>board.length-1) || ((int)((yPos-(height-(board[0].length*20))/2)/20)+j<0 || (int)((yPos-(height-(board[0].length*20))/2)/20)+j>board[0].length-1)) {
              continue;
            } else {
              if (i == 0 && j == 0) { //skip (0,0), since that is the original tile
                continue;
              } else { //reveal recursively
                board[(int)((xPos-(width-(board.length*20))/2)/20)+i][(int)((yPos-(height-(board[0].length*20))/2)/20)+j].reveal();
              }
            }
          }
        }
      }
    }
  }
  
  void flag() { //flagging method
    if (isRevealed) { //do not flag revealed tiles
      return;
    } else {
      if (flagCount == 0) {
      } else {
        if (!isFlagged) { // if not flagged, add flag
          image(flag, xPos, yPos);
          flagCount--;
          isFlagged = true;
        } else { // if flagged, remove flag
          fill(100);
          square(xPos, yPos, 20);
          flagCount++;
          isFlagged = false;
        }
      }
    }
  }
  
  int assignNumber(int x, int y) { //this method is for calculating the number of adjacent mines to the selected tile
    int[] arr = {-1, 0, 1}; //uses same loop method to find adjacent tiles
    int result = 0;
    for (int i : arr) {
      for (int j : arr) { //ensure doesnt go out of bounds
        if ((x+i<0 || x+i>board.length-1) || (y+j<0 || y+j>board[0].length-1)) {
          continue;
        } else {
          if (i == 0 && j == 0) { // skip original position
            continue;
          } else {
            if (board[x+i][y+j].id == -1) { //if the adjacent tile is a mine, add 1 to id.
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
  size(1200, 800); //setting up all variables
  background(0, 100, 100);
  boom = new SoundFile(this, "boom.mp3");
  music = new SoundFile(this, "music.wav");
  music.loop();
  music.amp(0.3);
  music.play();
  mine = loadImage("mine.png");
  flag = loadImage("flag.png");
  mine.resize(20, 20);
  flag.resize(20, 20);
}

void draw() {
  switch (bg) { //switch statement for backgrounds, this is how you can swap between them
  case MENU:
    board = null;
    background(0, 100, 100); //adding buttons and title
    fill(100);
    rect(400, 500, 400, 75);
    rect(400, 300, 400, 75);
    fill(0);
    textSize(100);
    text("MINESWEEPER", 325, 175);
    textSize(50);
    text("Play", 550, 350);
    text("Instructions", 475, 550);
    break;

  case INSTRUCTIONS:
    background(0, 100, 100); //instructions text
    fill(100);
    rect(25, 25, 200, 75);
    fill(0);
    textSize(50);
    text("Back", 65, 80);
    textSize(30);
    text("Minesweeper is a game about trying to trying to find all the mines without blowing up!", 10, 150);
    text("You can click on a grid to reveal it. One of three things will happen: you will see a blank space,", 10, 200);
    text("which indicates a safe space, you will see a number, which indicates the number of adjacent", 10, 250);
    text("tiles with mines (e.g. a 3 means there are 3 mines in the 8 spaces adjacent to it) or you will", 10, 300);
    text("reveal a mine, which means you lose! The rest of the board will then be revealed.", 10, 350);
    text("To avoid clicking a mine, you can click the square on top of the grid to enable flag mode. With", 10, 450);
    text("this, you can now click a grid and flag it as a mine, to ensure you dont click it. The goal is", 10, 500);
    text("to flag all mines, and once this is done, you win! The number on the top right will indicate how", 10, 550);
    text("many flags are left, which will be the exact number of mines in the grid. If you place all", 10, 600);
    text("flags and you havent won yet, double check your spots to ensure you haven't misplaced a flag!", 10, 650);
    text("That's all there is to it! Have fun and dont explode!", 250, 700);
    //line(600, 0, 600, 800);
    break;

  case CHOOSE_DIFFICULTY: //choosing difficulty with a nested state machine
    background(0, 100, 100);
    fill(100);
    rect(25, 25, 200, 75);
    rect(400, 150, 400, 75);
    rect(400, 350, 400, 75);
    rect(400, 550, 400, 75);
    fill(0);
    textSize(50);
    text("Back", 65, 80);
    text("Easy", 550, 200);
    text("10x10 Grid, 25 Mines", 390, 275);
    text("Medium", 525, 400);
    text("20x20 Grid, 50 Mines", 390, 475);
    text("Hard", 550, 600);
    text("40x20 Grid, 100 Mines", 380, 675);
    switch (diff) {
    case NONE:
      break;
    case EASY: //change grid size and mine count based on selected difficulty
      board = new tile[10][10];
      mineCount = 25;
      flagCount = mineCount;
      bg = Background.GAME;
      clear();
      break;
    case MEDIUM:
      board = new tile[20][20];
      mineCount = 50;
      flagCount = mineCount;
      bg = Background.GAME;
      clear();
      break;
    case HARD:
      board = new tile[40][20];
      mineCount = 100;
      flagCount = mineCount;
      bg = Background.GAME;
      clear();
      break;
    default:
      println("Error, if you see this message, something broke!");
      break;
    }
    break;

  case GAME: //this is the actual game
    if (!boardSet) {
      background(0, 100, 100);
      setupBoard(); //builds grid
      fill(100);
      rect(25, 25, 200, 75);
      rect(950, 25, 200, 75);
      fill(0);
      textSize(50);
      text("Exit", 75, 80);
      text("Restart", 975, 80);
    } else {
      timer = millis(); //timer
      if (timer/1000 >= 999) {
        timer = 999;
      }
      textSize(100);
      fill(0, 100, 100);
      noStroke();
      rect(400, 75, 150, 100); //rectangles to cover the timer and flag count so the text doesnt overlap
      rect(630, 75, 150, 100);
      fill(255, 0, 0);
      stroke(0);
      text(timer/1000, 400, 150);
      text(flagCount, 675, 150);
      if (!flagMode) { //enable/disable flagging mode
        fill(100);
        rect(575, 100, 50, 50);
      } else {
        fill(200, 0, 0);
        rect(575, 100, 50, 50);
      }
      checkWinCondition(); //checks to see if game is over
    }
    break;

  default:
    println("Error, if you see this message, something broke!");
    break;
  }
}

void mouseClicked() {
  switch (bg) {
  case MENU: //functionality to buttons on menu
    if ((mouseX > 400 && mouseX < 800) && (mouseY > 300 && mouseY < 375)) { //play
      bg = Background.CHOOSE_DIFFICULTY;
      clear();
    } else if ((mouseX > 400 && mouseX < 800) && (mouseY > 500 && mouseY < 575)) { //instructions
      bg = Background.INSTRUCTIONS;
      clear();
    }
    break;
  case INSTRUCTIONS:
    if ((mouseX > 25 && mouseX < 225) && (mouseY > 25 && mouseY < 100)) { //back
      bg = Background.MENU;
      clear();
    }
    break;

  case CHOOSE_DIFFICULTY:
    if ((mouseX > 25 && mouseX < 225) && (mouseY > 25 && mouseY < 100)) {
      bg = Background.MENU;
      clear();
    } else if ((mouseX > 400 && mouseX < 800) && (mouseY > 150 && mouseY < 225)) { //easy
      diff = Difficulty.EASY;
    } else if ((mouseX > 400 && mouseX < 800) && (mouseY > 350 && mouseY < 425)) { //medium
      diff = Difficulty.MEDIUM;
    } else if ((mouseX > 400 && mouseX < 800) && (mouseY > 550 && mouseY < 625)) { //hard
      diff = Difficulty.HARD;
    }
    break;

  case GAME: //more confusing calculations, its all to make sure the varying board sizes work. It essentially checks if the mouse is clicked within the bounds of the grid and then reveals the respective tile.
    if ((mouseX>=(width-(board.length*20))/2 && mouseX<=((width-(board.length*20))/2)+(board.length*20)) && (mouseY>=(height-(board[0].length*20))/2 && mouseY<=((height-(board[0].length*20))/2)+(board[0].length*20))) {
      if (!flagMode) { //reveal if not in flagging mode
        board[(mouseX-(width-(board.length*20))/2)/20][(mouseY-(height-(board[0].length*20))/2)/20].reveal();
        if (board[(mouseX-(width-(board.length*20))/2)/20][(mouseY-(height-(board[0].length*20))/2)/20].id == -1) { //if mine revealed, you lose
          gameOver = true;
        }
      } else { //flag if in flagging mode
        board[(mouseX-(width-(board.length*20))/2)/20][(mouseY-(height-(board[0].length*20))/2)/20].flag();
      }
    } else if ((mouseX>=575 && mouseX<=625) && (mouseY>=100 && mouseY<=150)) { //enable/disable flag mode
      flagMode = !flagMode;
    } else if ((mouseX > 25 && mouseX < 225) && (mouseY > 25 && mouseY < 100)) { //exit button
      boardSet = false;
      gameOver = false;
      bg = Background.MENU;
      diff = Difficulty.NONE;
      clear();
    } else if ((mouseX > 950 && mouseX < 1125) && (mouseY > 25 && mouseY < 100)) { //restart button
      boardSet = false;
      gameOver = false;
      flagCount = mineCount;
      timer -= millis();
      clear();
    }
    break;
  default:
    println("Error, if you see this message, something broke!");
    break;
  }
}

void generateBoard(tile[][] arr) {  //builds base board
  for (int i=0; i<arr.length; i++) {
    for (int j=0; j<arr[0].length; j++) {
      arr[i][j].build((i*20)+((width-(arr.length*20))/2), (j*20)+((height-(arr[0].length*20))/2));
    }
  }
}

void generateMines() { //generates mines, then assigns ids
  int randNumX;
  int randNumY;
  for (int i=0; i<mineCount; i++) { //placing mines
    randNumX = (int)random(board.length);
    randNumY = (int)random(board[0].length);
    while (board[randNumX][randNumY].id == -1) { //if spot taken, keep generating until its not
      randNumX = (int)random(board.length);
      randNumY = (int)random(board[0].length);
    }
    board[randNumX][randNumY].id = -1;
  }
  for (int i=0; i<board.length; i++) { //assigning ids
    for (int j=0; j<board[0].length; j++) {
      if (board[i][j].id == -1) { //skip mines of course
        continue;
      } else {
        board[i][j].id = board[i][j].assignNumber(i, j);
      }
    }
  }
}

void revealBoard() { //reveals entire board
  for (int i=0; i<board.length; i++) {
    for (int j=0; j<board[0].length; j++) {
      if (board[i][j].isFlagged) { //unflags flagged tiles so it can be revealed
        board[i][j].isFlagged = false;
      }
      board[i][j].reveal();
    }
  }
}

void checkWinCondition() {
  if (gameOver) { // if lost, play game over stuff
    boom.play();
    gameOver = false;
    revealBoard();
    textSize(150);
    fill(0);
    text("Game Over!", 200, 400);
  }
  if (flagCount == 0) { //if all flags placed, check to see if they are all on top of mines
    int minesFlagged = 0;
    for (int i=0; i<board.length; i++) {
      for (int j=0; j<board[0].length; j++) {
        if (board[i][j].id == -1 && board[i][j].isFlagged) {
          minesFlagged++;
        }
      }
    }
    if (minesFlagged == mineCount) { //if all flags are on mines, you win, if not, keep trying!
      revealBoard();
      textSize(150);
      fill(0);
      text("You Win!", 200, 400);
    }
  }
}

void setupBoard() { //generates entire board
  for (int i=0; i<board.length; i++) {
    for (int j=0; j<board[0].length; j++) {
      board[i][j] = new tile();
    }
  }
  generateBoard(board);
  generateMines();
  boardSet = true;
}
