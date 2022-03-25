unit F0004;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

type
  TF0004Frm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtMHNO: TEdit;
    EdtMHIRDT: TEdit;
    Button1: TButton;
    EdtMode: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    EdtTKCD: TEdit;
    EdtTNCD: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtMHKGDT: TEdit;
    Label5: TLabel;
    Button6: TButton;
    ActionList1: TActionList;
    F1: TAction;
    F2: TAction;
    F8: TAction;
    F3: TAction;
    F9: TAction;
    F6: TAction;
    procedure Button1Click(Sender: TObject); // 検索ボタン
    procedure Button3Click(Sender: TObject); // 終了ボタン
    procedure Button4Click(Sender: TObject); // 追加ボタン
    procedure Button2Click(Sender: TObject); // 変更ボタン
    procedure Button5Click(Sender: TObject); // 削除ボタン
    procedure Button6Click(Sender: TObject); // 表示ボタン

  private
    { Private 宣言 }
var
    bFiest:Boolean;                          //最初しか呼びたくないので（排他制御用）
    sOpenDATE,SOpenTime:string;
    objOwner:TComponent;                     //飛び出し元のオブジェクトを保存
  public
    { Public 宣言 }
  var
    Mode:String;                             // モード管理
    pNo : integer;                           // 見積№
    procedure ShwNextFrm(mode: string);      // モード管理
  end;

var
  F0004Frm: TF0004Frm;

implementation

{$R *.dfm}

uses DM4, MNK001, Utilybs, functions, F0003, EdtMaster, Datasnap.DBClient;

{*******************************************************************************
 目的:検索ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0004Frm.Button1Click(Sender: TObject);
var
  MHNO,TODT,FRDT,TKCD,TNCD:String;
begin
  begin                                             // メニューから遷移した際のMode管理
  if Mode = 'Add' then EdtMode.Text := '追加';
  if Mode = 'Chg' then EdtMode.Text := '変更';
  if Mode = 'Dsp' then EdtMode.Text := '照会';
  end;

  //担当者CDと担当者名をDM4へ渡す準備
  MHNO:=EdtMHNO.Text;                               // 見積№
  TODT:=EdtMHIRDT.Text;                             // 見積依頼日
  FRDT:=EdtMHKGDT.Text;                             // 見積期限
  TKCD:=EdtTKCD.Text;                               // 得意先コード
  TNCD:=EdtTNCD.Text;                               // 担当者コード

  DBGrid1.DataSource.DataSet.Close;                 //DBGrid1の初期化

  DataModule4.OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD); //見積検索を開く

end;

{*******************************************************************************
 目的:変更ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0004Frm.Button2Click(Sender: TObject);
begin
  ShwNextFrm('Chg');
end;

{*******************************************************************************
 目的:終了ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0004Frm.Button3Click(Sender: TObject);
begin
  //非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;

  Close; //画面終了
end;

{*******************************************************************************
 目的:追加ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0004Frm.Button4Click(Sender: TObject);
begin
  ShwNextFrm('Add');
end;

{*******************************************************************************
 目的:削除ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0004Frm.Button5Click(Sender: TObject);
begin
  ShwNextFrm('Del');
end;

{*******************************************************************************
 目的:表示ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0004Frm.Button6Click(Sender: TObject);
begin
  ShwNextFrm('Dsp');
end;

{*******************************************************************************
 目的:モード管理の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0004Frm.ShwNextFrm(mode: string);
var
  frm : Tform;
  frm3: TF0003Frm;
  SaveCursor: TCursor;   // 現在のマウスポインタ保持用
  rn,pk:Integer;
begin
  with DataModule4.FDQryF0004 do
  begin

    if (mode<>'Add') and (Active=false) then Exit;

    if (mode='Chg') or (mode='Del') then
    begin
      // 元のソースコードにはロック排他制御があった
    end;//if

    if Active then  rn:=RecNo;


    SaveCursor := Screen.Cursor;        // 現マウスポインタを退避
    Screen.Cursor := crHourGlass;       // 砂時計に変更
    frm := TF0003Frm.create(self,mode); // 見積メンテ画面を代入
    Screen.Cursor := SaveCursor;        // 保存していたマウスポインタに戻す
    frm.ShowModal;                      // 画面展開
    frm.Release;                        // F0003インスタンス開放

    //再検索
    if mode<>'Dsp' then
    begin
      SaveCursor := Screen.Cursor;      //現マウスポインタを退避
      Screen.Cursor := crHourGlass;     //砂時計に変更

      if DataModule4.FDQryF0004.Active then
        DataModule4.FDQryF0004.Refresh; // Qryインスタンスの解放？

    {  if Active then                   // CDSでしかPacketRecordsは利用できない
      begin
        Refresh;
        if not IsEmpty then
        begin
          if rn<=0 then
            rn:=1
          else
          begin
            if (FDQryF0004.Records<rn)and(RecordCount<rn) then
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
     }

      Screen.Cursor := SaveCursor;      //保存していたマウスポインタに戻す
    end;

  end; // with

end; // ShwNextFrmここまで

end.
