class RandomShape{
  
  void draw(int seed){
    float angle = radians(random(0,90));
    float size = random(1,200);
    pushMatrix();
    rotate(angle);
    noStroke();
    fill(255,60);
    switch (seed){
      case 0: {ellipse(random(0,width),random(0,height),size,size);}
      case 1: {rect(random(0,width),random(0,height),size,size);}
      case 2: {polygon(random(0,width),random(0,height),size,3);}
      
    }
    popMatrix();
  }
}

void polygon(float x, float y, float radius, int npoints) {
  float angle = TWO_PI / npoints;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius;
    float sy = y + sin(a) * radius;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
