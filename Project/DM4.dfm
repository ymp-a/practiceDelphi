object DataModule4: TDataModule4
  OldCreateOrder = False
  Height = 261
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
    Params = <>
    ProviderName = 'DataSetProMTMFLP'
    Left = 213
    Top = 128
    object ClientDataSetMTMFLPMTNO: TIntegerField
      FieldName = 'MTNO'
      Required = True
    end
    object ClientDataSetMTMFLPMTGNO: TIntegerField
      FieldName = 'MTGNO'
      Required = True
    end
    object ClientDataSetMTMFLPMTSHCD: TStringField
      FieldName = 'MTSHCD'
      Size = 7
    end
    object ClientDataSetMTMFLPMTSHNM: TStringField
      FieldName = 'MTSHNM'
      Size = 100
    end
    object ClientDataSetMTMFLPMTTNKA: TBCDField
      FieldName = 'MTTNKA'
      Precision = 10
      Size = 2
    end
    object ClientDataSetMTMFLPMTSRYO: TIntegerField
      FieldName = 'MTSRYO'
    end
    object ClientDataSetMTMFLPMTKIN: TIntegerField
      FieldName = 'MTKIN'
    end
    object ClientDataSetMTMFLPMTBIKO: TStringField
      FieldName = 'MTBIKO'
      Size = 100
    end
    object ClientDataSetMTMFLPMTJTCD: TStringField
      FieldName = 'MTJTCD'
      Size = 1
    end
    object ClientDataSetMTMFLPchedel1: TBooleanField
      FieldKind = fkInternalCalc
      FieldName = 'chedel1'
    end
  end
  object DataSrcMTMFLP: TDataSource
    DataSet = ClientDataSetMTMFLP
    Left = 304
    Top = 128
  end
end
