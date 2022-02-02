unit MNK001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMNK001Frm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
  var
    Mode : String;//モード判別用
  end;

var
  MNK001Frm: TMNK001Frm;

implementation

{$R *.dfm}

uses F0001, F0002, F0003, EdtMaster;

procedure TMNK001Frm.Button1Click(Sender: TObject);
var
  frm:TF0001Frm;
begin
  //担当者照会画面を代入
  frm := TF0001Frm.Create(Application);
  frm.Mode := 'Dsp';
  //画面展開
  frm.ShowModal;
  //F0001インスタンス開放
  FreeAndNil(frm);
end;

procedure TMNK001Frm.Button2Click(Sender: TObject);
var
  frm:TF0002Frm;
begin
  //担当者メンテ画面を代入
  frm := TF0002Frm.Create(Application);
  frm.Mode := 'Add';
  //画面展開
  frm.ShowModal;
  //F0001インスタンス開放
  FreeAndNil(frm);
  frm.Mode := '';
end;

procedure TMNK001Frm.Button4Click(Sender: TObject);
var
  frm:TForm;
begin
  //見積入力（Add）画面を代入
  frm := TF0003Frm.Create(Application);
  //画面展開
  frm.ShowModal;
  //F0001インスタンス開放
  FreeAndNil(frm);
end;

end.
