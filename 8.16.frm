VERSION 5.00
Object = "{648A5603-2C6E-101B-82B6-000000000014}#1.1#0"; "MSCOMM32.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form Form1 
   Caption         =   "智能图书馆系统 上海市金山中学 顾子安 徐晟秋 彭星月"
   ClientHeight    =   7890
   ClientLeft      =   7590
   ClientTop       =   3240
   ClientWidth     =   11670
   BeginProperty Font 
      Name            =   "宋体"
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
   StartUpPosition =   2  '屏幕中心
   WhatsThisHelp   =   -1  'True
   Begin VB.TextBox Text3 
      Alignment       =   2  'Center
      BeginProperty Font 
         Name            =   "宋体"
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
      Caption         =   "浏览"
      BeginProperty Font 
         Name            =   "宋体"
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
         Name            =   "宋体"
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
      Caption         =   "载入"
      BeginProperty Font 
         Name            =   "宋体"
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
         Name            =   "宋体"
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
      Caption         =   "数据库文件："
      BeginProperty Font 
         Name            =   "宋体"
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
      Caption         =   "上海市金山中学 顾子安 徐晟秋 彭星月 版权所有"
      BeginProperty Font 
         Name            =   "宋体"
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
      Caption         =   "基于RFID技术的智能图书馆图书自动归位系统"
      BeginProperty Font 
         Name            =   "幼圆"
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
      Caption         =   "ID："
      BeginProperty Font 
         Name            =   "宋体"
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
      Caption         =   "书名："
      BeginProperty Font 
         Name            =   "宋体"
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
'             基于RFID技术的智能图书馆图书自动归位系统（上位机部分）
'
'
'                     海纳百创 2017青少年创客马拉松大赛专用
'
'
'
'                     上海市金山中学 顾子安 徐晟秋 彭星月
'
'                                     2017.9
'
'
'           上位机（VB）部分：顾子安      下位机(BASCOM-AVR)部分：徐晟秋 顾子安
'
'
'
'
'
'////////////////////////////////////////////////////////////////////////////////////


Option Explicit '强制声明所有变量

  Dim b As Integer

  Dim Conn, Reco, a
 
  Dim c As String
  
  Dim fileName  As String
  
  Private Declare Function MessageBoxTimeout Lib "user32" Alias "MessageBoxTimeoutA" (ByVal hwnd As Long, ByVal lpText As String, ByVal lpCaption As String, ByVal wType As Long, ByVal wlange As Long, ByVal dwTimeout As Long) As Long      '调用Windows API
  
 '//////////////////////////////浏览数据库文件，仅支持.mdb文件

Private Sub Command2_Click()
 
CommonDialog1.CancelError = True '设置“CancelError”为 True

On Error GoTo ErrHandler '设置标志

CommonDialog1.Flags = cdlOFNHideReadOnly

CommonDialog1.Filter = "All Files (*.*)|*.*|Access Files" & "(*.mdb)|*.mdb|"   '设置过滤器

CommonDialog1.FilterIndex = 2  '指定缺省的过滤器

CommonDialog1.ShowOpen   '显示“打开”对话框

Text3.Text = CommonDialog1.fileName '显示路径

fileName = CommonDialog1.fileName '

Exit Sub

ErrHandler: '用户按了“取消”按钮

Exit Sub

End Sub


'//////////////////////////////程序初始化
Private Sub Form_Load()

'//////////////////////////////初始化MSCOMM控件

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
    
    
'//////////////////////////////初始化文本框
    
    Text1.Text = "请将设有射频标签的书籍放置于读卡器上"
    
    Text1.FontSize = Text1.FontSize - 6 '设置字体大小
    
    Me.Show
  
    Text1.SelStart = 0 '设置文本起始点
  
    Text1.SelLength = Len(Text1.Text) '选中整个文本
    
    DoEvents '处理外部变化
    
End Sub

Private Sub Command1_Click()

'//////////////////////////////调用Access数据库文件，请注意数据库文件后缀必须是.mdb

Text1.FontSize = 20                                                       '定义ID号字体大小

Set Conn = CreateObject("ADODB.Connection")

Set Reco = CreateObject("ADODB.Recordset")

Conn.Open "Provider = Microsoft.Jet.OLEDB.4.0 ; Data Source = Database.mdb" '选择数据库路径，需要注意的是数据库文件名必须是Database.mdb

c = "Select sn,name From book where id= '" + Text1.Text + "'"            '以ID为参考对象从数据库取值

Reco.Open c, Conn, 1, 1, a

If Reco.EOF And Reco.BOF Then
 
  Text2.Text = "书籍未登记！请将书籍登记入数据库！"      '书籍未导入！

 'MsgBox "书籍未登记！请联系管理员将书籍登记入数据库！", 48, "警告!"
  
  MessageBoxTimeout Me.hwnd, "书籍未登记！请联系管理员将书籍登记入数据库！(本窗口将在3秒内关闭...)", "警告", vbInformation, 0, 3000
 
Else

'///////////////////////////////////////取值b
 
  Text2.Text = Reco("name").Value
  
  b = Reco("sn").Value
  
  Reco.Close
 
End If

'////////////////////////////////////////////////////向下位机传输数据

MSComm1.OutBufferCount = 0 '清空缓存区数据

MSComm1.Output = Chr(CInt(b)) '发送变量b

DoEvents '处理外部变化

End Sub

'////////////////////////////////////////////////////回车自动传值
Private Sub Text1_KeyPress(KeyAscii As Integer)

  If KeyAscii = 13 Then
  
    Call Command1_Click '回车后自动载入
  
    Text1.SelStart = 0 '设置文本起始点
  
    Text1.SelLength = Len(Text1.Text) '选中整个文本
    
    DoEvents '处理外部变化
  
  End If

End Sub
