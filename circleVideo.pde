import processing.video.*;

Capture video;
int pointillize = 5;

void setup() {
  size(640, 480);
  background(0);
  video = new Capture(this, width, height);
  smooth();
  video.start();
}

void draw() {
  if (video.available()) video.read();
  video.loadPixels();

  int count = 10000;
  for (int i=0; i<count; i++) {
    // Pick a random point
    int x = int(random(video.width));
    int y = int(random(video.height));
    int loc = x + y*video.width;
    // look up the RGB color in the source image

    float r = red(video.pixels[loc]);
    float g = green(video.pixels[loc]);
    float b = blue(video.pixels[loc]);
    noStroke();
    fill(r, g, b, 100);
    ellipse(x, y, pointillize, pointillize);  }
}
