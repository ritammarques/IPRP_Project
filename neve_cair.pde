class Floco {
  float px;
  float py;
  float velx;
  float vely;
  color c;
  float diam;
  float velxmax=0.9;
  float nx=0;
  float ny=780;
  int l=1;

  Floco() {
    //coordenadas x
    px=random(0, width);
    //coordenadas y
    py=random(0, height);
    //-0.9, +0.9 velocidade x
    velx=random(-velxmax, velxmax);
    //velocidade y
    vely=random(1, 2);
    //diametro
    diam=random(0, 5);
    //cor
    c=color(255);
  }
  void andar() {
    //movimento da neve a cair
    // se a neve esta entre 0 e width
    if (px>=0 && px<=width) {
      px=px+velx;
    } else
    {// se nao estiver entre 0  e width
      //se as coordenada sao maiores que 0 entao volta a ser 0
      if (px>0) {
        px=0;
      } else {
        // se for menor que 0
        px=width;
      }
    }
    // coordenada y
    if (py<height) {
      py=py+vely;
    } else {
      py=0;
    }
    //desenho da neve
    noStroke();
    fill(c);
    ellipse(px, py, diam, diam);
  }
}