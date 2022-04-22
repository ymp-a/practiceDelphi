inherited IH001: TIH001
  Caption = 'IH001'
  ClientHeight = 693
  ExplicitHeight = 732
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxSCR: TScrollBox
    Height = 693
    ExplicitHeight = 693
    inherited PanelSCR: TPanel
      Height = 689
      ExplicitHeight = 689
      inherited Panel2: TPanel
        Top = 647
        ExplicitTop = 647
      end
      inherited Panel1: TPanel
        Height = 119
        ExplicitHeight = 119
        object Label6: TLabel
          Left = 288
          Top = 79
          Width = 56
          Height = 13
          Caption = #35211#31309#20633#32771
        end
        object Label3: TLabel
          Left = 24
          Top = 80
          Width = 56
          Height = 13
          Caption = #35211#31309#26399#38480
        end
        object Label15: TLabel
          Left = 453
          Top = 53
          Width = 49
          Height = 13
          Caption = 'Label15'
        end
        object Label5: TLabel
          Left = 288
          Top = 53
          Width = 84
          Height = 13
          Caption = #35211#31309#25285#24403#32773'CD'
        end
        object Label2: TLabel
          Left = 24
          Top = 54
          Width = 70
          Height = 13
          Caption = #35211#31309#20381#38972#26085
        end
        object Label4: TLabel
          Left = 288
          Top = 28
          Width = 56
          Height = 13
          Caption = #24471#24847#20808'CD'
        end
        object Label1: TLabel
          Left = 24
          Top = 29
          Width = 42
          Height = 13
          Caption = #35211#31309#8470
        end
        object EdtMHBIKO: TDBEditUNIC
          Left = 392
          Top = 77
          Width = 241
          Height = 21
          DataField = 'MHBIKO'
          DataSource = DataModule4.DataSrc_IH001_MTH
          TabOrder = 6
          OptLen = 20
          OptFldType = O
        end
        object EdtMHKGDT: TDBEditUNIC
          Left = 122
          Top = 77
          Width = 80
          Height = 21
          DataField = 'MHKGDT'
          DataSource = DataModule4.DataSrc_IH001_MTH
          TabOrder = 2
          OnDblClick = EdtDateDblClick
        end
        object EdtMHTNCD: TDBEditUNIC
          Left = 392
          Top = 50
          Width = 55
          Height = 21
          DataField = 'MHTNCD'
          DataSource = DataModule4.DataSrc_IH001_MTH
          TabOrder = 5
          OnDblClick = EdtTNCDDblClick
          OnExit = EdtMHTNCDExit
          Alignment = taRightJustify
          OptLen = 6
        end
        object EdtMHIRDT: TDBEditUNIC
          Left = 122
          Top = 50
          Width = 80
          Height = 21
          DataField = 'MHIRDT'
          DataSource = DataModule4.DataSrc_IH001_MTH
          TabOrder = 1
          OnDblClick = EdtDateDblClick
        end
        object EdtMHTKNM: TDBEditUNIC
          Left = 453
          Top = 23
          Width = 180
          Height = 21
          DataField = 'MHTKNM'
          DataSource = DataModule4.DataSrc_IH001_MTH
          TabOrder = 4
          OptLen = 20
          OptFldType = O
        end
        object EdtMHTKCD: TDBEditUNIC
          Left = 392
          Top = 23
          Width = 55
          Height = 21
          DataField = 'MHTKCD'
          DataSource = DataModule4.DataSrc_IH001_MTH
          TabOrder = 3
          OptLen = 6
        end
        object EdtMHNO: TDBEditUNIC
          Left = 122
          Top = 23
          Width = 80
          Height = 21
          DataField = 'MHNO'
          DataSource = DataModule4.DataSrc_IH001_MTH
          TabOrder = 0
          Alignment = taRightJustify
          OptLen = 6
          OptFldType = S
        end
      end
      inherited Panel4: TPanel
        Top = 153
        ExplicitTop = 153
        object Label14: TLabel
          Left = 662
          Top = 24
          Width = 56
          Height = 13
          Caption = #21512#35336#37329#38989
        end
        object Label13: TLabel
          Left = 442
          Top = 24
          Width = 56
          Height = 13
          Caption = #21512#35336#25968#37327
        end
        object EdtMHGKIN: TDBEditUNIC
          Left = 732
          Top = 20
          Width = 121
          Height = 21
          TabStop = False
          DataField = 'sumKIN'
          DataSource = DataModule4.DataSrc_IH001_MTM
          ReadOnly = True
          TabOrder = 0
          Alignment = taRightJustify
        end
        object EdtMHGSRO: TDBEditUNIC
          Left = 512
          Top = 20
          Width = 121
          Height = 21
          TabStop = False
          DataField = 'sumSRYO'
          DataSource = DataModule4.DataSrc_IH001_MTM
          ReadOnly = True
          TabOrder = 1
          Alignment = taRightJustify
        end
      end
      inherited Panel3: TPanel
        Top = 204
        Height = 443
        ExplicitTop = 204
        ExplicitHeight = 443
        inherited DBCtrlGrid1: TDBCtrlGrid
          Left = 14
          Top = 37
          Height = 360
          DataSource = DataModule4.DataSrc_IH001_MTM
          PanelHeight = 120
          RowCount = 3
          OnEnter = DBCtrlGrid1Enter
          OnExit = DBCtrlGrid1Exit
          ExplicitLeft = 14
          ExplicitTop = 37
          ExplicitHeight = 360
          object EdtMTGNO: TDBText
            Left = 15
            Top = 40
            Width = 37
            Height = 17
            DataField = 'MTGNO'
            DataSource = DataModule4.DataSrc_IH001_MTM
          end
          object Label12: TLabel
            Left = 59
            Top = 64
            Width = 28
            Height = 13
            Caption = #20633#32771
          end
          object Label11: TLabel
            Left = 519
            Top = 21
            Width = 28
            Height = 13
            Caption = #21066#38500
          end
          object Label10: TLabel
            Left = 436
            Top = 21
            Width = 28
            Height = 13
            Caption = #37329#38989
          end
          object Label9: TLabel
            Left = 376
            Top = 21
            Width = 28
            Height = 13
            Caption = #25968#37327
          end
          object Label8: TLabel
            Left = 315
            Top = 21
            Width = 28
            Height = 13
            Caption = #21336#20385
          end
          object Label7: TLabel
            Left = 59
            Top = 21
            Width = 84
            Height = 13
            Caption = #21830#21697'CD'#12461#12540#20516
          end
          object EdtMTNO: TDBText
            Left = 620
            Top = 40
            Width = 37
            Height = 17
            DataField = 'MTNO'
            DataSource = DataModule4.DataSrc_IH001_MTM
          end
          object Label16: TLabel
            Left = 11
            Top = 21
            Width = 42
            Height = 13
            Caption = #34892#30058#21495
          end
          object Label17: TLabel
            Left = 620
            Top = 21
            Width = 70
            Height = 13
            Caption = 'MTNO'#12461#12540#20516
          end
          object Label18: TLabel
            Left = 376
            Top = 64
            Width = 56
            Height = 13
            Caption = #38500#22806#25968#37327
          end
          object Label19: TLabel
            Left = 439
            Top = 64
            Width = 56
            Height = 13
            Caption = #38500#22806#37329#38989
          end
          object EdtMTTNKA: TDBEditUNIC
            Left = 315
            Top = 36
            Width = 55
            Height = 21
            DataField = 'MTTNKA'
            DataSource = DataModule4.DataSrc_IH001_MTM
            TabOrder = 2
            OnExit = EdtMTTNKAExit
            Alignment = taRightJustify
            OptLen = 9
            OptFldType = S
            OptMinus = True
          end
          object EdtMTBIKO: TDBEditUNIC
            Left = 59
            Top = 83
            Width = 241
            Height = 21
            DataField = 'MTBIKO'
            DataSource = DataModule4.DataSrc_IH001_MTM
            TabOrder = 6
            OptLen = 20
            OptFldType = O
          end
          object EdtMTKIN: TDBEditUNIC
            Left = 436
            Top = 36
            Width = 55
            Height = 21
            TabStop = False
            DataField = 'MTKIN'
            DataSource = DataModule4.DataSrc_IH001_MTM
            ReadOnly = True
            TabOrder = 4
            Alignment = taRightJustify
            OptLen = 9
            OptFldType = S
            OptMinus = True
          end
          object EdtMTSRYO: TDBEditUNIC
            Left = 375
            Top = 36
            Width = 55
            Height = 21
            DataField = 'MTSRYO'
            DataSource = DataModule4.DataSrc_IH001_MTM
            TabOrder = 3
            OnExit = EdtMTSRYOExit
            Alignment = taRightJustify
            OptLen = 7
            OptFldType = S
          end
          object EdtMTSHNM: TDBEditUNIC
            Left = 119
            Top = 36
            Width = 180
            Height = 21
            DataField = 'MTSHNM'
            DataSource = DataModule4.DataSrc_IH001_MTM
            TabOrder = 1
            OptLen = 20
            OptFldType = O
          end
          object EdtMTSHCD: TDBEditUNIC
            Left = 58
            Top = 36
            Width = 55
            Height = 21
            DataField = 'MTSHCD'
            DataSource = DataModule4.DataSrc_IH001_MTM
            TabOrder = 0
            OptLen = 6
          end
          object ChkDel1: TDBCheckBox
            Left = 519
            Top = 40
            Width = 24
            Height = 17
            TabStop = False
            DataField = 'dataJTCD'
            DataSource = DataModule4.DataSrc_IH001_MTM
            TabOrder = 5
          end
          object mSRYO: TDBEditUNIC
            Left = 376
            Top = 83
            Width = 55
            Height = 21
            TabStop = False
            DataField = 'mSRYO'
            DataSource = DataModule4.DataSrc_IH001_MTM
            TabOrder = 7
            OnExit = EdtMTSRYOExit
            Alignment = taRightJustify
            OptLen = 7
            OptFldType = S
          end
          object mKIN: TDBEditUNIC
            Left = 437
            Top = 84
            Width = 55
            Height = 21
            TabStop = False
            DataField = 'mKIN'
            DataSource = DataModule4.DataSrc_IH001_MTM
            ReadOnly = True
            TabOrder = 8
            Alignment = taRightJustify
            OptLen = 9
            OptFldType = S
            OptMinus = True
          end
        end
        object Button3: TButton
          Left = 14
          Top = 6
          Width = 75
          Height = 25
          Caption = #34892#36861#21152
          TabOrder = 1
          OnClick = Button3Click
        end
      end
    end
  end
end
