ArrayList<Mitosis> mito = new ArrayList<Mitosis>();

void mousePressed() {
  for (int i = 0; i < mito.size(); i++) {
    float dx = mito.get(i).pos.x - mouseX;
    float dy = mito.get(i).pos.y - mouseY;
    float distance = sqrt(dx*dx + dy*dy);
    if (distance < mito.get(i).radius - distance/2) {
      if (mito.get(i).radius/2 > 5) {
        mito.get(i).splitMit();
      }
    }
  }
}

void setup() {
  size(1000, 1000);
  for (int i = 0; i < 500; i++) {
    mito.add(new Mitosis(random(width), random(height), random(5), color((int)random(255), (int)random(255), (int)random(255), (int)random(255))));
  }
}

void draw() {
  frameRate(30);
  background(81);
  if (keyCode == 67) { // Supprime tout les mitosis
    mito.clear();
  }

  if (keyCode == 83) { // Split au maximum tout les mitosis
    for (int i = 0; i < mito.size(); i++) {
      if (mito.get(i).radius/2 > 5) {
        mito.get(i).splitMit();
      }
    }
  }

  for (int i = 0; i < mito.size(); i++) {
    for (int j = 0; j < mito.size(); j++) {
      if (i != j) {
        try{
          float dx = mito.get(i).pos.x - mito.get(j).pos.x;
          float dy = mito.get(i).pos.y - mito.get(j).pos.y;
          float distance = sqrt(dx*dx + dy*dy);
          if (distance <= mito.get(i).radius/2 + mito.get(j).radius/2) {
            mito.add(new Mitosis(mito.get(j).pos.x,mito.get(j).pos.y,mito.get(j).radius + mito.get(i).radius,color((int)random(255), (int)random(255), (int)random(255), (int)random(255))));
            mito.remove(j);
            mito.remove(i);
          }
        }catch(IndexOutOfBoundsException e){
          e.printStackTrace();
          continue;
        }
      }
    }
  }

  for (int i = 0; i < mito.size(); i++) {
    mito.get(i).render();
    mito.get(i).collideEdges();
    mito.get(i).update();
  }
}