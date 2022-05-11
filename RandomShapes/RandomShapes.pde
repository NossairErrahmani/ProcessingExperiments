RandomShape x = new RandomShape();

void setup(){
  size(1080,720);
  background(50,0,10);
  frameRate(30);
}

void draw(){
  int seed = int(random(0,3));
  //fill(50,0,10,20); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  //rect(0,0,width,height);
  x.draw(seed);
}
