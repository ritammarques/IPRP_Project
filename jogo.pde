//menu
// variavel para definir os niveis (0-menu, 1,2,3 -niveis)
int stage = 0;
//constantes para estrutura SWITCH CASE para escolher de menu e niveis
final int MENU = 0;
final int NIVEL1 = 1;
final int NIVEL2 = 2;
final int NIVEL3 = 3;

int stageaux;
float totalPontos;
String text1;

int text;
//arrays
Nivel[] n= new Nivel[25];
Neve2 [] n2= new Neve2 [51];
Luz[] l= new Luz[7];

//musica
import processing.sound.*;
SoundFile file;

//nível1
int nbolas=2;
int parar= 0;
int nflocos = 2000;
int lado=width/20;
float ny=650;
float raio=40;
float raiomaior;
float pontos;
Floco [] flocos = new Floco [nflocos];
Bola[] b =new Bola [nbolas];

//nível2
int nbolas2=4;
int parar2= 0;
int lado2=width/20;
float ny2=650;
float pontos2;
Bola2 meuPendulo;
Bola2[] b2 =new Bola2 [nbolas2];  

//nível3
int nbolas3=6;
int parar3= 0;
//int nflocos3 = 2000;
int lado3=width/20;
float ny3=650;
float pontos3;
int nestrelas=8;
Bola3[] b3 =new Bola3 [nbolas3];
Estrela [] est = new Estrela [nestrelas];

void setup() {
  size(1200, 650);

  //************************  MÚSICA  ************************************
  file = new SoundFile(this, "JingleBells.mp3");
  file.play();

  //************************  MENU  ************************************  
  int lado=width/20;
  //construção dos objetos - niveis, neve,flocos e luzes - através das suas classes
  for (int i=0; i<5; i++) {
    for ( int j=0; j<5; j++) { 
      n[i]=new Nivel(width/2+(lado*2*i)+lado, height/8+(lado*2*j), lado);
    }
  }
  for (int l=0; l<51; l++) {
    n2[l]=new Neve2((width/50*l)+width/100, height, width/50);
  }
  for (int m=0; m<7; m++) {
    l[m]= new Luz(width/6*m, 0, width/6);
  }

  for (int k=0; k<nflocos; k++) {
    flocos[k]= new Floco();
  }
  //************************  NÍVEL 1 ************************************    
  for (int i=0; i<nbolas; i++) {
    b[i]=new Bola();
  }

  //************************  NÍVEL 2 ************************************ 
  meuPendulo = new Bola2();

  for (int i=0; i<nbolas2; i++) {
    b2[i]=new Bola2();
  }

  //************************  NÍVEL 3 ************************************ 
  for (int l=0; l<nestrelas; l++) {
    est [l] = new Estrela();
  }
  for (int i=0; i<nbolas3; i++) {
    b3[i]=new Bola3();
  }
}

