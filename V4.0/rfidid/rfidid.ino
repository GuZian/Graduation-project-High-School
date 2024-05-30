
void setup() {
  Serial.begin(9600);   //初始化串口并设置波特率为9600
  pinMode(7, OUTPUT);
  digitalWrite(7, LOW);
}

void loop() {
  String val;//读值
  String a;//整合值
  int i;//自增
  String b;//比较
  if (Serial.available() > 0)
  {
    if (val != -1) {
      for (i = 0; i <= 11; i++) {
        val = Serial.read();     //读串口
        a = a + val;//整合
        delay(30);
      }
        Serial.print(a);  //将收到是数据再通过串口发送出去
    }
  }
}
