
class BASE{

//台の高さ
  int TABLEheight=height/3;
  
//台の手前の長さ
  int TABLEwidth=width*2/5;
  
//台の手前と奥の長さの比率
  int TABLEtop=5;
  int TABLEbottom=8;
  
//台のずらし
  int Xshift=0;
  int Yshift=0;
  
//背景（「写真->モノクロ->カラーの順」に優先）
  PImage Back;//使用する場合は「loadImage("画像ファイルの名前")」で情報を入力
   int BC = 128;//黒色の濃さ（使用する場合は0～255で設定）
    int BR = 0;//赤の濃さ
    int BG = 0;//緑の濃さ
    int BB = 0;//青の濃さ
  
  
  
//ボールの大きさ(上辺に来るとき:-1にすると下辺の大きさから台の比率で合わせられる)
  int BLsml=-1;
//ボールの大きさ(下辺に来るとき:-1にすると上辺の大きさから台の比率で合わせられる)
  int BLbig=24;
};
