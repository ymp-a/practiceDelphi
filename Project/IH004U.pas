unit IH004U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DspMaster, Data.DB, System.Actions,
  Vcl.ActnList, PageTop, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TIH004 = class(TDspMasterFrm)
    EdtTNCD: TEdit;
    Label1: TLabel;
    EdtNAME: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  IH004: TIH004;

implementation

{$R *.dfm}

uses DM2;

procedure TIH004.Button1Click(Sender: TObject);
{*******************************************************************************
 目的:担当者マスタにデータオープン
 引数:
 戻値:
*******************************************************************************}
var
  andFlg:boolean; // 入力フラグを設定

begin

  andFlg:=false;  // フラグ初期化

  begin
    DataModule2.CDS_IH004.Close; // CDSを初期化

    with DataModule2.FDQryIH004 do
    begin
      Close; // FDQueryLogin初期化
      SQL.Clear;         // SQL文初期化
//      Params.Clear;

      // ここからSQL文↓
      SQL.Add(' SELECT * FROM TNMMSP  ');
      SQL.Add(' where 1=1 ');
      if EdtTNCD.Text<>'' then // 担当者CD入力時の処理
      begin
        SQL.Add(' AND TNTNCD = :TNCD ');
        ParamByName('TNCD').AsString:=EdtTNCD.Text; // 入力した担当者CDを'TNCD'に代入する
        andFlg:=true;                       // 入力時フラグオン
      end;

      if EdtNAME.Text<>'' then                    // 担当者名入力時の処理
      begin
        SQL.Add(' AND TNNAME LIKE :NAME ');                      // TNNAME LIKEに%入力名%をSQLStringに反映する
        ParamByName('NAME').AsWideString :='%' +EdtNAME.Text+ '%'; // 部分一致の入力名を'NAME'へ代入する
        andFlg:=true;                                        // 入力時フラグオン
      end;

      SQL.Add(' ORDER BY TNTNCD ');     // 昇順

      Open();                 // SQL文実行
    end;

    DataModule2.CDS_IH004.Open(); // CDSを開く


    if DataModule2.CDS_IH004.Eof and DataModule2.CDS_IH004.Bof then // 対象データが存在しない場合、データセットを閉じて終了
    begin
      DataModule2.CDS_IH004.Active := False;
      raise Exception.Create('対象データが存在しません');
    end;

  end;// CDSここまで

end;// OpenTNDataここまで


procedure TIH004.FormShow(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
end;

end.
