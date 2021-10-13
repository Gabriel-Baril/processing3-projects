LinearEquation eq = new LinearEquation(22.1,18.54);

int nBDecimal(float x){
  if(x % (int)x == 0){
    return 0;
  }else{
    String t_number = String.valueOf((double)x);
    for(int i = 0;i < t_number.length();i++){
      if(t_number.charAt(i) == '.'){
        return t_number.length() - i - 1;
      }
    }
  }
  return -1;
}

void setup(){
  size(200,200);
  eq.show();
}

void draw(){
  
}
