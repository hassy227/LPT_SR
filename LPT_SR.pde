

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
  size(screenWidth, screenHeight);
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
  
  BALLarea=table.Yim*1.25;
  BALLareaTop=table.Yt-(abs(table.Yb-table.Yt)*Base.TABLEtop/Base.TABLEbottom/10); 
  table.LY=ballYim_Y(BALLarea*0.5);
  table.LXl=table.Xtl-table.L*table.LY/table.Yt;
  table.LXr=table.Xtr*table.LY/table.Yt;
}
void draw() {
  background(128,128,128);
  quad(table.Xtl, table.Yt, table.Xtr, table.Yt, 
  table.Xbr, table.Yb, table.Xbl, table.Yb);//台の位置
  line(table.LXl,table.LY,table.LXr,table.LY);
 // i=6;
  
  ball.Yim=0.1*BALLarea;
  ball.Y=ballYim_Y(ball.Yim);
  /*
  ball.Y=int(pow(ball.Yim,2)*(25*table.Yt-50*table.LY+25*table.Yb)/(8*pow(BALLarea,2))
           -    (ball.Yim)*(35*table.Yt-50*table.LY+15*table.Yb)/(8*    BALLarea )
           +               (45*table.Yt-18*table.LY+ 5*table.Yb)/(32));
           */
  /*  y=a(x+b)^2+c
  ball.Y=int(((25*table.Yt-50*table.LY+25*table.Yb)/(8*pow(BALLarea,2)))
        *pow(ball.Yim
         -((7*BALLarea*table.Yt)-(10*BALLarea*table.LY)+(3*BALLarea*table.Yb))
          /((10*table.Yt)-(20*table.LY)+(10*table.Yb)),2)
        -((pow(table.Yt,2)-8*table.Yt*table.LY+16*pow(table.LY,2)+(-8*table.LY-2*table.Yt)*table.Yb+pow(table.Yb,2))
         /(8*table.Yt-16*table.LY+8*table.Yb)));
  */
  /*  y=a(x+b)^2+c
  ball.Y=int(((50*table.Yt-100*table.LY+50*table.Yb)/(9*pow(BALLarea,2)))
        *pow(ball.Yim
         -((13*BALLarea*table.Yt)-(20*BALLarea*table.LY)+(7*BALLarea*table.Yb))
          /((20*table.Yt)-(40*table.LY)+(20*table.Yb)),2)
        -((pow(table.Yt,2)-8*table.Yt*table.LY+16*pow(table.LY,2)+(-8*table.LY-2*table.Yt)*table.Yb+pow(table.Yb,2))
         /(8*table.Yt-16*table.LY+8*table.Yb)));
  */
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
