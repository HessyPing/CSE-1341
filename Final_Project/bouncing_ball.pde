import ddf.minim.*;

Minim minim;
AudioPlayer player;
AudioPlayer win;
AudioPlayer win1;
AudioPlayer lose;

float x = width/2;
float y = 5*height/6 - 10;
float ballSize = 20;
float speedX = 0;
float speedY = -5;
boolean start = false;
int flag = 0;
float boardW = 100;
float boardH = 10;
boolean status = true;
float boardX = width/2;
float boardSpeed = 5;

float limit = 12;

int score = 0;

boolean bricks[][] = new boolean[10][10];
color bricksColor[][] = new color[10][10];

float brickW = 100;
float brickH = 35;
float mouseTemp = 0;

String words = "";
int life = 5;

void setup(){
  size(1400,800);
  background(255);
  minim = new Minim(this);
  player = minim.loadFile("Collision.mp3");
  lose = minim.loadFile("boo.mp3");
  win = minim.loadFile("win1.wav");
  win1 = minim.loadFile("win2.wav");
  x = width/2;
  y = 5*height/6 - 10;
  for(int i = 0;i < bricks.length;i++)
    for(int j = 0;j < bricks[0].length;j++){
      bricks[i][j] = false;
      bricksColor[i][j] = color(0,0,255,100);
    }
}

void draw(){
  if(status){
    switch(flag){
      case 0:
        welcome();
        break;
      default:
        game(flag);
        break;
        
    }
  }
  else
    lose();
}


void mouseReleased(){
  if(flag == 0){
    flag = 1; 
    init(flag);
  }
  if(!status && life != 0){
    status = true;
    start = false;
    init(flag);
  }
}

void keyPressed(){
  switch(key){
    case '1': flag = 1;life = 5;init(flag);break;
    case '2': flag = 2;life = 5;init(flag);break;
    case '3': flag = 3;life = 5;init(flag);break;
    case '4': flag = 4;life = 5;init(flag);break;
    case '5': flag = 5;life = 5;init(flag);break;
    case ' ': start = true;
  }
  if(key == 'r' && life == 0){
    flag = 0;
    status = true;
    life = 5;
  }
    
}