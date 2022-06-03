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
          Height = 24
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
  object frxReport1: TfrxReport
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
        Height = 49.133890000000000000
        Top = 105.826840000000000000
        Width = 869.291900000000000000
        Condition = 'frxDBDatasetIH005."MTNO"'
        KeepTogether = True
        ReprintOnNewPage = True
        object Memo1: TfrxMemoView
          Left = 151.181200000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DataModule2.frxDBDatasetIH005
          DataSetName = 'frxDBDatasetIH005'
          Memo.UTF8W = (
            '[frxDBDatasetIH005."MHNO"]')
        end
        object Memo3: TfrxMemoView
          Left = 234.330860000000000000
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
          Width = 107.201214550000000000
          Height = 16.492494550000000000
          Memo.UTF8W = (
            #12304'G'#12504#12483#12480#12540#37096#20998#12305)
        end
        object Memo5: TfrxMemoView
          Top = 22.677180000000000000
          Width = 107.201214550000000000
          Height = 16.492494550000000000
        end
        object Memo8: TfrxMemoView
          Left = 151.181200000000000000
          Top = 22.677180000000000000
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
        Top = 253.228510000000000000
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
        Top = 230.551330000000000000
        Width = 869.291900000000000000
        OnBeforePrint = 'Footer1OnBeforePrint'
        Child = frxReport1.Child1
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 30.236240000000000000
        Top = 177.637910000000000000
        Width = 869.291900000000000000
        OnAfterPrint = 'MasterData1OnAfterPrint'
        OnBeforePrint = 'MasterData1OnBeforePrint'
        Child = frxReport1.Child1
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
end
