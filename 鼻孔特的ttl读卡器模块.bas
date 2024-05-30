$regfile = "m128def.dat"
$crystal = 16000000
$baud = 9600
'Config Portd = Output
Config Portb = Output , Porta = Output

Config Com1 = 9600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0
Config Com2 = 9600 , Synchrone = 0 , Parity = None , Stopbits = 1 , Databits = 8 , Clockpol = 0


Enable Interrupts

Config Serialin = Buffered , Size = 11
Config Serialin1 = Buffered , Size = 11 , Bytematch = 65
Porta.0 = 1

'Open all UARTS

Open "COM1:" For Binary As #1
Open "COM2:" For Binary As #2

Config Lcd = 16 * 2
Dim B As Byte
Dim C As Byte
 Dim Xy As Integer
 Dim Var As Byte
Waitms 100







Print #1 , "Press any alpha numerical key"

'Dim Ar(12) As Byte
Do

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