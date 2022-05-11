class Drop {
  float x = random(0,width);
  float y = random(-2*height,0);
  float dist = random(0.2,1);
  float xvar=random(-0.2,0.2);
  float yspeed = 5*pow(dist,3);
  float weight = 4*pow(dist,3);
  float size = 5*pow(dist,3);
  
  void fall(){
    x+=xvar;
    float distToMouse = pow(x-mouseX,2)+pow(y-mouseY,2);
    x+=((x-mouseX)/abs(x-mouseX))*exp(-1/pow(x-mouseX,2));
    y=y+yspeed;
    //yspeed*=1.01;
    if (y>height){y=random(-4*height,0);yspeed = 5*pow(dist,3);x = random(0,width);}
  }
  void show(){
    stroke(255-105*abs(cos(PI*(x+y)/100)),150+105*abs(cos(PI*(x+y)/100)),255);
    strokeWeight(weight);
    line(x,y,x,y+size);
  }
}
