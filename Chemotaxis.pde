Planets[] holey;
BlackHole Holed = new BlackHole();
dong[] ast;
int radius = (int)(Math.random()*100)+50;;
int S = 0;
int count = 0;
int blue = (int)(Math.random()*10)+1;
int gray = (int)(Math.random()*500)+200;
PImage bg;
void setup()
{
  holey = new Planets[gray];
  ast = new dong[blue];
  for (int i=0; i < holey.length; i++)
    holey[i] = new Planets();

  for (int i=0; i < ast.length; i++)
    ast[i] = new dong();
  size(900, 900);
  bg=loadImage("Bijuudama.jpg");
}

void draw()
{
  image(bg, 0, 0,900, 900);

  for (int k = 0; k < holey.length; k ++)
  {
    holey[k].show();
  }
 

  if (S == 1) {
    for (int i = 0; i < holey.length; i ++)
    {
      holey[i].distance();
      holey[i].walk();
    }
  }

  for (int i = 0; i < ast.length; i ++)
  {

    ast[i].show();
  }

  if (S == 1) {
    for (int i = 0; i <ast.length; i ++)
    {

      ast[i].distance();
      ast[i].walk();
    }
  }

  Holed.show();
}


class Planets
{
  float myX, myY, mySize, distR, distX, distY, Asteroid, myCA, AX, AY, AR, ADX, ADY, b ;
  int myColor;
  Planets()
  {
    myX = (int)random(width);
    myY = (int)random(width);
    AX = (int)random(width);
    AY = (int)random(width);
    mySize = 3+(int)(Math.random()*25);
    Asteroid = 40+(int)(Math.random()*30);
    myCA =(int)(Math.random()*35+100);
    b =(int)(Math.random()*80+150);
  }

  void walk()
  {
    if (myX <= 450 && distR < radius*2 && distR > radius*1.2) {
      myX = myX + (radius*radius*0.005)/(2.5*(distX));
    }
    if (myX > 450 && distR < radius*2 && distR > radius*1.2) {
      myX = myX - (radius*radius*0.005)/(2.5*(distX));
    }
    if (myX <= 450 && distR < radius*1.2) {
      myX = myX + (radius*radius*0.005)/(1.7*(distX));
    }
    if (myX > 450 && distR < radius*1.2) {
      myX = myX - (radius*radius*0.005)/(1.7*(distX));
    }

    if (myY <= 450 && distR < radius*2 && distR > radius*1.2) {
      myY = myY + (radius*radius*0.005)/(2.5*(distY));
    }

    if (myY > 450 && distR <= radius*2 && distR > radius*1.2) {
      myY = myY - (radius*radius*0.005)/(2.5*(distY));
    }
    if (myY <= 450 && distR <= radius*1.2) {
      myY = myY + (radius*radius*0.005)/(1.7*(distY));
    }

    if (myY > 450 && distR <= radius*1.2) {
      myY = myY - (radius*radius*0.005)/(1.7*(distY));
    }
    if (distR <= radius*0.515)
      myX = myY = 450;

    if (distR <= radius*0.515 && distR >= radius *0.5){
      radius = radius + (int)(145*log(mySize+2.7)/radius);
      count = count + 1;
    }
  }
  void show()
  {
    if(mySize<21)
    {
      fill(255, 255, 255);
    }else {
      fill(0);
    }
    ellipse(myX, myY, mySize, mySize);
  }
  void distance() {
    distR = dist(myX, myY, 450, 450);
    distX = dist(myX, 450, myX, myY);
    distY = dist(450, myY, myX, myY);
    AR = dist(AX, AY, 450, 450);
    ADX = dist(AX, 450, AX, AY);
    ADY = dist(450, AY, AX, AY);
  }
}

class BlackHole
{
  BlackHole()
  {
    radius = 1;
  }
  void show() {
    fill(0);
        if (radius > 499)
    fill(0);
    ellipse(450, 450, radius, radius);
  }
  void field() {
    fill(30, 30, 30, 120);
    ellipse(450, 450, radius, radius);
  }
}

void mousePressed() {
  S = 1;
}

class dong
{  
  float Asteroid, myCA, AX, AY, AR, ADX, ADY, b ;
  int myColor;
  dong()
  {

    AX = (int)random(width);
    AY = (int)random(width);
    Asteroid = 20+(int)(Math.random()*30);
    myCA =(int)(Math.random()*35+100);
    b =(int)(Math.random()*80+150);
  }

