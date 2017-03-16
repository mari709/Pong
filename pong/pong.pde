PFont f;

float posicionX, posicionY;
float velocidadX, velocidadY;
float tamPelota;
float barraY1, barraY2 ;
float anchoBarra, altoBarra;
float velocidadBarra;
int puntaje1, puntaje2;

boolean w, s, up, down;


void setup() {
  size (800, 600);
  f=loadFont("Andy-Bold-48.vlw");

  tamPelota =40;
  posicionX=tamPelota*1.20;
  posicionY=tamPelota*1.20;
  velocidadX=3;
  velocidadY=4;
  barraY1 = height/4;
  barraY2 = height/4;
  anchoBarra = width*0.035;
  altoBarra = height/4;
  velocidadBarra = 4;
}

void draw() {
  background(0);
  textFont(f);

  textAlign(CENTER);
  fill(255,255, 0);
  text("PONG", width/2, 2*height/20, 0);
    fill(0, 255, 0);
  text("Marina Mansueto", width/2, 19*height/20, 0);
    fill(255, 0, 0);
  text(puntaje1 + "/" + puntaje2, width/6, 2*height/20, 0);

  noStroke();
  fill(240, 255, 255);
  ellipse(posicionX, posicionY, tamPelota, tamPelota);
  fill(200, 15, 255);
  rect(10, barraY1, anchoBarra, altoBarra);
  fill(255, 155, 2);
  rect(width-(anchoBarra+10), barraY2, anchoBarra, altoBarra);
  posicionX +=velocidadX;
  posicionY +=velocidadY;
  
    //si hay colision con la barra izquierda
  if (posicionX<10+anchoBarra+tamPelota/2 && posicionY > barraY1 && posicionY < barraY1 + altoBarra) {
    velocidadX *=-1;
    puntaje1 +=1 ;

  }

  //si hay colision con la barra derecha
  if (posicionX > width - (10+anchoBarra+tamPelota/2) && posicionY > barraY2 && posicionY <barraY2 + altoBarra) {
    velocidadX *=-1;
    puntaje2 +=1 ;
    println(puntaje2);
  }

  if (posicionX > width - tamPelota/2 || posicionX < 0+tamPelota/2) {
    posicionX = width/2;
    velocidadX *=-1;
  }
  if (posicionY > height - tamPelota/2 || posicionY < 0+tamPelota/2) {
    //posicionY = height/2;
    velocidadY *=-1;
    
  }


  if (up) {
    barraY2 -=velocidadBarra;
  }
  if (down) {
    barraY2 +=velocidadBarra;
  }
  if (w) {
    barraY1 -=velocidadBarra;
  }
  if (s) {
    barraY1 +=velocidadBarra;
  }
}
void keyPressed() {
  if (keyCode == UP) {
    up = true;
  }
  if (keyCode == DOWN) {
    down = true;
  }
  if (key == 'w') {
    w = true;
  }
  if (key == 's') {
    s = true;
  }
}

//metodo que se complementa con keyPressed para que puedan jugar ambos jugadores simultaneamente
void keyReleased() {
  if (key == 's' || key =='S') {
    s = false;
  }

  if (key == 'w'|| key == 'W') {
    w = false;
  }

  if (keyCode == UP) {
    up = false;
  }

  if (keyCode == DOWN) {
    down = false;
  }
}