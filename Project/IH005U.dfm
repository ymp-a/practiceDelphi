inherited IH005: TIH005
  Caption = 'IH005'
  PixelsPerInch = 96
  TextHeight = 13
  inherited ScrollBoxSCR: TScrollBox
    inherited PanelSCR: TPanel
      inherited Panel2: TPanel
        inherited BtnPrv: TBitBtn
          OnClick = BtnPrvClick
        end
      end
      inherited Panel1: TPanel
        object Label3: TLabel
          Left = 19
          Top = 165
          Width = 42
          Height = 13
          Margins.Left = 2
          Margins.Top = 2
          Margins.Right = 2
          Margins.Bottom = 2
          Caption = #24471#24847#20808
        end
        object Label2: TLabel
          Left = 181
          Top = 42
          Width = 14
          Height = 13
          Caption = #65374
        end
        object Label1: TLabel
          Left = 19
          Top = 42
          Width = 42
          Height = 13
          Caption = #21462#24341#26085
        end
        object Label4: TLabel
          Left = 19
          Top = 248
          Width = 42
          Height = 13
          Caption = #35211#31309#8470
        end
        object EdtTKRS: TEdit
          Left = 153
          Top = 162
          Width = 323
          Height = 21
          TabStop = False
          Color = clBtnFace
          ReadOnly = True
          TabOrder = 0
        end
        object EdtTKCD: TEdit
          Left = 92
          Top = 162
          Width = 51
          Height = 21
          ImeMode = imClose
          MaxLength = 6
          TabOrder = 1
        end
        object RdGDTKB: TRadioGroup
          Left = 90
          Top = 82
          Width = 176
          Height = 41
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            #20837#21147#26085
            #20381#38972#26085)
          TabOrder = 2
        end
        object CkbDLDP: TCheckBox
          Left = 411
          Top = 41
          Width = 109
          Height = 17
          Caption = #21066#38500#12418#34920#31034
          TabOrder = 3
        end
        object CkbNotPrt: TCheckBox
          Left = 312
          Top = 41
          Width = 93
          Height = 17
          Caption = #26410#20986#21147#12398#12415
          TabOrder = 4
        end
        object EdtTRDTTO: TMaskEditDate
          Left = 199
          Top = 39
          Width = 84
          Height = 21
          EditMask = '9999/99/99;0;'
          ImeMode = imClose
          MaxLength = 10
          TabOrder = 5
          Text = ''
          EndOfMonth = False
        end
        object EdtTRDTFR: TMaskEditDate
          Left = 92
          Top = 39
          Width = 86
          Height = 21
          EditMask = '9999/99/99;0;'
          ImeMode = imClose
          MaxLength = 10
          TabOrder = 6
          Text = ''
          EndOfMonth = False
        end
        object EdtMHNO: TNumberEdit
          Left = 121
          Top = 245
          Width = 80
          Height = 21
          ImeMode = imDisable
          NumbersOnly = True
          TabOrder = 7
          Text = '0'
          Comma = False
          Yen = False
          Dec = 0
          Leng = 8
        end
      end
    end
  end
  object frxReport0: TfrxReport
    Version = '5.6.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #27161#28310
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44715.473979131900000000
    ReportOptions.LastChange = 44715.473979131900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'var'
      'PageLine: integer;//'#29694#22312#12398#12506#12540#12472#12391#34892#25968#12434#20986#21147#12375#12414#12377
      'PageMaxRow: integer =3;//'#12506#12540#12472#12354#12383#12426#12398#21015#25968#12434#35373#23450
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PageLine := <line> mod PageMaxRow; //'#12371#12398#12467#12540#12489#12399#22266#23450#25968#12398#34892#12395#24517#35201#12391#12377
      '  if (PageLine = 1) and (<line> > 1) then'
      '    Engine.newpage;    '
      '  Memo13.text:=inttostr(PageLine);'
      '  child2.visible := False;'
      'end;'
      ''
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  i: integer;'
      'begin'
      ' i := IIF(PageLine = 0, PageMaxRow, PageLine);'
      ' child2.visible := True;'
      ' while i < PageMaxRow do'
      '  begin'
      '    i := i + 1;'
      '    Memo14.text:=inttostr(i);'
      '    Engine.ShowBand(Child2);//'#31354#30333#12398#12501#12457#12540#12512#12434#21360#21047#12377#12427
      '  end;'
      '   child2.visible := False;'
      'end;  '
      ''
      'procedure MasterData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      'if <Line#> Mod 3 = 0 Then'
      '  Engine.NewPage; //'#25913#12506#12540#12472'          '
      'end;  '
      '  '
      'begin'
      ''
      'end.')
    Left = 272
    Top = 320
    Datasets = <
      item
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page2: TfrxReportPage
      PaperWidth = 250.000000000000000000
      PaperHeight = 354.000000000000000000
      PaperSize = 12
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        Height = 294.803340000000000000
        Top = 18.897650000000000000
        Width = 869.291900000000000000
        Child = frxReport0.Child1
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        RowCount = 0
        object Subreport1: TfrxSubreport
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport0.Page3
        end
        object Subreport2: TfrxSubreport
          Top = 211.653680000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Page = frxReport0.Page3
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 336.378170000000000000
        Width = 869.291900000000000000
      end
    end
    object Page3: TfrxReportPage
      PaperWidth = 250.000000000000000000
      PaperHeight = 354.000000000000000000
      PaperSize = 12
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData3: TfrxMasterData
        FillType = ftBrush
        Top = 83.149660000000000000
        Width = 869.291900000000000000
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        RowCount = 0
        Stretched = True
      end
      object GroupHeader2: TfrxGroupHeader
        FillType = ftBrush
        Height = 49.133890000000000000
        Top = 105.826840000000000000
        Width = 869.291900000000000000
        Condition = 'frxDBDatasetIH005."MTNO"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo9: TfrxMemoView
          Left = 151.181200000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHNO"]')
        end
        object Memo10: TfrxMemoView
          Left = 234.330860000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
        end
        object Memo11: TfrxMemoView
          Left = 377.953000000000000000
          Top = 22.677180000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MHTKNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHTKNM"]')
        end
        object Memo12: TfrxMemoView
          Width = 107.201214550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304'G'#12504#12483#12480#12540#37096#20998#12305)
        end
        object Memo13: TfrxMemoView
          Top = 22.677180000000000000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
        end
        object Memo14: TfrxMemoView
          Left = 151.181200000000000000
          Top = 22.677180000000000000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
        end
      end
      object Child2: TfrxChild
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 230.551330000000000000
        Width = 869.291900000000000000
        object Memo15: TfrxMemoView
          Left = 75.590600000000000000
          Top = 3.779530000000000000
          Width = 194.130404550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304#23376#12496#12531#12489#37096#20998#12305)
        end
      end
      object PageHeader2: TfrxPageHeader
        FillType = ftBrush
        Height = 2.405155450000000000
        Top = 18.897650000000000000
        Width = 869.291900000000000000
      end
      object GroupFooter2: TfrxGroupFooter
        FillType = ftBrush
        Top = 275.905690000000000000
        Width = 869.291900000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        Child = frxReport0.Child2
      end
      object DetailData2: TfrxDetailData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 177.637910000000000000
        Width = 869.291900000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        Child = frxReport0.Child2
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        RowCount = 0
        object Memo16: TfrxMemoView
          Left = 264.567100000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MTSHNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTSHNM"]')
        end
        object Memo17: TfrxMemoView
          Left = 710.551640000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTSRYO'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTSRYO"]')
        end
        object Memo18: TfrxMemoView
          Top = 3.779530000000000000
          Width = 194.130404550000000000
          Height = 16.492494550000000000
          StretchMode = smMaxHeight
          Memo.UTF8W = (
            #12304#26126#32048#37096#20998#12305)
        end
      end
    end
  end
  object frxReport1: TfrxReport
    Version = '5.6.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #27161#28310
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44715.473979131900000000
    ReportOptions.LastChange = 44718.495569143500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      '  '
      '  '
      'begin'
      ''
      'end.')
    Left = 256
    Top = 256
    Datasets = <
      item
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
      end
      item
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 250.000000000000000000
      PaperHeight = 354.000000000000000000
      PaperSize = 12
      LeftMargin = 7.000000000000000000
      RightMargin = 7.000000000000000000
      TopMargin = 7.000000000000000000
      BottomMargin = 7.000000000000000000
      Frame.Width = 0.100000000000000000
      LargeDesignHeight = True
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 41.574830000000000000
        Width = 891.969080000000000000
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        RowCount = 0
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 39.685039370000000000
        ParentFont = False
        Top = 211.653680000000000000
        Width = 891.969080000000000000
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005MS."NewMTNO">=<frxDBDatasetIH005."NewMTNO">'
        RowCount = 3
        object frxDBDatasetIH005MSMTSHNM: TfrxMemoView
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MTSHNM'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSHNM"]')
        end
        object frxDBDatasetIH005MSMTKIN: TfrxMemoView
          Left = 491.338900000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTKIN'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTKIN"]')
        end
        object frxDBDatasetIH005MSMTTNKA: TfrxMemoView
          Left = 400.630180000000000000
          Top = 15.118120000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataField = 'MTTNKA'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTTNKA"]')
        end
        object frxDBDatasetIH005MSMTSRYO: TfrxMemoView
          Left = 317.480520000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTSRYO'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSRYO"]')
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Top = 18.897650000000000000
        Width = 891.969080000000000000
        Condition = 'frxDBDatasetIH005."NewMTNO"'
        StartNewPage = True
      end
      object DetailData2: TfrxDetailData
        FillType = ftBrush
        Height = 60.094488188976400000
        Top = 517.795610000000000000
        Width = 891.969080000000000000
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005MS."NewMTNO">=<frxDBDatasetIH005."NewMTNO">'
        RowCount = 0
        object Memo1: TfrxMemoView
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MTSHNM'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSHNM"]')
        end
        object Memo7: TfrxMemoView
          Top = 37.795300000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #25688#35201#37096#20998)
        end
        object frxDBDatasetIH005MSMTSRYO1: TfrxMemoView
          Left = 480.000310000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTSRYO'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSRYO"]')
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 124.724409448819000000
        Top = 64.252010000000000000
        Width = 891.969080000000000000
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 58.582677165354300000
        Top = 275.905690000000000000
        Width = 891.969080000000000000
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 136.818897637795000000
        Top = 359.055350000000000000
        Width = 891.969080000000000000
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Height = 15.118110236220500000
        Top = 600.945270000000000000
        Width = 891.969080000000000000
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Height = 143.622047244094000000
        Top = 638.740570000000000000
        Width = 891.969080000000000000
      end
      object DetailData3: TfrxDetailData
        FillType = ftBrush
        Height = 39.685039370078700000
        Top = 805.039890000000000000
        Width = 891.969080000000000000
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005."NewMTNO">=<frxDBDatasetIH005MS."NewMTNO">'
        RowCount = 0
        object Memo11: TfrxMemoView
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MTSHNM'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSHNM"]')
        end
        object Memo12: TfrxMemoView
          Left = 400.630180000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHGSRO'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MHGSRO"]')
        end
        object Memo13: TfrxMemoView
          Left = 491.338900000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTKIN'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTKIN"]')
        end
      end
      object Footer3: TfrxFooter
        FillType = ftBrush
        Height = 75.590551181102400000
        Top = 869.291900000000000000
        Width = 891.969080000000000000
      end
      object Header4: TfrxHeader
        FillType = ftBrush
        Height = 139.842519685039000000
        Top = 967.559680000000000000
        Width = 891.969080000000000000
      end
      object DetailData4: TfrxDetailData
        FillType = ftBrush
        Height = 39.685039370078700000
        Top = 1130.079470000000000000
        Width = 891.969080000000000000
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005."NewMTNO">=<frxDBDatasetIH005MS."NewMTNO">'
        RowCount = 0
        object Memo21: TfrxMemoView
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MTSHNM'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSHNM"]')
        end
        object frxDBDatasetIH005MSMTSRYO2: TfrxMemoView
          Left = 453.543600000000000000
          Top = 15.118120000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTSRYO'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSRYO"]')
        end
      end
      object Footer4: TfrxFooter
        FillType = ftBrush
        Height = 103.937007874016000000
        Top = 1194.331480000000000000
        Width = 891.969080000000000000
      end
      object Overlay1: TfrxOverlay
        FillType = ftBrush
        Height = 1322.834645670000000000
        Top = 1322.835500000000000000
        Width = 891.969080000000000000
        object Memo16: TfrxMemoView
          Left = 445.984540000000000000
          Top = 86.929202200000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
        end
        object Memo17: TfrxMemoView
          Top = 60.472492200000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MHTKNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHTKNM"]')
        end
        object Memo2: TfrxMemoView
          Left = 585.827150000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #30331#37682#30058#21495#65306'ABC1234567890123')
        end
        object Memo3: TfrxMemoView
          Left = 593.386210000000000000
          Top = 258.897828180000000000
          Width = 162.519790000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            #21512#35336#25968#37327'[frxDBDatasetIH005MS."MHGSRO"]')
        end
        object Memo22: TfrxMemoView
          Top = 253.228522200000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #23550#35937#35336)
        end
        object Memo23: TfrxMemoView
          Left = 759.685530000000000000
          Top = 258.897828180000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            #21512#35336'[frxDBDatasetIH005MS."MHGKIN"]')
        end
        object Memo26: TfrxMemoView
          Top = 281.575008180000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #12300#8251#12301#12399#36605#28187#31246#29575#23550#35937#12391#12354#12427#12371#12392#12434#31034#12375#12390#12356#12414#12377#12290)
        end
        object Memo27: TfrxMemoView
          Left = 340.157700000000000000
          Top = 258.897828180000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            'NewMTNO[frxDBDatasetIH005MS."NewMTNO"]')
        end
        object Line1: TfrxLineView
          Left = 18.897637800000000000
          Top = 302.362216920000000000
          Width = 831.496062990000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Left = 402.519680160000000000
          Top = 0.000012200000000018
          Width = 137.952755910000000000
          Height = 34.015770000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #32013#21697#26360#65288#25511#65289)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 406.299210160000000000
          Top = 347.716772200000000000
          Width = 137.952755910000000000
          Height = 26.456692910000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20986#24235#20253#31080)
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 18.897650000000000000
          Top = 638.740169680315000000
          Width = 831.496062990000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo28: TfrxMemoView
          Left = 410.078740160000000000
          Top = 653.858702200000000000
          Width = 137.952755910000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #32013#21697#26360)
          ParentFont = False
        end
        object Line3: TfrxLineView
          Left = 18.897650000000000000
          Top = 960.000012200000000000
          Width = 831.496062990000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          Left = 410.078740160000000000
          Top = 978.898282200000000000
          Width = 137.952755910000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21463#38936#26360)
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          Left = 616.063390000000000000
          Top = 653.858702200000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #30331#37682#30058#21495#65306'ABC1234567890123')
        end
        object Memo5: TfrxMemoView
          Left = 445.984540000000000000
          Top = 400.630192200000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
        end
        object Memo6: TfrxMemoView
          Top = 374.173482200000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MHTKNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHTKNM"]')
        end
        object Memo9: TfrxMemoView
          Left = 445.984540000000000000
          Top = 702.992592200000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
        end
        object Memo10: TfrxMemoView
          Top = 676.535882200000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MHTKNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHTKNM"]')
        end
        object Memo14: TfrxMemoView
          Top = 899.528152200000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #23550#35937#35336)
        end
        object Memo18: TfrxMemoView
          Top = 927.874638180000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #12300#8251#12301#12399#36605#28187#31246#29575#23550#35937#12391#12354#12427#12371#12392#12434#31034#12375#12390#12356#12414#12377#12290)
        end
        object Memo15: TfrxMemoView
          Left = 483.779840000000000000
          Top = 929.764392200000000000
          Width = 268.346630000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            #21512#35336#25968#37327'[frxDBDatasetIH005MS."MHGSRO"]')
        end
        object Memo25: TfrxMemoView
          Left = 755.906000000000000000
          Top = 929.764392200000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Memo.UTF8W = (
            #21512#35336'[frxDBDatasetIH005MS."MHGKIN"]')
        end
        object Memo24: TfrxMemoView
          Top = 1209.449612200000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #23626#12369#20808#20303#25152)
        end
        object Memo31: TfrxMemoView
          Left = 445.984540000000000000
          Top = 1024.252642200000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
        end
        object Memo32: TfrxMemoView
          Top = 997.795932200000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MHTKNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHTKNM"]')
        end
        object Shape1: TfrxShapeView
          Left = 400.630180000000000000
          Top = 0.000012200000000018
          Width = 136.063080000000000000
          Height = 34.015770000000000000
        end
      end
      object Memo19: TfrxMemoView
        Left = 445.984540000000000000
        Top = 3352.443110000000000000
        Width = 79.370130000000000000
        Height = 18.897650000000000000
        DataField = 'MHIRDT'
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        Memo.UTF8W = (
          '[frxDBDatasetIH005."MHIRDT"]')
      end
      object Memo20: TfrxMemoView
        Top = 3325.986400000000000000
        Width = 400.630180000000000000
        Height = 18.897650000000000000
        DataField = 'MHTKNM'
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        Memo.UTF8W = (
          '[frxDBDatasetIH005."MHTKNM"]')
      end
    end
  end
  object frxReport2: TfrxReport
    Version = '5.6.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #27161#28310
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44715.473979131900000000
    ReportOptions.LastChange = 44718.497263518520000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'var'
      'PageLine: integer;//'#29694#22312#12398#12506#12540#12472#12391#34892#25968#12434#20986#21147#12375#12414#12377
      'PageMaxRow: integer =3;//'#12506#12540#12472#12354#12383#12426#12398#21015#25968#12434#35373#23450
      ''
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '  PageLine := <line> mod PageMaxRow; //'#12371#12398#12467#12540#12489#12399#22266#23450#25968#12398#34892#12395#24517#35201#12391#12377
      '  if (PageLine = 1) and (<line> > 1) then'
      '    Engine.newpage;    '
      '  Memo5.text:=inttostr(PageLine);'
      '  child1.visible := False;'
      'end;'
      ''
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  i: integer;'
      'begin'
      ' i := IIF(PageLine = 0, PageMaxRow, PageLine);'
      ' child1.visible := True;'
      ' while i < PageMaxRow do'
      '  begin'
      '    i := i + 1;'
      '    Memo8.text:=inttostr(i);'
      '    Engine.ShowBand(Child1);//'#31354#30333#12398#12501#12457#12540#12512#12434#21360#21047#12377#12427
      '  end;'
      '   child1.visible := False;'
      'end;  '
      ''
      'procedure MasterData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      'if <Line#> Mod 3 = 0 Then'
      '  Engine.NewPage; //'#25913#12506#12540#12472'          '
      'end;  '
      '  '
      'begin'
      ''
      'end.')
    Left = 336
    Top = 256
    Datasets = <
      item
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 250.000000000000000000
      PaperHeight = 354.000000000000000000
      PaperSize = 12
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 83.149660000000000000
        Width = 869.291900000000000000
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        RowCount = 0
        Stretched = True
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 396.850650000000000000
        Top = 105.826840000000000000
        Width = 869.291900000000000000
        Condition = 'frxDBDatasetIH005."MTNO"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Left = 151.181200000000000000
          Top = 347.716760000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHNO"]')
        end
        object Memo3: TfrxMemoView
          Left = 234.330860000000000000
          Top = 347.716760000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
        end
        object Memo4: TfrxMemoView
          Left = 377.953000000000000000
          Top = 370.393940000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MHTKNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHTKNM"]')
        end
        object Memo7: TfrxMemoView
          Top = 347.716760000000000000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304'G'#12504#12483#12480#12540#37096#20998#12305)
        end
        object Memo5: TfrxMemoView
          Top = 370.393940000000000000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
        end
        object Memo8: TfrxMemoView
          Left = 151.181200000000000000
          Top = 370.393940000000000000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 600.945270000000000000
        Width = 869.291900000000000000
        object Memo2: TfrxMemoView
          Left = 75.590600000000000000
          Top = 3.779530000000000000
          Width = 194.130404550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304#23376#12496#12531#12489#37096#20998#12305)
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 2.405155450000000000
        Top = 18.897650000000000000
        Width = 869.291900000000000000
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Top = 578.268090000000000000
        Width = 869.291900000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 525.354670000000000000
        Width = 869.291900000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        RowCount = 0
        object frxDBDatasetIH005MTSHNM: TfrxMemoView
          Left = 264.567100000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MTSHNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTSHNM"]')
        end
        object frxDBDatasetIH005MTSRYO: TfrxMemoView
          Left = 710.551640000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTSRYO'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTSRYO"]')
        end
        object Memo6: TfrxMemoView
          Top = 3.779530000000000000
          Width = 194.130404550000000000
          Height = 16.492494550000000000
          StretchMode = smMaxHeight
          Memo.UTF8W = (
            #12304#26126#32048#37096#20998#12305)
        end
      end
    end
  end
  object frxReport3: TfrxReport
    Version = '5.6.9'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #27161#28310
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44715.473979131900000000
    ReportOptions.LastChange = 44718.495569143500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'var'
      'PageLine: integer;//'#29694#22312#12398#12506#12540#12472#12391#34892#25968#12434#20986#21147#12375#12414#12377
      'PageMaxRow: integer =3;//'#12506#12540#12472#12354#12383#12426#12398#21015#25968#12434#35373#23450'          '
      '  '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin    '
      '  PageLine := <line> mod PageMaxRow; //'#12371#12398#12467#12540#12489#12399#22266#23450#25968#12398#34892#12395#24517#35201#12391#12377
      '    '
      '  if (PageLine = 1) and (<line> > 1) then'
      '    Engine.newpage;'
      '      '
      '  Memo5.text:=inttostr(PageLine);          '
      '  child1.visible := False;'
      '  '
      'end;'
      ''
      '      '
      'procedure MasterData1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  Memo5.text:=inttostr(PageLine);'
      '           '
      '  if <Line#> Mod 3 = 0 Then'
      '    Engine.NewPage; //'#25913#12506#12540#12472'            '
      'end;  '
      ''
      '   '
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  i: integer;'
      'begin'
      ' i := IIF(PageLine = 0, PageMaxRow, PageLine);                '
      ' child1.visible := True;     '
      ' while i < PageMaxRow do'
      '  begin'
      '    i := i + 1;'
      '    Memo8.text:=inttostr(i);'
      '    Engine.ShowBand(Child1);//'#31354#30333#12398#12501#12457#12540#12512#12434#21360#21047#12377#12427
      ''
      '    if (i = 2) then                     '
      '      Memo13.Text:='#39'Memo13'#31354#30333#25407#20837#39';    '
      '    if (i = 3) then'
      
        '      Memo14.Text:='#39'Memo14'#31354#30333#25407#20837#39';                                ' +
        '       '
      '  end;'
      '   child1.visible := False;//'#21021#26399#21270
      '                       '
      'end;  '
      ''
      ''
      ''
      'procedure Overlay1OnAfterPrint(Sender: TfrxComponent);'
      'begin'
      '  PageLine:=PageLine          '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 408
    Top = 256
    Datasets = <
      item
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 250.000000000000000000
      PaperHeight = 354.000000000000000000
      PaperSize = 12
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 83.149660000000000000
        Width = 869.291900000000000000
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        RowCount = 0
        Stretched = True
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 71.811070000000000000
        Top = 105.826840000000000000
        Width = 869.291900000000000000
        Condition = 'frxDBDatasetIH005."MHIRDT"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Left = 359.055350000000000000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #8217#35211#31309#8470' '#8217'[frxDBDatasetIH005."MHNO"]')
        end
        object Memo3: TfrxMemoView
          Left = 275.905690000000000000
          Top = 22.677180000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
        end
        object Memo4: TfrxMemoView
          Left = 457.323130000000000000
          Top = 22.677180000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MHTKNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHTKNM"]')
        end
        object Memo7: TfrxMemoView
          Top = 22.677180000000000000
          Width = 92.083094550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304'G'#12504#12483#12480#12540#37096#20998#12305)
        end
        object Memo5: TfrxMemoView
          Top = 45.354360000000000000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
        end
        object Memo8: TfrxMemoView
          Left = 151.181200000000000000
          Top = 45.354360000000000000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
        end
        object Memo16: TfrxMemoView
          Left = 94.488250000000000000
          Top = 22.677180000000000000
          Width = 39.169674550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[Line]')
        end
        object Memo21: TfrxMemoView
          Left = 136.063080000000000000
          Top = 22.677180000000000000
          Width = 39.169674550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[Line#]')
        end
        object Memo23: TfrxMemoView
          Left = 94.488250000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            ' Line')
        end
        object Memo24: TfrxMemoView
          Left = 139.842610000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            ' Line#')
        end
        object Memo33: TfrxMemoView
          Left = 177.637910000000000000
          Width = 65.626384550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            ' PageLine')
        end
        object Memo42: TfrxMemoView
          Left = 245.669450000000000000
          Width = 58.067324550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            ' MTGNO')
        end
        object Memo43: TfrxMemoView
          Left = 177.637910000000000000
          Top = 22.677180000000000000
          Width = 69.405914550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[PageLine]')
        end
      end
      object Child1: TfrxChild
        FillType = ftBrush
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 22.677180000000000000
        ParentFont = False
        Top = 268.346630000000000000
        Width = 869.291900000000000000
        object Memo2: TfrxMemoView
          Left = 75.590600000000000000
          Top = 3.779530000000000000
          Width = 152.555574550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304#23376#12496#12531#12489#65297#12305)
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 2.405155450000000000
        Top = 18.897650000000000000
        Width = 869.291900000000000000
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Top = 245.669450000000000000
        Width = 869.291900000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        Child = frxReport3.Child1
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 200.315090000000000000
        Width = 869.291900000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        RowCount = 0
        object frxDBDatasetIH005MTSHNM: TfrxMemoView
          Left = 328.819110000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTSHNM"]')
        end
        object frxDBDatasetIH005MTSRYO: TfrxMemoView
          Left = 733.228820000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTSRYO'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTSRYO"]')
        end
        object Memo6: TfrxMemoView
          Top = 3.779530000000000000
          Width = 69.405914550000000000
          Height = 16.492494550000000000
          StretchMode = smMaxHeight
          Memo.UTF8W = (
            #12304#26126#32048#37096#20998#12305)
        end
        object Memo17: TfrxMemoView
          Left = 94.488250000000000000
          Top = 3.779530000000000000
          Width = 39.169674550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[Line]')
        end
        object Memo22: TfrxMemoView
          Left = 136.063080000000000000
          Top = 3.779530000000000000
          Width = 39.169674550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[Line#]')
        end
        object Memo32: TfrxMemoView
          Left = 177.637910000000000000
          Top = 3.779530000000000000
          Width = 69.405914550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[PageLine]')
        end
        object Memo41: TfrxMemoView
          Left = 249.448980000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            'GNO[<frxDBDatasetIH005."MTGNO">]')
        end
      end
      object Overlay1: TfrxOverlay
        FillType = ftBrush
        Height = 449.764070000000000000
        Top = 313.700990000000000000
        Width = 869.291900000000000000
        OnAfterPrint = 'Overlay1OnAfterPrint'
        object Memo9: TfrxMemoView
          Left = 3.779530000000000000
          Top = 283.464750000000000000
          Width = 95.862624550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304#12458#12540#12496#12540#12524#12452'H2'#12305)
        end
        object Memo10: TfrxMemoView
          Left = 366.614410000000000000
          Top = 283.464750000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #39#35211#31309#8470' '#39'[frxDBDatasetIH005."MHNO"]')
        end
        object Memo11: TfrxMemoView
          Left = 279.685220000000000000
          Top = 283.464750000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
        end
        object Memo12: TfrxMemoView
          Left = 309.921460000000000000
          Top = 309.921460000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            ' [IIF'
            '(<PageLine> mod 3 = 1, <frxDBDatasetIH005."MTSHNM">,'
            '(IIF'
            '(Memo12.Text <> '#39#39',<frxDBDatasetIH005."MTSHNM">, '#39#39')'
            ')'
            ')'
            ']')
        end
        object Memo13: TfrxMemoView
          Left = 309.921460000000000000
          Top = 332.598640000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            ' [IIF'
            '(<PageLine> mod 3 = 2, <frxDBDatasetIH005."MTSHNM">,'
            '(IIF'
            '(Memo13.Text <> '#39#39',<frxDBDatasetIH005."MTSHNM">, '#39#39')'
            ')'
            ')'
            ']')
        end
        object Memo14: TfrxMemoView
          Left = 309.921460000000000000
          Top = 355.275820000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            ' [IIF'
            '(<PageLine> mod 3 = 0, <frxDBDatasetIH005."MTSHNM">,'
            '(IIF'
            '(Memo14.Text <> '#39#39',<frxDBDatasetIH005."MTSHNM">, '#39#39')'
            ')'
            ')'
            ']')
        end
        object Memo15: TfrxMemoView
          Left = 3.779530000000000000
          Top = 309.921460000000000000
          Width = 95.862624550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304#12458#12540#12496#12524#12452#26126#32048#12305)
        end
        object Memo18: TfrxMemoView
          Left = 94.488250000000000000
          Top = 309.921460000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            '[Line]')
        end
        object Memo19: TfrxMemoView
          Left = 94.488250000000000000
          Top = 283.464750000000000000
          Width = 39.169674550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[Line]')
        end
        object Memo20: TfrxMemoView
          Left = 136.063080000000000000
          Top = 283.464750000000000000
          Width = 39.169674550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[Line#]')
        end
        object Memo25: TfrxMemoView
          Left = 136.063080000000000000
          Top = 309.921460000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            '[Line#]')
        end
        object Memo26: TfrxMemoView
          Left = 94.488250000000000000
          Top = 332.598640000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            '[Line]')
        end
        object Memo27: TfrxMemoView
          Left = 136.063080000000000000
          Top = 332.598640000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            '[Line#]')
        end
        object Memo28: TfrxMemoView
          Left = 94.488250000000000000
          Top = 355.275820000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            '[Line]')
        end
        object Memo29: TfrxMemoView
          Left = 136.063080000000000000
          Top = 355.275820000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            '[Line#]')
        end
        object frxDBDatasetIH005MTGNO: TfrxMemoView
          Left = 185.196970000000000000
          Top = 309.921460000000000000
          Width = 41.574830000000000000
          Height = 18.897637800000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[<frxDBDatasetIH005."MTGNO">]')
        end
        object Memo30: TfrxMemoView
          Left = 185.196970000000000000
          Top = 332.598640000000000000
          Width = 41.574830000000000000
          Height = 18.897637800000000000
          DataField = 'MTGNO'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTGNO"]')
        end
        object Memo31: TfrxMemoView
          Left = 185.196970000000000000
          Top = 355.275820000000000000
          Width = 41.574830000000000000
          Height = 18.897637800000000000
          DataField = 'MTGNO'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTGNO"]')
        end
        object Memo34: TfrxMemoView
          Left = 453.543600000000000000
          Top = 283.464750000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MHTKNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHTKNM"]')
        end
        object Memo35: TfrxMemoView
          Left = 94.488250000000000000
          Top = 253.228510000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            ' Line')
        end
        object Memo36: TfrxMemoView
          Left = 136.063080000000000000
          Top = 253.228510000000000000
          Width = 39.169674550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            ' Line#')
        end
        object Memo37: TfrxMemoView
          Left = 177.637910000000000000
          Top = 253.228510000000000000
          Width = 69.405914550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            ' PageLine')
        end
        object Memo38: TfrxMemoView
          Left = 249.448980000000000000
          Top = 253.228510000000000000
          Width = 58.067324550000000000
          Height = 18.897637800000000000
          Memo.UTF8W = (
            ' MTGNO')
        end
        object frxDBDatasetIH005MTGNO1: TfrxMemoView
          Left = 226.771800000000000000
          Top = 309.921460000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            'GNO[<frxDBDatasetIH005."MTGNO">]')
        end
        object Memo39: TfrxMemoView
          Left = 226.771800000000000000
          Top = 332.598640000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            'GNO[<frxDBDatasetIH005."MTGNO">]')
        end
        object Memo40: TfrxMemoView
          Left = 226.771800000000000000
          Top = 355.275820000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            'GNO[<frxDBDatasetIH005."MTGNO">]')
        end
      end
    end
  end
end
