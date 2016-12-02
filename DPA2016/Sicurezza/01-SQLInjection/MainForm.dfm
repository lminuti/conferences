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
        CharCase = ecUpperCase
        PasswordChar = '*'
        TabOrder = 1
      end
      object LoginButton: TButton
        Left = 128
        Top = 109
        Width = 137
        Height = 25
        Caption = 'LoginWithFormat'
        TabOrder = 2
        OnClick = LoginButtonClick
      end
      object Button1: TButton
        Left = 311
        Top = 49
        Width = 26
        Height = 25
        Caption = '*'
        TabOrder = 3
        OnClick = Button1Click
      end
      object Memo1: TMemo
        Left = 24
        Top = 256
        Width = 361
        Height = 89
        Lines.Strings = (
          'Memo1')
        ScrollBars = ssVertical
        TabOrder = 4
      end
      object ButtonLoginWithStrings: TButton
        Left = 128
        Top = 78
        Width = 137
        Height = 25
        Caption = 'LoginWithStrings'
        TabOrder = 5
        OnClick = ButtonLoginWithStringsClick
      end
      object ButtonLoginQuoted: TButton
        Left = 128
        Top = 171
        Width = 137
        Height = 25
        Caption = 'LoginQuoted'
        TabOrder = 6
        OnClick = ButtonLoginQuotedClick
      end
      object ButtonLoginWithParams: TButton
        Left = 128
        Top = 140
        Width = 137
        Height = 25
        Caption = 'LoginWithParams'
        TabOrder = 7
        OnClick = ButtonLoginWithParamsClick
      end
      object ButtonLoginRegExp: TButton
        Left = 128
        Top = 202
        Width = 137
        Height = 25
        Caption = 'LoginRegExp'
        TabOrder = 8
        OnClick = ButtonLoginRegExpClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Snippets'
      ImageIndex = 1
      object SpeedButton1: TSpeedButton
        Left = 11
        Top = 368
        Width = 105
        Height = 22
        Caption = 'Copy selected'
        OnClick = SpeedButton1Click
      end
      object Memo2: TMemo
        Left = 3
        Top = 16
        Width = 358
        Height = 41
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        Lines.Strings = (
          #39' OR '#39'1'#39'='#39'1')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Memo3: TMemo
        Left = 3
        Top = 63
        Width = 358
        Height = 42
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        Lines.Strings = (
          #39' OR '#39'1'#39'='#39'1'#39' AND USER_NAME = '#39'PAOLO')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
      end
      object Memo4: TMemo
        Left = 3
        Top = 111
        Width = 518
        Height = 42
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        Lines.Strings = (
          #39' UNION SELECT PASSWORD FROM USERS WHERE USER_NAME='#39'PAOLO')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object Memo5: TMemo
        Left = 3
        Top = 159
        Width = 518
        Height = 50
        Lines.Strings = (
          
            #39' UNION SELECT LIST(USER_NAME || '#39'/'#39' ||  PASSWORD, ASCII_CHAR(13' +
            ') || ASCII_CHAR(10)) FROM '
          'USERS WHERE '#39'1'#39' = '#39'1')
        TabOrder = 3
      end
      object Memo6: TMemo
        Left = 3
        Top = 215
        Width = 518
        Height = 50
        Lines.Strings = (
          
            #39' UNION SELECT LIST(CARD_NUMBER, ASCII_CHAR(13) || ASCII_CHAR(10' +
            ')) FROM '
          'CREDIT_CARDS WHERE '#39'1'#39' = '#39'1')
        TabOrder = 4
      end
      object Memo7: TMemo
        Left = 3
        Top = 271
        Width = 518
        Height = 50
        Lines.Strings = (
          
            #39' UNION SELECT LIST(RDB$RELATION_NAME, ASCII_CHAR(13) || ASCII_C' +
            'HAR(10)) FROM '
          'RDB$RELATIONS WHERE '#39'1'#39' = '#39'1')
        TabOrder = 5
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=c:\db\test.fdb'
      'User_Name=SYSDBA'
      'Password=masterke'
      'DriverID=FB')
    LoginPrompt = False
    Left = 480
    Top = 32
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT FULL_NAME FROM USERS '
      'WHERE USER_NAME = :USER_NAME'
      'AND PASSWORD = :PASSWORD'
      '')
    Left = 476
    Top = 88
    ParamData = <
      item
        Name = 'USER_NAME'
        ParamType = ptInput
      end
      item
        Name = 'PASSWORD'
        ParamType = ptInput
      end>
  end
end
