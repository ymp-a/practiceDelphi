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
    procedure FormShow(Sender: TObject);         // 画面表示の処理
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // 画面終了の処理
    procedure Button3Click(Sender: TObject);     // 追加ボタン
    procedure EdtMHTNCDExit(Sender: TObject);    // 担当者名自動挿入
    procedure EdtMTTNKAExit(Sender: TObject);    // 単価×数量処理
    procedure EdtMTSRYOExit(Sender: TObject);    // 単価×数量処理
    procedure DBCtrlGrid1Exit(Sender: TObject);  // DBCtrlGrid1からカーソルout処理
    procedure DBCtrlGrid1Enter(Sender: TObject); // DBCtrlGrid1にカーソルinの処理
    procedure F6Execute(Sender: TObject);        // F6無効処理
  private
    { Private 宣言 }
    gnocount:integer;                            // 行��

    procedure dspHeader;                         // 表示-ヘッダー項目設定
    procedure dspDetail;                         // 表示-明細項目設定

    procedure hset();                            // 更新時ヘッダー設定
    procedure mset();                            // 更新時明細設定

    //ClientDataSetのイベントに設定するイベント
    procedure AfterOpen(DataSet: TDataSet);      // CDSOpen直後の処理
    procedure AfterInsert(DataSet: TDataSet);    // 行数設定を挿入する
    procedure AfterScroll(DataSet: TDataSet);    // DataSet編集確定編集モード切替


    procedure InzAddMode;override;               // 初期設定（追加モード）
    procedure InzChgMode;override;               // 初期設定（変更モード）
//    procedure InzCpyMode;override;               // 初期設定（Copyモード）
    procedure InzDelMode;override;               // 初期設定（削除モード）
    procedure InzDspMode;override;               // 初期設定（表示モード）
    procedure DbAdd;override;                    // データベースへの変更（追加モード）
    procedure DbChenge;override;                 // データベースへの変更（変更モード）
    procedure DbDelete;override;                 // データベースへの変更（削除モード)
    function  LogicalChecOk:Boolean;override;    // 論理チェック


  public
    { Public 宣言 }
  var
    Mode : String;                               // モード判別用
    pNo : integer;                               // 見積��
    pMode:integer;                               // モード

  end;

var
  IH001: TIH001;

implementation

{$R *.dfm}

uses DM4, DM3, functions, MN001C, Utilybs, F0002;

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
  DataModule4.ClientDataSetMTMFLP.AfterOpen:=AfterOpen;     // CDSへ各イベントをセットする
  DataModule4.ClientDataSetMTMFLP.AfterInsert:=AfterInsert;
  DataModule4.ClientDataSetMTMFLP.AfterScroll:=AfterScroll;

  dspHeader;                                                // 表示-ヘッダー項目設定
  dspDetail;                                                // 表示-明細項目設定
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;
  cds1.Open;                                                // CDSMTHFLPオープン
  cds2.Open;                                                // CDSMTMFLPオープン

  cds1.Edit;                                                // 編集モード
  cds2.Edit;                                                // 編集モード

{
  //新規
  if pMode=1 then
  begin
//    cds2.Append;
//    DBText1.Field.AsInteger:=1;
//    cds2.Post;
  end;

  //変更
  if pMode=2 then
  begin
    DBEdit1.Enabled:=false;
    DBEdit11Exit(DBEdit11);
  end;

  //削除
  if pMode=3 then
  begin
    DBEdit1.Enabled:=false;
    Button1.Enabled:=false;
    x1:= ComponentCount;

    for I := 0 to x1-1 do
    begin
      compo := Components[I];
      if compo is TDBEdit then
        TDBEdit(compo).ReadOnly:=true;
      if compo is TDBCheckBox then
        TDBCheckBox(compo).ReadOnly:=true;
    end;

    DBEdit11Exit(DBEdit11);
  end;

  //照会
  if pMode=4 then
  begin
    DBEdit1.Enabled:=false;
    Button1.Enabled:=false;
    button2.Enabled:=false;
    x1:= ComponentCount;

    for I := 0 to x1-1 do
    begin
      compo := Components[I];
      if compo is TDBEdit then
        TDBEdit(compo).ReadOnly:=true;
      if compo is TDBCheckBox then
        TDBCheckBox(compo).ReadOnly:=true;
    end;


    DBEdit11Exit(DBEdit11);
  end;
 }

  //DBCheckboxの設定
  cds2.DisableControls;               // 画面ちらつき防止
  cds2.First;                         // 最初のレコードに移動
  for I := 0 to cds2.RecordCount-1 do // cds2全レコードの'D'チェック
  begin                               // 'D'のヘッダーレコードにはdataJTCDオン
    if cds2.FieldByName('MTJTCD').AsString='D' then
      cds2.FieldByName('dataJTCD').AsBoolean:=true
    else  cds2.FieldByName('dataJTCD').AsBoolean:=false ;

    cds2.Next;                        // レコードを一つ進める
  end;
  cds2.First;                         // 最初のレコードに移動
  cds2.EnableControls;                // active画面遷移再開する

