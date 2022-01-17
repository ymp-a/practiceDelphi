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
  private
    { Private 宣言 }
    procedure DataOpen;                              //データオープン
    function  GetDecPass: string;                    //パスワードの取得
  public
    { Public 宣言 }
  end;

var
  F0002Frm: TF0002Frm;

implementation

{$R *.dfm}

uses F0001, DM2, Utilybs, functions;

//終了ボタンの処理
procedure TF0002Frm.Button3Click(Sender: TObject);
begin
  //非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  //画面終了
  Close;
end; //終了ボタンの処理ここまで


procedure TF0002Frm.DataOpen;
begin
  //編集用に新しいクライアントデータセットを開く
  with  DataModule2 do
  begin
    try
      //FDQueryLogin2を初期化
      FDQueryLogin2.Close;
      //SQL文初期化
      FDQueryLogin2.SQL.Clear;
      //SQL文開始↓（DEGrid1選択中の内容をFDQueryLogin2で再現する）
      FDQueryLogin2.SQL.Add(' select * ');
      FDQueryLogin2.SQL.Add(' from TNMMSP where TNTNCD = :TNTNCD ');
      //DBGrid1で選択中の担当者CDを代入する
      FDQueryLogin2.ParamByName('TNTNCD').AsAnsiString := FDQueryLogin.FieldByName('TNTNCD').AsString;
      //FDQueryLogin2を展開する
      FDQueryLogin2.Open;

      //FDQueryLogin2にデータがない場合の処理
      if FDQueryLogin2.IsEmpty then
      begin
        //例外エラーメッセージを作成
         raise Exception.Create('既に削除されている');
      end;

      FDQueryLogin2.Edit;  //編集ステータスになっている更新用？


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
      EdtPASS.Text:=GetDecPass;


      //検索非表示
      if FDQueryLogin2.FieldByName('TNSTKB').Asstring='D' then
         chkSTKB.Checked:=true
      else
         chkSTKB.Checked:=false;

      //すべての例外
      except on e:Exception do
      begin
        MessageDlg(E.Message, mtError, [mbOK], 0);
        self.close;
        abort;
      end; //exceptここまで

    end; //tryexceptここまで

  end; //DataModule2ここまで

end; //DataOpenここまで

//画面展開時の処理
procedure TF0002Frm.FormShow(Sender: TObject);
begin
  DataOpen;
end; //画面展開時の処理ここまで

function TF0002Frm.GetDecPass: string;
begin
  result:='';

  //得意先があったら部課変更不可
  with DataModule2.FDQueryLogin3 do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS ');
    SQL.Add('   FROM TNMMSP WHERE TNTNCD = :TNCD ');
    ParamByName('TNCD').AsString:=EdtTNCD.Field.AsString;
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
