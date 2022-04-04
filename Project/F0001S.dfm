object F0001SFrm: TF0001SFrm
  Left = 0
  Top = 0
  Caption = 'F0001SFrm'
  ClientHeight = 467
  ClientWidth = 563
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = Button1Click
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 109
    Align = alTop
    TabOrder = 0
    DesignSize = (
      563
      109)
    object Label1: TLabel
      Left = 16
      Top = 20
      Width = 50
      Height = 13
      Caption = #25285#24403#32773'CD'
    end
    object Label2: TLabel
      Left = 16
      Top = 67
      Width = 48
      Height = 13
      Caption = #25285#24403#32773#21517
    end
    object Edit1: TEdit
      Left = 80
      Top = 17
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object Edit2: TEdit
      Left = 80
      Top = 64
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 455
      Top = 15
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #26908#32034
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 109
    Width = 563
    Height = 317
    Align = alClient
    TabOrder = 1
    DesignSize = (
      563
      317)
    object DBGrid0: TDBGrid
      Left = 8
      Top = 6
      Width = 544
      Height = 304
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DataModule2.DataSrc1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'TNTNCD'
          Title.Caption = #25285#24403#32773'CD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNNAME'
          Title.Caption = #25285#24403#32773#21517
          Width = 229
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNKGKB'
          Title.Caption = #27177#38480
          Width = 116
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 426
    Width = 563
    Height = 41
    Align = alBottom
    TabOrder = 2
    object Button2: TButton
      Left = 20
      Top = 6
      Width = 75
      Height = 25
      Caption = #22793#26356
      TabOrder = 0
    end
    object Button3: TButton
      Left = 113
      Top = 6
      Width = 75
      Height = 25
      Caption = #32066#20102
      TabOrder = 1
      OnClick = Button3Click
    end
  end
end
