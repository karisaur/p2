 
PImage img;
PImage cherryCup;
String riddle = "Cut me and I weep tears as red as my flesh, yet my heart is made of stone. What am I?";
int x,y;
float ax;
float ay;
float cx;
float cy;
boolean overcherryCup = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 

void setup() 
{
  img = loadImage("crumb.png");//our icon
  cherryCup = loadImage("cherryCup.png");
  ax = width/2.0;
  ay = height/2.0;
  size(640, 360);

}

void draw() 
{ 
  background(0);
  image(img, mouseX, mouseY);
  
  // Test if the cursor is over the cherryCup
  if (mouseX > cherryCup.width-width && mouseX <  cherryCup.width+width &&
      mouseY > cherryCup.height-height && mouseY < cherryCup.height+height) {
        overcherryCup = true;  
        if (!locked){
           fill(250);
           text(riddle, 10, 15);
           image(cherry, cx, cy);
           image(apple, ax, ay);
           //If you collide, ask the riddle
        }
  } else {
    overcherryCup = false;
  }
  image(cherryCup, ax, ay);
}

void mousePressed() {
  if(overcherryCup) { 
    locked = true; 
  } else {
    locked = false;
  }
  xOffset = mouseX-ax; 
  yOffset = mouseY-ay; 

}

void mouseDragged() {
  if(locked) {
    ax = mouseX-xOffset; 
    ay = mouseY-yOffset; 
  }
}

void mouseReleased() {
  locked = false;
}

