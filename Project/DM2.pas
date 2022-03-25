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
    procedure OpenTNData(TNCD,reNAME: String); // 担当者マスタデータオープン
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses functions, Utilybs, F0001;

{$R *.dfm}

{*******************************************************************************
 目的:担当者マスタにデータオープン
 引数:
 戻値:
*******************************************************************************}
procedure TDataModule2.OpenTNData(TNCD,reNAME: String);
var
  andFlg:boolean; // 入力フラグを設定

begin

  andFlg:=false;  // フラグ初期化

  with ClientDataSetTNMMSP do
  begin
    ClientDataSetTNMMSP.Active := False; // CDSを初期化

    with FDQryTNMMSP do
    begin
      FDQryTNMMSP.Close; // FDQueryLogin初期化
      SQL.Clear;         // SQL文初期化
      // ここからSQL文↓
      SQL.Add(' SELECT * FROM TNMMSP  ');

      if TNCD<>'' then                      // 担当者CD入力時の処理
      begin
        SQL.Add(' WHERE TNTNCD = :TNCD ');  // TNTNCDに入力した担当者CDを代入する
        ParamByName('TNCD').AsString:=TNCD; // 入力した担当者CDを'TNCD'に代入する
        andFlg:=true;                       // 入力時フラグオン
      end;

      if reNAME<>'' then                    // 担当者名入力時の処理
      begin

        if andFlg=true then SQL.Add(' AND ')                 // 担当者CD入力有無でANDかWHEREに条件分岐する
                       else SQL.Add(' WHERE ');
        SQL.Add(' TNNAME LIKE :NAME ');                      // TNNAME LIKEに%入力名%をSQLStringに反映する
        ParamByName('NAME').AsWideString :='%' +reNAME+ '%'; // 部分一致の入力名を'NAME'へ代入する
        andFlg:=true;                                        // 入力時フラグオン
      end;

      SQL.Add(' ORDER BY TNTNCD ');     // 昇順

      FDQryTNMMSP.Open;                 // SQL文実行
    end;

    ClientDataSetTNMMSP.Active := True; // CDSを開く


    if Eof and Bof then // 対象データが存在しない場合、データセットを閉じて終了
    begin
      Active := False;
      raise Exception.Create('対象データが存在しません');
    end;

  end;// CDSここまで

end;// OpenTNDataここまで

end.
