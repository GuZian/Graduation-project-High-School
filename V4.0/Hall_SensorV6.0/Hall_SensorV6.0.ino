//12.5V

//#include <avr/wdt.h>  //调用看门狗库

int E2 = 5;     //定义M1使能端
int E1 = 6;     //定义M2使能端
int M2 = 4;    //定义M1控制端
int M1 = 7;    //定义M2控制端
int H1 = 2;    //定义霍尔传感器左1
int H2 = 3;    //定义霍尔传感器左2
int H3 = 8;    //定义霍尔传感器中
int H4 = 9;    //定义霍尔传感器右2
int H5 = 10;   //定义霍尔传感器右1
int stateH1;
int stateH2;
int stateH3;
int stateH4;
int stateH5;

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
  pinMode (H5, INPUT);
  pinMode(11, INPUT);

  for (i = 3; i <= 10; i++)
    pinMode(i, OUTPUT);
  Serial.begin(9600);// put your setup code here, to run once:
  // wdt_enable(WDTO_120MS);//打开看门狗（防止死机）
  delay(1000);
}

void loop() {
  char val;
  val = Serial.read();     //读串口

  if (val != -1) {
    //    switch (val)
    //    {
    //      case'A': zuozhuan(); break;
    //      case'B': youzhuan(); break;
    //      case'C': zhixing(); break;
    //      case'D': back_off(100, 100); break;
    //      default: stop(); break;
    //    }
    while (val == 'A' ) {
      zuozhuan();
    }
    while  (val == 'B') {
      youzhuan();
    }
    while (val == 'C') {
      zhixing();
    }
  }
}

