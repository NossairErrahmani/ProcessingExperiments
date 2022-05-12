// import the library
import com.hamoid.*;

Propagator p1 = new Propagator();
Propagator p2 = new Propagator();
VideoExport videoExport;



void setup() {
  size(540,960);
  background(0, 0, 0);
  frameRate(300);
  
  //The 2 propagators will start at 2 adjacent positions
  p1.x1=width/2; p1.x2=width/2; 
  p1.y1=height/2; p1.y2=height/2; 
  p2.x1=width/2+1; p2.x2=width/2+0.1; 
  p2.y1=height/2+1; p2.y2=height/2+0.1; 
  
  p1.m=5;p2.m=5;
  
  p1.r=50;p1.g=255;p1.b=200;
  p2.r=255;p2.g=10;p2.b=155;
  
  videoExport = new VideoExport(this, "Perlin Propagator.mp4");
  videoExport.setFrameRate(1200);  
  videoExport.startMovie();
  
}

void draw() {
  
  videoExport.saveFrame();

  p1.draw();
  p2.draw();
  
  if (keyPressed == true) {
    if (keyCode == UP) {
      saveFrame("1.png");
    }
    if (keyCode == ESC) {
      videoExport.endMovie();
    }
  }
}

class Propagator {
  
  float x1;
  float x2;
  float y1;
  float y2;
  
  //Colors
  float r; 
  float g;
  float b;
  
  //Magniture
  float m;  

  void draw() {
    fill(0, 0, 0, 0.3); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
    rect(0, 0, width, height); 
    
    //Halo line
    stroke(r*1.4,g*1.4,b*1.4,4);
    strokeWeight(25);
    strokeCap(ROUND);
    line(x1,y1,x2,y2);
    
    //Main line
    stroke(r,g,b,60);
    strokeWeight(5);
    strokeCap(ROUND);
    line(x1,y1,x2,y2);
    
    x1=x2;y1=y2;
    x2=x1+(sin(noise(x1,y1)*360))*m;
    y2=y1+(cos(noise(x1,y1)*360))*m;
    
    
    if(x2>width){x2=0;x1=0;};
    if(y2>height){y2=0;y1=0;};
    if(x2<0){x2=width;x1=width;};
    if(y2<0){y2=height;y1=height;};
    
  }
  
  
}
