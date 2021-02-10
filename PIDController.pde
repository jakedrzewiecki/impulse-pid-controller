class PIDController
{
  private Train train;
  
  public float setPoint;
  
  public float kp, ki, kd = 0;
  
  private float lastError;
  private float cumError;
  
  PIDController(Train train)
  {
    this.train = train;
    this.lastError = 0;
    this.cumError = 0;
  }
  
  public float calculateOutput()
  {
    float error = this.getError();
    float output = 0;
    
    //calculate kp term
    output += this.kp * error;
    
    //calculate kd term
    float dError = (error - this.lastError) * frameRate;
    output += this.kd * dError;
    
    //calculate ki term
    //float iError = 
    
    println("output: ", output);
    
    this.lastError = error;
    this.cumError += error;
    return output;
  }
  
  public float getError()
  {
    float error = this.setPoint - this.train.getPosition();
    //println("error: ", error);
    return error;
  }
}
