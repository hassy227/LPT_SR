  float degree;
  float radian;
void hit(JUDGEMENT judge){
  if(judge.hit%10==1){ 
    ball.speed=random(ball.lowS,ball.hiS);
    if(judge.hit/10==1)degree=random(6,20);
    if(judge.hit/10==2)degree=random(-4,16);
    if(judge.hit/10==3)degree=random(-6,6);
    radian=radians(degree);
    ball.XS=sin(radian)*ball.speed;
    ball.YS=-cos(radian)*ball.speed;
  }
  if(judge.hit%10==2){
    ball.speed=random(ball.lowS,ball.hiS);
    if(judge.hit/10==1)degree=random(-6,6);
    if(judge.hit/10==2)degree=random(-16,4);
    if(judge.hit/10==3)degree=random(-20,-6);
    radian=radians(degree);
    ball.XS=sin(radian)*ball.speed;
    ball.YS=-cos(radian)*ball.speed;
  }
  xx=ball.X;
  xx=ball.Y;
  judge.hit=0;
}

void enemyhit(ENEMY enemy){
  if(ballYim_Y(ball.areaY*0.15)<=ball.Ysdo&&ball.Ysdo<=ballYim_Y(ball.areaY*0.25)){
    if(enemy.Xim-table.Xim/8<ball.Xim&&ball.Xim<enemy.Xim+table.Xim/8){
      ball.speed=random(ball.lowS,ball.hiS);
      radian=atan(random((-ball.Xim-table.Xim*0.64),(-ball.Xim+table.Xim*0.64))/table.Yim);
      ball.XS=sin(radian)*ball.speed;
      ball.YS=cos(radian)*ball.speed;
        xx=ball.X;
  xx=ball.Y;
    }
  }
}

int moveRacket(){
  if(heavy.data_int[0]>80&&heavy.data_int[1]>80)return 2;
  if(heavy.data_int[0]>128)return 1;
  if(heavy.data_int[1]>128)return 3;
  return judge.nowRpoint;
}
void enemymove(ENEMY enemy){
  if(gamestart==1){
    if(enemy.Xim<ball.Xim)enemy.speed +=enemy.ADDspeed;
    if(enemy.Xim>ball.Xim)enemy.speed -=enemy.ADDspeed;
    
    if(enemy.Xim>ball.Xim&&enemy.speed>0){enemy.Xim +=enemy.speed*enemy.inertia;}else 
    if(enemy.Xim>ball.Xim&&enemy.speed>0){enemy.Xim +=enemy.speed*enemy.inertia;}else
                                         {enemy.Xim +=enemy.speed;}
    
    enemy.X = ballXim_X(enemy.Xim,ballYim_Y(ball.areaY*0.25));
    enemyhit(enemy);
  }
}

void opening(){
  if(gamestart==0){
    textAlign(CENTER);
    PFont font = createFont(Base2.FontName, height/8); //フォントの設定 
  textFont(font,  height/8);
    fill(255,0,0);
    text("卓球ゲーム",width/2,height/2);
     enemy.LEVEL= judge.nowRpoint;
     ball.Yim=ball.areaY*0.25;
     ball.Xim=table.Xim*0.25;
     enemy.Xim=table.Xim*0.5;
     textAlign(LEFT);
  }
  PFont font = createFont(Base2.FontName, Base2.FontSize); //フォントの設定 
  textFont(font, Base2.FontSize);
}

void pointCheck(){
  timer--;
  if(ball.Yim< ball.areaY*0.1&&gamestart==1){
    gamestart=3;
    judge.Yscore++;
    timer=120;
  }
  if(ball.Yim>ball.areaY*0.9&&gamestart==1){
    gamestart=4;
    judge.Escore++;
    timer=120;
  }
  if(ball.YS<0&&ball.Yim<ball.areaY*0.75&&ball.Yim>=ball.areaY*0.25+Base.ballBound&&gamestart==1&&ball.Zim<=0){
    gamestart=3;
    judge.Yscore++;
    timer=120;
  }
  if(ball.YS>0&&ball.Yim>ball.areaY*0.25&&ball.Yim<=ball.areaY*0.75-Base.ballBound&&gamestart==1&&ball.Zim<=0){
    gamestart=4;
    judge.Escore++;
    timer=120;
  }
  if(gamestart==2){
    gamestart=1;
    ball.Xim=0;
    ball.Yim=ball.areaY*0.2;
    enemy.X=0;
    
  }
  fill(255,0,0);
  textAlign(CENTER);
  PFont font = createFont(Base2.FontName, height/16); //フォントの設定 
  textFont(font, height/16);
  if(gamestart==3){
    text("YOU POINT",width/2,height/2);
  }
  if(gamestart==4){
    text("ENEMY POINT",width/2,height/2);
  }
  font = createFont(Base2.FontName, Base2.FontSize); //フォントの設定 
  textFont(font, Base2.FontSize);
  textAlign(LEFT);
}
