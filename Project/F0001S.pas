unit F0001S;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;


type
  TF0001SFrm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Panel2: TPanel;
    DBGrid0: TDBGrid;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
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
  F0001SFrm: TF0001SFrm;

implementation

{$R *.dfm}

uses DM2,FireDAC.Comp.Client;



procedure TF0001SFrm.Button1Click(Sender: TObject);
{*******************************************************************************
 目的:検索ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
begin
DBGrid0.DataSource.DataSet.Close;

 with DataModule2 do
  begin
    try

      FDQry1.Close;
      FDQry1.SQL.Clear;
      FDQry1.Params.Clear;

      FDQry1.SQL.Add('SELECT * FRom TNMMSP');
      FDQry1.SQL.Add(' WHERE 1=1 ');
      FDQry1.SQL.Add(' and tntncd = 3 ');

//      if Edit1.Text<>'' then
//      begin
//        FDQry1.SQL.Add(' AND TNTNCD=:TNCD');
//        FDQry1.ParamByName('TNCD').AsInteger:=StrToIntDef(Edit1.Text,0);
//      end;

      if Edit2.Text<>'' then
      begin
        FDQry1.SQL.Add(' AND TNNAME LIKE :NAME');
        FDQry1.ParamByName('NAME').AsString:='%' + Edit2.Text + '%';
      end;

      FDQry1.Open();
    finally

    end;

  end;


DBGrid0.DataSource.DataSet.Open;
end;


procedure TF0001SFrm.Button3Click(Sender: TObject);
begin
  // 非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  DataModule2.FDQry1.Close;
  Close;
end; // 終了処理ここまで

end.
