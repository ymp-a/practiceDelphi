unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    EdtUserId: TEdit;
    EdtPsw: TEdit;
    //ログインボタンタップ時の処理
    procedure Button1Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    //メニュー表示
    procedure crtMnuFrm();virtual;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Utilybs, DM2, MNK001, IniFilemnt, functions;

//検索ボタンタップ時の処理
procedure TForm1.Button1Click(Sender: TObject);
var
  KGKB:String;//権限区分
  frm:TForm;
//  PDevMode   : ^TDevMode;
begin
  //ユーザーID入力欄背景色を初期化
  EdtUserId.Color := clWindow;
  //PW背景色を初期化
  EdtPsw.Color := clWindow;

  try

    try
    //データモジュールを作成
      dmUtilYbs:=TdmUtilYbs.Create(self);//サーバー接続オン

      if dmUtilYbs.FDConnection1.Connected=true then  //接続中の処理
      begin

        //パスワードチェック＆権限区分取得
        KGKB:=dmUtilYbs.PassMstChk(EdtUserId.Text,EdtPsw.Text);
        //ユーザーIDが異なるときの処理
        if KGKB = 'USERR' then
        begin
          //ユーザーIDの入力欄をピンクにする
          EdtUserId.Color := clERR;
          EdtUserId.SetFocus;
          Exit;
        end else
        //PWが異なるときの処理
        if KGKB = 'PAERR' then
        begin
          //PW欄をピンクにする
          EdtPsw.Color := clERR;
          EdtPsw.SetFocus;
          Exit;
        end;

//        if KGKB = 'EXERR' then     //PW期限切れのときピンク処理
//        begin
//          EdtPsw.Color := clERR;
//          EdtPsw.SetFocus;
//          Exit;
//        end;

        //メニュー表示
        crtMnuFrm;      //継承のため、ファンクション化

        //プログラムを終了したらサーバー切断して閉じる
        dmUtilYbs.FDConnection1.Connected:=false;
        close;

      end; //接続時の処理ここまで

      //サーバ接続時の例外処理
      Except on e:Exception do
      begin
        //例外エラーメッセージダイアログを表示する
        MessageDlg(E.Message, mtError, [mbOK], 0);
        abort;
      end;  //Exceptここまで

    end;  //tryExceptここまで

  finally
    dmUtilYbs.Free;    //エラー時・パスワードチェックで引っかかった時にFree／正常時はPGM終了後にFree。
  end; //tryfinallyここまで

end; //検索ボタンタップ時の処理ここまで

//メニュー表示
procedure TForm1.crtMnuFrm;
var
  frm:TForm;
begin
    //メニュー画面を準備
    frm := TMNK001Frm.Create(Application);
    //ログイン画面を非表示にする
    Self.Hide;
    //画面展開
    frm.ShowModal;
end; //メニュー表示ここまで

end.
