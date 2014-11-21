//画像や配色
 /*「画像->モノクロ->カラーの順」に優先
  * *.P;//png画像 使用する場合は「loadImage("画像ファイルの名前")」で情報を入力 しない場合はnull
  *  *.W = -1;//白の濃さ（使用する場合は0～255で設定）
  *   *.R = 0;//赤の濃さ
  *   *.G = 0;//緑の濃さ
  *   *.B = 0;//青の濃さ
  * *.I = 0;//色設定時の透明度（0～255で設定）:不透明なら255
  */
//背景
void backgroundDSN(DESIGN design){
  design.P =null;
   design.W = 128;
    design.R = 0;
    design.G = 0;
    design.B = 0;
  design.I = 255;
}  
//卓球台
void tableDSN(DESIGN design){
   design.W = -1;
    design.R = 0;
    design.G = 255;
    design.B = 0;
   design.I = 255;
}
//ネット
void netDSN(DESIGN design){
   design.W = 255;
    design.R = 0;
    design.G = 0;
    design.B = 0;
   design.I = 128;
}
//ボール
void ballDSN(DESIGN design){
   design.W = 256;
    design.R = 255;
    design.G = 0;
    design.B = 0;
   design.I = 255;
}
//ボールの影
void ballsdoDSN(DESIGN design){
   design.W = 0;
    design.R = 0;
    design.G = 0;
    design.B = 0;
   design.I = 255;
}

void judge1DSN(DESIGN design){
   design.W = -1;
    design.R = 64;
    design.G = 64;
    design.B = 192;
   design.I = 255;  
}

void judge2DSN(DESIGN design){
   design.W = -1;
    design.R = 192;
    design.G = 64;
    design.B = 64;
   design.I = 255;
}

void judge3DSN(DESIGN design){
   design.W = -1;
    design.R = 192;
    design.G = 64;
    design.B = 192;
   design.I = 255;  
}

void judge4DSN(DESIGN design){
   design.W = 255;
    design.R = 0;
    design.G = 0;
    design.B = 0;
   design.I = 255;
}
