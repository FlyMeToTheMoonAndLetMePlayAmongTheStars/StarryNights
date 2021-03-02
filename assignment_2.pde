PImage photo;
PImage photo2; 
int clicks = 0;

void setup() {
  size(650, 500);
  background(0);
  photo = loadImage("starryNight.jpeg");
  photo.resize(650, 500);
  photo2 = loadImage("starryNight2.jpeg");
  photo2.resize(650, 500);
  frameRate(30);
}

void draw() {
  imageMode(CENTER);
  noStroke();

  int circleLimit = mouseX / 2;
  float circleSize = 2;
  float blackHoles = circleSize * 8;

  for (int i = 0; i < circleLimit; i++) {
    float x = random(width);
    float y = random(height);

    int a = int(x);
    int b = int(y);

    float c = random(4, 12);
    int d = int(c);
    
    if (clicks == 0) {
      fill(photo.pixels[b*width+a]);
    } else if (clicks == 1) {
      fill(0, 25);
      ellipse(x, y, blackHoles, blackHoles);
    } else if (clicks == 2) {
      fill(photo2.pixels[b*width+a]);
    } else {
      fill(0, 25);
      ellipse(x, y, blackHoles, blackHoles);
    }

    pushMatrix();
    translate(x, y);
    star(0, 0, circleSize/random(2, 4), circleSize/random(8), d);
    popMatrix();
  }
}

void mouseClicked() {
  if (clicks == 0) {
    clicks = 1;
  } else if (clicks == 1) {
    clicks = 2;
  } else if (clicks == 2) {
    clicks = 3;
  } else {
    clicks = 0;
  }
}

void star(float x, float y, float radius1, float radius2, int npoints) {
  float angle = TWO_PI / npoints;
  float halfAngle = angle/2.0;
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius2;
    float sy = y + sin(a) * radius2;
    vertex(sx, sy);
    sx = x + cos(a+halfAngle) * radius1;
    sy = y + sin(a+halfAngle) * radius1;
    vertex(sx, sy);
  }
  endShape(CLOSE);
}
