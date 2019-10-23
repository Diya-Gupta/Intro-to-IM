void setup() {
  size(500, 500);
  background(255, 255, 255);
}

void draw() {
  /******* HAIR PART 1 **********/
  fill(0);
  noStroke();
  ellipse(250, 165, 240, 230); 
  rect(130, 165, 240, 170);
  
  /********** FACE **********/
  noStroke();
  fill(#C68863);
  ellipse(250, 200, 200, 250);
  
  /********** EYES AREA **********/
  //eye shape
  fill(240, 240, 240);
  //right
  ellipse(210, 175, 45, 23);
  triangle(310, 169, 310, 180, 316, 175); // out
  triangle(270, 169, 270, 180, 264, 175); //in
  //left
  ellipse(290, 175, 45, 23);
  triangle(190, 169, 190, 180, 184, 175); //left out
  triangle(230, 169, 230, 180, 236, 175); //left in
  //eyeballs
  stroke(0,0,0);
  fill(0, 0, 0);
  ellipse(210, 175, 20, 22); // right
  ellipse(290, 175, 20, 22); // left
  //left eyebrow
  fill(0, 0, 0);
  quad(200, 152, 233, 154, 232, 158, 200, 156);
  quad(200, 152, 180, 158, 180, 159, 200, 156);
  //right eyebrow
  quad(267, 154, 300, 152, 300, 156, 267, 158);
  quad(300, 152, 320, 158, 320, 159, 300, 156);
  
  /********** EARS **********/
  noStroke();
  fill(#C68863);
  ellipse(158, 200, 50, 60); //left ear
  ellipse(342, 200, 50, 60); //right ear

  /********** MOUTH **********/
  fill(240, 240, 240);
  stroke(190, 50, 50);
  strokeWeight(4);
  arc(250, 260, 70, 50, 0, radians(180), CHORD);
  
  /********** NOSE **********/
  noFill();
  stroke(#3D0C02);
  strokeWeight(2);
  arc(250, 220, 20, 20, 0, PI);
  
  
  /********** HAIR PART 2 **********/
  noStroke();
  fill(0);
  rotate(radians(45));
  ellipse(300, -145, 155, 30);
  
  rotate(radians(-85));
  fill(0);
  ellipse(85, 220, 160, 50);
  rotate(radians(85));
  rotate(radians(-45));
  
  /******* EARRINGS *******/
  stroke(249, 223, 30); //gold colour
  line(150, 220, 150, 235); // left line
  line(350, 220, 350, 235); // right line
  noStroke();
  fill(200, 230, 230);  // silver colour  
  ellipse(150, 240, 5, 10); // left circle
  ellipse(350, 240, 5, 10); // right circle
  
}
