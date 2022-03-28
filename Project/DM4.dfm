object DataModule4: TDataModule4
  OldCreateOrder = False
  Height = 344
  Width = 388
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
    Connection = DataModule2.FDConnection1
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
    Connection = DataModule2.FDConnection1
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
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'select * from mthflp'
      'left join tnmmsp on tntncd = mhtncd'
      '')
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
    end
    object IntegerField3: TIntegerField
      FieldName = 'MHGKIN'
      Origin = 'MHGKIN'
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
  end
end
