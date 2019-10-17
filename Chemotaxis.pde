Planets[] blackChakra;
BlackHole Holed = new BlackHole();
Dot[] whiteChakra;
int radius = (int)(Math.random()*100)+50;;
int S = 0;
int count = 0;
int white = (int)(Math.random()*100)+50;
int black = white*4;
PImage bg;
void setup()
{
  blackChakra = new Planets[black];
  whiteChakra = new Dot[white];
  for (int i=0; i < blackChakra.length; i++)
    blackChakra[i] = new Planets();
  //creates an
  for (int i=0; i < whiteChakra.length; i++)
    whiteChakra[i] = new Dot();
  size(900, 900);
  bg=loadImage("Bijuudama.jpg");
}

void draw()
{
  image(bg, 0, 0,900, 900);

  for (int k = 0; k < blackChakra.length; k ++)
  {
    blackChakra[k].show();
  }
 

  if (S == 1) {
    for (int i = 0; i < blackChakra.length; i ++)
    {
      blackChakra[i].distance();
      blackChakra[i].walk();
    }
  }

  for (int i = 0; i < whiteChakra.length; i ++)
  {

    whiteChakra[i].show();
  }

  if (S == 1) {
    for (int i = 0; i <whiteChakra.length; i ++)
    {

      whiteChakra[i].distance();
      whiteChakra[i].walk();
    }
  }

  Holed.show();

  //move this V to the bijuudama
  fill(0,0,0,10);
  stroke(0,0,0,10);
  rect(0,0,300,300);
  noFill();
  stroke(255,0,255);
  translate(150,150);
  rotate(random(2*PI));
  ellipse(0,0,250,random(250));
}


class Planets
{
  float myX, myY, mySize, distR, distX, distY, asteroid, myCA, AX, AY, AR, ADX, ADY, b ;
  int myColor;
  Planets()
  {
    myX = (int)random(width);
    myY = (int)random(width);
    AX = (int)random(width);
    AY = (int)random(width);
    mySize = (int)(Math.random()*20)+20;
    asteroid = 40+(int)(Math.random()*30);
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
    /*if(mySize<24)
    {
      fill(255, 255, 255);
    }else {
      fill(0);
    }*/
    fill(0,0,0);
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
    fill(75,0,130);
    ellipse(450,450,radius,radius);
    //fill(0);
    //ellipse(450, 450, radius-5, radius-5);
  }
  void field() {
    fill(75,0,130);
    ellipse(450,450,radius,radius);
    //fill(30, 30, 30, 120);
    //ellipse(450, 450, radius-5, radius-5);
  }
}

void mousePressed() {
  S = 1;
}

class Dot
{  
  float asteroid, myCA, AX, AY, AR, ADX, ADY, b ;
  int myColor;
  Dot()
  {

    AX = (int)random(width);
    AY = (int)random(width);
    asteroid = (int)(Math.random()*20);
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
    fill(255, 0,0);//255, 255);
    ellipse(AX, AY, asteroid, asteroid);
  }
  void walk() {

    if (AR <= radius*0.515 && AR >= radius *0.5){
      radius = radius + (int)(50*asteroid/radius)/2;
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