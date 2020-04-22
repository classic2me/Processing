float rc = random(10, 50);
int red1 = 128;
int green1 = 128;
int blue1 = 128;
int red2 = 128;
int green2 = 128;
int blue2 = 128;
int red3 = 128;
int green3 = 128;
int blue3 = 128;
int red4 = 128;
int green4 = 128;
int blue4 = 128;

void setup(){
  size(500, 500);
  frameRate(30);
}

void draw(){
  fill(red1, green1, blue1);
  triangle(230, 275, 258, 220, 286, 275);
  
  fill(red2, green2, blue2);
  triangle(258, 220, 320, 220, 286, 275);

  fill(red3, green3, blue3);
  triangle(230, 275, 258, 220, 200, 220);

  fill(red4, green4, blue4);
  triangle(230, 275, 258, 325, 286, 275);
  
  if(frameCount == 5){
    if(red1 < 128){
      red1 += 30;
    }
    if(green1 < 128){
      green1 += 30;
    }
    if(blue1 < 128){
      blue1 += 30;
    }
    if(red2 < 128){
      red2 += 30;
    }
    if(green2 < 128){
      green2 += 30;
    }
    if(blue2 < 128){
      blue2 += 30;
    }
    if(red3 < 128){
      red3 += 30;
    }
    if(green3 < 128){
      green3 += 30;
    }
    if(blue3 < 128){
      blue3 += 30;
    }
    if(red4 < 128){
      red4 += 30;
    }
    if(green4 < 128){
      green4 += 30;
    }
    if(blue4 < 128){
      blue4 += 30;
    }
    red1 += random(-rc, rc);
    green1 += random(-rc, rc);
    blue1 += random(-rc, rc);
    red2 += random(-rc, rc);
    green2 += random(-rc, rc);
    blue2 += random(-rc, rc);
    red3 += random(-rc, rc);
    green3 += random(-rc, rc);
    blue3 += random(-rc, rc);
    red4 += random(-rc, rc);
    green4 += random(-rc, rc);
    blue4 += random(-rc, rc);
    
    frameCount = 0;
  }
  println(frameCount);
}
