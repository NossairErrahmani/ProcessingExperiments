Drop[] drops = new Drop[1000];

void setup() {
  size(1080,720);
  background(20,0,50);
  for (int i=0;i<drops.length;i++){
    drops[i]=new Drop();
  }
}

void draw(){
  fill(10,50); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
  rect(0,0,width,height);
  for (int i=0;i<drops.length;i++){
    drops[i].fall();
    drops[i].show();
  }
}
