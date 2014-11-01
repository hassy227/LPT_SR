class BASE2{
  //解像度によるゲーム表示の変化（解像度を入力すると今後どんなディスプレイをつかっても台が横長にならなくなる、適用しないなら0）
    int resolutionX=0;
    int resolutionY=0;
  //仮想空間上の台の大きさ(通常 2740.0000:1540.0000)
    float Xim=2740.0000;  
    float Yim=1540.0000;  
  // wiiリモコン
  
  
  //レベる設定２
/*
  BspeedMax ボールの最高速度
  BspeedMin ボールの最低速度
*/
  //レベル１
    float L1BspeedMax=0.0;
    float L1BspeedMin=0.0;
  //レベル２
    float L2BspeedMax=0.0;
    float L2BspeedMin=0.0;
  //レベル３
    float L3BspeedMax=0.0;
    float L3BspeedMin=0.0;
  //レベル４
    float L4BspeedMax=0.0;
    float L4BspeedMin=0.0;
  //レベル５
    float L5BspeedMax=0.0;
    float L5BspeedMin=0.0;
}
