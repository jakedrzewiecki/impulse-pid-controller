float trainMass = 5440; // kg, 12000 lbs
float maxVelocity = 31; // m/s, 70 mph
float launchTime = 4; // s
float launchForce;

PImage trackImg, trainImg, wheelsImg, brakesImg;
int c;

int TRACK_X = 10;
int TRACK_Y = 5;
int BRAKES_X_OFFSET = TRACK_X + 291;
int BRAKES_Y_OFFSET = TRACK_Y + 19;
int WHEELS_X_OFFSET = TRACK_X + 329;
int WHEELS_Y_OFFSET = TRACK_Y + 30;
int TRAIN_X_OFFSET = TRACK_X + 330;
int TRAIN_Y_OFFSET = TRACK_Y + 60;

final float PIXELS_PER_METER = 1244 / 46; //pixels per meter

Train train;
Track track;

void setup()
{
  //size(1280, 720);
  size(1600, 720);
  frameRate(30);
  loadImages();
  
  c = 0;
  
  train = new Train(trainMass, .008);
  track = new Track(train, trackImg.width);
  
  launchForce = train.getMass() * maxVelocity / launchTime; // N
  println(launchForce);
}

void draw()
{
  clear();
  background(0, 125, 175);
  track.update();
  drawCoaster();
}

void loadImages()
{
  trackImg = loadImage("track.png");
  trainImg = loadImage("cars.png");
  wheelsImg = loadImage("wheels.png");
  brakesImg = loadImage("brakes.png");
}

void drawCoaster()
{
  int trainPosition = int(track.getTrain().getPosition() * PIXELS_PER_METER);
  imageMode(CENTER);
  image(trainImg, TRAIN_X_OFFSET + trainPosition, TRAIN_Y_OFFSET);
  imageMode(CORNER);
  image(brakesImg, BRAKES_X_OFFSET, BRAKES_Y_OFFSET);
  image(trackImg, TRACK_X, TRACK_Y);
  imageMode(CENTER);
  image(wheelsImg, WHEELS_X_OFFSET + trainPosition, WHEELS_Y_OFFSET);
}

void mouseClicked()
{
  //println("c%2: ", c % 2);
  track.setForceOnTrain(launchForce * (c++ % 2));
  println("x: ", mouseX);
}
