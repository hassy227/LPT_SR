
//背景を設定する
void SetBack(DESIGN Design){
  if(Design.P!=null){
    image(Design.P,width/2,height/2,width,height);
    return;
  }
  if(Design.W<0||Design.W>255 ){
    background(Design.R,Design.G,Design.B,Design.I);
  }else{
    background(Design.W,Design.I);
  }
  return;
}
void SetColer(DESIGN Design){
  if(Design.W<0||Design.W>255 ){
    fill(Design.R,Design.G,Design.B,Design.I);
  }else{
    fill(Design.W,Design.I);
  }
  return;
}

//処理によってアップデートすること
void GameUpdate(TABLE table,BALL ball){
  ball.Xim += ball.XS;
  ball.Yim += ball.YS;
  ball.Zim += ball.ZS;
  
  ball.Ysdo = ballYim_Y(ball.Yim);
  ball.Zim  = ballYim_ZimS(ball.Yim,ball.YS);
  ball.mY   = ballZim_mY(ball.Zim,ball.Ysdo);
  ball.Y    = ball.Ysdo-ball.mY;
  ball.Xsdo = ballXim_X(ball.Xim,ball.Ysdo);
  ball.X    = ballXim_X(ball.Xim,ball.Ysdo);
  ball.B    = ballBIG(ballYim_Y(ball.Yim));
  
  judge.nowJzone=nowJzone(ball);
  
}

//仮想y座標から画面上のy座標に変換
int ballYim_Y(float Yim){
      /*
      return int(pow(Yim,2)*(200.0*ball.areaYtop-225.0*table.Yt+25.0*table.Yb)/(18.0*pow(ball.areaY,2))
             -      (Yim  )*(400.0*ball.areaYtop-405.0*table.Yt+5.0*table.Yb)/(36.0*    ball.areaY   )
             +              (ball.areaYtop));
             */
             return int(-pow(Yim,2)*(-16.0*ball.areaYtop+24.0*table.Yt-8.0*table.Yb)/(3.0*pow(ball.areaY,2))
             +             (Yim  )*(-16.0*ball.areaYtop+18.0*table.Yt-2.0*table.Yb)/(3.0*    ball.areaY   )
             +             (ball.areaYtop));
}

//仮想x座標と画面上のy座標から画面上のx座標に変換させる
int ballXim_X(float Xim,int Y){
    return int((Xim/table.Xim)
              *(Y*(table.XT-table.XB)/(table.Yt-table.Yb)+(table.XB*table.Yt-table.XT*table.Yb)/(table.Yt-table.Yb))
               +table.CE);
}
//画面上のy座標から玉の大きさを調べる
int ballBIG(int Y){
  int big=int(Y*(float(Base.BLbig-Base.BLsml)/(table.Yb-table.Yt))+(Base.BLsml*table.Yb-Base.BLbig*table.Yt)/(table.Yb-table.Yt));
  if(0>=big)return 1;
  return big;
}
//仮想y座標から仮想z座標に変換(簡略型)
float ballYim_ZimS(float Yim,float YS){
  float Yims=0;
  float TT=(ball.areaY*0.25);//卓球台のトップ（仮想）
  float HZ=Base.ballHZ;
  float SZ=Base.ballZspeed;//最高上昇速度
  float BZ=Base.ballBound+TT;//
  float HY=Base.ballHY;
  if(YS>0)Yims=Yim;
  if(YS<0)Yims=ball.areaY-Yim;
  if(Yims>BZ)Yims=BZ*2.0-Yims;

  return  (HZ -SZ*TT +SZ*BZ)                                  /(pow(TT,2.0)-pow(BZ,2.0))*pow(Yims,2.0)
         + SZ                                                                           *    Yims
         -(pow(BZ,2)*HZ +BZ*SZ*pow(TT,2.0) -pow(BZ,2.0)*SZ*TT)/(pow(TT,2.0)-pow(BZ,2.0));
}
//仮想z座標と仮想y座標からからボール表示時に引くべきy座標に変換
int ballZim_mY(float Zim,float Y){
  int Z=(int)(Zim*(Y-table.CR))/(table.Yb-table.CR);
  return Z;
}


