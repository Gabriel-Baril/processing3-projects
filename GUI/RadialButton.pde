public class RadialButton
{
  float x;
  float y;
  float radius;
  float minAngle;
  float maxAngle;
  float angle;
  float minValue;
  float maxValue;
  float value;
  float previousValue;
  
  public RadialButton(float x,float y,float radius, float minAngle,float maxAngle,float minValue,float maxValue,float value)
  {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.minAngle = minAngle;
    this.maxAngle = maxAngle;
    this.minValue = minValue;
    this.maxValue = maxValue;
    this.value = value;
  }

  // this.angle must be transform in an atan2 angle
  public float getNormalizedAngle()
  {
    float normalized = 0;
    if(degrees(angle) <= 0) normalized = abs(degrees(angle));
    if(degrees(angle) > 0)  normalized = 360 - degrees(angle);
    return normalized;
  }
  
  public void update()
  {
    if(dist(x,y,mouseX,mouseY) <= radius)
      angle = atan2(mouseY - y,mouseX - x);
  }
  
  public void render()
  {
    noFill();
    stroke(255);
    strokeWeight(1);
    
    float normAngle = getNormalizedAngle();
    println(normAngle);
    previousValue = value;
    value = ( (maxValue - minValue) / (maxAngle - minAngle) ) * normAngle + minValue;
    
    ellipse(this.x,this.y,this.radius * 2,this.radius * 2);
    line(x,y,x + (radius/2)*cos(radians(normAngle)),y - (radius/2)*sin(radians(normAngle)));
  }
}
