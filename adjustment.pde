//作成用の
class CREATING_RATE {
  int Xs=Base.Xshift;
  int Ys=Base.Yshift;
  boolean O_Isetup=false;//trueだとsetupが起動させる、必要なくなったらfalseにする
  boolean O_Idraw =true; //trueだとdrawが起動させる、必要なくなったらfalseにする
  int WB=width*3/5+Base.Xshift;
  byte op=0;
  
  int o;
  int p;

  void adjestmentSetup() {
    if (O_Isetup) {
      ball.YS=40.0;
      ball.XS=10.0;
    }
  }

  void adjestmentDraw() {
    if (O_Idraw) {
      println(frameRate);
      stroke(192, 0, 0);
      fill(255, 64, 64);

      //rect(table.Xtl, (table.Yt+ballYim_Y(ball.areaY*0.15))/2.0, table.XT/2.0, -ballYim_Y(ball.areaY*0.15)+table.Yt);
      //rect((table.Xtl+table.Xtr)/2, (table.Yt+ballYim_Y(ball.areaY*0.15))/2.0, table.XT/2.0, -ballYim_Y(ball.areaY*0.15)+table.Yt);
      //rect(table.Xtr, (table.Yt+ballYim_Y(ball.areaY*0.15))/2.0, table.XT/2.0, -ballYim_Y(ball.areaY*0.15)+table.Yt);


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

      fill(255, 0, 0, 0);/*
      ellipse(table.CE, -(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT), 
      2*pow(pow(ball.X-table.CE, 2)+pow(ball.Y-table.CR, 2), 0.5), 
      2*pow(pow(ball.X-table.CE, 2)+pow(ball.Y-table.CR, 2), 0.5));
*/

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
      if (ball.Yim<= ball.areaY*0.1 &&ball.YS<0) {
       // ball.YS*=-1;//random(-1.12,-0.9);
       // ball.Yim=ball.areaY*0.25;
      }
      if (ball.Yim>= ball.areaY*0.9 &&ball.YS>0) {
      //  ball.YS*=-1;//random(-1.12,-0.9);
        //ball.Yim=ball.areaY*0.75;
      }
     // if (ball.Xim<=-table.Xim /2&&ball.XS<0)ball.XS*=-1;
      //if (ball.Xim>= table.Xim /2&&ball.XS>0)ball.XS*=-1;

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
      line(xx,yy,ball.XS*100,ball.YS*100);
      for(int i=1;i<=judge.P;i++){
        text(judge.foreL[i], judge.foreL[i], 800);
        text(judge.foreR[i], judge.foreR[i], 850);
        text(judge.backL[i], judge.backL[i], 800);
        text(judge.backR[i], judge.backR[i], 850);
      }
      
      if(judge.nowJzone!=0)op=byte(judge.nowJzone);
      ellipse(wiimote.ir0x*width/2+width/2,wiimote.ir0y*height,20,20);
      text(enemy.Xim, 100, 120);
      text(degree, 100, 140);
       text(enemy.ADDspeed, 100, 160);
      text(timer, 100, 180);
      text(enemy.X, 100, 220);
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


