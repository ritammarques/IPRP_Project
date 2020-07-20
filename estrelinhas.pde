class Estrela {
  float x, y, speedx, speedy, a, b;

  Estrela () {
    x=random(30, width-180);
    y=random(30, height-30);
    speedx=random(-2, 2);
    speedy=random(-2, 2);
    a=60;
    b=20;
  }
  void desenhar() {
    //desenho da estrela
    fill(255, 255, 0);
    noStroke();
    beginShape();

    vertex(x+a*cos(TWO_PI/5*0), y+a*sin(TWO_PI/5*0));
    vertex(x+b*cos(TWO_PI*0*TWO_PI/10), y+b*sin(TWO_PI/0*5+TWO_PI/10));

    vertex(x+b*cos(TWO_PI/5*5+TWO_PI/10), y+b*sin(TWO_PI/5*5+TWO_PI/10));

    vertex(x+a*cos(TWO_PI/5), y+a*sin(TWO_PI/5));
    vertex(x+b*cos(TWO_PI/5+TWO_PI/10), y+b*sin(TWO_PI/5+TWO_PI/10));

    vertex(x+a*cos(TWO_PI/5*2), y+a*sin(TWO_PI/5*2));
    vertex(x+b*cos(TWO_PI/5*2+TWO_PI/10), y+b*sin(TWO_PI/5*2+TWO_PI/10));

    vertex(x+a*cos(TWO_PI/5*3), y+a*sin(TWO_PI/5*3));
    vertex(x+b*cos(TWO_PI/5*3+TWO_PI/10), y+b*sin(TWO_PI/5*3+TWO_PI/10));


    vertex(x+a*cos(TWO_PI/5*4), y+a*sin(TWO_PI/5*4));
    vertex(x+b*cos(TWO_PI/5*4+TWO_PI/10), y+b*sin(TWO_PI/5*4+TWO_PI/10));

    endShape(CLOSE);
  }
  void perder2() {
    //se perder aparece "GAME OVER"
    textAlign(CENTER, CENTER);
    background(0);
    textSize(200);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2);
  }
  void andar() {
    //movimento das estrelas aleatório
    x=x+speedx;
    y=y+speedy;

    if (x+a>=width || x-a<= 0) {
      speedx=speedx*-1;
    }
    if (y+a>=height || y-a<= 0) {
      speedy=speedy*-1;
    }
  }

  boolean hit() {
    //se a distância do centro da estrela à posição do rato for inferior ao raio da estrela (a)
    if (dist(x, y, mouseX, mouseY)< a) {
      return true;
    } else {
      return false;
    }
  }
}