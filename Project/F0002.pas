unit F0002;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, DBClient,
  Vcl.DBCtrls, DBEditUNIC, MaskEditDate, System.Actions, Vcl.ActnList;

type
  TF0002Frm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    chkSTKB: TCheckBox;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    EdtKGKB: TDBEditUNIC;
    CmbKGNM: TComboBox;
    EdtPASSw: TDBEditUNIC;
    EdtMode: TEdit;
    EdtPass: TEdit;
    EdtTNCD: TDBEditUNIC;
    EdtNAME: TDBEditUNIC;
    ActionList1: TActionList;
    F9: TAction;
    F6: TAction;
    // 　　　↑↑TDBEditを利用するとchecklogicの際にブランク検出される。
    // 理由はCDSオープン時にPass消えてしまうため。
    // 入力フォーム上は文字列があるように見えるが内部的にブランク扱い？

    procedure Button3Click(Sender: TObject);        // 終了ボタンの処理
    procedure Button2Click(Sender: TObject);        // 更新ボタンの処理
  private
    { Private 宣言 }
    procedure DataOpen;                             // データオープン

    function  LogicalChecOk:Boolean;                // 論理チェック
    procedure InzAddMode;virtual;                   // 初期設定（追加モード）
    procedure InzChgMode;virtual;                   // 初期設定（変更モード）
//    procedure InzCpyMode;virtual;                 // 初期設定（Copyモード）
    procedure InzDelMode;virtual;                   // 初期設定（削除モード）
//    procedure InzDspMode;virtual;                 // 初期設定（表示モード）

    procedure DbChenge;                             // データベースへの変更（変更モード）
    procedure DbAdd;                                // データベースへの変更（追加モード）
    procedure DbDelete;                             // データベースへの変更（削除モード）
    procedure SetEncPass;                           // パスワードの保存
    function  GetDecPass: string;                   // 復号用

  protected
    BKList:array[0..99] of TStringList;             // コンボ値保管リスト
  var
    bFiest:Boolean;                                 // 最初しか呼びたくないので（排他制御用）
    sOpenDATE,SOpenTime:string;
    objOwner:TComponent;                            // 飛び出し元のオブジェクトを保存
  public
    { Public 宣言 }

    { Public declarations }
    // 担当メンテ画面生成時の処理
    Constructor Create(AOwner:TComponent; Mode:String);        // コンストラクタ
    procedure CreateBKList;                                    // コンボ関連
    procedure FldChange(WC:TWinControl;cl:TColor=clBtnFace);   // Edit(DBEdit),Memo属性一括変更

  var
    Mode : String;                                  // モード判別用
    eTNCD : String;                                 // 暗号化ロジックに渡す担当者CD
    ePASS : String;                                 // 暗号化ロジックに渡す入力したPASSText
  end;


var
  F0002Frm: TF0002Frm;

implementation

{$R *.dfm}

uses F0001, DM2, Utilybs, functions, DM3, EdtMaster, FncLock;

{*******************************************************************************
 目的:コンストラクターのオーバーライド    (モードの設定)
 引数:呼出モード
 戻値:
*******************************************************************************}
Constructor TF0002Frm.Create(AOwner:TComponent; Mode:String);
var
  bkCr:TCursor;
begin
  bFiest:=true;     //最初である


  bkCr:=Screen.Cursor;
  try
    Screen.Cursor:=crHourGlass;

    inherited  Create(AOwner);
    objOwner:=AOwner;
    self.Mode := Mode;
    //モードの設定
    if Mode = 'Add' then
        InzAddMode
    else if Mode='Chg' then
        InzChgMode
    else if Mode='Cpy' then
//        InzCpyMode
    else if Mode = 'Del' then
        InzDelMode
    else if Mode = 'Dsp' then
//        InzDspMode;
  finally
    Screen.Cursor:=bkCr;
  end;

end;

