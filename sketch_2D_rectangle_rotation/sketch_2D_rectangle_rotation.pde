int[] RectX = new int[]{200, 400, 400, 200};
int[] RectY = new int[]{200, 200, 400, 400};
int deg;

void setup() {
  size(600, 600);
  background(255, 255, 255);
  deg = 0;
};

void draw() {
  RectX = rectXcenter(RectX);
  RectY = rectXcenter(RectY);
  int i;
  int[] RectXrot = new int[4];
  int[] RectYrot = new int[4];
  for(i = 0; i < 4; ++i) {
    RectXrot[i] = rotX(RectX[i], RectY[i], deg);
    RectYrot[i] = rotY(RectX[i], RectY[i], deg);
  };
  
  clear();
  background(255, 255, 255);
  rectA(RectXrot, RectYrot);
  deg = (deg + 1) % 360;
};

void rectA(int[] rectX, int[] rectY) {
  int i;
  for(i = 0; i < 4; ++i) {
    point(math2hwX(rectX[i]), math2hwY(rectY[i]));
    line(math2hwX(rectX[i % 4]), math2hwX(rectX[(i+1) % 4]), math2hwY(rectY[i % 4]), math2hwY(rectY[(i+1) % 4]));
  };
};

public static int[] rectXcenter(int[] rectX) {
  int xCenter;
  xCenter = (rectX[0] + rectX[1] + rectX[2] + rectX[3]) / 4;
  
  int[] centRectX = new int[4];
  
  int i;
  for(i = 0; i < 4; ++i) {
    centRectX[i] = rectX[i] - xCenter;
  };
  return centRectX;
};

public static int math2hwX(int x) {
  return x + 300;
};

public static int math2hwY(int y) {
  return -y + 300;
};

public static int[] math2hwXrect(int[] rectX) {
  int i;
  int[] rectXhw = new int[4];
  for(i = 0; i < 4; ++i) {
    rectXhw[i] = math2hwX(rectX[i]);
  };
  return rectXhw;
};

public static int[] math2hwYrect(int[] rectY) {
  int i;
  int[] rectYhw = new int[4];
  for(i = 0; i < 4; ++i) {
    rectYhw[i] = math2hwX(rectY[i]);
  };
  return rectYhw;
};

public static int rotX(int x, int y, int deg) {
  return Math.round(cos((float) deg*3.141592654f/180.0f)*(float) x - sin((float) deg*3.141592654f/180.0f)*(float) y);
};

public static int rotY(int x, int y, int deg) {
  return Math.round((sin((float) deg*3.141592654f/180.0f)*(float) x + cos((float) deg*3.141592654f/180.0f)*(float) y));
};
