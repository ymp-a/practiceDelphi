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
      NAME:String;
  end;

var
  F0001Frm: TF0001Frm;

implementation

{$R *.dfm}

uses Unit1, DM2, F0002;

//検索ボタンの処理
procedure TF0001Frm.Button1Click(Sender: TObject);
var
  andFlg:boolean; //入力フラグを設定

begin
  TNCD:=EdtTNCD.Text;


//  DBGrid1.DataSource.DataSet.Close;
//  DataModule2.OpenTNData(TNCD,NAME);
//  DBGrid1.DataSource.DataSet.Open;
  //フラグ初期化
  andFlg:=false;

  //条件に合わせた結果をGrid表示したい
  with DataModule2.FDQueryLogin do
  begin
    //FDQueryLoginを閉じる
    Close;
    //SQL文初期化
    SQL.Clear;
    //ここからSQL文↓
    SQL.Add(' SELECT * FROM TNMMSP  ');

    //担当者CD入力時の処理
    if EdtTNCD.Text<>'' then
    begin
      //TNTNCDに入力した担当者CDを代入する
      SQL.Add(' WHERE TNTNCD >= :TNCD ');
      //入力した担当者CDを'TNCD'に代入する
      ParamByName('TNCD').AsString:=EdtTNCD.Text;
      //入力時フラグオン
      andFlg:=true;
    end;

    //担当者名入力時の処理
      NAME:=EdtNAME.Text;
    if NAME<>'' then
    begin
      //担当者CD入力有無でANDかWHEREに条件分岐する
      if andFlg=true then SQL.Add(' AND ') else SQL.Add(' WHERE ');
      //TNNAME LIKEに%入力名%をSQLStringに反映する
      SQL.Add(' TNNAME LIKE :NAME ');
      //部分一致の入力名を'NAME'へ代入する
      ParamByName('NAME').AsWideString := '%' + EdtNAME.Text + '%';
      //入力時フラグオン
      andFlg:=true;
    end;

    //昇順
    SQL.Add(' ORDER BY TNTNCD ');
    //FDQueryLoginを展開する
    Open;
  end; //DataModule2.FDQueryLoginここまで

end; // 検索ボタンの処理ここまで

//変更ボタンの処理
procedure TF0001Frm.Button2Click(Sender: TObject);
var
  frm : Tform;
begin
  //DBGrid1にデータがない場合中断
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  if DBGrid1.DataSource.DataSet.Active=False then abort;
  if DBGrid1.DataSource.DataSet.IsEmpty then abort;

  //担当者メンテ画面を準備
  frm := TF0002Frm.create(self);
  //画面展開する
  frm.ShowModal;
//  FreeAndNil(frm); いらない？複数立ち上げる際に必要？
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
