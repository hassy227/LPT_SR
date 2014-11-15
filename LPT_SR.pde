

float[] LEVELspeed = new float[5];
float[] LEVELinertia= new float[5];

int   i=0;

//配列
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

  Base2 = new BASE2();
  Base =new BASE();
  //台が横長にならないように設定
  if(Base2.resolutionX>0&&Base2.resolutionY>0){
    Base.TABLEwidth=int(float(Base.TABLEwidth)*height*Base2.resolutionX/width/Base2.resolutionY);
    //設定した台の下辺の長さ*(画面横の長さ/画面縦の長さ)/(元のディスプレイの横の長さ/元のディスプレイの縦の長さ)
    if(Base.BLbig!=-1)Base.BLbig=int(float(Base.BLbig)*height/Base2.resolutionY);
    if(Base.BLsml!=-1)Base.BLsml=int(float(Base.BLsml)*height/Base2.resolutionY);
    //ボールの大きさ調節
  }
  
  
  wiimote = new Wiimote(this);//Wiiリモコンを使うために必要な宣言！
  ball =new BALL();
  table =new TABLE();
  rate =new CREATING_RATE();
  
  ball.areaY=table.Yim*2.0;  //ボールの動く範囲の長さ=仮想空間上の卓球台の縦の長さ*倍率x
  ball.areaYtop=table.Yt-(table.YY*625.0/5625.0); //ボールの動く範囲の上辺=テーブル上辺-(テーブルの長さ *((1/倍率x)/2)^2 /((1/倍率x)/2+(1/倍率x))^2 )
  
  if(Base.BLbig==-1)Base.BLbig=int(float(Base.BLsml)*Base.TABLEbottom/Base.TABLEtop);
  if(Base.BLsml==-1)Base.BLsml=int(float(Base.BLbig)*Base.TABLEtop/Base.TABLEbottom);
  //中央線の位置
    tableCenter();
    ball.YS=20.0;
    ball.XS=10.0;
    rate.adjestmentSetup();//作業用の動作
}
void draw() {
  SetBack(Base);
  
  
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


