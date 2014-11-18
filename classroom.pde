//ボールの情報
class BALL{
  int X=0;          //ボールが表示されるx座標
  int Y=0;          //ボールが表示されるy座標
  int Xsdo=0;       //ボールの影が表示されるx座標
  int Ysdo=0;       //ボールの影が表示されるy座標
  int mY=0;         //ボールのy座標から引くべき
  int B=0;          //ボールが表示される大きさ
  
  float Xim=0;      //ボールの仮想空間上のx座標
  float Yim=0;      //ボールの仮想空間上のy座標
  float Zim=0;      //ボールの仮想空間上のz座標
  
  float XS=0;       //ボールのxスピード
  float YS=0;       //ボールのyスピード
  float ZS=0;       //ボールのzスピード
  
  float big;        //ボールの大きさ
  float sml;        //ボールの大きさ  
  float Dsp;
  
  float areaY;      //ボールが動けるy座標の長さ（仮想）
  float areaYtop;   //ボールが動けるy座標の上辺（画面）
  float areaX;      //ボールが動けるx座標の長さ
};
class ENEMY{
  int LEVEL=0;
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
  int Yt ;    //映し出される台の上y座標
  int Xbl;    //映し出される台の左下x座標
  int Xbr;    //映し出される台の右下x座標
  int Yb;     //映し出される台の下y座標
  
  int XT = 0; //上辺xの長さ
  int XB = 0; //下辺xの長さ
  int YY = 0; //上下辺yの長さ
  
  int LXl = 0;//映し出される中央の線の左x座標  
  int LXr = 0;//映し出される中央の線の右x座標   
  int LX  = 0;//LXr-LXl
  int LY  = 0;//映し出される中央の線のy座標
  int NH  = 0;//ネットの高さ
  int NW  = 0;//ネットの広がり
  
  int CR  = 0;//卓球台の縦２直線が交わる時のy座標
  int CE  = 0;//卓球台の中心のx座標
  
  
}

class RACKET{

}
//色情報の設定
class DESIGN{
  //（「写真->モノクロ->カラーの順」に優先）
  PImage P;//使用する場合は「loadImage("画像ファイルの名前")」で情報を入力
   int W = 0;//黒色の濃さ（使用する場合は0～255で設定）
    int R = 0;//赤の濃さ
    int G = 0;//緑の濃さ
    int B = 0;//青の濃さ
   int I = 0;//色設定時の透明度（0～255で設定）:不透明なら255
}
