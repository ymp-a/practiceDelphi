object F0004Frm: TF0004Frm
  Left = 0
  Top = 0
  Caption = 'F0004Frm'
  ClientHeight = 475
  ClientWidth = 785
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
    Width = 785
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 32
      Top = 24
      Width = 37
      Height = 13
      Caption = #35211#31309#8470
    end
    object Label2: TLabel
      Left = 32
      Top = 51
      Width = 60
      Height = 13
      Caption = #35211#31309#20381#38972#26085
    end
    object Label3: TLabel
      Left = 376
      Top = 24
      Width = 50
      Height = 13
      Caption = #24471#24847#20808'CD'
    end
    object Label4: TLabel
      Left = 376
      Top = 51
      Width = 74
      Height = 13
      Caption = #35211#31309#25285#24403#32773'CD'
    end
    object Label5: TLabel
      Left = 204
      Top = 51
      Width = 12
      Height = 13
      Caption = #65374
    end
    object EdtMHNO: TEdit
      Left = 98
      Top = 21
      Width = 100
      Height = 21
      TabOrder = 0
    end
    object EdtMHIRDT: TEdit
      Left = 98
      Top = 48
      Width = 100
      Height = 21
      TabOrder = 1
    end
    object Button1: TButton
      Left = 640
      Top = 19
      Width = 75
      Height = 25
      Caption = #26908#32034
      TabOrder = 5
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
      TabOrder = 6
      Text = #29031#20250
    end
    object EdtTKCD: TEdit
      Left = 456
      Top = 21
      Width = 100
      Height = 21
      TabOrder = 3
    end
    object EdtTNCD: TEdit
      Left = 456
      Top = 48
      Width = 100
      Height = 21
      TabOrder = 4
    end
    object EdtMHKGDT: TEdit
      Left = 224
      Top = 48
      Width = 100
      Height = 21
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 89
    Width = 785
    Height = 386
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 783
      Height = 336
      Align = alClient
      DataSource = DataModule4.DataSrcF0004
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
          FieldName = 'MHNO'
          Title.Caption = #35211#31309#8470
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHIRDT'
          Title.Caption = #35211#31309#20381#38972#26085
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHKGDT'
          Title.Caption = #35211#31309#26399#38480
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHTKCD'
          Title.Caption = #24471#24847#20808'CD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHTKNM'
          Title.Caption = #24471#24847#20808#21517
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHGKIN'
          Title.Caption = #21512#35336#37329#38989
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHTNCD'
          Title.Caption = #25285#24403#32773'CD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNNAME'
          Title.Caption = #25285#24403#32773#21517
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHBIKO'
          Title.Caption = #20633#32771
          Width = 99
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHJTCD'
          Title.Caption = #29366#24907
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 1
      Top = 337
      Width = 783
      Height = 48
      Align = alBottom
      TabOrder = 1
      object Button2: TButton
        Left = 125
        Top = 14
        Width = 75
        Height = 25
        Caption = #22793#26356
        TabOrder = 1
        OnClick = Button2Click
      end
      object Button3: TButton
        Left = 455
        Top = 14
        Width = 75
        Height = 25
        Caption = #32066#20102
        TabOrder = 3
        OnClick = Button3Click
      end
      object Button4: TButton
        Left = 15
        Top = 14
        Width = 75
        Height = 25
        Caption = #36861#21152
        TabOrder = 0
        OnClick = Button4Click
      end
      object Button5: TButton
        Left = 235
        Top = 14
        Width = 75
        Height = 25
        Caption = #21066#38500
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 345
        Top = 14
        Width = 75
        Height = 25
        Caption = #29031#20250
        TabOrder = 4
        OnClick = Button6Click
      end
    end
  end
end
