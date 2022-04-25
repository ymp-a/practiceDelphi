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
    DataSetProF0004: TDataSetProvider;
    ClientDataSetF0004: TClientDataSet;
    ClientDataSetF0004MHNO: TIntegerField;
    ClientDataSetF0004MHIRDT: TDateField;
    ClientDataSetF0004MHKGDT: TDateField;
    ClientDataSetF0004MHTKCD: TStringField;
    ClientDataSetF0004MHTKNM: TStringField;
    ClientDataSetF0004MHGSRO: TIntegerField;
    ClientDataSetF0004MHGKIN: TIntegerField;
    ClientDataSetF0004MHTNCD: TIntegerField;
    ClientDataSetF0004MHBIKO: TStringField;
    ClientDataSetF0004MHJTCD: TStringField;
    ClientDataSetF0004TNTNCD: TIntegerField;
    ClientDataSetF0004TNBKCD: TIntegerField;
    ClientDataSetF0004TNPASS: TVarBytesField;
    ClientDataSetF0004TNNAME: TStringField;
    ClientDataSetF0004TNKGKB: TStringField;
    ClientDataSetF0004TNSTKB: TStringField;
    ClientDataSetF0004TNPWLA: TDateField;
    ClientDataSetF0004TNCRDT: TDateField;
    ClientDataSetF0004TNCRTM: TTimeField;
    ClientDataSetF0004TNCRPG: TStringField;
    ClientDataSetF0004TNCRWS: TStringField;
    ClientDataSetF0004TNCRUS: TStringField;
    ClientDataSetF0004TNUPDT: TDateField;
    ClientDataSetF0004TNUPTM: TTimeField;
    ClientDataSetF0004TNUPPG: TStringField;
    ClientDataSetF0004TNUPWS: TStringField;
    ClientDataSetF0004TNUPUS: TStringField;
    ClientDataSetF0004TNJTCD: TStringField;
    DataSrc_IH001_MTH: TDataSource;
    CDS_IH001_MTH: TClientDataSet;
    IntegerField5: TIntegerField;
    DateField3: TDateField;
    DateField4: TDateField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    DataSetProIH001_MTH: TDataSetProvider;
    IH001_MTH: TFDQuery;
    IntegerField9: TIntegerField;
    DateField5: TDateField;
    DateField6: TDateField;
    StringField9: TStringField;
    StringField10: TStringField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    StringField11: TStringField;
    StringField12: TStringField;
    IH001_MTM: TFDQuery;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    StringField13: TStringField;
    StringField14: TStringField;
    BCDField1: TBCDField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    DataSetProIH001_MTM: TDataSetProvider;
    CDS_IH001_MTM: TClientDataSet;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    StringField17: TStringField;
    StringField18: TStringField;
    BCDField2: TBCDField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    StringField19: TStringField;
    StringField20: TStringField;
    BooleanField1: TBooleanField;
    AggregateField1: TAggregateField;
    AggregateField2: TAggregateField;
    DataSrc_IH001_MTM: TDataSource;
    FDQryIH002: TFDQuery;
    IntegerField21: TIntegerField;
    DateField7: TDateField;
    DateField8: TDateField;
    StringField21: TStringField;
    StringField22: TStringField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    StringField23: TStringField;
    StringField24: TStringField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    VarBytesField1: TVarBytesField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    DateField9: TDateField;
    DateField10: TDateField;
    TimeField1: TTimeField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    DateField11: TDateField;
    TimeField2: TTimeField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    DataSrc_IH002: TDataSource;
    DataSetProIH002: TDataSetProvider;
    CDS_IH002: TClientDataSet;
    IntegerField27: TIntegerField;
    DateField12: TDateField;
    DateField13: TDateField;
    StringField35: TStringField;
    StringField36: TStringField;
    IntegerField28: TIntegerField;
    IntegerField29: TIntegerField;
    IntegerField30: TIntegerField;
    StringField37: TStringField;
    StringField38: TStringField;
    IntegerField31: TIntegerField;
    IntegerField32: TIntegerField;
    VarBytesField2: TVarBytesField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    DateField14: TDateField;
    DateField15: TDateField;
    TimeField3: TTimeField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    DateField16: TDateField;
    TimeField4: TTimeField;
    StringField45: TStringField;
    StringField46: TStringField;
    StringField47: TStringField;
    StringField48: TStringField;
    FDQryGene: TFDQuery;
    DataSource4: TDataSource;
    CDS_IH001_MTMdelflag: TIntegerField;
    CDS_IH001_MTMmSRYO: TIntegerField;
    CDS_IH001_MTMmKIN: TIntegerField;
    // ClientDataSetの日付フィールドのOnSetTextイベントに追加する
    procedure ClientDataSetTDateFieldSetText(Sender: TField; // 日付入力チェック
      const Text: string);
    function DateFilldSetText(str:string):string;            // 日付形式に変換
    //見積m
  type dMTM = Record
    Exists :Boolean;
    MHNO:string;          //部課CD
    JTCD:string;          //使用停止区分
  end;
  private
    { Private 宣言 }
  public
    { Public 宣言 }

    procedure OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD: String); // 見積データオープン
    procedure OpenIH002MHData(MHNO,TODT,FRDT,TKCD,TNCD: String); // 見積データオープン
    function MTHMS(MHNO:string;IncD:boolean=false): dMTM; // 見積№チェック
    function MHTNO(): dMTM; // 見積NoのLast+1の番号を返却
  end;

