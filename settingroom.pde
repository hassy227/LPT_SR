
class BASE{

//台の高さ
  int TABLEheight=height/2;
//台の手前の長さ
  int TABLEwidth=width/3;
//台の手前と奥の長さの比率
  int TABLEtop=6;
  int TABLEbottom=8;
//台のずらし
  int Xshift=0;
  int Yshift=0;

//


//レベる設定
/*
  Espeed 敵の移動速度
  Einertia 敵の慣性補正能力
*/
  //レベル１
    float L1_Espeed=0.0;
    float L1_Einertia=0.0;
  //レベル２
    float L2_Espeed=0.0;
    float L2_Einertia=0.0;
  //レベル３
    float L3_Espeed=0.0;
    float L3_Einertia=0.0;
  //レベル４
    float L4_Espeed=0.0;
    float L4_Einertia=0.0;
  //レベル５
    float L5_Espeed=0.0;
    float L5_Einertia=0.0;
};
