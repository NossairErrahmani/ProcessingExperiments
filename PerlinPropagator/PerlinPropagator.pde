// import the library
import com.hamoid.*;

Propagator p1 = new Propagator();
Propagator p2 = new Propagator();
Propagator p3 = new Propagator();
VideoExport videoExport;



void setup() {
  size(540,960);
  background(255, 255, 255);
  frameRate(300);
  
  //The 2 propagators will start at 2 adjacent positions
  p1.x1=width/2; p1.x2=width/2; 
  p1.y1=height/2; p1.y2=height/2; 
  p2.x1=width/2+1; p2.x2=width/2+0.1; 
  p2.y1=height/2+1; p2.y2=height/2+0.1; 
  p3.x1=width/2+2; p3.x2=width/2+0.2; 
  p3.y1=height/2+2; p3.y2=height/2+2; 
  
  p1.m=10;p2.m=10;p3.m=10;
  
  p1.r=250;p1.g=250;p1.b=250;
  p2.r=0;p2.g=150;p2.b=150;
  p3.r=250;p3.g=50;p3.b=50;
  
  videoExport = new VideoExport(this, "Perlin Propagator.mp4");
  videoExport.setFrameRate(1200);  
  videoExport.startMovie();
  
}

void draw() {
  
  videoExport.saveFrame();

  p2.draw();
  p3.draw();
  
  if (keyPressed == true) {
    if (keyCode == UP) {
      saveFrame(random(10)+"  .png");
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
    fill(255, 255, 255, 0.5); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
    rect(0, 0, width, height); 
    
    //Halo line
    stroke(r*1.4,g*1.4,b*1.4,1);
    strokeWeight(20);
    strokeCap(ROUND);
    line(x1,y1,x2,y2);
    
    //Main line
    stroke(r,g,b,60);
    strokeWeight(2);
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
