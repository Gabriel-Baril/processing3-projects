
float cam_x;
float cam_y;
float cam_z;
float cam_speed = 25;

void render3dLine(float x1,float y1,float z1,float x2,float y2,float z2,float x3,float y3,float z3)
{
  PVector dl = new PVector(x2-x1,y2-y1,z2-z1);
  float t = (dl.x*(x3-x1) + dl.y*(y3-y1) + dl.z*(z3-z1))/(dl.x*dl.x + dl.y*dl.y + dl.z*dl.z);
  
  
  strokeWeight(5);
  point(x1,y1,z1);
  point(x2,y2,z2);
  point(x3,y3,z3);
  point(x1 + t*dl.x,y1 + t*dl.y,z1 + t*dl.z);
  strokeWeight(2);
  line(x1,y1,z1,x2,y2,z2);
  if(t > 0 && t < (x2 - x1)/dl.x) line(x3,y3,z3,x1 + t*dl.x,y1 + t*dl.y,z1 + t*dl.z);
  else if(t < 0)                  line(x3,y3,z3,x1,y1,z1);
  else                            line(x3,y3,z3,x2,y2,z2);
}

void setup()
{
  size(800,800);
  perspective();
  cam_x = width/2;
  cam_y = height/2;
  cam_z = 800;
}

void keyPressed()
{
}

void draw()
{
  switch(keyCode)
  {
    case 68:
      cam_x += cam_speed;
      break;
    case 65:
      cam_x -= cam_speed;
      break;
    case 87:
      cam_z += cam_speed;
      break;
    case 83:
      cam_z -= cam_speed;
      break;
  }
  background(200);
  camera(cam_x,cam_y,cam_z,width/2,height/2,0,0,1,0);
  translate(mouseX,mouseY,0);
  println(cam_x);
  render3dLine(200,200,10,600,300,-20,mouseX,mouseY,-20);
}
