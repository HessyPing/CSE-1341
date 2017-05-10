

void init(int level){
  start = false;
  x = width/2;
  y = 5*height/6 - ballSize/2;
  speedX = random(-2,2);
  speedY = -(5 + flag/2);
  limit = 15 + flag*2;
  words = "";
  if(life == 0 || life == 5){
    score = 0;
    initBricksStatus(level);
  }
}

void initBricksStatus(int level){
  for(int i = 0;i < bricks.length;i++)
    for(int j = 0;j < bricks[0].length;j++){
      bricks[i][j] = false;
      bricksColor[i][j] = color(0,0,255,100);
    }
  for(int i = 0; i < level * 20; i ++){
    int row = int(random(0,bricks.length));
    int col = int(random(0,bricks.length));
    bricks[row][col] = true;
    if( i % 5 == 0 && level != 1)
      bricksColor[int(random(0,bricks.length))][int(random(0,bricks[0].length))] = color(255,0,0,100);
  }
}