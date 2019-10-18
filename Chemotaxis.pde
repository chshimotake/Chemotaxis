Planets[] blackChakra;
BlackHole Holed = new BlackHole();
Dot[] whiteChakra;
int radius = (int)(Math.random()*100)+50;;
int start = 0;
int count = 0;
int white = (int)(Math.random()*100)+50;
int black = white*4;
PImage naruto;
void setup()
{
  blackChakra = new Planets[black];
  whiteChakra = new Dot[white];
  for (int i=0; i < blackChakra.length; i++)
    blackChakra[i] = new Planets();
  //creates the array of the large black planets
  for (int i=0; i < whiteChakra.length; i++)
    whiteChakra[i] = new Dot();
  //creates the small white dots
  size(900, 900);
  naruto=loadImage("Bijuudama.jpg");
}

void draw()
{
  noStroke();
  image(naruto, 0, 0,900, 900);

  for (int k = 0; k < blackChakra.length; k ++)
  {
    blackChakra[k].show();
    //shows all the planets
  }
 

  if (start == 1) {
    for (int i = 0; i < blackChakra.length; i ++)
    {
      blackChakra[i].distance();
      blackChakra[i].walk();
      //takes the distance of each planet from the center
      //and makes it move
    }
  }

  for (int i = 0; i < whiteChakra.length; i ++)
  {
    whiteChakra[i].show();
    //shows the white dots
  }

  if (start == 1) {
    for (int i = 0; i <whiteChakra.length; i ++)
    {
      whiteChakra[i].distance();
      whiteChakra[i].walk();
      //takes the distance of each dot from the center
      //and makes it move
    }
  }

  Holed.show();
  //shows the black circle in the center
}


class Planets
{
  float myX, myY, mySize, distR;
  float distX, distY, asteroid, myCA, b ;
  int myColor;
  Planets()
  {
    myX = (int)random(width);
    myY = (int)random(height);
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
    fill(0,0,0);
    ellipse(myX, myY, mySize, mySize);
  }
  void distance() {
    distR = dist(myX, myY, width/2, height/2);
    distX = dist(myX, height/2, myX, myY);
    distY = dist(width/2, myY, myX, myY);
  }
}

class BlackHole
{
  BlackHole()
  {
    radius = 1;
  }
  void show() 
  {
    fill(138,43,226);
    ellipse(450,450,radius,radius);
    fill(0);
    ellipse(450, 450, radius-10, radius-10);
    hurricane();
  }
  void hurricane()
  {
    noFill();
    stroke(138,43,226);
    translate(width/2,height/2);
    for(int i=0;i<10;i++)
    {
      rotate(random(2*PI));
      ellipse(0,0,radius,random(radius));
    }
  }
}

void mousePressed() {
  start = 1;
}

class Dot
{  
  float asteroid, myCA, dotR, dotX, dotY, distR, distX, distY, b ;
  int myColor;
  Dot()
  {

    dotX = (int)random(width);
    dotY = (int)random(width);
    asteroid = (int)(Math.random()*20);
    myCA =(int)(Math.random()*35+100);
    b =(int)(Math.random()*80+150);
  }

  void distance() {
    distR = dist(dotX, dotY, width/2, height/2);
    distX = dist(dotX, height/2, dotX, dotY);
    distY = dist(width/2, dotY, dotX, dotY);
  }
  void show()
  {
    noStroke();
    fill(255, 255,255);//255, 255);
    ellipse(dotX, dotY, asteroid, asteroid);
  }
  void walk() {
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
    /*if (dotR <= radius*0.515 && dotR >= radius *0.5){
      radius = radius + (int)(50*asteroid/radius)/2;
      count = count +1;}
     




    if (dotX <= 450 && dotR < radius*2.4) {
      dotX = dotX + (radius*radius*0.005)/(4*(dotX));
    }
    if (dotX > 450 && dotR < radius*2.4) {
      dotX = dotX - (radius*radius*0.005)/(4*(dotX));
    }


    if (dotY <= 450 && dotR < radius*2.4 ) {
      dotY = dotY + (radius*radius*0.005)/(4*(dotY));
    }

    if (dotY > 450 && dotR <= radius*2.4 ) {
      dotY = dotY - (radius*radius*0.005)/(4*(dotY));
    }
    
    if (dotR <= radius*0.515){
      dotX = 450;
      dotY = 450;*/
}
}