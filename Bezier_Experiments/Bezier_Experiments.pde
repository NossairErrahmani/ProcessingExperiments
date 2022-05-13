void setup(){
  size(900,600);
  background(20,10,10);
  frameRate(60);
}

void draw(){

  noStroke();
  fill(50, 50, 50, 60); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  rect(0, 0, width, height); 
  
  float x1=width*0.15;float y1=height/2;
  float x2=width*0.85;float y2=height/2;
  //float xp1=mouseX;float yp1=mouseY;
  //float xp2=width*0.70;float yp2=height*0.7; //Fixed
  //float xp2=width-mouseX;float yp2=height-mouseY; //Varies with the mouse
  float xCenter=x1+(x2-x1)/2;float yCenter=y1+(y2-y1)/2; 
  float radius = (sqrt(pow(xCenter,2)+pow(yCenter,2))/2)*3*cos(frameCount*2*PI/300)*cos(frameCount*2*PI/333);
  float xp1=xCenter+radius*cos(frameCount*2*PI/200);float yp1=yCenter+radius*sin(frameCount*2*PI/200);
  float xp2=width-xp1;float yp2=height - yp1;
  
  stroke(255,255,255);
  strokeWeight(20);
  //point(x1,y1);
  //point(x2,y2);
  //point(xp1,yp1);
  //point(xp2,yp2);
  
  noFill();
  
  stroke(205,55+30*sin(frameCount*2*PI/100),105+30*sin(frameCount*2*PI/100));
  strokeWeight(2);
  for (int i=-10;i<11;i++){
  bezier(x1,y1,xp1,yp1-15*i,xp2,yp2-15*i,x2,y2);}
  
  stroke(205,55+30*sin(frameCount*2*PI/100),105+30*sin(frameCount*2*PI/100),10);
  strokeWeight(40);
  for (int i=-10;i<11;i++){
  bezier(x1,y1,xp1,yp1-15*i,xp2,yp2-15*i,x2,y2);}
  
  
  
}