  void distance() {
    AR = dist(AX, AY, 450, 450);
    ADX = dist(AX, 450, AX, AY);
    ADY = dist(450, AY, AX, AY);
  }
  void show()
  {
    fill(255, 255, 255);
    ellipse(AX, AY, Asteroid, Asteroid);
  }
  void walk() {

    if (AR <= radius*0.515 && AR >= radius *0.5){
      radius = radius + (int)(50*Asteroid/radius)/2;
      count = count +1;}
     




    if (AX <= 450 && AR < radius*2.4) {
      AX = AX + (radius*radius*0.005)/(4*(ADX));
    }
    if (AX > 450 && AR < radius*2.4) {
      AX = AX - (radius*radius*0.005)/(4*(ADX));
    }


    if (AY <= 450 && AR < radius*2.4 ) {
      AY = AY + (radius*radius*0.005)/(4*(ADY));
    }

    if (AY > 450 && AR <= radius*2.4 ) {
      AY = AY - (radius*radius*0.005)/(4*(ADY));
    }
    
    if (AR <= radius*0.515){
      AX = 450;
      AY = 450;
}
  }
}
/*
 Planets[] holey;
BlackHole Holed = new BlackHole();
dong[] ast;
int radius = (int)(Math.random()*100)+50;;
int S = 0;
int count = 0;
int blue = (int)(Math.random()*10)+1;
int gray = (int)(Math.random()*500)+200;
PImage bg;
void setup()
{
  holey = new Planets[gray];
  ast = new dong[blue];
  for (int i=0; i < holey.length; i++)
    holey[i] = new Planets();

  for (int i=0; i < ast.length; i++)
    ast[i] = new dong();
  size(900, 900);
  bg=loadImage("Bijuudama.jpg");
}

void draw()
{
  background(bg);

  for (int k = 0; k < holey.length; k ++)
  {
    holey[k].show();
  }
 

  if (S == 1) {
    for (int i = 0; i < holey.length; i ++)
    {
      holey[i].distance();
      holey[i].walk();
    }
  }

  for (int i = 0; i < ast.length; i ++)
  {

    ast[i].show();
  }

  if (S == 1) {
    for (int i = 0; i <ast.length; i ++)
    {

      ast[i].distance();
      ast[i].walk();
    }
  }

  Holed.show();
}


class Planets
{
  float myX, myY, mySize, distR, distX, distY, Asteroid, myCA, AX, AY, AR, ADX, ADY, b ;
  int myColor;
  Planets()
  {
    myX = (int)random(width);
    myY = (int)random(width);
    AX = (int)random(width);
    AY = (int)random(width);
    mySize = 3+(int)(Math.random()*25);
    Asteroid = 40+(int)(Math.random()*30);
    myCA =(int)(Math.random()*35+100);
    b =(int)(Math.random()*80+150);
  }

  void walk()
  {
    if (myX <= 450 && distR < radius*2 && distR > radius*1.2) {
      myX = myX + (radius*radius*0.005)/(2.5*(distX));
    }
    if (myX > 450 && distR < radius*2 && distR > radius*1.2) {
      myX = myX - (radius*radius*0.005)/(2.5*(distX));
    }
    if (myX <= 450 && distR < radius*1.2) {
      myX = myX + (radius*radius*0.005)/(1.7*(distX));
    }
    if (myX > 450 && distR < radius*1.2) {
      myX = myX - (radius*radius*0.005)/(1.7*(distX));
    }

    if (myY <= 450 && distR < radius*2 && distR > radius*1.2) {
      myY = myY + (radius*radius*0.005)/(2.5*(distY));
    }

    if (myY > 450 && distR <= radius*2 && distR > radius*1.2) {
      myY = myY - (radius*radius*0.005)/(2.5*(distY));
    }
    if (myY <= 450 && distR <= radius*1.2) {
      myY = myY + (radius*radius*0.005)/(1.7*(distY));
    }

    if (myY > 450 && distR <= radius*1.2) {
      myY = myY - (radius*radius*0.005)/(1.7*(distY));
    }
    if (distR <= radius*0.515)
      myX = myY = 450;

    if (distR <= radius*0.515 && distR >= radius *0.5){
      radius = radius + (int)(145*log(mySize+2.7)/radius);
      count = count + 1;
    }
  }
  void show()
  {
    if(mySize<21)
    {
    	fill(255, 255, 255);
    }else {
    	fill(0);
    }
    ellipse(myX, myY, mySize, mySize);
  }
  void distance() {
    distR = dist(myX, myY, 450, 450);
    distX = dist(myX, 450, myX, myY);
    distY = dist(450, myY, myX, myY);
    AR = dist(AX, AY, 450, 450);
    ADX = dist(AX, 450, AX, AY);
    ADY = dist(450, AY, AX, AY);
  }
}

class BlackHole
{
  BlackHole()
  {
    radius = 1;
  }
  void show() {
    fill(0);
        if (radius > 499)
    fill(0);
    ellipse(450, 450, radius, radius);
  }
  void field() {
    fill(30, 30, 30, 120);
    ellipse(450, 450, radius, radius);
  }
}

void mousePressed() {
  S = 1;
}

class dong
{  
  float Asteroid, myCA, AX, AY, AR, ADX, ADY, b ;
  int myColor;
  dong()
  {

    AX = (int)random(width);
    AY = (int)random(width);
    Asteroid = 20+(int)(Math.random()*30);
    myCA =(int)(Math.random()*35+100);
    b =(int)(Math.random()*80+150);
  }

  void distance() {
    AR = dist(AX, AY, 450, 450);
    ADX = dist(AX, 450, AX, AY);
    ADY = dist(450, AY, AX, AY);
  }
  void show()
  {
    fill(255, 255, 255);
    ellipse(AX, AY, Asteroid, Asteroid);
  }
  void walk() {

    if (AR <= radius*0.515 && AR >= radius *0.5){
      radius = radius + (int)(50*Asteroid/radius)/2;
      count = count +1;}
     




    if (AX <= 450 && AR < radius*2.4) {
      AX = AX + (radius*radius*0.005)/(4*(ADX));
    }
    if (AX > 450 && AR < radius*2.4) {
      AX = AX - (radius*radius*0.005)/(4*(ADX));
    }


    if (AY <= 450 && AR < radius*2.4 ) {
      AY = AY + (radius*radius*0.005)/(4*(ADY));
    }

    if (AY > 450 && AR <= radius*2.4 ) {
      AY = AY - (radius*radius*0.005)/(4*(ADY));
    }
    
    if (AR <= radius*0.515){
      AX = 450;
      AY = 450;
}
  }
}
*/