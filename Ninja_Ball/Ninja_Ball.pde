//Ninja Ball
//add blinking press the ENTER key etc.
int score = 0;
int cash = 1000; //fix to zero after testing
int lives = 3; //fix to zero after testing
int trial = 1;
float randomy = random(15, 585);
int highscore = 0;
int jumphatlvl = 0;
int speedshoeslvl = 0;
int msgtimer = 0; //message timer
Platform pf = new Platform(300, 550, 255);
Player me = new Player(150, 400);
Enemy spike = new Enemy(585, 535, 20, 1);
Powerups coin = new Powerups((int)randomy, 527);
//Helmets jump = new Helmets (me.cx, me.cy, 20);

String errormessage = "";
String C = "";
String R = "";
String J = "";
String S = "";
String shop = "";
int state = 0;

void setup() {
  size(600, 600);
}

void keyPressed() {
  if (keyCode == LEFT) {
    me.left();
  } else if (keyCode == RIGHT) {
    me.right();
  } else if (keyCode == UP) {
    me.up();
  }
  if (key=='c') {
    buyLife();
  }
  if (key=='r') {
    slowSpike();
  }
  if (key=='j' && cash >= 100) {
    me.helmeton = true;
    if (jumphatlvl < 5) {
      me.cvyjump -= 0.5;
      cash -= 100;
      jumphatlvl += 1;
    }
  } else if (key =='j' && cash < 100) {
    textSize(20);
    errormessage = "YOU DON'T HAVE ENOUGH MONEY"; //, 120, 100);
    msgtimer = 50;
  }
  if (key=='s' && cash >= 100) {
//    me.helmeton = true;
    if (speedshoeslvl < 5) {
      me.cvxspeed += 0.7;
      cash -= 100;
      speedshoeslvl += 1;
    }
  } else if (key =='s' && cash < 100) {
    textSize(20);
    errormessage = "YOU DON'T HAVE ENOUGH MONEY"; //, 120, 100);
    msgtimer = 50;
  }
  if (key=='u') {
    showupgrade();
  }
  //  println(keyCode);
}

void keyReleased() {
  if (me.cvx < 0 && keyCode == LEFT) {
    me.cvx = 0;
  }
  if (me.cvx > 0 && keyCode == RIGHT) {
    me.cvx = 0;
  }
  //  println(keyCode);
}

void draw() {
  if (state == 0) {
    pf.draw();
    me.draw(pf);
    spike.draw(me);
    //    if (score > 5) {
    //      spike.draw(me);      
    //    }
    coin.draw(me);
    fill(0);
    if (msgtimer == 0) {
      errormessage = "";
      C = "";
      R = "";
      J = "";
      S = "";
      shop = "";
    }
    text(errormessage, 120, 200);
    fill(66, 244, 212);
    text(shop, 10, 100);
    fill(0, 0, 0);
    text(C, 10, 120);
    text(R, 10, 140);
    text(J, 10, 160);
    text(S, 10, 180);
    
    if (msgtimer > 0) {
      msgtimer -= 1;
    }
    fill(0);
    textSize(20);
    text("HIGHSCORE: " + highscore, 450, 20);
    text("Trial #: "+trial, 450, 50);
    text("SCORE: "+score, 10, 20);
    text("CASH: "+cash, 160, 20);
    text("LIFE: "+lives, 310, 20);
    text("JUMP HAT'S LVL: "+jumphatlvl, 10, 40);
    text("SPEED SHOES'S LVL: "+speedshoeslvl, 10, 60);
    text("U = UPGRADE SHOP", 10, 80);
    if (lives <= 0) {
      state = 1;
    }
    if (score > highscore) {
      highscore = score;
    }
  } else if (state==1) {
    gameOver();
  }
}

class Helmets {
  float len;
  float hscale;
  float yoff;
  Helmets(float jl, float sc, float yo) {
    len = jl;
    hscale = sc;
    yoff = yo;
  }
  void draw(float jhx, float jhy) {
    float x1, y1, x2, y2, x3, y3;
    jhy = jhy + yoff;
    x1 = -len / 2 + jhx;
    y1 = 0 + jhy;
    x2 = len / 2 + jhx;
    y2 = 0 + jhy;
    x3 = 0 + jhx;
    y3 = -len / 2 * tan(2*PI * 60.0 / 360)*hscale + jhy;
    fill(0, 0, 255);
    triangle(x1, y1, x2, y2, x3, y3);
  }
}

void slowSpike() {
  if (cash >= 50) {
    cash -= 50;
    spike.es = 1;
  } else if (cash < 50) {
    textSize(20);
    errormessage = "YOU DON'T HAVE ENOUGH MONEY"; //, 120, 100);
    msgtimer = 50;
  }
}

void buyLife() {
  if (cash >= 25) {
    cash -= 25;
    lives++;
  } else if (cash < 25) {
    textSize(20);
    errormessage = "YOU DON'T HAVE ENOUGH MONEY"; //, 120, 100);
    msgtimer = 50;
  }
}

