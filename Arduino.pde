// シリアルライブラリを取り入れる
import processing.serial.*;

class ARDUINO{
  Serial port;
  String data[];  // データの格納場所
  String myString;  // データの一時保存
  int data_int[];
  int lf = 10;
  
  ARDUINO(PApplet applet,String portNumber){
    if(arduino){
      port = new Serial(applet,portNumber,9600);
      data = new String[2];
      data_int = new int[2];
    }
  } 
  void update(){
    if(port!=null){
      // データ取得
      while (port.available() > 0) {
        myString = port.readStringUntil(lf);
        if (myString != null) {
          //println(myString);  
          myString=trim(myString);  // 改行を取る
          data=splitTokens(myString,",");  // ","ごとに配列へ格納
        for(int i=0; i<2; i++){  // string->intに変換
            data_int[i]=int(data[i]);
          }
        }
      }
    }
  }
}
