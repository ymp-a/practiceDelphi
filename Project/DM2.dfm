object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 296
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
    Left = 64
    Top = 152
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
    Left = 152
    Top = 160
  end
end
