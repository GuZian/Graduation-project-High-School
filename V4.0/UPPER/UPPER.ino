/*
                              基于RFID系统的智能图书馆书籍自动归位系统V4.0

       本程序版权归 上海市金山中学 顾子安 所有，应用于 基于RFID系统的智能图书馆书籍自动归位系统V4.0
                                              （上位机）
                                        蓝牙、语音识别与合成模块
                          硬件核心：徐晟秋            软件核心：顾子安

                      注释： Voice.Initialise();初始化设置输入方式MIC/MONO。
                       Syn6288波特率为9600；蓝牙波特率为9600，在AT模式中波特率默认为115200
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

#define SUM 9    //定义关键词数
#define state_led 8          //状态指示灯插数字口8


char sRecog[SUM][30] = {"ni hao xiao hei", "qian jin", "zuo zhuan", "you zhuan", "hou tui", "ting zhi", "ni hao", "huo er mo shi", "yu yin mo shi"}; //定义二维数组，第二个值为每个关键词的最大字母数,Voice Recognize芯片用

uint8_t text1[] = {0xC1, 0xE3, 0xD2, 0xBB, 0xB6, 0xFE, 0xC8, 0xFD, 0xCB, 0xC4, 0xCE, 0xE5, 0xC1, 0xF9, 0xC6, 0xDF, 0xB0, 0xCB, 0xBE, 0xC5, 0xCA, 0xAE}; //零一二三四五六七八九十
uint8_t text2[] = {0xC4, 0xFA, 0xBA, 0xC3}; // 您好
uint8_t text3[] = {0xC7, 0xEB, 0xCE, 0xCA, 0xC4, 0xE3, 0xD4, 0xDA, 0xCB, 0xB5, 0xCA, 0xB2, 0xC3, 0xB4, 0xA3, 0xBF}; //请问你在说什么？
uint8_t text4[] = {0xBA, 0xC3, 0xB5, 0xC4, 0xA3, 0xAC, 0xC7, 0xB0, 0xBD, 0xF8}; //好的，前进
uint8_t text5[] = {0xBA, 0xC3, 0xB5, 0xC4, 0xA3, 0xAC, 0xD7, 0xF3, 0xD7, 0xAA}; //好的，左转
uint8_t text6[] = {0xBA, 0xC3, 0xB5, 0xC4, 0xA3, 0xAC, 0xBA, 0xF3, 0xCD, 0xCB}; //好的，后退
uint8_t text7[] = {0xBA, 0xC3, 0xB5, 0xC4, 0xA3, 0xAC, 0xCD, 0xA3, 0xD6, 0xB9}; //好的，停止
uint8_t text8[] = {0xBA, 0xC3, 0xB5, 0xC4, 0xA3, 0xAC, 0xD3, 0xD2, 0xD7, 0xAA}; //好的，右转
uint8_t text9[] = {0xBA, 0xC3, 0xB5, 0xC4, 0xA3, 0xAC, 0xBB, 0xF4, 0xB6, 0xFB, 0xC4, 0xA3, 0xCA, 0xBD}; //好的，霍尔模式
uint8_t text10[] = {0xBA, 0xC3, 0xB5, 0xC4, 0xA3, 0xAC, 0xD3, 0xEF, 0xD2, 0xF4, 0xC4, 0xA3, 0xCA, 0xBD};//好的，语音模式

uint8_t flag;  //标志位，收到口令后将置为1，动作执行完后清零

//SoftwareSerial mySerial(5, 6); // 软串口定义 RX, TX

void finally(uint8_t n) //新定义子函数finally，定义n把nAsrRes的值赋给它，n与sRecog数组中关键词的序列号对应
{
  switch (n)
  {
    case 0: case 6: syn.play(text2, sizeof(text2), 0); flag = 1; break; // 您好
    case 1:
      if (flag == 1)
      {
        syn.play(text4, sizeof(text4), 0);//播放好的，前进
        delay(500);
        Serial.println('a');
        delay(500);
        flag = 1;
      }
      break;
    case 2:
      if (flag == 1)
      {
        syn.play(text5, sizeof(text5), 0);//播放好的，左转
        delay(500);
        Serial.println('l');
        delay(500);
        flag = 1;
      }
      break;
    case 3:
      if (flag == 1)
      {
        syn.play(text8, sizeof(text8), 0);//播放好的，右转
        delay(500);
        Serial.println('r');
        delay(500);
        flag = 1;
      }
      break;
    case 4:
      if (flag == 1)
      {
        syn.play(text6, sizeof(text6), 0);//播放好的，后退
        delay(500);
        Serial.println('b');
        delay(500);
        flag = 1;
      }
      break;
    case 5:
      if (flag == 1)
      {
        syn.play(text7, sizeof(text7), 0);//播放好的，停止
        delay(500);
        Serial.println('s');
        delay(500);
        flag = 1;
      }
      break;
    case 7:
      if (flag == 1)
      {
        syn.play(text9, sizeof(text9), 0);//播放好的，霍尔模式
        delay(500);
        Serial.println('h');
        delay(500);
        flag = 1;
      }
      break;
    case 8:
      if (flag == 1)
      {
        syn.play(text10, sizeof(text10), 0);//播放好的，语音模式
        delay(500);
        Serial.println('y');
        delay(500);
        flag = 1;
      }
      break;
    default: syn.play(text3, sizeof(text3), 0); break; //非正常命令，请问你在说什么
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
  int i;
  for (i = 6; i <= 9; i++)
    pinMode(i, OUTPUT);
  Serial.begin(9200); //初始化串口并设置波特率为9600
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
            // Serial.println( "ASR_ERROR");
          }

          // Serial.println( "ASR_RUNING.....");
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
