VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3015
   ClientLeft      =   8790
   ClientTop       =   4725
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3015
   ScaleWidth      =   4560
   Begin MSCommLib.MSComm MSComm1 
      Left            =   3120
      Top             =   2040
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   3
      DTREnable       =   -1  'True
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   1095
      Left            =   1200
      TabIndex        =   0
      Top             =   840
      Width           =   1215
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'ͨѶģ���ʼ��
Private Sub Pre_Transmission()

    MSComm1.CommPort = 3 '���ô��ںţ��ɵ�Ƭ������
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


'״̬�ж�
Private Sub Judgement()

      If Form_Loaded = False Then Exit Sub
      If MSComm1.PortOpen = False Then
         MSComm1.PortOpen = True
      End If
        MSComm1.OutBufferCount = 0
        MSComm1.Output = Chr(CInt(1)) '��Ƭ����������


End Sub

Private Sub Command1_Click()

   If Form_Loaded = False Then Exit Sub
   
   
      Do
      
        
        Call Judgement
        Call MSComm1_OnComm
       '�����ⲿ�仯
        
      Loop
End Sub

Private Sub MSComm1_OnComm()
Timer1.Enabled = False
MSComm1.InBufferSize = 40 '��ʼ������
MSComm1.InBufferCount = 0
MSComm1.InputMode = comInputModeBinary '�����Ʒ�ʽ
MSComm1.CommPort = 3
MSComm1.Settings = "9600,N,8,1"
MSComm1.RThreshold = 1
MSComm1.InputLen = 0 'ÿ�ζ��뻺���������ַ�
If MSComm1.PortOpen = False Then
MSComm1.PortOpen = True '�򿪴���
End If
MSComm1.OutBufferCount = 0
 MSComm1.Output = Chr(CInt(1))
End Sub
