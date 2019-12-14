import processing.serial.*; 

Serial myPort;
PFont f; //initializing the font


int total = 0; // counter for total CO2
int numActivitiesDone = 0; // counts the number of activities scanned. Triggers action when == 4

//counters for catching multiple scans
int scanNumPlasticBottle = 0;
int scanNumReusableBottle = 0;
int scanNumStarbucksCup = 0;
int scanNumReusableCup = 0;
int scanNumReusableBag = 0;
int scanNumPlasticBag = 0;
int scanNumStairs = 0;
int scanNumElevator = 0;

// boolean that triggers the warning to not scan multiple times
boolean multipleScan = false;
boolean sameActivity = false;

// booleans to distribute the game into three halves: the first, second, and third screen
boolean firstHalf = true;
boolean secondHalf = false;
boolean veryStart = false;


//plastic bottle booleans
boolean plasticBottleMultiple = false;
boolean plasticBottle = false;
// reusable bottle booleans
boolean reusableBottleMultiple = false;
boolean reusableBottle = false;
//starbucks cup booleans
boolean starbucksCupMultiple = false;
boolean starbucksCup = false;
//reusable cup booleans
boolean reusableCupMultiple = false;
boolean reusableCup = false;
//reusable bag booleans
boolean reusableBagMultiple = false;
boolean reusableBag = false;
//plastic bag booleans
boolean plasticBagMultiple = false;
boolean plasticBag = false;
//stairs booleans
boolean stairsMultiple = false;
boolean stairs = false;
//elevators booleans
boolean elevatorMultiple = false;
boolean elevator = false;


//images
PImage imgPlasticBottle;
PImage imgReusableBottle;
PImage imgStarbucksCup;
PImage imgReusableCup;
PImage imgReusableBag;
PImage imgPlasticBag;
PImage imgStairs;
PImage imgElevator;

// code for counting how long the warning text is on the screen for
int holdsecond = second();
int howlongtoshow = 2;

void setup() {
  size(1440, 850);
  //size(600, 600);
  f = createFont("Futura", 30); //initializing the font
  textFont(f, 30);
  background(191, 228, 118);

  //add ports to use with arduino
  String portName = Serial.list()[2];
  //printArray(Serial.list());
  myPort = new Serial(this, portName, 115200);

  // loading the images
  imgPlasticBottle = loadImage("imgPlasticBottle.png");
  imgReusableBottle = loadImage("imgReusableBottle.png");
  imgStarbucksCup = loadImage("imgStarbucksCup.png");
  imgReusableCup = loadImage("imgReusableCup.png");
  imgReusableBag = loadImage("imgReusableBag.png");
  imgPlasticBag = loadImage("imgPlasticBag.png");
  imgStairs = loadImage("imgStairs.png");
  imgElevator = loadImage("imgElevator.png");
}


