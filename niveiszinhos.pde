class Nivel {
  float x, y;
  float lado;

  Nivel(float xl, float yl, float l) { 
    x=xl;
    y=yl;
    lado=l;
  }
  void desenhar() {
    //desenho dos níveis
    rectMode(CENTER);
    fill(255, 0, 0);
    noStroke();
    rect(x, y, lado, lado, 7);
    
    //desenho da neve nos níveis
    noStroke();
    fill(255);
    arc(x-lado/4, y-lado/2, lado/4, lado/4, 0, PI);
    arc(x+lado/4*2, y-lado/2, lado/2, lado/4, 0, PI);
    arc(x-lado/4*3, y-lado/2, lado/2, lado/4, 0, PI);
    arc(x-lado/4, y-lado/2, lado/4, lado/4, 0, PI);
  }
  
  //saber se o rato está dentro do desenho do retângulo do nível
  boolean nivelHit() {
    if (dist(x, y, mouseX, mouseY)<lado/2 && mousePressed==true) {
      return true;
    } else {
      return false;
    }
  }
}