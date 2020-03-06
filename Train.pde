class Train
{
  private float damping;
  private float mass;
  
  private float position;
  private float velocity;
  private float acceleration;
  
  private float force;
  
  Train(float mass, float damping)
  {
    this.damping = damping;
    this.mass = mass;
    this.position = this.velocity = this.acceleration = 0;
  }
  
  void setForce(float force)
  {
    this.force = force;
  }
  
  float getForce()
  {
    return this.force;
  }
  
  float getAcceleration()
  {
    return this.acceleration;
  }
  
  float getVelocity()
  {
    return this.velocity;
  }
  
  float getPosition()
  {
    return this.position;
  }
  
  void calculate()
  {
    this.acceleration = this.force / this.mass;
    this.velocity += this.acceleration / frameRate;
    this.velocity += -1 * this.velocity * this.damping;
    this.position += this.velocity / frameRate;
  }
}
