float zoom = 0.2;
float sensibility_zoom = 15;
int speed = 25;
int translateX;
int translateY;

ArrayList<PVector> points = new ArrayList<PVector>();
Function[] functions = {
                       //new Function(color(0)){
                       //   public float f(float x){
                       //     return (x*x*x + 2*x*x + 1/x - 3*x)/(x-9)*(x*x*x + 2*x*x - 20*sin(x) - 3*x)/(x-9);
                       //   }
                       //},
                       new Function(color(0)){
                          public float f(float x){
                            return ((4*x*x*x-6*x*x+1)*sqrt(x+1))/(3-x); 
                          }
                       }};

Button[] buttons = new Button[3];

void mouseDragged(){
  translateX = mouseX-translateX + mouseX;
  translateY = mouseY-translateY + mouseY;
}

void mouseWheel(MouseEvent event) {
  if (event.getCount() == -1 && zoom > zoom/sensibility_zoom)
    zoom -= zoom/sensibility_zoom;
  if (event.getCount() == 1)
    zoom += zoom/sensibility_zoom;
  
}

void mouseClicked() {
  boolean clicked = false;
  for(int i = 0;i < buttons.length;i++){
    if(buttons[i].update())
      clicked = true;
  }
  
  if(!clicked)
    points.add(new PVector((mouseX - translateX)*zoom,-(mouseY-translateY)*zoom));
  
}

void keyPressed() {
  switch(keyCode) {
  case 39:
    translateX -= speed;
    break;
  case 37:
    translateX += speed;
    break;
  case 38:
    translateY += speed;
    break;
  case 40:
    translateY -= speed;
    break;
  }
}

void setup() {
  //fullScreen();
  size(700, 700);
  textSize(10);
  translateX = width/2;
  translateY = height/2;
  buttons[0] = new Button(new PVector(width - 100, 10), 80, 40, "HOME") {
    public void action() {
      zoom = 0.2;
      translateX = width/2;
      translateY = height/2;
    }
  };
  
  buttons[1] = new Button(new PVector(width - 100, 60), 80, 40, "+"){
    public void action(){
      if (zoom > zoom/sensibility_zoom)
        zoom -= zoom/sensibility_zoom;
    }
  };
  
  buttons[2] = new Button(new PVector(width - 100, 110), 80, 40,"-"){
    public void action(){      
      if (zoom > zoom/sensibility_zoom)
        zoom += zoom/sensibility_zoom;
    }
  };
  frameRate(300);
}

void drawPoints(){
  strokeWeight(5);
  stroke(0);
  for(int i = 0;i < points.size();i++){
    point(points.get(i).x/zoom,-points.get(i).y/zoom);
    text("(" + String.format("%.2f",points.get(i).x) + ";" + String.format("%.2f",points.get(i).y) + ")",points.get(i).x/zoom,-points.get(i).y/zoom);
  }
}

void drawBasics(){
  
  stroke(0);
  fill(0);
  
  line(mouseX,0,mouseX,height);
  line(0,mouseY,width,mouseY);
  
  translate(translateX, translateY);
  text("(" + String.format("%.2f",(mouseX-translateX)*zoom) + ";" + String.format("%.2f",-(mouseY-translateY)*zoom) + ")",mouseX + 3 - translateX,mouseY + 10 - translateY);

  
  line(-translateX, 0, width - translateX, 0);
  line(0, -translateY, 0, height - translateY);

  for (int y = -translateY; y < height - translateY; y++) {
    if (y % 50 == 0)
      if (y != 0)
        text(String.format("%.2f", -zoom*y), 5, y);
  }

}

void drawFunctions(){
  strokeWeight(1);
    for (int x = -translateX; x < width - translateX; x++) {
      if (x % 50 == 0)
        text(String.format("%.2f", zoom*x), x, 10);   
    }
  for(int i = 0;i < functions.length;i++){
    for (int x = -translateX; x < width - translateX; x++) {
      stroke(functions[i].col);
      if(functions[i].interval){
        if(x >= functions[i].min/zoom && x <= functions[i].max/zoom){
          line(x, -functions[i].f(zoom*x)/zoom, x+1, -functions[i].f(zoom*(x+1))/zoom);
        }
      }else{
          line(x, -functions[i].f(zoom*x)/zoom, x+1, -functions[i].f(zoom*(x+1))/zoom);
          line(x, -functions[i].derivee(zoom*x)/zoom, x+1, -functions[i].derivee(zoom*(x+1))/zoom);
      }
    }
  }
}

void draw() {
  background(255);
  text((int)frameRate, 0, 10);
  for(int i = 0;i < buttons.length;i++){
    buttons[i].render();
  }
  drawBasics();
  drawPoints();
  drawFunctions();
}
