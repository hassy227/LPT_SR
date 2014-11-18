//構造体の設定
void SetStructure(){
  Base =new BASE();
  Base2 = new BASE2();
  ball =new BALL();
  table =new TABLE();
  
  backD = new DESIGN();
  tableD = new DESIGN();
  netD = new DESIGN();
  ballD = new DESIGN();
  ballsdoD = new DESIGN();
  backgroundDSN(backD);
  tableDSN(tableD);
  netDSN(netD);
  ballDSN(ballD);
  ballsdoDSN(ballsdoD);
  
  Resolution(Base,Base2);
  settingTable(table,Base,Base2);
  settingBall(ball,table,Base);
  tableCenter();
}

//解像度によって台やボールの表示の仕方を変える関数
void Resolution(BASE Base,BASE2 Base2){
  if(Base2.resolutionX>0&&Base2.resolutionY>0){
    //画面比に合った台の下辺の長さ = 設定した台の下辺の長さ*(画面横の長さ/画面縦の長さ)/(元のディスプレイの横の長さ/元のディスプレイの縦の長さ)
    Base.TABLEwidth=int(float(Base.TABLEwidth)*height*Base2.resolutionX/width/Base2.resolutionY);
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
