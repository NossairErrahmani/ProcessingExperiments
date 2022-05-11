float x;
float y;
float lx=0;
float ly=0;

void setup(){
  background(20,0,20);
  size(1080,720);
  frameRate(24);
}

void draw(){
  fill(0,30); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  rect(0,0,width,height);
  translate(width/2,height/2);
  if (frameCount%2==0) {x=randomGaussian()*width/7;}
  else{y=randomGaussian()*height/7;}
  print(x,y);
  stroke(255-105*abs(cos(PI*frameCount/100)),150+105*abs(cos(PI*frameCount/100)),255);
  strokeWeight(1+5*abs(cos(PI*frameCount/10)));
  //line(lx,ly,x,y);
  curve((lx-x)/2,(ly-y)/2,lx,ly,x,y,(lx-x)/2,(ly-y)/2);
  lx=x;
  ly=y;
}
