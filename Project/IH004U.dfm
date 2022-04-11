inherited IH004: TIH004
  Caption = 'IH004'
  ClientHeight = 462
  ClientWidth = 620
  ExplicitWidth = 636
  ExplicitHeight = 501
  PixelsPerInch = 96
  TextHeight = 13
  inherited Splitter1: TSplitter
    Width = 620
  end
  inherited Panel1: TPanel
    Width = 620
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
    inherited Button1: TBitBtn
      Left = 522
    end
    inherited Button10: TBitBtn
      Left = 522
    end
    inherited BtnCSV: TBitBtn
      Left = 522
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
    Width = 620
    Height = 257
    inherited DBGrid1: TDBGrid
      Width = 618
      Height = 255
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
  inherited Panel3: TPanel
    Top = 421
    Width = 620
  end
  inherited PageTopFrm1: TPageTopFrm
    Width = 620
    inherited Panel2: TPanel
      Width = 620
      inherited Panel1: TPanel
        Left = 336
      end
    end
  end
end
