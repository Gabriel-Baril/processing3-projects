public static int spring_render_precision = 10;
public static int spring_render_precision_jump = 5;
public static int spring_render_space = 6;

public class Spring
{
  private float len;
  public PVector pos;
  float stiffness;
  float equilibrium_len;
  float spring_constant;
  
  public Spring(float x, float y,float stiffness, float equilibrium_len, float spring_constant)
  {
    this.pos = new PVector(x,y);
    this.stiffness = stiffness;
    this.equilibrium_len = equilibrium_len;
    this.len = equilibrium_len;
    this.spring_constant = spring_constant;
  }

  public void render()
  {
    //point(pos.x, pos.y);
    strokeWeight(stiffness);
    pushMatrix();
    PVector prev_point = new PVector(pos.x, pos.y);
    PVector next_point = new PVector(pos.x, pos.y + spring_render_precision);
    translate(pos.x, pos.y);
    rotate( atan2((mouseY - pos.y),( mouseX - pos.x + 0.000001)) - PI/2);
    line(prev_point.x - pos.x,prev_point.y - pos.y,next_point.x - pos.x,next_point.y - pos.y);
    for(int i = 0;i < len/spring_render_precision_jump;i++)
    {
      prev_point = new PVector(next_point.x, next_point.y);
      if(i != 0 || i == ( (len/spring_render_precision_jump) - 1) )
      {
          if(i % 2 == 0)
          {
            next_point.x -= spring_render_space*2;
            next_point.y += spring_render_precision_jump / (equilibrium_len / len*1);
          }
          else
          {
            next_point.x += spring_render_space*2;
            next_point.y += spring_render_precision_jump / (equilibrium_len / len*1);
          }
      }
      else
      {
        next_point.x -= spring_render_space;
        next_point.y += spring_render_precision_jump;
      }
      line(prev_point.x - pos.x, prev_point.y - pos.y, next_point.x - pos.x, next_point.y - pos.y);
    }
    popMatrix();
  }
  
  public void set_len(float len) { this.len = len; }
  
}
