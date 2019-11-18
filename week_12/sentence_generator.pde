/* Generative Text Output Assignment by Diya Gupta

 INSTRUCTIONS:
 Press the three buttons to change the subject, object, or the verb of the
 sentence being displayed on the screen and form new, funny sentences!
 
 */

import processing.serial.*; 

Serial myPort;

PFont f; //initializing the font
float x, y; //coordinates of text
int newSubject = 1;
int newVerb = 1;
int newObject = 1;

//Strings of text that will be displayed at random
String[] subject = new String[]{"I", "He", "She", "They", "My friends", "The dogs", "The men", "The girls", "We", "You", "Jane", "I will", "They will", "He will", "She will"};
String[] verb = new String[]{"ate", "read", "hate", "paint", "study", "kicked the", "caught the", "drank", "made" };
String[] object = new String[]{"food", "books", "code", "pencils", "posters", "arduinos", "bottles", "desks", "phones", "chairs", "humans", "hair", "pants", "coffee cups"};

void setup() {
  size(600, 600);
  f = createFont("Futura", 30);
  textFont(f, 30);
  x = width/2;
  y = height/2;
  fill(random(255), random(255), random(255));

  //add ports to use with arduino
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);
}


void draw() {
  background(255);
  textAlign(CENTER);
  line(width/3, 0, width/3, height); // drawing the first line to indicate clicking area
  line (2*width/3, 0, 2*width/3, height); //drawing the second line to indicate are

  text(subject[newSubject], width/5, y); //printing the subject
  text(verb[newVerb], width/2, y); //printing the verb
  text(object[newObject], 3.25*width/4, y); //printing the object
}

void serialEvent(Serial myPort) {
  int inByte = myPort.read();
  if (inByte == 'A') {
    newSubject = int(random(subject.length));
  }
  if (inByte == 'B') {
    newVerb = int(random(verb.length));
  }
  if (inByte == 'C') {
    newObject = int(random(object.length));
  }
  fill(random(255), random(255), random(255));
}

/***** Code from earlier version of sentence generator without using Arduino *****/

//void mousePressed() {
//  if (mouseX < width/3) {
//    newSubject = int(random(subject.length));
//    fill(random(255), random(255), random(255));
//  }
//  if (mouseX > width/3 && mouseX < 2*width/3) {
//    newVerb = int(random(verb.length));
//    fill(random(255), random(255), random(255));
//  }
//  if (mouseX> 2*width/3) {
//    newObject = int(random(object.length));
//    fill(random(255), random(255), random(255));
//  }
//}
