void setup(){
  size(1200,825);
  background(20,10,10);
  frameRate(60);
}

void draw(){

  noStroke();
  fill(50, 50, 50, 30); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  rect(0, 0, width, height); 
  
  //Displaying the chosen x,y
  stroke(255,255,255,10);
  strokeWeight(1);
  line(mouseX,0,mouseX,height);
  line(0,mouseY,width,mouseY);
  
  fill(255,255,255);
  textSize(10);
  text(mouseX,0,mouseY);
  text(mouseY,mouseX,10);
  
  float x1=width*0.15;float y1=height/2;
  float x2=width*0.85;float y2=height/2;
  //float xp1=mouseX;float yp1=mouseY;
  //float xp2=width*0.70;float yp2=height*0.7; //Fixed
  //float xp2=width-mouseX;float yp2=height-mouseY; //Varies with the mouse
  float xCenter=x1+(x2-x1)/2;float yCenter=y1+(y2-y1)/2; 
  float freq1 = mouseX+50;
  float freq2 = mouseY+50;
  
  float radius = (sqrt(pow(xCenter,2)+pow(yCenter,2))/2)*3*cos(frameCount*2*PI/freq1)*cos(frameCount*2*PI/freq2);
  float xp1=xCenter+radius*cos(frameCount*2*PI/120);float yp1=yCenter+radius*sin(frameCount*2*PI/180);
  float xp2=width-xp1;float yp2=height - yp1;
  
  stroke(255,255,255);
  strokeWeight(20);
  //point(x1,y1);
  //point(x2,y2);
  //point(xp1,yp1);
  //point(xp2,yp2);
  
  noFill();
  
  stroke(205,55+30*sin(frameCount*2*PI/120),105+30*sin(frameCount*2*PI/20));
  strokeWeight(2);
  for (int i=-10;i<11;i++){
  bezier(x1,y1,xp1,yp1-2*pow(i,3),xp2,yp2-2*pow(i,3),x2,y2);}
  
  stroke(100,255,255,5);
  strokeWeight(20);
  for (int i=-10;i<11;i++){
  bezier(x1,y1,xp1,yp1-2*pow(i,3),xp2,yp2-2*pow(i,3),x2,y2);}
  
  
  
}
