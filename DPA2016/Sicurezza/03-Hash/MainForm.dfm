object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Hash demo'
  ClientHeight = 490
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnIndyMD5: TButton
    Left = 48
    Top = 167
    Width = 75
    Height = 25
    Caption = 'Indy MD5'
    TabOrder = 0
    OnClick = btnIndyMD5Click
  end
  object memInput: TMemo
    Left = 48
    Top = 8
    Width = 545
    Height = 145
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier'
    Font.Style = []
    Lines.Strings = (
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do '
      'eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut '
      'enim ad minim veniam, quis nostrud exercitation ullamco laboris '
      
        'nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor i' +
        'n '
      'reprehenderit in voluptate velit esse cillum dolore eu fugiat '
      'nulla pariatur. Excepteur sint occaecat cupidatat non proident, '
      'sunt in culpa qui officia deserunt mollit anim id est laborum')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object memOutput: TMemo
    Left = 48
    Top = 216
    Width = 545
    Height = 145
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
  object btnDM5: TButton
    Left = 129
    Top = 167
    Width = 75
    Height = 25
    Caption = 'MD5'
    TabOrder = 3
    OnClick = btnDM5Click
  end
  object Button1: TButton
    Left = 210
    Top = 167
    Width = 75
    Height = 25
    Caption = 'SHA1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 291
    Top = 167
    Width = 75
    Height = 25
    Caption = 'SHA256'
    TabOrder = 5
    OnClick = Button2Click
  end
end
