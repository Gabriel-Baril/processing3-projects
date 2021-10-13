public class Fractal {
  int generation = 0;
  ArrayList<Line> vonKoch;
  ArrayList<Line> temp;

  public Fractal() {
    vonKoch = new ArrayList<Line>();
    temp = new ArrayList<Line>();

    vonKoch.add(new Line(new PVector(0, height - 100), new PVector(width, height - 100), 0));
  }

  public void show() {
    for (int i = 0; i < vonKoch.size(); i++) {
      vonKoch.get(i).show();
    }
  }

  public void generate() {
    for (int i = 0; i < vonKoch.size(); i++) {
      vonKoch.get(i).generate(this.temp);
    }

    vonKoch.clear();

    for (int i = 0; i < temp.size(); i++) {
      vonKoch.add(new Line(temp.get(i)));
    }

    temp.clear();

    generation++;
  }
}
