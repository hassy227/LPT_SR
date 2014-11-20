
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
  
//ボールの跳ね方
  //球が跳ねる時の仮想空間上での台のY座標(台の上辺tableYim*n」の形にすることをお勧め)
    float ballBound=Base2.tableYim*0.85;
  //球が跳ねた瞬間の仮想空間上での上昇速度(高さを変える関数)
    float ballZspeed=0.32;
  //仮想空間上で球を打ち返した時のZ座標ズレ
    float ballHZ=0.0;
  //仮想空間上で球を打ち返した時のY座標ズレ
    float ballHY=0.0;
  
//打ち判定
  //移動する位置
    int pointJ = 5; 
  //打ち判定のxの長さ
    int totalJ=TABLEwidth*5/3;
  //バックの長さ
    int backJ=totalJ/8;
  //フォアの長さ
    int foreJ=totalJ/8;
  //判定の重なり
   int overlapJ=totalJ/40;  
  
//ボールの大きさ(上辺に来るとき:-1にすると下辺の大きさから台の比率で合わせられる
  int BLsml=-1;
//ボールの大きさ(下辺に来るとき:-1にすると上辺の大きさから台の比率で合わせられる)
  int BLbig=int(TABLEwidth*40*1.4/Base2.tableXim);
  
  
  
};
