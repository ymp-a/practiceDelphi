object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 122
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 32
    Width = 51
    Height = 13
    Caption = #12518#12540#12470#12540'ID'
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 47
    Height = 13
    Caption = #12497#12473#12527#12540#12489
  end
  object EdtUserId: TEdit
    Left = 88
    Top = 29
    Width = 121
    Height = 21
    ImeMode = imDisable
    MaxLength = 10
    NumbersOnly = True
    TabOrder = 0
  end
  object EdtPsw: TEdit
    Left = 88
    Top = 61
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 134
    Top = 88
    Width = 75
    Height = 25
    Caption = #12525#12464#12452#12531
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
end
