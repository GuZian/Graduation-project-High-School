'////////////////////////////////////////////////////////////////////////////////////
'
'
'
'
'
'
'
'             基于RFID技术的智能图书馆图书自动归位系统（下位机部分）
'
'
'                     海纳百创 2017青少年创客马拉松大赛专用
'
'
'
'                      上海市金山中学 顾子安 徐晟秋 彭星月
'
'                                   2017.9
'
'
'      下位机(BASCOM-AVR)部分：徐晟秋 顾子安      上位机（VB）部分：顾子安
'
'
'
'
'
'///////////////////////////////////////////////////////////////// ///////////////////

$regfile = "m128def.dat"
$crystal = 16000000
$baud = 9600
Declare Sub Motor
Dim M1 As Integer , M2 As Integer                           'PWM电机速率
Dim S As Integer
Declare Sub Zouxian(byval J As Integer)                     'VB上位机数据接收初始化，接收传值中间变量J
Dim J As Integer                                            '定义传值中间变量J
Config Lcd = 16 * 2
Config Portd = Output , Portb = Output
Config Porte = Output , Porta = Output
Config Portf = Input
Config Timer3 = Pwm , Pwm = 10 , Compare A Pwm = Clear Up , Compare B Pwm = Clear Up , Prescale = 1
Config Adc = Single , Prescaler = Auto , Reference = Avcc

Config Com1 = 9600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Com2 = 9600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0

Dim L As Byte
Dim A(6)as Word , P As Word , Idx As Word
Dim B As Byte
Dim C As Byte
 Dim Xy As Integer
 Dim Var As Byte
Waitms 100


Start Adc                                                   '开启模数转换器
Start Timer3                                                '定义E口PWM调速
Enable Interrupts

Config Serialin = Buffered , Size = 11
Config Serialin1 = Buffered , Size = 11


'Open all UARTS

Open "COM1:" For Binary As #1
Open "COM2:" For Binary As #2


Cls
Cls


Portd.1 = 1 : Portd.4 = 1 : Portd.5 = 1 : Portd.6 = 1 : Portd.7 = 1 : Portd.0 = 1 : Porta.0 = 1
'/////////////////
Print #1 , "Press any alpha numerical key"

Do
A(1) = Getadc(6)                                            '存储灰度值
A(2) = Getadc(7)
A(3) = Getadc(4)
A(4) = Getadc(5)
A(5) = Getadc(1)


Locate 1 , 1
Lcd "4" ; A(4) ; "/2" ; A(2) ; "/5" ; A(5)
Waitms 1
Locate 2 , 1
Lcd "A1 " ; A(1) ; " A3 " ; A(3)
Waitms 1


If A(1) >= 325 And A(2) >= 536 And A(3) >= 506 And A(4) >= 753 And A(5) < 750 And Pinf.0 = 0 Then
   Call Motor

   M1 = 850
   M2 = 850
   Else
End If


If A(1) < 325 Then
   Call Motor
   M1 = 0
   M2 = 850
Else
   If A(2) < 536 Then
      Call Motor
      M1 = 850
      M2 = 0
   Else
      If A(3) < 506 And A(5) >= 750 Then
         Call Motor
         M1 = 0
         M2 = 900
      Else
         If A(4) < 753 And A(5) >= 750 Then
            Call Motor
            M1 = 900
            M2 = 0

         End If
      End If
   End If
End If

If A(5) < 750 And A(2) < 536 And A(4) < 753 Then
Call Motor
M1 = 1000
M2 = 0
Waitms 1850
End If



   Portb.1 = Xy
 Var = 1
Do
'code
  Incr Var
  If Var = 8 Then
   B = Inkey(#2)
   Else
   C = Inkey(#2)
   End If

Loop Until Var = 11

  'Inputbin #2 , Ar(1) , 11

   'When the value > 0 we got something

   If B > 0 Then
        Cls : Cls
       Locate 1 , 1                                         'Print the character
        Lcd B
   End If
      Waitms 500
      If Xy > 0 Then
         Xy = 0
         Else
         Xy = 1
         End If



Loop


Serial1charmatch:

'Print #1 , "we got an A"

Return



'Label called when UART2 received a B

Serial2charmatch:

'Print #2 , "we got a B"

Return

Close #2                                                    'Close the channels
 Close #1
End


'///////////////////////////////////////////////下位机被动指令代码段开始

'Do

'S = Inkey()
'If S = 1 Then
'   Zouxian 1
'End If




'Sub Zouxian(byval J As Integer)
'Select Case J
'Case 1:
'Do
'A(1) = Getadc(0)
'A(2) = Getadc(6)
'A(3) = Getadc(7)
'A(4) = Getadc(4)
'A(5) = Getadc(5)


'Locate 1 , 1
'Lcd A(1) : Lcd A(3) : Lcd A(5)
'Waitms 1
'Locate 2 , 1
'Lcd A(2) : Lcd A(4)
'Waitms 1



'If A(1) < 377 Then
'   Call Motor
'   M1 = 0
'   M2 = 850
'Else
'   If A(2) < 540 Then
'      Call Motor
'      M1 = 850
'      M2 = 0
'   Else
'      If A(3) < 500 Then
'         Call Motor
'         M1 = 0
'         M2 = 900
'      Else
'         If A(4) < 766 Then
'            Call Motor
'            M1 = 900
'            M2 = 0
'         End If
'      End If
'   End If
'End If

'If A(1) >= 377 And A(2) >= 540 And A(3) >= 500 And A(4) >= 766 Then
'   Call Motor
'   M1 = 850
'   M2 = 850
'End If

'Loop


'Case 2





'End Select
'End Sub

'//////////////////////////////////////////////下位机被动指令代码段结束


Portd = 255
Porte.3 = 1
Porte.4 = 1

Sub Motor                                                   'PWM电机函数
If M1 = 0 Then
   Porte.2 = 0 : Porte.5 = 0
Else
   If M1 > 0 Then
      Porte.2 = 0 : Porte.5 = 1 : M1 = 1023 - M1
   Else
      Porte.2 = 1 : Porte.5 = 0 : M1 = 1023 + M1
   End If
End If

If M2 = 0 Then
   Porte.6 = 0 : Porte.7 = 0
Else
   If M2 > 0 Then
      Porte.6 = 1 : Porte.7 = 0 : M2 = 1023 - M2
   Else
      Porte.6 = 0 : Porte.7 = 1 : M2 = 1023 + M2
   End If
End If
   Pwm3a = M1 : Pwm3b = M2
End Sub



