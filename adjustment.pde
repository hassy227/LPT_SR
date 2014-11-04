
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
      fill(255,0,0);
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
       
       ///////////////////////////////////////////////////////////
     for(int n=0;n<=10;n++){
       ellipse(WB,ballYim_Y(ball.areaY*0.1*n),ballBIG(ballYim_Y(ball.areaY*0.1*n)),ballBIG(ballYim_Y(ball.areaY*0.1*n)));//ボールのエリアを十分割した時の位置
       text(n*0.1,8+WB,ballYim_Y(ball.areaY*0.1*n));
       text(ballYim_Y(ball.areaY*0.1*n),WB-40,ballYim_Y(ball.areaY*0.1*n));//y座標
     }
     ////////////////////////////////////////////////////
     

     
     if(i%2==0){
     ball.Yim+=20;     
    }else if(i%2==1){
      ball.Yim-=20;
    }
      if(i/2==0){
     ball.Xim+=10;     
    }else if(i/2==1){
      ball.Xim-=10;
    }
      if(ball.Yim<=0&&i%2==1)i-=1;
      if(ball.Yim>=ball.areaY&&i%2==0)i+=1;
      if(ball.Xim<=-table.Xim/2&&i/2==1)i-=2;
      if(ball.Xim>=table.Xim/2&&i/2==0)i+=2;
      
      
      text(Base.TABLEwidth,100,100);
      text(ballBIG(ballYim_Y(ball.Yim)),100,140);
      ellipse(ballXim_X(ball.Xim,ballYim_Y(ball.Yim)),ballYim_Y(ball.Yim),ballBIG(ballYim_Y(ball.Yim)),ballBIG(ballYim_Y(ball.Yim)));//
  ////////////////////////////////////////////////////////
     stroke(0);
     fill(255);
   }
 }
}
