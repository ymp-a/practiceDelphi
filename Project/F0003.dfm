object F0003Frm: TF0003Frm
  Left = 0
  Top = 0
  Caption = #35211#31309#20837#21147
  ClientHeight = 538
  ClientWidth = 615
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 615
    Height = 121
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 29
      Width = 37
      Height = 13
      Caption = #35211#31309#8470
    end
    object Label2: TLabel
      Left = 24
      Top = 54
      Width = 60
      Height = 13
      Caption = #35211#31309#20381#38972#26085
    end
    object Label3: TLabel
      Left = 24
      Top = 80
      Width = 48
      Height = 13
      Caption = #35211#31309#26399#38480
    end
    object Label4: TLabel
      Left = 256
      Top = 29
      Width = 50
      Height = 13
      Caption = #24471#24847#20808'CD'
    end
    object Label5: TLabel
      Left = 256
      Top = 54
      Width = 74
      Height = 13
      Caption = #35211#31309#25285#24403#32773'CD'
    end
    object Label6: TLabel
      Left = 256
      Top = 80
      Width = 48
      Height = 13
      Caption = #35211#31309#20633#32771
    end
    object Label15: TLabel
      Left = 397
      Top = 54
      Width = 37
      Height = 13
      Caption = 'Label15'
    end
    object EdtMode: TEdit
      Left = -1
      Top = -1
      Width = 73
      Height = 24
      TabStop = False
      Alignment = taCenter
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = #36861#21152
    end
    object EdtMHTNCD: TDBEditUNIC
      Left = 336
      Top = 51
      Width = 55
      Height = 21
      DataField = 'MHTNCD'
      DataSource = DataModule4.DataSrcMTHFLP
      TabOrder = 6
      OnExit = EdtMHTNCDExit
      OptLen = 6
    end
    object EdtMHTKNM: TDBEditUNIC
      Left = 397
      Top = 24
      Width = 180
      Height = 21
      DataField = 'MHTKNM'
      DataSource = DataModule4.DataSrcMTHFLP
      TabOrder = 5
      OptLen = 20
      OptFldType = O
    end
    object EdtMHTKCD: TDBEditUNIC
      Left = 336
      Top = 24
      Width = 55
      Height = 21
      DataField = 'MHTKCD'
      DataSource = DataModule4.DataSrcMTHFLP
      TabOrder = 4
      OptLen = 6
    end
    object EdtMHBIKO: TDBEditUNIC
      Left = 336
      Top = 78
      Width = 241
      Height = 21
      DataField = 'MHBIKO'
      DataSource = DataModule4.DataSrcMTHFLP
      TabOrder = 7
      OptLen = 20
      OptFldType = O
    end
    object EdtMHIRDT: TDBEditUNIC
      Left = 90
      Top = 51
      Width = 121
      Height = 21
      DataField = 'MHIRDT'
      DataSource = DataModule4.DataSrcMTHFLP
      TabOrder = 2
    end
    object EdtMHKGDT: TDBEditUNIC
      Left = 90
      Top = 78
      Width = 121
      Height = 21
      DataField = 'MHKGDT'
      DataSource = DataModule4.DataSrcMTHFLP
      TabOrder = 3
    end
    object EdtMHNO: TDBEditUNIC
      Left = 90
      Top = 24
      Width = 121
      Height = 21
      DataField = 'MHNO'
      DataSource = DataModule4.DataSrcMTHFLP
      TabOrder = 0
      OptLen = 6
      OptFldType = S
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 615
    Height = 367
    Align = alClient
    TabOrder = 1
    OnEnter = DBCtrlGrid1Enter
    OnExit = DBCtrlGrid1Exit
    object Label13: TLabel
      Left = 234
      Top = 342
      Width = 48
      Height = 13
      Caption = #21512#35336#25968#37327
    end
    object Label14: TLabel
      Left = 426
      Top = 342
      Width = 48
      Height = 13
      Caption = #21512#35336#37329#38989
    end
    object Button1: TButton
      Left = 15
      Top = 6
      Width = 75
      Height = 25
      Caption = #34892#36861#21152
      TabOrder = 3
      OnClick = Button1Click
    end
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 0
      Top = 37
      Width = 615
      Height = 289
      DataSource = DataModule4.DataSrcMTMFLP
      PanelHeight = 96
      PanelWidth = 598
      TabOrder = 0
      object Label7: TLabel
        Left = 51
        Top = 5
        Width = 24
        Height = 13
        Caption = #21830#21697
      end
      object Label8: TLabel
        Left = 307
        Top = 5
        Width = 24
        Height = 13
        Caption = #21336#20385
      end
      object Label9: TLabel
        Left = 368
        Top = 5
        Width = 24
        Height = 13
        Caption = #25968#37327
      end
      object Label10: TLabel
        Left = 429
        Top = 5
        Width = 24
        Height = 13
        Caption = #37329#38989
      end
      object Label11: TLabel
        Left = 511
        Top = 5
        Width = 24
        Height = 13
        Caption = #21066#38500
      end
      object Label12: TLabel
        Left = 51
        Top = 48
        Width = 24
        Height = 13
        Caption = #20633#32771
      end
      object EdtMTGNO: TDBText
        Left = 7
        Top = 24
        Width = 37
        Height = 17
        DataField = 'MTGNO'
        DataSource = DataModule4.DataSrcMTMFLP
      end
      object ChkDel1: TDBCheckBox
        Left = 511
        Top = 24
        Width = 24
        Height = 17
        DataField = 'dataJTCD'
        DataSource = DataModule4.DataSrcMTMFLP
        TabOrder = 5
      end
      object EdtMTSHCD: TDBEditUNIC
        Left = 50
        Top = 20
        Width = 55
        Height = 21
        DataField = 'MTSHCD'
        DataSource = DataModule4.DataSrcMTMFLP
        TabOrder = 0
        OptLen = 6
      end
      object EdtMTSHNM: TDBEditUNIC
        Left = 111
        Top = 20
        Width = 180
        Height = 21
        DataField = 'MTSHNM'
        DataSource = DataModule4.DataSrcMTMFLP
        TabOrder = 1
        OptLen = 20
        OptFldType = O
      end
      object EdtMTTNKA: TDBEditUNIC
        Left = 307
        Top = 20
        Width = 55
        Height = 21
        DataField = 'MTTNKA'
        DataSource = DataModule4.DataSrcMTMFLP
        TabOrder = 2
        OnExit = EdtMTTNKAExit
        Alignment = taRightJustify
        OptLen = 9
        OptFldType = S
        OptMinus = True
      end
      object EdtMTSRYO: TDBEditUNIC
        Left = 367
        Top = 20
        Width = 55
        Height = 21
        DataField = 'MTSRYO'
        DataSource = DataModule4.DataSrcMTMFLP
        TabOrder = 3
        OnExit = EdtMTSRYOExit
        Alignment = taRightJustify
        OptLen = 7
        OptFldType = S
      end
      object EdtMTKIN: TDBEditUNIC
        Left = 428
        Top = 20
        Width = 55
        Height = 21
        DataField = 'MTKIN'
        DataSource = DataModule4.DataSrcMTMFLP
        ReadOnly = True
        TabOrder = 4
        Alignment = taRightJustify
        OptLen = 9
        OptFldType = S
        OptMinus = True
      end
      object EdtMTBIKO: TDBEditUNIC
        Left = 51
        Top = 67
        Width = 241
        Height = 21
        DataField = 'MTBIKO'
        DataSource = DataModule4.DataSrcMTMFLP
        TabOrder = 6
        OptLen = 20
        OptFldType = O
      end
    end
    object EdtMHGKIN: TDBEditUNIC
      Left = 480
      Top = 338
      Width = 121
      Height = 21
      DataField = 'sumKIN'
      DataSource = DataModule4.DataSrcMTMFLP
      ReadOnly = True
      TabOrder = 2
      Alignment = taRightJustify
    end
    object EdtMHGSRO: TDBEditUNIC
      Left = 288
      Top = 340
      Width = 121
      Height = 21
      DataField = 'sumSRYO'
      DataSource = DataModule4.DataSrcMTMFLP
      ReadOnly = True
      TabOrder = 1
      Alignment = taRightJustify
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 488
    Width = 615
    Height = 50
    Align = alBottom
    TabOrder = 2
    object Button2: TButton
      Left = 15
      Top = 14
      Width = 75
      Height = 25
      Caption = #26356#26032'(F6)'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 120
      Top = 14
      Width = 75
      Height = 25
      Caption = #32066#20102'(F9)'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object ActionList1: TActionList
    Left = 578
    Top = 8
    object F9: TAction
      Caption = #32066#20102'(F9)'
      ShortCut = 120
      OnExecute = Button3Click
    end
    object F6: TAction
      Caption = #34920#31034'(F6)'
      ShortCut = 117
      OnExecute = Button2Click
    end
  end
end
