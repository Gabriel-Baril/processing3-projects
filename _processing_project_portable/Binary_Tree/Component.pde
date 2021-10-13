public class Component {
  int value;
  PVector pos;
  Component parent;
  Component[] child;
  
  public Component(PVector pos,Component parent,Component[] child,int value) {
    this.pos = pos;
    this.value = value;
  }
}
