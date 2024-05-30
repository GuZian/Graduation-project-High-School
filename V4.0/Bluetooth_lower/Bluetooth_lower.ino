/*Receive
 * AT+ROLE=ROLE_PERIPHERAL  从机
 * MAC：0xBC6A2935FA75
 * COM14

*/
void setup(){
  Serial.begin(9600);   //初始化串口并设置波特率为9600
}

void loop(){
  char val;
  val = Serial.read();     //读串口
  if(val!=-1){
  Serial.print(val);  //将收到是数据再通过串口发送出去
  }
}
