unit DM4;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Data.DB, Datasnap.DBClient,MidasLib,StrUtils;

type
  TDataModule4 = class(TDataModule)
    DataSrcMTHFLP: TDataSource;
    ClientDataSetMTHFLP: TClientDataSet;
    DataSetProMTHFLP: TDataSetProvider;
    FDQryMTHFLP: TFDQuery;
    FDQryMTMFLP: TFDQuery;
    DataSetProMTMFLP: TDataSetProvider;
    ClientDataSetMTMFLP: TClientDataSet;
    DataSrcMTMFLP: TDataSource;
    FDQryMTHFLPMHNO: TIntegerField;
    FDQryMTHFLPMHIRDT: TDateField;
    FDQryMTHFLPMHKGDT: TDateField;
    FDQryMTHFLPMHTKCD: TStringField;
    FDQryMTHFLPMHTKNM: TStringField;
    FDQryMTHFLPMHGSRO: TIntegerField;
    FDQryMTHFLPMHGKIN: TIntegerField;
    FDQryMTHFLPMHTNCD: TIntegerField;
    FDQryMTHFLPMHBIKO: TStringField;
    FDQryMTHFLPMHJTCD: TStringField;
    FDQryMTMFLPMTNO: TIntegerField;
    FDQryMTMFLPMTGNO: TIntegerField;
    FDQryMTMFLPMTSHCD: TStringField;
    FDQryMTMFLPMTSHNM: TStringField;
    FDQryMTMFLPMTTNKA: TBCDField;
    FDQryMTMFLPMTSRYO: TIntegerField;
    FDQryMTMFLPMTKIN: TIntegerField;
    FDQryMTMFLPMTBIKO: TStringField;
    FDQryMTMFLPMTJTCD: TStringField;
    ClientDataSetMTHFLPMHNO: TIntegerField;
    ClientDataSetMTHFLPMHIRDT: TDateField;
    ClientDataSetMTHFLPMHKGDT: TDateField;
    ClientDataSetMTHFLPMHTKCD: TStringField;
    ClientDataSetMTHFLPMHTKNM: TStringField;
    ClientDataSetMTHFLPMHGSRO: TIntegerField;
    ClientDataSetMTHFLPMHGKIN: TIntegerField;
    ClientDataSetMTHFLPMHTNCD: TIntegerField;
    ClientDataSetMTHFLPMHBIKO: TStringField;
    ClientDataSetMTHFLPMHJTCD: TStringField;
    ClientDataSetMTMFLPMTNO: TIntegerField;
    ClientDataSetMTMFLPMTGNO: TIntegerField;
    ClientDataSetMTMFLPMTSHCD: TStringField;
    ClientDataSetMTMFLPMTSHNM: TStringField;
    ClientDataSetMTMFLPMTTNKA: TBCDField;
    ClientDataSetMTMFLPMTSRYO: TIntegerField;
    ClientDataSetMTMFLPMTKIN: TIntegerField;
    ClientDataSetMTMFLPMTBIKO: TStringField;
    ClientDataSetMTMFLPMTJTCD: TStringField;
    FDQryF0004: TFDQuery;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    DateField2: TDateField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    DataSrcF0004: TDataSource;
    ClientDataSetMTMFLPdataJTCD: TBooleanField;
    ClientDataSetMTMFLPsumSRYO: TAggregateField;
    ClientDataSetMTMFLPsumKIN: TAggregateField;
    FDQryF0004TNTNCD: TIntegerField;
    FDQryF0004TNBKCD: TIntegerField;
    FDQryF0004TNPASS: TVarBytesField;
    FDQryF0004TNNAME: TStringField;
    FDQryF0004TNKGKB: TStringField;
    FDQryF0004TNSTKB: TStringField;
    FDQryF0004TNPWLA: TDateField;
    FDQryF0004TNCRDT: TDateField;
    FDQryF0004TNCRTM: TTimeField;
    FDQryF0004TNCRPG: TStringField;
    FDQryF0004TNCRWS: TStringField;
    FDQryF0004TNCRUS: TStringField;
    FDQryF0004TNUPDT: TDateField;
    FDQryF0004TNUPTM: TTimeField;
    FDQryF0004TNUPPG: TStringField;
    FDQryF0004TNUPWS: TStringField;
    FDQryF0004TNUPUS: TStringField;
    FDQryF0004TNJTCD: TStringField;
    //日付省略入力
    //ClientDataSetの日付フィールドのOnSetTextイベントに追加する
    procedure ClientDataSetTDateFieldSetText(Sender: TField;
      const Text: string);
    function DateFilldSetText(str:string):string;
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    procedure OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD: String); // 見積データオープン
  end;

