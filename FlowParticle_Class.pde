class FlowParticle{
  float x; 
  float y;
  PVector velocity;
  PVector force;
  boolean enabled = true;
  color c;
  
  FlowParticle(float x_, float y_){
    x = x_;
    y = y_;
    velocity = new PVector(0,0);
    force = new PVector(0,0);
  }
  
  void update(float[][] noiseMap){
    if (!enabled) return;
    
    force = new PVector(0,0);
    
    PVector flowDir = calculateGradient(noiseMap);
    flowDir.rotate(HALF_PI);
    force.add(flowDir.mult(forceMultiplier));
    
    velocity.mult(damping);
    velocity.add(force);
    velocity.limit(maxSpeed);
    x += velocity.x;
    y += velocity.y;
    
    if (x < 1 || x >= width-1 || y < 1 || y >= height-1){
      enabled = false;
    }
  }
  PVector calculateGradient(float[][] noiseMap){
    int x_ = floor(x);
    int y_ = floor(y);
    float deltaX = x-x_;
    float deltaY = y-y_;
    
    float topLeft = noiseMap[x_][y_];
    float topRight = noiseMap[x_+1][y_];
    float bottomLeft = noiseMap[x_][y_+1];
    float bottomRight = noiseMap[x_+1][y_+1];
    
    float forceX = lerp(topRight, bottomRight, deltaY) - lerp(topLeft, bottomLeft, deltaY);
    float forceY = lerp(bottomLeft, bottomRight, deltaX) - lerp(topLeft, topRight, deltaX);
    return new PVector(forceX, forceY);
  }
  
  void show(color c_, float alpha){
    noStroke();
    color c = color(red(c_), green(c_), blue(c_), alpha);
    fill(c);
    circle(x,y,2);
  }
}
