float files = 50;
float rows = 50;
float xSep;
float ySep;
float xOffset;
float yOffset;
float moveSpeed = 20;


                                                                               

void setup() {
  size(1080, 720);
  frameRate(60);
  background(30, 10, 30);

  xSep = width/files;
  ySep = height/rows;
  xOffset = width/(files*2);
  yOffset = height/(rows*2);
}


void draw() {
  
  fill(0,60); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  rect(0,0,width,height);
  

  for (int i=0; i<files; i++) {
    for (int j=0; j<rows; j++) {
      float x=i*xSep ;
      float y=j*ySep ;
      float dx=(mouseX-x)/10 + cos(noise(x, y) * (frameCount+300)/10) * (mouseX-x+100)/moveSpeed;
      float dy=(mouseY-y)/10 + sin(noise(x, y) * (frameCount+300)/10) * (mouseY-y+100)/moveSpeed;
      //float colorOffset = abs(dx+dy+sin(PI*frameCount/20));
      float colorOffset = 0;
      float colorContrast = 0;
      stroke(255-noise(x, y)*30, 255, 225+noise(x, y)*30,50);
      strokeWeight(4);
      strokeCap(ROUND);
      line(x+xOffset, y+yOffset, x+dx+xOffset, y+dy+yOffset);
    }
  }
}


void keyPressed() { 
  if (keyCode == UP) {
    //videoExport.endMovie();
    moveSpeed+=2;
    print(moveSpeed);
  }
  if (keyCode == DOWN) {
    moveSpeed-=2;
    print(moveSpeed);
  }
}    
