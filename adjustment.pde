//作成用の
class CREATING_RATE {
  int Xs=Base.Xshift;
  int Ys=Base.Yshift;
  boolean O_I=true;//trueだと関数が起動させる、必要なくなったらfalseにする
  int WB=width*3/5+Base.Xshift;

  int o;
  int p;

  void adjestmentSetup() {
    if (O_I) {
      ball.YS=20.0;
      ball.XS=10.0;
    }
  }

  void adjestmentDraw() {
    if (O_I) {
      println(frameRate);
      stroke(192, 0, 0);
      fill(255, 64, 64);

      rect(table.Xtl, (table.Yt+ballYim_Y(ball.areaY*0.15))/2.0, table.XT/2.0, -ballYim_Y(ball.areaY*0.15)+table.Yt);
      rect((table.Xtl+table.Xtr)/2, (table.Yt+ballYim_Y(ball.areaY*0.15))/2.0, table.XT/2.0, -ballYim_Y(ball.areaY*0.15)+table.Yt);
      rect(table.Xtr, (table.Yt+ballYim_Y(ball.areaY*0.15))/2.0, table.XT/2.0, -ballYim_Y(ball.areaY*0.15)+table.Yt);


      line(table.CE, 
      //卓球台の縦２直線が交わる時のy座標の式{上辺xの長さ:(上辺y-?)=下辺xの長さ:(下辺y-?)}
      table.CR, 
      width, 
      //卓球台の縦２直線が画面横端に来る時のy座標の式{(画面横の長さ-上辺xの長さ):(?-上辺y)=(下辺xの長さ-上辺xの長さ):(下辺y-上辺y)}
      (table.YY*width-table.XT*table.Yb+table.XB*table.Yt)/(table.XB-table.XT)
        );
      line(table.CE, 
      table.CR, 
      0, 
      (table.YY*width-table.XT*table.Yb+table.XB*table.Yt)/(table.XB-table.XT));

      fill(255, 0, 0, 0);
      ellipse(table.CE, -(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT), 
      2*pow(pow(ball.X-table.CE, 2)+pow(ball.Y-table.CR, 2), 0.5), 
      2*pow(pow(ball.X-table.CE, 2)+pow(ball.Y-table.CR, 2), 0.5));


      fill(255, 64, 64);
      ///////////////////////////////////////////////////////////
      /*
     for(int n=0;n<=20;n++){
       ellipse(WB,ballYim_Y(ball.areaY*0.05*n),ballBIG(ballYim_Y(ball.areaY*0.05*n)),ballBIG(ballYim_Y(ball.areaY*0.05*n)));//ボールのエリアを十分割した時の位置
       text(n*0.05,8+WB,ballYim_Y(ball.areaY*0.05*n));
       text(ballYim_Y(ball.areaY*0.05*n),WB-40,ballYim_Y(ball.areaY*0.05*n));//y座標
       }*/
      ////////////////////////////////////////////////////



      //ball.Yim+=ball.YS;     
      //ball.Xim+=ball.XS;
      if (ball.Yim<= ball.areaY*0.2 &&ball.YS<0) {
        ball.YS*=-1;
        ball.Yim=ball.areaY*0.25;
      }
      if (ball.Yim>= ball.areaY*0.8 &&ball.YS>0) {
        ball.YS*=-1;
        ball.Yim=ball.areaY*0.75;
      }
      if (ball.Xim<=-table.Xim /2&&ball.XS<0)ball.XS*=-1;
      if (ball.Xim>= table.Xim /2&&ball.XS>0)ball.XS*=-1;

      stroke(0, 0, 192);
      fill(64, 64, 255);
      //ellipse(ballXim_X(1000, ball.Ysdo), ball.Ysdo, ball.B, ball.B);
      //ellipse(ball.Xsdo, ball.Ysdo, ball.B, ball.B);
      line(table.CE, table.CR, ballXim_X(1000, ballYim_Y(ball.areaY*0.75)), ballYim_Y(ball.areaY*0.75)-ballZim_mY(50.0, ballYim_Y(ball.areaY*0.75)));
      fill(64, 0);
      ellipse(table.CE, -(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT), 
      2*pow(pow(ball.Xsdo-table.CE, 2)+pow(ball.Ysdo-table.CR, 2), 0.5), 
      2*pow(pow(ball.Xsdo-table.CE, 2)+pow(ball.Ysdo-table.CR, 2), 0.5));
      stroke(192, 0, 0);
      fill(255, 64, 64);

      text(ballZim_mY(ballYim_ZimS(ball.Yim,ball.YS),ball.Ysdo), 100, 100);
      text(ball.Zim,100,120);
      text(ball.B, 100, 140);
      text(ballYim_ZimS(ball.areaY*0.25, 1), 100, 160);
      line(table.CE, table.CR, ballXim_X(1000, ball.Ysdo), ball.Ysdo-ballZim_mY(50.0, ball.Ysdo));
      if (ball.Ysdo==ball.areaY*0.75)fill(0, 255, 0);
      //ellipse(ball.X, ball.Y, ball.B, ball.B);
      //ellipse(ballXim_X(1000, ball.Ysdo), ball.Ysdo-ballZim_mY(50.0, ball.Ysdo), ball.B, ball.B);//
      ////////////////////////////////////////////////////////
      stroke(0);
      fill(255);
    }
  }
}

