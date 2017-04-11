// Pingping Hong

// creat a pointilism-like sketch using an image

PImage image;


void setup(){
  size (600,800);
  image = loadImage("0006.jpg");
  image(image,0,0);
  //image.loadPixels();
  //print(image.pixels.length);
}

void draw(){
  //get an x and y value 
  //get color of image at (x,y);
  //set color as fill
  //draw ellipse at (x,y);
  for(int y=0; y < height; y = y+5){
   for(int x=0; x < width; x = x+5){
     color c = image.get(x,y);
     fill(c);
     noStroke();
     ellipse(x,y,30,30);
   }
  }
  
  
}