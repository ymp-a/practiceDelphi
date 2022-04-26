unit IH001U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EdtTraHM, System.Actions, Vcl.ActnList,
  Vcl.DBCGrids, PageTop, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DBEditUNIC, Vcl.DBCtrls,
  Vcl.Mask, FireDAC.Comp.Client, Data.DB, DBClient;

type
  TIH001 = class(TEdtTraHMFrm)
    EdtMHBIKO: TDBEditUNIC;
    Label6: TLabel;
    EdtMHKGDT: TDBEditUNIC;
    Label3: TLabel;
    Label15: TLabel;
    EdtMHTNCD: TDBEditUNIC;
    Label5: TLabel;
    EdtMHIRDT: TDBEditUNIC;
    Label2: TLabel;
    EdtMHTKNM: TDBEditUNIC;
    EdtMHTKCD: TDBEditUNIC;
    Label4: TLabel;
    EdtMHNO: TDBEditUNIC;
    Label1: TLabel;
    EdtMHGKIN: TDBEditUNIC;
    Label14: TLabel;
    EdtMHGSRO: TDBEditUNIC;
    Label13: TLabel;
    EdtMTTNKA: TDBEditUNIC;
    EdtMTBIKO: TDBEditUNIC;
    EdtMTKIN: TDBEditUNIC;
    EdtMTSRYO: TDBEditUNIC;
    EdtMTSHNM: TDBEditUNIC;
    EdtMTSHCD: TDBEditUNIC;
    ChkDel1: TDBCheckBox;
    EdtMTGNO: TDBText;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Button3: TButton;
    EdtMTNO: TDBText;
    Label16: TLabel;
    Label17: TLabel;
    mSRYO: TDBEditUNIC;
    mKIN: TDBEditUNIC;
    Label18: TLabel;
    Label19: TLabel;
    procedure FormShow(Sender: TObject);         // 画面表示の処理
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // 画面終了の処理
    procedure Button3Click(Sender: TObject);     // 追加ボタン
    procedure EdtMHTNCDExit(Sender: TObject);    // 担当者名自動挿入
    procedure EdtMTTNKAExit(Sender: TObject);    // 単価×数量処理
    procedure EdtMTSRYOExit(Sender: TObject);    // 単価×数量処理
    procedure DBCtrlGrid1Exit(Sender: TObject);  // DBCtrlGrid1からカーソルout処理
    procedure DBCtrlGrid1Enter(Sender: TObject); // DBCtrlGrid1にカーソルinの処理
    procedure F6Execute(Sender: TObject);        // F6無効処理
    procedure EdtTNCDDblClick(Sender: TObject);  // TNCDマスタ検索

  private
    { Private 宣言 }
    gnocount:integer;                            // 行№

    procedure dspHeader;                         // 表示-ヘッダー項目設定
    procedure dspDetail;                         // 表示-明細項目設定

    procedure hset();                            // 更新時ヘッダー設定
    procedure mset();                            // 更新時明細設定

    //ClientDataSetに設定するイベント
    procedure AfterOpen(DataSet: TDataSet);      // CDSOpen直後の処理
    procedure AfterInsert(DataSet: TDataSet);    // 行数設定を挿入する
    procedure AfterScroll(DataSet: TDataSet);    // DataSet編集確定編集モード切替
    procedure BeforeScroll(DataSet: TDataSet);   // 行遷移時の数量金額の合計を反映したい

    procedure InzAddMode;override;               // 初期設定（追加モード）
    procedure InzChgMode;override;               // 初期設定（変更モード）
    procedure InzCpyMode;override;               // 初期設定（Copyモード）
    procedure InzDelMode;override;               // 初期設定（削除モード）
    procedure InzDspMode;override;               // 初期設定（表示モード）
    procedure DbAdd;override;                    // データベースへの変更（追加モード）
    procedure DbChenge;override;                 // データベースへの変更（変更モード）
    procedure DbDelete;override;                 // データベースへの変更（削除モード)
    function  LogicalChecOk:Boolean;override;    // 論理チェック


  public
    { Public 宣言 }
  var
    pNo : integer;                               // 見積№
    pMode:integer;                               // モード
    copyNo:Integer;
  end;

var
  IH001: TIH001;

implementation

