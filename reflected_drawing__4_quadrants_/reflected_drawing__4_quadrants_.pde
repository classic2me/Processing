//color rgb
int colorR = 0;
int colorG = 0;
int colorB = 0;

//grid on/off (0 = on | 1 = off)
int gridstate = 1;

//current mouse quadrant
int quadrant = 0;

void setup() {
  size(600, 600);
  background(255, 255, 255);
  menu();
}

void draw() {
//draw grid
  if (gridstate == 0) {
    stroke(0, 0, 0);
    line(300, 0, 300, 520);
    line(0, 260, 600, 260);
  }
  else if (gridstate == 1) {
    stroke(255, 255, 255);
    line(300, 0, 300, 520);
    line(0, 260, 600, 260);
  }
  data();
}

void mouseDragged() {
  if (mouseX > 300 && mouseY < 260 && mouseY > 0) {
    quadrant = 1;
  }
  else if (mouseX < 300 && mouseY < 260) {
    quadrant = 2;
  }
  else if (mouseX < 300 && mouseY > 260 && mouseY < 520) {
    quadrant = 3;
  }
  else if (mouseX > 300 && mouseY > 260 && mouseY < 520) {
    quadrant = 4;
  }
  else if (mouseX < 0 || mouseX > 600 || mouseY < 0 || mouseY > 520) {
    quadrant = 0;
  }
  
  if (quadrant != 0) {
    noStroke();
    fill(colorR, colorG, colorB);
  }
  if (quadrant == 1) {
    noStroke();
    fill(colorR, colorG, colorB);
    circle (mouseX, mouseY, 1);
    circle (600 - mouseX, mouseY, 1);
    circle (600 - mouseX, 520 - mouseY, 1);
    circle (mouseX, 520 - mouseY, 1);
  }
  if (quadrant == 2) {
    noStroke();
    fill(colorR, colorG, colorB);
    circle (mouseX, mouseY, 1);
    circle (600 - mouseX, mouseY, 1);
    circle (600 - mouseX, 520 - mouseY, 1);
    circle (mouseX, 520 - mouseY, 1);
  }
  if (quadrant == 3) {
    noStroke();
    fill(colorR, colorG, colorB);
    circle (mouseX, mouseY, 1);
    circle (600 - mouseX, mouseY, 1);
    circle (600 - mouseX, 520 - mouseY, 1);
    circle (mouseX, 520 - mouseY, 1);
  }
  if (quadrant == 4) {
    noStroke();
    fill(colorR, colorG, colorB);
    circle (mouseX, mouseY, 1);
    circle (600 - mouseX, mouseY, 1);
    circle (600 - mouseX, 520 - mouseY, 1);
    circle (mouseX, 520 - mouseY, 1);
  }
}

void keyPressed() {
  if (key == 'g'){
    if (gridstate == 0) {
      gridstate = 1;
    }
    else if (gridstate == 1) {
      gridstate = 0;
    }
  }
  if (key == 'r') {
    clear();
    background(255, 255, 255);
    menu();
  }
  if (key == 'c') {
    fill (0, 0, 0);
    textSize(15);
    text("work in progress", 250, 550);
  }
}

void menu() {
  stroke(0, 0, 0);
  fill(235, 255, 252);
  rect(0, 520, 600, 80, 7);
  fill(0, 0, 0);
  textSize(15);
  text("Reflection across 4 quadrants", 10, 540);
  textSize(12);
  text("press 'g' key to toggle grid", 10, 555);
  text("press 'r' key to clear all", 10, 575);
  text("press 'c' key to change color", 10, 595);
  textSize(15);
  text("color:", 520, 545);
  fill(colorR, colorG, colorB);
  rect(520, 550, 50, 25, 7);
  textSize(10);
  text(colorR + ", " + colorG + ", " + colorB, 520, 588);
  
}

void data() {
  println("gridstate:" + gridstate);
  println("quadrant:" + quadrant);
  println("mouseX:" + mouseX);
  println("mouseY:" + mouseY);
}
