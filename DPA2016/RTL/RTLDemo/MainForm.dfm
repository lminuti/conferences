object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'RTL Demo'
  ClientHeight = 521
  ClientWidth = 653
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
    Width = 653
    Height = 521
    ActivePage = TabSheet8
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'String'
      object Button1: TButton
        Left = 24
        Top = 43
        Width = 75
        Height = 25
        Caption = 'Parse'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Edit1: TEdit
        Left = 24
        Top = 16
        Width = 281
        Height = 21
        TabOrder = 1
        Text = 'Luca,Paolo,Marco,Giorgio,Lorenzo'
      end
      object Memo1: TMemo
        Left = 24
        Top = 74
        Width = 281
        Height = 89
        TabOrder = 2
      end
      object Edit2: TEdit
        Left = 32
        Top = 197
        Width = 273
        Height = 21
        TabOrder = 3
        Text = '23234/d564""e45,,@l34p4$%=h][i'
      end
      object Edit3: TEdit
        Left = 32
        Top = 255
        Width = 273
        Height = 21
        TabOrder = 4
        Text = 'Edit2'
      end
      object Button2: TButton
        Left = 32
        Top = 224
        Width = 75
        Height = 25
        Caption = 'Valid'
        TabOrder = 5
        OnClick = Button2Click
      end
      object Edit4: TEdit
        Left = 32
        Top = 296
        Width = 265
        Height = 21
        TabOrder = 6
        Text = 'Funzioner'#224'?'
      end
      object Button3: TButton
        Left = 32
        Top = 323
        Width = 75
        Height = 25
        Caption = 'GetBytes'
        TabOrder = 7
        OnClick = Button3Click
      end
      object Edit5: TEdit
        Left = 32
        Top = 352
        Width = 265
        Height = 21
        TabOrder = 8
        Text = 'Edit5'
      end
      object Button4: TButton
        Left = 80
        Top = 416
        Width = 161
        Height = 25
        Caption = 'StringList - Fluent'
        TabOrder = 9
        OnClick = Button4Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'RegEx'
      ImageIndex = 1
      object Memo2: TMemo
        Left = 48
        Top = 32
        Width = 425
        Height = 209
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        Lines.Strings = (
          'CREATE TABLE USERS ('
          '    ID          INTEGER,'
          '    USER_NAME   VARCHAR(100),'
          '    USER_PASSWORD  VARCHAR(100),'
          '    FULL_NAME   VARCHAR(100)'
          ');')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
      object Button5: TButton
        Left = 48
        Top = 302
        Width = 75
        Height = 25
        Caption = 'Replace'
        TabOrder = 1
        OnClick = Button5Click
      end
      object Memo3: TMemo
        Left = 48
        Top = 368
        Width = 425
        Height = 128
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 2
        WordWrap = False
      end
      object Edit6: TEdit
        Left = 48
        Top = 247
        Width = 425
        Height = 21
        TabOrder = 3
        Text = '^\s{1,4}(\w+)\s+(\w+)[0-9\(\)]*(.+)'
      end
      object Edit7: TEdit
        Left = 48
        Top = 275
        Width = 425
        Height = 21
        TabOrder = 4
        Text = 'name: "\1", type: "\2"\3'
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Files'
      ImageIndex = 2
      object Button6: TButton
        Left = 56
        Top = 24
        Width = 75
        Height = 25
        Caption = 'ReadDir'
        TabOrder = 0
        OnClick = Button6Click
      end
      object Memo4: TMemo
        Left = 24
        Top = 55
        Width = 425
        Height = 128
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Mime'
      ImageIndex = 3
      object Memo5: TMemo
        Left = 16
        Top = 15
        Width = 425
        Height = 128
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        Lines.Strings = (
          'Lorem ipsum dolor sit amet, consectetur adipiscing '
          'elit, sed do eiusmod tempor incididunt ut labore '
          'et dolore magna aliqua. Ut enim ad minim veniam, '
          'quis nostrud exercitation ullamco laboris nisi ut '
          'aliquip ex ea commodo consequat. Duis aute irure '
          'dolor in reprehenderit in voluptate velit esse '
          'cillum dolore eu fugiat nulla pariatur. Excepteur '
          'sint occaecat cupidatat non proident, sunt in '
          'culpa qui officia deserunt mollit anim id est '
          'laborum')
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object Memo7: TMemo
        Left = 16
        Top = 191
        Width = 425
        Height = 194
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
      object Button7: TButton
        Left = 16
        Top = 160
        Width = 75
        Height = 25
        Caption = 'Mime'
        TabOrder = 2
        OnClick = Button7Click
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Date'
      ImageIndex = 4
      object Button8: TButton
        Left = 40
        Top = 24
        Width = 75
        Height = 25
        Caption = 'Timespan'
        TabOrder = 0
        OnClick = Button8Click
      end
      object Button9: TButton
        Left = 40
        Top = 55
        Width = 75
        Height = 25
        Caption = 'Stop watch'
        TabOrder = 1
        OnClick = Button9Click
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'HTTP'
      ImageIndex = 5
      object Button10: TButton
        Left = 249
        Top = 24
        Width = 88
        Height = 25
        Caption = 'Sync'
        TabOrder = 0
        OnClick = Button10Click
      end
      object Memo6: TMemo
        Left = 3
        Top = 55
        Width = 425
        Height = 194
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
      object Edit8: TEdit
        Left = 3
        Top = 28
        Width = 230
        Height = 21
        TabOrder = 2
        Text = 'https://www.google.com/'
      end
      object Button11: TButton
        Left = 343
        Top = 26
        Width = 88
        Height = 25
        Caption = 'ASync'
        TabOrder = 3
        OnClick = Button11Click
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'JSON'
      ImageIndex = 6
      object Memo8: TMemo
        Left = 3
        Top = 15
        Width = 425
        Height = 194
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        Lines.Strings = (
          '{'
          '  "nome": "luca",'
          '  "cognome": "minuti"'
          '}')
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
      object Button12: TButton
        Left = 16
        Top = 224
        Width = 75
        Height = 25
        Caption = 'Parse'
        TabOrder = 1
        OnClick = Button12Click
      end
      object Edit9: TEdit
        Left = 8
        Top = 256
        Width = 420
        Height = 21
        TabOrder = 2
        Text = 'Edit9'
      end
      object Button13: TButton
        Left = 104
        Top = 224
        Width = 75
        Height = 25
        Caption = 'Create'
        TabOrder = 3
        OnClick = Button13Click
      end
      object CheckBox1: TCheckBox
        Left = 232
        Top = 232
        Width = 97
        Height = 17
        Caption = 'BSON'
        TabOrder = 4
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'TZipFile'
      ImageIndex = 7
      object Button14: TButton
        Left = 16
        Top = 152
        Width = 75
        Height = 25
        Caption = 'Compress'
        TabOrder = 0
        OnClick = Button14Click
      end
      object Edit10: TEdit
        Left = 16
        Top = 24
        Width = 281
        Height = 21
        TabOrder = 1
        Text = 'C:\Progetti\DPA2016\RTL\delphi.zip'
      end
      object Memo11: TMemo
        Left = 16
        Top = 57
        Width = 465
        Height = 89
        Lines.Strings = (
          
            'C:\Program Files (x86)\Embarcadero\Studio\18.0\source\rtl\common' +
            '\System.Zip.pas'
          
            'C:\Program Files (x86)\Embarcadero\Studio\18.0\source\rtl\common' +
            '\System.Character.pas')
        TabOrder = 2
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Messaging'
      ImageIndex = 9
      object Memo10: TMemo
        Left = 48
        Top = 42
        Width = 441
        Height = 279
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 0
        WordWrap = False
      end
      object Init: TButton
        Left = 48
        Top = 3
        Width = 114
        Height = 33
        Caption = 'Add listener'
        TabOrder = 1
        OnClick = InitClick
      end
      object Add: TButton
        Left = 168
        Top = 3
        Width = 137
        Height = 33
        Caption = 'Send message'
        TabOrder = 2
        OnClick = AddClick
      end
    end
    object Thread: TTabSheet
      Caption = 'Thread'
      ImageIndex = 8
      object Button15: TButton
        Left = 16
        Top = 216
        Width = 121
        Height = 25
        Caption = 'Synchronize'
        TabOrder = 0
        OnClick = Button15Click
      end
      object Memo9: TMemo
        Left = 3
        Top = 3
        Width = 425
        Height = 194
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier'
        Font.Style = []
        ParentFont = False
        ScrollBars = ssBoth
        TabOrder = 1
        WordWrap = False
      end
      object Button16: TButton
        Left = 168
        Top = 216
        Width = 153
        Height = 25
        Caption = 'Monitor'
        TabOrder = 2
        OnClick = Button16Click
      end
    end
  end
  object NetHTTPClientAsync: TNetHTTPClient
    Asynchronous = True
    ConnectionTimeout = 5000
    ResponseTimeout = 5000
    AllowCookies = True
    HandleRedirects = True
    UserAgent = 'Embarcadero URI Client/1.0'
    OnRequestCompleted = NetHTTPClientAsyncRequestCompleted
    OnRequestError = NetHTTPClientAsyncRequestError
    Left = 524
    Top = 40
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 548
    Top = 360
  end
end
