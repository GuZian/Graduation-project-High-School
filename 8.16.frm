VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "����ͼ���ϵͳ �Ϻ��н�ɽ��ѧ ���Ӱ� ������ ������"
   ClientHeight    =   7890
   ClientLeft      =   7590
   ClientTop       =   3240
   ClientWidth     =   11670
   BeginProperty Font 
      Name            =   "����"
      Size            =   10.5
      Charset         =   134
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "8.16.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   5.479
   ScaleMode       =   5  'Inch
   ScaleWidth      =   8.104
   StartUpPosition =   2  '��Ļ����
   WhatsThisHelp   =   -1  'True
   Begin VB.TextBox Text3 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "����"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   3240
      MultiLine       =   -1  'True
      TabIndex        =   8
      Text            =   "8.16.frx":25CA
      Top             =   1800
      Width           =   4215
   End
   Begin VB.CommandButton Command2 
      Caption         =   "���"
      BeginProperty Font 
         Name            =   "����"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   8160
      TabIndex        =   7
      Top             =   1800
      Width           =   1455
   End
   Begin MSComDlg.CommonDialog CommonDialog1 
      Left            =   9360
      Top             =   6600
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.TextBox Text2 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "����"
         Size            =   14.25
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   855
      Left            =   3240
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   1
      Text            =   "8.16.frx":25DF
      Top             =   4560
      Width           =   5055
   End
   Begin VB.CommandButton Command1 
      BackColor       =   &H80000018&
      Caption         =   "����"
      BeginProperty Font 
         Name            =   "����"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   8160
      TabIndex        =   0
      Top             =   3000
      Width           =   1455
   End
   Begin MSCommLib.MSComm MSComm1 
      Left            =   8640
      Top             =   6480
      _ExtentX        =   1005
      _ExtentY        =   1005
      _Version        =   393216
      CommPort        =   13
      DTREnable       =   -1  'True
      NullDiscard     =   -1  'True
      RThreshold      =   1
      BaudRate        =   38400
   End
   Begin VB.TextBox Text1 
      Alignment       =   2  'Center
      BackColor       =   &H80000002&
      BeginProperty Font 
         Name            =   "����"
         Size            =   15.75
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   615
      Left            =   3240
      MaxLength       =   20
      TabIndex        =   6
      Top             =   3120
      Width           =   4215
   End
   Begin VB.Label Label5 
      Caption         =   "���ݿ��ļ���"
      BeginProperty Font 
         Name            =   "����"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1680
      TabIndex        =   9
      Top             =   1920
      Width           =   1455
   End
   Begin VB.Label Label4 
      Caption         =   "�Ϻ��н�ɽ��ѧ ���Ӱ� ������ ������ ��Ȩ����"
      BeginProperty Font 
         Name            =   "����"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   3480
      TabIndex        =   5
      Top             =   6120
      Width           =   4095
   End
   Begin VB.Label Label3 
      Caption         =   "����RFID����������ͼ���ͼ���Զ���λϵͳ"
      BeginProperty Font 
         Name            =   "��Բ"
         Size            =   18
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   615
      Left            =   1800
      TabIndex        =   4
      Top             =   600
      Width           =   7455
   End
   Begin VB.Label Label2 
      Caption         =   "ID��"
      BeginProperty Font 
         Name            =   "����"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   255
      Left            =   2640
      TabIndex        =   3
      Top             =   3240
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "������"
      BeginProperty Font 
         Name            =   "����"
         Size            =   12
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   2400
      TabIndex        =   2
      Top             =   4800
      Width           =   735
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'////////////////////////////////////////////////////////////////////////////////////
'
'
'
'
'
'
'
'             ����RFID����������ͼ���ͼ���Զ���λϵͳ����λ�����֣�
'
'
'                     ���ɰٴ� 2017�����괴�������ɴ���ר��
'
'
'
'                     �Ϻ��н�ɽ��ѧ ���Ӱ� ������ ������
'
'                                     2017.9
'
'
'           ��λ����VB�����֣����Ӱ�      ��λ��(BASCOM-AVR)���֣������� ���Ӱ�
'
'
'
'
'
'////////////////////////////////////////////////////////////////////////////////////


