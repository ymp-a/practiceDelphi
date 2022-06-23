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
          OnDblClick = EdtDateDblClick
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
          OnDblClick = EdtDateDblClick
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
    Version = '5.6.10'
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
      PaperWidth = 257.000000000000000000
      PaperHeight = 364.000000000000000000
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
      PaperWidth = 257.000000000000000000
      PaperHeight = 364.000000000000000000
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
    Version = '5.6.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #27161#28310
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44715.473979131900000000
    ReportOptions.LastChange = 44725.431764710600000000
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
      PaperHeight = 364.000000000000000000
      PaperSize = 256
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
        PrintIfDetailEmpty = True
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
          Top = 15.118120000000010000
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
          Top = 15.118120000000010000
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
          Top = 15.118120000000010000
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
        Height = 60.094488190000000000
        Top = 517.795610000000000000
        Width = 891.969080000000000000
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005MS."NewMTNO">=<frxDBDatasetIH005."NewMTNO">'
        PrintIfDetailEmpty = True
        RowCount = 3
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
          Top = 15.118119999999980000
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
        Height = 124.724409450000000000
        Top = 64.252010000000000000
        Width = 891.969080000000000000
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 58.582677170000000000
        Top = 275.905690000000000000
        Width = 891.969080000000000000
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 136.818897640000000000
        Top = 359.055350000000000000
        Width = 891.969080000000000000
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Height = 18.897637795275600000
        Top = 600.945270000000000000
        Width = 891.969080000000000000
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Height = 143.622047240000000000
        Top = 642.520100000000000000
        Width = 891.969080000000000000
      end
      object DetailData3: TfrxDetailData
        FillType = ftBrush
        Height = 39.685039370000000000
        Top = 808.819420000000000000
        Width = 891.969080000000000000
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005."NewMTNO">=<frxDBDatasetIH005MS."NewMTNO">'
        PrintIfDetailEmpty = True
        RowCount = 3
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
          Top = 15.118119999999980000
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
          Top = 15.118119999999980000
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
        Height = 58.582677170000000000
        Top = 873.071430000000000000
        Width = 891.969080000000000000
      end
      object Header4: TfrxHeader
        FillType = ftBrush
        Height = 139.842519690000000000
        Top = 956.221090000000000000
        Width = 891.969080000000000000
      end
      object DetailData4: TfrxDetailData
        FillType = ftBrush
        Height = 39.685039370000000000
        Top = 1118.740880000000000000
        Width = 891.969080000000000000
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005."NewMTNO">=<frxDBDatasetIH005MS."NewMTNO">'
        PrintIfDetailEmpty = True
        RowCount = 3
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
          Top = 15.118120000000090000
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
        Height = 104.314960629921000000
        Top = 1182.992890000000000000
        Width = 891.969080000000000000
      end
      object Overlay1: TfrxOverlay
        FillType = ftBrush
        Height = 1322.834645670000000000
        Top = 1311.496910000000000000
        Width = 891.969080000000000000
        object Memo16: TfrxMemoView
          Left = 445.984540000000000000
          Top = 86.929202199999960000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
        end
        object Memo17: TfrxMemoView
          Top = 60.472492200000040000
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
          Top = 281.575008179999900000
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
          Top = 302.362216920000100000
          Width = 831.496062990000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Left = 402.519680160000000000
          Top = 0.000012199999900986
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
          Top = 347.716772199999900000
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
          Top = 638.740169680314900000
          Width = 831.496062990000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo28: TfrxMemoView
          Left = 410.078740160000000000
          Top = 653.858702199999900000
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
          Top = 960.000012199999900000
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
          Top = 653.858702199999900000
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
          Top = 374.173482200000100000
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
          Top = 899.528152199999700000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #23550#35937#35336)
        end
        object Memo18: TfrxMemoView
          Top = 927.874638179999900000
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
          Top = 997.795932199999900000
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
          Top = 0.000012199999900986
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
    Version = '5.6.10'
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
      PaperWidth = 257.000000000000000000
      PaperHeight = 364.000000000000000000
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
          Top = 3.779530000000022000
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
        Top = 525.354670000000100000
        Width = 869.291900000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = DataModule2.frxDBDatasetIH005
        DataSetName = 'frxDBDatasetIH005'
        RowCount = 0
        object frxDBDatasetIH005MTSHNM: TfrxMemoView
          Left = 264.567100000000000000
          Top = 3.779530000000022000
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
          Top = 3.779530000000022000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTSRYO'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTSRYO"]')
        end
        object Memo6: TfrxMemoView
          Top = 3.779530000000022000
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
    Version = '5.6.10'
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
      PaperWidth = 257.000000000000000000
      PaperHeight = 364.000000000000000000
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
          Top = 22.677179999999990000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            #8217#35211#31309#8470' '#8217'[frxDBDatasetIH005."MHNO"]')
        end
        object Memo3: TfrxMemoView
          Left = 275.905690000000000000
          Top = 22.677179999999990000
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
          Top = 22.677179999999990000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'MHTKNM'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHTKNM"]')
        end
        object Memo7: TfrxMemoView
          Top = 22.677179999999990000
          Width = 92.083094550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304'G'#12504#12483#12480#12540#37096#20998#12305)
        end
        object Memo5: TfrxMemoView
          Top = 45.354360000000010000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
        end
        object Memo8: TfrxMemoView
          Left = 151.181200000000000000
          Top = 45.354360000000010000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
        end
        object Memo16: TfrxMemoView
          Left = 94.488250000000000000
          Top = 22.677179999999990000
          Width = 39.169674550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[Line]')
        end
        object Memo21: TfrxMemoView
          Left = 136.063080000000000000
          Top = 22.677179999999990000
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
          Top = 22.677179999999990000
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
          Top = 3.779530000000022000
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
          Top = 3.779529999999994000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTSHNM"]')
        end
        object frxDBDatasetIH005MTSRYO: TfrxMemoView
          Left = 733.228820000000000000
          Top = 3.779529999999994000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'MTSRYO'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MTSRYO"]')
        end
        object Memo6: TfrxMemoView
          Top = 3.779529999999994000
          Width = 69.405914550000000000
          Height = 16.492494550000000000
          StretchMode = smMaxHeight
          Memo.UTF8W = (
            #12304#26126#32048#37096#20998#12305)
        end
        object Memo17: TfrxMemoView
          Left = 94.488250000000000000
          Top = 3.779529999999994000
          Width = 39.169674550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[Line]')
        end
        object Memo22: TfrxMemoView
          Left = 136.063080000000000000
          Top = 3.779529999999994000
          Width = 39.169674550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[Line#]')
        end
        object Memo32: TfrxMemoView
          Left = 177.637910000000000000
          Top = 3.779529999999994000
          Width = 69.405914550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            '[PageLine]')
        end
        object Memo41: TfrxMemoView
          Left = 249.448980000000000000
          Top = 3.779529999999994000
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
          Top = 309.921459999999900000
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
          Top = 309.921459999999900000
          Width = 95.862624550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304#12458#12540#12496#12524#12452#26126#32048#12305)
        end
        object Memo18: TfrxMemoView
          Left = 94.488250000000000000
          Top = 309.921459999999900000
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
          Top = 309.921459999999900000
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
          Top = 309.921459999999900000
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
          Top = 309.921459999999900000
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
  object frxReport4: TfrxReport
    Version = '5.6.10'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = #27161#28310
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44715.473979131900000000
    ReportOptions.LastChange = 44725.431764710600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'var'
      'PageLine: integer;//'#29694#22312#12398#34892#25968#12434#20986#21147#12375#12414#12377
      'PageMaxRow: integer =3;//'#12506#12540#12472#12354#12383#12426#12398#26368#22823#34892#25968#12434#35373#23450#12375#12414#12377
      '  '
      'procedure MasterData1OnBeforePrint(Sender: TfrxComponent);'
      'begin    '
      
        '  PageLine := <line> mod PageMaxRow; //'#12371#12398#12467#12540#12489#12399#22266#23450#25968#12398#34892#12395#24517#35201#12391#12377'         ' +
        '         '
      '  child1.visible := False; //'#21021#26399#21270'  '
      '  child2.visible := False; //'#21021#26399#21270'            '
      'end;'
      '  '
      '//1,3,4'#38917#30446#29992' '#12501#12483#12479#12540#12452#12505#12531#12488'                        '
      'procedure Footer1OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  i: integer;'
      'begin'
      '  i := IIF(PageLine = 0, PageMaxRow, PageLine);                '
      '  child1.visible := True;'
      '        '
      '  while i < PageMaxRow do'
      '  begin'
      '    i := i + 1;'
      '    Engine.ShowBand(Child1);//'#31354#30333#12398#12501#12457#12540#12512#12434#21360#21047#12377#12427'              '
      '  end;        '
      '  child1.visible := False;//'#21021#26399#21270'                               '
      'end;'
      '  '
      '//2'#38917#30446#23554#29992' '#12501#12483#12479#12540#12452#12505#12531#12488'    '
      'procedure Footer2OnBeforePrint(Sender: TfrxComponent);'
      'var'
      '  i: integer;'
      'begin'
      '  i := IIF(PageLine = 0, PageMaxRow, PageLine);                '
      '  child2.visible := True;     '
      '   '
      '  while i < PageMaxRow do'
      '  begin'
      '    i := i + 1;'
      '    Engine.ShowBand(Child2);//'#31354#30333#12398#12501#12457#12540#12512#12434#21360#21047#12377#12427'              '
      '  end;        '
      '  child2.visible := False;//'#21021#26399#21270'                               '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 472
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
      PaperWidth = 257.000000000000000000
      PaperHeight = 364.000000000000000000
      PaperSize = 12
      LeftMargin = 7.000000000000000000
      RightMargin = 5.000000000000000000
      TopMargin = 7.000000000000000000
      BottomMargin = 7.000000000000000000
      Frame.Width = 0.100000000000000000
      LargeDesignHeight = True
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Top = 41.574830000000000000
        Width = 925.984850000000000000
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
        Height = 41.574803150000000000
        ParentFont = False
        Top = 207.874150000000000000
        Width = 925.984850000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        Child = frxReport4.Child1
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005MS."NewMTNO">=<frxDBDatasetIH005."NewMTNO">'
        RowCount = 0
        object frxDBDatasetIH005MSMTSHNM: TfrxMemoView
          Left = 7.559060000000000000
          Width = 317.480314960000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #12288'[frxDBDatasetIH005MS."MTSHNM"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object frxDBDatasetIH005MSMTKIN: TfrxMemoView
          Left = 555.590551180000000000
          Top = 20.787401570000000000
          Width = 75.590551181102400000
          Height = 20.787401570000000000
          DataField = 'MTKIN'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTKIN"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object frxDBDatasetIH005MSMTTNKA: TfrxMemoView
          Left = 464.881889763780000000
          Top = 20.787401570000000000
          Width = 86.929133858267700000
          Height = 20.787401570000000000
          DataField = 'MTTNKA'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTTNKA"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object frxDBDatasetIH005MSMTSRYO: TfrxMemoView
          Left = 328.818897640000000000
          Top = 20.787401570000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSRYO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo75: TfrxMemoView
          Left = 7.559060000000000000
          Top = 20.787401570000000000
          Width = 113.385900000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861'1234X5678')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo76: TfrxMemoView
          Left = 211.653680000000000000
          Top = 20.787401570000000000
          Width = 113.385900000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968'1.000')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo77: TfrxMemoView
          Left = 415.748031496063000000
          Top = 20.787401570000000000
          Width = 30.236220472440900000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo78: TfrxMemoView
          Left = 634.960629920000000000
          Top = 20.787401570000000000
          Width = 52.913390710000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '#'#65292'###')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo80: TfrxMemoView
          Left = 691.653545750000000000
          Top = 20.787401570000000000
          Width = 215.433210000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26029#35009#20181#27096#26029#35009#20181#27096#26029#35009#20181#27096#26029#35009#20181#27096#26029#35009#20181#27096' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo177: TfrxMemoView
          Left = 449.763779527559000000
          Top = 20.787401570000000000
          Width = 15.118120000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo79: TfrxMemoView
          Left = 691.653543310000000000
          Width = 215.433070870000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20633#32771)
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Top = 18.897650000000000000
        Width = 925.984850000000000000
        Condition = 'frxDBDatasetIH005."NewMTNO"'
        StartNewPage = True
      end
      object DetailData2: TfrxDetailData
        FillType = ftBrush
        Height = 60.094488190000000000
        Top = 600.945270000000000000
        Width = 925.984850000000000000
        OnBeforePrint = 'MasterData1OnBeforePrint'
        Child = frxReport4.Child2
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005MS."NewMTNO">=<frxDBDatasetIH005."NewMTNO">'
        RowCount = 0
        object Memo7: TfrxMemoView
          Left = 7.559060000000000000
          Top = 41.574830000000000000
          Width = 317.480314960000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25688#35201#37096#20998)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo1: TfrxMemoView
          Left = 7.559055120000000000
          Top = 3.779530000000020000
          Width = 317.480314960000000000
          Height = 18.897650000000000000
          DataField = 'MTSHNM'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSHNM"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo148: TfrxMemoView
          Left = 328.818897640000000000
          Top = 22.677180000000000000
          Width = 86.929133860000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSRYO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo149: TfrxMemoView
          Left = 7.559060000000000000
          Top = 22.677180000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo150: TfrxMemoView
          Left = 211.653680000000000000
          Top = 22.677180000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo151: TfrxMemoView
          Left = 415.748300000000000000
          Top = 22.677180000000000000
          Width = 30.236220470000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo153: TfrxMemoView
          Left = 457.323130000000000000
          Top = 3.779530000000020000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26029#35009#20181#27096)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo154: TfrxMemoView
          Left = 457.323130000000000000
          Top = 22.677180000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #24471#24847#20808#20633#32771)
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        Height = 120.944881890000000000
        Top = 64.252010000000000000
        Width = 925.984850000000000000
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Top = 272.126160000000000000
        Width = 925.984850000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        Child = frxReport4.Child1
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        Height = 219.212598430000000000
        Top = 359.055350000000000000
        Width = 925.984850000000000000
      end
      object Footer2: TfrxFooter
        FillType = ftBrush
        Top = 684.094930000000000000
        Width = 925.984850000000000000
        OnBeforePrint = 'Footer2OnBeforePrint'
        Child = frxReport4.Child2
      end
      object Header3: TfrxHeader
        FillType = ftBrush
        Height = 163.653543307087000000
        Top = 789.921770000000000000
        Width = 925.984850000000000000
      end
      object DetailData3: TfrxDetailData
        FillType = ftBrush
        Height = 41.574803150000000000
        Top = 975.118740000000000000
        Width = 925.984850000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005."NewMTNO">=<frxDBDatasetIH005MS."NewMTNO">'
        RowCount = 0
        object Memo11: TfrxMemoView
          Left = 7.559060000000000000
          Width = 317.480314960000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #12288'[frxDBDatasetIH005MS."MTSHNM"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo12: TfrxMemoView
          Left = 555.590551180000000000
          Top = 20.787401570000000000
          Width = 75.590551180000000000
          Height = 20.787401570000000000
          DataField = 'MTKIN'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTKIN"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo13: TfrxMemoView
          Left = 464.881889760000000000
          Top = 20.787401570000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataField = 'MTTNKA'
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTTNKA"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo21: TfrxMemoView
          Left = 328.818897640000000000
          Top = 20.787401570000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSRYO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo81: TfrxMemoView
          Left = 7.559060000000000000
          Top = 20.787401570000000000
          Width = 113.385900000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861'1234X5678')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo82: TfrxMemoView
          Left = 211.653680000000000000
          Top = 20.787401570000000000
          Width = 113.385900000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968'1.000')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo83: TfrxMemoView
          Left = 415.748031500000000000
          Top = 20.787401570000000000
          Width = 30.236220470000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo84: TfrxMemoView
          Left = 634.960629920000000000
          Top = 20.787401570000000000
          Width = 52.913390710000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '#'#65292'###')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo85: TfrxMemoView
          Left = 691.653545750000000000
          Top = 20.787401570000000000
          Width = 215.433210000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26029#35009#20181#27096#26029#35009#20181#27096#26029#35009#20181#27096#26029#35009#20181#27096#26029#35009#20181#27096' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo86: TfrxMemoView
          Left = 449.763779530000000000
          Top = 20.787401570000000000
          Width = 15.118120000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo87: TfrxMemoView
          Left = 691.653543310000000000
          Width = 215.433070870000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20633#32771)
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Footer3: TfrxFooter
        FillType = ftBrush
        Top = 1039.370750000000000000
        Width = 925.984850000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
      end
      object Header4: TfrxHeader
        FillType = ftBrush
        Height = 219.212598425197000000
        Top = 1062.047930000000000000
        Width = 925.984850000000000000
      end
      object DetailData4: TfrxDetailData
        FillType = ftBrush
        Height = 41.574803150000000000
        Top = 1303.937850000000000000
        Width = 925.984850000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        DataSet = DataModule2.frxDBDatasetIH005MS
        DataSetName = 'frxDBDatasetIH005MS'
        Filter = '<frxDBDatasetIH005."NewMTNO">=<frxDBDatasetIH005MS."NewMTNO">'
        RowCount = 0
        object Memo88: TfrxMemoView
          Left = 7.559060000000000000
          Width = 317.480314960000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #12288'[frxDBDatasetIH005MS."MTSHNM"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo89: TfrxMemoView
          Left = 332.598427640000000000
          Top = 20.787401569999900000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '%2.3n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MTSRYO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo90: TfrxMemoView
          Left = 7.559060000000000000
          Top = 20.787401569999900000
          Width = 113.385900000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861'1234X5678')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo91: TfrxMemoView
          Left = 211.653680000000000000
          Top = 20.787401569999900000
          Width = 113.385900000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968'1.000')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo92: TfrxMemoView
          Left = 419.527561500000000000
          Top = 20.787401569999900000
          Width = 30.236220470000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo130: TfrxMemoView
          Left = 453.543602440000000000
          Top = 20.787401569999900000
          Width = 215.433210000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26029#35009#20181#27096#26029#35009#20181#27096#26029#35009#20181#27096#26029#35009#20181#27096#26029#35009#20181#27096' ')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo131: TfrxMemoView
          Left = 453.543600000000000000
          Width = 215.433070870000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #20633#32771)
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Footer4: TfrxFooter
        FillType = ftBrush
        Top = 1368.189860000000000000
        Width = 925.984850000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
      end
      object Overlay1: TfrxOverlay
        FillType = ftBrush
        Height = 1322.834645670000000000
        Top = 1390.867040000000000000
        Width = 925.984850000000000000
        object Shape21: TfrxShapeView
          Left = 684.094930000000000000
          Top = 1137.638530000000000000
          Width = 219.212740000000000000
          Height = 177.637790390000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape17: TfrxShapeView
          Top = 1137.638530000000000000
          Width = 672.756340000000000000
          Height = 177.637790390000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape8: TfrxShapeView
          Top = 105.826840000000000000
          Width = 910.866730000000000000
          Height = 181.417320390000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape7: TfrxShapeView
          Left = 457.323130000000000000
          Top = 60.472479999999900000
          Width = 272.126160000000000000
          Height = 39.685036930000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape6: TfrxShapeView
          Top = 60.472479999999900000
          Width = 453.543600000000000000
          Height = 39.685039370000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape5: TfrxShapeView
          Top = 15.118120000000100000
          Width = 343.937230000000000000
          Height = 39.685039370078700000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Memo16: TfrxMemoView
          Left = 457.323130000000000000
          Top = 79.370142199999900000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo2: TfrxMemoView
          Left = 566.929500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30331#37682#30058#21495#65306'ABC1234567890123')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Top = 245.669462200000000000
          Width = 75.590551180000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #23550#35937#35336)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo23: TfrxMemoView
          Left = 759.685530000000000000
          Top = 245.669296220000000000
          Width = 147.401670000000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<frxDBDatasetIH005MS."MHGKIN">*1.1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo26: TfrxMemoView
          Top = 285.354538180000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #12300#9679' '#12301#12399#36605#28187#31246#29575#23550#35937#12391#12354#12427#12371#12392#12434#31034#12375#12390#12356#12414#12377#12290)
          ParentFont = False
        end
        object Line1: TfrxLineView
          Top = 317.480314960000000000
          Width = 925.984251970000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          Left = 366.614173228346000000
          Top = 0.000012199999900986
          Width = 185.196850390000000000
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
            #32013#12288#21697#12288#26360#12288#65288#25511#65289)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 366.614173228346000000
          Top = 343.937007874016000000
          Width = 185.196850393701000000
          Height = 34.015748030000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #20986#12288#24235#12288#20253#12288#31080)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line2: TfrxLineView
          Top = 661.417322830000000000
          Width = 925.984251970000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo28: TfrxMemoView
          Left = 366.614173228346000000
          Top = 687.874015748031000000
          Width = 185.196850393701000000
          Height = 34.015748030000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #32013#12288#21697#12288#26360)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line3: TfrxLineView
          Top = 1005.354330710000000000
          Width = 925.984251968504000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          Left = 366.614173228346000000
          Top = 1031.811023622050000000
          Width = 185.196850393701000000
          Height = 34.015748030000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #21463#12288#38936#12288#26360)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo24: TfrxMemoView
          Left = 7.559060000000000000
          Top = 1277.481152200000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23626#12369#20808#20303#25152#12381#12398#65297)
          ParentFont = False
          VAlign = vaBottom
        end
        object Shape2: TfrxShapeView
          Left = 366.614173228346000000
          Top = 343.937007874016000000
          Width = 185.196850390000000000
          Height = 34.015770000000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape3: TfrxShapeView
          Left = 366.614173228346000000
          Top = 687.874015748031000000
          Width = 185.196850390000000000
          Height = 34.015770000000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape4: TfrxShapeView
          Left = 366.614173228346000000
          Top = 1031.811023622050000000
          Width = 185.196850390000000000
          Height = 34.015770000000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Memo36: TfrxMemoView
          Top = 15.118120000000100000
          Width = 343.937230000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24481#12288#12288#12288#24471#12288#12288#12288#24847#12288#12288#12288#20808#12288#12288#12288#21517)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo38: TfrxMemoView
          Left = 7.559060000000000000
          Top = 79.370142199999900000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' '#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo40: TfrxMemoView
          Top = 60.472479999999900000
          Width = 347.716760000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24481#12288#12288#12288#23626#12288#12288#12288#12369#12288#12288#12288#20808#12288#12288#12288#21517)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo41: TfrxMemoView
          Left = 347.716760000000000000
          Top = 60.472479999999900000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #38651#35441#30058#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo42: TfrxMemoView
          Left = 347.716760000000000000
          Top = 79.370130000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '03-1234-5678')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo43: TfrxMemoView
          Left = 461.102660000000000000
          Top = 60.472479999999900000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #32013#20837#24180#26376#26085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo44: TfrxMemoView
          Left = 559.370440000000000000
          Top = 60.472479999999900000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20253#31080#30058#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo45: TfrxMemoView
          Left = 559.370440000000000000
          Top = 79.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHNO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo46: TfrxMemoView
          Left = 646.299630000000000000
          Top = 60.472479999999900000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24471#24847#20808)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo47: TfrxMemoView
          Left = 646.299630000000000000
          Top = 79.370130000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MHTKCD"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo48: TfrxMemoView
          Left = 737.008350000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #26666#24335#20250#31038#9679#9679)
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 737.008350000000000000
          Top = 60.472479999999900000
          Width = 170.078850000000000000
          Height = 49.133890000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #8251#12392#9733#12510#12540#12463#12364#12388#12367#21830#21697#12399'SC'#26862#26519#35469#35388#32025#12391#12377#12290
            #8251#12510#12540#12463#12399#12289'FSC Mix Credit'#12289
            #9733#12510#12540#12463#12399#12289'FSC Recycled Credit'#12391#12377#12290
            'SGSHK-COC-350443')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          Left = 3.779530000000000000
          Top = 105.826761890000000000
          Width = 321.259854720000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21830#12288#12288#12288#21697#12288#12288#12288#21517#12288#12288#12288#12539#12288#12288#12288#35215#12288#12288#12288#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo51: TfrxMemoView
          Left = 328.818912280000000000
          Top = 105.826761890000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327#65288#20837#25968#65289)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo52: TfrxMemoView
          Left = 415.748053460000000000
          Top = 105.826761890000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21336#20301)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo53: TfrxMemoView
          Left = 449.763803940000000000
          Top = 105.826761890000000000
          Width = 15.118120000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #65312)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo54: TfrxMemoView
          Left = 464.881914170000000000
          Top = 105.826761890000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#25244#21336#20385)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo55: TfrxMemoView
          Left = 555.590582910000000000
          Top = 105.826761890000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #37329#38989)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo56: TfrxMemoView
          Left = 634.960666540000000000
          Top = 105.826761890000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #26029#35009#26009)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo57: TfrxMemoView
          Left = 691.653565280000000000
          Top = 105.826761890000000000
          Width = 215.433061100000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20633#12288#12288#32771#12288#12288#65295#12288#12288#26029#12288#12288#35009#12288#12288#20181#12288#12288#27096)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo58: TfrxMemoView
          Left = 328.818912280000000000
          Top = 124.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '12,345.000')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo59: TfrxMemoView
          Left = 415.748053460000000000
          Top = 124.724490000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo60: TfrxMemoView
          Left = 449.763803940000000000
          Top = 124.724490000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo61: TfrxMemoView
          Left = 464.881914170000000000
          Top = 124.724490000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '123.456.00')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo62: TfrxMemoView
          Left = 555.590582910000000000
          Top = 124.724490000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '1,234,567')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo63: TfrxMemoView
          Left = 634.960666540000000000
          Top = 124.724490000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '1,234')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo64: TfrxMemoView
          Left = 7.559060000000000000
          Top = 124.724490000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo65: TfrxMemoView
          Left = 691.653543310000000000
          Top = 124.724490000000000000
          Width = 215.433070870000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo66: TfrxMemoView
          Left = 691.653543310000000000
          Top = 143.622140000000000000
          Width = 215.433070870000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26029#35009#20181#27096)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo67: TfrxMemoView
          Left = 7.559060000000000000
          Top = 143.622140000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo68: TfrxMemoView
          Left = 211.653680000000000000
          Top = 143.622140000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo69: TfrxMemoView
          Left = 328.818912280000000000
          Top = 143.622140000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '12,345.000')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo70: TfrxMemoView
          Left = 415.748053460000000000
          Top = 143.622140000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo71: TfrxMemoView
          Left = 449.763803940000000000
          Top = 143.622140000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo72: TfrxMemoView
          Left = 464.881914170000000000
          Top = 143.622140000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '123.456.00')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo73: TfrxMemoView
          Left = 555.590582910000000000
          Top = 143.622140000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '1,234,567')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo74: TfrxMemoView
          Left = 634.960666540000000000
          Top = 143.622140000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '#,###')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo135: TfrxMemoView
          Left = 687.874460000000000000
          Top = 1137.638530000000000000
          Width = 211.653680000000000000
          Height = 22.677180000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #26666#24335#20250#31038#9679#9679' '#27583)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo132: TfrxMemoView
          Left = 687.874460000000000000
          Top = 1160.315710000000000000
          Width = 211.653680000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24038#35352#12398#36890#12426#27491#12395#21463#38936#12356#12383#12375#12414#12375#12383#12290)
          ParentFont = False
        end
        object Memo155: TfrxMemoView
          Left = 79.370130000000000000
          Top = 245.669450000000000000
          Width = 75.590551180000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#29575'8'#65285)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo156: TfrxMemoView
          Left = 79.370130000000000000
          Top = 266.456680710000000000
          Width = 75.590551180000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#29575'10'#65285)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo157: TfrxMemoView
          Left = 162.519790000000000000
          Top = 245.669450000000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo158: TfrxMemoView
          Left = 162.519790000000000000
          Top = 266.456680710000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MHGKIN"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo159: TfrxMemoView
          Left = 257.008040000000000000
          Top = 245.669450000000000000
          Width = 75.590551180000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #23567#35336#65288#31246#25244#65289)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo160: TfrxMemoView
          Left = 340.157700000000000000
          Top = 245.669450000000000000
          Width = 86.929133860000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MHGKIN"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo27: TfrxMemoView
          Left = 434.645950000000000000
          Top = 245.669450000000000000
          Width = 75.590551180000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #28040#36027#31246)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo161: TfrxMemoView
          Left = 514.016080000000000000
          Top = 245.669450000000000000
          Width = 75.590551180000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#29575'8'#65285)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo162: TfrxMemoView
          Left = 514.016080000000000000
          Top = 266.456680710000000000
          Width = 75.590551180000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#29575'10'#65285)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo163: TfrxMemoView
          Left = 593.386210000000000000
          Top = 245.669450000000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo164: TfrxMemoView
          Left = 593.386210000000000000
          Top = 266.456680710000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<frxDBDatasetIH005MS."MHGKIN">*0.1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo3: TfrxMemoView
          Left = 684.094930000000000000
          Top = 245.669450000000000000
          Width = 71.811021180000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21512#35336)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo176: TfrxMemoView
          Left = 7.559060000000000000
          Top = 1296.378790000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #23626#12369#20808#20303#25152#12381#12398#65298)
          ParentFont = False
          VAlign = vaBottom
        end
        object Line4: TfrxLineView
          Top = 120.944869690000000000
          Width = 910.866141730000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          Left = 326.929116770000000000
          Top = 105.826840000000000000
          Height = 139.842610000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          Top = 30.236218029999900000
          Width = 343.937034720000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          Top = 75.590543860000000000
          Width = 453.543331500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          Left = 347.716760000000000000
          Top = 60.472479999999900000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          Left = 555.590910000000000000
          Top = 60.472479999999900000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          Left = 642.520100000000000000
          Top = 60.472479999999900000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          Top = 162.519672830000000000
          Width = 910.866141730000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          Left = 457.323130000000000000
          Top = 75.590543860000000000
          Width = 272.125964720000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line13: TfrxLineView
          Top = 204.094475980000000000
          Width = 910.866141730000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          Top = 245.669279130000000000
          Width = 910.866141730000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          Left = 447.874003540000000000
          Top = 105.826840000000000000
          Height = 139.842519685039000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          Left = 553.700780080000000000
          Top = 105.826840000000000000
          Height = 139.842519690000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          Left = 633.070861260000000000
          Top = 105.826840000000000000
          Height = 139.842519690000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          Left = 689.763779530000000000
          Top = 105.826840000000000000
          Height = 181.417440000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          Left = 415.748019290000000000
          Top = 105.826840000000000000
          Height = 139.842610000000000000
          Color = clBlack
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
        object Line20: TfrxLineView
          Left = 464.881877560000000000
          Top = 105.826840000000000000
          Height = 139.842519685039000000
          Color = clBlack
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
        object Shape9: TfrxShapeView
          Left = 366.614173230000000000
          Width = 185.196850390000000000
          Height = 34.015748030000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Memo180: TfrxMemoView
          Left = 7.559060000000000000
          Top = 34.015770000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' [<frxDBDatasetIH005."MHTKNM"> +'#39#12288#27583#39']')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo17: TfrxMemoView
          Left = 7.559060000000000000
          Top = 166.299320000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo39: TfrxMemoView
          Left = 7.559060000000000000
          Top = 185.196970000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo181: TfrxMemoView
          Left = 211.653680000000000000
          Top = 185.196970000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo182: TfrxMemoView
          Left = 7.559060000000000000
          Top = 207.874150000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo183: TfrxMemoView
          Left = 7.559060000000000000
          Top = 226.771800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo184: TfrxMemoView
          Left = 211.653680000000000000
          Top = 226.771800000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Line21: TfrxLineView
          Left = 156.850393700000000000
          Top = 245.669450000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line22: TfrxLineView
          Left = 512.126155120000000000
          Top = 245.669450000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line27: TfrxLineView
          Left = 755.906000000000000000
          Top = 245.669450000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line28: TfrxLineView
          Left = 77.480314960000000000
          Top = 245.669450000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          Left = 591.496062990000000000
          Top = 245.669450000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line24: TfrxLineView
          Left = 430.866420000000000000
          Top = 245.669450000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line25: TfrxLineView
          Left = 336.378170000000000000
          Top = 245.669450000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line26: TfrxLineView
          Left = 253.228510000000000000
          Top = 245.669450000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Shape1: TfrxShapeView
          Top = 793.701300000000000000
          Width = 910.866730000000000000
          Height = 181.417320390000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape10: TfrxShapeView
          Left = 457.323130000000000000
          Top = 748.346940000000000000
          Width = 272.126160000000000000
          Height = 39.685036930000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape11: TfrxShapeView
          Top = 748.346940000000000000
          Width = 453.543600000000000000
          Height = 39.685039370000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape12: TfrxShapeView
          Top = 702.992580000000000000
          Width = 343.937230000000000000
          Height = 39.685039370000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Memo6: TfrxMemoView
          Left = 457.323130000000000000
          Top = 767.244602200000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo14: TfrxMemoView
          Left = 566.929500000000000000
          Top = 687.874460000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30331#37682#30058#21495#65306'ABC1234567890123')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Top = 933.543922200000000000
          Width = 75.590551180000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #23550#35937#35336)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo18: TfrxMemoView
          Left = 759.685530000000000000
          Top = 933.543756220000000000
          Width = 147.401670000000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005MS
          DataSetName = 'frxDBDatasetIH005MS'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<frxDBDatasetIH005MS."MHGKIN">*1.1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo25: TfrxMemoView
          Top = 973.228998180000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #12300#9679' '#12301#12399#36605#28187#31246#29575#23550#35937#12391#12354#12427#12371#12392#12434#31034#12375#12390#12356#12414#12377#12290)
          ParentFont = False
        end
        object Line29: TfrxLineView
          Top = 1005.354774960000000000
          Width = 925.984251970000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo107: TfrxMemoView
          Top = 702.992580000000000000
          Width = 343.937230000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24481#12288#12288#12288#24471#12288#12288#12288#24847#12288#12288#12288#20808#12288#12288#12288#21517)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo108: TfrxMemoView
          Left = 7.559060000000000000
          Top = 767.244602200000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' '#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo109: TfrxMemoView
          Top = 748.346940000000000000
          Width = 347.716760000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24481#12288#12288#12288#23626#12288#12288#12288#12369#12288#12288#12288#20808#12288#12288#12288#21517)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo110: TfrxMemoView
          Left = 347.716760000000000000
          Top = 748.346940000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #38651#35441#30058#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo111: TfrxMemoView
          Left = 347.716760000000000000
          Top = 767.244590000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '03-1234-5678')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo112: TfrxMemoView
          Left = 461.102660000000000000
          Top = 748.346940000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #32013#20837#24180#26376#26085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo113: TfrxMemoView
          Left = 559.370440000000000000
          Top = 748.346940000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20253#31080#30058#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo114: TfrxMemoView
          Left = 559.370440000000000000
          Top = 767.244590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHNO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo115: TfrxMemoView
          Left = 646.299630000000000000
          Top = 748.346940000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24471#24847#20808)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo116: TfrxMemoView
          Left = 646.299630000000000000
          Top = 767.244590000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MHTKCD"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo117: TfrxMemoView
          Left = 737.008350000000000000
          Top = 687.874460000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #26666#24335#20250#31038#9679#9679)
          ParentFont = False
        end
        object Memo118: TfrxMemoView
          Left = 737.008350000000000000
          Top = 748.346940000000000000
          Width = 170.078850000000000000
          Height = 49.133890000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #8251#12392#9733#12510#12540#12463#12364#12388#12367#21830#21697#12399'SC'#26862#26519#35469#35388#32025#12391#12377#12290
            #8251#12510#12540#12463#12399#12289'FSC Mix Credit'#12289
            #9733#12510#12540#12463#12399#12289'FSC Recycled Credit'#12391#12377#12290
            'SGSHK-COC-350443')
          ParentFont = False
        end
        object Memo119: TfrxMemoView
          Left = 3.779530000000000000
          Top = 793.701221890000000000
          Width = 321.259854720000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21830#12288#12288#12288#21697#12288#12288#12288#21517#12288#12288#12288#12539#12288#12288#12288#35215#12288#12288#12288#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo134: TfrxMemoView
          Left = 328.818912280000000000
          Top = 793.701221890000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327#65288#20837#25968#65289)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo136: TfrxMemoView
          Left = 415.748053460000000000
          Top = 793.701221890000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21336#20301)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo137: TfrxMemoView
          Left = 449.763803940000000000
          Top = 793.701221890000000000
          Width = 15.118120000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #65312)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo138: TfrxMemoView
          Left = 464.881914170000000000
          Top = 793.701221890000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#25244#21336#20385)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo139: TfrxMemoView
          Left = 555.590582910000000000
          Top = 793.701221890000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #37329#38989)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo140: TfrxMemoView
          Left = 634.960666540000000000
          Top = 793.701221890000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #26029#35009#26009)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo141: TfrxMemoView
          Left = 691.653565280000000000
          Top = 793.701221890000000000
          Width = 215.433061100000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20633#12288#12288#32771#12288#12288#65295#12288#12288#26029#12288#12288#35009#12288#12288#20181#12288#12288#27096)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo142: TfrxMemoView
          Left = 328.818912280000000000
          Top = 812.598950000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '12,345.000')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo143: TfrxMemoView
          Left = 415.748053460000000000
          Top = 812.598950000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo144: TfrxMemoView
          Left = 449.763803940000000000
          Top = 812.598950000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo165: TfrxMemoView
          Left = 464.881914170000000000
          Top = 812.598950000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '123.456.00')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo166: TfrxMemoView
          Left = 555.590582910000000000
          Top = 812.598950000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '1,234,567')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo167: TfrxMemoView
          Left = 634.960666540000000000
          Top = 812.598950000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '1,234')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo168: TfrxMemoView
          Left = 7.559060000000000000
          Top = 812.598950000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo171: TfrxMemoView
          Left = 7.559060000000000000
          Top = 831.496600000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo172: TfrxMemoView
          Left = 211.653680000000000000
          Top = 831.496600000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo173: TfrxMemoView
          Left = 328.818912280000000000
          Top = 831.496600000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '12,345.000')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo174: TfrxMemoView
          Left = 415.748053460000000000
          Top = 831.496600000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo175: TfrxMemoView
          Left = 449.763803940000000000
          Top = 831.496600000000000000
          Width = 15.118120000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '#')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo185: TfrxMemoView
          Left = 464.881914170000000000
          Top = 831.496600000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '123.456.00')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo186: TfrxMemoView
          Left = 555.590582910000000000
          Top = 831.496600000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '1,234,567')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo187: TfrxMemoView
          Left = 634.960666540000000000
          Top = 831.496600000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '#,###')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo188: TfrxMemoView
          Left = 79.370130000000000000
          Top = 933.543910000000000000
          Width = 75.590551180000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#29575'8'#65285)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo189: TfrxMemoView
          Left = 79.370130000000000000
          Top = 954.331140710000000000
          Width = 75.590551180000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#29575'10'#65285)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo190: TfrxMemoView
          Left = 162.519790000000000000
          Top = 933.543910000000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo191: TfrxMemoView
          Left = 162.519790000000000000
          Top = 954.331140710000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MHGKIN"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo192: TfrxMemoView
          Left = 257.008040000000000000
          Top = 933.543910000000000000
          Width = 75.590551180000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #23567#35336#65288#31246#25244#65289)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo193: TfrxMemoView
          Left = 340.157700000000000000
          Top = 933.543910000000000000
          Width = 86.929133860000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MHGKIN"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo194: TfrxMemoView
          Left = 434.645950000000000000
          Top = 933.543910000000000000
          Width = 75.590551180000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #28040#36027#31246)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo195: TfrxMemoView
          Left = 514.016080000000000000
          Top = 933.543910000000000000
          Width = 75.590551180000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#29575'8'#65285)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo196: TfrxMemoView
          Left = 514.016080000000000000
          Top = 954.331140710000000000
          Width = 75.590551180000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #31246#29575'10'#65285)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo197: TfrxMemoView
          Left = 593.386210000000000000
          Top = 933.543910000000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '0')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo198: TfrxMemoView
          Left = 593.386210000000000000
          Top = 954.331140710000000000
          Width = 86.929133860000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          DisplayFormat.FormatStr = '#,##0'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[<frxDBDatasetIH005MS."MHGKIN">*0.1]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo199: TfrxMemoView
          Left = 684.094930000000000000
          Top = 933.543910000000000000
          Width = 71.811021180000000000
          Height = 41.574803150000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21512#35336)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line30: TfrxLineView
          Top = 808.819329690000000000
          Width = 910.866141730000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line31: TfrxLineView
          Left = 326.929116770000000000
          Top = 793.701300000000000000
          Height = 139.842610000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          Top = 718.110678030000000000
          Width = 343.937034720000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line33: TfrxLineView
          Top = 763.465003860000000000
          Width = 453.543331500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line34: TfrxLineView
          Left = 347.716760000000000000
          Top = 748.346940000000000000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line35: TfrxLineView
          Left = 555.590910000000000000
          Top = 748.346940000000000000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          Left = 642.520100000000000000
          Top = 748.346940000000000000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          Top = 850.394132830000000000
          Width = 910.866141730000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line38: TfrxLineView
          Left = 457.323130000000000000
          Top = 763.465003860000000000
          Width = 272.125964720000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line39: TfrxLineView
          Top = 891.968935980000000000
          Width = 910.866141730000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line40: TfrxLineView
          Top = 933.543739130000000000
          Width = 910.866141730000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line41: TfrxLineView
          Left = 447.874003540000000000
          Top = 793.701300000000000000
          Height = 139.842519690000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line42: TfrxLineView
          Left = 553.700780080000000000
          Top = 793.701300000000000000
          Height = 139.842519690000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line43: TfrxLineView
          Left = 633.070861260000000000
          Top = 793.701300000000000000
          Height = 139.842519690000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line44: TfrxLineView
          Left = 689.763779530000000000
          Top = 793.701300000000000000
          Height = 181.417440000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line45: TfrxLineView
          Left = 415.748019290000000000
          Top = 793.701300000000000000
          Height = 139.842610000000000000
          Color = clBlack
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
        object Line46: TfrxLineView
          Left = 464.881877560000000000
          Top = 793.701300000000000000
          Height = 139.842519690000000000
          Color = clBlack
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
        object Memo200: TfrxMemoView
          Left = 7.559060000000000000
          Top = 721.890230000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' [<frxDBDatasetIH005."MHTKNM"> +'#39#12288#27583#39']')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo201: TfrxMemoView
          Left = 7.559060000000000000
          Top = 854.173780000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo202: TfrxMemoView
          Left = 7.559060000000000000
          Top = 873.071430000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo203: TfrxMemoView
          Left = 211.653680000000000000
          Top = 873.071430000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo204: TfrxMemoView
          Left = 7.559060000000000000
          Top = 895.748610000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo205: TfrxMemoView
          Left = 7.559060000000000000
          Top = 914.646260000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo206: TfrxMemoView
          Left = 211.653680000000000000
          Top = 914.646260000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Line47: TfrxLineView
          Left = 156.850393700000000000
          Top = 933.543910000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line48: TfrxLineView
          Left = 512.126155120000000000
          Top = 933.543910000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line49: TfrxLineView
          Left = 755.906000000000000000
          Top = 933.543910000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          Left = 77.480314960000000000
          Top = 933.543910000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line51: TfrxLineView
          Left = 591.496062990000000000
          Top = 933.543910000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line52: TfrxLineView
          Left = 430.866420000000000000
          Top = 933.543910000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line53: TfrxLineView
          Left = 336.378170000000000000
          Top = 933.543910000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line54: TfrxLineView
          Left = 253.228510000000000000
          Top = 933.543910000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Shape13: TfrxShapeView
          Left = 457.323130000000000000
          Top = 404.409710000000000000
          Width = 272.126160000000000000
          Height = 39.685036930000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape14: TfrxShapeView
          Top = 404.409710000000000000
          Width = 453.543600000000000000
          Height = 39.685039370000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape15: TfrxShapeView
          Top = 359.055350000000000000
          Width = 343.937230000000000000
          Height = 39.685039370000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Memo5: TfrxMemoView
          Left = 457.323130000000000000
          Top = 423.307372200000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo9: TfrxMemoView
          Left = 566.929500000000000000
          Top = 343.937230000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #30331#37682#30058#21495#65306'ABC1234567890123')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Top = 359.055350000000000000
          Width = 343.937230000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24481#12288#12288#12288#24471#12288#12288#12288#24847#12288#12288#12288#20808#12288#12288#12288#21517)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo32: TfrxMemoView
          Left = 7.559060000000000000
          Top = 423.307372200000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' '#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo97: TfrxMemoView
          Top = 404.409710000000000000
          Width = 347.716760000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24481#12288#12288#12288#23626#12288#12288#12288#12369#12288#12288#12288#20808#12288#12288#12288#21517)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo98: TfrxMemoView
          Left = 347.716760000000000000
          Top = 404.409710000000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #38651#35441#30058#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo99: TfrxMemoView
          Left = 347.716760000000000000
          Top = 423.307360000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '03-1234-5678')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo100: TfrxMemoView
          Left = 461.102660000000000000
          Top = 404.409710000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #32013#20837#24180#26376#26085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo101: TfrxMemoView
          Left = 559.370440000000000000
          Top = 404.409710000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20253#31080#30058#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo102: TfrxMemoView
          Left = 559.370440000000000000
          Top = 423.307360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHNO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo103: TfrxMemoView
          Left = 646.299630000000000000
          Top = 404.409710000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24471#24847#20808)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo104: TfrxMemoView
          Left = 646.299630000000000000
          Top = 423.307360000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MHTKCD"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo105: TfrxMemoView
          Left = 737.008350000000000000
          Top = 343.937230000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #26666#24335#20250#31038#9679#9679)
          ParentFont = False
        end
        object Memo106: TfrxMemoView
          Left = 737.008350000000000000
          Top = 404.409710000000000000
          Width = 170.078850000000000000
          Height = 49.133890000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #8251#12392#9733#12510#12540#12463#12364#12388#12367#21830#21697#12399'SC'#26862#26519#35469#35388#32025#12391#12377#12290
            #8251#12510#12540#12463#12399#12289'FSC Mix Credit'#12289
            #9733#12510#12540#12463#12399#12289'FSC Recycled Credit'#12391#12377#12290
            'SGSHK-COC-350443')
          ParentFont = False
        end
        object Line55: TfrxLineView
          Top = 374.173448030000000000
          Width = 343.937034720000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line56: TfrxLineView
          Top = 419.527773860000000000
          Width = 453.543331500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line57: TfrxLineView
          Left = 347.716760000000000000
          Top = 404.409710000000000000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line58: TfrxLineView
          Left = 555.590910000000000000
          Top = 404.409710000000000000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line59: TfrxLineView
          Left = 642.520100000000000000
          Top = 404.409710000000000000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line60: TfrxLineView
          Left = 457.323130000000000000
          Top = 419.527773860000000000
          Width = 272.125964720000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo133: TfrxMemoView
          Left = 7.559060000000000000
          Top = 377.953000000000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' [<frxDBDatasetIH005."MHTKNM"> +'#39#12288#27583#39']')
          ParentFont = False
          VAlign = vaBottom
        end
        object Shape16: TfrxShapeView
          Top = 449.764070000000000000
          Width = 729.449290000000000000
          Height = 195.401574800000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Memo146: TfrxMemoView
          Left = 737.008350000000000000
          Top = 404.409710000000000000
          Width = 170.078850000000000000
          Height = 49.133890000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #8251#12392#9733#12510#12540#12463#12364#12388#12367#21830#21697#12399'SC'#26862#26519#35469#35388#32025#12391#12377#12290
            #8251#12510#12540#12463#12399#12289'FSC Mix Credit'#12289
            #9733#12510#12540#12463#12399#12289'FSC Recycled Credit'#12391#12377#12290
            'SGSHK-COC-350443')
          ParentFont = False
        end
        object Memo147: TfrxMemoView
          Left = 3.779530000000000000
          Top = 449.763991890000000000
          Width = 321.259854720000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21830#12288#12288#12288#21697#12288#12288#12288#21517#12288#12288#12288#12539#12288#12288#12288#35215#12288#12288#12288#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo152: TfrxMemoView
          Left = 328.818912280000000000
          Top = 449.763991890000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327#65288#20837#25968#65289)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo207: TfrxMemoView
          Left = 415.748053460000000000
          Top = 449.763991890000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21336#20301)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo212: TfrxMemoView
          Left = 457.322705280000000000
          Top = 449.763991890000000000
          Width = 268.346481100000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #26029#12288#12288#35009#12288#12288#20181#12288#12288#27096#12288#12288#65295#12288#12288#24471#12288#12288#24847#12288#12288#20808#12288#12288#20633#12288#12288#32771)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo213: TfrxMemoView
          Left = 328.818912280000000000
          Top = 468.661720000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '12,345.000')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo214: TfrxMemoView
          Left = 415.748053460000000000
          Top = 468.661720000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo219: TfrxMemoView
          Left = 7.559060000000000000
          Top = 468.661720000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo220: TfrxMemoView
          Left = 457.322683310000000000
          Top = 468.661720000000000000
          Width = 215.433070870000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo221: TfrxMemoView
          Left = 457.322683310000000000
          Top = 487.559370000000000000
          Width = 215.433070870000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26029#35009#20181#27096)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo222: TfrxMemoView
          Left = 7.559060000000000000
          Top = 487.559370000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo223: TfrxMemoView
          Left = 211.653680000000000000
          Top = 487.559370000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo224: TfrxMemoView
          Left = 328.818912280000000000
          Top = 487.559370000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '12,345.000')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo225: TfrxMemoView
          Left = 415.748053460000000000
          Top = 487.559370000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'RR')
          ParentFont = False
          VAlign = vaBottom
        end
        object Line61: TfrxLineView
          Top = 464.882099690000000000
          Width = 729.448818900000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line62: TfrxLineView
          Left = 326.929116770000000000
          Top = 449.764070000000000000
          Height = 56.692950000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line63: TfrxLineView
          Top = 524.976377950000000000
          Width = 729.448818897638000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line64: TfrxLineView
          Top = 585.070866140000000000
          Width = 729.448818897638000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line66: TfrxLineView
          Left = 453.543307090000000000
          Top = 449.764070000000000000
          Height = 195.779527559055000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line70: TfrxLineView
          Left = 415.748019290000000000
          Top = 449.764070000000000000
          Height = 56.692950000000000000
          Color = clBlack
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
        object Memo242: TfrxMemoView
          Left = 7.559060000000000000
          Top = 506.457020000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25688#35201)
          ParentFont = False
          VAlign = vaBottom
        end
        object Line65: TfrxLineView
          Left = 689.763779530000000000
          Top = 143.622140000000000000
          Width = 221.102362200000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line72: TfrxLineView
          Left = 689.763779530000000000
          Top = 185.196850390000000000
          Width = 221.102362200000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line73: TfrxLineView
          Left = 689.763779530000000000
          Top = 226.771653540000000000
          Width = 221.102362200000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo30: TfrxMemoView
          Left = 693.543753780000000000
          Top = 812.598950000000000000
          Width = 215.433070870000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo145: TfrxMemoView
          Left = 693.543753780000000000
          Top = 831.496600000000000000
          Width = 215.433070870000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26029#35009#20181#27096)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line74: TfrxLineView
          Left = 689.763779530000000000
          Top = 831.496600000000000000
          Width = 221.102362200000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line75: TfrxLineView
          Left = 689.763779527559000000
          Top = 873.071310390000000000
          Width = 221.102362200000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line76: TfrxLineView
          Left = 689.763779527559000000
          Top = 914.646113540000000000
          Width = 221.102362200000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line67: TfrxLineView
          Top = 506.457020000000000000
          Width = 729.448818897638000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo169: TfrxMemoView
          Left = 7.559060000000000000
          Top = 529.134200000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo170: TfrxMemoView
          Left = 7.559060000000000000
          Top = 548.031850000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo208: TfrxMemoView
          Left = 207.874150000000000000
          Top = 548.031850000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo209: TfrxMemoView
          Left = 7.559060000000000000
          Top = 566.929500000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25688#35201)
          ParentFont = False
          VAlign = vaBottom
        end
        object Line68: TfrxLineView
          Top = 566.929500000000000000
          Width = 729.448818897638000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Memo210: TfrxMemoView
          Left = 7.559060000000000000
          Top = 589.606680000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038#26666#24335#20250#31038)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo211: TfrxMemoView
          Left = 7.559060000000000000
          Top = 608.504330000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #34920#31034#23544#27861)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo215: TfrxMemoView
          Left = 211.653680000000000000
          Top = 608.504330000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            #20837#12426#25968)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo216: TfrxMemoView
          Left = 7.559060000000000000
          Top = 627.401980000000000000
          Width = 317.480324720000000000
          Height = 18.897650000000000000
          Visible = False
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #25688#35201)
          ParentFont = False
          VAlign = vaBottom
        end
        object Line71: TfrxLineView
          Top = 627.401980000000000000
          Width = 729.448818897638000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = [ftTop]
        end
        object Line77: TfrxLineView
          Left = 325.039580000000000000
          Top = 524.976377950000000000
          Height = 41.952755910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line78: TfrxLineView
          Left = 325.039580000000000000
          Top = 585.070866141732000000
          Height = 41.952755910000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line79: TfrxLineView
          Left = 415.748300000000000000
          Top = 524.976377950000000000
          Height = 41.952755910000000000
          Color = clBlack
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
        object Line80: TfrxLineView
          Left = 415.748300000000000000
          Top = 585.070866141732000000
          Height = 41.952755910000000000
          Color = clBlack
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
        object Shape18: TfrxShapeView
          Left = 457.323130000000000000
          Top = 1092.284614250000000000
          Width = 272.126160000000000000
          Height = 39.685036930000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape19: TfrxShapeView
          Top = 1092.284614250000000000
          Width = 453.543600000000000000
          Height = 39.685039370000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Shape20: TfrxShapeView
          Top = 1046.930254250000000000
          Width = 343.937230000000000000
          Height = 39.685039370000000000
          Curve = 2
          Shape = skRoundRectangle
        end
        object Memo93: TfrxMemoView
          Left = 457.323130000000000000
          Top = 1111.182276450000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          DataField = 'MHIRDT'
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHIRDT"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo95: TfrxMemoView
          Top = 1046.930254250000000000
          Width = 343.937230000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24481#12288#12288#12288#24471#12288#12288#12288#24847#12288#12288#12288#20808#12288#12288#12288#21517)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo96: TfrxMemoView
          Left = 7.559060000000000000
          Top = 1111.182276450000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' '#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517#24481#23626#12369#20808#21517)
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo120: TfrxMemoView
          Top = 1092.284614250000000000
          Width = 347.716760000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24481#12288#12288#12288#23626#12288#12288#12288#12369#12288#12288#12288#20808#12288#12288#12288#21517)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo121: TfrxMemoView
          Left = 347.716760000000000000
          Top = 1092.284614250000000000
          Width = 105.826840000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #38651#35441#30058#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo122: TfrxMemoView
          Left = 347.716760000000000000
          Top = 1111.182264250000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '03-1234-5678')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo123: TfrxMemoView
          Left = 461.102660000000000000
          Top = 1092.284614250000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #32013#20837#24180#26376#26085)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo124: TfrxMemoView
          Left = 559.370440000000000000
          Top = 1092.284614250000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20253#31080#30058#21495)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo125: TfrxMemoView
          Left = 559.370440000000000000
          Top = 1111.182264250000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHNO"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo126: TfrxMemoView
          Left = 646.299630000000000000
          Top = 1092.284614250000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #24471#24847#20808)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo127: TfrxMemoView
          Left = 646.299630000000000000
          Top = 1111.182264250000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDatasetIH005MS."MHTKCD"]')
          ParentFont = False
          VAlign = vaBottom
        end
        object Line69: TfrxLineView
          Top = 1062.048352280000000000
          Width = 343.937034720000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line81: TfrxLineView
          Top = 1107.402678110000000000
          Width = 453.543331500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line82: TfrxLineView
          Left = 347.716760000000000000
          Top = 1092.284614250000000000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line83: TfrxLineView
          Left = 555.590910000000000000
          Top = 1092.284614250000000000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line84: TfrxLineView
          Left = 642.520100000000000000
          Top = 1092.284614250000000000
          Height = 39.685039370000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line85: TfrxLineView
          Left = 457.323130000000000000
          Top = 1107.402678110000000000
          Width = 272.125964720000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo128: TfrxMemoView
          Left = 7.559060000000000000
          Top = 1065.827904250000000000
          Width = 336.378170000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            ' [<frxDBDatasetIH005."MHTKNM"> +'#39#12288#27583#39']')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo10: TfrxMemoView
          Top = 1137.638451890000000000
          Width = 325.039384720000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21830#12288#12288#12288#21697#12288#12288#12288#21517#12288#12288#12288#12539#12288#12288#12288#35215#12288#12288#12288#26684)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo94: TfrxMemoView
          Left = 328.818912280000000000
          Top = 1137.638451890000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #25968#37327#65288#20837#25968#65289)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo129: TfrxMemoView
          Left = 419.527583460000000000
          Top = 1137.638451890000000000
          Width = 30.236240000000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #21336#20301)
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo217: TfrxMemoView
          Left = 449.763645280000000000
          Top = 1137.638451890000000000
          Width = 215.433061100000000000
          Height = 15.118120000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            #20633#12288#12288#32771#12288#12288#65295#12288#12288#26029#12288#12288#35009#12288#12288#20181#12288#12288#27096)
          ParentFont = False
          VAlign = vaCenter
        end
        object Line86: TfrxLineView
          Left = 328.062992125984000000
          Top = 1137.638530000000000000
          Height = 139.842610000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line87: TfrxLineView
          Left = 451.653533540000000000
          Top = 1137.638530000000000000
          Height = 139.842519690000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line91: TfrxLineView
          Left = 419.527549290000000000
          Top = 1137.638530000000000000
          Height = 139.842610000000000000
          Color = clBlack
          Frame.ShadowWidth = 1.000000000000000000
          Frame.Style = fsDot
          Frame.Typ = [ftLeft]
        end
        object Line88: TfrxLineView
          Top = 1152.756650000000000000
          Width = 672.756071500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line89: TfrxLineView
          Top = 1194.331480000000000000
          Width = 672.756071500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line90: TfrxLineView
          Top = 1235.906310000000000000
          Width = 672.756071500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line92: TfrxLineView
          Top = 1277.480314960000000000
          Width = 672.756071500000000000
          Color = clBlack
          Frame.Typ = [ftTop]
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
      object Child1: TfrxChild
        FillType = ftBrush
        Height = 41.574803150000000000
        Top = 294.803340000000000000
        Visible = False
        Width = 925.984850000000000000
        object Memo33: TfrxMemoView
          Left = 7.559060000000000000
          Width = 166.299320000000000000
          Height = 20.787401570000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35443#32048#12487#12540#12479'001'#23376#12496#12531#12489)
          ParentFont = False
          VAlign = vaBottom
        end
      end
      object Child2: TfrxChild
        FillType = ftBrush
        Height = 60.094488190000000000
        Top = 706.772110000000000000
        Width = 925.984850000000000000
        object Memo37: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.779530000000020000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35443#32048#12487#12540#12479'002'#23376#12496#12531#12489'Row1')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo34: TfrxMemoView
          Left = 7.559060000000000000
          Top = 22.677180000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35443#32048#12487#12540#12479'002'#23376#12496#12531#12489'Row2')
          ParentFont = False
          VAlign = vaBottom
        end
        object Memo35: TfrxMemoView
          Left = 7.559060000000000000
          Top = 41.574830000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            #35443#32048#12487#12540#12479'002'#23376#12496#12531#12489'Row3')
          ParentFont = False
          VAlign = vaBottom
        end
      end
    end
  end
end
