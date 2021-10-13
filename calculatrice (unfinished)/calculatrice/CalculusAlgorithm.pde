public class CalculusAlgorithm {
  String operator[] = {"+", "-", "*", "/"};
  String digit[] = {"0","1","2","3","4","5","6","7","8","9"};

  public void mainAlgorithm() {
    if (!detectError()) {
      println("CLEAN");
      combineNumber();
      OperationPriority();
    } else {
    }
  }

  private void combineNumber() {
    int nbComb = 0;
    for(int i = 0; i < tab.size(); i++){
      for(int j = 0; j < digit.length; j++){
        if(tab.get(i).equals(digit[j])){
          print("---------------------");
          nbComb++;
        }else{
          nbComb = 0;
        }
        //println("nbComb : " + nbComb);
      }
    }
  }

  private void OperationPriority() {
    for (int i = 0; i < tab.size(); i++) {
      for (int j = 0; j < operator.length; j++) {
        try {
          if (tab.get(i) == operator[j]) {
            switch(operator[j]) {
            case "+":
              result = ((int)tab.get(i-1)) + ((int)tab.get(i+1));
              break;
            case "-":
              result = ((int)tab.get(i-1)) - ((int)tab.get(i+1));
              break;
            case "*":
              result = ((int)tab.get(i-1)) * ((int)tab.get(i+1));
              break;
            case "/":
              result = ((int)tab.get(i-1)) / ((int)tab.get(i+1));
              break;
            }
          }
        }
        catch(ArrayIndexOutOfBoundsException e) {}
      }
    }
  }

  private boolean detectError() {
    for (int i = 0; i < tab.size(); i++) {
      for (int j = 0; j < operator.length; j++) {
        for (int k = 0; k < operator.length; k++) {
          if (i == 0) {
            if (tab.get(i) == operator[k] && tab.get(i+1) == operator[j]) {
              printError(1);
              return true;
            }
          } else {
            if (tab.get(i) == operator[k] && (tab.get(i-1) == operator[j] || tab.get(i+1) == operator[j])) {
              printError(1);
              return true;
            }
          }
        }
      }
    }

    return false;
  }

  private void printError(int errorType) {
    switch(errorType) {
    case 1:
      println("ERROR 1 -- Systactic Error --");
      break;
    case 2:
      println("ERROR 2 -- Max Digit Value --");
      break;
    case 3:
      println("ERROR 3 -- Out of Memory --");
      break;
    case 4:
      println("ERROR 4 -- Saturated Calculation Area--");
      break;
    default :
      println("ERROR -- UNDIFINED --");
      break;
    }
  }
}