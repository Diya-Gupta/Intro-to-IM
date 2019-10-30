int total_squares_hori = 7;
int total_squares_verti = 5;
int big_square_length = 100;
int x;
int y;
int smallest_square_length = big_square_length/5;


void setup() {
  size(700, 500);
  background(255);
}

void draw() {
  noLoop();
  //making the grid with the big boxes
  strokeWeight(1);
  for (int i=0; i < total_squares_hori; i++) { //counting the number of squares drawn horizontally
    int x = i*big_square_length; // new x-axis point for next big square
    for (int w = 0; w < total_squares_verti; w++) { // counting the number of squares drawn vertically
      int y = w*big_square_length; // new y-axis point for next big square
      rect(x, y, big_square_length, big_square_length); // making the big square

      float new_x_point = random(x, x+big_square_length - smallest_square_length); //finding a random number for starting point of the smallest square
      float new_y_point = random(y, y+big_square_length - smallest_square_length);
      rect(new_x_point, new_y_point, 20, 20);

      // find a new random number that would tell you how many more squares to make
      float sq_num = random(0, 10);
      for (int k = 0; k < 6; k++) {
        rect(x+(k*sq_num), y+(k*sq_num), big_square_length-(k*20), big_square_length-(k*20));
      }

      //float randomizer = random(5, 15);
      //for (int k = 0; k<random(3, 5); k++)
      //{
      //  strokeWeight(1);

      //  rect(x+(k*randomizer), y+(k*randomizer), big_square_length-(k*20), big_square_length-(k*20));
      //}
    }
  }
}