{*******************************************************************************
 目的:更新ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0002Frm.Button2Click(Sender: TObject);
begin
  //追加モード
  Button2.Enabled:=false;   //処理中はボタンロック
  Button3.Enabled:=false;   //終了ボタンもロック
  try
//    LgcChkMsg:=true;
    if LogicalChecOk then
    if MessageDlg('更新処理を実行します。よろしいですか？',
        mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
//      ALLEditNumChk;
        //更新処理
      //LgcChkMsg:=false;
      if LogicalChecOk then //再度確認(在庫等の関係上)
      begin
        if (Mode = 'Add')or(Mode = 'Cpy') then
          DbAdd
        else if Mode='Chg' then
          DbChenge
        else if Mode = 'Del' then
          DbDelete;
      end;
    end;
  finally
    Button3.Enabled:=true;  //終了ボタンもロック
    Button2.Enabled:=true;  //ボタンロック解除
  end;
end;

{*******************************************************************************
 目的:終了ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0002Frm.Button3Click(Sender: TObject);
var
  i:integer;
begin
  // 非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then
   abort;

  Close; // 画面終了

  // BKList廃棄
 { for i:=0 to 99 do
  begin
    BKList[i]:=nil;
    BKList[i].Free;
  end;
}
//  Application.Title:=bkTitle;

  with DataModule3 do // 担当者マスタで使用したDMの終了
  begin
    FDQryGene.Close;
    FDQryF0002.Close;
    ClientDataSetF0002.Close;
  end;

end; //終了ボタンの処理ここまで

{===============================================================================
論理チェック　引数：なし、戻り値：Bool
===============================================================================}
function TF0002Frm.LogicalChecOk: Boolean;
begin

  Result :=False;

  if mode='Add' then
    EdtTNCD.Color := clWindow; // 担当者CDフォームに白を代入する

  if mode='Del' then
  begin

    //得意先があったら削除禁止
{    with DataModule3.FDQryGene do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT TOTKCD FROM TOKMSP WHERE TOTNCD=:TNCD AND TOJTCD='''' ');
      ParamByName('TNCD').AsString:=EdtTNCD.text;
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


//  EdtBKCD.Color := clWindow;

  ChkBlank(EdtTNCD,'担当者CD');

  //追加モードの場合KEY重複チェックを行う。
  if (mode='Add') or (mode='Cpy') then
  begin
    if DataModule3.TNMMS(EdtTNCD.Text,true).Exists=true then
    begin
      MessageDlg('担当者CDが重複しています。', mtError, [mbOk], 0);
      EdtTNCD.SetFocus;
      EdtTNCD.Color := clERR;
      Exit;
    end;
  end;

  ChkBlank(EdtNAME,'担当者名');

  ChkBlank(EdtPASS,'パスワード');

  ChkBlank(CmbKGNM,'権限区分');

//  ChkBlank(EdtBKCD,'部課CD');

//  if BKMMS(EdtBKCD.Field.AsString).Exists=false then
//  begin
//    MessageDlg('部課CDが不正です。',mterror,[mbok],0);
//    EdtBKCD.SetFocus;
//    EdtBKCD.Color:=clERR;
//    exit;
//  end;

  Result :=True;

end;

{===============================================================================
データベースへの変更（変更モード）
===============================================================================}
procedure TF0002Frm.DbChenge;
begin

  with  DataModule3.ClientDataSetF0002 do                    // 紙商LiteVerの変更モード
  begin
    // 変更トランザクション開始（必ずコミットかロールバックすること）
    dmUtilYbs.FDConnection1.StartTransaction;
    try

      // 権限
      case CmbKGNM.ItemIndex of
        0:FieldByName('TNKGKB').Asstring:='1';               // 一般
        1:FieldByName('TNKGKB').Asstring:='2';               // 業務管理者
        2:FieldByName('TNKGKB').Asstring:='5';               // システム管理者
      end;

      // 使用停止
      if chkSTKB.Checked then FieldByName('TNSTKB').Asstring:='D'
                         else FieldByName('TNSTKB').Asstring:='';

      // 削除（使用停止区分）？
      FieldByName('TNJTCD').Asstring:='';

      // パスワード変更があった場合
      if EdtPASS.Text <> GetDecPass then
        FieldByName('TNPWLA').AsDateTime := Date;            // パスワード最終更新日

      // 非表示項目の設定（変更者などのログ記録用）
      FieldByName('TNUPWS').Asstring:=dmUtilYbs.GetComputerNameS;
      FieldByName('TNUPPG').Asstring:=self.Name;
      FieldByName('TNUPDT').AsDateTime:=Date;
      FieldByName('TNUPTM').AsDateTime:=Time;
      FieldByName('TNUPUS').AsString := dmUtilYbs.sUserName; // 作成ユーザー

      // データベース更新
      Post;
      if ApplyUpdates(0) >  0 then                           // エラーの場合は中断
      begin
        Abort;
      end;

      SetEncPass;                                            // パスワードの暗号化登録へ

      dmUtilYbs.FDConnection1.Commit;                        // コミット
      //更新確認ダイアログ
      MessageDlg('更新が完了しました（^ω^）',mtInformation, [mbOK], 0);

      except                                                 // 例外処理
      on e:Exception do
      begin
        dmUtilYbs.FDConnection1.Rollback;                    //エラー時はロールバック
        MessageDlg(E.Message, mtError, [mbOK], 0);
        Abort;
      end;

    end;

  end;

  //Close;

end;


{===============================================================================
データベースへの変更（追加モード）
===============================================================================}
procedure TF0002Frm.DbAdd;
begin

  with  DataModule3.ClientDataSetF0002 do
  begin
    // 変更トランザクション開始（必ずコミットかロールバックすること）
    dmUtilYbs.FDConnection1.StartTransaction;
    try
      // 権限
      case CmbKGNM.ItemIndex of
        0:FieldByName('TNKGKB').Asstring:='1';               // 一般
        1:FieldByName('TNKGKB').Asstring:='2';               // 業務管理者
        2:FieldByName('TNKGKB').Asstring:='5';               // システム管理者
      end;

      // 使用停止
      if chkSTKB.Checked then FieldByName('TNSTKB').Asstring:='D'
                         else FieldByName('TNSTKB').Asstring:='';

      // 削除（使用停止区分）？
      FieldByName('TNJTCD').Asstring:='';

      // パスワード最終更新日
      FieldByName('TNPWLA').AsDateTime := Date;

      // 非表示項目の設定（変更者などのログ記録用）
      FieldByName('TNCRWS').Asstring:=dmUtilYbs.GetComputerNameS;
      FieldByName('TNCRPG').Asstring:=self.Name;
      FieldByName('TNCRDT').AsDateTime:=Date;
      FieldByName('TNCRTM').AsDateTime:=Time;
      FieldByName('TNCRUS').AsString := dmUtilYbs.sUserName; // 作成ユーザー


      // データベース更新
       Post;                                                 // CDSの編集内容を確定する
      if ApplyUpdates(0) >  0 then                           // エラーの場合は中断
      begin
        Abort;
      end;

      SetEncPass;                                            // パスワードの暗号化登録へ

      dmUtilYbs.FDConnection1.Commit;                        // コミット
      // 更新確認ダイアログ
      MessageDlg('新規登録が完了しました（・ω・）',mtInformation, [mbOK], 0);

    except
    on e:Exception do
    begin
      dmUtilYbs.FDConnection1.Rollback;                      // エラー時はロールバック
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
    end;

    end;

    InzAddMode;                                              // 連続で追加更新できるようにリセット

    EdtPASS.Text:='';                                        // Pass入力フォームを初期化
    CmbKGNM.ItemIndex:=0;

    EdtTNCD.SetFocus;
  end;

  //Close;

end;


{===============================================================================
データベースへの変更（削除モード）
===============================================================================}
procedure TF0002Frm.DbDelete;
begin
  inherited;

  with  DataModule3.ClientDataSetF0002 do
  begin
    dmUtilYbs.FDConnection1.StartTransaction;                // トランザクション処理開始
    try
      // 削除
      FieldByName('TNSTKB').Asstring:='D';

      // 非表示項目の設定
      FieldByName('TNUPWS').Asstring:=dmUtilYbs.GetComputerNameS;
      FieldByName('TNUPPG').Asstring:=self.Name;
      FieldByName('TNUPDT').AsDateTime:=Date;
      FieldByName('TNUPTM').AsDateTime:=Time;
      FieldByName('TNUPUS').AsString := dmUtilYbs.sUserName; // 作成ユーザー

      // データベース更新
      Post;
      if ApplyUpdates(0) >  0 then                           // エラーの場合は中断
      begin
        Abort;
      end;

      dmUtilYbs.FDConnection1.Commit;                        // コミット
      // 更新確認ダイアログ
      MessageDlg('削除が完了しました（●o●）',mtInformation, [mbOK], 0);

      except                                                 // 例外処理
      on e:Exception do
      begin
        dmUtilYbs.FDConnection1.Rollback;                    // ロールバック
        MessageDlg(E.Message, mtError, [mbOK], 0);
        Abort;
      end;

    end;

  end;

  Close;

end;


{===============================================================================
DBEditBox ComboBox値連携処理
===============================================================================}

// コンボボックス値保管リスト作成
// 見つかったTComboBoxのタグにワークのStringList指標をセットし関連付け
procedure TF0002Frm.CreateBKList;
var
//  str,nam:string;
  i,tg:integer;
begin
  tg:=0;
  for i:=0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TComboBox then
    begin
      TComboBox(Self.Components[i]).Tag:=tg; // コンボボックスのTagプロパティでBKListと関連付け
      BKList[tg]:=nil;
      BKList[tg]:=TStringList.Create;
      BKList[tg].Clear;
      inc(tg);
    end;
  end;
end;



{===============================================================================
パスワード復号用
===============================================================================}
function TF0002Frm.GetDecPass: string;
begin
  result:='';

  with DataModule3.FDQryGene do
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

{===============================================================================
パスワード暗号化用
===============================================================================}
procedure TF0002Frm.SetEncPass;
begin
  with DataModule3.FDQryGene do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' UPDATE TNMMSP ');
    SQL.Add('    SET TNPASS = ENCRYPTBYPASSPHRASE('''+DECKEY+''',:PASS) ');
    SQL.Add('  WHERE TNTNCD = :TNCD ');
    ParamByName('PASS').AsAnsiString:=EdtPass.Text;
    ParamByName('TNCD').AsAnsiString:=EdtTNCD.Text;
    ExecSQL;
  end;

end;

{*******************************************************************************
 目的:初期設定    (追加モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TF0002Frm.InzAddMode;
begin
  EdtMode.Text := '追加';

 // 排他制御
 // 追加モードでロックファイルのレコードを１件作成する。
 // 繰り返し入力などがあるので作成は１回のみ

  if bFiest then
  begin
    bFiest:=False;
    // 排他制御用のFormを開いた日時取得
    sOpenDATE:=dmUtilYbs.GetStmDate;
    SOpenTime:=dmUtilYbs.GetStmTime;
{    try
      LockADD('ADD', Self.Name,sOpenDATE,SOpenTime,dmUtilYbs.sUserName,dmUtilYbs.GetComputerNameS,dmUtilYbs.sUserName,dmUtilYbs.GetComputerNameS,self.Name,self.Caption);
    except
      on e:Exception do//すべての例外
      begin
        Screen.Cursor := crDefault;
        MessageDlg(E.Message, mtError, [mbOK], 0);
        PostMessage(Handle,WM_CLOSE,0,0);
        //Exit;
        abort;
      end;
    end;
}
  end;

  with DataModule3 do
  begin
    // 編集用に1レコード追加している
    ClientDataSetF0002.Close;              // CDS終了
    FDQryF0002.Close;                      // Qry終了
    FDQryF0002.SQL.Clear;                  // SQL初期化
    FDQryF0002.SQL.add(' SELECT TOP 1 * ');
    FDQryF0002.SQL.add(' FROM TNMMSP ');   // 先頭の1レコードを抽出

    ClientDataSetF0002.Open;               // CDS開始
    ClientDataSetF0002.EmptyDataSet;       // CDS抽出レコードを空にする
    ClientDataSetF0002.Append;             // CDS追加モード
    try
      InitDataSet(ClientDataSetF0002);     // detasetの初期化、0やNULLなど適切な空の表記にしている
    except
    end;
  end;

end;

{*******************************************************************************
 目的:初期設定   (変更モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TF0002Frm.InzChgMode;
begin
  EdtMode.Text := '変更';

  DataOpen;                  // 照会データを元に1レコードSQL出力する

  ChgReadOnly(EdtTNCD,true); // TNCDを読込専用にするかの判別処理

end;

{*******************************************************************************
 目的:初期設定    (削除モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TF0002Frm.InzDelMode;
begin
  EdtMode.Text := '削除';

  DataOpen;                // 照会データを元に1レコードSQL出力する

  Panel1.Enabled := False; // パネル1の範囲を入力不可にする

  FldChange(Panel1);       //一括でEdit,MemoのColorをBtnFaceに変更。入力コンポーネントの色を灰色にする。

end;


{===============================================================================
データオープン
===============================================================================}
procedure TF0002Frm.DataOpen;
begin
  // 編集用に新しいクライアントデータセットを開く
  with DataModule3 do
  begin
    try
      ClientDataSetF0002.Active := False; // CDSを閉じる
      FDQryF0002.close;                   // SQL文初期化
      FDQryF0002.SQL.Clear;               // SQL初期化
      // SQL文開始↓
      FDQryF0002.SQL.Add(' select * , CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS');
      FDQryF0002.SQL.Add(' from TNMMSP where TNTNCD = :TNTNCD ');
      // DBGrid1で選択中の担当者CDを代入する
      FDQryF0002.ParamByName('TNTNCD').AsAnsiString := DataModule2.ClientDataSetTNMMSP.FieldByName('TNTNCD').AsString;

      FDQryF0002.Open;                    // FDQueryLogin2を展開する

      if FDQryF0002.IsEmpty then          // FDQueryLogin2にデータがない場合の処理
      begin                               // 例外エラーメッセージを作成
        raise Exception.Create('既に削除されている');
      end;

    ClientDataSetF0002.Active := True;    // CDSを開く
    ClientDataSetF0002.Edit;              // CDS編集モード

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
      if DataModule3.ClientDataSetF0002.FieldByName('TNSTKB').Asstring='D' then
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

end; // DataOpenここまで

{*******************************************************************************
 目的: 一括でEditコントロール属性を変更する。
 引数: TWinControl(TPanel)
 戻値:
*******************************************************************************}
procedure TF0002Frm.FldChange(WC:TWinControl;cl:TColor=clBtnFace);
Var
 i: Integer;
 CC:TControl;
begin

  if WC.ControlCount = 0 then Exit;

  with WC do begin
  for i :=0 to ControlCount - 1 do
    begin
      if Controls[i] is TEdit then
      begin
         TEdit(Controls[i]).Color := cl;
      end ;
      if Controls[i] is TMaskEditDate then
      begin
      TMaskEditDate(Controls[i]).Color := cl;
      end ;
      if Controls[i] is TDBEdit then
      begin
         TDBEdit(Controls[i]).Color := cl;
      end;
      if Controls[i] is TMemo then
      begin
         TMemo(Controls[i]).Color := cl;
      end;
      if Controls[i] is TComboBox then
      begin
         TComboBox(Controls[i]).Color := cl;
      end;
      if Controls[i] is TDBComboBox then
      begin
         TDBComboBox(Controls[i]).Color := cl;
      end;
      if Controls[i] is TRadioButton then
      begin
        TRadioButton(Controls[i]).Color := cl;
      end;
      // 再回帰を行う。
      CC := WC.Controls[i];
      if CC is TWinControl then FldChange(TWinControl(CC));

    end;

  end;

end;


end.