void gameOver() {  
  background(255);
  score = 0;
  fill(255, 0, 0);
  textSize(80);
  text("GAME OVER", 60, 180);

  fill(0);
  textSize(30);
  if(frameCount % 60 < 30) {
    fill(0);
  }else{
    fill(255,255,255);
  }
  text("Press the ENTER key to play again", 60, 240);

  //noLoop();
  if (keyCode == ENTER) {
    lives = 3;
    state = 0;
    trial += 1;
    spike.es = 1;
    spike.ex = 585;
    spike.ey = 535;
  }
}

class Powerups {
  int pux;
  int puy;
  Powerups(int x, int y) {
    pux = x;
    puy = y;
  }
  void draw(Player m) {
    fill(255, 255, 0);
    ellipse(pux, puy, 15, 15);
    if ( dist(m.cx, m.cy, pux, puy) < 15) {
      cash++;
      pux = (int)random(15, 585);
    }
  }
}

class Enemy {
  int ex;
  int ey;
  float len;
  float x1, y1, x2, y2, x3, y3;
  float es; //speed
  Enemy(int x, int y, float l, float s) {
    ex = x;
    ey = y;
    len = l;
    es = s;
  }
  void draw(Player m) {
    fill(255, 0, 0);
    x1 = -len / 2 + ex;
    y1 = 0 + ey;
    x2 = len / 2 + ex;
    y2 = 0 + ey;
    x3 = 0 + ex;
    y3 = -len / 2 * tan(2*PI * 60.0 / 360) + ey;
    triangle(x1, y1, x2, y2, x3, y3);
    ex -= es;
    if ( ex < 0) {
      ex += width;
      score++;
      es += 0.25;
    }
    if (lives > 0) {
      if ( dist(m.cx, m.cy, ex, ey) < 15) {
        lives--;
        m.cx = 0;
        m.cx = 150;
        m.cy = 400;
        //      score--;
      }
    }
    //if(ex > m.cx || ex < m.cx || ex != 15) {
    //  ex -= 5;
    //}
  }
}

class Platform {
  float px;
  float py;
  float bc; //background color
  Platform(int x, int y, int c) {
    px = x;
    py = y;
    bc = c;
  }
  void draw() {
    background(bc);
    fill(0);
    rectMode(CENTER);
    rect(px, py, 800, 30);
    data();
  }
}

class Player {
  float cx;
  float cy;
  float cvx;
  float cvy;
  float cvyjump;
  float cvxspeed;
  boolean canjump;
  boolean helmeton;
  Helmets jh;
  Player(int x, int y) {
    cx = x;
    cy = y;
    canjump = true;
    cvx = 0;
    cvy = 0;
    cvyjump = -5;
    cvxspeed = 5;
    helmeton = false;
    jh = new Helmets(27, 0.3, -8);
  }
  void left() {
    cvx = -1 * cvxspeed;
    //    if (cx > 15) {
    //      cx -= 5;
    //    }
  }
  void right() {
    cvx = cvxspeed;
    //    if (cx < 585) {
    //      cx += 5;
    //    }
  }
  void up() {
    //    jump();
    //    println(canjump);
    if (canjump == true) {
      cvy = cvyjump;
      cy = cy + cvy;
    }
  }
  void draw(Platform a) {    
    if (cx > 585) {
      cvx = 0;
      cx = 585;
    }
    if (cx < 15) {
      cvx = 0;
      cx = 15;
    }

    if (cy < a.py-28) {
      cvy = cvy + 0.2;
      canjump = false;
    } else {
      cvy = 0;
      canjump = true;
      cy = a.py-28;
    }
    cx = cx + cvx;
    cy = cy + cvy;
    //    println("cy: "+ cy);
    //    println("cx: " + cx);
    //    println("cvy: "+ cvy);
    //    println("cvx: " + cvx);

    fill(0);
    ellipse(cx, cy, 25, 25);

    fill(255);
    ellipse(cx+5, cy-2, 10, 10);
    ellipse(cx-5, cy-2, 10, 10);

    if (lives == 0) {
      cx = 150;
      cy = 400;
      lives = 3;
    }
    if (helmeton == true) {
      jh.draw(cx, cy);
    }
  }
  //  void jump() {
  //    for(int i = 0 ; i < 10 ; i++) {
  //        cy -= 8;
  //        delay(10);
  //    }
  //    delay(100);
  //  }
}

void showupgrade() {
  C = "C = 1+  life (takes $25)";
  R = "R = slows spike speed (takes $50)";
  J = "J = jump higher helmet (takes $100(5 lvls))";
  S = "S = speed shoes (takes $100(5lvls))";
  shop = "SHOP:";
  msgtimer = 200;
}

//TESTING DATA
void data() {
  println("score: "+score);
  println("cash: "+cash);
  println("lives: "+lives);
  println("jumphatlvl: "+jumphatlvl);
  println("speedshoeslvl: "+speedshoeslvl);
  println("msgtimer: "+msgtimer);
  println("player x: "+me.cx);
  println("player y: "+me.cy);
  println("player velocity x: "+me.cvx);
  println("player velocity y: "+me.cvy);
  println();
}