var
  DataModule4: TDataModule4;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DM2, Utilybs;

{$R *.dfm}

{*******************************************************************************
 目的:見積データオープン IH002用
 引数:
 戻値:
*******************************************************************************}
procedure TDataModule4.OpenIH002MHData(MHNO,TODT,FRDT,TKCD,TNCD: String);
var
  andFlg:boolean; // 入力フラグを設定
  qry:TFDQuery;
  cds:TClientDataSet;
begin
  andFlg:=false;  // フラグ初期化

  qry:=FDQryIH002;
  cds:=CDS_IH002;

  with DataModule4 do
  begin
    cds.Close; // CSDIH002の初期化

    qry.Close; // FDQryIH002の初期化
    qry.SQL.Clear;        // SQL文初期化
    // ここからSQL文↓
    qry.SQL.Add(' SELECT * FROM MTHFLP  ');
    qry.SQL.Add(' LEFT JOIN TNMMSP ON TNTNCD = MHTNCD  ');
   // SQL.Add(' WHERE MHJTCD <> ''D'' '); // 'D'も表示したい

    if MHNO<>'' then                          // 見積NO入力時の処理
    begin
      qry.SQL.Add('WHERE MHNO = :MHNO ');
      qry.ParamByName('MHNO').AsString:=MHNO;
      andFlg:=true;                           // 入力時フラグオン
    end;
                                              // Copy(TODT,1,4)は2022/04/22の2022部分があるかチェックしてる
    if StrToIntDef(Copy(TODT,1,4),0)<>0 then  // 見積依頼日入力時の処理
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHIRDT = :TODT');
      qry.ParamByName('TODT').AsString:=TODT; // 入力した担当者CDを'TNCD'に代入する
      andFlg:=true;                           // 入力時フラグオン
    end;

    if StrToIntDef(Copy(FRDT,1,4),0)<>0 then  // 見積期限入力時の処理
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHKGDT = :FRDT');
      qry.ParamByName('FRDT').AsString:=FRDT; // 入力した担当者CDを'TNCD'に代入する
      andFlg:=true;                           // 入力時フラグオン
    end;

    if TKCD<>'' then                          // 得意先入力時の処理
    begin
    if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHTKCD = :TKCD');
      qry.ParamByName('TKCD').AsString:=TKCD; // 入力した担当者CDを'TNCD'に代入する
      andFlg:=true;                           // 入力時フラグオン
    end;

    if TNCD<>'' then                          // 担当者CD入力時の処理
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('TNTNCD = :TNCD ');         // TNTNCDに入力した担当者CDを代入する
      qry.ParamByName('TNCD').AsString:=TNCD; // 入力した担当者CDを'TNCD'に代入する
      andFlg:=true;                           // 入力時フラグオン
    end;

    qry.SQL.Add(' ORDER BY MHNO ');           // 昇順

    qry.Open;                                 // SQL文実行
    cds.Open;                                 // CDS開始



    // 対象データが存在しない場合、データセットを閉じて終了
    if cds.IsEmpty then
    begin
      cds.Close;
      raise Exception.Create('対象データが存在しません');
    end;

  end;

end; // OpenTNDataここまで

{*******************************************************************************
 目的:見積データオープン F0004用
 引数:
 戻値:
*******************************************************************************}
procedure TDataModule4.OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD: String);
var
  andFlg:boolean; // 入力フラグを設定
  qry:TFDQuery;
  cds:TClientDataSet;
