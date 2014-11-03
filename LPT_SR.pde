

float[] LEVELspeed = new float[5];
float[] LEVELinertia= new float[5];


float BALLareaY;//ボールの仮想の

int   i=0;
float BALLareaYTop;

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
  table =new TABLE();
  ball =new BALL();
  rate =new CREATING_RATE();
  
  BALLareaY=table.Yim*1.25;  //ボールの動く範囲の長さ=仮想空間上の卓球台の縦の長さ*1.25
  BALLareaYTop=table.Yt-(abs(table.Yb-table.Yt)*Base.TABLEtop/Base.TABLEbottom/10); //
  
  //中央線の位置
  table.LY=ballYim_Y(BALLareaY*0.5);//中央線y
  
  table.LXl=-((table.Xtl-table.Xbl)  //-((上辺左x-下辺左x)
             *(table.LY -table.Yt )  // *(中央線y-  上辺y)
             /(table.Yb -table.Yt )  // /(  下辺y-  上辺y)
             -(table.Xtl          ));// -(上辺左x        ))=中央線左x
             
  table.LXr=(table.Xbr-table.Xtr)  //  (上辺右x-上辺右x)
           *(table.LY -table.Yt )  // *(中央線y-  上辺y)
           /(table.Yb -table.Yt )  // /(  上辺y-  上辺y)
           +(table.Xtr          ); // +(上辺右x        )=中央線右x
           ball.Yim=0;
}
void draw() {
  background(128,128,128);//背景色の表示
  
  quad(table.Xtl, table.Yt, table.Xtr, table.Yt, 
  table.Xbr, table.Yb, table.Xbl, table.Yb);//卓球台の表示
  
  line(table.LXl,table.LY,table.LXr,table.LY);//中央線の表示
  
   rate.rates();//作業用の動作
}

//仮想y座標から画面上のy座標を表示させる
int ballYim_Y(float Yim){
    return int(pow(Yim,2)*(200.0*BALLareaYTop-225.0*table.Yt+25.0*table.Yb)/(18.0*pow(BALLareaY,2))
           -      (Yim  )*(400.0*BALLareaYTop-405.0*table.Yt+5.0*table.Yb)/(36.0*    BALLareaY   )
           +              (BALLareaYTop));
}


//仮想x座標と画面上のy座標から画面上のx座標を表示させる
int ballXim_X(float Xim,int Y){
    return int((Xim/table.Xim)
              *(Y*(table.XT-table.XB)/(table.Yt-table.Yb)+(table.XB*table.Yt-table.XT*table.Yb)/(table.Yt-table.Yb))
               +width/2.0);
}

int ballBIG(int Y){
  return int((Y+(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT))*Base.BLmax/(table.Yb+(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT)));
}
