PImage image;

void setup(){
 size (1280,873);
 image = loadImage("3.jpg");
 image.loadPixels();
}

void draw(){
  loadPixels();
  for (int i = 0; i < image.pixels.length; i++){
    color c = image.pixels[i];
    if (red(c) > green(c) && red(c) > blue(c)){
      pixels[i] = c;
    } else {
      pixels[i] = convertToGrayscale(c);
    }
    
    //if (green(c) > red(c) && green(c) > blue(c)){
    //  pixels[i] = c;
    //} else {
    //  pixels[i] = convertToGrayscale(c);
    //}
    
  }
  updatePixels();
}

color convertToGrayscale(color c){
    int r = (int)red(c);
    int b = (int)blue(c);
    int g = (int)green(c);
    int gray = (r + g + b) / 3;
    return color(gray);
}