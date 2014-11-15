
class CREATING_RATE{
  int Xs=Base.Xshift;
  int Ys=Base.Yshift;
  int O_I=1;//0にするとrates
  int WB=width*3/5+Base.Xshift;
  
  int o;
  int p;
  
  void adjestmentSetup(){
  
  }
  
 void adjestmentDraw(){
   if(O_I!=0){
      
      stroke(192,0,0);
      fill(255,64,64);
      
     rect(table.Xtl,(table.Yt+ballYim_Y(ball.areaY*0.15))/2.0,table.XT/2.0,-ballYim_Y(ball.areaY*0.15)+table.Yt);
     rect((table.Xtl+table.Xtr)/2,(table.Yt+ballYim_Y(ball.areaY*0.15))/2.0,table.XT/2.0,-ballYim_Y(ball.areaY*0.15)+table.Yt);
     rect(table.Xtr,(table.Yt+ballYim_Y(ball.areaY*0.15))/2.0,table.XT/2.0,-ballYim_Y(ball.areaY*0.15)+table.Yt);
      
      /*
       line(width/2,
            //卓球台の縦２直線が交わる時のy座標の式{上辺xの長さ:(上辺y-?)=下辺xの長さ:(下辺y-?)}
            -(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT),
            width,
            //卓球台の縦２直線が画面横端に来る時のy座標の式{(画面横の長さ-上辺xの長さ):(?-上辺y)=(下辺xの長さ-上辺xの長さ):(下辺y-上辺y)}
            ((table.Yb-table.Yt)*width-table.XT*table.Yb+table.XB*table.Yt)/(table.XB-table.XT)
            );
       line(width/2,
            -(table.XT*table.Yb-table.XB*table.Yt)/(table.XB-table.XT),
            0,
            ((table.Yb-table.Yt)*width-table.XT*table.Yb+table.XB*table.Yt)/(table.XB-table.XT));
       */
       ///////////////////////////////////////////////////////////
     for(int n=0;n<=20;n++){
       ellipse(WB,ballYim_Y(ball.areaY*0.05*n),ballBIG(ballYim_Y(ball.areaY*0.05*n)),ballBIG(ballYim_Y(ball.areaY*0.05*n)));//ボールのエリアを十分割した時の位置
       text(n*0.05,8+WB,ballYim_Y(ball.areaY*0.05*n));
       text(ballYim_Y(ball.areaY*0.05*n),WB-40,ballYim_Y(ball.areaY*0.05*n));//y座標
     }
     ////////////////////////////////////////////////////


     
     ball.Yim+=ball.YS;     
     ball.Xim+=ball.XS;
     if(ball.Yim<= ball.areaY*0.2 &&ball.YS<0)ball.YS*=-1;
     if(ball.Yim>= ball.areaY*0.8 &&ball.YS>0)ball.YS*=-1;
     if(ball.Xim<=-table.Xim /2&&ball.XS<0)ball.XS*=-1;
     if(ball.Xim>= table.Xim /2&&ball.XS>0)ball.XS*=-1;
      
      
      text(Base.TABLEwidth,100,100);
      text(ballYim_ZimS(ball.Yim,ball.YS),100,140);
      text(ballYim_ZimS(ball.areaY*0.25,1),100,160);
      text(ballYim_ZimS(ball.areaY*0.75,0),100,180);
      text(ballYim_ZimS(ball.areaY*0.50,1),100,200);
      ellipse(ballXim_X(ball.Xim,ballYim_Y(ball.Yim)),ballYim_Y(ball.Yim),ballBIG(ballYim_Y(ball.Yim)),ballBIG(ballYim_Y(ball.Yim)));//
      ellipse(width/6,height/2-ballYim_ZimS(ball.Yim,ball.YS),ballBIG(ballYim_Y(ball.Yim)),ballBIG(ballYim_Y(ball.Yim)));//
  ////////////////////////////////////////////////////////
     stroke(0);
     fill(255);
   }
 }
}
