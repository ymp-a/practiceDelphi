unit DM2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, Datasnap.DBClient,
  Datasnap.Provider,MidasLib, frxClass, frxDBSet;

type
  TDataModule2 = class(TDataModule)
    FDQryTNMMSP: TFDQuery;
    DataSrcTNMMSP: TDataSource;
    ClientDataSetTNMMSP: TClientDataSet;
    DataSetProTNMMSP: TDataSetProvider;
    ClientDataSetTNMMSPTNTNCD: TIntegerField;
    ClientDataSetTNMMSPTNBKCD: TIntegerField;
    ClientDataSetTNMMSPTNPASS: TVarBytesField;
    ClientDataSetTNMMSPTNNAME: TStringField;
    ClientDataSetTNMMSPTNKGKB: TStringField;
    ClientDataSetTNMMSPTNSTKB: TStringField;
    ClientDataSetTNMMSPTNPWLA: TDateField;
    ClientDataSetTNMMSPTNCRDT: TDateField;
    ClientDataSetTNMMSPTNCRTM: TTimeField;
    ClientDataSetTNMMSPTNCRPG: TStringField;
    ClientDataSetTNMMSPTNCRWS: TStringField;
    ClientDataSetTNMMSPTNCRUS: TStringField;
    ClientDataSetTNMMSPTNUPDT: TDateField;
    ClientDataSetTNMMSPTNUPTM: TTimeField;
    ClientDataSetTNMMSPTNUPPG: TStringField;
    ClientDataSetTNMMSPTNUPWS: TStringField;
    ClientDataSetTNMMSPTNUPUS: TStringField;
    ClientDataSetTNMMSPTNJTCD: TStringField;
    FDQry1: TFDQuery;
    DataSrc1: TDataSource;
    FDQry1TNTNCD: TIntegerField;
    FDQry1TNBKCD: TIntegerField;
    FDQry1TNPASS: TVarBytesField;
    FDQry1TNNAME: TStringField;
    FDQry1TNKGKB: TStringField;
    FDQry1TNSTKB: TStringField;
    FDQry1TNPWLA: TDateField;
    FDQry1TNCRDT: TDateField;
    FDQry1TNCRTM: TTimeField;
    FDQry1TNCRPG: TStringField;
    FDQry1TNCRWS: TStringField;
    FDQry1TNCRUS: TStringField;
    FDQry1TNUPDT: TDateField;
    FDQry1TNUPTM: TTimeField;
    FDQry1TNUPPG: TStringField;
    FDQry1TNUPWS: TStringField;
    FDQry1TNUPUS: TStringField;
    FDQry1TNJTCD: TStringField;
    FDQryIH004: TFDQuery;
    DataSetProIH004: TDataSetProvider;
    CDS_IH004: TClientDataSet;
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
    DataSrc_IH004: TDataSource;
    DataSrc_IH003: TDataSource;
    CDS_IH003: TClientDataSet;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    VarBytesField2: TVarBytesField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    DateField4: TDateField;
    DateField5: TDateField;
    TimeField3: TTimeField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    DateField6: TDateField;
    TimeField4: TTimeField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    DataSetProIH003: TDataSetProvider;
    FDQryIH003: TFDQuery;
    FDQryGene: TFDQuery;
    DataSource2: TDataSource;
    CDS_IH004TNKGNM: TStringField;
    FDQryIH005: TFDQuery;
    DataSetProIH005: TDataSetProvider;
    CDS_IH005: TClientDataSet;
    DataSrc_IH005: TDataSource;
    frxDBDatasetIH005: TfrxDBDataset;
    DataSrcIH005MS: TDataSource;
    frxDBDatasetIH005MS: TfrxDBDataset;
    FDQryIH005MS: TFDQuery;
    DataSetProIH005MS: TDataSetProvider;
    CDS_IH005MS: TClientDataSet;
    CDS_IH005MHIRDT: TDateField;
    CDS_IH005MHNO: TIntegerField;
    CDS_IH005MHTKNM: TStringField;
    CDS_IH005MSNewMTNO: TLargeintField;
    CDS_IH005MSOldMTNO: TLargeintField;
    CDS_IH005MSNewGNO: TIntegerField;
    CDS_IH005MSMHNO: TIntegerField;
    CDS_IH005MSMHIRDT: TDateField;
    CDS_IH005MSMHKGDT: TDateField;
    CDS_IH005MSMHTKCD: TStringField;
    CDS_IH005MSMHTKNM: TStringField;
    CDS_IH005MSMHGSRO: TIntegerField;
    CDS_IH005MSMHGKIN: TIntegerField;
    CDS_IH005MSMHTNCD: TIntegerField;
    CDS_IH005MSMHBIKO: TStringField;
    CDS_IH005MSMHJTCD: TStringField;
    CDS_IH005MSMTNO: TIntegerField;
    CDS_IH005MSMTGNO: TIntegerField;
    CDS_IH005MSMTSHCD: TStringField;
    CDS_IH005MSMTSHNM: TStringField;
    CDS_IH005MSMTTNKA: TBCDField;
    CDS_IH005MSMTSRYO: TIntegerField;
    CDS_IH005MSMTKIN: TIntegerField;
    CDS_IH005MSMTBIKO: TStringField;
    CDS_IH005MSMTJTCD: TStringField;
    CDS_IH005NewMTNO: TLargeintField;
  //?S????m
  type dTNM = Record
    Exists :Boolean;
    NAME:WideString;      //?S????
    BKCD:string;          //????CD
    STKB:string;          //?g?p???~????
  end;
  private
    { Private ???? }
  public
    { Public ???? }
    function TNMMS(TNCD:string;IncD:boolean=false): dTNM; // ?S?????}?X?^?`?F?b?N