{$R *.dfm}

uses DM4, DM3, functions, MN001C, Utilybs, F0002, IH004MSU;

{===============================================================================
画面展開後に設定するイベント
===============================================================================}
procedure TIH001.FormShow(Sender: TObject);
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  compo: TObject;
  I: Integer;
  x1: Integer;
  x2: Integer;
begin
  inherited;
  DataModule4.CDS_IH001_MTM.AfterOpen:=AfterOpen;           // CDSへ各イベントをセットする
  DataModule4.CDS_IH001_MTM.AfterInsert:=AfterInsert;
  DataModule4.CDS_IH001_MTM.AfterScroll:=AfterScroll;
  DataModule4.CDS_IH001_MTM.BeforeScroll:=BeforeScroll;

  dspHeader;                                                // 表示-ヘッダー項目設定 Qry
  dspDetail;                                                // 表示-明細項目設定 Qry
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;
  cds1.Open;                                                // CDSMTHFLPオープン
  cds2.Open;                                                // CDSMTMFLPオープン
  cds1.Edit;                                                // 編集モード
  cds2.Edit;                                                // 編集モード
  EdtMHTNCDExit(self);                                      // 担当者名あれば表示

  //DBCheckboxの設定
  cds2.DisableControls;               // 画面ちらつき防止
  cds2.First;                         // 最初のレコードに移動
  for I := 0 to cds2.RecordCount-1 do // cds2全レコードの'D'チェック
  begin                               // 'D'のヘッダーレコードにはdataJTCDオン(DBCheckBoxの表示)
    if cds2.FieldByName('MTJTCD').AsString='D' then
    begin
      cds2.FieldByName('dataJTCD').AsBoolean:=true;
    end else
    begin
      cds2.FieldByName('dataJTCD').AsBoolean:=false;
    end;
    cds2.Next;                        // レコードを一つ進める
  end;
  cds2.First;                         // 最初のレコードに移動
  cds2.EnableControls;                // active画面遷移再開する



  // 追加、コピーモード時は最新の見積№をセット
  if (Mode='Add') or (Mode='Cpy') then
    DataModule4.CDS_IH001_MTH.FieldByName('MHNO').AsString:=DataModule4.MHTNO().MHNO;

  // 追加モード時は見積依頼日に入力日をセット
  if (Mode='Add') then
    DataModule4.CDS_IH001_MTH.FieldByName('MHIRDT').AsString :=DateToStr(Date);
end;

{===============================================================================
画面終了後に設定するイベント
===============================================================================}
procedure TIH001.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    // 非表示チェック
  if (Button2.Enabled=false)or(Button2.Visible=false) then abort;

  with DataModule4 do   // 使用したCDSとQryを終了
  begin
    CDS_IH001_MTH.Close;
    CDS_IH001_MTM.Close;
    IH001_MTH.Close;
    IH001_MTM.Close;
  end;

end;

