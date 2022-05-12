// import the library
import com.hamoid.*;

Propagator[] p = new Propagator[100];
int ppgtNum=3;


VideoExport videoExport;





void setup() {
  size(540, 960);
  background(0, 0, 0);
  frameRate(300);
  p[0]=new Propagator();
  p[1]=new Propagator();
  p[2]=new Propagator();


  //The 2 propagators will start at 2 adjacent positions

  p[0].m=10;
  p[1].m=10;
  p[2].m=10;

  p[0].r=250;
  p[0].g=250;
  p[0].b=250;
  p[1].r=0;
  p[1].g=150;
  p[1].b=150;
  p[2].r=250;
  p[2].g=50;
  p[2].b=50;

  videoExport = new VideoExport(this, "Perlin Propagator.mp4");
  videoExport.setFrameRate(1200);  
  //videoExport.startMovie();
}

void draw() {

  videoExport.saveFrame();

  for (int pi=0; pi<ppgtNum; pi++) {
    p[pi].draw();
  }  
  if (frameCount%1000==0) {
    p[ppgtNum]=new Propagator();
    p[ppgtNum].m=3;
    ppgtNum+=1;
  }

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

  float x1=width/2 + random(30);
  float x2=width/2 + random(30);
  float y1=height/2 + random(30);
  float y2=height/2 + random(30);

  //Colors
  float r=255; 
  float g=255;
  float b=255;

  //Magniture
  float m = 10;  

  void draw() {
    fill(0, 0, 0, 0.5); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
    rect(0, 0, width, height); 

    //Halo line
    stroke(r*1.6, g*1.4, b*1.4, 3);
    strokeWeight(15);
    strokeCap(ROUND);
    line(x1, y1, x2, y2);

    //Main line
    stroke(r, g, b, 60);
    strokeWeight(2);
    strokeCap(ROUND);
    line(x1, y1, x2, y2);

    x1=x2;
    y1=y2;
    x2=x1+(sin(noise(x1, y1)*360))*m;
    y2=y1+(cos(noise(x1, y1)*360))*m;


    if (x2>width) {
      x2=0;
      x1=0;
    };
    if (y2>height) {
      y2=0;
      y1=0;
    };
    if (x2<0) {
      x2=width;
      x1=width;
    };
    if (y2<0) {
      y2=height;
      y1=height;
    };
  }
}
