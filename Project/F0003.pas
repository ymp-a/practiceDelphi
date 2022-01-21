unit F0003;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  DBEditUNIC, Vcl.DBCGrids, Vcl.ExtCtrls;

type
  TF0003Frm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    EdtMHIRDT: TDBEditUNIC;
    EdtMHKGDT: TDBEditUNIC;
    EdtMHTKCD: TDBEditUNIC;
    EdtMHTNCD: TDBEditUNIC;
    EdtMHBIKO: TDBEditUNIC;
    EdtMHNO: TDBEditUNIC;
    EdtMHTKNM: TDBEditUNIC;
    DBCtrlGrid1: TDBCtrlGrid;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ChkDel1: TDBCheckBox;
    EdtMTGNO: TDBEditUNIC;
    EdtMTSHCD: TDBEditUNIC;
    EdtMTSHNM: TDBEditUNIC;
    EdtMTTNKA: TDBEditUNIC;
    EdtMTSRYO: TDBEditUNIC;
    EdtMTKIN: TDBEditUNIC;
    EdtMTBIKO: TDBEditUNIC;
    EdtMHGSRO: TDBEditUNIC;
    EdtMHGKIN: TDBEditUNIC;
    Label13: TLabel;
    Label14: TLabel;
    //更新ボタンの処理
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private 宣言 }
    //論理チェック
    function  LogicalChecOk:Boolean;
  public
    { Public 宣言 }
  var
    Mode : String;//モード判別用（未使用）
  end;

var
  F0003Frm: TF0003Frm;

implementation

{$R *.dfm}

uses DM4, functions, Utilybs;

{*******************************************************************************
 目的:更新ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0003Frm.Button2Click(Sender: TObject);
begin
//追加モード
  Button2.Enabled:=false;//処理中はボタンロック
  Button3.Enabled:=false;//終了ボタンもロック
  try
    //LgcChkMsg:=true;
    if LogicalChecOk then
    if MessageDlg('更新処理を実行します。よろしいですか？',
        mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
//      ALLEditNumChk;
        //更新処理
      //LgcChkMsg:=false;
      if LogicalChecOk then    //再度確認(在庫等の関係上)
      begin
        if (Mode = 'Add')or(Mode = 'Cpy') then
          //DbAdd
        else if Mode='Chg' then
          //DbChenge
        else if Mode = 'Del' then
          //DbDelete;
      end;
    end;
  finally
    Button2.Enabled:=true;//終了ボタンもロック
    Button3.Enabled:=true;//ボタンロック解除
  end;
end;

procedure TF0003Frm.Button3Click(Sender: TObject);
begin
  //非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  //画面終了
  Close;
end;

procedure TF0003Frm.FormShow(Sender: TObject);
begin
  DataModule4.ClientDataSetMTHFLP.Close;
  DataModule4.ClientDataSetMTMFLP.Close;
  DataModule4.ClientDataSetMTHFLP.Open;
  DataModule4.ClientDataSetMTMFLP.Open;
end;

function TF0003Frm.LogicalChecOk: Boolean;
begin

  Result :=False;

  if mode='Add' then
    //EdtTNCD.Color := clWindow;

  if mode='Del' then
  begin

    //得意先があったら削除禁止
{    with DataModule3.FDQryGene do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT TOTKCD FROM TOKMSP WHERE TOTNCD=:TNCD AND TOJTCD='''' ');
      ParamByName('TNCD').AsString:=EdtTNCD.Field.AsString;
      Open;
      if not IsEmpty then
      begin
        MessageDlg('紐づく得意先(CD:'+FieldByName('TOTKCD').AsString+'など)があるため削除できません', mtError, [mbOK], 0);
        Exit;
      end;
    end;
}
    Result:=true;
    exit;
  end;


//  EdtBKCD.Color := clWindow;

  ChkBlank(EdtMHNO,'見積№');

  //追加モードの場合見積№重複チェックを行う。
{  if (mode='Add') then
  begin
    if TNMMS(EdtTNCD.Field.AsString,true).Exists=true then
    begin
      MessageDlg('見積№が重複しています。', mtError, [mbOk], 0);
      EdtMHNO.SetFocus;
      EdtMHNO.Color := clERR;
      Exit;
    end;
  end;
}
  ChkBlank(EdtMHIRDT,'見積依頼日');

  ChkBlank(EdtMHKGDT,'見積期限');

  ChkBlank(EdtMHTKCD,'得意先CD');

  ChkBlank(EdtMHTNCD,'担当者CD');


  Result :=True;

end;

end.