{*******************************************************************************
 目的:追加ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TIH001.Button3Click(Sender: TObject);
begin
  inherited;
  if DBCtrlGrid1.DataSource.DataSet.Active then
  begin
    DBCtrlGrid1.DataSource.DataSet.Append; // 最終行にレコード追加する
  end;
end;

{===============================================================================
担当者CDExit時のイベント 入力したTNCDが存在したら担当名を表示する。
===============================================================================}
procedure TIH001.EdtMHTNCDExit(Sender: TObject);
var
  qry: TFDQuery;
begin
  qry:=DataModule3.FDQryGene;
  qry.Close;
  qry.SQL.Clear;
  qry.Params.Clear;

  qry.SQL.Add('select * from tnmmsp');
  qry.SQL.Add(' where tntncd=:cd');
  qry.SQL.Add('and tnstkb <> ''D'' ');
  qry.SQL.Add('');
  qry.ParamByName('cd').AsInteger:= EdtMHTNCD.Field.AsInteger; // 未入力（空白）は0に自動変換される便利
  qry.Open();

  if qry.IsEmpty then EdtMHTNCD.Field.AsString := '';  // 有効なTNCD以外なら入力フォームをクリア

  Label15.Caption:=qry.FieldByName('TNNAME').AsString; // 担当者名を挿入
  qry.close;

end;

{===============================================================================
単価Exit時のイベント（数量*単価）
===============================================================================}
procedure TIH001.EdtMTTNKAExit(Sender: TObject);
begin
  DBCtrlGrid1.DataSource.DataSet.Edit;
  EdtMTKIN.Field.AsInteger:=EdtMTTNKA.Field.AsInteger*EdtMTSRYO.Field.AsInteger;

end;

{===============================================================================
単価Exit時のイベント（数量*単価）
===============================================================================}
procedure TIH001.EdtMTSRYOExit(Sender: TObject);
begin
  DBCtrlGrid1.DataSource.DataSet.Edit;
  EdtMTKIN.Field.AsInteger:=EdtMTTNKA.Field.AsInteger*EdtMTSRYO.Field.AsInteger;

end;

{===============================================================================
DBCtrlGridEnter時のイベント
===============================================================================}
procedure TIH001.DBCtrlGrid1Enter(Sender: TObject);
begin
  DataModule4.CDS_IH001_MTM.Edit;   // DBCtrlGridにカーソルinでCDS MTMFLP編集モード
end;

{===============================================================================
DBCtrlGridExit時のイベント
===============================================================================}
procedure TIH001.DBCtrlGrid1Exit(Sender: TObject);
var
  I:Integer;
  cds1: TClientDataSet;
  cds2: TClientDataSet;
begin
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;

  if DataModule4.CDS_IH001_MTM.State=dsEdit then
  begin

    //DBCheckboxの設定
    cds2.DisableControls;               // 画面ちらつき防止
    cds2.First;                         // 最初のレコードに移動
    for I := 0 to cds2.RecordCount-1 do // cds2全レコードの'D'チェック
    begin                               // 'D'のヘッダーレコードにはdataJTCDオン
      if cds2.FieldByName('dataJTCD').AsBoolean=true then
      begin
        // 数量と金額をマイナスフィールドに格納する
        DataModule4.CDS_IH001_MTM.FieldByName('mSRYO').AsInteger:=
        DataModule4.CDS_IH001_MTM.FieldByName('MTSRYO').AsInteger;
        DataModule4.CDS_IH001_MTM.FieldByName('mKIN').AsInteger:=
        DataModule4.CDS_IH001_MTM.FieldByName('MTKIN').AsInteger;
      end else
      begin
        // 明細削除チェックがないときマイナスフィールドを0にする
        DataModule4.CDS_IH001_MTM.FieldByName('mSRYO').AsInteger:=0;
        DataModule4.CDS_IH001_MTM.FieldByName('mKIN').AsInteger:=0;
      end;
      cds2.Next;                        // レコードを一つ進める
    end;
    cds2.First;                         // 最初のレコードに移動
    cds2.EnableControls;                // active画面遷移再開する

    DataModule4.CDS_IH001_MTM.Post;     // DBCtrlGridにカーソルinでCDS MTMFLP確定させる
   end;
end;

{===============================================================================
ショートカット F6　継承時の削除画面でF6キー無効化にしたかった
===============================================================================}
procedure TIH001.F6Execute(Sender: TObject);
begin

  if Button1.Enabled = false  then exit;// ボタン1が押せない時は終了する

    Button1.SetFocus;                   // ボタン1へフォーカスセット

  if Button1.Focused = true then        // フォーカスセットできた時は
     Button1Click(Sender);              // ボタン1クリックイベント発火

end;

{===============================================================================
 担当者マスタ検索処理（ダブルクリックイベント）
===============================================================================}
procedure TIH001.EdtTNCDDblClick(Sender: TObject);
Var
  frm : TForm;
begin
  // 読取専用時は終了する
  if (Sender as TDBEditUNIC).ReadOnly=true then Exit;

  // 担当者検索を作成
  frm := TIH004MS.Create(Self);
  // 担当者CDが入力されていれば担当検索画面のEdtTNCDテキストにセット
  (frm as TIH004MS).EdtTNCD.text:=(Sender as TDBEditUNIC).Text;

  // http://kakinotane.s7.xrea.com/delphi/d2/d034.html （詳細）
  // 担当検索終了時の処理
  if frm.showmodal = mrok then
  begin
    // 選択時、フィールドに値をセット  なぜ プロパティSltTNCD を使っている？
    (Sender as TDBEditUNIC).Field.AsString :=(frm as TIH004MS).SltTNCD;
    // TABキー押したようにカーソルを次へ動かす指示
    SendMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
  frm.Release;

end;

{===============================================================================
表示-明細項目設定
===============================================================================}
procedure TIH001.dspDetail;
var
  qry: TFDQuery;
begin
  qry := DataModule4.IH001_MTM;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.Params.Clear;

    qry.SQL.Add('select * from mtmflp');
    qry.SQL.Add(' where mtno=:no ');
    qry.SQL.Add('');
    qry.SQL.Add('order by mtno,mtgno');
    qry.SQL.Add('');

    qry.ParamByName('no').AsInteger:=pNo;
    qry.Open();

  finally

  end;

end;

{===============================================================================
表示-ヘッダー項目設定
===============================================================================}
procedure TIH001.dspHeader;
var
  qry: TFDQuery;
begin
  Label15.Caption:='';

  qry := DataModule4.IH001_MTH;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.Params.Clear;

    qry.SQL.Add('select * from mthflp');
    qry.SQL.Add(' left join  tnmmsp on mhtncd=tntncd');
    qry.SQL.Add(' where mhno=:no ');
    qry.SQL.Add('');
    qry.SQL.Add('');
    qry.SQL.Add('');

    qry.ParamByName('no').AsInteger:=pNo;
    qry.Open();

  finally

  end;

  if Mode='Cpy' then // Cpy用にもう一つ展開しておく
  begin
    try
      DataModule4.FDQryMTHFLP.Close;
      DataModule4.FDQryMTHFLP.SQL.Clear;
      DataModule4.FDQryMTHFLP.Params.Clear;

      DataModule4.FDQryMTHFLP.SQL.Add('select * from mthflp');
      DataModule4.FDQryMTHFLP.SQL.Add(' left join  tnmmsp on mhtncd=tntncd');
      DataModule4.FDQryMTHFLP.SQL.Add(' where mhno=:no ');
      DataModule4.FDQryMTHFLP.SQL.Add('');
      DataModule4.FDQryMTHFLP.SQL.Add('');
      DataModule4.FDQryMTHFLP.SQL.Add('');

      DataModule4.FDQryMTHFLP.ParamByName('no').AsInteger:=pNo;
      DataModule4.FDQryMTHFLP.Open();

    finally

    end;
  end;

end;

{===============================================================================
更新時ヘッダー設定
===============================================================================}
procedure TIH001.hset();
var
  cds1: TClientDataSet;
begin
  cds1 := DataModule4.CDS_IH001_MTH;
  cds1.Edit;
  //削除モードのみDで更新
  //※変更Mで削除データを見る事を想定
  //※今の処理では変更Mで削除データ生き返るよ
  if PageTopFrm1.EdtMode.Text = '削除' then
  begin
    cds1.FieldByName('MHJTCD').AsString:='D';
//    mset; // ヘッダー内で明細確定処理することで削除フラグオン、合計数量、金額を0に書き換えている
  end else cds1.FieldByName('MHJTCD').AsString:=''  ;

  cds1.FieldByName('MHGKIN').AsInteger:=EdtMHGKIN.Field.Value;
  cds1.FieldByName('MHGSRO').AsInteger:=EdtMHGSRO.Field.value;
  cds1.Post;

end;

{===============================================================================
更新時明細設定
===============================================================================}
procedure TIH001.mset();
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  I: Integer;
  count: Integer;
begin
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;
  count := 0; // MTJTCDが'D'の数をチェックする


  cds2.DisableControls;
  cds2.first;
  for I := 0 to cds2.RecordCount-1 do
  begin
    cds2.FieldByName('MTNO').AsInteger:=cds1.FieldByName('MHNO').AsInteger;

    // 見積明細にチェックがあるとき、もしくは見積ヘッダーが削除状態のときDBCheckBox表示を反映する
    if (cds2.FieldByName('dataJTCD').AsBoolean) or (cds1.FieldByName('MHJTCD').AsString='D') then
    begin
      cds2.FieldByName('MTJTCD').AsString:='D';
      cds2.FieldByName('dataJTCD').AsBoolean:=true;
    end else
    begin
      cds2.FieldByName('MTJTCD').AsString:='';
      cds2.FieldByName('dataJTCD').AsBoolean:=false;
    end;

    // 変更モード時見積明細のDBCheckBoxがすべて削除チェックならヘッダーも'D'にする
    if PageTopFrm1.EdtMode.Text = '変更' then
    begin
      if cds2.FieldByName('MTJTCD').AsString='D' then
        count := count + 1;

      if count = cds2.RecordCount then
      begin
        cds1.Edit;;
        cds1.FieldByName('MHJTCD').AsString:='D';
        cds1.Post;
      end;
    end;


    cds2.Next;
  end;


  cds2.EnableControls;
  cds2.Post;
  // 削除モード時、見積ヘッダーの合計数量0、金額0を確定させるため再呼び出す
  if PageTopFrm1.EdtMode.Text = '削除' then hset;

end;

{===============================================================================
ClientDataSetのイベントに設定するイベント
===============================================================================}
procedure TIH001.AfterInsert(DataSet: TDataSet);
begin
  if DataSet.FieldByName('mtgno').AsInteger=0 then    // 行数0のとき
  begin
    Dataset.Edit;                                     // 編集モード開始
    inc(gnocount);                                    // gncount += 1と同義、インクリメントメソッド
    DataSet.FieldByName('mtgno').AsInteger:=gnocount; // 行数を設定する
    Dataset.FieldByName('mtno').AsInteger:= DataModule4.IH001_MTH.FieldByName('mhno').AsInteger; // （AfterScrollでフィールド値ないって怒られるから追記）
  end;

  Dataset.FieldByName('dataJTCD').AsBoolean:=false;   // data状態CDをfalse初期化
  Dataset.FieldByName('MTJTCD').AsString:='';         // 状態CDに空白

end;

{===============================================================================
ClientDataSetのイベントに設定するイベント
===============================================================================}
procedure TIH001.AfterOpen(DataSet: TDataSet);
begin
  DataSet.Last;                                       // レコード最後尾参照
  if dataset.FieldByName('mtgno').AsInteger<=0 then   // 行数が0以下のとき
  begin
    gnocount:=0;                                      // 行数0に設定
  end else begin                                      // 行数があるとき
    gnocount:=dataset.FieldByName('mtgno').AsInteger; // 最後尾レコードの行数を取得
  end;
  DataSet.First;                                      // レコード最前列参照

end;

{===============================================================================
ClientDataSetのイベントに設定するイベント
===============================================================================}
procedure TIH001.AfterScroll(DataSet: TDataSet);
begin
  Dataset.Edit; // DataSet編集モード if FRecordCount = 0 のとき AfterInsertへ移行する
  Dataset.Post; // ここでフィールドMTNOの値が必要ですエラーがでた
  Dataset.Edit;

end;

{===============================================================================
ClientDataSetのイベントに設定するイベント
===============================================================================}
procedure TIH001.BeforeScroll(DataSet: TDataSet);
begin
  if PageTopFrm1.EdtMode.Text <> '追加' then  // Add時除外理由->スタックオーバーフロー回避のため
  begin
  Dataset.Edit;

  // 明細削除チェックがあるとき、またはヘッダー状態'D'のとき
  if DataModule4.CDS_IH001_MTM.FieldByName('dataJTCD').AsBoolean=true then
    begin
      // 数量と金額をマイナスフィールドに格納する
      DataModule4.CDS_IH001_MTM.FieldByName('mSRYO').AsInteger:=
      DataModule4.CDS_IH001_MTM.FieldByName('MTSRYO').AsInteger;
      DataModule4.CDS_IH001_MTM.FieldByName('mKIN').AsInteger:=
      DataModule4.CDS_IH001_MTM.FieldByName('MTKIN').AsInteger;
    end else
    begin
      // 明細削除チェックがないときマイナスフィールドを0にする
      DataModule4.CDS_IH001_MTM.FieldByName('mSRYO').AsInteger:=0;
      DataModule4.CDS_IH001_MTM.FieldByName('mKIN').AsInteger:=0;
    end;

  Dataset.Post;
  Dataset.Edit;
  end;
end;

{===============================================================================
論理チェック　引数：なし、戻り値：Bool
===============================================================================}
function TIH001.LogicalChecOk: Boolean;
var
 I:Integer;
 Delflag:Boolean;
begin

  Result :=False;
  Delflag :=False;

  if mode='Add' then
    //EdtTNCD.Color := clWindow;

  if mode='Del' then
  begin

    //得意先があったら削除禁止
{    with DataModule3.FDQryGene do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT TOTKCD FROM TOKMSP WHERE TOTNCD=:TNCD AND TOJTCD='''' ');
      ParamByName('TNCD').AsString:=EdtTNCD.Field.AsString;
      Open;
      if not IsEmpty then
      begin
        MessageDlg('紐づく得意先(CD:'+FieldByName('TOTKCD').AsString+'など)があるため削除できません', mtError, [mbOK], 0);
        Exit;
      end;
    end;
}
    Result:=true;
    exit;
  end;



  ChkBlank(EdtMHNO,'見積№');

  //追加モードの場合見積№重複チェックを行う。
  if (mode='Add') or (mode='Cpy') then
  begin
    if DataModule4.MTHMS(EdtMHNO.Field.AsString,true).Exists=true then
    begin
      MessageDlg('見積№が重複しています。', mtError, [mbOk], 0);
      EdtMHNO.SetFocus;
      EdtMHNO.Color := clERR;
      Exit;
    end;
  end;

  ChkBlank(EdtMHIRDT,'見積依頼日');

  ChkBlank(EdtMHKGDT,'見積期限');

  // 見積依頼日＜見積期限チェック
  if EdtMHIRDT.Field.AsDateTime > EdtMHKGDT.Field.AsDateTime then
  begin
    MessageDlg('見積期限が見積依頼日より前になっています。', mtError, [mbOk], 0);
    EdtMHKGDT.SetFocus;
    EdtMHKGDT.Color := clERR;
    Exit;
  end;

  ChkBlank(EdtMHTKCD,'得意先CD');

  ChkBlank(EdtMHTNCD,'担当者CD');

  // 空の行削除処理
  // DBCheckboxの設定
  DataModule4.CDS_IH001_MTM.DisableControls;               // 画面ちらつき防止
  DataModule4.CDS_IH001_MTM.First;                         // 最初のレコードに移動
  for I := 0 to DataModule4.CDS_IH001_MTM.RecordCount-1 do // cds2全レコードの空白チェック
  begin                                                    // 商品CD商品名、合計金額、備考が空白なら行削除
    if (DataModule4.CDS_IH001_MTM.FieldByName('MTSHCD').AsString='') AND
       (DataModule4.CDS_IH001_MTM.FieldByName('MTSHNM').AsString='') AND
       ((DataModule4.CDS_IH001_MTM.FieldByName('MTKIN').AsString='0') OR
       (DataModule4.CDS_IH001_MTM.FieldByName('MTKIN').AsString=''))  AND
       (DataModule4.CDS_IH001_MTM.FieldByName('MTBIKO').AsString='') then
       begin
         DataModule4.CDS_IH001_MTM.EnableControls;         // 削除ダイアログ表示で画面遷移再開する
         if MessageDlg('行番号'+EdtMTGNO.Field.AsString+'を削除します。よろしいですか？',
            mtConfirmation, [mbYes,mbNo], 0) = mrYes then
            DBCtrlGrid1.DataSource.DataSet.Delete;         // 行削除できた
            DataModule4.CDS_IH001_MTM.DisableControls;     // 削除ダイアログ後画面ちらつき防止する
       end;

    DataModule4.CDS_IH001_MTM.Next;                        // レコードを一つ進める
  end;
  DataModule4.CDS_IH001_MTM.First;                         // 最初のレコードに移動

  // 見積行番号がずれてた場合レコード番号と合わせる
  for I := 0 to DataModule4.CDS_IH001_MTM.RecordCount-1 do // cds2全レコードの空白チェック
  begin // 見積行番号とレコードインデックス+1が合わなければ
    if DataModule4.CDS_IH001_MTM.FieldByName('MTGNO').AsInteger<>I+1 then
        DataModule4.CDS_IH001_MTM.FieldByName('MTGNO').AsInteger:=I+1; // 行番号とレコードインデックス+1を格納
    DataModule4.CDS_IH001_MTM.Next;                        // レコードを一つ進める
  end;

  DataModule4.CDS_IH001_MTM.First;                         // 最初のレコードに移動
  DataModule4.CDS_IH001_MTM.EnableControls;                // active画面遷移再開する
// 行削除後に行追加するとレコード最後+1で行番号を生成するため番号が飛んでしまう。仕様でいいのか？

  ChkBlank(EdtMTSHCD,'商品CD');

  Result :=True;

end;

{*******************************************************************************
 目的:初期設定    (追加モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TIH001.InzAddMode;
begin
  inherited;

  ChkDel1.Enabled:=false;            // 追加モード時は削除Boxに触らせない
end;

{*******************************************************************************
 目的:初期設定   (変更モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TIH001.InzChgMode;
begin
  inherited;
//  EdtMode.Text := '変更';          // 継承もとでやってる
  pNo:=DataModule4.CDS_IH002.FieldByName('mhno').Asinteger;

  ChgReadOnly(EdtMHNO,true);         // TNCDを読込専用にするかの判別処理

end;

{*******************************************************************************
 目的:初期設定   (copyモードの設定) 2つ用意したCDSから値をコピーする
 引数:
 戻値:
*******************************************************************************}
procedure TIH001.InzCpyMode;
begin
  inherited;
  pNo:=DataModule4.CDS_IH002.FieldByName('mhno').Asinteger;
  DataModule4.CDS_IH001_MTH.Open;       // CDS_IH001_MTH展開 コピー用
  DataModule4.ClientDataSetMTHFLP.Open; // CDSMTHFLP展開     コピー用

  DataModule4.CDS_IH001_MTH.Insert; // 挿入モードだとCDS_IH001_MTHヘッダー値が初期化されるので

  // ヘッダーフィールドにClientDataSetMTHFLP値を格納する
  DataModule4.CDS_IH001_MTH.FieldByName('MHIRDT').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHIRDT').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHKGDT').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHKGDT').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHTKCD').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHTKCD').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHTKNM').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHTKNM').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHTNCD').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHTNCD').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHBIKO').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHBIKO').AsString;

  DataModule4.ClientDataSetMTHFLP.Close; // CDSMTHFLPをとじる

end;

{*******************************************************************************
 目的:初期設定   (削除モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TIH001.InzDelMode;
begin
  inherited;

  pNo:=DataModule4.CDS_IH002.FieldByName('mhno').Asinteger;

end;

{*******************************************************************************
 目的:初期設定   (照会モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TIH001.InzDspMode;
var
  compo: TObject;
  I: Integer;
  x1: Integer;
  x2: Integer;
begin
  inherited;
//  EdtMode.Text := '照会';                                  // 継承元でやってる
//  Button1.Enabled:=false;                                  // 処理中は追加ボタンをロック
//  Button2.Enabled:=false;                                  // 処理中は更新ボタンをロック

  pNo:=DataModule4.CDS_IH002.FieldByName('mhno').Asinteger;  // pNo値をDM4からもってくる


//  ChgReadOnly(EdtMHNO,true);             // 各コンポーネントを読取専用にするパターン
//  ChgReadOnly(EdtMHIRDT,true);           // 記述量が半端なくなる
//  ChgReadOnly(EdtMHKGDT,true);
//  ChgReadOnly(EdtMHTKCD,true);
//  ChgReadOnly(EdtMHTKNM,true);
//  ChgReadOnly(EdtMHTNCD,true);
//  ChgReadOnly(EdtMHBIKO,true);
//  ChgReadOnly(EdtMTSHCD,true);
//  ChgReadOnly(EdtMTSHNM,true);
//  ChgReadOnly(EdtMTTNKA,true);
//  ChgReadOnly(EdtMTSRYO,true);
//  ChgReadOnly(EdtMTKIN,true);
//  ChgReadOnly(EdtMTBIKO,true);
//  ChkDel1.Enabled:=false;
//  ChgReadOnly(EdtMHGSRO,true);
//  ChgReadOnly(EdtMHGKIN,true);

{    x1:= ComponentCount;                  // 上の処理をまとめたものが以下
    for I := 0 to x1-1 do                  // コンポーネントの数繰返す処理
    begin
      compo := Components[I];              // コンポーネントのindex[0]から格納する
      if compo is TDBEditUnic then         // コンポーネントがTEditUnicのとき
//        TDBEdit(compo).ReadOnly:=true;   // ReadOnlyをオンにする、フォームの色は変わらない
         ChgReadOnly(compo,true);          // ChgReadOnlyメソッドを利用してもOK
      if compo is TDBCheckBox then         // コンポーネントがTDBCheckBoxのとき
        TDBCheckBox(compo).ReadOnly:=true; // ReadOnlyをオンにする
    end;                                   // Enabledfalseにするには不向きなロジック
}
//    ActionList1[1].Enabled:=false;       // ファンクションキー更新（F6）の無効
                                           // ActionListインデックスはリスト並び順通り

//    panel1.Enabled:=false;               // 紙商ではパネル単位でEnabledfalseしている
//    panel2.Enabled:=false;               // シンプルでかんたん
//    F0002Frm.FldChange(Panel1);          // 入力フォームの色を一括変更している
//    F0002Frm.FldChange(Panel2);
end;

{===============================================================================
データベースへの変更（追加モード）
===============================================================================}
procedure TIH001.DbAdd;
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  con: TFDConnection;
begin
  inherited;
  con:= UtilYbs.dmUtilYbs.FDConnection1;
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;

  hset;                   // ヘッダー項目セット
  mset;                   // 明細項目セット

  try
    con.StartTransaction; // 変更トランザクション開始（必ずコミットかロールバックすること）

    cds1.ApplyUpdates(0); // データ更新
    cds2.ApplyUpdates(0); // 下記の方法でも処理は一緒？

    //データベース更新
//    if ApplyUpdates(0) >  0 then             //エラーの場合は中断
//    begin
//      Abort;
//    end;

    con.Commit;           //コミット
    MessageDlg('新規登録が完了しました（・ω・）',mtInformation, [mbOK], 0); //更新確認ダイアログ

    except
    on e:Exception do     // 例外処理
    begin
      con.Rollback;       // エラー時はロールバック
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
    end;

  end; // tryここまで

   Close;                  // 画面終了

end;

{===============================================================================
データベースへの変更（変更モード）
===============================================================================}
procedure TIH001.DbChenge;
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  con: TFDConnection;
begin
  inherited;
  con:= UtilYbs.dmUtilYbs.FDConnection1;
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;

  hset;                   // ヘッダー項目セット
  mset;                   // 明細項目セット

  try
    con.StartTransaction; // 変更トランザクション開始（必ずコミットかロールバックすること）

//    cds1.ApplyUpdates(0); // 下とどちらの書き方でも同じ
//    cds2.ApplyUpdates(0);

    //データベース更新
    if cds1.ApplyUpdates(0) >  0 then
    begin
      Abort;              // エラーの場合は中断
    end;

    if cds2.ApplyUpdates(0) >  0 then
    begin
      Abort;              // エラーの場合は中断
    end;

    con.Commit;           // コミット
    MessageDlg('変更が完了しました（^ω^）',mtInformation, [mbOK], 0); //更新確認ダイアログ

    except
    on e:Exception do     // 例外処理
    begin
      con.Rollback;       // エラー時はロールバック
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
    end;

  end;

  Close;                  // 画面終了

end;


{===============================================================================
データベースへの変更（削除モード）
===============================================================================}
procedure TIH001.DbDelete;
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  con: TFDConnection;
begin
  inherited;
  con:= UtilYbs.dmUtilYbs.FDConnection1;
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;

  hset;                   // ヘッダー項目セット
  mset;                   // 明細項目セット

  try
    con.StartTransaction; // 変更トランザクション開始（必ずコミットかロールバックすること）
    //削除

    //データベース更新
    if cds1.ApplyUpdates(0) >  0 then              //エラーの場合は中断
    begin
      Abort;              // エラーの場合は中断
    end;

    if cds2.ApplyUpdates(0) >  0 then
    begin
      Abort;              // エラーの場合は中断
    end;

    con.Commit;           // コミット
    MessageDlg('削除が完了しました（●o●）',mtInformation, [mbOK], 0); //更新確認ダイアログ

    except
    on e:Exception do     // 例外処理
    begin
      con.Rollback;       // ロールバック
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
    end;

  end;

  Close;                  // 画面終了

end;

end.
