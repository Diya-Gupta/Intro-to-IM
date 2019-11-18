
int buttonSubject = 3;
int buttonVerb = 4;
int buttonObject = 5;

void setup() {
  Serial.begin(9600);
  pinMode (buttonSubject, INPUT);
  pinMode (buttonVerb, INPUT);
  pinMode (buttonObject, INPUT);

}

void loop() {

  int subjectPress = digitalRead (buttonSubject);
  int verbPress = digitalRead (buttonVerb);
  int objectPress = digitalRead (buttonObject);

  if (subjectPress == 1) {
    Serial.write('A');
  } if (verbPress == 1) {
    Serial.write('B');
  } if (objectPress == 1) {
    Serial.write('C');
  }

}