//    procedure OpenTNData(TNCD,reNAME: String); // ?S?????}?X?^?f?[?^?I?[?v??
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses functions, Utilybs, F0001;

{$R *.dfm}

{*******************************************************************************
 ???I:?S?????}?X?^???f?[?^?????????`?F?b?N????
 ????:
 ???l:
*******************************************************************************}
function TDataModule2.TNMMS(TNCD:string;IncD:boolean=false): dTNM;
begin

  with FDQryGene do // ?`?F?b?N???W?b?N?????m?F?p??SQL??temp?N?G???????p????
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
      Result.NAME := FieldByName('TNNAME').AsWideString; // ?S??????
      Result.BKCD := FieldByName('TNBKCD').AsString;     // ????CD
      Result.STKB := FieldByName('TNSTKB').AsString;     // ?g?p???~????
    end else begin
      Result.Exists:= False;
      Result.NAME := '';     // ?S??????
      Result.BKCD := '';     // ????CD
      Result.STKB := '';     // ?g?p???~????
    end;

    Close;
    SQL.Clear;
  end;

end;

{*******************************************************************************
 ???I:?S?????}?X?^???f?[?^?I?[?v??
 ????:
 ???l:
*******************************************************************************}
{procedure TDataModule2.OpenTNData(TNCD,reNAME: String);
var
  andFlg:boolean; // ?????t???O??????

begin

  andFlg:=false;  // ?t???O??????

  begin
    ClientDataSetTNMMSP.Close; // CDS????????

    with FDQryTNMMSP do
    begin
      FDQryTNMMSP.Close; // FDQueryLogin??????
      SQL.Clear;         // SQL????????
//      Params.Clear;

      // ????????SQL????
      SQL.Add(' SELECT * FROM TNMMSP  ');
      SQL.Add(' where 1=1 ');
      if TNCD<>'' then // ?S????CD????????????
      begin
        SQL.Add(' AND TNTNCD = ''3'' '); // TNTNCD???????????S????CD??????????
//        ParamByName('TNCD').AsString:=TNCD; // ?????????S????CD??'TNCD'??????????
        andFlg:=true;                       // ???????t???O?I??
      end;

      if reNAME<>'' then                    // ?S??????????????????
      begin

       // if andFlg=true then SQL.Add(' AND ')                 // ?S????CD?????L????AND??WHERE??????????????
       //                else SQL.Add(' WHERE ');
        SQL.Add(' AND TNNAME LIKE :NAME ');                      // TNNAME LIKE??%??????%??SQLString?????f????
        ParamByName('NAME').AsWideString :='%' +reNAME+ '%'; // ???????v??????????'NAME'??????????
        andFlg:=true;                                        // ???????t???O?I??
      end;

      SQL.Add(' ORDER BY TNTNCD ');     // ????

      FDQryTNMMSP.Open();                 // SQL?????s
    end;

    ClientDataSetTNMMSP.Open(); // CDS???J??


    if ClientDataSetTNMMSP.Eof and ClientDataSetTNMMSP.Bof then // ?????f?[?^?????????????????A?f?[?^?Z?b?g?????????I??
    begin
      ClientDataSetTNMMSP.Active := False;
      raise Exception.Create('?????f?[?^??????????????');
    end;

  end;// CDS????????

end;// OpenTNData????????
 }
end.
