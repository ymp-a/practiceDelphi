unit F0004;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

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
    procedure Button1Click(Sender: TObject); // 検索ボタン
    procedure Button3Click(Sender: TObject); // 終了ボタン
    procedure Button4Click(Sender: TObject); // 追加ボタン
    procedure Button2Click(Sender: TObject); // 変更ボタン
    procedure Button5Click(Sender: TObject); // 削除ボタン
    procedure Button6Click(Sender: TObject); // 照会ボタン

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

procedure TF0004Frm.Button1Click(Sender: TObject);
var
  MHNO,TODT,FRDT,TKCD,TNCD:String;
begin
  begin
  if Mode = 'Add' then EdtMode.Text := '追加';
  if Mode = 'Chg' then EdtMode.Text := '変更';
  if Mode = 'Dsp' then EdtMode.Text := '照会';
  end;

  //担当者CDと担当者名をDM4へ渡す準備
  MHNO:=EdtMHNO.Text;
  TODT:=EdtMHIRDT.Text;
  FRDT:=EdtMHKGDT.Text;
  TKCD:=EdtTKCD.Text;
  TNCD:=EdtTNCD.Text;

  //DBGrid1の初期化
  DBGrid1.DataSource.DataSet.Close;

  //見積検索を開く
  DataModule4.OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD);
end;

procedure TF0004Frm.Button2Click(Sender: TObject);
begin
  ShwNextFrm('Chg');
end;

procedure TF0004Frm.Button3Click(Sender: TObject);
begin
    //非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  //画面終了
  Close;
end;

procedure TF0004Frm.Button4Click(Sender: TObject);
begin
  ShwNextFrm('Add');
end;

procedure TF0004Frm.Button5Click(Sender: TObject);
begin
  ShwNextFrm('Del');
end;

procedure TF0004Frm.Button6Click(Sender: TObject);
begin
  ShwNextFrm('Dsp');
end;

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
      // 元はロック排他制御があった
    end;//if

    if Active then  rn:=RecNo;

    // 現マウスポインタを退避
    SaveCursor := Screen.Cursor;
    // 砂時計に変更
    Screen.Cursor := crHourGlass;

    frm := TF0003Frm.create(self,mode); // 見積メンテ画面を代入


    // 保存していたマウスポインタに戻す
    Screen.Cursor := SaveCursor;

    frm.ShowModal; // 画面展開
    frm.Release;   // F0003インスタンス開放

    //再検索
    if mode<>'Dsp' then
    begin    //現マウスポインタを退避
      SaveCursor := Screen.Cursor;
      //砂時計に変更
      Screen.Cursor := crHourGlass;

      if DataModule4.FDQryF0004.Active then
        DataModule4.FDQryF0004.Refresh;

    {  if Active then     // CDSでしかPacketRecordsは利用できない
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
      //保存していたマウスポインタに戻す
      Screen.Cursor := SaveCursor;
    end;

  end;//with
end;



end.
