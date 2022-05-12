
Propagator p1 = new Propagator();
Propagator p2 = new Propagator();



void setup() {
  size(800, 800);
  background(0, 0, 0);
  frameRate(600);
  p1.seedX=width/2; p1.x1=width/2; p1.x2=width/2; 
  p1.seedY=height/2; p1.y1=height/2; p1.y2=height/2; 
  p2.seedX=width/2+1; p2.x1=width/2+1; p2.x2=width/2+1; 
  p2.seedY=height/2+1; p2.y1=height/2+1; p2.y2=height/2+1; 
  
  p1.r=255;p1.g=255;p1.b=200;
  p2.r=255;p2.g=100;p2.b=80;
  
}

void draw() {
  p1.draw();
  p2.draw();
  
  if (keyPressed == true) {
    if (keyCode == UP) {
      saveFrame("1.png");
    }
  }
}

class Propagator {
  
  int seedX;
  int seedY;
  float x1;
  float x2;
  float y1;
  float y2;
  float r; 
  float g;
  float b;
  

  void draw() {
    fill(0, 0, 0, 0.1); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
    rect(0, 0, width, height); 
    stroke(r,g,b,70);
    strokeWeight(5);
    strokeCap(ROUND);
    line(x1,y1,x2,y2);
    
    x1=x2;y1=y2;
    x2=x1+(sin(noise(x1,y1)*360))*4;
    y2=y1+(cos(noise(x1,y1)*360))*4;
    
    
    if(x2>width){x2=0;x1=0;};
    if(y2>height){y2=0;y1=0;};
    if(x2<0){x2=width;x1=width;};
    if(y2<0){y2=height;y1=height;};
    
  }
  
  
}
