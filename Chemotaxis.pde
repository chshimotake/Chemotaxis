 //declare bacteria variables here  
 /*PImage photo; 
 void setup()   
 {     
 	size
 	background(0,0,0);
 	photo =loadImage("Bijuudama");
 	//1.774
 	//initialize bacteria variables here   
 }   
 void draw()   
 {    
 	image(photo, 0, 0);
 	ellipse(x, y, width, height);
 	//move and show the bacteria   
 }  
 class Bacteria    
 {     
 	int hor;
 	int ver;
 	color col=color(255, 255, 255);//lots of java! 
 }

int radius=0;
void setup()
{
	size
 	background(0,0,0);
 	photo =loadImage("Bijuudama");
}
void
class chakra
{
	int xPo=0, yPo=0, the, spe=0, size;
	color type=color(0, 0, 0);
	chakra()
	{
		if((int)(Math.random()*5)==1)
		{
			type=color(255, 255, 255);
		}
		the=radians((int)(Math.random()*359));
		size=(int)(Math.random()*25);

	}
		myX = (int)random(width);
	    myY = (int)random(width);
	    AX = (int)random(width);
	    AY = (int)random(width);
	    myColor = (int)(Math.random()*105+100);
	    mySize = 3+(int)(Math.random()*25);
	    Asteroid = 40+(int)(Math.random()*30);
	    myCA =(int)(Math.random()*35+100);
	    b =(int)(Math.random()*80+150);
}*/
 Planets[] holey;
BlackHole Holed = new BlackHole();
dong[] ast;
int radius = (int)(Math.random()*100)+50;;
int S = 0;
int count = 0;
int white = (int)(Math.random()*201);
int black = (int)(Math.random()*801);
void setup()
{
  size(900, 900);
  photo =loadImage("Bijuudama");
  holey = new Planets[black];
  ast = new dong[white];

  for (int i=0; i < holey.length; i++)
    holey[i] = new Planets();

  for (int i=0; i < ast.length; i++)
    ast[i] = new dong();
}

void draw()
{
  image(photo, 0, 0);


  for (int k = 0; k < holey.length; k ++)
  {
    holey[k].show();
    holey[k].vibrate();
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
    myColor = (int)(Math.random()*105+100);
    mySize = 3+(int)(Math.random()*25);
    Asteroid = 40+(int)(Math.random()*30);
    myCA =(int)(Math.random()*35+100);
    b =(int)(Math.random()*80+150);
  }
void vibrate()
{
    if (distR > radius*2 ) {
      myX = myX + 2*(float)Math.random()-0.99;
      myY = myY + 2*(float)Math.random()-0.99;
    }
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
    fill(myColor);
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
    radius = 100;
  }
  void show() {
    fill(0);
        if (radius > 499)
    fill((int)(Math.random()*125),(int)(Math.random()*125),(int)(Math.random()*125));
    ellipse(450, 450, radius, radius);
  }
  void field() {
    fill(30, 30, 30, 120);
    ellipse(450, 450, radius*4, radius*4);
  }
}

void mousePressed(){
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
    Asteroid = 40+(int)(Math.random()*30);
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
    fill(myCA, myCA, 250);
    ellipse(AX, AY, Asteroid, Asteroid);
  }
  void walk() {

    if (AR <= radius*0.515 && AR >= radius *0.5){
      radius = radius + (int)(90*Asteroid/radius);
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
}*/
  
