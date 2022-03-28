object DataModule3: TDataModule3
  OldCreateOrder = False
  Height = 309
  Width = 405
  object DataSrcF0002: TDataSource
    DataSet = ClientDataSetF0002
    Left = 304
    Top = 48
  end
  object ClientDataSetF0002: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProF0002'
    Left = 221
    Top = 48
    object ClientDataSetF0002TNTNCD: TIntegerField
      FieldName = 'TNTNCD'
      Origin = 'TNTNCD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ClientDataSetF0002TNBKCD: TIntegerField
      FieldName = 'TNBKCD'
      Origin = 'TNBKCD'
    end
    object ClientDataSetF0002TNPASS: TVarBytesField
      FieldName = 'TNPASS'
      Origin = 'TNPASS'
      Size = 2000
    end
    object ClientDataSetF0002TNNAME: TStringField
      FieldName = 'TNNAME'
      Origin = 'TNNAME'
      Size = 16
    end
    object ClientDataSetF0002TNKGKB: TStringField
      FieldName = 'TNKGKB'
      Origin = 'TNKGKB'
      Size = 1
    end
    object ClientDataSetF0002TNSTKB: TStringField
      FieldName = 'TNSTKB'
      Origin = 'TNSTKB'
      Size = 4
    end
    object ClientDataSetF0002TNPWLA: TDateField
      FieldName = 'TNPWLA'
      Origin = 'TNPWLA'
    end
    object ClientDataSetF0002TNCRDT: TDateField
      FieldName = 'TNCRDT'
      Origin = 'TNCRDT'
    end
    object ClientDataSetF0002TNCRTM: TTimeField
      FieldName = 'TNCRTM'
      Origin = 'TNCRTM'
    end
    object ClientDataSetF0002TNCRPG: TStringField
      FieldName = 'TNCRPG'
      Origin = 'TNCRPG'
    end
    object ClientDataSetF0002TNCRUS: TStringField
      FieldName = 'TNCRUS'
      Origin = 'TNCRUS'
    end
    object ClientDataSetF0002TNCRWS: TStringField
      FieldName = 'TNCRWS'
      Origin = 'TNCRWS'
    end
    object ClientDataSetF0002TNUPDT: TDateField
      FieldName = 'TNUPDT'
      Origin = 'TNUPDT'
    end
    object ClientDataSetF0002TNUPTM: TTimeField
      FieldName = 'TNUPTM'
      Origin = 'TNUPTM'
    end
    object ClientDataSetF0002TNUPPG: TStringField
      FieldName = 'TNUPPG'
      Origin = 'TNUPPG'
    end
    object ClientDataSetF0002TNUPWS: TStringField
      FieldName = 'TNUPWS'
      Origin = 'TNUPWS'
    end
    object ClientDataSetF0002TNUPUS: TStringField
      FieldName = 'TNUPUS'
      Origin = 'TNUPUS'
    end
    object ClientDataSetF0002TNJTCD: TStringField
      FieldName = 'TNJTCD'
      Origin = 'TNJTCD'
      Size = 1
    end
    object ClientDataSetF0002PASS: TStringField
      FieldKind = fkInternalCalc
      FieldName = 'PASS'
    end
  end
  object DataSetProF0002: TDataSetProvider
    DataSet = FDQryF0002
    Left = 138
    Top = 48
  end
  object FDQryF0002: TFDQuery
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
      DisplayFormat = '#'
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
