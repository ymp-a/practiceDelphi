object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 296
  Width = 463
  object FDQryTNMMSP: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM TNMMSP'
      '')
    Left = 56
    Top = 56
    object FDQryTNMMSPTNTNCD: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQryTNMMSPTNBKCD: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object FDQryTNMMSPTNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object FDQryTNMMSPTNNAME: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object FDQryTNMMSPTNKGKB: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object FDQryTNMMSPTNSTKB: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object FDQryTNMMSPTNPWLA: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object FDQryTNMMSPTNCRDT: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object FDQryTNMMSPTNCRTM: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object FDQryTNMMSPTNCRPG: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object FDQryTNMMSPTNCRWS: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object FDQryTNMMSPTNCRUS: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object FDQryTNMMSPTNUPDT: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object FDQryTNMMSPTNUPTM: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object FDQryTNMMSPTNUPPG: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object FDQryTNMMSPTNUPWS: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object FDQryTNMMSPTNUPUS: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object FDQryTNMMSPTNJTCD: TStringField
      FieldName = 'TNJTCD'
      Origin = 'TNJTCD'
      Size = 1
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=std'
      'User_Name=sa'
      'Password=Pass1234'
      'ODBCAdvanced=MARS_Connection=YES'
      'Server=TOPC04'
      'OSAuthent=No'
      'DriverID=MSSQL')
    Left = 400
    Top = 8
  end
  object DataSrcTNMMSP: TDataSource
    DataSet = ClientDataSetTNMMSP
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
      Required = True
    end
    object ClientDataSetTNMMSPTNBKCD: TIntegerField
      FieldName = 'TNBKCD'
    end
    object ClientDataSetTNMMSPTNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Size = 2000
    end
    object ClientDataSetTNMMSPTNNAME: TStringField
      FieldName = 'TNNAME'
      Size = 16
    end
    object ClientDataSetTNMMSPTNKGKB: TStringField
      FieldName = 'TNKGKB'
      Size = 1
    end
    object ClientDataSetTNMMSPTNSTKB: TStringField
      FieldName = 'TNSTKB'
      Size = 4
    end
    object ClientDataSetTNMMSPTNPWLA: TDateField
      FieldName = 'TNPWLA'
    end
    object ClientDataSetTNMMSPTNCRDT: TDateField
      FieldName = 'TNCRDT'
    end
    object ClientDataSetTNMMSPTNCRTM: TTimeField
      FieldName = 'TNCRTM'
    end
    object ClientDataSetTNMMSPTNCRPG: TStringField
      FieldName = 'TNCRPG'
    end
    object ClientDataSetTNMMSPTNCRWS: TStringField
      FieldName = 'TNCRWS'
    end
    object ClientDataSetTNMMSPTNCRUS: TStringField
      FieldName = 'TNCRUS'
    end
    object ClientDataSetTNMMSPTNUPDT: TDateField
      FieldName = 'TNUPDT'
    end
    object ClientDataSetTNMMSPTNUPTM: TTimeField
      FieldName = 'TNUPTM'
    end
    object ClientDataSetTNMMSPTNUPPG: TStringField
      FieldName = 'TNUPPG'
    end
    object ClientDataSetTNMMSPTNUPWS: TStringField
      FieldName = 'TNUPWS'
    end
    object ClientDataSetTNMMSPTNUPUS: TStringField
      FieldName = 'TNUPUS'
    end
    object ClientDataSetTNMMSPTNJTCD: TStringField
      FieldName = 'TNJTCD'
      Size = 1
    end
  end
  object DataSetProTNMMSP: TDataSetProvider
    DataSet = FDQryTNMMSP
    Left = 138
    Top = 56
  end
end
