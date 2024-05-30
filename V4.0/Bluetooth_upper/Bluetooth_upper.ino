/*SEND
 *AT+ROLE=ROLE_CENTRAL  主机
 *MAC:0xBC6A2935FD0F
 *COM4

*/
void setup() {
  Serial.begin(9600);    //初始化串口并设置波特率为9600
}

void loop() {
  Serial.print("Hello!");
  Serial.println("DFRobot");
  delay(500);
}
