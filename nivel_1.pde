class Bola {
  float x;
  float y;
  float raio;
  color cor;
  float velocidadex;
  float velocidadey;
  float spring = 0.05;
  float nx=0; 
  int y2;

  void nevesubir() {
    //barreira que sobe do fundo do ecrã
    noStroke();
    rectMode(CORNER);
    frameRate(30);
    fill(255);
    rect(nx, ny, width-150, 650);
    if (ny>raiomaior*2+raiomaior/2) { //neve sobe até topo da janela mais diametro da bola maior
      ny=ny-0.2; //sobe 0.2 unidades
    }
  }
  Bola() {
    raio = 40;
    x = round(random(raio+raio/3, width-raio-150));
    y = round(random(raio, height-raio));
    cor = color(random(255), random(255), random(255));
    velocidadex = round(random(1, 3));
    velocidadey = round(random(1, 3));
  }

  void mover(float stop) {
    //movimento das bolas
    //stop - variavel que define paragem do movimento
    x = x + velocidadex*stop;
    y = y + velocidadey*stop;

    //inverte sentido ao colidir com lado esquerdo e direiro
    if ((x<=raio) || x>= width-raio-150) {
      velocidadex=(velocidadex)*(-1);
      x=x+velocidadex;
    }
    //inverte velocidade ao colidir com lado superior e inferior
    // y> ny-raio inverte velocidade ao colidir com a barreira
    if ((y <=raio+raio/3) || y>= ny-raio) {
      velocidadey=(velocidadey)*(-1);
      y=y+velocidadey;
    }
  }
  // se distancia entre o centro de uma bola ao centro de outra bola for inferior ou igual à soma dos seus raios (distancia entre os centros)
  boolean colide(Bola c) {
    if (dist(x, y, c.x, c.y) <= raio + c.raio)
      return true;
    else return false;
  }
  //caso as bolas estejam a colidir, ambas irão inverter o movimento
  void Colisao(Bola c) {
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
  // aumentar o tamanho da bola 1 unidade
  void raiomin() {
    raio=raio+1;
  }
  //distancia do centro da bola ao rato for inferior ao raio da bola
  boolean hit() {
    if (dist(x, y, mouseX, mouseY)<raio) {
      return true;
    } else {
      return false;
    }
  }
  //se o jogador perder irá aparecer "GAME OVER"
  void perder() {
    textAlign(CENTER, CENTER);
    background(0);
    textSize(200);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2);
    totalPontos=pontos;
    textSize(80);
    text1 = Float.toString(int(totalPontos)) + " Points!";
    text(text1, width/2, height/2+150);
  }

  //se o jogador ganhar irá aparecer "YOU WON"
  void ganhou() {
    textAlign(CENTER, CENTER);
    background(0);
    textSize(200);
    fill(255, 0, 0);
    text("YOU WON", width/2, height/2);
  }

  void desenhar() {
    // inicializa a variavel pontos com 0 e soma os pontos de todas as bolas
    //pontos = aumento dos raios das bolas
    pontos=0;
    for (int i=0; i<nbolas; i++) {
      //nota: 40 é o raio inicial das bolas
      pontos= pontos+(b[i].raio-40)/2;
    }
    //se perfizer os 100 pontos ganha e passa para o nível seguinte
    if (pontos>=100) {
      ganhou();
      stage=2;
      totalPontos=pontos;
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

    // desenho das bolinhas dos pontos em cinzento
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

    // desenho das bolinhas dos pontos a vermelho consoante o numero de pontos (multiplos de 10)
    fill(255, 0, 0);
    if (pontos>=100)ellipse(width-75, 32.5, 50, 50);
    if (pontos>=90)ellipse(width-75, 97.5, 50, 50);
    if (pontos>=80)ellipse(width-75, 162.5, 50, 50);
    if (pontos>=70)ellipse(width-75, 227.5, 50, 50);
    if (pontos>=60)ellipse(width-75, 292.5, 50, 50);
    if (pontos>=50)ellipse(width-75, 357.5, 50, 50);
    if (pontos>=40) ellipse(width-75, 422.5, 50, 50);
    if (pontos>=30) ellipse(width-75, 487.5, 50, 50);
    if (pontos>=20) ellipse(width-75, 552.5, 50, 50);
    if (pontos>=10) ellipse(width-75, 617.5, 50, 50);

    // texto do nível
    textAlign(CENTER, CENTER);
    textSize(20);
    fill(255, 0, 0);
    text("LEVEL 1", 990, 20);
  }
}