object baseForm: TbaseForm
  Left = 0
  Top = 0
  Caption = 'baseForm'
  ClientHeight = 338
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 280
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 88
    ExplicitTop = 40
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Memo1: TMemo
      Left = 56
      Top = 64
      Width = 425
      Height = 193
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 280
    Width = 527
    Height = 58
    Align = alBottom
    TabOrder = 1
    object Button1: TButton
      Left = 406
      Top = 22
      Width = 75
      Height = 25
      Caption = #32066#20102'(F9)'
      TabOrder = 0
      OnClick = Button1Click
    end
  end
end