var
  DataModule4: TDataModule4;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DM2;

{$R *.dfm}

procedure TDataModule4.OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD: String);
var
  andFlg:boolean; //入力フラグを設定

begin
  //フラグ初期化
  andFlg:=false;

  with FDQryF0004 do
  begin
    //FDQueryLogin初期化
    FDQryF0004.Close;
    //SQL文初期化
    SQL.Clear;
    //ここからSQL文↓
    SQL.Add(' SELECT * FROM MTHFLP  ');
    SQL.Add(' LEFT JOIN TNMMSP ON TNTNCD = MHTNCD  ');
   // SQL.Add(' WHERE MHJTCD <> ''D'' ');

    // 見積NO入力時の処理
    if MHNO<>'' then
    begin
      //TNTNCDに入力した担当者CDを代入する
      SQL.Add('AND MHNO = :MHNO ');
      //入力した担当者CDを'TNCD'に代入する
      ParamByName('MHNO').AsString:=MHNO;
      //入力時フラグオン
      andFlg:=true;
    end;

    // 見積依頼日入力時の処理
    if TODT<>'' then
    begin
      SQL.Add(' AND MHIRDT = :TODT');
      //入力した担当者CDを'TNCD'に代入する
      ParamByName('TODT').AsString:=TODT;
      //入力時フラグオン
      andFlg:=true;
    end;

    // 見積期限入力時の処理
    if TODT<>'' then
    begin
      SQL.Add(' AND MHKGDT = :FRDT');
      //入力した担当者CDを'TNCD'に代入する
      ParamByName('FRDT').AsString:=FRDT;
      //入力時フラグオン
      andFlg:=true;
    end;

    // 得意先入力時の処理
    if TKCD<>'' then
    begin
      SQL.Add(' AND MHTKCD = :TKCD');
      //入力した担当者CDを'TNCD'に代入する
      ParamByName('TKCD').AsString:=TKCD;
      //入力時フラグオン
      andFlg:=true;
    end;

    //担当者CD入力時の処理
    if TNCD<>'' then
    begin
      //TNTNCDに入力した担当者CDを代入する
      SQL.Add(' WHERE TNTNCD = :TNCD ');
      //入力した担当者CDを'TNCD'に代入する
      ParamByName('TNCD').AsString:=TNCD;
      //入力時フラグオン
      andFlg:=true;
    end;


    //昇順
    SQL.Add(' ORDER BY MHNO ');
    //SQL文実行
    FDQryF0004.Open;
  end;


  //対象データが存在しない場合、データセットを閉じて終了
  if FDQryF0004.IsEmpty then
  begin
    FDQryF0004.Close;
    raise Exception.Create('対象データが存在しません');
  end;//例外処理ここまで


end;//OpenTNDataここまで

procedure TDataModule4.ClientDataSetTDateFieldSetText(Sender: TField;
  const Text: string);
begin
  try
    Sender.AsString:=text;
  except                        //日付の形式でなければエラー
  on e:Exception do             //↓
    begin                         //変換
      Sender.AsString:=DateFilldSetText(text);
    end;
  end;
end;

function TDataModule4.DateFilldSetText(str:string):string;
{*******************************************************************************
 目的: ClientDataSetの日付型のセットテキスト
 引数: 省略年月日(入力値)
 戻値: 正式年月日(スラッシュ有)
*******************************************************************************}
var
  inDT:integer;
  YYYY,YY,MM :integer;
begin

  Result:=str;

  str:=AnsiReplaceStr(str,'/','');

  if (str<>'')
   and (StrToIntDef(str,-1)>0) then     //数値以外入力されていたら無視
  begin

    inDT:=StrToIntDef(str,-1);

    //入力支援機能（年入力の省略）
    YYYY:= strtoint(FormatDateTime('YYYY',date));
    YY  := strtoint(FormatDateTime('YY',date));
    MM  := strtoint(FormatDateTime('MM',date));

    if (inDT > 9999)
    and(inDT <= 999999) then
    begin
      inDT := inDT + (YYYY-YY)*10000;
    end;

    if (inDT > 99)
    and(inDT <= 9999) then
    begin
      inDT := inDT + YYYY*10000;
    end;

    if (inDT <= 99)
    and(inDT <> 0) then
    begin
      inDT := inDT + YYYY*10000 +mm*100;
    end;

    Result:=FormatFloat('0000/00/00',inDT);

  end;

end;

end.
