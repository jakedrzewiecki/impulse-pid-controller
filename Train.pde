class Train
{
  private float position, velocity, acceleration;
  private float damping;
  private float mass;
  private float force;
  
  Train(float mass, float damping)
  {
    this.damping = damping;
    this.mass = mass;
    this.position = this.velocity = this.acceleration = 0;
  }
  
  void setForce(float value)
  {
    this.force = value;
  }
  
  float getForce()
  {
    return this.force;
  }
  
  float getMass()
  {
    return this.mass;
  }
  
  void setMass(float value)
  {
    this.mass = value;
  }
  
  float getAcceleration()
  {
    return this.acceleration;
  }
  
  float getVelocity()
  {
    return this.velocity;
  }
  
  void setVelocity(float value)
  {
    this.velocity = value;
  }
  
  float getPosition()
  {
    return this.position;
  }
  
  void calculate()
  {
    // f = ma
    this.acceleration = this.force / this.mass;
    
    // v = ∫a dt
    this.velocity += this.acceleration / frameRate;
    
    // rudimentary air resistance / friction
    this.velocity += -1 * this.velocity * this.damping;
    
    // x = ∫v dt
    this.position += this.velocity / frameRate;
  }
}
