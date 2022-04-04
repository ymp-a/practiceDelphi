inherited IH002: TIH002
  Caption = 'IH002'
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
      Left = 228
      Top = 51
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
    object EdtMHNO: TEdit
      Left = 122
      Top = 21
      Width = 100
      Height = 21
      TabOrder = 5
    end
    object EdtTKCD: TEdit
      Left = 504
      Top = 21
      Width = 100
      Height = 21
      TabOrder = 6
    end
    object EdtMHIRDT: TEdit
      Left = 122
      Top = 48
      Width = 100
      Height = 21
      TabOrder = 7
    end
    object EdtMHKGDT: TEdit
      Left = 248
      Top = 48
      Width = 100
      Height = 21
      TabOrder = 8
    end
    object EdtTNCD: TEdit
      Left = 504
      Top = 48
      Width = 100
      Height = 21
      TabOrder = 9
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
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MHGSRO'
          Title.Caption = #21512#35336#25968#37327
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
          Visible = True
        end>
    end
  end
end
