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
   StartUpPosition =   3  '����ȱʡ
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

'״̬�ж�
Private Sub Judgement()

      If Form_Loaded = False Then Exit Sub
      
      If MSComm1.PortOpen = False Then
      
         MSComm1.PortOpen = True
         
      End If
      
        MSComm1.OutBufferCount = 0
        Do
        MSComm1.Output = Chr(CInt(1))  '��Ƭ����������
        Loop



End Sub
'ͨѶģ���ʼ��
Private Sub Pre_Transmission()

    MSComm1.CommPort = 13 '���ô��ںţ��ɵ�Ƭ������
    
    MSComm1.Settings = "38400,N,8,1" '���ò����ʣ��뵥Ƭ����ͬ������żУ�飬����λ��ֹͣλ
    
    MSComm1.InBufferSize = 50 '��û���ܻ������Ĵ�С���ֽ���Ϊ��λ
    
    MSComm1.InBufferCount = 0
    
    MSComm1.InputMode = comInputModeBinary '�����Ʒ�ʽ
    
    MSComm1.RThreshold = 1 '����Ҫ���ܵ��ַ���
    
    MSComm1.InputLen = 0 '���ô��������Դӻ�������ȡ������
    
    If MSComm1.PortOpen = False Then
    
       MSComm1.PortOpen = True '�򿪴���
       
    End If
    
End Sub


