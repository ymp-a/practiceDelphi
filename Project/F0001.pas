unit F0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

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
    Button4: TButton;
    Button5: TButton;
    ActionList1: TActionList;
    F1: TAction;
    F2: TAction;
    F8: TAction;
    F3: TAction;
    F9: TAction;
    procedure Button3Click(Sender: TObject); // 終了ボタン
    procedure Button1Click(Sender: TObject); // 検索ボタン
    procedure Button2Click(Sender: TObject); // 変更ボタン
    procedure Button4Click(Sender: TObject); // 追加ボタン
    procedure Button5Click(Sender: TObject); // 削除ボタン
  private
    { Private 宣言 }

  public
    { Public 宣言 }
    var
      TNCD:String;
      reNAME:String;
      Mode:String;
    procedure ShwNextFrm(mode: string);      // モード管理
  end;

var
  F0001Frm: TF0001Frm;

implementation

{$R *.dfm}

uses Unit1, DM2, F0002, EdtMaster, MNK001, DM3;

{*******************************************************************************
 目的:検索ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0001Frm.Button1Click(Sender: TObject);
begin
  begin
  if Mode = 'Add' then EdtMode.Text := '追加';
  if Mode = 'Chg' then EdtMode.Text := '変更';
  if Mode = 'Dsp' then EdtMode.Text := '照会';
  end;

  TNCD:=EdtTNCD.Text;                  // 担当者CDと担当者名をDM2へ渡す準備
  reNAME:=EdtNAME.Text;

  DBGrid1.DataSource.DataSet.Close;    // DBGrid1の初期化

  DataModule2.OpenTNData(TNCD,reNAME); // 担当者検索を開く

end; // 検索ボタンの処理ここまで


{*******************************************************************************
 目的:変更ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0001Frm.Button2Click(Sender: TObject);
var
  frm : TF0002Frm;
begin
  // DBGrid1にデータがない場合中断
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  if DBGrid1.DataSource.DataSet.Active=False then abort;
  if DBGrid1.DataSource.DataSet.IsEmpty then abort;

  ShwNextFrm('Chg');

  Self.Show;             // 照会画面復活
  Button1Click(Button1); // DBGrid1の状態を更新

end; //変更ボタンの処理ここまで

{*******************************************************************************
 目的:終了ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0001Frm.Button3Click(Sender: TObject);
begin
  // 非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  Close; // 画面終了

end; // 終了処理ここまで


{*******************************************************************************
 目的:追加ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0001Frm.Button4Click(Sender: TObject);
begin
  ShwNextFrm('Add');
end; // 追加ボタンの処理ここまで

{*******************************************************************************
 目的:削除ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0001Frm.Button5Click(Sender: TObject);
begin
  if DataModule2.ClientDataSetTNMMSP.Active=false then Exit;


  if DataModule2.ClientDataSetTNMMSP.FieldByName('TNSTKB').AsString='D' then
  begin
    MessageDlg('削除済みです(T_T)', mtError, [mbOK], 0);
    Exit;
  end;

  ShwNextFrm('Del');

end;

{*******************************************************************************
 目的:モード管理の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0001Frm.ShwNextFrm(mode: string);
var
  frm : Tform;
  SaveCursor: TCursor; // 現在のマウスポインタ保持用
  rn,pk:Integer;
begin
  with DataModule2.ClientDataSetTNMMSP do
  begin

    if (mode<>'Add') and (Active=false) then Exit;

    if (mode='Chg') or (mode='Del') then
    begin
{      try
      // 排他制御
        LockRecord('TNMMSP',FieldByName('TNTNCD').AsString,'0','0','0','0',dmUtilYbs.GetComputerNameS,dmUtilYbs.sWrkStn,self.Name,self.Caption );
      except
        on e:Exception do
        // すべての例外
        begin
          MessageDlg(E.Message, mtError, [mbOK], 0);
          abort;
        end;
      end;//try
  }
    end; // if

    if Active then  rn:=RecNo;

    SaveCursor := Screen.Cursor;        // 現マウスポインタを退避
    Screen.Cursor := crHourGlass;       // 砂時計に変更

    frm := TF0002Frm.create(self,mode); // 担当者メンテ画面を代入

    Screen.Cursor := SaveCursor;        // 保存していたマウスポインタに戻す

    frm.ShowModal;                      // 画面展開
    frm.Release;                        // F0001インスタンス開放

    // 再検索
    if mode<>'Dsp' then
    begin
      SaveCursor := Screen.Cursor;      // 現マウスポインタを退避
      Screen.Cursor := crHourGlass;     // 砂時計に変更

      if DataModule3.FDQryF0002.Active then
        DataModule3.FDQryF0002.Refresh;

      if Active then
      begin
        Refresh;
        if not IsEmpty then
        begin
          if rn<=0 then
            rn:=1
          else
          begin
            if (PacketRecords<rn)and(RecordCount<rn) then
            begin
              pk:=PacketRecords;
              PacketRecords:=rn-RecordCount;
              GetNextPacket;
              PacketRecords:=pk;
            end;
            if RecordCount<rn then rn:=RecordCount;
          end;

          RecNo:=rn;
        end;

      end;

      Screen.Cursor := SaveCursor;      // 保存していたマウスポインタに戻す

    end;

  end; // with

end;

end.
