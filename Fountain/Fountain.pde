// This program simulates a water jet show at night with stars and ground.

// List to hold all the Jet objects.
ArrayList<Jet> jets;

// PImage objects for stars and ground.
PImage stars; 
PImage ground;

// This function runs once at the start.
void setup() {
  // Set the size of the sketch window.
  size(800, 600);

  // Create the starry night and the ground images.
  stars = createStars(width, 450, 200); 
  ground = createGround(width, 450, color(20, 100, 20), 0);

  // Initialize the list of Jets.
  jets = new ArrayList<Jet>();
  
  // Define some color variables.
  color blue=color(150,150,255);
  
  // Add Jet objects to the list with various properties.  
  jets.add(new Jet(new PVector(400, 500), 90, 10, 0, blue)); // Stationary vertical jets.
  jets.add(new Jet(new PVector(200, 500), 60, 8, 0, blue));
  jets.add(new Jet(new PVector(600, 500), 120, 8, 0, blue));
  jets.add(new Jet(new PVector(100, 500), 90, 5, 10, blue)); // Rotating jets.
  jets.add(new Jet(new PVector(700, 500), 90, 5, 10, blue));
  jets.add(new Jet(new PVector(1000, 500), 135, 15, 0, blue)); // Diagonal stationary jets.
  jets.add(new Jet(new PVector(-200, 500), 45, 15, 0, blue));
}

// This function runs continuously after setup().
void draw() {
  // Set the background to black.
  background(0);
  
  // Draw the stars and ground images.
  image(stars, 0, 0);
  image(ground, 0, 450);
  
  // Run each jet in the list.
  for (Jet jet : jets) {
    jet.run();
  }
}

// Function to generate a starry sky image.
PImage createStars(int w, int h, int numStars) {
  // Create an empty image.
  PImage img = createImage(w, h, RGB);
  
  // Access the pixel array in the image.
  img.loadPixels();
  
  // For each star, randomly choose a location and set that pixel to yellow.
  for (int i = 0; i < numStars; i++) {
    int x = (int) random(w);
    int y = (int) random(h);
    img.set(x, y, color(255, 255, 0));
  }
  
  // Update the image with the altered pixel array.
  img.updatePixels();
  
  // Return the image.
  return img;
}

// Function to generate a ground image.
PImage createGround(int w, int h, color col, int numStones) {
  PImage img = createImage(w, h, RGB);
  img.loadPixels();
  
  // Set all pixels to the ground color.
  for (int i = 0; i < w; i++) {
    for (int j = 0; j < h; j++) {
      img.set(i, j, col);
    }
  }
  
  // Add some stones to the ground.
  for (int i = 0; i < numStones; i++) {
    int x = (int) random(w);
    int y = (int) random(h);
    img.set(x, y, color(128, 128, 128));
  }
  
  img.updatePixels();
  return img;
}

// Class for a Jet object.
class Jet {
  // Properties of the jet.
  PVector position;
  float initialAngle;
  float power;
  float deltaAngle;
  color col;
  
  // List of Particle objects that make up the jet.
  ArrayList<Particle> particles;

  // Constructor for the Jet class.
  Jet(PVector pos, float angle, float power, float deltaAngle, color col) {
    this.position = pos.copy();
    this.initialAngle = angle;
    this.power = power;
    this.deltaAngle = deltaAngle;
    this.col = col;
    particles = new ArrayList<Particle>();
  }

  // Run function for the jet.
  void run() {
    // Update the angle: now it oscillates around the initial angle in a sinusoidal manner.
    float angle = this.initialAngle + this.deltaAngle * sin(radians(3*frameCount));
    
    // Add new particles to the jet with random angle and power.
    for (int i = 0; i < 5; i++) {
      float randomAngle = angle + random(-5, 5);
      float randomPower = power + random(-1, 1);
      particles.add(new Particle(position, randomAngle, randomPower, col));
    }
    
    // Run each particle and remove it if it is dead.
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

// Class for a Particle object.
class Particle {
  // Properties of the particle.
  PVector position;
  PVector velocity;
  PVector gravity = new PVector(0, 0.1); // Gravity force.
  color col;
  float lifespan; // Particle's lifespan.

  // Constructor for the Particle class.
  Particle(PVector pos, float angle, float power, color col) {
    this.position = pos.copy();
    float rad = radians(angle);
    // Calculate initial velocity based on power and angle.
    this.velocity = new PVector(power*cos(rad), -power*sin(rad)); 
    this.col = col;
    this.lifespan = 255.0;  // Initially set to max value.
  }

  // Run function for the particle.
  void run() {
    update();
    display();
  }

  // Update the particle's position and lifespan.
  void update() {
    velocity.add(gravity);
    position.add(velocity);
    lifespan -= 2.0;  // Decrease lifespan over time.
  }

  // Display the particle on the screen.
  void display() {
    // Create color with alpha based on lifespan.
    stroke(red(col), green(col), blue(col), lifespan);
    strokeWeight(2);
    point(position.x, position.y);
  }

  // Check if the particle is dead (off the screen or lifespan is over).
  boolean isDead() {
    if (position.y > height || lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
