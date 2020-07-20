class Bola3 {
  //variaveis
  float x;
  float y;
  float raio;
  color cor;
  float velocidadex;
  float velocidadey;
  float spring = 0.05;
  float nx=0; 
  int y2;
//temporizador
  void nevesubir() {
    noStroke();
    rectMode(CORNER); 
    fill(255);
    rect(nx, ny, 50, 650);
    if (ny>0) {
      ny=ny-0.2;
    }
  }
  Bola3() {
    //valores variaveis
    raio = 40;
    x = random(raio+raio/3, width-raio-150);
    y = random(raio, height-raio);
    cor = color(random(255), random(255), random(255));
    velocidadex = round(random(1, 3));
    velocidadey = round(random(1, 3));
  }
//para parar se stop== 0
  void mover(float stop) {
    x = x + velocidadex*stop;
    y = y + velocidadey*stop;
// se esta fora da janela -->150--> valor da argola bola
    if ((x<=raio) || x>= width-raio-150) {
      velocidadex=velocidadex*(-1);
    }
// se esta fora da janela
    if ((y<=raio+raio/3) || y>= height-raio) {
      velocidadey=velocidadey*(-1);
    }
  }
//colisao entre bolas
// bola3c--> valor que controla
  boolean colide(Bola3 c) {
    // distancia entre x e outros x's
    if (dist(x, y, c.x, c.y) <= raio + c.raio)
    // se for menor ou igual ao valor do raio entao a colisao é verdadeira --> ou seja volta para traz
      return true;
      // se nao a colisao e falsa
    else return false;
  }

// bola3c--> valor que controla
  void Colisao(Bola3 c) {
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

//aumentarr raio
  void raiomin() {
    raio=raio+1;
  }
// se o rato esta em cima da bola
  boolean hit() {
    if (dist(x, y, mouseX, mouseY)<raio) {
      return true;
    } else {
      return false;
    }
  }
  // para perder
  void perder() {
    textAlign(CENTER, CENTER);
    background(0);
    textSize(200);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2);
    totalPontos=totalPontos+pontos3;
    textSize(80);
    text1 = Float.toString(int(totalPontos)) + " Points!";
    text(text1, width/2, height/2+150);
  }
//ganhar
  void ganhou() {
    textAlign(CENTER, CENTER);
    background(0);
    textSize(200);
    fill(255, 0, 0);
    text("YOU WON", width/2, height/2-200);
    totalPontos=totalPontos+pontos3;
    textSize(80);
    text1 = Float.toString(int(totalPontos)) + " Points!";
    text(text1, width/2, height/2+100); 
    textSize(40);
    text("There are no more levels in the free version.", width/2, height/2+250);
  }
// desenho das bolas
  void desenhar() {
    pontos3=0;
    for (int i=0; i<nbolas3; i++) {
      pontos3= pontos3+(b3[i].raio-40)/2;
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
    // pontos
    
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
    if (pontos3>=100)ellipse(width-75, 32.5, 50, 50);
    if (pontos3>=90)ellipse(width-75, 97.5, 50, 50);
    if (pontos3>=80)ellipse(width-75, 162.5, 50, 50);
    if (pontos3>=70)ellipse(width-75, 227.5, 50, 50);
    if (pontos3>=60)ellipse(width-75, 292.5, 50, 50);
    if (pontos3>=50)ellipse(width-75, 357.5, 50, 50);
    if (pontos3>=40) ellipse(width-75, 422.5, 50, 50);
    if (pontos3>=30) ellipse(width-75, 487.5, 50, 50);
    if (pontos3>=20) ellipse(width-75, 552.5, 50, 50);
    if (pontos3>=10) ellipse(width-75, 617.5, 50, 50);
// texto nivel 3
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(255, 0, 0);
    text("LEVEL 3", 990, 20);
  }
}