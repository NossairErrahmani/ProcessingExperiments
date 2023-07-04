float w; float h; 
float px1; float py1; 
float px2; float py2; 
float middleX; float middleY; 
float rad1s; float rad2s;
float rad1m; float rad2m;
float rad1h; float rad2h;
float freq1Seconds; float freq2Seconds;
float thck;

void setup(){
  //size(900,600);
  fullScreen();
  background(30,30,30);
  frameRate(240);
  
  w=width; h=height;
  
  
  middleX=w/2; 
  middleY=h/2;

  rad1s = middleX/4; 
  rad2s = middleX/60;
  
  rad1m = middleX/2; 
  rad2m = middleX/60;
  
  rad1h = middleX/3; 
  rad2h = middleX/60;
  
  thck = middleX/50;
  
  freq1Seconds=720;
  freq2Seconds=12;
 
}



void draw(){
  noStroke();
  fill(50, 50, 50, 10); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  rect(0, 0, width, height); 
  
  stroke(255,255,255,30);
  noFill();
  strokeWeight(4);
  circle(middleX,middleY,2*rad1h);
  
  stroke(255,255,255,30);
  noFill();
  strokeWeight(4);
  circle(middleX,middleY,2*rad1m);
  
  
  

  //------------SECONDS HAND---------------

  //Main Seconds curve 1 - Turns around the center pointing to the seconds
  px2=middleX+cos(frameCount/freq1Seconds)*(0.7*rad1s*cos(frameCount/freq2Seconds))+3*rad2s*sin(frameCount/freq2Seconds);
  py2=middleY+sin(frameCount/freq1Seconds)*(0.7  *rad1s*cos(frameCount/freq2Seconds))+3*rad2s*sin(frameCount/freq2Seconds);
  strokeWeight(thck/2);
  stroke(255,100,100);
  point(px2,py2);
  //Main Seconds curve 2 - Turns around the seconds point
  px1=middleX+rad1s*cos(frameCount/freq1Seconds)+2.5*rad2s*sin(frameCount/(freq2Seconds*2));
  py1=middleY+rad1s*sin(frameCount/freq1Seconds)+2.5*rad2s*cos(frameCount/(freq2Seconds*2));
  strokeWeight(thck/3);
  stroke(100,220,255);
  point(px1,py1);
  //Ref curve (circle)
  strokeWeight(thck);
  stroke(255,255,255);
  point(middleX+rad1s*cos(frameCount/freq1Seconds),middleY+rad1s*sin(frameCount/freq1Seconds));

  //------------MINUTES HAND---------------
  
  //Main Seconds curve 2 - Turns around the seconds point
  px1=middleX+rad1m*cos(frameCount/(60*freq1Seconds))+5*rad2m*sin(frameCount/(freq2Seconds*2));
  py1=middleY+rad1m*sin(frameCount/(60*freq1Seconds))+5*rad2m*cos(frameCount/(freq2Seconds*2));
  strokeWeight(thck/3);
  stroke(100,220,255);
  point(px1,py1);
  px1=middleX+rad1m*cos(frameCount/(60*freq1Seconds))+9*rad2m*sin(frameCount/(freq2Seconds*2));
  py1=middleY+rad1m*sin(frameCount/(60*freq1Seconds))+2*rad2m*cos(frameCount/(freq2Seconds*2));
  strokeWeight(thck/3);
  stroke(100,220,255);
  point(px1,py1);
  //Ref curve (circle)
  strokeWeight(thck);
  stroke(255,255,255);
  point(middleX+rad1m*cos(frameCount/(60*freq1Seconds)),middleY+rad1m*sin(frameCount/(60*freq1Seconds)));
  strokeWeight(0.3);
  stroke(255,255,255,100);
  line(middleX,middleY,middleX+rad1m*cos(frameCount/(60*freq1Seconds)),middleY+rad1m*sin(frameCount/(60*freq1Seconds)));
  
  //------------HOURS HAND---------------
  
  //Main Seconds curve 2 - Turns around the seconds point
  px1=middleX+rad1h*cos(30+frameCount/(3600*freq1Seconds))-4*rad2h*sin(30+frameCount/(freq2Seconds*2));
  py1=middleY+rad1h*sin(30+frameCount/(3600*freq1Seconds))-4*rad2h*cos(30+frameCount/(freq2Seconds*2));
  strokeWeight(thck/3);
  stroke(100,220,255);
  point(px1,py1);
  //Ref curve (circle)
  strokeWeight(thck);
  stroke(255,255,255);
  point(middleX+rad1h*cos(30+frameCount/(3600*freq1Seconds)),middleY+rad1h*sin(30+frameCount/(3600*freq1Seconds)));
  strokeWeight(0.6);
  stroke(255,255,255,100);
  line(middleX,middleY,middleX+rad1h*cos(30+frameCount/(3600*freq1Seconds)),middleY+rad1h*sin(30+frameCount/(3600*freq1Seconds)));
  
  //------------CLOCK AESTHETICS---------------

  
  //Ref curve (circle)
  strokeWeight(h/20);
  stroke(255,211,0,255);
  point(middleX,middleY);
  strokeWeight(h/18);
  stroke(255,211,0,150);
  point(middleX,middleY);
  strokeWeight(h/15);
  stroke(255,211,0,50);
  point(middleX,middleY);
  strokeWeight(h/13);
  stroke(255,211,0,10);
  point(middleX,middleY);
  strokeWeight(h/11);
  stroke(255,211,0,3);
  point(middleX,middleY);
  
  
}
