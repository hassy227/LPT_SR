class BALL{

  BASE base;

  int X=0;        //ボールの表示されるx座標
  int Y=0;        //ボールの表示されるy座標
  
  float Xim=0;      //ボールの仮想空間上のx座標
  float Yim=0;      //ボールの仮想空間上のy座標
  float Zim=0;      //ボールの仮想空間上のz座標
  
  float Xbs=0;      //ボールの補正前のxスピード
  float Ybs=0;      //ボールの補正前のyスピード
  float Zbs=0;      //ボールの補正前のzスピード
  
  float Xas=0;      //ボールの補正後のxスピード
  float Yas=0;      //ボールの補正後のyスピード
  float Zas=0;      //ボールの補正後のzスピード
  
  float BDz;
  
  float biggest;  //ボールの大きさ    
  
  float Dsp;
};
class ENEMY{
  
  int LEVEL=3;
  float MAXspeed;
  float ADDspeed;
  float speed;
  float inertia;
}

class TABLE{  //卓球台の情報
  float Xim=1540.0000;  //仮想空間上の台の大きさ
  float Yim=2740.0000;  //仮想空間上の台の大きさ
  
  int Xtl=(width-Base.TABLEwidth*Base.TABLEtop/Base.TABLEbottom)/2+Base.Xshift;    //映し出される台の左上x座標
  int Xtr=(width+Base.TABLEwidth*Base.TABLEtop/Base.TABLEbottom)/2+Base.Xshift;    //映し出される台の右上x座標
  int Yt =(height-Base.TABLEheight)/2+Base.Yshift;                                 //映し出される台の上y座標
  int Xbl=(width-Base.TABLEwidth)/2+Base.Xshift;                                   //映し出される台の左下x座標
  int Xbr=(width+Base.TABLEwidth)/2+Base.Xshift;                                   //映し出される台の右下x座標
  int Yb =(height+Base.TABLEheight)/2+Base.Yshift;                                 //映し出される台の下y座標
  
  int XT =abs(Xtl-Xtr);                                                            //上辺xの長さ
  int XB =abs(Xbl-Xbr);                                                            //下辺xの長さ
  int YY =abs(Yt -Yb );                                                            //上下辺yの長さ
  
  int LXl =0;                                                                      //映し出される中央の線の左x座標  
  int LXr =0;                                                                      //映し出される中央の線の右y座標
  int LY  =0;                                                                      //映し出される中央の線のy座標
}

class RACKET{

}
