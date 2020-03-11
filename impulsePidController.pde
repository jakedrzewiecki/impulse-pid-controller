float trainMass = 5440; // kg, 12000 lbs
float maxVelocity = 31; // m/s, 70 mph
float launchTime = 4; // s
float launchForce;
float trackLength;

float storedVelocity;
int storedMillis;
boolean swinging;

PImage trackImg, trainImg, wheelsImg, brakesImg;

int TRACK_X = 0;
int TRACK_Y = 5;
int BRAKES_X_OFFSET = TRACK_X + 291;
int BRAKES_Y_OFFSET = TRACK_Y + 19;
int WHEELS_X_OFFSET = TRACK_X + 329;
int WHEELS_Y_OFFSET = TRACK_Y + 30;
int TRAIN_X_OFFSET = TRACK_X + 330;
int TRAIN_Y_OFFSET = TRACK_Y + 60;

final float PIXELS_PER_METER = 1244 / 46; //pixels per meter

Train train;
PIDController pidController;

void setup()
{
  size(1280, 720);
  frameRate(30);
  loadImages();
  
  train = new Train(trainMass, .002);
  pidController = new PIDController(train);
  launchForce = train.getMass() * maxVelocity / launchTime; // N
  trackLength = trackImg.width / PIXELS_PER_METER;
  println("track length (m): ", trackLength);
  println(launchForce);
  
  pidController.setPoint = 10;
  pidController.kp = 1000;
  pidController.kd = 4750;
}

void draw()
{
  clear();
  background(0, 125, 175);
  if (trainInControl())
  {
    train.calculate();
    train.setForce(pidController.calculateOutput());
    
  }
  int trainPosition = int(train.getPosition() * PIXELS_PER_METER);
  
  drawCoaster(trainPosition);
  
    if(boolean((millis() / 500) % 2))
  {
    textSize(32);
    text("Hi Courtney!!! I love you!! :)", 20, 200);
    fill(0, 255, 255);
  }
}

void loadImages()
{
  trackImg = loadImage("track.png");
  trainImg = loadImage("cars.png");
  wheelsImg = loadImage("wheels.png");
  brakesImg = loadImage("brakes.png");
}

void drawCoaster(int trainPosition)
{
  imageMode(CENTER);
  image(trainImg, TRAIN_X_OFFSET + trainPosition, TRAIN_Y_OFFSET);
  imageMode(CORNER);
  image(brakesImg, BRAKES_X_OFFSET, BRAKES_Y_OFFSET);
  image(trackImg, TRACK_X, TRACK_Y);
  imageMode(CENTER);
  image(wheelsImg, WHEELS_X_OFFSET + trainPosition, WHEELS_Y_OFFSET);
}

boolean trainInControl()
{
  //if the train is in the control area
  if(-25 <= train.getPosition() && train.getPosition() <= trackLength)
  {
    //if it was previously swinging
    if(swinging)
    {
      //now it's no longer swinging
      swinging = false;
    }
    return true;
  }
  //if it is not in the control area
  else
  {
    //if it was previously NOT swinging
    if(!swinging)
    {
      //it is now swinging
      swinging = true;
      //store props
      println("Velocity (m/s): ", round(train.getVelocity()));
      storedVelocity = train.getVelocity();
      storedMillis = millis();
      return false;
    }
    //if it was previously swinging
    else
    {
      //check time elapse
      int diff = millis() - storedMillis;
      if(diff > (abs(train.getVelocity()) * 100))
      {
        train.invertVelocity();
        return true;
      }
      else
      {
        return false;
      }
    }
  }
}

void keyPressed()
{
  float force = (keyCode == RIGHT || keyCode == LEFT ? (keyCode == RIGHT ? launchForce : -1 * launchForce) : 0);
  train.setForce(force);
}

void keyReleased()
{
  train.setForce(0);
}
