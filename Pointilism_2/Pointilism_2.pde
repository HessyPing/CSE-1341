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
  randomPointilism();
}

void randomPointilism(){
  int x = (int)random(0,width);
  int y = (int)random(0,height);
  color c = image.get(x,y);
  
  fill(c);
  noStroke();
  ellipse(random(0,width),random(0,height),15,15);
}




void pointilism(){
for(int y = 0; y < height; y = y + 30){
   for(int x = 0; x < width; x = x + 30){
     color c = image.get(x,y);
     fill(c);
     noStroke();
     ellipse(x,y,30,30);
   }
  }
}