void draw() {
  background(191, 228, 118);
  textAlign(CENTER);

  //***** code for flashing text
  if (multipleScan == true) {
    fill (255, 0, 0);
    textSize(20);
    text("Please scan each item only once!", width/2, 5.9*height/6);
    textSize(30);
    fill(0);
  }
  if (second() == holdsecond) {
    multipleScan = false;
  } 
  //**** End of flashing text code

  // if the user scans tag from same activity
  if (sameActivity == true) {
    fill (255, 0, 0);
    textSize(20);
    text("Please scan only one activity from each set!", width/2, 5.9*height/6);
    textSize(30);
    fill(0);
  }
  if (second() == holdsecond) {
    sameActivity = false;
  } 

  // first screen code
  if (veryStart == true) {
    firstHalf = false;
    textSize(40);
    fill(17, 30, 108);
    text("Welcome! Calculate your carbon footprint here.", width/2, height/4);
    textSize(30);
    fill(17, 120, 108);
    text(" Pick up each pair of activities and scan the one that you do most frequently.", width/2, 1.5*(height/4));
    textSize(25);
    fill(17, 200, 150);
    text("Scan an item to start!", width/2, 2*(height/4));
  }

  // after the first tag is scanned
  if (numActivitiesDone >= 1) {
    veryStart = false;
    if (numActivitiesDone < 4) {
      firstHalf = true;
    } else if (numActivitiesDone >=4) {
      firstHalf = false;
      secondHalf = true;
    }
  }

  //****** specific carbon footprints *****//
  ////////// of plastic bottle
  if (firstHalf == true) {
    if (plasticBottle == true) {
      image(imgPlasticBottle, width/10, height/20, width/10, (width/10)*2);
    }
    // of reusable bottle
    if (reusableBottle == true) {
      image(imgReusableBottle, width/10, height/20, width/10, (width/10)*2);
    }

    /////// of Starbucks Cup
    if (starbucksCup == true) {
      image(imgStarbucksCup, 3*(width/10), height/4, width/10, (width/10)*2);
    }
    // of Reusable Cup
    if (reusableCup == true) {
      image(imgReusableCup, 3*(width/10), height/4, width/10, (width/10)*2);
    }

    ////////// of Plastic Bag
    if (plasticBag == true) {
      image(imgPlasticBag, 5*(width/10), height/20, width/10, (width/10)*2);
    }
    // of Reusable Bag
    if (reusableBag == true) {
      image(imgReusableBag, 5*(width/10), height/20, width/10, (width/10)*2);
    }

    //////// of Stairs
    if (stairs == true) {
      image(imgStairs, 7*(width/10), height/4, width/10, (width/10)*2);
    }
    // of Elevator
    if (elevator == true) {
      image(imgElevator, 7*(width/10), height/4, width/10, (width/10)*2);
    }


    //***** text that is always there (total CO2)****//

    fill(0);
    textSize(30);
    text("Your total CO2 emmissions are: ", width/2, 6*height/8);
    textSize(40);
    text(total+" kg CO2", width/2, 6.5*height/8);
  }

  // change screen when 4 activities are scanned
  if (numActivitiesDone == 4) {
    firstHalf = false;
    //delay(2000);
    textSize(25);
    text("You have used up "+total+" kg CO2 with these activities.", width/2, 60);
    text("You can reduce your carbon footprint by doing these alternatives instead: ", width/2, 120);
    line(0, height/6, width, height/6); // first line at the top
    line(0, 4.8*(height/5), width, 4.8*(height/5)); // second line at the bottom
    textSize(20);
    text("Scan the reset tag to restart the game!", width/2, 5.9*height/6);
    textSize(15);
    if (plasticBottle == true) {
      image(imgPlasticBottle, width/4, height/5, width/20, (width/20)*2);
      text("The plastic bottle can be replaced by a reusable one", width/2, 250);
      image(imgReusableBottle, 3*(width/4), height/5, width/20, (width/20)*2);
    } else if (reusableBottle == true) {
      fill (17, 120, 108);
      text("Good job! You are already using the sustainable method to drink water!", width/2, 250);
      fill(0);
    }
    if (starbucksCup == true) {
      image(imgStarbucksCup, width/4, 2*(height/5), width/20, (width/20)*2);
      text("The one-use cup can be replaced by a reusable one", width/2, 450);
      image(imgReusableCup, 3*(width/4), 2*(height/5), width/20, (width/20)*2);
    } else if (reusableCup == true) {
      fill (17, 120, 108);
      text("Good job! You are already using the sustainable method to drink coffee!", width/2, 450);
      fill(0);
    }
    if (plasticBag == true) {
      image(imgPlasticBag, width/4, 3*(height/5), width/20, width/10);
      text("The plastic bag can be replaced by a cloth one", width/2, 600);
      image(imgReusableBag, 3*(width/4), 3*(height/5), width/20, width/10);
    } else if (reusableBag == true) {
      fill (17, 120, 108);
      text("Good job! You are already using the sustainable method for shopping!", width/2, 600);
      fill(0);
    }
    if (elevator == true) {
      image(imgElevator, width/4, 4*(height/5), width/20, width/10);
      text("Taking the elevator can be replaced by taking the stairs", width/2, 750);
      image(imgStairs, 3*(width/4), 4*(height/5), width/20, width/10);
    } else if (stairs == true) {
      fill (17, 120, 108);
      text("Good job! You are already using the sustainable method for climbing a floor!", width/2, 750);
      fill(0);
    }
  }
}

