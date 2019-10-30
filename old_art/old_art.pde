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


      // making the smaller squares
      float sq_num = random(10, 15);
      for (int k = 0; k < random(2, 5); k++) {
        rect(x+(k*sq_num), y+(k*sq_num), big_square_length-(k*20), big_square_length-(k*20));
      }

    }
  }
}
