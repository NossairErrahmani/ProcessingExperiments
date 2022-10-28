float w; float h; 
float px1; float py1; 
float px2; float py2; 
float mx; float my; 
float rad1; float rad2;
float freq1; float freq2;
float thck;

void setup(){
  //size(900,600);
  fullScreen();
  background(30,30,30);
  frameRate(500);
  
  w=width; h=height;
  
  
  mx=w/2; 
  my=h/2;

  rad1 = mx/6; 
  rad2 = mx/9;
  thck = mx/100;
  
  freq1=25;
  freq2=33;
 
}



void draw(){
  noStroke();
  fill(50, 50, 50, 60); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  rect(0, 0, width, height); 
  
  //Main curve 1
  px1=mx+rad1*cos(frameCount/freq1)+rad2*sin(frameCount/freq2);
  py1=my+rad1*sin(frameCount/freq1)+rad2*cos(frameCount/freq2);
  strokeWeight(thck);
  stroke(255,255,0);
  point(px1,py1);
  
  //Main curve 2
  px2=mx+rad1*cos(frameCount/freq2)+rad2*cos(frameCount/freq1);
  py2=my+rad1*sin(frameCount/freq2)+rad2*sin(frameCount/freq1);
  strokeWeight(thck);
  stroke(0,255,255);
  point(px2,py2);
  
  //Main curve 3
  px2=mx+rad1*cos(frameCount/freq1)+rad2*cos(frameCount/freq2);
  py2=my+rad1*sin(frameCount/freq1)+rad2*sin(frameCount/freq2);
  strokeWeight(thck);
  stroke(255,0,0);
  point(px2,py2); 
  
  
  //Ref curve (circle)
  strokeWeight(thck);
  stroke(255,255,255);
  point(mx+rad1*cos(frameCount/freq1),my+rad1*sin(frameCount/freq1));
  
  //Ref curve (circle)
  strokeWeight(h/20);
  stroke(255,255,255);
  point(mx+(w/100)*cos(frameCount/freq1),my+(h/100)*sin(frameCount/freq1));
}
