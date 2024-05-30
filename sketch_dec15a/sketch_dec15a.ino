/*
                         基于RFID系统的智能图书馆书籍自动归位系统V4.0

             本程序版权归 上海市金山中学 顾子安 所有，应用于 基于RFID系统的智能图书馆书籍自动归位系统V4.0
                          硬件核心：徐晟秋            软件核心：顾子安

                      注释： Voice.Initialise();初始化设置输入方式MIC/MONO。
                        /*SEND
                          AT+ROLE=ROLE_CENTRAL  主机
                          MAC:0xBC6A2935FD0F

*/
#include <TimerOne.h>  //调用定时器库
#include <avr/wdt.h>  //调用看门狗库
#include <Voice.h>  //调用语音识别库
#include <Syn6288.h>  //调用语音合成库
//#include <SoftwareSerial.h>  //调用软串口

Syn6288 syn;
uint8  nAsrStatus = 0;

#define SUM 7    //定义关键词数
#define state_led 8          //状态指示灯插数字口8
#define R 5
#define G 3

char sRecog[SUM][30] = {"ni hao", "hong deng kai", "hong deng guan bi", "lv deng kai", "lv deng guan bi","hong deng","lv deng"}; //定义二维数组，第二个值为每个关键词的最大字母数,Voice Recognize芯片用

uint8_t text2[] = {0xC4, 0xFA, 0xBA, 0xC3}; // 您好
uint8_t text3[] = {0xC7, 0xEB, 0xCE, 0xCA, 0xC4, 0xE3, 0xD4, 0xDA, 0xCB, 0xB5, 0xCA, 0xB2, 0xC3, 0xB4, 0xA3, 0xBF}; //请问你在说什么？
uint8_t text8[] = {0xD5, 0xFD, 0xD4, 0xDA, 0xBF, 0xAA, 0xB5, 0xC6}; //正在开灯
uint8_t text9[] = {0xD5, 0xFD, 0xD4, 0xDA, 0xB9, 0xD8, 0xB5, 0xC6}; //正在关灯

uint8_t flag;  //标志位，收到口令后将置为1，动作执行完后清零

//SoftwareSerial mySerial(5, 6); // 软串口定义 RX, TX

void finally(uint8_t n) //新定义子函数finally，定义n把nAsrRes的值赋给它，n与sRecog数组中关键词的序列号对应
{
  switch (n)
  {
    case 0: syn.play(text2, sizeof(text2), 0); flag = 1; break; // 您好
    case 1: //红灯
      if (flag == 1)
      {
        syn.play(text8, sizeof(text8), 0); //播放正在开灯
        digitalWrite(R, HIGH);
        Serial.println("RH");
        flag = 1;
      }
      break;
    case 2: //关灯
      if (flag == 1)
      {
        syn.play(text9, sizeof(text9), 0); //播放正在关灯
        digitalWrite(R, LOW);
        Serial.println("RL");
        flag = 1;
      }
      break;
    case 3: //绿灯
      if (flag == 1)
      {
        syn.play(text8, sizeof(text8), 0); //播放正在开灯
        digitalWrite(G, HIGH);
        Serial.println("GH");
        flag = 1;
      }
      break;
    case 4: //关灯
      if (flag == 1)
      {
        syn.play(text9, sizeof(text9), 0); //播放正在关灯
        digitalWrite(G, LOW);
        Serial.println("GL");
        flag = 1;
      }
      break;
    default:syn.play(text3, sizeof(text3), 0); break; //非正常命令，请问你在说什么
  }
}

void ExtInt0Handler ()
{
  Voice.ProcessInt0();  //芯片送出中断信号
}

void timerIsr()
{
  wdt_reset();//看门狗重置
}


void setup()
{
  pinMode(R, OUTPUT);
  pinMode(G, OUTPUT);
  Serial.begin(9600);
  Voice.Initialise(MIC, VoiceRecognitionV1); //Initialise mode MIC or MONO,default is MIC
  //VoiceRecognitionV1 is VoiceRecognitionV1.0 shield
  //VoiceRecognitionV2 is VoiceRecognitionV2.1 module
  attachInterrupt(0, ExtInt0Handler, LOW);  //中断函数，0是引脚，ExtInt0Handler是中断服务程序，LOW为模式
  pinMode(state_led, OUTPUT);
  digitalWrite(state_led, LOW);
  Timer1.initialize(90000);
  Timer1.attachInterrupt(timerIsr); // attach the service routine here
  wdt_enable(WDTO_120MS);//打开看门狗（防止死机）
}

void loop()
{
  static uint8_t nAsrRes = 0;
  static unsigned long time = millis();
  if (millis() - time > 100)
  {
    switch (nAsrStatus)
    {
      case LD_ASR_RUNING:  //无break跳转，执行到最后语句
      case LD_ASR_ERROR: break;
      case LD_ASR_NONE:
        {
          nAsrStatus = LD_ASR_RUNING;
          if (Voice.RunASR(SUM, 7, sRecog) == 0) //识别不正确
          {
            nAsrStatus = LD_ASR_ERROR;
            Serial.println( "ASR_ERROR");
          }

          Serial.println( "ASR_RUNING.....");
          digitalWrite(state_led, HIGH);
          break;
        }
      case LD_ASR_FOUNDOK:
        {
          digitalWrite(state_led, LOW);
          nAsrRes = Voice. LD_GetResult(); // 一次ASR识别流程结束，去取ASR识别结果
          finally(nAsrRes);
          nAsrStatus = LD_ASR_NONE;
          break;
        }
      case LD_ASR_FOUNDZERO:
      default:
        {
          digitalWrite(state_led, LOW);
          nAsrStatus = LD_ASR_NONE;
          break;
        }
    }// switch

  }//if
}
