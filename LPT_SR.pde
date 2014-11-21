
boolean arduino = false ;
int gamestart=0;
int timer=0;
int xx,yy;
//構造体(メイン)
  BASE2 Base2;
  BASE Base;
   DESIGN backD;
   DESIGN tableD;
   DESIGN netD;
   DESIGN ballD;
   DESIGN ballsdoD;
   DESIGN judge1D;
   DESIGN judge2D;
   DESIGN judge3D;
   DESIGN judge4D;
  Wiimote wiimote;//Wiiリモコンを使うために必要な宣言！
  TABLE table;
  BALL ball;
  CREATING_RATE rate;
  ENEMY enemy;
   LEVEL common;
   LEVEL level[];
  ARDUINO heavy;
  JUDGEMENT judge; 
  


PImage racket1, racket2;
void setup() {
  size(displayWidth, displayHeight); racket1=loadImage("racket1.png"); 
  racket2=loadImage("racket2.png");
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  textMode(CENTER);
  wiimote = new Wiimote(this);//Wiiリモコンを使うために必要な宣言！
  heavy = new ARDUINO(this,"COM5");//圧力センサを使うために必要な宣言！
  //台が横長にならないように設定
  SetStructure();
  rate =new CREATING_RATE();

    rate.adjestmentSetup();//作業用の動作
}
void draw() {
  PFont font = createFont(Base2.FontName, Base2.FontSize); //フォントの設定 
  textFont(font, Base2.FontSize);
  
  
  SetBack(backD);
  wiimote.update();
  if(gamestart==1)GameUpdate(table,ball);//変数の更新
  enemymove(enemy);
  heavy.update();
  
  
  SetColer(tableD);
  quad(table.Xtl, table.Yt, table.Xtr, table.Yt, 
  table.Xbr, table.Yb, table.Xbl, table.Yb);//卓球台の表示
  
  judge.nowRpoint=moveRacket();
  setJudgezone();
  hit(judge);
  fill(255,0,0);
  
  textAlign(RIGHT);
  text("SPEED",width/5*4,height/2);
  text("LEVEL",width/5*4,height/2+Base2.FontSize);
  text("YOUPOINT",width/5,table.Yb);
  text("ENEMYPOINT",width/10*3,table.Yt);
  text(abs(ball.speed*60)/60,width/5*4+Base2.FontSize*6,height/2);
  text(enemy.LEVEL          ,width/5*4+Base2.FontSize*6,height/2+Base2.FontSize);
  textAlign(LEFT); 
  for(int i=0;i<judge.Yscore;i++)text("○",width/5   +Base2.FontSize*i,table.Yb);
  for(int i=0;i<judge.Escore;i++)text("○",width/10*3+Base2.FontSize*i,table.Yt);
  
  image(racket2,enemy.X,(ballYim_Y(ball.areaY*0.25)+ballYim_Y(ball.areaY*0.15))/2,
  (ballYim_Y(ball.areaY*0.25)-ballYim_Y(ball.areaY*0.15))*4,(ballYim_Y(ball.areaY*0.25)-ballYim_Y(ball.areaY*0.15))*4);
  
  //text("m/m",width/5+Base2.FontSize*6,height/2);
  
  setJudgezone();
  //image(racket1,table.Xbl,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0);
  //image(racket1,(table.Xbl+table.Xbr)/2,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0);
  //image(racket1,table.Xbr,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0);
  BandN();
  pointCheck();
   rate.adjestmentDraw();//作業用の動作
 opening();
}
void keyPressed(){
  if(key=='j'&&(judge.nowJzone&int(pow(2,judge.nowRpoint*2  )))!=0)judge.hit=1+10*judge.nowRpoint;
  if(key=='k'&&(judge.nowJzone&int(pow(2,judge.nowRpoint*2+1)))!=0)judge.hit=2+10*judge.nowRpoint;
  
  if(key=='s')judge.nowRpoint=1;
  if(key=='d')judge.nowRpoint=2;
  if(key=='f')judge.nowRpoint=3;
  if((key=='j'||key=='k')&&gamestart==0)gamestart=1;
  if((key=='j'||key=='k')&&gamestart>=3)gamestart=2;
  
}


