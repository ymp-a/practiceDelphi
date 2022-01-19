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
    DataSource2: TDataSource;
    ClientDataSet2: TClientDataSet;
    DataSetProvider2: TDataSetProvider;
    FDQueryLogin2: TFDQuery;
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
    ClientDataSet2TNTNCD: TIntegerField;
    ClientDataSet2TNBKCD: TIntegerField;
    ClientDataSet2TNPASS: TVarBytesField;
    ClientDataSet2TNNAME: TStringField;
    ClientDataSet2TNKGKB: TStringField;
    ClientDataSet2TNSTKB: TStringField;
    ClientDataSet2TNPWLA: TDateField;
    ClientDataSet2TNCRDT: TDateField;
    ClientDataSet2TNCRTM: TTimeField;
    ClientDataSet2TNCRPG: TStringField;
    ClientDataSet2TNCRWS: TStringField;
    ClientDataSet2TNCRUS: TStringField;
    ClientDataSet2TNUPDT: TDateField;
    ClientDataSet2TNUPTM: TTimeField;
    ClientDataSet2TNUPPG: TStringField;
    ClientDataSet2TNUPWS: TStringField;
    ClientDataSet2TNUPUS: TStringField;
    ClientDataSet2TNJTCD: TStringField;
    FDQryGene: TFDQuery;
    DataSource3: TDataSource;
//    procedure ClientDataSet2BeforeOpen(DataSet: TDataSet);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    procedure DataOpen;                              //データオープン
    function GetDecPass: string;
    procedure SetEncPass(eTNCD,ePASS:String);                            //パスワードの保存
  end;

var
  DataModule3: TDataModule3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses functions, Utilybs, DM2, F0001;

{$R *.dfm}

function TDataModule3.GetDecPass: string;
begin
  result:='';

  //得意先があったら部課変更不可
  with DataModule3.FDQryGene do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS ');
    SQL.Add('   FROM TNMMSP WHERE TNTNCD = :TNCD ');
    ParamByName('TNCD').AsString:=DataModule2.ClientDataSet1.FieldByName('TNTNCD').AsString;
    Open;

    if IsEmpty=false then
    begin
      result:=FieldByName('PASS').AsString;
    end;
    Close;
    SQL.Clear;

  end;
end;

procedure TDataModule3.SetEncPass(eTNCD,ePASS:String);
begin
  //得意先があったら部課変更不可
  with DataModule3.FDQryGene do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' UPDATE TNMMSP ');
    SQL.Add('    SET TNPASS = ENCRYPTBYPASSPHRASE('''+DECKEY+''',:PASS) ');
    SQL.Add('  WHERE TNTNCD = :TNCD ');
    ParamByName('PASS').AsAnsiString:=ePass;
    ParamByName('TNCD').AsAnsiString:=eTNCD;
    ExecSQL;
  end;
end;

procedure TDataModule3.DataOpen;
begin
  //編集用に新しいクライアントデータセットを開く
  with ClientDataSet2 do
  begin
    //データセットを閉じる
    Active := False;

      with FDQueryLogin2 do
      begin
        //FDQueryLogin2を初期化
        Close;
        //SQL文初期化
        SQL.Clear;
        //SQL文開始↓（DEGrid1選択中の内容をFDQueryLogin2で再現+パスワードも復号しておく）
        SQL.Add(' select * , CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS');
        SQL.Add(' from TNMMSP where TNTNCD = :TNTNCD ');
        //DBGrid1で選択中の担当者CDを代入する
        ParamByName('TNTNCD').AsAnsiString := DataModule2.ClientDataSet1.FieldByName('TNTNCD').AsString;
        //FDQueryLogin2を展開する
        Open;

        //FDQueryLogin2にデータがない場合の処理
        if IsEmpty then
        begin
          //例外エラーメッセージを作成
          raise Exception.Create('既に削除されている');
        end;

      end; //DataModule3.FDQueryLogin2ここまで

    //データセットを開く
    Active := True;
    Edit;  //編集ステータスにしておく
  end; //ClientDataSet2ここまで

end; //DataOpenここまで


end.
