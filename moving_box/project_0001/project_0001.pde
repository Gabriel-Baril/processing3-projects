class Box{
  private int m_y = 0;
  private int m_x = 0;
  private int m_dx = 1;
  private int m_dy = 1;
  private int m_width = 10;
  private int m_heigth = 30;
  private color m_color = color(int(random(0,255)),int(random(0,255)),int(random(0,255)));
  
  public Box(int x,int y,int r_width,int r_heigth,int dx,int dy){
    m_x = x;
    m_y = y;
    m_width = r_width;
    m_heigth = r_heigth;
    m_dx = dx;
    m_dy = dy;
  }
  
  public void move(int x,int y){
    m_x += getDX() * x;
    m_y += getDY() * y;
  }
  
  public void setX(int x){
    m_x = x;
  }
  
  public void setY(int y){
    m_y = y;
  }
  
  public void setDX(int dx){
    m_dx = dx;
  }
  
  public void setDY(int dy){
    m_dy = dy;
  }
  
  public void setWidth(int newWidth){
    m_width = newWidth;
  }
  
  public void setHeight(int newHeigth){
    m_width = newHeigth;
  }
  
  public int getX(){
    return m_x;
  }
  
  public int getY(){
    return m_y;
  }
  
  public int getWidth(){
    return m_width;
  }
  
  public int getHeight(){
    return m_heigth;
  }
  
  public int getDX(){
    return m_dx;
  }
  
  public int getDY(){
    return m_dy;
  }
  
  public void display(){
    fill(m_color);
    rect(m_x,m_y,m_width,m_heigth);
  }
  
  public boolean mouseOnBox(){
    if(getX() < mouseX &&
      getX() + getWidth() > mouseX &&
      getY() < mouseY && 
      getHeight() + getY() > mouseY){
        return true;
  }
  return false;
}
}

Box[] boxs = new Box[4];

void mouseDragged(){
  for(int i = 0;i < boxs.length;i++){
    if(boxs[i].mouseOnBox()){
      boxs[i].setX(mouseX - boxs[i].getWidth()/2);
      boxs[i].setY(mouseY - boxs[i].getHeight()/2);
      println("Box no." + i);
    }
  }
}

void move(Box myBox){
  if(myBox.getX() > width - myBox.getWidth() || myBox.getX() < 0){
    myBox.setDX(-myBox.getDX());
  }else if(myBox.getY() > height - myBox.getHeight() || myBox.getY() < 0){
    myBox.setDY(-myBox.getDY());
  }
}

boolean isCollideWhitOther(Box box_1, Box box_2){
  if(box_1.getX() < box_2.getX() + box_2.getWidth() &&
      box_1.getX() + box_1.getWidth() > box_2.getX() &&
      box_1.getY() < box_2.getY() + box_2.getHeight() && 
      box_1.getHeight() + box_1.getY() > box_2.getY()){
        
      box_1.setDX(-box_1.getDX());
      box_2.setDX(-box_2.getDX());
    return true;
  }
  return false;
}

void config(Box myBox){
  myBox.display();
}

void setup(){
   size(700,500);
   
  for(int i = 0;i < boxs.length;i++){
    boxs[i] = new Box(floor(random(10,400)), floor(random(10,400)),25,25,1,1);
  }
}

void draw(){
  background(155);
  for(int i = 0;i < boxs.length;i++){
    config(boxs[i]);
    move(boxs[i]);
  }
}