/*Game made using Object Oriented Programming
 
 by Diya Gupta
 
 ****RULES****
 Clicking on the ball goves you one point and
 clicking anywhere else on the screen reduces your lives. 
 The aim of the game is to get as many points as possible 
 with the given number of lives.
 
 */


Ball b1;
boolean gameOver = false;

void setup() {
  size(500, 500);
  b1 = new Ball (250, 250, 50, 2, 5); //x-position, y-position, diameter, speed of ball, number of lives
  textSize(20);
}


void draw() {
  background(0);

  if (gameOver == false) {
    b1.display();
    b1.movement();
    b1.edgesCollision();
    b1.gameOver();
  }

  if (gameOver == true) {
    fill(255, 0, 0);
    textSize(30);
    text("Sorry, you are out of lives!", 50, 250);
    text("Click to restart the game", 60, 300);
  }
}

class Ball {
  float x;      //x position of the ball
  float y;      // y position of the ball
  float diameter;      // size of the ball
  float xSpeed;       //horizontal speed of the ball
  float r;
  float colour;
  int score = 0;
  int lives;

  Ball(int tempX, int tempY, int tempD, int speed, int tempLives) {
    x = tempX;
    y = tempY;
    diameter = tempD;
    xSpeed = speed;
    r = diameter/2;
    colour = 255;
    lives = tempLives;
  }

  //displays the ball, score, and lives
  void display() {
    fill (colour);
    ellipse (x, y, diameter, diameter);
    text("Score: "+score, 10, 20);
    text("Lives: "+lives, 400, 20);
  }

  //adds speed to the ball to ensure basic horizontal movement
  void movement() {
    x += xSpeed;
  }

  // checks for collision at the edges of the screen
  void edgesCollision() {
    if (x<r || x>(width-r) ) {
      xSpeed = -xSpeed;
    }
  }

  // Score Counter  
  void counter() {
    score ++; 
    //println("collided"); // for debugging
  }

  // check if player clicked on the ball and add to the counter or deduct lives
  void pressedCorrect() {
    if (dist(mouseX, mouseY, x, y )<=r+5) { 
      xSpeed = xSpeed*1.25;
      counter();
    } else {
      lives = lives -1;
    }
  }

  // check if out of lives
  void gameOver() {
    if (lives<=0) {
      gameOver = true;
    }
  }
}

void mouseClicked() {
  if (gameOver == false) {
    delay(100); //to show the player if they clicked on the ball or no
    b1.pressedCorrect();
  }
  if (gameOver == true) {
    gameOver = false;
    b1 = new Ball (250, 250, 50, 2, 5);
    textSize(20);
  }
}
