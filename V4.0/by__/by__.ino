//#include <avr/wdt.h>  //调用看门狗库

int E1 = 5;     //定义M1使能端
int E2 = 6;     //定义M2使能端
int M1 = 4;    //定义M1控制端
int M2 = 7;    //定义M2控制端
int H1 = 2;    //定义霍尔传感器1
int H2 = 3;    //定义霍尔传感器2
int H3 = 8;    //定义霍尔传感器3
int H4 = 9;    //定义霍尔传感器4
int stateH1;
int stateH2;
int stateH3;
int stateH4;

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
void turn_R (char a, char b) {          //右转
  analogWrite (E1, a);
  digitalWrite(M1, HIGH);
  analogWrite (E2, b);
  digitalWrite(M2, LOW);
}

void setup() {
  int i;
  int move;
  pinMode (H1, INPUT);
  pinMode (H2, INPUT);
  pinMode (H3, INPUT);
  pinMode (H4, INPUT);

  for (i = 3; i <= 9; i++)
    pinMode(i, OUTPUT);
  Serial.begin(9600);// put your setup code here, to run once:
 // wdt_enable(WDTO_120MS);//打开看门狗（防止死机）
}

void loop() {
  stateH1 = digitalRead (H1);
  stateH2 = digitalRead (H2);
  stateH3 = digitalRead (H3);
  stateH4 = digitalRead (H4);
  static int flag1 = 0;
  static int flag2 = 0;
  static int flag3 = 0;
  if (stateH4 == HIGH || flag1 == 1) //左转
  {
    turn_L(-150, 150);
    flag1 = 1;

  }
  else if (stateH1 == HIGH || flag2 == 1) //右转
  {
    turn_R(150, -150);
    flag2 = 1;

  }
  /* Hall Sensor */
  else if (stateH1 == LOW && stateH2 == LOW && stateH3 == HIGH && stateH4 == LOW)//前进
  {
    advance(80, 80);
    flag1 = 0;
    flag2 = 0;
  }
  else if (stateH1 == LOW && stateH2 == HIGH && stateH3 == LOW && stateH4 == LOW)//前进
  {
    advance(80, 80);
    flag2 = 0;
    flag1 = 0;
  }
  else if (stateH1 == LOW && stateH2 == HIGH && stateH3 == HIGH && stateH4 == LOW)//前进
  {
    advance(80, 80);
  }
  else
  {
    advance(80, 80);
  }

} // put your main code here, to run repeatedly:


