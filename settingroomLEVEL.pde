/*難易度別の設定
 *level.Espeed    敵の移動時の加速度
 *level.Einertia  敵の慣性補正能力
 *level.BspeedMax ボールの最高速度
 *level.BspeedMin ボールの最低速度
 */
//共通（ここで設定した各項目はすべての難易度で共通になる:適用しないなら0） 
void COMMON(LEVEL level){
  level.Eaddspeed = 1.0;
  level.Einertia  = 0.01;
  level.BspeedMax = 60.0;
  level.BspeedMin = 30.0;
}
//レベル１
void LEVEL1(LEVEL level){
  level.Eaddspeed = 0.0;
  level.Einertia  = 0.0;
  level.BspeedMax = 0.0;
  level.BspeedMin = 0.0;
}
//レベル２
void LEVEL2(LEVEL level){
  level.Eaddspeed = 0.0;
  level.Einertia  = 0.0;
  level.BspeedMax = 0.0;
  level.BspeedMin = 0.0;
}
//レベル３
void LEVEL3(LEVEL level){
  level.Eaddspeed  = 0.0;
  level.Einertia  = 0.0;
  level.BspeedMax = 0.0;
  level.BspeedMin = 0.0;
}
//レベル４
void LEVEL4(LEVEL level){
  level.Eaddspeed = 0.0;
  level.Einertia  = 0.0;
  level.BspeedMax = 0.0;
  level.BspeedMin = 0.0;
}
//レベル５
void LEVEL5(LEVEL level){
  level.Eaddspeed    = 0.0;
  level.Einertia  = 0.0;
  level.BspeedMax = 0.0;
  level.BspeedMin = 0.0;
}
