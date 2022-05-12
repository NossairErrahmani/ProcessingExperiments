// import the library
import com.hamoid.*;

Propagator[] p = new Propagator[100];
int ppgtNum=3;


VideoExport videoExport;





void setup() {
  size(720,540);
  background(0, 0, 0);
  frameRate(300);
  p[0]=new Propagator();
  p[1]=new Propagator();
  p[2]=new Propagator();


  //The 2 propagators will start at 2 adjacent positions

  p[0].m=15;
  p[1].m=15;
  p[2].m=15;

  p[0].r=0;  p[0].g=250;  p[0].b=200;
  p[1].r=255;  p[1].g=255;  p[1].b=255;
  p[2].r=250;  p[2].g=50;  p[2].b=50;
  
  //Use a for loop using integer division and modulos to make a grid
  p[0].xLimitMin=0; p[0].xLimitMax=width/3;
  p[1].xLimitMin=width/3; p[1].xLimitMax=2*width/3;
  p[2].xLimitMin=2*width/3; p[2].xLimitMax=width;
  

  videoExport = new VideoExport(this, "Perlin Propagator.mp4");
  videoExport.setFrameRate(1200);  
  //videoExport.startMovie();
}

void draw() {

  videoExport.saveFrame();

  for (int pi=0; pi<ppgtNum; pi++) {
    p[pi].draw();
  }  
  if (frameCount%100000==0) {
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

  float xLimitMin = 0;
  float xLimitMax = width;
  float yLimitMin = 0;
  float yLimitMax = height;
  
  float x1=(xLimitMin+xLimitMax)/2 + random(30);
  float x2=(xLimitMin+xLimitMax)/2 + random(30);
  float y1=(yLimitMin+yLimitMax)/2 + random(30);
  float y2=(yLimitMin+yLimitMax)/2 + random(30);

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
    x2=x1+(sin(noise(x1, y1)*360))*m+ random(2);
    y2=y1+(cos(noise(x1, y1)*360))*m+ random(2);


    if (x2>xLimitMax) {
      x2=xLimitMin;
      x1=xLimitMin;
    };
    if (y2>yLimitMax) {
      y2=yLimitMin;
      y1=yLimitMin;
    };
    if (x2<xLimitMin) {
      x2=xLimitMax;
      x1=xLimitMax;
    };
    if (y2<yLimitMin) {
      y2=yLimitMax;
      y1=yLimitMax;
    };
  }
}
