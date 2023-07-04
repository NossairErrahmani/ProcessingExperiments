float w; float h; float x; float y; float nx; float ny;

Neon[] neons = new Neon[10];

void setup(){
  
  fullScreen();
  colorMode(HSB);
  frameRate(24);
  
  w=width; h=height;
  
  x=w/2; 
  y=h/2;
  
  for (int ne = 0; ne<neons.length;ne++){
    neons[ne]=new Neon();
    neons[ne].x = x;
    neons[ne].y = y;
    neons[ne].angle = random(180);
    neons[ne].h = 140*int(random(2));
    neons[ne].s = 255;
    neons[ne].b = 255;
    neons[ne].speed = random(-1,1);
    
  }

}



void draw(){
  
  background(0,0,0);
  
  for (int ne = 0; ne<neons.length;ne++){
    neons[ne].neonLights();
    neons[ne].angle+=neons[ne].speed;
  }
  
  noStroke();
  fill(0,0,255,30);
  circle(x,y,20);
  
  
}

class Neon{
  
  float x; float y; float angle; float h; float s; float b; float speed;
  void neonLights(){
    
     strokeWeight(3);
     stroke(h,s,b);
     line(x+width*cos(radians(angle)),y-height*sin(radians(angle)),x-width*cos(radians(angle)),y+height*sin(radians(angle)));
     strokeWeight(20);
     stroke(h,s,b,30);
     line(x+width*cos(radians(angle)),y-height*sin(radians(angle)),x-width*cos(radians(angle)),y+height*sin(radians(angle)));
     strokeWeight(50);
     stroke(h,s,b,20);
     line(x+width*cos(radians(angle)),y-height*sin(radians(angle)),x-width*cos(radians(angle)),y+height*sin(radians(angle)));
     strokeWeight(70);
     stroke(h,s,b,15);
     line(x+width*cos(radians(angle)),y-height*sin(radians(angle)),x-width*cos(radians(angle)),y+height*sin(radians(angle)));
     
  }
     
}
