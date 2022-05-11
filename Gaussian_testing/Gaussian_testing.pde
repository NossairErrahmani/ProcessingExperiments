float x;
float y;
float lx=0;
float ly=0;

void setup(){
  background(0,0,0);
  size(1080,720);
}

void draw(){
  translate(width/2,height/2);
  x=randomGaussian()*width/5;
  y=randomGaussian()*height/5;
  print(x,y);
  stroke(255-105*abs(cos(PI*frameCount/100)),150+105*abs(cos(PI*frameCount/100)),255);
  strokeWeight(0.3);
  line(lx,ly,x,y);
  lx=x;
  ly=y;
}
