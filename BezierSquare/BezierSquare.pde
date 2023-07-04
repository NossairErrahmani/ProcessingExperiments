int rows = 10;
int files = 10;
float x; 
float y;


void setup() {
  size(600, 600);
  x=width/2;
  y=height/2;
}

void draw() {
  
  background(40, 40, 40);
  
  //Displaying the chosen x,y
  stroke(255,255,255,10);
  strokeWeight(2);
  line(mouseX,0,mouseX,height);
  line(0,mouseY,width,mouseY);
  
  fill(255,255,255);
  textSize(20);
  text(mouseX,0,mouseY);
  text(mouseY,mouseX,20);
  
  translate(width/4,height/4);
  bezierCrossRotating(width/2,height/2);
}

void bezierCrossMouse(float w,float h){
  
  x=mouseX; 
  y=mouseY;
  noFill();
  for (int i=0; i<files+1; i++) {
    for (int j=0; j<rows+1; j++) {
      strokeWeight(11+5*cos(frameCount/25.3));
      stroke(255, 255, 255, 10);
      bezier(i*w/files, j*h/rows, x, y, w-x, h-y,w-i*w/files, h - j*h/rows);
    }
  }
}
void bezierCrossRotating(float w,float h){
  x=w*pow(cos(frameCount/((mouseX/100)+10.1)),1);
  y=h*cos(frameCount/((mouseY/50)+10.1));
  noFill();
  for (int i=0; i<files+1; i++) {
    for (int j=0; j<rows+1; j++) {
      strokeWeight(40+5*cos(frameCount/25.3));
      stroke(255, 255, 255, 10);
      bezier(i*w/files, j*h/rows, x, y, w-x, h-y,w-i*w/files, h - j*h/rows);
    }
  }
}
