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

  public void update()
  {
    if(dist(x,y,mouseX,mouseY) <= radius)
    {
      angle = atan2((mouseY - y),(mouseX - x));
    }
  }
  
  public void render()
  {
    noFill();
    stroke(255);
    strokeWeight(1);
    
    //angle = ( (value - minValue) / (maxValue - minValue) ) * (maxAngle - minAngle);
    float a = 0;
    if(degrees(angle) < 0)
      a = abs(degrees(angle));
    if(degrees(angle) > 0)
      a = 360 - degrees(angle);
      
    value = ( (maxValue - minValue) / (maxAngle - minAngle) ) * a + minValue;
    
    println(value);
    ellipse(this.x,this.y,this.radius * 2,this.radius * 2);
    line(x,y,x + (radius/2)*cos(angle),y + (radius/2)*sin(angle));
  }
}
