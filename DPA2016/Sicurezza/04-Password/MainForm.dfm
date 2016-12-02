object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'SQL Injection'
  ClientHeight = 481
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 635
    Height = 481
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Basic'
      object Label1: TLabel
        Left = 73
        Top = 32
        Width = 49
        Height = 13
        Caption = 'UserName'
      end
      object Label2: TLabel
        Left = 76
        Top = 54
        Width = 46
        Height = 13
        Caption = 'Password'
      end
      object edtUserName: TEdit
        Left = 128
        Top = 24
        Width = 177
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
      end
      object edtPassword: TEdit
        Left = 128
        Top = 51
        Width = 177
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
      end
      object Button1: TButton
        Left = 311
        Top = 49
        Width = 26
        Height = 25
        Caption = '*'
        TabOrder = 2
        OnClick = Button1Click
      end
      object Memo1: TMemo
        Left = 24
        Top = 256
        Width = 361
        Height = 89
        Lines.Strings = (
          'Memo1')
        TabOrder = 3
      end
      object ButtonLoginWithParams: TButton
        Left = 128
        Top = 108
        Width = 137
        Height = 25
        Caption = 'LoginWithParams'
        TabOrder = 4
        OnClick = ButtonLoginWithParamsClick
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=c:\db\test.fdb'
      'User_Name=SYSDBA'
      'Password=masterke'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 480
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT FULL_NAME FROM ENC_USERS '
      'WHERE USER_NAME = :USER_NAME'
      'AND PASSWORD = :PASSWORD'
      '')
    Left = 476
    Top = 88
    ParamData = <
      item
        Name = 'USER_NAME'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end
      item
        Name = 'PASSWORD'
        DataType = ftString
        ParamType = ptInput
        Size = 100
      end>
  end
end
