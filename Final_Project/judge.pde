void changeDirection(){
  if(y < ballSize/2){
    speedY *= -1;
    x += speedX;
    y += speedY;
    playSound();
  }
  if(x < ballSize/2 || x > width - ballSize/2){
    speedX *= -1;
    x += speedX;
    y += speedY;
    playSound();
  }
  if(y > 5*height/6 - ballSize && y < 5*height/6 - ballSize/2){
    mouseTemp = mouseX;
  }
  if(x > boardX - boardW/2 && x < boardX + boardW/2 && y > 5*height/6 - ballSize/2 && y < 5*height/6 + ballSize/2){
    speedY *= -1;
    if(mouseX - mouseTemp < 4 && mouseX - mouseTemp > 0)
      speedX += (mouseX - mouseTemp);
    else if(mouseX - mouseTemp > 4)
      speedX += 4;
    else if(mouseX - mouseTemp < 0 && mouseX - mouseTemp > -4)
      speedX += (mouseX - mouseTemp);
    else if(mouseX - mouseTemp < -4)
      speedX -= 4;  
    if(speedX > limit)
      speedX = limit;
    if(speedX < -limit)
      speedX = -limit;
    x += speedX;
    y += speedY;  
    playSound();
  }
  if(y > height){
    playSoundLose();
    if(life == 0){
      status = false;
      words = "GAME OVER!";
    }
    else {
      life --;
      status = false;
      words = "You have " + life + " lives left.";
      
    }
  }
  hitBricks();
}

void hitBricks(){
  if(x >= 200 - ballSize/2 && x <= 1200 + ballSize/2 && y >= 100 - ballSize/2 && y <= 100 + brickH*10 + ballSize/2){
    for(int i = 0;i < bricks.length;i++){
    for(int j = 0 ;j < bricks[0].length;j++){
      if(bricks[i][j]){
        if(x >= 200 + j*brickW - ballSize/2 && x <= 200 + (j+1)*brickW + ballSize/2 &&((y >= 100 + i*brickH - ballSize/2 && y <= 100 + i*brickH) || (y >= 100 + (i+1)*brickH - ballSize/2 - ballSize/3 && y <= 100 + (i+1)*brickH - ballSize/3))){
          speedY *= -1;
          x += speedX;
          y += speedY;
          score += 5;
          playSound();
          if(bricksColor[i][j] == color(0,0,255,100))
            bricks[i][j] = false;
          else 
            bricksColor[i][j] = color(0,0,255,100);
        }
        if(y > 100 + i*brickH - ballSize/2 && y < 100 + (i+1)*brickH + ballSize/2 &&((x > 200 + j*brickW - ballSize/2 && x < 200 + j*brickW) || (x > 200 + (j+1)*brickW - ballSize/2  - ballSize/3 && x < 200 + (j+1)*brickW - ballSize/3))){
          speedX *= -1;
          x += speedX;
          y += speedY;
          score += 5;
          playSound();
          if(bricksColor[i][j] == color(0,0,255,100))
            bricks[i][j] = false;
          else 
            bricksColor[i][j] = color(0,0,255,100);
        }
      }
    }
  }
  }
}

void detectWin(){
  boolean win = true;
  for(int i = 0;i < bricks.length;i++)
    for(int j = 0 ;j < bricks[0].length;j++){
      if(bricks[i][j] == true)
        win = false;
    }
  if(keyPressed && key == '`'){
    win = true;
  }
  if(win){
    status = false;
    start = false;
    life = 5;
    words = "YOU WIN!";
    if(flag != 5){
      flag ++;
      playSoundWin();
    }
    else
      playSoundWin1();
  }
}