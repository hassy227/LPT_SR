
class BASE{
//台の高さ
  int TABLEheight=height/3;
  
//台の手前の長さ
  int TABLEwidth=width*2/5;
  
//台の手前と奥の長さの比率
  int TABLEtop=5;
  int TABLEbottom=8;
  
//台のずらし(画面比で指定することを勧める)
  int Xshift=0;
  int Yshift=0;
  

  
  
  
//ボールの大きさ(上辺に来るとき:-1にすると下辺の大きさから台の比率で合わせられる)
  int BLsml=-1;
//ボールの大きさ(下辺に来るとき:-1にすると上辺の大きさから台の比率で合わせられる)
  int BLbig=height/40;
};
