// import the library
import com.hamoid.*;

// create a new VideoExport-object
VideoExport videoExport;

Drop[] drops = new Drop[500];

void setup() {
  size(540,960);
  background(20,0,50);
  frameRate(60);
  
  for (int i=0;i<drops.length;i++){
    drops[i]=new Drop();
  }
  
  videoExport = new VideoExport(this, "Attracted Rain.mp4");
  videoExport.setFrameRate(60); 
  videoExport.startMovie();
}

void draw(){
  videoExport.saveFrame();
  
  noStroke(); //We draw a circle that will represent where the cursor is
  fill(255,255,255*abs(cos(PI*frameCount/50)),205+50*abs(cos(PI*frameCount/50)));
  ellipse(mouseX,mouseY,width/40,width/40);
  
  fill(10,50); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  rect(0,0,width,height);
  
  stroke(200,200,0); //We draw a rectangle that shows where the influence area is within which the particles get attracted
  strokeWeight(0.5);
  fill(0,50);
  rect(width*0.2,height*0.2,width*0.6,height*0.6);
  
  

  for (int i=0;i<drops.length;i++){
    drops[i].show();
  }
}

class Drop {
  float x = random(0,width);
  float y = random(-2*height,0);
  float dist = random(0.2,1);
  float xvar=random(-0.2,0.2);
  float yvar=0;
  float yspeed = 5*pow(dist,3);
  float weight = 4*pow(dist,3);
  float size = 5*pow(dist,3);
  int decel = 0;
  int mouseOff = 0;
  

  void show(){
    
    x+=xvar;
    if (overMyWindow()){xvar+=(mouseX-x)/1000;yvar+=(mouseY-y)/5000;mouseOff=2;decel=100;}
    else{if(decel>0){xvar=xvar*random(0.95,0.99);} decel--;}
    xvar+=sin(noise(x,y)*100)/10;
    y=y+yspeed;
    //yspeed*=1.01;
    if (y>height){y=random(-4*height,0);yspeed = 5*pow(dist,3);x = random(0,width);}
    if (x>width){x=0;}
    if (x<0){x=width;}
    
    stroke(255,255,255-100*abs(xvar));
    strokeWeight(abs(cos(PI*(x+y)/200))*4);
    line(x,y,x+xvar,y+size);
  }
}

boolean overMyWindow() {
  if ( (mouseX > width*0.2) && (mouseX <= width*0.8) && (mouseY > height*0.2)  && (mouseY <= height*0.8) )   return true;
  return false;
}

void keyPressed() { 

  if (keyCode == ESC) {
    videoExport.endMovie();
  }
}    