end;

{===============================================================================
画面終了後に設定するイベント
===============================================================================}
procedure TIH001.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    // 非表示チェック
  if (Button2.Enabled=false)or(Button2.Visible=false) then abort;

//  Close;              // 画面終了

  with DataModule4 do // 使用したCDSとQryを終了
  begin
    ClientDataSetMTHFLP.Close;
    ClientDataSetMTMFLP.Close;
    FDQryMTHFLP.Close;
    FDQryMTMFLP.Close;
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
    DBCtrlGrid1.DataSource.DataSet.Append;
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
  qry.ParamByName('cd').AsInteger:= EdtMHTNCD.Field.AsInteger;
  qry.Open();

  if qry.IsEmpty then EdtMHTNCD.Field.AsString := '';  // 有効なTNCD以外なら入力フォームをクリア

  Label15.Caption:=qry.FieldByName('TNNAME').AsString; // 担当者名を挿入
  qry.close;

end;

{===============================================================================
単価Exit時のイベント
===============================================================================}
procedure TIH001.EdtMTTNKAExit(Sender: TObject);
begin
  DBCtrlGrid1.DataSource.DataSet.Edit;
  EdtMTKIN.Field.AsInteger:=EdtMTTNKA.Field.AsInteger*EdtMTSRYO.Field.AsInteger;

end;

{===============================================================================
単価Exit時のイベント
===============================================================================}
procedure TIH001.EdtMTSRYOExit(Sender: TObject);
begin
  DBCtrlGrid1.DataSource.DataSet.Edit;
  EdtMTKIN.Field.AsInteger:=EdtMTTNKA.Field.AsInteger*EdtMTSRYO.Field.AsInteger;

end;

{===============================================================================
DBCtrlGridイベント
===============================================================================}
procedure TIH001.DBCtrlGrid1Enter(Sender: TObject);
begin
  DataModule4.ClientDataSetMTMFLP.Edit;   // DBCtrlGridにカーソルinでCDS MTMFLP編集モード
end;

{===============================================================================
DBCtrlGridイベント
===============================================================================}
procedure TIH001.DBCtrlGrid1Exit(Sender: TObject);
begin
  if DataModule4.ClientDataSetMTMFLP.State=dsEdit then
    DataModule4.ClientDataSetMTMFLP.Post; // DBCtrlGridにカーソルinでCDS MTMFLP確定させる
end;

//ショートカット F6
procedure TIH001.F6Execute(Sender: TObject);
begin

  if Button1.Enabled = false  then exit;//ボタン押せない時は処理しない

  Button1.SetFocus;

  if Button1.Focused = true then
     Button1Click(Sender);

end;

{===============================================================================
表示-明細項目設定
===============================================================================}
procedure TIH001.dspDetail;
var
  qry: TFDQuery;
begin
  qry := DataModule4.FDQryMTMFLP;
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

  qry := DataModule4.FDQryMTHFLP;
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

end;

{===============================================================================
更新時ヘッダー設定
===============================================================================}
procedure TIH001.hset();
var
  cds1: TClientDataSet;
begin
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds1.Edit;
  //削除モードのみDで更新
  //※変更Mで削除データを見る事を想定
  //※今の処理では変更Mで削除データ生き返るよ
  if Mode = 'Del' then
    cds1.FieldByName('MHJTCD').AsString:='D'
  else cds1.FieldByName('MHJTCD').AsString:=''  ;

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
begin
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;

  cds2.DisableControls;
  cds2.first;
  for I := 0 to cds2.RecordCount-1 do
  begin
    cds2.FieldByName('MTNO').AsInteger:=cds1.FieldByName('MHNO').AsInteger;

    if cds2.FieldByName('dataJTCD').AsBoolean then
      cds2.FieldByName('MTJTCD').AsString:='D'
    else cds2.FieldByName('MTJTCD').AsString:=''  ;


    cds2.Next;
  end;


  cds2.EnableControls;
  cds2.Post;
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
    Dataset.FieldByName('mtno').AsInteger:= DataModule4.FDQryMTHFLP.FieldByName('mhno').AsInteger; // （AfterScrollでフィールド値ないって怒られるから追記）
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
論理チェック　引数：なし、戻り値：Bool
===============================================================================}
function TIH001.LogicalChecOk: Boolean;
begin

  Result :=False;

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



  ChkBlank(EdtMHNO,'見積��');

  //追加モードの場合見積�ｏd複チェックを行う。
  if (mode='Add') then
  begin
    if DataModule3.TNMMS(EdtMHTNCD.Field.AsString,true).Exists=true then
    begin
      MessageDlg('見積�ｂｪ重複しています。', mtError, [mbOk], 0);
      EdtMHNO.SetFocus;
      EdtMHNO.Color := clERR;
      Exit;
    end;
  end;

  ChkBlank(EdtMHIRDT,'見積依頼日');

  ChkBlank(EdtMHKGDT,'見積期限');

  ChkBlank(EdtMHTKCD,'得意先CD');

  ChkBlank(EdtMHTNCD,'担当者CD');

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
//  EdtMode.Text := '追加';
  Label15.Caption:='';    // 担当者名をブランクに初期化

 //排他制御
 //     追加モードでロックファイルのレコードを１件作成する。
 //     繰り返し入力などがあるので作成は１回のみ

