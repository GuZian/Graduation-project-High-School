#include <avr/wdt.h>  //调用看门狗库

int E1 = 5;     //定义M1使能端
int E2 = 6;     //定义M2使能端
int M1 = 4;    //定义M1控制端
int M2 = 7;    //定义M2控制端
int H1 = 2;    //定义霍尔传感器1
int H2 = 3;    //定义霍尔传感器2
int H3 = 8;    //定义霍尔传感器3
int H4 = 9;    //定义霍尔传感器4

void stop(void) {                //停止
  digitalWrite(E1, LOW);
  digitalWrite(E2, LOW);
}

void advance(char a, char b) {         //前进
  analogWrite (E1, a);            //PWM调速
  digitalWrite(M1, HIGH);
  analogWrite (E2, b);
  digitalWrite(M2, HIGH);
}
void back_off (char a, char b) {         //后退
  analogWrite (E1, a);
  digitalWrite(M1, LOW);
  analogWrite (E2, b);
  digitalWrite(M2, LOW);
}
void turn_L (char a, char b) {          //左转
  analogWrite (E1, a);
  digitalWrite(M1, LOW);
  analogWrite (E2, b);
  digitalWrite(M2, HIGH);

}
void turn_R (char a, char b) {  //右转

  analogWrite (E1, a);
  digitalWrite(M1, HIGH);
  analogWrite (E2, b);
  digitalWrite(M2, LOW);
}

void setup()
{
  int i;
  static int stateH1 = digitalRead (H1);
  pinMode (H1, INPUT);
  pinMode (H2, INPUT);
  pinMode (H3, INPUT);
  pinMode (H4, INPUT);
  for (i = 4; i <= 9; i++)
    pinMode(i, OUTPUT);
  Serial.begin(9600);
  wdt_enable(WDTO_120MS);//打开看门狗（防止死机）
}

void loop()
{
  static int stateH1 = digitalRead (H1);
  static int stateH2 = digitalRead (H2);
  static int stateH3 = digitalRead (H3);
  static int stateH4 = digitalRead (H4);
  /* Hall Sensor */
  if (stateH1 == LOW && stateH2 == HIGH && stateH3 == HIGH && stateH4 == LOW) //前进
  {
    advance(70, 70);
  }
  if (stateH1 == LOW && stateH2 == HIGH && stateH3 == HIGH && stateH4 == LOW)//检测不到
  {

  }
  if (stateH1 == LOW && stateH2 == HIGH && stateH3 == LOW && stateH4 == LOW) //前进偏左
  {
    advance(100, 80);
  }
  if (stateH1 == LOW && stateH2 == LOW && stateH3 == HIGH && stateH4 == LOW) //前进偏右
  {
    advance(80, 100);
  }
  if (stateH4 == HIGH) //左转

  {
   while(1)
    {
      turn_L(50, 150); delay(15);
    }
  }
  if (stateH1 == HIGH) //右转
  {
   turn_L(150, 50); delay(15);
  }
}



