unit IH003U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EdtMaster, System.Actions, Vcl.ActnList,
  PageTop, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  DBEditUNIC;

type
  TIH003 = class(TEdtMasterFrm)
    Label1: TLabel;
    EdtTNCD: TDBEditUNIC;
    Label2: TLabel;
    EdtNAME: TDBEditUNIC;
    Label3: TLabel;
    EdtPass: TEdit;
    Label4: TLabel;
    CmbKGNM: TComboBox;
    Label5: TLabel;
    chkSTKB: TCheckBox;
    EdtKGKB: TDBEditUNIC;
    procedure FormShow(Sender: TObject);         // 画面表示の処理
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private 宣言 }
    procedure InzAddMode;override;               // 初期設定（追加モード）
    function  GetDecPass: string;                   // 復号用
  public
    { Public 宣言 }
  end;

var
  IH003: TIH003;

implementation

{$R *.dfm}

uses DM2, Utilybs, functions;

{===============================================================================
画面展開後に設定するイベント
===============================================================================}
procedure TIH003.FormShow(Sender: TObject);
begin
  if PageTopFrm1.EdtMode.Text<> '追加' then
  // 編集用に新しいクライアントデータセットを開く
  with DataModule2 do
  begin
    try
      CDS_IH003.Active := False; // CDSを閉じる

      with FDQryIH003 do
      begin
        close;                   // SQL文初期化
        SQL.Clear;               // SQL初期化
        // SQL文開始↓
        SQL.Add(' select * , CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS');
        SQL.Add(' from TNMMSP where TNTNCD = :TNTNCD ');
        // DBGrid1で選択中の担当者CDを代入する
        ParamByName('TNTNCD').AsAnsiString := DataModule2.CDS_IH004.FieldByName('TNTNCD').AsString;

        Open;                    // FDQueryLogin2を展開する

        if IsEmpty then          // FDQueryLogin2にデータがない場合の処理
        begin                               // 例外エラーメッセージを作成
          raise Exception.Create('既に削除されている');
        end;
      end;

      CDS_IH003.Active := True;    // CDSを開く
      CDS_IH003.Edit;              // CDS編集モード

      // 権限
      if StrToIntDef(EdtKGKB.TEXT,-1)-1>=0 then
      begin
        case StrToIntDef(EdtKGKB.TEXT,0) of
          1: CmbKGNM.ItemIndex:=0;        // 一般
          2: CmbKGNM.ItemIndex:=1;        // 業務管理者
          5: CmbKGNM.ItemIndex:=2;        // システム管理者
        end;
      end;

      EdtPASS.Text:= GetDecPass;          // パスワードの処理（復号後の平文PASSを持ってくる）

      // 検索非表示（状態がDの時はチェックあり）
      if DataModule2.CDS_IH003.FieldByName('TNSTKB').Asstring='D' then
        chkSTKB.Checked:=true
      else
        chkSTKB.Checked:=false;

      except on e:Exception do            // 例外処理
      begin
        MessageDlg(E.Message, mtError, [mbOK], 0);
        self.close;
        abort;
      end;

    end; // tryここまで


  end; // withここまで
end;

procedure TIH003.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DataModule2 do // 担当者マスタで使用したDMの終了
  begin
    FDQryGene.Close;
    FDQryIH003.Close;
    CDS_IH003.Close;
  end;
end;

{*******************************************************************************
 目的:初期設定    (追加モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TIH003.InzAddMode;
begin
  inherited;
    with DataModule2 do
    begin
      // 編集用に1レコード追加している
      CDS_IH003.Close;              // CDS終了
      FDQryIH003.Close;                      // Qry終了
      FDQryIH003.SQL.Clear;                  // SQL初期化
      FDQryIH003.SQL.add(' SELECT TOP 1 * ');
      FDQryIH003.SQL.add(' FROM TNMMSP ');   // 先頭の1レコードを抽出

      CDS_IH003.Open;               // CDS開始
      CDS_IH003.EmptyDataSet;       // CDS抽出レコードを空にする
      CDS_IH003.Append;             // CDS追加モード
      try
        InitDataSet(CDS_IH003);     // detasetの初期化、0やNULLなど適切な空の表記にしている
      except
      end;
    end;
end;

{===============================================================================
パスワード復号用
===============================================================================}
function TIH003.GetDecPass: string;
begin
  result:='';

  with DataModule2.FDQryGene do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS ');
    SQL.Add('   FROM TNMMSP WHERE TNTNCD = :TNCD ');
    ParamByName('TNCD').AsString:=DataModule2.ClientDataSetTNMMSP.FieldByName('TNTNCD').AsString;
    Open;

    if IsEmpty=false then
    begin
      result:=FieldByName('PASS').AsString;
    end;
    Close;
    SQL.Clear;

  end;

end;

end.
