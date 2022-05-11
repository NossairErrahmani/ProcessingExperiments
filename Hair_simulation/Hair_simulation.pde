    // import the library
    import com.hamoid.*;
    
    // create a new VideoExport-object
    VideoExport videoExport;
    
    
    float files = 50;
    float rows = 50; // Files and Rows will set the grid size
    float xSep;
    float ySep;
    float xOffset;
    float yOffset;
    float moveSpeed = 20; // The movement speed can be dynamically modified with the UP/DOWN keys
    
    
    
    
    void setup() {
      size(1080, 720);
      frameRate(30);

      background(40, 10, 40);
    
      xSep = width/files;
      ySep = height/rows; //
      xOffset = width/(files*2);
      yOffset = height/(rows*2); // The separation and offset are set so that the grid is centered and the points equally spaced
    
      //videoExport = new VideoExport(this, "Hair simulation.mp4");
      //videoExport.setFrameRate(30);  
      //videoExport.startMovie();
    }
    
    
    void draw() {
    
      //videoExport.saveFrame();
      float colorOffset = abs(sin(PI*frameCount/50)); //The variation of the brightness and the blurriness gives a very claustrophobic fever dream quality
    
      fill(5, 100-colorOffset*70); //We draw a transparent rectangle at each frame so that over time, older positions are hidden and we have a trail 
      rect(0, 0, width, height); 
    
    
      for (int i=0; i<files; i++) {
        for (int j=0; j<rows; j++) {
          float x=i*xSep ;
          float y=j*ySep ;
          float dx=(mouseX-x)/10 + cos(noise(x, y) * (frameCount+300)/10) * (mouseX-x+100)/moveSpeed;
          float dy=(mouseY-y)/10 + sin(noise(x, y) * (frameCount+300)/10) * (mouseY-y+100)/moveSpeed; //dx and dy are calcultated to 1) point to the cursor and 2) oscillate randomly
          //float colorOffsetLines = abs(dx+dy+sin(PI*frameCount/20));
          //float colorContrast = 0; 
          stroke(255-noise(x, y)*30, 255, 225+noise(x, y)*30, 50); //The color of the branches will be ever so slightly different
          strokeWeight(4);
          strokeCap(ROUND);
          line(x+xOffset, y+yOffset, x+dx+xOffset, y+dy+yOffset); 
        }
      }
      noStroke();
      fill(255,100,100,50);
      ellipse(mouseX,mouseY,20,20);
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
