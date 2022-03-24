unit DM3;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.Provider,
  Datasnap.DBClient;

type
  TDataModule3 = class(TDataModule)
    DataSrcF0002: TDataSource;
    ClientDataSetF0002: TClientDataSet;
    DataSetProF0002: TDataSetProvider;
    FDQryF0002: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    VarBytesField1: TVarBytesField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateField1: TDateField;
    DateField2: TDateField;
    TimeField1: TTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateField3: TDateField;
    TimeField2: TTimeField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    ClientDataSetF0002TNTNCD: TIntegerField;
    ClientDataSetF0002TNBKCD: TIntegerField;
    ClientDataSetF0002TNPASS: TVarBytesField;
    ClientDataSetF0002TNNAME: TStringField;
    ClientDataSetF0002TNKGKB: TStringField;
    ClientDataSetF0002TNSTKB: TStringField;
    ClientDataSetF0002TNPWLA: TDateField;
    ClientDataSetF0002TNCRDT: TDateField;
    ClientDataSetF0002TNCRTM: TTimeField;
    ClientDataSetF0002TNCRPG: TStringField;
    ClientDataSetF0002TNCRWS: TStringField;
    ClientDataSetF0002TNCRUS: TStringField;
    ClientDataSetF0002TNUPDT: TDateField;
    ClientDataSetF0002TNUPTM: TTimeField;
    ClientDataSetF0002TNUPPG: TStringField;
    ClientDataSetF0002TNUPWS: TStringField;
    ClientDataSetF0002TNUPUS: TStringField;
    ClientDataSetF0002TNJTCD: TStringField;
    FDQryGene: TFDQuery;
    DataSource3: TDataSource;
    ClientDataSetF0002PASS: TStringField;

  //SÒm
  type dTNM = Record
    Exists :Boolean;
    NAME:WideString;      //SÒ
    BKCD:string;          //ÛCD
    STKB:string;          //gpâ~æª
  end;

  private
    { Private é¾ }
  public
    { Public é¾ }
    function TNMMS(TNCD:string;IncD:boolean=false): dTNM;
  end;

var
  DataModule3: TDataModule3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses functions, Utilybs, DM2, F0001;

{$R *.dfm}




{*SÒM*}
function TDataModule3.TNMMS(TNCD:string;IncD:boolean=false): dTNM;
begin
// `FbNWbNÈÇmFpÌSQLÍtempNGðp·éB
  with FDQryGene do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT * FROM TNMMSP ');
    SQL.Add(' WHERE TNTNCD = :TNTNCD ');
    if IncD=False then
      SQL.Add(' AND TNJTCD <> ''D''  ');
    ParamByName('TNTNCD').AsAnsiString:=TNCD;
    Open;

    if not eof then
    begin
      Result.Exists:= True;
      Result.NAME := FieldByName('TNNAME').AsWideString;     //SÒ¼
      Result.BKCD := FieldByName('TNBKCD').AsString;       //ÛCD
      Result.STKB := FieldByName('TNSTKB').AsString;       //gpâ~æª
    end else begin
      Result.Exists:= False;
      Result.NAME := '';     //SÒ¼
      Result.BKCD := '';     //ÛCD
      Result.STKB := '';     //gpâ~æª
    end;

    Close;
    SQL.Clear;
  end;

end;


end.
