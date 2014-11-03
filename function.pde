//仮想y座標から画面上のy座標を表示させる
int ballYim_Y(float Yim,TABLE table){
    return int(pow(Yim,2)*(200.0*ball.areaYtop-225.0*table.Yt+25.0*table.Yb)/(18.0*pow(ball.areaY,2))
           -      (Yim  )*(400.0*ball.areaYtop-405.0*table.Yt+5.0*table.Yb)/(36.0*    ball.areaY   )
           +              (ball.areaYtop));
}


//仮想x座標と画面上のy座標から画面上のx座標を表示させる
int ballXim_X(float Xim,int Y,TABLE table){
    return int((Xim/table.Xim)
              *(Y*(table.XT-table.XB)/(table.Yt-table.Yb)+(table.XB*table.Yt-table.XT*table.Yb)/(table.Yt-table.Yb))
               +width/2.0);
}
//現在の
int ballBIG(int Y,TABLE table){
  return int((Y+(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT))*Base.BLbig/(table.Yb+(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT)));
}
//卓球台の中央線の情報を入力する
void tableCenter(TABLE table,BALL ball){
  table.LY=ballYim_Y(ball.areaY*0.5,table);//中央線y
  
  table.LXl=-((table.Xtl-table.Xbl)  //-((上辺左x-下辺左x)
             *(table.LY -table.Yt )  // *(中央線y-  上辺y)
             /(table.Yb -table.Yt )  // /(  下辺y-  上辺y)
             -(table.Xtl          ));// -(上辺左x        ))=中央線左x
             
  table.LXr=(table.Xbr-table.Xtr)  //  (上辺右x-上辺右x)
           *(table.LY -table.Yt )  // *(中央線y-  上辺y)
           /(table.Yb -table.Yt )  // /(  上辺y-  上辺y)
           +(table.Xtr          ); // +(上辺右x        )=中央線右x
}
