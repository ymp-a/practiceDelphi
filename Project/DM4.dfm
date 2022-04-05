object DataModule4: TDataModule4
  OldCreateOrder = False
  Height = 556
  Width = 525
  object DataSrcMTHFLP: TDataSource
    DataSet = ClientDataSetMTHFLP
    Left = 304
    Top = 48
  end
  object ClientDataSetMTHFLP: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProMTHFLP'
    Left = 213
    Top = 48
    object ClientDataSetMTHFLPMHNO: TIntegerField
      FieldName = 'MHNO'
      Required = True
    end
    object ClientDataSetMTHFLPMHIRDT: TDateField
      FieldName = 'MHIRDT'
      OnSetText = ClientDataSetTDateFieldSetText
    end
    object ClientDataSetMTHFLPMHKGDT: TDateField
      FieldName = 'MHKGDT'
      OnSetText = ClientDataSetTDateFieldSetText
    end
    object ClientDataSetMTHFLPMHTKCD: TStringField
      FieldName = 'MHTKCD'
      Size = 5
    end
    object ClientDataSetMTHFLPMHTKNM: TStringField
      FieldName = 'MHTKNM'
      Size = 100
    end
    object ClientDataSetMTHFLPMHGSRO: TIntegerField
      FieldName = 'MHGSRO'
    end
    object ClientDataSetMTHFLPMHGKIN: TIntegerField
      FieldName = 'MHGKIN'
    end
    object ClientDataSetMTHFLPMHTNCD: TIntegerField
      FieldName = 'MHTNCD'
      Required = True
    end
    object ClientDataSetMTHFLPMHBIKO: TStringField
      FieldName = 'MHBIKO'
      Size = 100
    end
    object ClientDataSetMTHFLPMHJTCD: TStringField
      FieldName = 'MHJTCD'
      Size = 1
    end
  end
  object DataSetProMTHFLP: TDataSetProvider
    DataSet = FDQryMTHFLP
    Left = 114
    Top = 48
  end
  object FDQryMTHFLP: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM MTHFLP')
    Left = 32
    Top = 48
    object FDQryMTHFLPMHNO: TIntegerField
      FieldName = 'MHNO'
      Origin = 'MHNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQryMTHFLPMHIRDT: TDateField
      FieldName = 'MHIRDT'
      Origin = 'MHIRDT'
    end
    object FDQryMTHFLPMHKGDT: TDateField
      FieldName = 'MHKGDT'
      Origin = 'MHKGDT'
    end
    object FDQryMTHFLPMHTKCD: TStringField
      FieldName = 'MHTKCD'
      Origin = 'MHTKCD'
      Size = 5
    end
    object FDQryMTHFLPMHTKNM: TStringField
      FieldName = 'MHTKNM'
      Origin = 'MHTKNM'
      Size = 100
    end
    object FDQryMTHFLPMHGSRO: TIntegerField
      FieldName = 'MHGSRO'
      Origin = 'MHGSRO'
    end
    object FDQryMTHFLPMHGKIN: TIntegerField
      FieldName = 'MHGKIN'
      Origin = 'MHGKIN'
    end
    object FDQryMTHFLPMHTNCD: TIntegerField
      FieldName = 'MHTNCD'
      Origin = 'MHTNCD'
      Required = True
    end
    object FDQryMTHFLPMHBIKO: TStringField
      FieldName = 'MHBIKO'
      Origin = 'MHBIKO'
      Size = 100
    end
    object FDQryMTHFLPMHJTCD: TStringField
      FieldName = 'MHJTCD'
      Origin = 'MHJTCD'
      Size = 1
    end
  end
  object FDQryMTMFLP: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM MTMFLP')
    Left = 32
    Top = 128
    object FDQryMTMFLPMTNO: TIntegerField
      FieldName = 'MTNO'
      Origin = 'MTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQryMTMFLPMTGNO: TIntegerField
      FieldName = 'MTGNO'
      Origin = 'MTGNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQryMTMFLPMTSHCD: TStringField
      FieldName = 'MTSHCD'
      Origin = 'MTSHCD'
      Size = 7
    end
    object FDQryMTMFLPMTSHNM: TStringField
      FieldName = 'MTSHNM'
      Origin = 'MTSHNM'
      Size = 100
    end
    object FDQryMTMFLPMTTNKA: TBCDField
      FieldName = 'MTTNKA'
      Origin = 'MTTNKA'
      Precision = 10
      Size = 2
    end
    object FDQryMTMFLPMTSRYO: TIntegerField
      FieldName = 'MTSRYO'
      Origin = 'MTSRYO'
    end
    object FDQryMTMFLPMTKIN: TIntegerField
      FieldName = 'MTKIN'
      Origin = 'MTKIN'
    end
    object FDQryMTMFLPMTBIKO: TStringField
      FieldName = 'MTBIKO'
      Origin = 'MTBIKO'
      Size = 100
    end
    object FDQryMTMFLPMTJTCD: TStringField
      FieldName = 'MTJTCD'
      Origin = 'MTJTCD'
      Size = 1
    end
  end
  object DataSetProMTMFLP: TDataSetProvider
    DataSet = FDQryMTMFLP
    Left = 114
    Top = 128
  end
  object ClientDataSetMTMFLP: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProMTMFLP'
    Left = 213
    Top = 128
    object ClientDataSetMTMFLPMTNO: TIntegerField
      FieldName = 'MTNO'
      Origin = 'MTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSetMTMFLPMTGNO: TIntegerField
      FieldName = 'MTGNO'
      KeyFields = 'MTGNO'
      Origin = 'MTGNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSetMTMFLPMTSHCD: TStringField
      FieldName = 'MTSHCD'
      Origin = 'MTSHCD'
      Size = 7
    end
    object ClientDataSetMTMFLPMTSHNM: TStringField
      FieldName = 'MTSHNM'
      Origin = 'MTSHNM'
      Size = 100
    end
    object ClientDataSetMTMFLPMTTNKA: TBCDField
      FieldName = 'MTTNKA'
      Origin = 'MTTNKA'
      DisplayFormat = '###,###,###'
      EditFormat = '###,###,###'
      Precision = 10
      Size = 2
    end
    object ClientDataSetMTMFLPMTSRYO: TIntegerField
      FieldName = 'MTSRYO'
      Origin = 'MTSRYO'
      DisplayFormat = '###,###,###'
      EditFormat = '###,###,###'
    end
    object ClientDataSetMTMFLPMTKIN: TIntegerField
      FieldName = 'MTKIN'
      Origin = 'MTKIN'
      DisplayFormat = '###,###,###'
      EditFormat = '###,###,###'
    end
    object ClientDataSetMTMFLPMTBIKO: TStringField
      FieldName = 'MTBIKO'
      Origin = 'MTBIKO'
      Size = 100
    end
    object ClientDataSetMTMFLPMTJTCD: TStringField
      FieldName = 'MTJTCD'
      Origin = 'MTJTCD'
      Size = 1
    end
    object ClientDataSetMTMFLPdataJTCD: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'dataJTCD'
    end
    object ClientDataSetMTMFLPsumSRYO: TAggregateField
      FieldName = 'sumSRYO'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,###'
      Expression = 'SUM(MTSRYO)'
    end
    object ClientDataSetMTMFLPsumKIN: TAggregateField
      FieldName = 'sumKIN'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,###'
      Expression = 'SUM(MTKIN)'
    end
  end
  object DataSrcMTMFLP: TDataSource
    DataSet = ClientDataSetMTMFLP
    Left = 304
    Top = 128
  end
  object FDQryF0004: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'select * from mthflp'
      'left join tnmmsp on tntncd = mhtncd')
    Left = 32
    Top = 200
    object IntegerField1: TIntegerField
      FieldName = 'MHNO'
      Origin = 'MHNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DateField1: TDateField
      FieldName = 'MHIRDT'
      Origin = 'MHIRDT'
    end
    object DateField2: TDateField
      FieldName = 'MHKGDT'
      Origin = 'MHKGDT'
    end
    object StringField1: TStringField
      FieldName = 'MHTKCD'
      Origin = 'MHTKCD'
      Size = 5
    end
    object StringField2: TStringField
      FieldName = 'MHTKNM'
      Origin = 'MHTKNM'
      Size = 100
    end
    object IntegerField2: TIntegerField
      FieldName = 'MHGSRO'
      Origin = 'MHGSRO'
      DisplayFormat = '###,###,###'
    end
    object IntegerField3: TIntegerField
      FieldName = 'MHGKIN'
      Origin = 'MHGKIN'
      DisplayFormat = '###,###,###'
    end
    object IntegerField4: TIntegerField
      FieldName = 'MHTNCD'
      Origin = 'MHTNCD'
      Required = True
    end
    object StringField3: TStringField
      FieldName = 'MHBIKO'
      Origin = 'MHBIKO'
      Size = 100
    end
    object StringField4: TStringField
      FieldName = 'MHJTCD'
      Origin = 'MHJTCD'
      Size = 1
    end
    object FDQryF0004TNTNCD: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
    end
    object FDQryF0004TNBKCD: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object FDQryF0004TNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object FDQryF0004TNNAME: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object FDQryF0004TNKGKB: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object FDQryF0004TNSTKB: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object FDQryF0004TNPWLA: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object FDQryF0004TNCRDT: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object FDQryF0004TNCRTM: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object FDQryF0004TNCRPG: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object FDQryF0004TNCRWS: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object FDQryF0004TNCRUS: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object FDQryF0004TNUPDT: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object FDQryF0004TNUPTM: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object FDQryF0004TNUPPG: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object FDQryF0004TNUPWS: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object FDQryF0004TNUPUS: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object FDQryF0004TNJTCD: TStringField
      FieldName = 'TNJTCD'
      Origin = 'TNJTCD'
      Size = 1
    end
  end
  object DataSrcF0004: TDataSource
    AutoEdit = False
    DataSet = ClientDataSetF0004
    Left = 304
    Top = 200
  end
  object DataSetProF0004: TDataSetProvider
    DataSet = FDQryF0004
    Left = 112
    Top = 200
  end
  object ClientDataSetF0004: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProF0004'
    Left = 208
    Top = 200
    object ClientDataSetF0004MHNO: TIntegerField
      FieldName = 'MHNO'
      Origin = 'MHNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSetF0004MHIRDT: TDateField
      FieldName = 'MHIRDT'
      Origin = 'MHIRDT'
    end
    object ClientDataSetF0004MHKGDT: TDateField
      FieldName = 'MHKGDT'
      Origin = 'MHKGDT'
    end
    object ClientDataSetF0004MHTKCD: TStringField
      FieldName = 'MHTKCD'
      Origin = 'MHTKCD'
      Size = 5
    end
    object ClientDataSetF0004MHTKNM: TStringField
      FieldName = 'MHTKNM'
      Origin = 'MHTKNM'
      Size = 100
    end
    object ClientDataSetF0004MHGSRO: TIntegerField
      FieldName = 'MHGSRO'
      Origin = 'MHGSRO'
      DisplayFormat = '###,###,###'
    end
    object ClientDataSetF0004MHGKIN: TIntegerField
      FieldName = 'MHGKIN'
      Origin = 'MHGKIN'
      DisplayFormat = '###,###,###'
    end
    object ClientDataSetF0004MHTNCD: TIntegerField
      FieldName = 'MHTNCD'
      Origin = 'MHTNCD'
      Required = True
    end
    object ClientDataSetF0004MHBIKO: TStringField
      FieldName = 'MHBIKO'
      Origin = 'MHBIKO'
      Size = 100
    end
    object ClientDataSetF0004MHJTCD: TStringField
      FieldName = 'MHJTCD'
      Origin = 'MHJTCD'
      Size = 1
    end
    object ClientDataSetF0004TNTNCD: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
    end
    object ClientDataSetF0004TNBKCD: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object ClientDataSetF0004TNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object ClientDataSetF0004TNNAME: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object ClientDataSetF0004TNKGKB: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object ClientDataSetF0004TNSTKB: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object ClientDataSetF0004TNPWLA: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object ClientDataSetF0004TNCRDT: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object ClientDataSetF0004TNCRTM: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object ClientDataSetF0004TNCRPG: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object ClientDataSetF0004TNCRWS: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object ClientDataSetF0004TNCRUS: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object ClientDataSetF0004TNUPDT: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object ClientDataSetF0004TNUPTM: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object ClientDataSetF0004TNUPPG: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object ClientDataSetF0004TNUPWS: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object ClientDataSetF0004TNUPUS: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object ClientDataSetF0004TNJTCD: TStringField
      FieldName = 'TNJTCD'
      Origin = 'TNJTCD'
      Size = 1
    end
  end
  object DataSrc_IH001_MTH: TDataSource
    DataSet = CDS_IH001_MTH
    Left = 304
    Top = 296
  end
  object CDS_IH001_MTH: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProIH001_MTH'
    Left = 213
    Top = 296
    object IntegerField5: TIntegerField
      FieldName = 'MHNO'
      Required = True
    end
    object DateField3: TDateField
      FieldName = 'MHIRDT'
      OnSetText = ClientDataSetTDateFieldSetText
    end
    object DateField4: TDateField
      FieldName = 'MHKGDT'
      OnSetText = ClientDataSetTDateFieldSetText
    end
    object StringField5: TStringField
      FieldName = 'MHTKCD'
      Size = 5
    end
    object StringField6: TStringField
      FieldName = 'MHTKNM'
      Size = 100
    end
    object IntegerField6: TIntegerField
      FieldName = 'MHGSRO'
    end
    object IntegerField7: TIntegerField
      FieldName = 'MHGKIN'
    end
    object IntegerField8: TIntegerField
      FieldName = 'MHTNCD'
      Required = True
    end
    object StringField7: TStringField
      FieldName = 'MHBIKO'
      Size = 100
    end
    object StringField8: TStringField
      FieldName = 'MHJTCD'
      Size = 1
    end
  end
  object DataSetProIH001_MTH: TDataSetProvider
    DataSet = IH001_MTH
    Left = 114
    Top = 296
  end
  object IH001_MTH: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM MTHFLP')
    Left = 32
    Top = 296
    object IntegerField9: TIntegerField
      FieldName = 'MHNO'
      Origin = 'MHNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DateField5: TDateField
      FieldName = 'MHIRDT'
      Origin = 'MHIRDT'
    end
    object DateField6: TDateField
      FieldName = 'MHKGDT'
      Origin = 'MHKGDT'
    end
    object StringField9: TStringField
      FieldName = 'MHTKCD'
      Origin = 'MHTKCD'
      Size = 5
    end
    object StringField10: TStringField
      FieldName = 'MHTKNM'
      Origin = 'MHTKNM'
      Size = 100
    end
    object IntegerField10: TIntegerField
      FieldName = 'MHGSRO'
      Origin = 'MHGSRO'
    end
    object IntegerField11: TIntegerField
      FieldName = 'MHGKIN'
      Origin = 'MHGKIN'
    end
    object IntegerField12: TIntegerField
      FieldName = 'MHTNCD'
      Origin = 'MHTNCD'
      Required = True
    end
    object StringField11: TStringField
      FieldName = 'MHBIKO'
      Origin = 'MHBIKO'
      Size = 100
    end
    object StringField12: TStringField
      FieldName = 'MHJTCD'
      Origin = 'MHJTCD'
      Size = 1
    end
  end
  object IH001_MTM: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM MTMFLP')
    Left = 32
    Top = 376
    object IntegerField13: TIntegerField
      FieldName = 'MTNO'
      Origin = 'MTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField14: TIntegerField
      FieldName = 'MTGNO'
      Origin = 'MTGNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField13: TStringField
      FieldName = 'MTSHCD'
      Origin = 'MTSHCD'
      Size = 7
    end
    object StringField14: TStringField
      FieldName = 'MTSHNM'
      Origin = 'MTSHNM'
      Size = 100
    end
    object BCDField1: TBCDField
      FieldName = 'MTTNKA'
      Origin = 'MTTNKA'
      Precision = 10
      Size = 2
    end
    object IntegerField15: TIntegerField
      FieldName = 'MTSRYO'
      Origin = 'MTSRYO'
    end
    object IntegerField16: TIntegerField
      FieldName = 'MTKIN'
      Origin = 'MTKIN'
    end
    object StringField15: TStringField
      FieldName = 'MTBIKO'
      Origin = 'MTBIKO'
      Size = 100
    end
    object StringField16: TStringField
      FieldName = 'MTJTCD'
      Origin = 'MTJTCD'
      Size = 1
    end
  end
  object DataSetProIH001_MTM: TDataSetProvider
    DataSet = IH001_MTM
    Left = 114
    Top = 376
  end
  object CDS_IH001_MTM: TClientDataSet
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    ProviderName = 'DataSetProIH001_MTM'
    Left = 213
    Top = 376
    object IntegerField17: TIntegerField
      FieldName = 'MTNO'
      Origin = 'MTNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IntegerField18: TIntegerField
      FieldName = 'MTGNO'
      KeyFields = 'MTGNO'
      Origin = 'MTGNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object StringField17: TStringField
      FieldName = 'MTSHCD'
      Origin = 'MTSHCD'
      Size = 7
    end
    object StringField18: TStringField
      FieldName = 'MTSHNM'
      Origin = 'MTSHNM'
      Size = 100
    end
    object BCDField2: TBCDField
      FieldName = 'MTTNKA'
      Origin = 'MTTNKA'
      DisplayFormat = '###,###,###'
      EditFormat = '###,###,###'
      Precision = 10
      Size = 2
    end
    object IntegerField19: TIntegerField
      FieldName = 'MTSRYO'
      Origin = 'MTSRYO'
      DisplayFormat = '###,###,###'
      EditFormat = '###,###,###'
    end
    object IntegerField20: TIntegerField
      FieldName = 'MTKIN'
      Origin = 'MTKIN'
      DisplayFormat = '###,###,###'
      EditFormat = '###,###,###'
    end
    object StringField19: TStringField
      FieldName = 'MTBIKO'
      Origin = 'MTBIKO'
      Size = 100
    end
    object StringField20: TStringField
      FieldName = 'MTJTCD'
      Origin = 'MTJTCD'
      Size = 1
    end
    object BooleanField1: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'dataJTCD'
    end
    object AggregateField1: TAggregateField
      FieldName = 'sumSRYO'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,###'
      Expression = 'SUM(MTSRYO)'
    end
    object AggregateField2: TAggregateField
      FieldName = 'sumKIN'
      Active = True
      DisplayName = ''
      DisplayFormat = '###,###,###'
      Expression = 'SUM(MTKIN)'
    end
  end
  object DataSrc_IH001_MTM: TDataSource
    DataSet = CDS_IH001_MTM
    Left = 304
    Top = 376
  end
  object FDQryIH002: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    SQL.Strings = (
      'select * from mthflp'
      'left join tnmmsp on tntncd = mhtncd')
    Left = 32
    Top = 448
    object IntegerField21: TIntegerField
      FieldName = 'MHNO'
      Origin = 'MHNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DateField7: TDateField
      FieldName = 'MHIRDT'
      Origin = 'MHIRDT'
    end
    object DateField8: TDateField
      FieldName = 'MHKGDT'
      Origin = 'MHKGDT'
    end
    object StringField21: TStringField
      FieldName = 'MHTKCD'
      Origin = 'MHTKCD'
      Size = 5
    end
    object StringField22: TStringField
      FieldName = 'MHTKNM'
      Origin = 'MHTKNM'
      Size = 100
    end
    object IntegerField22: TIntegerField
      FieldName = 'MHGSRO'
      Origin = 'MHGSRO'
      DisplayFormat = '###,###,###'
    end
    object IntegerField23: TIntegerField
      FieldName = 'MHGKIN'
      Origin = 'MHGKIN'
      DisplayFormat = '###,###,###'
    end
    object IntegerField24: TIntegerField
      FieldName = 'MHTNCD'
      Origin = 'MHTNCD'
      Required = True
    end
    object StringField23: TStringField
      FieldName = 'MHBIKO'
      Origin = 'MHBIKO'
      Size = 100
    end
    object StringField24: TStringField
      FieldName = 'MHJTCD'
      Origin = 'MHJTCD'
      Size = 1
    end
    object IntegerField25: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
    end
    object IntegerField26: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object VarBytesField1: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object StringField25: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object StringField26: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object StringField27: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object DateField9: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object DateField10: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object TimeField1: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object StringField28: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object StringField29: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object StringField30: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object DateField11: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object TimeField2: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object StringField31: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object StringField32: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object StringField33: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object StringField34: TStringField
      FieldName = 'TNJTCD'
      Origin = 'TNJTCD'
      Size = 1
    end
  end
  object DataSrc_IH002: TDataSource
    DataSet = CDS_IH002
    Left = 304
    Top = 448
  end
  object DataSetProIH002: TDataSetProvider
    DataSet = FDQryIH002
    Left = 112
    Top = 448
  end
  object CDS_IH002: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProIH002'
    Left = 208
    Top = 448
    object IntegerField27: TIntegerField
      FieldName = 'MHNO'
      Origin = 'MHNO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object DateField12: TDateField
      FieldName = 'MHIRDT'
      Origin = 'MHIRDT'
    end
    object DateField13: TDateField
      FieldName = 'MHKGDT'
      Origin = 'MHKGDT'
    end
    object StringField35: TStringField
      FieldName = 'MHTKCD'
      Origin = 'MHTKCD'
      Size = 5
    end
    object StringField36: TStringField
      FieldName = 'MHTKNM'
      Origin = 'MHTKNM'
      Size = 100
    end
    object IntegerField28: TIntegerField
      FieldName = 'MHGSRO'
      Origin = 'MHGSRO'
      DisplayFormat = '###,###,###'
    end
    object IntegerField29: TIntegerField
      FieldName = 'MHGKIN'
      Origin = 'MHGKIN'
      DisplayFormat = '###,###,###'
    end
    object IntegerField30: TIntegerField
      FieldName = 'MHTNCD'
      Origin = 'MHTNCD'
      Required = True
    end
    object StringField37: TStringField
      FieldName = 'MHBIKO'
      Origin = 'MHBIKO'
      Size = 100
    end
    object StringField38: TStringField
      FieldName = 'MHJTCD'
      Origin = 'MHJTCD'
      Size = 1
    end
    object IntegerField31: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
    end
    object IntegerField32: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object VarBytesField2: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object StringField39: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object StringField40: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object StringField41: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object DateField14: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object DateField15: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object TimeField3: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object StringField42: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object StringField43: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object StringField44: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object DateField16: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object TimeField4: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object StringField45: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object StringField46: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object StringField47: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object StringField48: TStringField
      FieldName = 'TNJTCD'
      Origin = 'TNJTCD'
      Size = 1
    end
  end
  object FDQryGene: TFDQuery
    Connection = dmUtilYbs.FDConnection1
    Left = 448
    Top = 304
  end
  object DataSource4: TDataSource
    DataSet = FDQryGene
    Left = 448
    Top = 376
  end
end
