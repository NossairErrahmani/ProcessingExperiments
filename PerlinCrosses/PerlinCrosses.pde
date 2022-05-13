int rows = 30;
int files = 30;
Cross[] c = new Cross[rows*files];
float[] noises = new float[rows*files];


void setup() {
  size(600, 600);
  frameRate(120);
  for (int i = 0; i<rows*files; i++) {
    c[i]=new Cross();
    noises[i]=0;
  }
  
  
}

void draw() {
  float offsetX = width/(2*files);
  float offsetY = height/(2*rows);
  background(20, 50, 50);
  for (int r=0; r<rows; r++) {
    for (int f=0; f<files; f++) {

      float noiseAngle = noise(r*rows+f);//print(noiseAngle,"\n");
      c[r*rows+f].draw(f*width/files+offsetX, r*height/rows+offsetY, width/(rows*2), noiseAngle+frameCount/20);
    }
  }
}

class Cross {
  void draw(float x, float y, float l, float a) {
    stroke(255, 255, 255);
    strokeWeight(2);
    line(x-l*cos(a), y+l*sin(a), x+l*cos(a), y-l*sin(a));
    line(x-l*cos(a+radians(90)), y+l*sin(a+radians(90)), x+l*cos(a+radians(90)), y-l*sin(a+radians(90)));
  }
}
