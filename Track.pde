class Track
{
  private int length;
  private Train train;
  Track(Train train, int length)
  {
    this.length = length;
    this.train = train;
  }
  
  Train getTrain()
  {
    return this.train;
  }
  
  void update()
  {
    this.train.calculate();
    
  }
  
  boolean setForceOnTrain(float force)
  {
    if(inControl())
    {
      this.train.setForce(force);
      return true;
    }
    else
    {
      this.train.setForce(0);
      this.train.setVelocity(0);
      return false;
    }
  }
  
  private boolean inControl()
  {
    println(this.train.position);
    return 0 <= this.train.position && this.train.position <= this.length;
  }
 
}
