//構造体の設定
void SetStructure(){
  Base2 = new BASE2();
  Base  = new BASE();
  ball  = new BALL();
  table = new TABLE();
  judge = new JUDGEMENT();
  
  backD    = new DESIGN();
  tableD   = new DESIGN();
  netD     = new DESIGN();
  ballD    = new DESIGN();
  ballsdoD = new DESIGN();
  judge1D  = new DESIGN();
  judge2D  = new DESIGN();
  judge3D  = new DESIGN();
  judge4D  = new DESIGN();
  
  common = new LEVEL();
   level1 = new LEVEL();
   level2 = new LEVEL();
   level3 = new LEVEL();
   level4 = new LEVEL();
   level5 = new LEVEL();
  
  backgroundDSN(backD);
  tableDSN(tableD);
  netDSN(netD);
  ballDSN(ballD);
  ballsdoDSN(ballsdoD);
  judge1DSN(judge1D);
  judge2DSN(judge2D);
  judge3DSN(judge3D);
  judge4DSN(judge4D);
  
  COMMON(common);
   LEVEL1(level1);
   LEVEL2(level2);
   LEVEL3(level3);
   LEVEL4(level4);
   LEVEL5(level5);
  
  Resolution(Base,Base2);
  settingTable(table,Base,Base2);
  settingBall(ball,table,Base);
  settingJUDGEMENT(Base,judge);
  tableCenter();
}

//解像度によって台やボールの表示の仕方を変える関数
void Resolution(BASE Base,BASE2 Base2){
  if(Base2.resolutionX>0&&Base2.resolutionY>0){
    //画面比に合った台の下辺の長さ = 設定した台の下辺の長さ*(画面横の長さ/画面縦の長さ)/(元のディスプレイの横の長さ/元のディスプレイの縦の長さ)
    Base.TABLEwidth =int(float(Base.TABLEwidth)*height*Base2.resolutionX/width/Base2.resolutionY);
    Base.totalJ     =int(float(Base.totalJ    )*height*Base2.resolutionX/width/Base2.resolutionY);
    Base.backJ      =int(float(Base.backJ     )*height*Base2.resolutionX/width/Base2.resolutionY);
    Base.foreJ      =int(float(Base.foreJ     )*height*Base2.resolutionX/width/Base2.resolutionY);
    Base.overlapJ   =int(float(Base.overlapJ  )*height*Base2.resolutionX/width/Base2.resolutionY);
    //ボールの大きさ調節
    //if(Base.BLbig!=-1)Base.BLbig=int(float(Base.BLbig)*height/Base2.resolutionY);
    //if(Base.BLsml!=-1)Base.BLsml=int(float(Base.BLsml)*height/Base2.resolutionY);
  }
  return;
}

void settingTable(TABLE table,BASE Base,BASE2 Base2){
  
  table.Xim=Base2.tableXim;                                 //仮想空間上の台の大きさ
  table.Yim=Base2.tableYim;                                 //仮想空間上の台の大きさ
  
  table.XB =Base.TABLEwidth;                                //下辺xの長さ
  table.XT =Base.TABLEwidth*Base.TABLEtop/Base.TABLEbottom; //上辺xの長さ
  table.YY =Base.TABLEheight;                               //上下辺yの長さ
  
  table.Xtl=(width -table.XT)/2+Base.Xshift;                //映し出される台の左上x座標
  table.Xtr=(width +table.XT)/2+Base.Xshift;                //映し出される台の右上x座標
  table.Yt =(height-table.YY)/2+Base.Yshift;                //映し出される台の上y座標
  table.Xbl=(width -table.XB)/2+Base.Xshift;                //映し出される台の左下x座標
  table.Xbr=(width +table.XB)/2+Base.Xshift;                //映し出される台の右下x座標
  table.Yb =(height+table.YY)/2+Base.Yshift;                //映し出される台の下y座標
  table.NH =Base2.NetH;                //映し出される台の右下x座標
  table.NW =Base2.NetW;                //映し出される台の下y座標
  
  table.CR =-(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT);//卓球台の縦２直線が交わる時のy座標の式{上辺xの長さ:(上辺y-?)=下辺xの長さ:(下辺y-?)}
  table.CE =width/2+Base.Xshift;//卓球台の縦２直線が交わる時のy座標の式{上辺xの長さ:(上辺y-?)=下辺xの長さ:(下辺y-?)}
}

void settingBall(BALL ball,TABLE table,BASE Base){
  if(Base.BLbig==-1)Base.BLbig=int(float(Base.BLsml)*(table.Yb-table.CR)/(table.Yt-table.CR));
  if(Base.BLsml==-1)Base.BLsml=int(float(Base.BLbig)*(table.Yt-table.CR)/(table.Yb-table.CR));
  
  ball.big = Base.BLbig;    //ボールの大きさ
  ball.sml = Base.BLsml;    //ボールの大きさ  
  
  ball.areaY    = table.Yim*2.0;                        //ボールの動く範囲の長さ=仮想空間上の卓球台の縦の長さ*倍率x
  ball.areaYtop = table.Yt-(table.YY*625.0/5625.0);  //ボールの動く範囲の上辺=テーブル上辺-(テーブルの長さ *((1/倍率x)/2)^2 /((1/倍率x)/2+(1/倍率x))^2 )
  ball.areaX    = table.Xim*2.0;      //ボールが動けるx座標の長さ
}
void settingJUDGEMENT(BASE Base,JUDGEMENT judge){
  judge.T = int(Base.totalJ);
  judge.B = int(Base.backJ);
  judge.F = int(Base.foreJ);
  judge.O = int(Base.overlapJ);
  judge.P = Base.pointJ;
  
  
  int NoOL=int((judge.T-(judge.P+1)*judge.O)/judge.P);
  
  for(int i=1;i<=judge.P;i++){
    judge.backL[i] = int((width/2.0-judge.T/2.0)+(judge.O + NoOL)*(i-1)                );
    judge.backR[i] = int((width/2.0-judge.T/2.0)+(judge.O + NoOL)*(i-1)        +judge.B);
    judge.foreL[i] = int((width/2.0-judge.T/2.0)+(judge.O + NoOL)*(i  )+judge.O-judge.F);
    judge.foreR[i] = int((width/2.0-judge.T/2.0)+(judge.O + NoOL)*(i  )+judge.O        );
  }
  /*
  judge.back1L = int(width/2.0-judge.T/2.0        );
  judge.back1R = int(width/2.0-judge.T/2.0+judge.B);
  judge.fore1L = int(width/2.0-judge.T/6.0-judge.F+judge.O*2.0/3.0);
  judge.fore1R = int(width/2.0-judge.T/6.0        +judge.O*2.0/3.0);

  judge.back2L = int(width/2.0-judge.T/6.0        -judge.O*1.0/3.0);
  judge.back2R = int(width/2.0-judge.T/6.0+judge.B-judge.O*1.0/3.0);
  judge.fore2L = int(width/2.0+judge.T/6.0-judge.F+judge.O*1.0/3.0);
  judge.fore2R = int(width/2.0+judge.T/6.0        +judge.O*1.0/3.0);
  
  judge.back3L = int(width/2.0+judge.T/6.0        -judge.O*2.0/3.0);
  judge.back3R = int(width/2.0+judge.T/6.0+judge.B-judge.O*2.0/3.0);
  judge.fore3L = int(width/2.0+judge.T/2.0-judge.F);
  judge.fore3R = int(width/2.0+judge.T/2.0        );
  */
}
