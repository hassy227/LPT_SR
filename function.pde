//背景を設定する
void SetBack(BASE Base){
  if(Base.Back!=null){
    image(Base.Back,width/2,height/2,width,height);
    return;
  }
  if(Base.BC<0||Base.BC>255 ){
    background(Base.BR,Base.BG,Base.BB);
  }else{
    background(Base.BC);
  }
  return;
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
               +width/2.0);
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
  float HZ=Base2.ballHZ;
  float SZ=Base2.ballZspeed;//最高上昇速度
  float BZ=Base2.ballBound+TT;//
  float HY=Base2.ballHY;
 text(BZ,200,100);
 text(ball.areaY*0.5,200,120);
  if(YS>0)Yims=Yim;
  if(YS<0)Yims=ball.areaY-Yim;
  if(Yims>BZ)Yims=BZ*2.0-Yims;

  return  (HZ -SZ*TT +SZ*BZ)                                  /(pow(TT,2.0)-pow(BZ,2.0))*pow(Yims,2.0)
         + SZ                                                                           *    Yims
         -(pow(BZ,2)*HZ +BZ*SZ*pow(TT,2.0) -pow(BZ,2.0)*SZ*TT)/(pow(TT,2.0)-pow(BZ,2.0));
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