//  if bFiest then
//  begin
//    bFiest:=False;
//     //排他制御用のFormを開いた日時取得
//    sOpenDATE:=dmUtilYbs.GetStmDate;
//    SOpenTime:=dmUtilYbs.GetStmTime;
//
//  end;

  FormShow(self);

end;

{*******************************************************************************
 目的:初期設定   (変更モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TIH001.InzChgMode;
begin
  inherited;
//  EdtMode.Text := '変更';
  pNo:=DataModule4.FDQryF0004.FieldByName('mhno').Asinteger;
  dspHeader;                         // 表示-ヘッダー項目設定
  dspDetail;                         // 表示-明細項目設定

  ChgReadOnly(EdtMHNO,true);         // TNCDを読込専用にするかの判別処理
end;

{*******************************************************************************
 目的:初期設定   (削除モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TIH001.InzDelMode;
begin
  inherited;
//  EdtMode.Text := '削除';
  Button1.Enabled:=false;//処理中は追加ボタンロック
  pNo:=DataModule4.FDQryF0004.FieldByName('mhno').Asinteger;
  dspHeader;                         // 表示-ヘッダー項目設定
  dspDetail;                         // 表示-明細項目設定

//  ChgReadOnly(EdtMHNO,true);         // TNCDを読込専用にするかの判別処理
//  ChgReadOnly(EdtMHIRDT,true);       // ChgReadOnlyメソッドでReadOnly:=False;
//  ChgReadOnly(EdtMHKGDT,true);       // Color:=clWindow;
//  ChgReadOnly(EdtMHTKCD,true);       // TabStop:=True;を行っている
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

    panel1.Enabled:=false;                 // 紙商ではにパネル単位でEnabledfalseしている
    panel2.Enabled:=false;                 // シンプルでかんたん
    F0002Frm.FldChange(Panel1);            // 入力フォームの色を一括変更している
    F0002Frm.FldChange(Panel2);

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
//  EdtMode.Text := '照会';
//  Button1.Enabled:=false;                                    // 処理中は追加ボタンをロック
//  Button2.Enabled:=false;                                    // 処理中は更新ボタンをロック

  pNo:=DataModule4.FDQryF0004.FieldByName('mhno').Asinteger; // pNo値をDM4からもってくる
  dspHeader;                                                 // 表示-ヘッダー項目設定
  dspDetail;                                                 // 表示-明細項目設定

//  ChgReadOnly(EdtMHNO,true);
//  ChgReadOnly(EdtMHIRDT,true);
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

{    x1:= ComponentCount;                   // 上のコメントアウトをひとまとめたものが以下
    for I := 0 to x1-1 do                  // コンポーネントの数繰り返す処理
    begin
      compo := Components[I];              // コンポーネントのindex[0]から格納する
      if compo is TDBEditUnic then         // コンポーネントがTEditUnicのとき
//        TDBEdit(compo).ReadOnly:=true;     // ReadOnlyをオンにする、フォームの色は変わらない
         ChgReadOnly(compo,true);          // ChgReadOnlyメソッドを利用してもOK
      if compo is TDBCheckBox then         // コンポーネントがTDBCheckBoxのとき
        TDBCheckBox(compo).ReadOnly:=true; // ReadOnlyをオンにする
    end;                                   // Enabledfalseにするには不向きなロジック
}
//    ActionList1[1].Enabled:=false;         // ファンクションキー更新（F6）の無効
                                           // ActionListインデックスはリスト並び順通り

//    panel1.Enabled:=false;                 // 紙商ではにパネル単位でEnabledfalseしている
//    panel2.Enabled:=false;                 // シンプルでかんたん
//    F0002Frm.FldChange(Panel1);            // 入力フォームの色を一括変更している
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
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;

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
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;

  hset;                   // ヘッダー項目セット
  mset;                   // 明細項目セット

  try
    con.StartTransaction; // 変更トランザクション開始（必ずコミットかロールバックすること）

//    cds1.ApplyUpdates(0);
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
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;

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
