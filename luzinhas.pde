class Luz {
  float x, y;
  float raio;

  Luz(float xin, float yin, float r) {
    x=xin;
    y=yin;
    raio=r;
  }
  void desenhar() {
    //desenho das luzes do menu
    raio=width/6;
    noFill();
    strokeWeight(3);
    stroke(0);
    arc(x, y, raio, 50, 0, PI);
    for (int i=1; i<4; i++) {
      rectMode(CENTER);
      fill(0);
      rect(x+width/6*cos(PI/4*i), y+50*sin(PI/4*i), 5, 7);
      noStroke();
      fill(random(255), random(255), random(255));
      ellipse(x+width/6*cos(PI/4*i), y+50*sin(PI/4*i), 10, 30);
    }
  }
}