void draw() {
  // estrutura de controle SWITCH CASE - seleciona o void de acordo com a opção stage
  switch(stage) {
  case MENU:
    menu();
    break;
  case NIVEL1:
    nivel1();
    break;
  case NIVEL2:
    nivel2();
    break;
  case NIVEL3:
    nivel3();
    break;
  }
  // estrutura de controle IF - alternativa à estrutura de controle SWITCH CASE
  /*
  if (stage==0) {
   menu();
   }
   if (stage==1) {
   nivel1();
   }
   if (stage==2) {
   nivel2();
   }
   if (stage==3) {
   nivel3();
   }
   */
}  
//************************   MENU   ************************************    
void menu() {
  int lado=width/20;
  background(0, 82, 0);
  rectMode(CORNER);
  for (int k=0; k<nflocos; k++) {
    flocos[k].andar();
  }
  for (int i=0; i<5; i++) {
    for ( int j=0; j<5; j++) {
      n[i]=new Nivel(width/2+(lado*2*i)+lado, height/8+(lado*2*j), lado);        
      n[i].desenhar();
      //se rato estiver em cima do botão do nível calcula o nível
      if (n[i].nivelHit()) {
        // (i,j)=(0,0) vai ser nível 1 - (0+1)*(5*0+1)=1
        stageaux=(i+1)*(5*j+1);
      }
      // não seleciona níveis superiores a 3
      if (stageaux<4) {
        stage=stageaux;
      }
      //desenho do número do nível
      textSize(50);
      textAlign(CENTER);
      fill(0, 82, 0);
      text=(i+1*j*5)+1;
      text(text, width/2+(lado*2*i)+lado, height/8+(lado*2*j)+15);
    }
  }
  // neve do fundo
  for (int l=0; l<51; l++) {
    n2[l]=new Neve2((width/50*l)+width/100, height, width/50);
    n2[l]. desenhar();
  }
  fill(255, 0, 0);
  textSize(40);
  rect(width/6+70, height/6*4, width/3, width/12+50, 10); 
  fill(255);
  text("CHOOSE LEVEL", width/6+70, height/6*4-20);
  textSize(15);
  text("ONCE YOU START PLAYING", width/6+70, height/6*4+10);
  text("YOU CANNOT SOP", width/6+70, height/6*4+30);
  text("UNLESS YOU LOSE", width/6+70, height/6*4+50);

  fill(255);
  textSize(90);
  text("MERRY", width/6+70, height/8+100);
  text("  CHRISTMAS  ", width/6+70, height/4+100);
  for (int m=0; m<7; m++) {
    l[m]= new Luz(width/6*m, 0, width/6);
    l[m]. desenhar();
  }
} 
//************************  NÍVEL 1 ************************************     
void nivel1() {    
  background(50, 50, 255);
  // parar=0 jogo continua
  if (parar==0) {
    b[0].nevesubir();
    for (int k=0; k<nflocos; k++) {
      flocos[k].andar();
    }
  }
  for (int i=0; i<nbolas; i++) {
    // determina qual é o maior raio entre todas as bolas
    if (raiomaior<b[i].raio) raiomaior=b[i].raio;
    // se a barreira de neve chegar ao valor máximo (explicado na classe) e tiver menos de 100 pontos
    if ((pontos<100) && (ny<=raiomaior*2+raiomaior/2)) {
      // parar=1 jogo pára
      parar=1;
    }

    if (parar == 0) {
      // stop=1 (elemento neutro da multiplicação) continua a mover 
      b[i].mover(1);
      b[i].desenhar();
    }
    //se bolas colidem ao aumentar de tamanho
    if (b[i].hit()) {
      if (parar==0) b[i].raiomin();
      for (int j=0; j<nbolas; j++) {
        if (j!=i) { // j!=i - exclui a colisão consigo própria
          if (b[i].colide(b[j])) {
            // stop=0 (elemento absorvente da multiplicação) pára de mover
            b[i].mover(0);
            // variavel de controle quando o jogo pára
            parar=1;
            //b[i].perder();
            //noLoop();
          }
        }
      }
    }
  }
  // jogo parado aparece "GAME OVER"
  if (parar==1) {
    b[0].perder();
    noLoop();
  }  


  for (int i=0; i<nbolas; i++) {
    for (int j=i+1; j<nbolas; j++) {
      if (b[i].colide(b[j])) {
        b[i].Colisao(b[j]);
      }
    }
  }
}
//************************  NÍVEL 2 ************************************   
void nivel2() {
  background(50, 50, 255);
  frameRate(40);
  if (parar==0) {
    b2[0].nevesubir(); 
    meuPendulo.desenharPendulo();
    for (int k=0; k<nflocos; k++) {
      flocos[k].andar();
    }
  }
  for (int i=0; i<nbolas2; i++) {
    if (raiomaior<b2[i].raio) raiomaior=b2[i].raio;
    if ((pontos2<100) && (ny<=0)) {
      parar=1;
    }
    if (pontos2>=100) {
      //parar=1;
      //b2[0].ganhou();
      stage=3;
    }
    if (parar == 0) {
      b2[i].mover(1);
      b2[i].desenhar();
    }
    if (b2[i].hit()) {
      if (parar==0) b2[i].raiomin();
      for (int j=0; j<nbolas2; j++) {
        if (j!=i) {
          if (b2[i].colide(b2[j])) {
            b2[i].mover(0);
            parar=1;
            //b2[0].perder();
            //noLoop();
          }
        }
      }
    }
  }
  if (parar==1) {
    b2[0].perder();
    noLoop();
  }
  //print(" Pontos2 = "+pontos2);
  if (pontos2>=100) {
    totalPontos=totalPontos+pontos2;
    //ganhou();
    stage=3;
  }  


  for (int i=0; i<nbolas2; i++) {
    for (int j=i+1; j<nbolas2; j++) {
      if (b2[i].colide(b2[j])) {
        b2[i].Colisao(b2[j]);
      }
    }
  }

  for (int i=0; i<nbolas2; i++) {
    if (b2[i].colide2(meuPendulo)) {
      b2[i].Colisao(meuPendulo);
      // se estrela colidir com uma bola já aumentada, a bola retoma ao seu valor inicial
      b2[i].raio=40;
    }
  }
} 

//************************  NÍVEL 3 ************************************  
void nivel3() {
  background(50, 50, 255);
  frameRate(40);
  // movimento da neve
  if (parar3==0) {
    b3[0].nevesubir(); 
    for (int k=0; k<nflocos; k++) {
      flocos[k].andar();
    }
  }
  //movimento estrelas
  for (int i=0; i<nestrelas; i++) {
    // se ainda nao perdeu
    if (parar3==0) {
      est[i].desenhar();
      est[i].andar();
    }
    // se ja perdeu
    if (est[i].hit()) {
      parar3=1;
      est[i].perder2();
      noLoop();
    }
  }
  //movimento bolas
  for (int i=0; i<nbolas3; i++) {
    // aumaento dos raios ate aos 100
    if (raiomaior<b3[i].raio) raiomaior=b3[i].raio;
    // se ainda tive um raio menor que 100 e as bolas se tocam perde
    if ((pontos3<100) && (ny<=0)) {
      b3[0].perder();
      parar3=1;
      // nao repete (framerate)
      noLoop();
    }

    if (parar3 == 0) {
      //movimento da bolas
      b3[i].mover(1);
      //desenhho das bolas
      b3[i].desenhar();
    }
    // se a distancia do xy a mousex, mouseY e menor que o raio
    if (b3[i].hit()) {
      // o raio aumenta se parar3==0
      if (parar3==0) b3[i].raiomin();
      for (int j=0; j<nbolas3; j++) {
        if (j!=i) {
          // se colidem entao para 
          if (b3[i].colide(b3[j])) {
            b3[i].mover(0);
            parar3=1;
          }
        }
      }
    }
  }
  //perde-se
  if (parar3==1) {
    b3[0].perder();
    // nao volta a fazer framerate aparece " you lost"
    noLoop();
  } 
  //se se gahna nao faz loop e aparece que "you won"
  if (pontos3>=100) {
    parar3=1;
    b3[0].ganhou();
    //volta ao menu
    stage=0;
    noLoop();
  } 
//colisao de bolas
  for (int i=0; i<nbolas3; i++) {
    for (int j=i+1; j<nbolas3; j++) {
      if (b3[i].colide(b3[j])) {
        b3[i].Colisao(b3[j]);
      }
    }
  }
}