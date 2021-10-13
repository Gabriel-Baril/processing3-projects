ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList tab = new ArrayList();
CalculusBar bar;
ResultBar barResult;
CalculusAlgorithm algo = new CalculusAlgorithm();
float result;
color colorBarResult = color(150, 150, 150, 190);
color colorBar = color(126, 126, 126, 190);
color colorButton = color(255);
float buttonWidth = 50;
float buttonHeight = 30;

public void mouseClicked(){
  for(int i = 0;i < buttons.size();i++){
    if((buttons.get(i) instanceof ButtonOperator) && buttons.get(i).clicked()){
      ((ButtonOperator)buttons.get(i)).determineResult();
    }else{
      buttons.get(i).clicked();
    }
  }
}

void setup() {
  size(400, 500);
  bar = new CalculusBar(0, 0, width, buttonHeight);
  barResult = new ResultBar(0,buttonHeight,width,buttonHeight);
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
  buttons.add(new ButtonOperator(buttonWidth - 1, height - buttonHeight,buttonWidth,buttonHeight,"."));
  buttons.add(new ButtonOperator((buttonWidth*3) - 1,height - (buttonHeight*2),buttonWidth,buttonHeight,"+"));
  buttons.add(new ButtonOperator((buttonWidth*4) - 1,height - (buttonHeight*2),buttonWidth,buttonHeight,"-"));
  buttons.add(new ButtonOperator((buttonWidth*3) - 1,height - (buttonHeight*3),buttonWidth,buttonHeight,"*"));
  buttons.add(new ButtonOperator((buttonWidth*4) - 1,height - (buttonHeight*3),buttonWidth,buttonHeight,"/"));
  buttons.add(new ButtonOperator((buttonWidth*3) - 1,height - (buttonHeight*4),buttonWidth,buttonHeight,"("));
  buttons.add(new ButtonOperator((buttonWidth*4) - 1,height - (buttonHeight*4),buttonWidth,buttonHeight,")"));
  buttons.add(new ButtonOperator((buttonWidth*3) - 1,height - buttonHeight,(buttonWidth*2),buttonHeight,"="));
  // Setup scientist button
  
  // Setup 2nd function and exit button
  buttons.add(new ButtonOperator(50,50,buttonWidth,buttonHeight,"o"));
}

void draw() {
  background(70, 100, 160);
  bar.render(colorBar);
  barResult.render(colorBarResult);
  for(int i = 0;i < buttons.size();i++){
    buttons.get(i).setResultBar(bar);
    buttons.get(i).render(colorButton);
    buttons.get(i).update();
  }
  for(int i = 0;i < tab.size();i++){
    //println(i + "  " + tab.get(i));
  }
  bar.renderContent();
  //println(result);
}