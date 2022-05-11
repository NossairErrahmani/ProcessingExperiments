// import the library
import com.hamoid.*;

// create a new VideoExport-object
//VideoExport videoExport;

void keyPressed() { 
  if (key == 'q') {
    //videoExport.endMovie();
    exit();
  }
  if (key == 's') {
    saveFrame("screenShot"+random(10)+".png");
  }
}                                                                                   

//Cool shapes : 6,5 - 9,13

int t;
int a=16;
int b=14;

//For a,b, the shape will have a parts horizontally and b parts vertically

int freq = 15;

float x(float t) {
  return cos(PI*t/(freq*a))-sin(PI*t/(freq*a));
}  

float y(float t) {
  return sin(sin(PI*t/(freq*b))-cos(PI*t/(freq*b)));
}



void setup() {
  frameRate(1000);
  background(20);
  size(1200, 800);
  //videoExport = new VideoExport(this, "Curve "+a+"-"+b+".mp4");
  //videoExport.setFrameRate(120);  
  //videoExport.startMovie();
  print("a=", a, ", b=", b, " // ");
}


void draw() {  
  fill(0,20); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  rect(0,0,width,height);
  fill(0);
  //videoExport.saveFrame();
  stroke(255-105*abs(cos(PI*t/100)),150+105*abs(cos(PI*t/100)),255);
  strokeWeight(5);

  translate(width/2, height/2);

  float X = 100*x(t-1);
  float Y = y(t-1)*100;
  float nextX = 100*x(t);
  float nextY = y(t)*100;


  line(int(nextX), int(nextY), int(X), int(Y));
  //print(int(nextX), int(nextY), int(X), int(Y),"\n");
  t++;
  if (keyPressed == true) {
    if (key == ' ') {
      //saveFrame("X="+int(a)+"- Y="+int(b)+".png");
      t=0;

      a=int(random(0, 20));
      b=int(random(0, 20));
      print("a=", a, ", b=", b);

      background(20);
    }
  }
}
