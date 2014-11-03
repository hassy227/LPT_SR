

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
  wiimote = new Wiimote(this);//Wiiリモコンを使うために必要な宣言！
  ball =new BALL();
  table =new TABLE();
  rate =new CREATING_RATE();
  
  ball.areaY=table.Yim*1.25;  //ボールの動く範囲の長さ=仮想空間上の卓球台の縦の長さ*1.25
  ball.areaYtop=table.Yt-(abs(table.Yb-table.Yt)*Base.TABLEtop/Base.TABLEbottom/10); //ボールの動く上の範囲
  
  //中央線の位置
    tableCenter(table,ball);
           ball.Yim=0;
}
void draw() {
  background(128,128,128);//背景色の表示
  
  quad(table.Xtl, table.Yt, table.Xtr, table.Yt, 
  table.Xbr, table.Yb, table.Xbl, table.Yb);//卓球台の表示
  
  line(table.LXl,table.LY,table.LXr,table.LY);//中央線の表示
  
   rate.rates();//作業用の動作
}


