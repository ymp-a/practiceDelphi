unit F0002;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, DBEditUNIC;

type
  TF0002Frm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EdtPass: TEdit;
    chkSTKB: TCheckBox;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    EdtNAME: TDBEditUNIC;
    EdtKGKB: TDBEditUNIC;
    CmbKGNM: TComboBox;
    EdtTNCD: TDBEditUNIC;
    EdtPASSw: TDBEditUNIC;
    //終了ボタンの処理
    procedure Button3Click(Sender: TObject);
    //画面展開時の処理
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private 宣言 }
    function  LogicalChecOk:Boolean;        //論理チェック
    procedure DbChenge;                     //データベースへの変更（変更モード）
  public
    { Public 宣言 }
  var
    Mode : String;
    eTNCD : String;
    ePASS : String;
  end;

var
  F0002Frm: TF0002Frm;

implementation

{$R *.dfm}

uses F0001, DM2, Utilybs, functions, DM3;

{*******************************************************************************
 目的:ＯＫボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0002Frm.Button2Click(Sender: TObject);
begin
  //追加モード
  Button2.Enabled:=false;//処理中はボタンロック
  Button3.Enabled:=false;//終了ボタンもロック
  try
//    LgcChkMsg:=true;
    if LogicalChecOk then
    if MessageDlg('更新処理を実行します。よろしいですか？',
        mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
//      ALLEditNumChk;
        //更新処理
      //LgcChkMsg:=false;
      if LogicalChecOk then    //再度確認(在庫等の関係上)
      begin
//        if (Mode = 'Add')or(Mode = 'Cpy') then
//          DbAdd
//        else if Mode='Chg' then
          DbChenge;
//        else if Mode = 'Del' then
//          DbDelete;
      end;
    end;
  finally
    Button3.Enabled:=true;//終了ボタンもロック
    Button2.Enabled:=true;//ボタンロック解除
  end;
end;

//終了ボタンの処理
procedure TF0002Frm.Button3Click(Sender: TObject);
var
  frm : Tform;
begin
  //非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  //画面終了
  Close;
  //担当者マスタで使用したDMの終了
  with DataModule3 do
  begin
    FDQryGene.Close;
    FDQueryLogin2.Close;
    ClientDataSet2.Close;
  end;


end; //終了ボタンの処理ここまで


//画面展開時の処理
procedure TF0002Frm.FormShow(Sender: TObject);
begin
  try
    DataModule3.DataOpen;

    //権限
    if StrToIntDef(EdtKGKB.TEXT,-1)-1>=0 then
    begin
      case StrToIntDef(EdtKGKB.TEXT,0) of
        1: CmbKGNM.ItemIndex:=0;   //一般
        2: CmbKGNM.ItemIndex:=1;   //業務管理者
        5: CmbKGNM.ItemIndex:=2;   //システム管理者
      end;
    end;

    //パスワードの処理
    EdtPASS.Text:= DataModule3.GetDecPass;

    //検索非表示
    if DataModule3.FDQueryLogin2.FieldByName('TNSTKB').Asstring='D' then
      chkSTKB.Checked:=true
    else
      chkSTKB.Checked:=false;

    //すべての例外
    except on e:Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      self.close;
      abort;
    end;

  end;

end; //画面展開時の処理ここまで

function TF0002Frm.LogicalChecOk: Boolean;
begin

  Result :=False;

  if mode='Add' then
    EdtTNCD.Color := clWindow;

  if mode='Del' then
  begin

    //得意先があったら削除禁止
    with DataModule3.FDQryGene do
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

    Result:=true;
    exit;
  end;


//  EdtBKCD.Color := clWindow;

  ChkBlank(EdtTNCD,'担当者CD');

  //追加モードの場合KEY重複チェックを行う。
//  if (mode='Add') or (mode='Cpy') then
//  begin
//    if TNMMS(EdtTNCD.Field.AsString,true).Exists=true then
//    begin
//      MessageDlg('担当者CDが重複しています。', mtError, [mbOk], 0);
//      EdtTNCD.SetFocus;
//      EdtTNCD.Color := clERR;
//      Exit;
//    end;
//  end;

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

procedure TF0002Frm.DbChenge;
begin


  with  DataModule3.ClientDataSet2 do
  begin
    dmUtilYbs.FDConnection1.StartTransaction;
    try

      //権限
      case CmbKGNM.ItemIndex of
        0:FieldByName('TNKGKB').Asstring:='1'; //一般
        1:FieldByName('TNKGKB').Asstring:='2'; //業務管理者
        2:FieldByName('TNKGKB').Asstring:='5'; //システム管理者
      end;

      //使用停止
      if chkSTKB.Checked then FieldByName('TNSTKB').Asstring:='D'
                         else FieldByName('TNSTKB').Asstring:='';

      //削除
      FieldByName('TNJTCD').Asstring:='';

      //パスワード変更があった場合
      if EdtPASS.Text <> DataModule3.GetDecPass then
        FieldByName('TNPWLA').AsDateTime := Date;    //パスワード最終更新日

      //非表示項目の設定
      FieldByName('TNUPWS').Asstring:=dmUtilYbs.GetComputerNameS;
      FieldByName('TNUPPG').Asstring:=self.Name;
      FieldByName('TNUPDT').AsDateTime:=Date;
      FieldByName('TNUPTM').AsDateTime:=Time;
      FieldByName('TNUPUS').AsString := dmUtilYbs.sUserName;               //作成ユーザー

      //データベース更新
      DataModule3.ClientDataSet2.Post;
      if ApplyUpdates(0) >  0 then              //エラーの場合は中断
      begin
        Abort;
      end;

      eTNCD:=EdtTNCD.Field.AsString;
      ePASS:=EdtPass.Text;

      DataModule3.SetEncPass(eTNCD, ePASS);   //パスワードの暗号化登録

      dmUtilYbs.FDConnection1.Commit;
      //更新確認ダイアログ
      MessageDlg('更新が完了しました（^ω^）',mtInformation, [mbOK], 0);

    except
    on e:Exception do
    begin
      dmUtilYbs.FDConnection1.Rollback;
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
//           CancelUpdates;
    end;

    end;

  end;

  //Close;

end;



end.
