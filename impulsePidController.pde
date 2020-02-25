PImage track, train, wheels, brakes;
int x;

int TRACK_X = 0;
int TRACK_Y = 5;
int BRAKES_X_OFFSET = TRACK_X + 291;
int BRAKES_Y_OFFSET = TRACK_Y + 19;
int WHEELS_X_OFFSET = TRACK_X + 329;
int WHEELS_Y_OFFSET = TRACK_Y + 30;
int TRAIN_X_OFFSET = TRACK_X + 330;
int TRAIN_Y_OFFSET = TRACK_Y + 60;
void setup()
{
  x = 0;
  size(1280, 720);
  frameRate(30);
  loadImages();
}

void draw()
{
  clear();
  background(0, 125, 175);
  drawCoaster();
}

void loadImages()
{
  track = loadImage("track.png");
  train = loadImage("cars.png");
  wheels = loadImage("wheels.png");
  brakes = loadImage("brakes.png");
}

void drawCoaster()
{
  imageMode(CENTER);
  image(train, TRAIN_X_OFFSET, TRAIN_Y_OFFSET);
  imageMode(CORNER);
  image(brakes, BRAKES_X_OFFSET, BRAKES_Y_OFFSET);
  image(track, TRACK_X, TRACK_Y);
  imageMode(CENTER);
  image(wheels, WHEELS_X_OFFSET, WHEELS_Y_OFFSET);
}

void mouseClicked()
{
  println("x: ", mouseX, "y: ", mouseY);
}
