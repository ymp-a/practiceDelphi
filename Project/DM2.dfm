object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 599
  Width = 463
  object FDQryTNMMSP: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM TNMMSP')
    Left = 56
    Top = 56
  end
  object DataSrcTNMMSP: TDataSource
    DataSet = FDQryTNMMSP
    Left = 304
    Top = 56
  end
  object ClientDataSetTNMMSP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProTNMMSP'
    Left = 221
    Top = 56
    object ClientDataSetTNMMSPTNTNCD: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSetTNMMSPTNBKCD: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object ClientDataSetTNMMSPTNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object ClientDataSetTNMMSPTNNAME: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object ClientDataSetTNMMSPTNKGKB: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object ClientDataSetTNMMSPTNSTKB: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object ClientDataSetTNMMSPTNPWLA: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object ClientDataSetTNMMSPTNCRDT: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object ClientDataSetTNMMSPTNCRTM: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object ClientDataSetTNMMSPTNCRPG: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object ClientDataSetTNMMSPTNCRWS: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object ClientDataSetTNMMSPTNCRUS: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object ClientDataSetTNMMSPTNUPDT: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object ClientDataSetTNMMSPTNUPTM: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object ClientDataSetTNMMSPTNUPPG: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object ClientDataSetTNMMSPTNUPWS: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object ClientDataSetTNMMSPTNUPUS: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object ClientDataSetTNMMSPTNJTCD: TStringField
      FieldName = 'TNJTCD'
      Origin = 'TNJTCD'
      Size = 1
    end
  end
  object DataSetProTNMMSP: TDataSetProvider
    DataSet = FDQryTNMMSP
    Left = 138
    Top = 56
  end
  object FDQry1: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM TNMMSP')
    Left = 56
    Top = 128
    object FDQry1TNTNCD: TIntegerField
      FieldName = 'TNTNCD'
      Required = True
    end
    object FDQry1TNBKCD: TIntegerField
      FieldName = 'TNBKCD'
    end
    object FDQry1TNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Size = 2000
    end
    object FDQry1TNNAME: TStringField
      FieldName = 'TNNAME'
      Size = 16
    end
    object FDQry1TNKGKB: TStringField
      FieldName = 'TNKGKB'
      Size = 1
    end
    object FDQry1TNSTKB: TStringField
      FieldName = 'TNSTKB'
      Size = 4
    end
    object FDQry1TNPWLA: TDateField
      FieldName = 'TNPWLA'
    end
    object FDQry1TNCRDT: TDateField
      FieldName = 'TNCRDT'
    end
    object FDQry1TNCRTM: TTimeField
      FieldName = 'TNCRTM'
    end
    object FDQry1TNCRPG: TStringField
      FieldName = 'TNCRPG'
    end
    object FDQry1TNCRWS: TStringField
      FieldName = 'TNCRWS'
    end
    object FDQry1TNCRUS: TStringField
      FieldName = 'TNCRUS'
    end
    object FDQry1TNUPDT: TDateField
      FieldName = 'TNUPDT'
    end
    object FDQry1TNUPTM: TTimeField
      FieldName = 'TNUPTM'
    end
    object FDQry1TNUPPG: TStringField
      FieldName = 'TNUPPG'
    end
    object FDQry1TNUPWS: TStringField
      FieldName = 'TNUPWS'
    end
    object FDQry1TNUPUS: TStringField
      FieldName = 'TNUPUS'
    end
    object FDQry1TNJTCD: TStringField
      FieldName = 'TNJTCD'
      Size = 1
    end
  end
  object DataSrc1: TDataSource
    DataSet = FDQry1
    Left = 136
    Top = 128
  end
  object FDQryIH004: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM TNMMSP')
    Left = 56
    Top = 224
  end
  object DataSetProIH004: TDataSetProvider
    DataSet = FDQryIH004
    Left = 138
    Top = 224
  end
  object CDS_IH004: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProIH004'
    Left = 221
    Top = 224
    object IntegerField1: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField2: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object VarBytesField1: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object StringField1: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object StringField2: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object StringField3: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object DateField1: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object DateField2: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object TimeField1: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object StringField4: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object StringField5: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object StringField6: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object DateField3: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object TimeField2: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object StringField7: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object StringField8: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object StringField9: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object StringField10: TStringField
      FieldName = 'TNJTCD'
      Origin = 'TNJTCD'
      Size = 1
    end
    object CDS_IH004TNKGNM: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'TNKGNM'
    end
  end
  object DataSrc_IH004: TDataSource
    DataSet = CDS_IH004
    Left = 304
    Top = 224
  end
  object DataSrc_IH003: TDataSource
    DataSet = CDS_IH003
    Left = 304
    Top = 288
  end
  object CDS_IH003: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProIH003'
    Left = 221
    Top = 288
    object IntegerField3: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField4: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object VarBytesField2: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object StringField11: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object StringField12: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object StringField13: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object DateField4: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object DateField5: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object TimeField3: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object StringField14: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object StringField15: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object StringField16: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object DateField6: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object TimeField4: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object StringField17: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object StringField18: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object StringField19: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object StringField20: TStringField
      FieldName = 'TNJTCD'
      Origin = 'TNJTCD'
      Size = 1
    end
  end
  object DataSetProIH003: TDataSetProvider
    DataSet = FDQryIH003
    Left = 138
    Top = 288
  end
  object FDQryIH003: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM TNMMSP')
    Left = 56
    Top = 288
  end
  object FDQryGene: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM TNMMSP')
    Left = 56
    Top = 352
  end
  object DataSource2: TDataSource
    DataSet = FDQryGene
    Left = 296
    Top = 352
  end
  object FDQryIH005: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'select  DENSE_RANK() OVER(ORDER BY T.OldMTNO) AS NewMTNO,'
      'T.MHIRDT,T.MHNO,T.MHTKNM'
      'FROM'
      '(select'
      
        '(case when (MTGNO > 3) and (MTGNO % 3 = 0) then (RANK() OVER(ORD' +
        'ER BY MHIRDT,MHTKCD))+(MTGNO/3-1)'
      ' else  '
      
        '  (case when (MTGNO > 3) and (MTGNO % 3 = 2) then (RANK() OVER(O' +
        'RDER BY MHIRDT,MHTKCD))+(MTGNO/3) '
      ' else '
      
        '  (case when (MTGNO > 3) and (MTGNO % 3 = 1) then (RANK() OVER(O' +
        'RDER BY MHIRDT,MHTKCD))+(MTGNO/3) '
      ' else '
      '  (RANK() OVER(ORDER BY MHIRDT,MHTKCD)) end)end)end) AS OldMTNO,'
      ''
      '--RANK() OVER(ORDER BY MHIRDT,MHTKCD) AS RGHD,'
      '--RANK() OVER(ORDER BY MHIRDT,MHTKCD) AS RNT, '
      '--DENSE_RANK() OVER(ORDER BY MHIRDT,MHTKCD) AS DRNT, '
      '(case when (MTGNO % 3 = 1) then 1 '
      ' else'
      '  (case when (MTGNO % 3 = 2) then 2 '
      '   else '
      '    (case when (MTGNO % 3 = 0) then 3 '
      #9' else '
      #9'  0 end) end) end) as NewGNO,'
      ' '
      ' MH.*,'
      ' MM.*'
      ''
      'from MTMFLP AS MM'
      'LEFT JOIN MTHFLP AS MH'
      'ON MM.MTNO = MH.MHNO) AS T'
      ''
      ''
      'WHERE 1=1'
      'and T.MHTKCD=004'
      'GROUP BY T.OldMTNO,T.MHIRDT,T.MHNO,T.MHTKNM')
    Left = 56
    Top = 408
  end
  object DataSetProIH005: TDataSetProvider
    DataSet = FDQryIH005
    Left = 138
    Top = 408
  end
  object CDS_IH005: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProIH005'
    Left = 221
    Top = 408
    object CDS_IH005MHIRDT: TDateField
      FieldName = 'MHIRDT'
      Origin = 'MHIRDT'
    end
    object CDS_IH005MHNO: TIntegerField
      FieldName = 'MHNO'
      Origin = 'MHNO'
    end
    object CDS_IH005MHTKNM: TStringField
      FieldName = 'MHTKNM'
      Origin = 'MHTKNM'
      Size = 100
    end
    object CDS_IH005NewMTNO: TLargeintField
      FieldName = 'NewMTNO'
      Origin = 'NewMTNO'
      ReadOnly = True
    end
  end
  object DataSrc_IH005: TDataSource
    DataSet = CDS_IH005
    Left = 304
    Top = 408
  end
  object frxDBDatasetIH005: TfrxDBDataset
    UserName = 'frxDBDatasetIH005'
    CloseDataSource = False
    FieldAliases.Strings = (
      'MHIRDT=MHIRDT'
      'MHNO=MHNO'
      'MHTKNM=MHTKNM'
      'NewMTNO=NewMTNO')
    DataSet = CDS_IH005
    BCDToCurrency = False
    Left = 392
    Top = 408
  end
  object DataSrcIH005MS: TDataSource
    DataSet = CDS_IH005MS
    Left = 304
    Top = 488
  end
  object frxDBDatasetIH005MS: TfrxDBDataset
    UserName = 'frxDBDatasetIH005MS'
    CloseDataSource = False
    FieldAliases.Strings = (
      'NewMTNO=NewMTNO'
      'OldMTNO=OldMTNO'
      'NewGNO=NewGNO'
      'MHNO=MHNO'
      'MHIRDT=MHIRDT'
      'MHKGDT=MHKGDT'
      'MHTKCD=MHTKCD'
      'MHTKNM=MHTKNM'
      'MHGSRO=MHGSRO'
      'MHGKIN=MHGKIN'
      'MHTNCD=MHTNCD'
      'MHBIKO=MHBIKO'
      'MHJTCD=MHJTCD'
      'MTNO=MTNO'
      'MTGNO=MTGNO'
      'MTSHCD=MTSHCD'
      'MTSHNM=MTSHNM'
      'MTTNKA=MTTNKA'
      'MTSRYO=MTSRYO'
      'MTKIN=MTKIN'
      'MTBIKO=MTBIKO'
      'MTJTCD=MTJTCD')
    DataSet = CDS_IH005MS
    BCDToCurrency = False
    Left = 384
    Top = 488
  end
  object FDQryIH005MS: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'select  DENSE_RANK() OVER(ORDER BY T.OldMTNO) AS NewMTNO,'
      'T.*'
      'FROM'
      '(select'
      
        '(case when (MTGNO > 3) and (MTGNO % 3 = 0) then (RANK() OVER(ORD' +
        'ER BY MHIRDT,MHTKCD))+(MTGNO/3-1)'
      ' else  '
      
        '  (case when (MTGNO > 3) and (MTGNO % 3 = 2) then (RANK() OVER(O' +
        'RDER BY MHIRDT,MHTKCD))+(MTGNO/3) '
      ' else '
      
        '  (case when (MTGNO > 3) and (MTGNO % 3 = 1) then (RANK() OVER(O' +
        'RDER BY MHIRDT,MHTKCD))+(MTGNO/3) '
      ' else '
      '  (RANK() OVER(ORDER BY MHIRDT,MHTKCD)) end)end)end) AS OldMTNO,'
      ''
      '(case when (MTGNO % 3 = 1) then 1 '
      ' else'
      '  (case when (MTGNO % 3 = 2) then 2 '
      '   else '
      '    (case when (MTGNO % 3 = 0) then 3 '
      #9' else '
      #9'  0 end) end) end) as NewGNO,'
      ' '
      ' MH.*,'
      ' MM.*'
      ''
      'from MTMFLP AS MM'
      'LEFT JOIN MTHFLP AS MH'
      'ON MM.MTNO = MH.MHNO) AS T'
      ''
      ''
      'WHERE 1=1'
      'and T.MHTKCD='#39'004'#39)
    Left = 56
    Top = 488
  end
  object DataSetProIH005MS: TDataSetProvider
    DataSet = FDQryIH005MS
    Left = 138
    Top = 488
  end
  object CDS_IH005MS: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProIH005MS'
    Left = 221
    Top = 488
    object CDS_IH005MSNewMTNO: TLargeintField
      FieldName = 'NewMTNO'
      Origin = 'NewMTNO'
      ReadOnly = True
    end
    object CDS_IH005MSOldMTNO: TLargeintField
      FieldName = 'OldMTNO'
      Origin = 'OldMTNO'
      ReadOnly = True
    end
    object CDS_IH005MSNewGNO: TIntegerField
      FieldName = 'NewGNO'
      Origin = 'NewGNO'
      ReadOnly = True
      Required = True
    end
    object CDS_IH005MSMHNO: TIntegerField
      FieldName = 'MHNO'
      Origin = 'MHNO'
    end
    object CDS_IH005MSMHIRDT: TDateField
      FieldName = 'MHIRDT'
      Origin = 'MHIRDT'
    end
    object CDS_IH005MSMHKGDT: TDateField
      FieldName = 'MHKGDT'
      Origin = 'MHKGDT'
    end
    object CDS_IH005MSMHTKCD: TStringField
      FieldName = 'MHTKCD'
      Origin = 'MHTKCD'
      Size = 5
    end
    object CDS_IH005MSMHTKNM: TStringField
      FieldName = 'MHTKNM'
      Origin = 'MHTKNM'
      Size = 100
    end
    object CDS_IH005MSMHGSRO: TIntegerField
      FieldName = 'MHGSRO'
      Origin = 'MHGSRO'
    end
    object CDS_IH005MSMHGKIN: TIntegerField
      FieldName = 'MHGKIN'
      Origin = 'MHGKIN'
    end
    object CDS_IH005MSMHTNCD: TIntegerField
      FieldName = 'MHTNCD'
      Origin = 'MHTNCD'
    end
    object CDS_IH005MSMHBIKO: TStringField
      FieldName = 'MHBIKO'
      Origin = 'MHBIKO'
      Size = 100
    end
    object CDS_IH005MSMHJTCD: TStringField
      FieldName = 'MHJTCD'
      Origin = 'MHJTCD'
      Size = 1
    end
    object CDS_IH005MSMTNO: TIntegerField
      FieldName = 'MTNO'
      Origin = 'MTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDS_IH005MSMTGNO: TIntegerField
      FieldName = 'MTGNO'
      Origin = 'MTGNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDS_IH005MSMTSHCD: TStringField
      FieldName = 'MTSHCD'
      Origin = 'MTSHCD'
      Size = 7
    end
    object CDS_IH005MSMTSHNM: TStringField
      FieldName = 'MTSHNM'
      Origin = 'MTSHNM'
      Size = 100
    end
    object CDS_IH005MSMTTNKA: TBCDField
      FieldName = 'MTTNKA'
      Origin = 'MTTNKA'
      Precision = 10
      Size = 2
    end
    object CDS_IH005MSMTSRYO: TIntegerField
      FieldName = 'MTSRYO'
      Origin = 'MTSRYO'
    end
    object CDS_IH005MSMTKIN: TIntegerField
      FieldName = 'MTKIN'
      Origin = 'MTKIN'
    end
    object CDS_IH005MSMTBIKO: TStringField
      FieldName = 'MTBIKO'
      Origin = 'MTBIKO'
      Size = 100
    end
    object CDS_IH005MSMTJTCD: TStringField
      FieldName = 'MTJTCD'
      Origin = 'MTJTCD'
      Size = 1
    end
  end
end
