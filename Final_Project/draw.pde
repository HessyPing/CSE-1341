
void welcome(){
  background(255);
  textSize(100);
  textAlign(CENTER,CENTER);
  fill(0);
  text("Bouncing Ball",width/2,height/3);
  textSize(40);
  fill(255,0,0);
  text("Don't let your ball fall down!!!",width/2,1.35*height/3);
  textSize(30);
  fill(100);
  text("Press mouse to contunie.\n \nGame rule:\nPress space to star.\nPress N to next level.\nPress 1-5 to set difficulty.\n Move your mouseg to move.",width/2,2.1*height/3);
}


void lose(){
  background(255);
  background(255);
  textSize(100);
  textAlign(CENTER,CENTER);
  fill(0);
  text(words,width/2,height/3);
  textSize(30);
  fill(100);
  if(life == 0)
    text("Press r to restart",width/2,2*height/3);
  else
    text("Press mouse to contunie",width/2,2*height/3);
}

void playSound(){
  player.rewind();
  player.play();
}

void playSoundLose(){
  lose.rewind();
  lose.play();
}

void playSoundWin(){
  win.rewind();
  win.play();
}

void playSoundWin1(){
  win1.rewind();
  win1.play();
}

void game(int level){
  background(255);
  drawScore();
  if(!start && mousePressed){
    start = true;
  }
  drawBoard();
  drawBall();
  drawBricks();
  detectWin();
}

void drawBricks(){
  for(int i = 0;i < bricks.length;i++){
    for(int j = 0 ;j < bricks[0].length;j++){
      if(bricks[i][j]){
        fill(bricksColor[i][j]); 
        rect(200 + j * brickW, 100 + i * brickH,brickW,brickH,10);
      }
    }
  }
}

void drawScore(){
  textAlign(CENTER,CENTER);
  textSize(25);
  fill(0);
  text("Score: " + score,width/2,20);
  text("Level: " + flag,width/2,45);
  text("Life: " + life,width/2,70);
}

void drawBoard(){
  fill(0,0,255);
  boardX = mouseX - boardW/2;
  if(!start)
      x = boardX + boardW/2;
  rect(boardX,5*height/6,boardW,boardH,10);
}

void drawBall(){
  fill(255,0,0);
  ellipse(x,y,ballSize,ballSize);
  if(start){
    x += speedX;
    y += speedY;
  }
  changeDirection();
}