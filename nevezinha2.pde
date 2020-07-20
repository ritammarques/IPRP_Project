class Neve2 {

  float x;
  float y;
  float lado;


  Neve2(float xin, float yin, float l) {
    x=xin;
    y=yin;
    lado=l;
  }
  void desenhar() {
    //desenho da neve no fundo da janela no menu
    float m=20;
    m=m+ random(-5, 5);
    noStroke();
    fill(255);
    arc(x, y, lado+random(-5, 5), m, PI, TWO_PI);
  }
}