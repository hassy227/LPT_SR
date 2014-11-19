

float[] LEVELspeed = new float[5];
float[] LEVELinertia= new float[5];
boolean arduino = false;

//構造体(メイン)
  BASE2 Base2;
  BASE Base;
   DESIGN backD;
   DESIGN tableD;
   DESIGN netD;
   DESIGN ballD;
   DESIGN ballsdoD;
  Wiimote wiimote;//Wiiリモコンを使うために必要な宣言！
  TABLE table;
  BALL ball;
  CREATING_RATE rate;
   LEVEL common;
   LEVEL level1;
   LEVEL level2;
   LEVEL level3;
   LEVEL level4;
   LEVEL level5;
  ARDUINO heavy;
   


PImage racket1, racket2;
void setup() {
  size(displayWidth, displayHeight); racket1=loadImage("racket1.png"); 
  racket2=loadImage("racket2.png");
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  textMode(CENTER);
  wiimote = new Wiimote(this);//Wiiリモコンを使うために必要な宣言！
  heavy = new ARDUINO(this,"COM6");//圧力センサを使うために必要な宣言！
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
  GameUpdate(table,ball);//変数の更新
  heavy.update();
  
  
  SetColer(tableD);
  quad(table.Xtl, table.Yt, table.Xtr, table.Yt, 
  table.Xbr, table.Yb, table.Xbl, table.Yb);//卓球台の表示
  
  
  
  fill(255);
  rect(table.Xbl,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0,table.XB/2.0,ballYim_Y(ball.areaY*0.85)-table.Yb);
  rect((table.Xbl+table.Xbr)/2,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0,table.XB/2.0,ballYim_Y(ball.areaY*0.85)-table.Yb);
  rect(table.Xbr,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0,table.XB/2.0,ballYim_Y(ball.areaY*0.85)-table.Yb);
  fill(255,0,0);
  

  text("SPEED",width/5,height/2);
  textAlign(RIGHT);
  text(abs(ball.YS*216000)/1000000,width/5+Base2.FontSize*6,height/2);
  textAlign(LEFT);
  text("km/h",width/5+Base2.FontSize*6,height/2);
  BandN();
  
   rate.adjestmentDraw();//作業用の動作
}
void keyPressed(){
  if(keyCode==LEFT){
  }
  if(keyCode==RIGHT){
  }
}


