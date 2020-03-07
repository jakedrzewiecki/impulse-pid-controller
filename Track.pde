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
    if(inControl())
    {
      this.train.calculate();
    }
    else
    {
      this.train.setVelocity(0);
      this.train.setForce(0);
    }
      
    
  }
  
  void setForceOnTrain(float force)
  {
    this.train.setForce(force);
  }
  
  private boolean inControl()
  {
    println(this.train.position);
    return 0 <= this.train.position && this.train.position <= this.length;
  }
 
}
