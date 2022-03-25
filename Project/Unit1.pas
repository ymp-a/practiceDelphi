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
    procedure Button1Click(Sender: TObject); // ログインボタンの処理
    procedure FormShow(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    procedure crtMnuFrm();virtual;           // メニュー表示
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Utilybs, DM2, MNK001, IniFilemnt, functions, System.IniFiles;

{*******************************************************************************
 目的:検索ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TForm1.Button1Click(Sender: TObject);
var
  KGKB:String;                 // 権限区分
  frm:TForm;
//  PDevMode   : ^TDevMode;
begin
  EdtUserId.Color := clWindow; // ユーザーID入力欄背景色を初期化
  EdtPsw.Color := clWindow;    // PW背景色を初期化

  try

    try
    // dmUtilYbsデータモジュールを作成
      dmUtilYbs:=TdmUtilYbs.Create(self); // サーバー接続オン

      if dmUtilYbs.FDConnection1.Connected=true then  // 接続中の処理
      begin
        // パスワードチェック＆権限区分取得
        KGKB:=dmUtilYbs.PassMstChk(EdtUserId.Text,EdtPsw.Text);

        if KGKB = 'USERR' then      // ユーザーIDが異なるとき
        begin
          EdtUserId.Color := clERR; // ユーザーIDの入力欄をピンクにする
          EdtUserId.SetFocus;
          Exit;
        end else

        if KGKB = 'PAERR' then      // PWが異なるとき
        begin
          EdtPsw.Color := clERR;    // PW欄をピンクにする
          EdtPsw.SetFocus;
          Exit;
        end;

        crtMnuFrm;                  // メニュー表示


        dmUtilYbs.FDConnection1.Connected:=false; // サーバー切断して閉じる
        close;

      end; // 接続時の処理ここまで


      Except on e:Exception do // サーバ接続時の例外処理
      begin
        // 例外エラーメッセージダイアログを表示
        MessageDlg(E.Message, mtError, [mbOK], 0);
        abort;
      end; // Exceptここまで

    end; // tryExceptここまで

  finally
    dmUtilYbs.Free; // エラー時・パスワードチェックで引っかかった時にFree／正常時はPGM終了後にFree。
  end; // tryfinallyここまで

end; // 検索ボタンタップ時の処理ここまで

{*******************************************************************************
 目的:メニュー表示
 引数:
 戻値:
*******************************************************************************}
procedure TForm1.crtMnuFrm;
var
  frm:TForm;
begin
    frm := TMNK001Frm.Create(Application); // メニュー画面を準備
    Self.Hide;                             // ログイン画面を非表示にする
    frm.ShowModal;                         // 画面展開

end; // メニュー表示ここまで

{*******************************************************************************
 目的:ログイン画面展開時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TForm1.FormShow(Sender: TObject);
const
  fileNm= 'PASWIN.ini';
var
  iniF : TIniFile;
  Database: string;
  DriverID: String;
  Server: String;
  User_Name: String;
  Password: String;
  ODBCAdvanced: String;
  OSAuthent: String;
begin
  try

    try // iniファイルを読込む準備
      iniF :=  TIniFile.Create(ExtractFilePath(Application.ExeName)+fileNm);
    except
      MessageDlg('INIファイルの読み取りでエラーが発生しました。',mtError,[mbOK],0);
      Exit;
    end;

    // dmUtilYbsデータモジュールを作成
    dmUtilYbs:=TdmUtilYbs.Create(self);

    Database:=iniF.ReadString('LOGON','Database','');
    DriverID:= iniF.ReadString('LOGON','DriverID','');
    Server:= iniF.ReadString('LOGON','Server','');
    User_Name:= iniF.ReadString('LOGON','User_Name','');
    Password:= iniF.ReadString('LOGON','Password','');
    ODBCAdvanced:=iniF.ReadString('LOGON','ODBCAdvanced','');
    OSAuthent:=iniF.ReadString('LOGON','OSAuthent','');

    EdtUserId.Text := iniF.ReadString('Remote','UserId','');
    EdtPsw.Text := iniF.ReadString('Remote','Password','');

    with dmUtilYbs.FDConnection1 do
    begin
      close;
      Params.Clear;
      Params.Values['DriverID']    := DriverID ;
      Params.Values['Database']    := Database ;
      Params.Values['OSAuthent']   := OSAuthent;
      Params.Values['User_Name']   := User_Name;
      Params.Values['Password']    := Password ;
      Params.Values['ODBCAdvanced']:= ODBCAdvanced;
      Params.Values['Server']      := Server   ;

    end;

  finally
    FreeAndNil(iniF);
  end;

end;

end.
