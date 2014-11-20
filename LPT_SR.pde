

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
   DESIGN judge1D;
   DESIGN judge2D;
   DESIGN judge3D;
   DESIGN judge4D;
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
  
  
  setJudgezone();
  fill(255,0,0);
  

  text("SPEED",width/5,height/2);
  textAlign(RIGHT);
  text(abs(ball.YS*216000)/1000000,width/5+Base2.FontSize*6,height/2);
  textAlign(LEFT);
  text("km/h",width/5+Base2.FontSize*6,height/2);
  BandN();
  //image(racket1,table.Xbl,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0);
  //image(racket1,(table.Xbl+table.Xbr)/2,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0);
  // image(racket1,table.Xbr,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0);
  
   rate.adjestmentDraw();//作業用の動作
}
void keyPressed(){
  //
  if(key=='j'){
    if(judge.racketP==1&&(judge.nowJzone & int(pow(2,0)))==pow(2,0)){
      
    }
    if(judge.racketP==2&&(judge.nowJzone & int(pow(2,2)))==pow(2,2)){
    }
    if(judge.racketP==3&&(judge.nowJzone & int(pow(2,4)))==pow(2,4)){
    }
  }
  if(key=='k'){
    if(judge.racketP==1&&(judge.nowJzone & int(pow(2,1)))==pow(2,1)){
    }
    if(judge.racketP==2&&(judge.nowJzone & int(pow(2,3)))==pow(2,3)){
    }
    if(judge.racketP==3&&(judge.nowJzone & int(pow(2,5)))==pow(2,5)){
    }
  }
  if(key=='s')judge.racketP=1;
  if(key=='d')judge.racketP=2;
  if(key=='f')judge.racketP=3;
}