Option Explicit 'ǿ���������б���

  Dim b As Integer

  Dim Conn, Reco, a
 
  Dim c As String
  
  Dim fileName  As String
  
  Private Declare Function MessageBoxTimeout Lib "user32" Alias "MessageBoxTimeoutA" (ByVal hwnd As Long, ByVal lpText As String, ByVal lpCaption As String, ByVal wType As Long, ByVal wlange As Long, ByVal dwTimeout As Long) As Long      '����Windows API
  
 '//////////////////////////////������ݿ��ļ�����֧��.mdb�ļ�

Private Sub Command2_Click()
 
CommonDialog1.CancelError = True '���á�CancelError��Ϊ True

On Error GoTo ErrHandler '���ñ�־

CommonDialog1.Flags = cdlOFNHideReadOnly

CommonDialog1.Filter = "All Files (*.*)|*.*|Access Files" & "(*.mdb)|*.mdb|"   '���ù�����

CommonDialog1.FilterIndex = 2  'ָ��ȱʡ�Ĺ�����

CommonDialog1.ShowOpen   '��ʾ���򿪡��Ի���

Text3.Text = CommonDialog1.fileName '��ʾ·��

fileName = CommonDialog1.fileName '

Exit Sub

ErrHandler: '�û����ˡ�ȡ������ť

Exit Sub

End Sub


'//////////////////////////////�����ʼ��
Private Sub Form_Load()

'//////////////////////////////��ʼ��MSCOMM�ؼ�

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
    
    
'//////////////////////////////��ʼ���ı���
    
    Text1.Text = "�뽫������Ƶ��ǩ���鼮�����ڶ�������"
    
    Text1.FontSize = Text1.FontSize - 6 '���������С
    
    Me.Show
  
    Text1.SelStart = 0 '�����ı���ʼ��
  
    Text1.SelLength = Len(Text1.Text) 'ѡ�������ı�
    
    DoEvents '�����ⲿ�仯
    
End Sub

Private Sub Command1_Click()

'//////////////////////////////����Access���ݿ��ļ�����ע�����ݿ��ļ���׺������.mdb

Text1.FontSize = 20                                                       '����ID�������С

Set Conn = CreateObject("ADODB.Connection")

Set Reco = CreateObject("ADODB.Recordset")

Conn.Open "Provider = Microsoft.Jet.OLEDB.4.0 ; Data Source = Database.mdb" 'ѡ�����ݿ�·������Ҫע��������ݿ��ļ���������Database.mdb

c = "Select sn,name From book where id= '" + Text1.Text + "'"            '��IDΪ�ο���������ݿ�ȡֵ

Reco.Open c, Conn, 1, 1, a

If Reco.EOF And Reco.BOF Then
 
  Text2.Text = "�鼮δ�Ǽǣ��뽫�鼮�Ǽ������ݿ⣡"      '�鼮δ���룡

 'MsgBox "�鼮δ�Ǽǣ�����ϵ����Ա���鼮�Ǽ������ݿ⣡", 48, "����!"
  
  MessageBoxTimeout Me.hwnd, "�鼮δ�Ǽǣ�����ϵ����Ա���鼮�Ǽ������ݿ⣡(�����ڽ���3���ڹر�...)", "����", vbInformation, 0, 3000
 
Else

'///////////////////////////////////////ȡֵb
 
  Text2.Text = Reco("name").Value
  
  b = Reco("sn").Value
  
  Reco.Close
 
End If

'////////////////////////////////////////////////////����λ����������

MSComm1.OutBufferCount = 0 '��ջ���������

MSComm1.Output = Chr(CInt(b)) '���ͱ���b

DoEvents '�����ⲿ�仯

End Sub

'////////////////////////////////////////////////////�س��Զ���ֵ
Private Sub Text1_KeyPress(KeyAscii As Integer)

  If KeyAscii = 13 Then
  
    Call Command1_Click '�س����Զ�����
  
    Text1.SelStart = 0 '�����ı���ʼ��
  
    Text1.SelLength = Len(Text1.Text) 'ѡ�������ı�
    
    DoEvents '�����ⲿ�仯
  
  End If

End Sub
