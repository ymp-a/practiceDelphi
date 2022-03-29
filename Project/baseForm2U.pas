unit baseForm2U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, baseFormU, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TbaseForm2 = class(TbaseForm)
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private 宣言 }
    procedure setMsg1();
  public
    { Public 宣言 }
  end;

var
  baseForm2: TbaseForm2;

implementation

{$R *.dfm}

procedure TbaseForm2.Button1Click(Sender: TObject);
begin
  inherited; // 継承元のbutton1Clickが実行される

end;

procedure TbaseForm2.Button2Click(Sender: TObject);
begin
  inherited;
  // 継承元メソッドを呼び出す
  setErrMsg('エラーです');
  pMode:=9;
  setMsg1();
  setMsg2('publicのメソッドも実行できます');

end;

procedure TbaseForm2.setMsg1;
begin
  inherited; // 継承元のsetMsg1を実行
  // さらに処理を追加
  Memo1.Lines.Add('継承先から追加');
end;

end.
