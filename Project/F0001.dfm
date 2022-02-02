object F0001Frm: TF0001Frm
  Left = 0
  Top = 0
  Caption = #25285#24403#32773#29031#20250#30011#38754
  ClientHeight = 488
  ClientWidth = 740
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
    Width = 740
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 50
      Height = 13
      Caption = #25285#24403#32773'CD'
    end
    object Label2: TLabel
      Left = 32
      Top = 51
      Width = 48
      Height = 13
      Caption = #25285#24403#32773#21517
    end
    object EdtTNCD: TEdit
      Left = 88
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 0
    end
    object EdtNAME: TEdit
      Left = 88
      Top = 48
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 640
      Top = 19
      Width = 75
      Height = 25
      Caption = #26908#32034
      TabOrder = 2
      OnClick = Button1Click
    end
    object EdtMode: TEdit
      Left = 0
      Top = 0
      Width = 73
      Height = 24
      Alignment = taCenter
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = #36861#21152
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 740
    Height = 351
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 738
      Height = 349
      Align = alClient
      DataSource = DataModule2.DataSource1
      ImeMode = imClose
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
          FieldName = 'TNBKCD'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNPASS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNNAME'
          Title.Caption = #25285#24403#32773#21517
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNKGKB'
          Title.Caption = #27177#38480
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNSTKB'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNPWLA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNCRDT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNCRTM'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNCRPG'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNCRWS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNCRUS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNUPDT'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNUPTM'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNUPPG'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNUPWS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNUPUS'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TNJTCD'
          Title.Caption = #29366#24907
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 440
    Width = 740
    Height = 48
    Align = alBottom
    TabOrder = 2
    object Button2: TButton
      Left = 7
      Top = 14
      Width = 75
      Height = 25
      Caption = #22793#26356
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 112
      Top = 14
      Width = 75
      Height = 25
      Caption = #32066#20102
      TabOrder = 1
      OnClick = Button3Click
    end
  end
end
