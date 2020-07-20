class Bola2 {
  float x;
  float y;
  float raio;
  color cor;
  float velocidadex;
  float velocidadey;
  float spring = 0.05;
  float nx=0; 
  int y2;

  //pendulo 
  int r1=400;
  int r2=30;
  float x1, y1;
  int steps=100;
  float alfa=PI/12;
  float v= TWO_PI/steps;
  int npontas=5;
  float teta=TWO_PI/npontas;
  float halfTeta=teta/2;
  float radius1;
  float radius2;

  void nevesubir() {
    // desenho do temporizador colocado à esquerda do ecrã
    noStroke();
    rectMode(CORNER); 
    fill(255);
    rect(nx, ny, 50, 650);
    if (ny>0) {
      ny=ny-0.2;
    }
  }
  Bola2() {
    raio = 40;
    x = random(raio+raio/3, width-raio-150);
    y = random(raio, height-raio);
    cor = color(random(255), random(255), random(255));
    velocidadex = round(random(1, 3));
    velocidadey = round(random(1, 3)); 

    //pendulo
    r1=350;
    r2=30;
    steps=500;
    alfa=PI/12;
    v= TWO_PI/steps;
    npontas=5;
    teta=TWO_PI/npontas;
    halfTeta=teta/2;
    radius1=100;
    radius2=40;
  }


  void mover(float stop) {
    x = x + velocidadex*stop;
    y = y + velocidadey*stop;

    if ((x<=raio) || x>= width-raio-150) {
      velocidadex=velocidadex*(-1);
    }

    if ((y<=raio+raio/3) || y>= height-raio) {
      velocidadey=velocidadey*(-1);
    }
  }
  boolean colide(Bola2 c) {
    if (dist(x, y, c.x, c.y) <= raio + c.raio)
      return true;
    else return false;
  }

  // se distancia entre o centro de uma bola ao centro da estrela-pendulo for inferior ou igual à soma do raio da bola e da estrela (radius1)
  boolean colide2(Bola2 c) {
    if (dist(x, y, c.x1, c.y1) <= raio + c.radius1)
      return true;
    else return false;
  }

  //colisão entre as bolas
  void Colisao(Bola2 c) {
    if (x < c.x) {
      velocidadex = -abs(velocidadex);
      c.velocidadex = abs(c.velocidadex);
    } else {
      velocidadex = abs(velocidadex);
      c.velocidadex = -abs(c.velocidadex);
    }

    if (y < c.y) {
      velocidadey = -abs(velocidadey);
      c.velocidadey = abs(c.velocidadey);
    } else {
      velocidadey = abs(velocidadey);
      c.velocidadey = -abs(c.velocidadey);
    }
  }

  //caso a estrela colida com uma bola, a bola irá inverter o movimento
  void Colisao2(Bola2 c) {
    if (x < c.x1) {
      velocidadex = -abs(velocidadex);
    } else {
      velocidadex = abs(velocidadex);
    }

    if (y < c.y1) {
      velocidadey = -abs(velocidadey);
    } else {
      velocidadey = abs(velocidadey);
    }
  }  

  void raiomin() {
    raio=raio+1;
  }

  boolean hit() {
    if (dist(x, y, mouseX, mouseY)<raio) {
      return true;
    } else {
      return false;
    }
  }
  void perder() {
    textAlign(CENTER, CENTER);
    background(0);
    textSize(200);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2);
    totalPontos=totalPontos+pontos2;
    textSize(80);
    text1 = Float.toString(int(totalPontos)) + " Points!";
    text(text1, width/2, height/2+150);
  }

  void ganhou() {
    textAlign(CENTER, CENTER);
    background(0);
    textSize(200);
    fill(255, 0, 0);
    text("YOU WON", width/2, height/2);
  }

  void desenhar() {
    pontos2=0;
    for (int i=0; i<nbolas2; i++) {
      pontos2= pontos2+(b2[i].raio-40)/2;
    }
    //desenho da argola
    ellipseMode(CENTER);
    noFill();
    strokeWeight(1);
    stroke(0);
    ellipse(x, y-raio-raio/4, raio/4, raio/4);
    //desenho do retangulo preto
    noStroke();
    fill(0);
    rectMode(CENTER);
    rect(x, y-raio, raio/4, raio/4);
    //desenho do circulo principal
    noStroke();
    ellipseMode(CENTER);
    fill(cor);
    ellipse(x, y, raio*2, raio*2);
    //desenho do brilho
    fill(255, 100);
    ellipse(x-raio/3, y-raio/3, raio, raio);
    ellipse(x-raio/6, y-raio/6, raio*1.5, raio*1.5);

    fill(0);
    rectMode(CORNER);
    rect(width-150, 0, width, height);

    fill(150);
    ellipse(width-75, 32.5, 50, 50);
    ellipse(width-75, 97.5, 50, 50);
    ellipse(width-75, 162.5, 50, 50);
    ellipse(width-75, 227.5, 50, 50);
    ellipse(width-75, 292.5, 50, 50);
    ellipse(width-75, 357.5, 50, 50);
    ellipse(width-75, 422.5, 50, 50);
    ellipse(width-75, 487.5, 50, 50);
    ellipse(width-75, 552.5, 50, 50);
    ellipse(width-75, 617.5, 50, 50);

    fill(255, 0, 0);
    if (pontos2>=100)ellipse(width-75, 32.5, 50, 50);
    if (pontos2>=90)ellipse(width-75, 97.5, 50, 50);
    if (pontos2>=80)ellipse(width-75, 162.5, 50, 50);
    if (pontos2>=70)ellipse(width-75, 227.5, 50, 50);
    if (pontos2>=60)ellipse(width-75, 292.5, 50, 50);
    if (pontos2>=50)ellipse(width-75, 357.5, 50, 50);
    if (pontos2>=40) ellipse(width-75, 422.5, 50, 50);
    if (pontos2>=30) ellipse(width-75, 487.5, 50, 50);
    if (pontos2>=20) ellipse(width-75, 552.5, 50, 50);
    if (pontos2>=10) ellipse(width-75, 617.5, 50, 50);

    textAlign(CENTER, CENTER);
    textSize(20);
    fill(255, 0, 0);
    text("LEVEL 2", 990, 20);
  }

  void desenharPendulo() {
    //desenho do linha que liga o topo da janela ao centro da estrela
    stroke(20);
    line((width-150)/2, 0, x1, y1);
    noStroke();
    //desenho da estrela
    beginShape();
    fill(255, 255, 0);
    x1=(width-150)/2+ r1* cos(alfa);
    y1=0 + r1* sin(alfa);
    for ( float a=0; a<TWO_PI; a+=teta) {
      float sx=x1+cos(a)*radius2;
      float sy=y1+sin(a)*radius2;
      vertex(sx, sy);
      sx=x1+cos(a+halfTeta)*radius1;
      sy=y1+sin(a+halfTeta)*radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    //movimento pendular da estrela
    if (alfa>PI-PI/12 ||alfa<PI/12)
      v=-v;
    alfa=alfa+v;
  }
}