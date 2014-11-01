

 float[] LEVELspeed = new float[5];
float[] LEVELinertia= new float[5];


float BALLarea;//ボールの仮想の

int   i=0;
float BALLareaTop;


  BASE Base;
  Wiimote wiimote;//Wiiリモコンを使うために必要な宣言！
  TABLE table;
  BALL ball;



PImage racket1, racket2;
void setup() {
  size(displayWidth, displayHeight);
  racket1=loadImage("racket1.png"); 
  racket2=loadImage("racket2.png");
  rectMode(CENTER);
  ellipseMode(CENTER);
  imageMode(CENTER);
  textMode(CENTER);

  Base =new BASE();
  wiimote = new Wiimote(this);//Wiiリモコンを使うために必要な宣言！
  table =new TABLE();
  ball =new BALL();
  
  BALLarea=table.Yim*1.25;  //ボールの動く範囲の長さ=仮想空間上の卓球台の縦の長さ*1.25
  BALLareaTop=table.Yt-(abs(table.Yb-table.Yt)*Base.TABLEtop/Base.TABLEbottom/10); //
  
  //中央線の位置
  table.LY=ballYim_Y(BALLarea*0.5);
  
  table.LXl=-((table.Xtl-table.Xbl)  //-((上辺左x-下辺左x)
             *(table.LY -table.Yt )  // *(中央線y-  上辺y)
             /(table.Yb -table.Yt )  // /(  下辺y-  上辺y)
             -(table.Xtl          ));// -(上辺左x        ))=中央線左x
             
  table.LXr=(table.Xbr-table.Xtr)  //  (上辺右x-上辺右x)
           *(table.LY -table.Yt )  // *(中央線y-  上辺y)
           /(table.Yb -table.Yt )  // /(  上辺y-  上辺y)
           +(table.Xtr          ); // +(上辺右x        )=中央線右x
}
void draw() {
  background(128,128,128);//背景色の表示
  
  quad(table.Xtl, table.Yt, table.Xtr, table.Yt, 
  table.Xbr, table.Yb, table.Xbl, table.Yb);//卓球台の表示
  
  line(table.LXl,table.LY,table.LXr,table.LY);//中央線の表示
  
  text(ball.Yim,100,100);
  text(ball.Y,100,140);
  text(BALLareaTop,100,180);
  text(table.LXl,100,220);
  text(table.LXr,100,260);
  text(ballYim_Y(BALLarea),100,300);
  //ellipse(width/2,ball.Y,20,20);
  
  for(int n=0;n<=10;n++){
    fill(255,0,0);
    ellipse(width/4,ballYim_Y(BALLarea*0.1*n),20,20);
    text(n*0.1,8+width/4,ballYim_Y(BALLarea*0.1*n));
    text(ballYim_Y(BALLarea*0.1*n),width/4-40,ballYim_Y(BALLarea*0.1*n));
    fill(255,255,255);
  }
  ellipse(width/2,table.Yb,20,20);
  ellipse(width/2,table.Yt,20,20);
  if(i==0){
    ball.Yim+=20;
  }else if(i==1){
    ball.Yim-=20;
  }
  if(ball.Yim<=0&&i==1)i=0;
  if(ball.Yim>=BALLarea&&i==0)i=1;
   
}
int ballYim_Y(float Yim){
    return int(pow(Yim,2)*(200.0*BALLareaTop-225.0*table.Yt+25.0*table.Yb)/(18.0*pow(BALLarea,2))
           -      (Yim  )*(400.0*BALLareaTop-405.0*table.Yt+5.0*table.Yb)/(36.0*    BALLarea   )
           +              (BALLareaTop));
}
