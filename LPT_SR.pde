

float[] LEVELspeed = new float[5];
float[] LEVELinertia= new float[5];

int   i=0;

//構造体(メイン)
  BASE Base;
  BASE2 Base2;
  Wiimote wiimote;//Wiiリモコンを使うために必要な宣言！
  TABLE table;
  BALL ball;
  CREATING_RATE rate;


PImage racket1, racket2;
void setup() {
  size(displayWidth, displayHeight);
  racket1=loadImage("racket1.png"); 
  racket2=loadImage("racket2.png");
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  textMode(CENTER);
  wiimote = new Wiimote(this);//Wiiリモコンを使うために必要な宣言！
  //台が横長にならないように設定
  SetStructure();
  rate =new CREATING_RATE();

    rate.adjestmentSetup();//作業用の動作
}
void draw() {
  SetBack(Base);
  
  GameUpdate(table,ball);
  
  quad(table.Xtl, table.Yt, table.Xtr, table.Yt, 
  table.Xbr, table.Yb, table.Xbl, table.Yb);//卓球台の表示
  
  //line(table.LXl,table.LY,table.LXr,table.LY);//中央線の表示
  quad(table.LXl,table.LY,table.LXr,table.LY
      ,table.LXr-width/720,table.LY-height/30,table.LXl+width/720,table.LY-height/30);//中央線の表示
  
  rect(table.Xbl,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0,table.XB/2.0,ballYim_Y(ball.areaY*0.85)-table.Yb);
  rect((table.Xbl+table.Xbr)/2,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0,table.XB/2.0,ballYim_Y(ball.areaY*0.85)-table.Yb);
  rect(table.Xbr,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0,table.XB/2.0,ballYim_Y(ball.areaY*0.85)-table.Yb);
  
   rate.adjestmentDraw();//作業用の動作
}