begin
  andFlg:=false;  // フラグ初期化

  qry:=FDQryF0004;
  cds:=ClientDataSetF0004;

  with DataModule4 do
  begin
    cds.Close; // CSDの初期化

    qry.Close; // FDQueryF0004初期化
    qry.SQL.Clear;        // SQL文初期化
    // ここからSQL文↓
    qry.SQL.Add(' SELECT * FROM MTHFLP  ');
    qry.SQL.Add(' LEFT JOIN TNMMSP ON TNTNCD = MHTNCD  ');
   // SQL.Add(' WHERE MHJTCD <> ''D'' '); // 'D'も表示したい

    if MHNO<>'' then                      // 見積NO入力時の処理
    begin
      qry.SQL.Add('WHERE MHNO = :MHNO ');       // TNTNCDに入力した担当者CDを代入する
      qry.ParamByName('MHNO').AsString:=MHNO; // 入力した担当者CDを'TNCD'に代入する
      andFlg:=true;                       // 入力時フラグオン
    end;

    if TODT<>'' then                      // 見積依頼日入力時の処理
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHIRDT = :TODT');
      qry.ParamByName('TODT').AsString:=TODT; // 入力した担当者CDを'TNCD'に代入する
      andFlg:=true;                       // 入力時フラグオン
    end;

    if TODT<>'' then                      // 見積期限入力時の処理
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHKGDT = :FRDT');
      qry.ParamByName('FRDT').AsString:=FRDT; // 入力した担当者CDを'TNCD'に代入する
      andFlg:=true;                       // 入力時フラグオン
    end;

    if TKCD<>'' then                      // 得意先入力時の処理
    begin
    if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHTKCD = :TKCD');
      qry.ParamByName('TKCD').AsString:=TKCD; // 入力した担当者CDを'TNCD'に代入する
      andFlg:=true;                       // 入力時フラグオン
    end;

    if TNCD<>'' then                      // 担当者CD入力時の処理
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('TNTNCD = :TNCD ');  // TNTNCDに入力した担当者CDを代入する
      qry.ParamByName('TNCD').AsString:=TNCD; // 入力した担当者CDを'TNCD'に代入する
      andFlg:=true;                       // 入力時フラグオン
    end;

    qry.SQL.Add(' ORDER BY MHNO ');           // 昇順

    qry.Open;                      // SQL文実行
    cds.Open; // CDS開始



    // 対象データが存在しない場合、データセットを閉じて終了
    if cds.IsEmpty then
    begin
      cds.Close;
      raise Exception.Create('対象データが存在しません');
    end;

  end;

end; // OpenTNDataここまで

{*******************************************************************************
 目的: 日付チェック
 引数:
 戻値:
*******************************************************************************}
procedure TDataModule4.ClientDataSetTDateFieldSetText(Sender: TField;
  const Text: string);
begin
  try
    Sender.AsString:=text;
  except                        // 日付の形式以外の場合
  on e:Exception do             // ↓ 例外処理
    begin                       // 変換関数
      Sender.AsString:=DateFilldSetText(text);
    end;
  end;
end;

{*******************************************************************************
 目的: ClientDataSetの日付型のセットテキスト
 引数: 省略年月日(入力値)
 戻値: 正式年月日(スラッシュ有)
*******************************************************************************}
function TDataModule4.DateFilldSetText(str:string):string;
var
  inDT:integer;
  YYYY,YY,MM :integer;
begin

  Result:=str;

  str:=AnsiReplaceStr(str,'/','');

  if (str<>'')
   and (StrToIntDef(str,-1)>0) then // 数値以外入力されていたら無視
  begin

    inDT:=StrToIntDef(str,-1);

    // 入力支援機能（年入力の省略）
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

{*******************************************************************************
 目的:見積ヘッダーにデータがあるかチェックする
 引数:
 戻値:
*******************************************************************************}
function TDataModule4.MTHMS(MHNO:string;IncD:boolean=false): dMTM;
begin

  with FDQryGene do // チェックロジックなど確認用のSQLはtempクエリを利用する
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT * FROM MTHFLP ');
    SQL.Add(' WHERE MHNO = :MHNO ');
    if IncD=False then
      SQL.Add(' AND MHJTCD <> ''D''  ');
    ParamByName('MHNO').AsAnsiString:=MHNO;
    Open;

    if not eof then
    begin
      Result.Exists:= True;
      Result.MHNO := FieldByName('MHNO').AsString;     // 部課CD
      Result.JTCD := FieldByName('MHJTCD').AsString;     // 使用停止区分
    end else begin
      Result.Exists:= False;
      Result.MHNO := '';     // 部課CD
      Result.JTCD := '';     // 使用停止区分
    end;

    Close;
    SQL.Clear;
  end;

end;

function TDataModule4.MHTNO(): dMTM;
begin

  with FDQryGene do // チェックロジックなど確認用のSQLはtempクエリを利用する
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT * FROM MTHFLP ');
    Open;

    Result.Exists:= False;
    Result.MHNO := IntToStr(RecordCount+1);     // 部課CD
    Result.JTCD := '';     // 使用停止区分

    Close;
    SQL.Clear;
  end;

end;

end.