//卓球台の中央線の情報を入力する
void tableCenter(){
  table.LY=ballYim_Y(ball.areaY*0.5);//中央線y
  
  table.LXl=-((table.Xtl-table.Xbl)  //-((上辺左x-下辺左x)
             *(table.LY -table.Yt )  // *(中央線y-  上辺y)
             /(table.Yb -table.Yt )  // /(  下辺y-  上辺y)
             -(table.Xtl          ));// -(上辺左x        ))=中央線左x
             
  table.LXr=(table.Xbr-table.Xtr)  //  (上辺右x-上辺右x)
           *(table.LY -table.Yt )  // *(中央線y-  上辺y)
           /(table.Yb -table.Yt )  // /(  上辺y-  上辺y)
           +(table.Xtr          ); // +(上辺右x        )=中央線右x
}
//ボールとネットの表示（タイミングを変えるため）
void BandN(){
  if(ball.Yim<ball.areaY/2){
    SetColer(ballsdoD);
    ellipse(ball.Xsdo, ball.Ysdo, ball.B, ball.B);
    SetColer(netD);
    quad(table.LXl,table.LY,table.LXr,table.LY
      ,table.LXr+table.NW,table.LY-table.NH,table.LXl-table.NW,table.LY-table.NH);//中央線の表示
     SetColer(ballD);
    ellipse(ball.X, ball.Y, ball.B, ball.B);
  }else{
    SetColer(ballsdoD);
    ellipse(ball.Xsdo, ball.Ysdo, ball.B, ball.B);
    SetColer(ballD);
    ellipse(ball.X, ball.Y, ball.B, ball.B);
    SetColer(netD);
    quad(table.LXl,table.LY,table.LXr,table.LY
      ,table.LXr+table.NW,table.LY-table.NH,table.LXl-table.NW,table.LY-table.NH);//中央線の表示
  }
  return;
}

void setJudgezone(){
  rectMode(CORNERS);
  SetColer(judge4D);
  for(int i=0;i<judge.P;i++)rect(width/2-judge.T/2+i*judge.T/judge.P,ballYim_Y(ball.areaY*0.75),width/2-judge.T/2+(i+1)*judge.T/judge.P,ballYim_Y(ball.areaY*0.85));
  
  SetColer(judge1D);
  rect(judge.backL[judge.racketP],ballYim_Y(ball.areaY*0.75),judge.backR[judge.racketP],ballYim_Y(ball.areaY*0.85));
  SetColer(judge2D);
  rect(judge.foreL[judge.racketP],ballYim_Y(ball.areaY*0.75),judge.foreR[judge.racketP],ballYim_Y(ball.areaY*0.85));
  SetColer(judge3D);
  rect(judge.foreL[judge.racketP],ballYim_Y(ball.areaY*0.75),judge.backR[judge.racketP],ballYim_Y(ball.areaY*0.85));
  image(racket1,(judge.backL[judge.racketP]+judge.foreR[judge.racketP])/2,(table.Yb+ballYim_Y(ball.areaY*0.85))/2.0);
  
  rectMode(CENTER);
}

int nowJzone(BALL ball){
  if(ballYim_Y(ball.areaY*0.75)<=ball.Ysdo&&ball.Ysdo<=ballYim_Y(ball.areaY*0.85)){
    for(int i=2;i<=judge.P;i++)if(judge.backL[i]<=ball.X&&ball.X<=judge.foreR[i-1])return int(pow(2,i*2-3)+pow(2,i*2-2));
    
    for(int i=1;i<=judge.P;i++)if(judge.foreL[i]<=ball.X&&ball.X<=judge.backR[i])return int(pow(2,i*2-2)+pow(2,i*2-1));
         
    for(int i=1;i<=judge.P;i++)if(judge.backL[i]<=ball.X&&ball.X<=judge.backR[i])return int(pow(2,i*2-2));

    for(int i=1;i<=judge.P;i++)if(judge.foreL[i]<=ball.X&&ball.X<=judge.foreR[i])return int(pow(2,i*2-1));

  }
  return 0;
}


