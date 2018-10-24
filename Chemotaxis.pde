 //declare bacteria variables here  
 PImage photo; 
 void setup()   
 {     
 	size
 	background(0,0,0);
 	photo =loadImage("Tailed_Beast_Bomb");
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