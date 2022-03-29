unit baseFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TbaseForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    procedure setMsg2(msg:String);

  protected
    // 変数にもアクセスできる
    pMode : Integer;
    // エラーメッセージをmemoに表示する
    procedure setErrMsg(msg:String);
    // pModeの値確認メッセージ追加
    procedure setMsg1();
  end;

var
  baseForm: TbaseForm;

implementation

{$R *.dfm}

procedure TbaseForm.Button1Click(Sender: TObject);
// 終了ボタン
begin
  Close;
end;

procedure TbaseForm.setErrMsg(msg:String);
// エラーメッセージをmemoに追加
begin
  Memo1.Lines.Add(msg);
end;

procedure TbaseForm.setMsg1();
// pMemoの確認メッセージ追加
begin
  Memo1.Lines.Add('現在のpMemoの値は' + InttoStr(pMode) + 'です。');
end;

procedure TbaseForm.setMsg2(msg:String);
// publicメソッド
begin
  Memo1.Lines.Add(msg);
end;

end.
