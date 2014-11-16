class BASE2{
  //解像度によるゲーム表示の変化（解像度を入力すると今後どんなディスプレイをつかっても起動画面が横長にならなくなる、適用しないなら0）
    int resolutionX=1400;
    int resolutionY=1050;
  //仮想空間上の台の大きさ(通常 1540.0000:2740.0000)
    float tableXim=1540.0000;  
    float tableYim=2740.0000;  
    
  //ボールの跳ね方
    //球が跳ねる時の仮想空間上でのY座標の位置(台の上辺tableYim*n」の形にすることをお勧め)
      float ballBound=tableYim*0.7;
    //球が跳ねた瞬間の仮想空間上での上昇速度(高さを変える関数)
      float ballZspeed=0.48;
    //仮想空間上で球を打ち返した時のZ座標ズレ
      float ballHZ=0.0;
    //仮想空間上で球を打ち返した時のY座標ズレ
      float ballHY=0.0;
  // wiiリモコン

}
