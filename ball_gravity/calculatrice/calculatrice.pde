ArrayList<Button> buttons = new ArrayList<Button>();
ResultBar bar;
color colorBar = color(126, 126, 126, 190);
color colorButton = color(255);
float buttonWidth = 50;
float buttonHeight = 30;

void setup() {
  size(400, 500);
  bar = new ResultBar(0, 0, 400, 35);
  // Setup number button
  buttons.add(new ButtonNumber(-1, height - buttonHeight, buttonWidth, buttonHeight, 0));
  buttons.add(new ButtonNumber(-1, height - (buttonHeight*2), buttonWidth, buttonHeight, 1));
  buttons.add(new ButtonNumber(buttonWidth - 1, height - (buttonHeight*2), buttonWidth, buttonHeight, 2));
  buttons.add(new ButtonNumber((buttonWidth*2) - 1, height - (buttonHeight*2), buttonWidth, buttonHeight, 3));
  buttons.add(new ButtonNumber(-1, height - (buttonHeight*3), buttonWidth, buttonHeight, 4));
  buttons.add(new ButtonNumber(buttonWidth - 1, height - (buttonHeight*3), buttonWidth, buttonHeight, 5));
  buttons.add(new ButtonNumber((buttonWidth*2) - 1, height - (buttonHeight*3), buttonWidth, buttonHeight, 6));
  buttons.add(new ButtonNumber(-1, height - (buttonHeight*4), buttonWidth, buttonHeight, 7));
  buttons.add(new ButtonNumber(buttonWidth - 1, height - (buttonHeight*4), buttonWidth, buttonHeight, 8));
  buttons.add(new ButtonNumber((buttonWidth*2) - 1, height - (buttonHeight*4), buttonWidth, buttonHeight, 9));
  // Setup operator button
  
  // Setup scientist button
  
  // Setup 2nd function and exit button
}

void draw() {
  background(70, 100, 160);
  bar.render(colorBar);
  for(int i = 0;i < buttons.size();i++){
    buttons.get(i).setResultBar(bar);
    buttons.get(i).render(colorButton);
    buttons.get(i).update();
    buttons.get(i).clicked();
  }
}