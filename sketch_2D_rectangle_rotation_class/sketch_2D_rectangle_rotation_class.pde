static class Coord {
  int x;
  int y;
  Coord() {
    x = 0;
    y = 0;
  }
  Coord(int x1, int y1) {
    x = x1;
    y = y1;
  }
}

Coord[] Rect = new Coord[4];
Coord[] RectRot = new Coord[4];
int[] RectX = new int[]{200, 400, 400, 200};
int[] RectY = new int[]{200, 200, 400, 400};
int deg = 0;

void setup() {
  int i;
  size(600, 600);
  background(255, 255, 255);
  for(i = 0; i<4 ; ++i) {
    Rect[i] = new Coord(RectX[i], RectY[i]);
  }
  rect_center(Rect);
}

void draw() {
  int i;
  for(i = 0; i < 4; ++i) {
    RectRot[i] = rot_deg(Rect[i], deg);
  };
  
  clear();
  background(255, 255, 255);
  draw_rect(RectRot);
  deg = (deg + 1) % 360;
  println(deg);
}

void draw_rect(Coord[] r) {
  int i;
  Coord[] r_hw = math2hwCoord_rect(r);
  
  for(i = 0; i < 4; ++i) {
    line(r_hw[i % 4].x, r_hw[i % 4].y, r_hw[(i+1) % 4].x, r_hw[(i+1) % 4].y);
  }
}

void rect_center(Coord[] r) {
  int xCenter;
  int yCenter;
  
  xCenter = (r[0].x + r[1].x + r[2].x + r[3].x) / 4;
  yCenter = (r[0].y + r[1].y + r[2].y + r[3].y) / 4;
  
  int i;
  for(i = 0; i < 4; ++i) {
    r[i].x = r[i].x - xCenter;
    r[i].y = r[i].y - yCenter;
  }
}

public static Coord math2hwCoord(Coord p) {
  Coord p_hw = new Coord();
  
  p_hw.x = p.x + 300;
  p_hw.y = -p.y + 300;
  
  return p_hw;
}

public static Coord[] math2hwCoord_rect(Coord[] r) {
  int i;
  Coord[] r_hw = new Coord[4];
  for(i = 0; i<4 ; ++i) {
    r_hw[i] = math2hwCoord(r[i]);
  }
  return r_hw;
}

public static Coord rot_deg(Coord p, int deg) {
  Coord pRot = new Coord();
  pRot.x = round(cos((float) deg*PI/180.0f)*(float) p.x - sin((float) deg*PI/180.0f)*(float) p.y);
  pRot.y = round(sin((float) deg*PI/180.0f)*(float) p.x + cos((float) deg*PI/180.0f)*(float) p.y);
  return pRot;
}
