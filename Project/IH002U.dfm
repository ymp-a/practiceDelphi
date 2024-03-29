inherited IH002: TIH002
  Caption = 'IH002'
  ExplicitTop = -33
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 32
      Top = 24
      Width = 42
      Height = 13
      Caption = #35211#31309#8470
    end
    object Label3: TLabel [1]
      Left = 400
      Top = 24
      Width = 56
      Height = 13
      Caption = #24471#24847#20808'CD'
    end
    object Label2: TLabel [2]
      Left = 32
      Top = 51
      Width = 70
      Height = 13
      Caption = #35211#31309#20381#38972#26085
    end
    object Label5: TLabel [3]
      Left = 219
      Top = 53
      Width = 14
      Height = 13
      Caption = #65374
    end
    object Label4: TLabel [4]
      Left = 400
      Top = 51
      Width = 84
      Height = 13
      Caption = #35211#31309#25285#24403#32773'CD'
    end
    object Label6: TLabel [5]
      Left = 624
      Top = 53
      Width = 7
      Height = 13
    end
    inherited Button1: TBitBtn
      TabOrder = 5
    end
    inherited Button10: TBitBtn
      TabOrder = 7
    end
    inherited BtnCSV: TBitBtn
      TabOrder = 8
    end
    inherited chkNotCDS: TCheckBox
      TabOrder = 9
    end
    inherited ChckBoxFont: TCheckBox
      TabOrder = 6
    end
    object EdtMHNO: TEdit
      Left = 122
      Top = 21
      Width = 100
      Height = 21
      MaxLength = 4
      TabOrder = 0
    end
    object EdtTKCD: TEdit
      Left = 504
      Top = 21
      Width = 100
      Height = 21
      MaxLength = 3
      TabOrder = 3
    end
    object EdtTNCD: TEdit
      Left = 504
      Top = 48
      Width = 100
      Height = 21
      MaxLength = 4
      TabOrder = 4
      OnDblClick = EdtTNCDDblClick
      OnExit = EdtTNCDExit
    end
    object EdtMHIRDT: TMaskEditDate
      Left = 122
      Top = 48
      Width = 74
      Height = 21
      EditMask = '9999/99/99;0;'
      MaxLength = 10
      TabOrder = 1
      Text = ''
      OnDblClick = EdtDateDblClick
      EndOfMonth = False
    end
    object EdtMHKGDT: TMaskEditDate
      Left = 249
      Top = 48
      Width = 74
      Height = 21
      EditMask = '9999/99/99;0;'
      MaxLength = 10
      TabOrder = 2
      Text = ''
      OnDblClick = EdtDateDblClick
      EndOfMonth = False
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid1: TDBGrid
      DataSource = DataModule4.DataSrc_IH002
      OnTitleClick = DBGrid1TitleClick
      Columns = <
        item
          Expanded = False
          FieldName = 'MHNO'
          Title.Caption = #35211#31309#8470
          Width = 50
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
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHTKCD'
          Title.Caption = #24471#24847#20808'CD'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHTKNM'
          Title.Caption = #24471#24847#20808#21517
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHGSRO'
          Title.Caption = #21512#35336#25968#37327
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHGKIN'
          Title.Caption = #21512#35336#37329#38989
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHTNCD'
          Title.Caption = #25285#24403#32773'CD'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNNAME'
          Title.Caption = #25285#24403#32773#21517
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHBIKO'
          Title.Caption = #20633#32771
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHJTCD'
          Title.Caption = #29366#24907
          Width = 64
          Visible = True
        end>
    end
  end
  inherited Panel3: TPanel
    inherited BitBtn1: TBitBtn
      Visible = False
    end
  end
end