void zuozhuan()
{
  int s = 0;
  stateH1 = digitalRead (H1);
  stateH2 = digitalRead (H2);
  stateH3 = digitalRead (H3);
  stateH4 = digitalRead (H4);
  stateH5 = digitalRead (H5);
  /* Hall Sensor */
  if ((stateH1 == LOW  && stateH2 == LOW && stateH3 == HIGH && stateH4 == LOW && stateH5 == LOW) || (stateH1 == LOW  && stateH2 == HIGH && stateH3 == HIGH && stateH4 == HIGH && stateH5 == LOW) || (stateH1 == HIGH  && stateH2 == LOW && stateH3 == LOW && stateH4 == LOW && stateH5 == HIGH) || (stateH1 == LOW  && stateH2 == HIGH && stateH3 == LOW && stateH4 == HIGH && stateH5 == LOW)) //前进
  {
    advance(150, 150);
  }
  else if (( stateH5 == LOW && stateH4 == LOW && stateH3 == LOW && stateH2 == HIGH && stateH1 == LOW ) || ( stateH5 == LOW && stateH4 == LOW && stateH3 == HIGH && stateH2 == HIGH  && stateH1 == LOW)) //偏右转
  {
    advance(150, 155);
  }
  else if (( stateH5 == LOW && stateH4 == HIGH && stateH3 == LOW && stateH2 == LOW && stateH1 == LOW ) || ( stateH5 == LOW && stateH4 == HIGH && stateH3 == HIGH && stateH2 == LOW  && stateH1 == LOW)) //偏左转
  {
    advance(155, 150);
  }
  else if ((stateH5 == HIGH && stateH4 == HIGH && stateH3 == HIGH && stateH2 == LOW && stateH1 == LOW) || ( stateH5 == HIGH && stateH4 == HIGH && stateH3 == LOW && stateH2 == LOW && stateH1 == LOW ) || (stateH5 == HIGH && stateH4 == LOW && stateH3 == HIGH && stateH2 == LOW && stateH1 == LOW) || ( stateH5 == HIGH && stateH4 == LOW && stateH3 == LOW && stateH2 == LOW && stateH1 == LOW) || (stateH5 == HIGH && stateH4 == LOW && stateH3 == LOW && stateH2 == HIGH && stateH1 == LOW) || (stateH5 == HIGH && stateH4 == HIGH && stateH3 == LOW && stateH2 == HIGH && stateH1 == LOW) || (stateH5 == HIGH && stateH4 == HIGH)) //左转
  {
    turn_L(100, 180);
    delay(550);
    s = s + 1;
  }
  else if ((stateH5 == LOW && stateH4 == LOW && stateH3 == HIGH && stateH2 == HIGH && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == LOW && stateH3 == LOW && stateH2 == HIGH && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == LOW && stateH3 == HIGH && stateH2 == LOW && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == LOW && stateH3 == LOW && stateH2 == LOW && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == LOW && stateH3 == LOW && stateH2 == HIGH && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == HIGH && stateH3 == LOW && stateH2 == HIGH && stateH1 == HIGH) || (stateH2 == HIGH && stateH1 == HIGH)) //右转
  {
    advance(150, 150 );
  }
  else if (s = 5)
  {
    stop();
    delay(1500);
    s = 0;
  }
}
void youzhuan()
{
  int y = 0;
  stateH1 = digitalRead (H1);
  stateH2 = digitalRead (H2);
  stateH3 = digitalRead (H3);
  stateH4 = digitalRead (H4);
  stateH5 = digitalRead (H5);
  /* Hall Sensor */
  if ((stateH1 == LOW  && stateH2 == LOW && stateH3 == HIGH && stateH4 == LOW && stateH5 == LOW) || (stateH1 == LOW  && stateH2 == HIGH && stateH3 == HIGH && stateH4 == HIGH && stateH5 == LOW) || (stateH1 == HIGH  && stateH2 == LOW && stateH3 == LOW && stateH4 == LOW && stateH5 == HIGH) || (stateH1 == LOW  && stateH2 == HIGH && stateH3 == LOW && stateH4 == HIGH && stateH5 == LOW)) //前进
  {
    advance(150, 150);
  }
  else if (( stateH5 == LOW && stateH4 == LOW && stateH3 == LOW && stateH2 == HIGH && stateH1 == LOW ) || ( stateH5 == LOW && stateH4 == LOW && stateH3 == HIGH && stateH2 == HIGH  && stateH1 == LOW)) //偏右转
  {
    advance(150, 155);
  }
  else if (( stateH5 == LOW && stateH4 == HIGH && stateH3 == LOW && stateH2 == LOW && stateH1 == LOW ) || ( stateH5 == LOW && stateH4 == HIGH && stateH3 == HIGH && stateH2 == LOW  && stateH1 == LOW)) //偏左转
  {
    advance(155, 150);
  }
  else if ((stateH5 == HIGH && stateH4 == HIGH && stateH3 == HIGH && stateH2 == LOW && stateH1 == LOW) || ( stateH5 == HIGH && stateH4 == HIGH && stateH3 == LOW && stateH2 == LOW && stateH1 == LOW ) || (stateH5 == HIGH && stateH4 == LOW && stateH3 == HIGH && stateH2 == LOW && stateH1 == LOW) || ( stateH5 == HIGH && stateH4 == LOW && stateH3 == LOW && stateH2 == LOW && stateH1 == LOW) || (stateH5 == HIGH && stateH4 == LOW && stateH3 == LOW && stateH2 == HIGH && stateH1 == LOW) || (stateH5 == HIGH && stateH4 == HIGH && stateH3 == LOW && stateH2 == HIGH && stateH1 == LOW) || (stateH5 == HIGH && stateH4 == HIGH)) //左转
  {
    advance(150, 150);
  }
  else if ((stateH5 == LOW && stateH4 == LOW && stateH3 == HIGH && stateH2 == HIGH && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == LOW && stateH3 == LOW && stateH2 == HIGH && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == LOW && stateH3 == HIGH && stateH2 == LOW && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == LOW && stateH3 == LOW && stateH2 == LOW && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == LOW && stateH3 == LOW && stateH2 == HIGH && stateH1 == HIGH) || (stateH5 == LOW && stateH4 == HIGH && stateH3 == LOW && stateH2 == HIGH && stateH1 == HIGH) || (stateH2 == HIGH && stateH1 == HIGH)) //右转
  {
    turn_R(180, 100 );
    delay(550);
    y = y + 1;
  }
  else if (y = 5)
  {
    stop();
    delay(1500);
    y = 0;
  }
}
void zhixing()
{
  stateH1 = digitalRead (H1);
  stateH2 = digitalRead (H2);
  stateH3 = digitalRead (H3);
  stateH4 = digitalRead (H4);
  stateH5 = digitalRead (H5);
  /* Hall Sensor */
  if ((stateH1 == LOW  && stateH2 == LOW && stateH3 == HIGH && stateH4 == LOW && stateH5 == LOW) || (stateH1 == LOW  && stateH2 == HIGH && stateH3 == HIGH && stateH4 == HIGH && stateH5 == LOW) || (stateH1 == HIGH  && stateH2 == LOW && stateH3 == LOW && stateH4 == LOW && stateH5 == HIGH) || (stateH1 == LOW  && stateH2 == HIGH && stateH3 == LOW && stateH4 == HIGH && stateH5 == LOW)) //前进
  {
    advance(150, 150);
  }
  else if (( stateH5 == LOW && stateH4 == LOW && stateH3 == LOW && stateH2 == HIGH && stateH1 == LOW ) || ( stateH5 == LOW && stateH4 == LOW && stateH3 == HIGH && stateH2 == HIGH  && stateH1 == LOW)) //偏右转
  {
    advance(150, 155);
  }
  else if (( stateH5 == LOW && stateH4 == HIGH && stateH3 == LOW && stateH2 == LOW && stateH1 == LOW ) || ( stateH5 == LOW && stateH4 == HIGH && stateH3 == HIGH && stateH2 == LOW  && stateH1 == LOW)) //偏左转
  {
    advance(155, 150);
  }
  else
  {
    stop();
  }
}
//void back()
//{
//  stateH1 = digitalRead (H1);
//  stateH2 = digitalRead (H2);
//  stateH3 = digitalRead (H3);
//  stateH4 = digitalRead (H4);
//  stateH5 = digitalRead (H5);
//  if (stateH1 == LOW  && stateH2 == LOW && stateH3 == LOW && stateH4 == LOW && stateH5 == LOW) //五传感器检测不到
//  {
//    turn_R(150, 150 );
//    delay(1500);
//  }
//}