void serialEvent(Serial myPort) {
  int inByte = myPort.read();
  println(inByte);

  //plastic bottle
  if (inByte == 65) {
    if (reusableBottle == true) {
      sameActivity = true;
    } else if (scanNumPlasticBottle == 0) {
      total += 60;
      scanNumPlasticBottle += 1;
      numActivitiesDone +=1;
      plasticBottle = true;
    } else if (scanNumPlasticBottle >= 1) {
      total += 0;
      multipleScan = true;
    }
  }
  //reusable bottle
  if (inByte == 66) {
    if (plasticBottle == true) {
      sameActivity = true;
    } else if (scanNumReusableBottle == 0) {
      total += 4;
      scanNumReusableBottle += 1;
      numActivitiesDone +=1;
      reusableBottle = true;
    } else if (scanNumReusableBottle >= 1) {
      total += 0;
      multipleScan = true;
    }
  }

  //starbucks cups
  if (inByte == 67) {
    if (reusableCup == true) {
      sameActivity = true;
    } else if (scanNumStarbucksCup == 0) {
      total += 336;
      scanNumStarbucksCup += 1;
      numActivitiesDone +=1;
      starbucksCup = true;
    } else if (scanNumStarbucksCup >= 1) {
      total += 0;
      multipleScan = true;
    }
  }
  //reusable cup
  if (inByte == 68) {
    if (starbucksCup == true) {
      sameActivity = true;
    } else if (scanNumReusableCup == 0) {
      total += 5;
      scanNumReusableCup += 1;
      numActivitiesDone +=1;
      reusableCup = true;
    } else if (scanNumReusableCup >= 1) {
      total += 0;
      multipleScan = true;
    }
  }

  //plastic bag
  if (inByte == 70) {
    if (reusableBag == true) {
      sameActivity = true;
    } else if (scanNumPlasticBag == 0) {
      total += 30;
      scanNumPlasticBag += 1;
      numActivitiesDone +=1;
      plasticBag = true;
    } else if (scanNumPlasticBag >= 1) {
      total += 0;
      multipleScan = true;
    }
  }
  //reusable bag
  if (inByte == 69) {
    if (plasticBag == true) {
      sameActivity = true;
    } else if (scanNumReusableBag == 0) {
      total += 3;
      scanNumReusableBag += 1;
      numActivitiesDone +=1;
      reusableBag = true;
    } else if (scanNumReusableBag >= 1) {
      total += 0;
      multipleScan = true;
    }
  }

  // stairs
  if (inByte == 71) {
    if (elevator == true) {
      sameActivity = true;
    } else if (scanNumStairs == 0) {
      total += 0;
      scanNumStairs += 1;
      numActivitiesDone +=1;
      stairs = true;
    } else if (scanNumStairs >= 1) {
      total += 0;
      multipleScan = true;
    }
  }
  // elevators
  if (inByte == 72) {
    if (stairs == true) {
      sameActivity = true;
    } else if (scanNumElevator == 0) {
      total += 144;
      scanNumElevator += 1;
      numActivitiesDone +=1;
      elevator = true;
    } else if (scanNumElevator >= 1) {
      total += 0;
      multipleScan = true;
    }
  }

  //restart
  if (inByte == 73) {
    reset();
  }
  //code for error text that flashes to account for seconds going over 60
  if (second() > 59-howlongtoshow) {
    holdsecond = howlongtoshow+second()-60;
  } else {
    holdsecond = second() + howlongtoshow;
  }
}

// troubleshooting code
//void keyPressed() {
//  reset();
//}


//resetting everything after the reset tag is scanned
void reset() {
  total = 0;
  numActivitiesDone = 0;

  //counters for catching multiple scans
  scanNumPlasticBottle = 0;
  scanNumReusableBottle = 0;
  scanNumStarbucksCup = 0;
  scanNumReusableCup = 0;
  scanNumReusableBag = 0;
  scanNumPlasticBag = 0;
  scanNumStairs = 0;
  scanNumElevator = 0;

  // boolean that triggers the warning to not scan multiple times
  multipleScan = false;
  sameActivity = false;

  firstHalf = false;
  secondHalf = false;
  veryStart = true;


  //plastic bottle booleans
  plasticBottleMultiple = false;
  plasticBottle = false;
  // reusable bottle booleans
  reusableBottleMultiple = false;
  reusableBottle = false;
  //starbucks cup booleans
  starbucksCupMultiple = false;
  starbucksCup = false;
  //reusable cup booleans
  reusableCupMultiple = false;
  reusableCup = false;
  //reusable bag booleans
  reusableBagMultiple = false;
  reusableBag = false;
  //plastic bag booleans
  plasticBagMultiple = false;
  plasticBag = false;
  //stairs booleans
  stairsMultiple = false;
  stairs = false;
  //elevators booleans
  elevatorMultiple = false;
  elevator = false;
}
