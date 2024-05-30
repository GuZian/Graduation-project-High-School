//#include <avr/wdt.h>  //调用看门狗库
int E1 = 5;     //定义M1使能端
int E2 = 6;     //定义M2使能端
int M1 = 4;    //定义M1控制端
int M2 = 7;    //定义M2控制端
int H1 = 2;    //定义霍尔传感器1
int H2 = 3;    //定义霍尔传感器2
int H3 = 11;    //定义霍尔传感器3
int H4 = 12;    //定义霍尔传感器4
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

void bluetooth()
{
  if (Serial.available() > 0) {
    char van = Serial.read();
    if (van != -1) {
      switch (van) {
        case 'a'://前进
          advance (100, 100);  //PWM调速
          break;
        case 'b'://后退
          back_off (100, 100);
          break;
        case 'l'://左转
          turn_L(100, 200); delay(700); stop(); advance (100, 100); break;
        case 'r'://右转
          turn_R(200, 100); delay(700); stop(); advance (100, 100); break;
        case 's'://停止
          stop();
          break;
      }
      delay(40);
    }
    else stop();
  }
}
void zouxian()         //Hall Sensor
{
  stateH1 = digitalRead (H1);
  stateH2 = digitalRead (H2);
  stateH3 = digitalRead (H3);
  stateH4 = digitalRead (H4);
  /* Hall Sensor */
  if ((stateH1 == LOW )&& (stateH2 == HIGH || stateH3 == HIGH) && (stateH4 == LOW)) //前进
  {
    advance(100, 100);
  }
  else if (stateH4 == HIGH && stateH3 == HIGH || stateH4 == HIGH )&& (stateH2 == HIGH || stateH4 == HIGH)) //左转
  {
    turn_L(100, 200);
  }
  else if ((stateH1 == HIGH )&& (stateH2 == HIGH || stateH1 == HIGH) && (stateH3 == HIGH || stateH1 == HIGH)) //右转
  {
    turn_R(200, 100);
  }
  else if (stateH1 == LOW && stateH2 == LOW && stateH3 == LOW && stateH4 == LOW)
  {
    back_off(100, 100);
  }
}


void setup()
{
  int i;
  int move;
  pinMode (H1, INPUT);
  pinMode (H2, INPUT);
  pinMode (H3, INPUT);
  pinMode (H4, INPUT);
  for (i = 6; i <= 9; i++)
    pinMode(i, OUTPUT);
  Serial.begin(9600);
//  wdt_enable(WDTO_120MS);//打开看门狗（防止死机）

}

void loop(void) {
  //  if (Serial.available() > 0) {
  //    char val = Serial.read();
  //    if (val != -1) {
  //      switch (val) {
  //        case 'h': zouxian(); break;
  //        case 'y': bluetooth(); break;
  //      }
  //      delay(40);
  //    }
  //  }
  zouxian();
}
