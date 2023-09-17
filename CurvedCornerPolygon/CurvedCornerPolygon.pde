Polygon poly;

void mouseDragged()
{
  poly.checkMouseVertexCollision();
}

void mouseClicked()
{
  poly.addVertex(buildVertex(mouseX, mouseY, 10));
}

void setup()
{
  size(800, 800);
  poly = new Polygon();
  poly.addVertex(buildVertex(200, 200, 10));
  poly.addVertex(buildVertex(300, 220, 50));
  poly.addVertex(buildVertex(350, 260, 20));
}

void draw()
{
  background(120, 120, 120);
  poly.render();
}
