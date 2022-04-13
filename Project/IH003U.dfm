inherited IH003: TIH003
  Caption = 'IH003'
  ClientHeight = 291
  ClientWidth = 451
  ExplicitWidth = 467
  ExplicitHeight = 330
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxSCR: TScrollBox
    Width = 451
    Height = 291
    ExplicitWidth = 451
    ExplicitHeight = 291
    inherited PanelSCR: TPanel
      Width = 447
      Height = 287
      ExplicitWidth = 447
      ExplicitHeight = 287
      inherited Panel2: TPanel
        Top = 245
        Width = 445
        ExplicitTop = 245
        ExplicitWidth = 445
      end
      inherited Panel1: TPanel
        Width = 445
        Height = 211
        ExplicitWidth = 445
        ExplicitHeight = 211
        object Label1: TLabel
          Left = 32
          Top = 43
          Width = 56
          Height = 13
          Caption = #25285#24403#32773'CD'
        end
        object Label2: TLabel
          Left = 32
          Top = 70
          Width = 56
          Height = 13
          Caption = #25285#24403#32773#21517
        end
        object Label3: TLabel
          Left = 32
          Top = 97
          Width = 70
          Height = 13
          Caption = #12497#12473#12527#12540#12489
        end
        object Label4: TLabel
          Left = 32
          Top = 129
          Width = 28
          Height = 13
          Caption = #27177#38480
        end
        object Label5: TLabel
          Left = 32
          Top = 164
          Width = 28
          Height = 13
          Caption = #21066#38500
        end
        object EdtTNCD: TDBEditUNIC
          Left = 120
          Top = 40
          Width = 43
          Height = 21
          DataField = 'TNTNCD'
          DataSource = DataModule2.DataSrc_IH003
          TabOrder = 0
          OptLen = 4
        end
        object EdtNAME: TDBEditUNIC
          Left = 120
          Top = 67
          Width = 121
          Height = 21
          DataField = 'TNNAME'
          DataSource = DataModule2.DataSrc_IH003
          TabOrder = 1
          OptLen = 20
          OptFldType = O
        end
        object EdtPass: TEdit
          Left = 120
          Top = 94
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object CmbKGNM: TComboBox
          Left = 120
          Top = 121
          Width = 145
          Height = 21
          ImeMode = imDisable
          ItemIndex = 0
          TabOrder = 3
          Text = #19968#33324
          Items.Strings = (
            #19968#33324
            #26989#21209#31649#29702#32773
            #12471#12473#12486#12512#31649#29702#32773)
        end
        object chkSTKB: TCheckBox
          Left = 120
          Top = 160
          Width = 25
          Height = 17
          TabOrder = 4
        end
        object EdtKGKB: TDBEditUNIC
          Left = 271
          Top = 121
          Width = 121
          Height = 21
          DataField = 'TNKGKB'
          DataSource = DataModule2.DataSrc_IH003
          TabOrder = 5
          Visible = False
        end
      end
      inherited PageTopFrm1: TPageTopFrm
        Width = 445
        ExplicitWidth = 445
        inherited Panel2: TPanel
          Width = 445
          ExplicitWidth = 445
          inherited Panel1: TPanel
            Left = 161
            ExplicitLeft = 161
          end
        end
      end
    end
  end
end
