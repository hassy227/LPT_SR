//ボールの情報
class BALL{
  int X=0;          //ボールが表示されるx座標
  int Y=0;          //ボールが表示されるy座標
  
  float Xim=0;      //ボールの仮想空間上のx座標
  float Yim=0;      //ボールの仮想空間上のy座標
  float Zim=0;      //ボールの仮想空間上のz座標
  
  float XS=0;       //ボールのxスピード
  float YS=0;       //ボールのyスピード
  float ZS=0;       //ボールのzスピード
  
  float BDz;
  
  float big;    //ボールの大きさ
  float sml;    //ボールの大きさ  
  float Dsp;
  
  float areaY;      //ボールが動けるy座標の長さ（仮想）
  float areaYtop;   //ボールが動けるy座標の上辺（画面）
  float areaX;      //ボールが動けるx座標の長さ
};
class ENEMY{
  int LEVEL=3;
  float MAXspeed;
  float ADDspeed;
  float speed;
  float inertia;
}

class TABLE{  //卓球台の情報
  float Xim;  //仮想空間上の台の大きさ
  float Yim;  //仮想空間上の台の大きさ
  
  int Xtl;    //映し出される台の左上x座標
  int Xtr;    //映し出される台の右上x座標
  int Yt ;                                 //映し出される台の上y座標
  int Xbl;                                   //映し出される台の左下x座標
  int Xbr;                                   //映し出される台の右下x座標
  int Yb;                                 //映し出される台の下y座標
  
  int XT = 0;                                                            //上辺xの長さ
  int XB = 0;                                                            //下辺xの長さ
  int YY = 0;                                                            //上下辺yの長さ
  
  int LXl = 0;                                                                      //映し出される中央の線の左x座標  
  int LXr = 0;                                                                      //映し出される中央の線の右x座標   
  int LX  = 0;
  int LY  = 0;                                                                      //映し出される中央の線のy座標   
  
}

class RACKET{

}
