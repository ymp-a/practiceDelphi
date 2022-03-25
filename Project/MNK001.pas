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
    procedure Button1Click(Sender: TObject); // 担当者照会
    procedure Button2Click(Sender: TObject); // 担当者メンテ
    procedure Button3Click(Sender: TObject); // 見積照会
    procedure Button4Click(Sender: TObject); // 見積入力
  private
    { Private 宣言 }

  public
    { Public 宣言 }
  var
    Mode : String;                           // モード判別用
  end;

var
  MNK001Frm: TMNK001Frm;

implementation

{$R *.dfm}

uses F0001, F0002, F0003, EdtMaster, DM3, FncLock, Utilybs, DM2, F0004;

{*******************************************************************************
 目的:担当者照会ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TMNK001Frm.Button1Click(Sender: TObject);
var
  frm:TF0001Frm;
begin
  frm := TF0001Frm.Create(Application); // 担当者照会画面を代入
  frm.Mode := 'Dsp';                    // Dspモードセット
  frm.ShowModal;                        // 画面展開
  FreeAndNil(frm);                      // F0001インスタンス開放
end;

{*******************************************************************************
 目的:担当者メンテボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TMNK001Frm.Button2Click(Sender: TObject);
begin
  F0001Frm.ShwNextFrm('Add');
end;

{*******************************************************************************
 目的:見積照会ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TMNK001Frm.Button3Click(Sender: TObject);
var frm:TF0004Frm;
begin
  frm := TF0004Frm.Create(Application); // 担当者照会画面を代入
  frm.Mode := 'Dsp';                    // Dspモードセット
  frm.ShowModal;                        // 画面展開
  FreeAndNil(frm);                      // F0004インスタンス開放
end;

{*******************************************************************************
 目的:見積入力ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TMNK001Frm.Button4Click(Sender: TObject);
begin
  F0004Frm.ShwNextFrm('Add');
end;

end.
