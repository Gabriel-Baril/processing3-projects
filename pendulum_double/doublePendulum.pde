public class DoublePendulum{
  PVector origin;
  float m1 = 2;
  float m2 = 2;
  
  PVector m1_pos;
  PVector m1_v;
  PVector m1_a;
  float m1_r;
  float m1_angle;
  float m1_angle_v = 0;
  float m1_angle_a;
  
  PVector m2_pos;
  PVector m2_v;
  PVector m2_a;
  float m2_r;
  float m2_angle;
  float m2_angle_v = 0;
  float m2_angle_a;
  
  public DoublePendulum(PVector origin,float m1_r,float m1_angle,float m2_r,float m2_angle){
      this.origin = origin;
      this.m1_r = m1_r;
      this.m1_angle = m1_angle;
      this.m2_r = m2_r;
      this.m2_angle = m2_angle;
  }
  
  
  public void go(){
    this.update();
    this.render();
  }
  
  public void update(){
    this.updateData();
    this.m1_pos.add(m1_v);
    this.m1_v.add(m1_a);
    
    this.m2_pos.add(m2_v);
    this.m2_v.add(m2_a);
    
    this.m1_angle_v += this.m1_angle_a;
    this.m2_angle_v += this.m2_angle_a;
    this.m1_angle += this.m1_angle_v;
    this.m2_angle += this.m2_angle_v;
    
    m1_angle_v *= 0.99999;
    m2_angle_v *= 0.99999;
  }
  
  public void render(){
    ellipse(origin.x,origin.y,5,5);
    line(origin.x,origin.y,m1_pos.x,m1_pos.y);
    ellipse(m1_pos.x,m1_pos.y,10,10);
    line(m1_pos.x,m1_pos.y,m2_pos.x,m2_pos.y);
    ellipse(m2_pos.x,m2_pos.y,10,10);
  }
  
  public void updateData(){
      this.m1_angle_a = (float)( ( -g * (2 * m1 + m2) * sin(m1_angle) - m2 * g * sin(m1_angle - 2 * m2_angle) - 2 * sin(m1_angle - m2_angle) * m2 * (m2_angle_v * m2_angle_v * m2_r + m1_angle_v * m1_angle_v * m1_r * cos(m1_angle - m2_angle)) )/(m1_r * (2 * m1 + m2 - m2 * cos(2 * m1_angle - 2 * m2_angle))) );
      this.m2_angle_a = (float)( ( 2 * sin(m1_angle - m2_angle)*(m1_angle_v * m1_angle_v * m1_r * (m1 + m2) + g * (m1 + m2) * cos(m1_angle) + m2_angle_v * m2_angle_v * m2_r * m2 * cos(m1_angle - m2_angle)) )/(m2_r * (2 * m1 + m2 - m2 * cos(2 * m1_angle - 2 * m2_angle))) );
       
      this.m1_pos = new PVector(m1_r * -sin(m1_angle) + origin.x,-m1_r * -cos(m1_angle) + origin.y);
      this.m2_pos = new PVector(m1_pos.x + m2_r * -sin(m2_angle),m1_pos.y - m2_r * -cos(m2_angle));
      this.m1_v = new PVector(m1_angle_v * m1_r * cos(m1_angle),m1_angle_v * m1_r * sin(m1_angle));
      this.m2_v = new PVector(m1_v.x + m2_angle_v * m2_r * cos(m2_angle),m1_v.y + m2_angle_v * m2_r * sin(m2_angle));
      this.m1_a = new PVector((float)( -m1_angle_v * m1_angle_v * m1_r * sin(m1_angle) + m1_angle_a * m1_r * cos(m1_angle) ),(float)( m1_angle_v * m1_angle_v * m1_r * cos(m1_angle) + m1_angle_a * m1_r * sin(m1_angle) ));
      this.m2_a = new PVector((float)(m1_a.x - m2_angle_v * m2_angle_v * m2_r * sin(m2_angle) + m2_angle_a * m2_r * cos(m2_angle)),(float)(m1_a.y + m2_angle_v * m2_angle_v * m2_r * cos(m2_angle) + m2_angle_a * m2_r * sin(m2_angle)));
  }
}