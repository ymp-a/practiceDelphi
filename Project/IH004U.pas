unit IH004U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DspMaster, Data.DB, System.Actions,
  Vcl.ActnList, PageTop, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TIH004 = class(TDspMasterFrm)
    EdtTNCD: TEdit;
    Label1: TLabel;
    EdtNAME: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    procedure ShwNextFrm(mode: string);      // モード管理
  end;

var
  IH004: TIH004;

implementation

{$R *.dfm}

uses DM2, IH003U;

procedure TIH004.Button1Click(Sender: TObject);
{*******************************************************************************
 目的:担当者マスタにデータオープン
 引数:
 戻値:
*******************************************************************************}
begin
  inherited;

  DBGrid1.DataSource.DataSet.Close;    // DBGrid1の初期化

  begin
    DataModule2.CDS_IH004.Close; // CDSを初期化

    with DataModule2.FDQryIH004 do
    begin
      Close; // FDQueryLogin初期化
      SQL.Clear;         // SQL文初期化
//      Params.Clear;

      // ここからSQL文↓
      SQL.Add(' SELECT * FROM TNMMSP  ');
      SQL.Add(' where 1=1 ');
      if EdtTNCD.Text<>'' then // 担当者CD入力時の処理
      begin
        SQL.Add(' AND TNTNCD = :TNCD ');
        ParamByName('TNCD').AsString:=EdtTNCD.Text; // 入力した担当者CDを'TNCD'に代入する
//        andFlg:=true;                       // 入力時フラグオン
      end;

      if EdtNAME.Text<>'' then                    // 担当者名入力時の処理
      begin
        SQL.Add(' AND TNNAME LIKE :NAME ');                      // TNNAME LIKEに%入力名%をSQLStringに反映する
        ParamByName('NAME').AsWideString :='%' +EdtNAME.Text+ '%'; // 部分一致の入力名を'NAME'へ代入する
//        andFlg:=true;                                        // 入力時フラグオン
      end;

      SQL.Add(' ORDER BY TNTNCD ');     // 昇順

      Open();                 // SQL文実行
    end;

    DataModule2.CDS_IH004.Open(); // CDSを開く


    if DataModule2.CDS_IH004.Eof and DataModule2.CDS_IH004.Bof then // 対象データが存在しない場合、データセットを閉じて終了
    begin
      DataModule2.CDS_IH004.Active := False;
      raise Exception.Create('対象データが存在しません');
    end;

  end;// CDSここまで

  DBGrid1.DataSource.DataSet.Open;

end;// OpenTNDataここまで


procedure TIH004.Button2Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Add');
  Button1Click(Sender); // 最新情報に更新
end;

procedure TIH004.Button3Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Chg');
  Button1Click(Sender); // 最新情報に更新
end;

procedure TIH004.Button4Click(Sender: TObject);
begin
  inherited;
  // 削除済の行はアラートを表示する
  if DataModule2.CDS_IH004.FieldByName('TNSTKB').AsString='D' then
    begin
    MessageDlg('すでに削除されています。（´・ω・｀）', mtError, [mbOk], 0);
    Exit;
    end;
  ShwNextFrm('Del');
  Button1Click(Sender); // 最新情報に更新
end;

procedure TIH004.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DataModule2 do
  begin
    FDQryIH004.Close;
    CDS_IH004.Close;
  end;
end;

procedure TIH004.FormShow(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
  EdtTNCD.SetFocus;
end;

{*******************************************************************************
 目的:モード管理の処理
 引数:
 戻値:
*******************************************************************************}
procedure TIH004.ShwNextFrm(mode: string);
var
  frm : Tform;
  SaveCursor: TCursor;   // 現在のマウスポインタ保持用
  rn,pk:Integer;
begin
  with DataModule2.CDS_IH004 do
  begin

    if (mode<>'Add') and (Active=false) then Exit;

    if (mode='Chg') or (mode='Del') then
    begin
      // 元のソースコードにはロック排他制御があった
    end;//if

    if Active then  rn:=RecNo;


    SaveCursor := Screen.Cursor;        // 現マウスポインタを退避
    Screen.Cursor := crHourGlass;       // 砂時計に変更
    frm := TIH003.create(self,mode);    // 担当メンテ画面を代入
    Screen.Cursor := SaveCursor;        // 保存していたマウスポインタに戻す
    frm.ShowModal;                      // 画面展開
    frm.Release;                        // TIH003インスタンス開放

    //再検索
    if mode<>'Dsp' then
    begin
      SaveCursor := Screen.Cursor;      //現マウスポインタを退避
      Screen.Cursor := crHourGlass;     //砂時計に変更

      if Active then
        Refresh; // Qryインスタンスの解放？

     if Active then                   // CDSでしかPacketRecordsは利用できない
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


      Screen.Cursor := SaveCursor;      //保存していたマウスポインタに戻す
    end;

  end; // with

end; // ShwNextFrmここまで

end.
