VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3015
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3015
   ScaleWidth      =   4560
   StartUpPosition =   3  '窗口缺省
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   1560
      Top             =   1440
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False

'状态判断
Private Sub Judgement()

      If Form_Loaded = False Then Exit Sub
      
      If MSComm1.PortOpen = False Then
      
         MSComm1.PortOpen = True
         
      End If
      
        MSComm1.OutBufferCount = 0
        Do
        MSComm1.Output = Chr(CInt(1))  '向单片机发送数据
        Loop



End Sub
'通讯模块初始化
Private Sub Pre_Transmission()

    MSComm1.CommPort = 13 '设置串口号，由单片机决定
    
    MSComm1.Settings = "38400,N,8,1" '设置波特率（与单片机相同）、奇偶校验，数据位、停止位
    
    MSComm1.InBufferSize = 50 '获得或接受缓冲区的大小，字节数为单位
    
    MSComm1.InBufferCount = 0
    
    MSComm1.InputMode = comInputModeBinary '二进制方式
    
    MSComm1.RThreshold = 1 '设置要接受的字符数
    
    MSComm1.InputLen = 0 '设置从输入属性从缓冲区读取的数据
    
    If MSComm1.PortOpen = False Then
    
       MSComm1.PortOpen = True '打开串口
       
    End If
    
End Sub


