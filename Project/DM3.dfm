object DataModule3: TDataModule3
  OldCreateOrder = False
  Height = 309
  Width = 405
  object DataSource2: TDataSource
    DataSet = ClientDataSet2
    Left = 304
    Top = 48
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    Left = 221
    Top = 48
    object ClientDataSet2TNTNCD: TIntegerField
      FieldName = 'TNTNCD'
      Required = True
    end
    object ClientDataSet2TNBKCD: TIntegerField
      FieldName = 'TNBKCD'
    end
    object ClientDataSet2TNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Size = 2000
    end
    object ClientDataSet2TNNAME: TStringField
      FieldName = 'TNNAME'
      Size = 16
    end
    object ClientDataSet2TNKGKB: TStringField
      FieldName = 'TNKGKB'
      Size = 1
    end
    object ClientDataSet2TNSTKB: TStringField
      FieldName = 'TNSTKB'
      Size = 4
    end
    object ClientDataSet2TNPWLA: TDateField
      FieldName = 'TNPWLA'
    end
    object ClientDataSet2TNCRDT: TDateField
      FieldName = 'TNCRDT'
    end
    object ClientDataSet2TNCRTM: TTimeField
      FieldName = 'TNCRTM'
    end
    object ClientDataSet2TNCRPG: TStringField
      FieldName = 'TNCRPG'
    end
    object ClientDataSet2TNCRWS: TStringField
      FieldName = 'TNCRWS'
    end
    object ClientDataSet2TNCRUS: TStringField
      FieldName = 'TNCRUS'
    end
    object ClientDataSet2TNUPDT: TDateField
      FieldName = 'TNUPDT'
    end
    object ClientDataSet2TNUPTM: TTimeField
      FieldName = 'TNUPTM'
    end
    object ClientDataSet2TNUPPG: TStringField
      FieldName = 'TNUPPG'
    end
    object ClientDataSet2TNUPWS: TStringField
      FieldName = 'TNUPWS'
    end
    object ClientDataSet2TNUPUS: TStringField
      FieldName = 'TNUPUS'
    end
    object ClientDataSet2TNJTCD: TStringField
      FieldName = 'TNJTCD'
      Size = 1
    end
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = FDQueryLogin2
    Left = 138
    Top = 48
  end
  object FDQueryLogin2: TFDQuery
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM TNMMSP')
    Left = 56
    Top = 48
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
  end
  object FDQryGene: TFDQuery
    Connection = DataModule2.FDConnection1
    SQL.Strings = (
      'SELECT *'
      'FROM TNMMSP')
    Left = 56
    Top = 136
  end
  object DataSource3: TDataSource
    DataSet = FDQryGene
    Left = 296
    Top = 136
  end
end
