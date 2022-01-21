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
  end
  object Panel2: TPanel
    Left = 0
    Top = 121
    Width = 615
    Height = 367
    Align = alClient
    TabOrder = 1
    object Button1: TButton
      Left = 15
      Top = 6
      Width = 75
      Height = 25
      Caption = #34892#36861#21152
      TabOrder = 0
    end
    object DBCtrlGrid1: TDBCtrlGrid
      Left = 15
      Top = 32
      Width = 600
      Height = 289
      PanelHeight = 96
      PanelWidth = 583
      TabOrder = 1
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
      object 数量: TLabel
        Left = 368
        Top = 5
        Width = 24
        Height = 13
        Caption = #25968#37327
      end
      object 金額: TLabel
        Left = 429
        Top = 5
        Width = 24
        Height = 13
        Caption = #37329#38989
      end
      object 削除: TLabel
        Left = 511
        Top = 5
        Width = 24
        Height = 13
        Caption = #21066#38500
      end
      object 備考: TLabel
        Left = 51
        Top = 48
        Width = 24
        Height = 13
        Caption = #20633#32771
      end
      object ChkDel1: TDBCheckBox
        Left = 511
        Top = 24
        Width = 24
        Height = 17
        TabOrder = 0
      end
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
      Caption = #26356#26032
      TabOrder = 0
    end
    object Button3: TButton
      Left = 120
      Top = 14
      Width = 75
      Height = 25
      Caption = #32066#20102
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object EdtMHNO: TDBEditUNIC
    Left = 90
    Top = 24
    Width = 121
    Height = 21
    DataField = 'MHNO'
    DataSource = DataModule4.DataSrcMTHFLP
    TabOrder = 3
  end
  object EdtMHIRDT: TDBEditUNIC
    Left = 90
    Top = 51
    Width = 121
    Height = 21
    DataField = 'MHIRDT'
    DataSource = DataModule4.DataSrcMTHFLP
    TabOrder = 4
  end
  object EdtMHKGDT: TDBEditUNIC
    Left = 90
    Top = 78
    Width = 121
    Height = 21
    DataField = 'MHKGDT'
    DataSource = DataModule4.DataSrcMTHFLP
    TabOrder = 5
  end
  object EdtMHTKCD: TDBEditUNIC
    Left = 336
    Top = 24
    Width = 55
    Height = 21
    DataField = 'MHTKCD'
    DataSource = DataModule4.DataSrcMTHFLP
    TabOrder = 6
  end
  object EdtMHTNCD: TDBEditUNIC
    Left = 336
    Top = 51
    Width = 55
    Height = 21
    DataField = 'MHTNCD'
    DataSource = DataModule4.DataSrcMTHFLP
    TabOrder = 7
  end
  object EdtMHBIKO: TDBEditUNIC
    Left = 336
    Top = 78
    Width = 241
    Height = 21
    DataField = 'MHBIKO'
    DataSource = DataModule4.DataSrcMTHFLP
    TabOrder = 8
  end
  object EdtMTGNO: TDBEditUNIC
    Left = 19
    Top = 177
    Width = 41
    Height = 21
    DataField = 'MTGNO'
    DataSource = DataModule4.DataSrcMTMFLP
    TabOrder = 9
  end
  object EdtMTSHCD: TDBEditUNIC
    Left = 66
    Top = 177
    Width = 55
    Height = 21
    DataField = 'MTSHCD'
    DataSource = DataModule4.DataSrcMTMFLP
    TabOrder = 10
  end
  object EdtMTSHNM: TDBEditUNIC
    Left = 127
    Top = 177
    Width = 180
    Height = 21
    DataField = 'MTSHNM'
    DataSource = DataModule4.DataSrcMTMFLP
    TabOrder = 11
  end
  object EdtMTTNKA: TDBEditUNIC
    Left = 322
    Top = 177
    Width = 55
    Height = 21
    DataField = 'MTTNKA'
    DataSource = DataModule4.DataSrcMTMFLP
    TabOrder = 12
  end
  object EdtMTSRYO: TDBEditUNIC
    Left = 383
    Top = 177
    Width = 55
    Height = 21
    DataField = 'MTSRYO'
    DataSource = DataModule4.DataSrcMTMFLP
    TabOrder = 13
  end
  object EdtMTKIN: TDBEditUNIC
    Left = 444
    Top = 177
    Width = 55
    Height = 21
    DataField = 'MTKIN'
    DataSource = DataModule4.DataSrcMTMFLP
    TabOrder = 14
  end
  object EdtMTBIKO: TDBEditUNIC
    Left = 66
    Top = 215
    Width = 241
    Height = 21
    DataField = 'MTBIKO'
    DataSource = DataModule4.DataSrcMTMFLP
    TabOrder = 15
  end
  object EdtMHTKNM: TDBEditUNIC
    Left = 397
    Top = 24
    Width = 180
    Height = 21
    DataField = 'MHTKNM'
    DataSource = DataModule4.DataSrcMTHFLP
    TabOrder = 16
  end
end
