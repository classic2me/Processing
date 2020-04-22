static class Coord {
  int x;
  int y;
  int z;
  Coord() {
    x = 0;
    y = 0;
    z = 0;
  }
  Coord(int x1, int y1, int z1) {
    x = x1;
    y = y1;
    z = z1;
  }
}

Coord[] Cube = new Coord[8];
Coord[] CubeRot = new Coord[8];
int[] CubeX = new int[]{0, 200, 200,   0,   0, 200, 200,   0};
int[] CubeY = new int[]{0,   0, 200, 200,   0,   0, 200, 200};
int[] CubeZ = new int[]{0,   0,   0,   0, 200, 200, 200, 200};
int deg = 0;

void setup() {
  int i;
  size(800, 800, P3D);
  background(255, 255, 255);
  for(i = 0; i < 8 ; ++i) {
    Cube[i] = new Coord(CubeX[i], CubeY[i], CubeZ[i]);
  }
  center_cube(Cube);
}

void draw() {
  int mX, mY;
  int i;
  for(i = 0; i < 8; ++i) {
    CubeRot[i] = rot_deg(Cube[i], deg);
  };
  
  clear();
  background(255, 255, 255);
  mX = mouseX-400;
  mY = -mouseY+400;
  camera(0, 400, (mY)/tan(PI/4), 0, 0, 0, 0, 1, 0);
  draw_cube(CubeRot);
  deg = (deg + 1) % 360;
  println(mX, mY);
}

void draw_cube(Coord[] r) {
  Coord[] r_hw = math2hwCoord_cube(r);
  
  //fill(200);
  beginShape();
  vertex(r_hw[0].x, r_hw[0].y, r_hw[0].z);
  vertex(r_hw[1].x, r_hw[1].y, r_hw[1].z);
  vertex(r_hw[2].x, r_hw[2].y, r_hw[2].z);
  vertex(r_hw[3].x, r_hw[3].y, r_hw[3].z);
  endShape(CLOSE);
  beginShape();
  vertex(r_hw[4].x, r_hw[4].y, r_hw[4].z);
  vertex(r_hw[5].x, r_hw[5].y, r_hw[5].z);
  vertex(r_hw[6].x, r_hw[6].y, r_hw[6].z);
  vertex(r_hw[7].x, r_hw[7].y, r_hw[7].z);
  endShape(CLOSE);
  beginShape();
  vertex(r_hw[0].x, r_hw[0].y, r_hw[0].z);
  vertex(r_hw[3].x, r_hw[3].y, r_hw[3].z);
  vertex(r_hw[7].x, r_hw[7].y, r_hw[7].z);
  vertex(r_hw[4].x, r_hw[4].y, r_hw[4].z);
  endShape(CLOSE);
  beginShape();
  vertex(r_hw[3].x, r_hw[3].y, r_hw[3].z);
  vertex(r_hw[2].x, r_hw[2].y, r_hw[2].z);
  vertex(r_hw[6].x, r_hw[6].y, r_hw[6].z);
  vertex(r_hw[7].x, r_hw[7].y, r_hw[7].z);
  endShape(CLOSE);
  beginShape();
  vertex(r_hw[2].x, r_hw[2].y, r_hw[2].z);
  vertex(r_hw[1].x, r_hw[1].y, r_hw[1].z);
  vertex(r_hw[5].x, r_hw[5].y, r_hw[5].z);
  vertex(r_hw[6].x, r_hw[6].y, r_hw[6].z);
  endShape(CLOSE);
  beginShape();
  vertex(r_hw[1].x, r_hw[1].y, r_hw[1].z);
  vertex(r_hw[0].x, r_hw[0].y, r_hw[0].z);
  vertex(r_hw[4].x, r_hw[4].y, r_hw[4].z);
  vertex(r_hw[5].x, r_hw[5].y, r_hw[5].z);
  endShape(CLOSE);
}

void center_cube(Coord[] r) {
  int i;
  int xCenter = 0;
  int yCenter = 0;
  int zCenter = 0;
  
  for(i = 0; i < 8 ; ++i) {
    xCenter += r[i].x;
    yCenter += r[i].y;
    zCenter += r[i].z;
  }
  
  xCenter = xCenter/8;
  yCenter = yCenter/8;
  zCenter = zCenter/8;
 
  for(i = 0; i < 8; ++i) {
    r[i].x = r[i].x - xCenter;
    r[i].y = r[i].y - yCenter;
    r[i].z = r[i].z - zCenter;
  }
}

public static Coord math2hwCoord(Coord p) {
  Coord p_hw = new Coord();
  
  p_hw.x = p.x;
  p_hw.y = -p.y;
  p_hw.z = p.z;
  
  return p_hw;
}

public static Coord[] math2hwCoord_cube(Coord[] r) {
  int i;
  Coord[] r_hw = new Coord[8];
  for(i = 0; i < 8 ; ++i) {
    r_hw[i] = math2hwCoord(r[i]);
  }
  return r_hw;
}

public static Coord rot_deg(Coord p, int deg) {
  Coord pRot = new Coord();
  pRot.x = Math.round(cos((float) deg*PI/180.0f)*(float) p.x - sin((float) deg*PI/180.0f)*(float) p.y);
  pRot.y = Math.round(sin((float) deg*PI/180.0f)*(float) p.x + cos((float) deg*PI/180.0f)*(float) p.y);
  pRot.z = p.z;
  return pRot;
}
