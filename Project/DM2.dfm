object DataModule2: TDataModule2
  OldCreateOrder = False
  Height = 296
  Width = 463
  object FDQueryLogin: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM TNMMSP'
      '')
    Left = 56
    Top = 56
    object FDQueryLoginTNTNCD: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryLoginTNBKCD: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object FDQueryLoginTNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object FDQueryLoginTNNAME: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object FDQueryLoginTNKGKB: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object FDQueryLoginTNSTKB: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object FDQueryLoginTNPWLA: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object FDQueryLoginTNCRDT: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object FDQueryLoginTNCRTM: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object FDQueryLoginTNCRPG: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object FDQueryLoginTNCRWS: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object FDQueryLoginTNCRUS: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object FDQueryLoginTNUPDT: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object FDQueryLoginTNUPTM: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object FDQueryLoginTNUPPG: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object FDQueryLoginTNUPWS: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object FDQueryLoginTNUPUS: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object FDQueryLoginTNJTCD: TStringField
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
    Connected = True
    Left = 400
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 304
    Top = 56
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 221
    Top = 56
    object ClientDataSet1TNTNCD: TIntegerField
      FieldName = 'TNTNCD'
      Required = True
    end
    object ClientDataSet1TNBKCD: TIntegerField
      FieldName = 'TNBKCD'
    end
    object ClientDataSet1TNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Size = 2000
    end
    object ClientDataSet1TNNAME: TStringField
      FieldName = 'TNNAME'
      Size = 16
    end
    object ClientDataSet1TNKGKB: TStringField
      FieldName = 'TNKGKB'
      Size = 1
    end
    object ClientDataSet1TNSTKB: TStringField
      FieldName = 'TNSTKB'
      Size = 4
    end
    object ClientDataSet1TNPWLA: TDateField
      FieldName = 'TNPWLA'
    end
    object ClientDataSet1TNCRDT: TDateField
      FieldName = 'TNCRDT'
    end
    object ClientDataSet1TNCRTM: TTimeField
      FieldName = 'TNCRTM'
    end
    object ClientDataSet1TNCRPG: TStringField
      FieldName = 'TNCRPG'
    end
    object ClientDataSet1TNCRWS: TStringField
      FieldName = 'TNCRWS'
    end
    object ClientDataSet1TNCRUS: TStringField
      FieldName = 'TNCRUS'
    end
    object ClientDataSet1TNUPDT: TDateField
      FieldName = 'TNUPDT'
    end
    object ClientDataSet1TNUPTM: TTimeField
      FieldName = 'TNUPTM'
    end
    object ClientDataSet1TNUPPG: TStringField
      FieldName = 'TNUPPG'
    end
    object ClientDataSet1TNUPWS: TStringField
      FieldName = 'TNUPWS'
    end
    object ClientDataSet1TNUPUS: TStringField
      FieldName = 'TNUPUS'
    end
    object ClientDataSet1TNJTCD: TStringField
      FieldName = 'TNJTCD'
      Size = 1
    end
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = FDQueryLogin
    Left = 138
    Top = 56
  end
end
