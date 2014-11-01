class CREATING_RATE{
  int Xs=Base.Xshift;
  int Ys=Base.Yshift;
  int O_I=1;
  int WB=width*3/5+Base.Xshift;
 void rates(){
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
       ellipse(WB,ballYim_Y(BALLareaY*0.1*n),15+n,15+n);//ボールのエリアを十分割した時の位置
       text(n*0.1,8+WB,ballYim_Y(BALLareaY*0.1*n));
       text(ballYim_Y(BALLareaY*0.1*n),WB-40,ballYim_Y(BALLareaY*0.1*n));//y座標
     }
     ////////////////////////////////////////////////////
     ball.Xim=table.Xim;

     
     if(i==0){
     ball.Yim+=20;
    }else if(i==1){
      ball.Yim-=20;
    }
      if(ball.Yim<=0&&i==1)i=0;
      if(ball.Yim>=BALLareaY&&i==0)i=1;
      text(ball.Yim,100,100);
      ellipse(ballXim_X(ball.Xim,ballYim_Y(ball.Yim)),ballYim_Y(ball.Yim),16,16);//
  ////////////////////////////////////////////////////////
     stroke(0);
     fill(255);
   }
   return;
 }
}
