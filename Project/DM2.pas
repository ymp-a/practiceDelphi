unit DM2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, Datasnap.Provider, Datasnap.DBClient, FireDAC.Comp.UI;

type
  TDataModule2 = class(TDataModule)
    FDQryTNMMSP: TFDQuery;
    FDConnection1: TFDConnection;
    DataSrcTNMMSP: TDataSource;
    FDQryTNMMSPTNTNCD: TIntegerField;
    FDQryTNMMSPTNBKCD: TIntegerField;
    FDQryTNMMSPTNPASS: TVarBytesField;
    FDQryTNMMSPTNNAME: TStringField;
    FDQryTNMMSPTNKGKB: TStringField;
    FDQryTNMMSPTNSTKB: TStringField;
    FDQryTNMMSPTNPWLA: TDateField;
    FDQryTNMMSPTNCRDT: TDateField;
    FDQryTNMMSPTNCRTM: TTimeField;
    FDQryTNMMSPTNCRPG: TStringField;
    FDQryTNMMSPTNCRWS: TStringField;
    FDQryTNMMSPTNCRUS: TStringField;
    FDQryTNMMSPTNUPDT: TDateField;
    FDQryTNMMSPTNUPTM: TTimeField;
    FDQryTNMMSPTNUPPG: TStringField;
    FDQryTNMMSPTNUPWS: TStringField;
    FDQryTNMMSPTNUPUS: TStringField;
    FDQryTNMMSPTNJTCD: TStringField;
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

  private
    { Private 宣言 }
  public
    { Public 宣言 }
    //担当者検索
    procedure OpenTNData(TNCD,reNAME: String);
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses functions, Utilybs, F0001;

{$R *.dfm}

procedure TDataModule2.OpenTNData(TNCD,reNAME: String);
var
  andFlg:boolean; //入力フラグを設定

begin
  //フラグ初期化
  andFlg:=false;

  with ClientDataSetTNMMSP do
  begin
    //ClientDataSet1を初期化
    ClientDataSetTNMMSP.Active := False;

    with FDQryTNMMSP do
    begin
      //FDQueryLogin初期化
      FDQryTNMMSP.Close;
      //SQL文初期化
      SQL.Clear;
      //ここからSQL文↓
      SQL.Add(' SELECT * FROM TNMMSP  ');

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

      //担当者名入力時の処理
      if reNAME<>'' then
      begin
        //担当者CD入力有無でANDかWHEREに条件分岐する
        if andFlg=true then SQL.Add(' AND ')
                       else SQL.Add(' WHERE ');

        //TNNAME LIKEに%入力名%をSQLStringに反映する
        SQL.Add(' TNNAME LIKE :NAME ');
        //部分一致の入力名を'NAME'へ代入する
        ParamByName('NAME').AsWideString :='%' +reNAME+ '%';
        //入力時フラグオン
        andFlg:=true;
      end;

      //昇順
      SQL.Add(' ORDER BY TNTNCD ');
      //SQL文実行
      FDQryTNMMSP.Open;
    end;

    //ClientDataSet1を開く
    ClientDataSetTNMMSP.Active := True;

    //対象データが存在しない場合、データセットを閉じて終了
    if Eof and Bof then
    begin
      Active := False;
      raise Exception.Create('対象データが存在しません');
    end;//例外処理ここまで

  end;//ClientDataSet1ここまで

end;//OpenTNDataここまで

end.
