unit F0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TF0001Frm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtTNCD: TEdit;
    EdtNAME: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    EdtMode: TEdit;
    //終了ボタン
    procedure Button3Click(Sender: TObject);
    //検索ボタン
    procedure Button1Click(Sender: TObject);
    //変更ボタン
    procedure Button2Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    var
      TNCD:String;
      reNAME:String;
      Mode:String;
  end;

var
  F0001Frm: TF0001Frm;

implementation

{$R *.dfm}

uses Unit1, DM2, F0002, EdtMaster, MNK001;

//検索ボタンの処理
procedure TF0001Frm.Button1Click(Sender: TObject);
begin
  begin
  if Mode = 'Add' then EdtMode.Text := '追加';
  if Mode = 'Chg' then EdtMode.Text := '変更';
  if Mode = 'Dsp' then EdtMode.Text := '照会';
  end;

  //担当者CDと担当者名をDM2へ渡す準備
  TNCD:=EdtTNCD.Text;
  reNAME:=EdtNAME.Text;

  //DBGrid1の初期化
  DBGrid1.DataSource.DataSet.Close;

  //担当者検索を開く
  DataModule2.OpenTNData(TNCD,reNAME);

end; // 検索ボタンの処理ここまで

//変更ボタンの処理
procedure TF0001Frm.Button2Click(Sender: TObject);
var
  frm : TF0002Frm;
begin
  //DBGrid1にデータがない場合中断
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  if DBGrid1.DataSource.DataSet.Active=False then abort;
  if DBGrid1.DataSource.DataSet.IsEmpty then abort;

  //担当者メンテ画面を準備
  frm := TF0002Frm.Create(self);
  frm.mode := 'Chg';
  //照会画面を非表示にする
  Self.Hide;
  //画面展開する
  frm.ShowModal;

  //F0002インスタンス開放
  FreeAndNil(frm);
  //照会画面復活
  Self.Show;
  //最新状態を表示する
  Button1Click(Button1);
end; //変更ボタンの処理ここまで

//終了ボタンの処理
procedure TF0001Frm.Button3Click(Sender: TObject);
begin
  //非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  //画面終了
  Close;
end; //終了ボタンの処理ここまで

end.
