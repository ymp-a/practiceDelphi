unit IH003U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EdtMaster, System.Actions, Vcl.ActnList,
  PageTop, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  DBEditUNIC, FireDAC.Comp.Client, Data.DB, DBClient;

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
    procedure tset();                            // 更新時ヘッダー設定
    procedure InzAddMode;override;               // 初期設定（追加モード）
    procedure InzChgMode;override;               // 初期設定（変更モード）
    function  GetDecPass: string;                // 復号用
    procedure DbAdd;override;                    // データベースへの変更（追加モード）
    procedure DbChenge;override;                 // データベースへの変更（変更モード）
    function  LogicalChecOk:Boolean;override;    // 論理チェック
    procedure SetEncPass;                        // パスワードの保存

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
      CDS_IH003.Append;             // CDS追加モード 最後の行に+1してるイメージ
      try
        InitDataSet(CDS_IH003);     // detasetの初期化、0やNULLなど適切な空の表記にしている
      except
      end;
    end;
end;

{*******************************************************************************
 目的:初期設定   (変更モードの設定)
 引数:
 戻値:
*******************************************************************************}
procedure TIH003.InzChgMode;
begin
  inherited;
//  pNo:=DataModule2.CDS_IH002.FieldByName('mhno').Asinteger;

//  ChgReadOnly(EdtMHNO,true);         // TNCDを読込専用にするかの判別処理

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
    ParamByName('TNCD').AsString:=DataModule2.CDS_IH004.FieldByName('TNTNCD').AsString;
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
データベースへの変更（追加モード）
===============================================================================}
procedure TIH003.DbAdd;
var
  cds1: TClientDataSet;
  con: TFDConnection;
begin
  inherited;
  con:= UtilYbs.dmUtilYbs.FDConnection1;
  cds1 := DataModule2.CDS_IH003;


  tset;                   // 項目セット

  try
    con.StartTransaction; // 変更トランザクション開始（必ずコミットかロールバックすること）

    cds1.ApplyUpdates(0); // データ更新


    //データベース更新
//    if ApplyUpdates(0) >  0 then             //エラーの場合は中断
//    begin
//      Abort;
//    end;
    SetEncPass;           // 暗号化
    con.Commit;           // コミット
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
procedure TIH003.DbChenge;
begin
  inherited;

  with  DataModule2.CDS_IH003 do                    // 紙商LiteVerの変更モード
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

  Close;

end;

{===============================================================================
更新時担当マスタ項目セット
===============================================================================}
procedure TIH003.tset();
begin
  with  DataModule2.CDS_IH003 do
  begin
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
    Post;
  end;
end;

{===============================================================================
論理チェック　引数：なし、戻り値：Bool
===============================================================================}
function TIH003.LogicalChecOk: Boolean;
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
    if DataModule2.TNMMS(EdtTNCD.Text,true).Exists=true then
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
パスワード暗号化用
===============================================================================}
procedure TIH003.SetEncPass;
begin
  with DataModule2.FDQryGene do
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

end.
