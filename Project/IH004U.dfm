inherited IH004: TIH004
  Caption = 'IH004'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    object Label1: TLabel [0]
      Left = 32
      Top = 24
      Width = 56
      Height = 13
      Caption = #25285#24403#32773'CD'
    end
    object Label2: TLabel [1]
      Left = 32
      Top = 57
      Width = 56
      Height = 13
      Caption = #25285#24403#32773#21517
    end
    object EdtTNCD: TEdit
      Left = 122
      Top = 21
      Width = 100
      Height = 21
      TabOrder = 4
    end
    object EdtNAME: TEdit
      Left = 122
      Top = 54
      Width = 100
      Height = 21
      TabOrder = 5
    end
  end
  inherited Panel2: TPanel
    inherited DBGrid1: TDBGrid
      DataSource = DataModule2.DataSrc_IH004
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNUPDT'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNUPTM'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNUPPG'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNUPWS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TNJTCD'
          Title.Caption = #29366#24907
          Visible = True
        end>
    end
  end
end
