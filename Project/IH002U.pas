unit IH002U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DspTran, Data.DB, System.Actions,
  Vcl.ActnList, PageTop, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Datasnap.DBClient;

type
  TIH002 = class(TDspTranFrm)
    Label1: TLabel;
    EdtMHNO: TEdit;
    Label3: TLabel;
    EdtTKCD: TEdit;
    Label2: TLabel;
    EdtMHIRDT: TEdit;
    Label5: TLabel;
    EdtMHKGDT: TEdit;
    Label4: TLabel;
    EdtTNCD: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject); // 検索ボタン
    procedure Button2Click(Sender: TObject); // 追加ボタン
    procedure Button3Click(Sender: TObject); // 変更ボタン
    procedure Button4Click(Sender: TObject); // 削除ボタン
    procedure Button7Click(Sender: TObject); // コピーボタン
    procedure Button8Click(Sender: TObject); // 表示ボタン
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private 宣言 }
  public
    { Public 宣言 }
  var
//    Mode:String;                             // モード管理
    pNo : integer;                           // 見積№
    procedure ShwNextFrm(mode: string);      // モード管理
  end;

var
  IH002: TIH002;

implementation

{$R *.dfm}

uses DM4, IH001U;

{===============================================================================
画面展開後に設定するイベント
===============================================================================}
procedure TIH002.FormShow(Sender: TObject);
begin
  inherited;
  Button1Click(Sender);
end;

{*******************************************************************************
 目的:モード管理の処理
 引数:
 戻値:
*******************************************************************************}
procedure TIH002.ShwNextFrm(mode: string);
var
  frm : Tform;
  frm3: TIH001;
  SaveCursor: TCursor;   // 現在のマウスポインタ保持用
  rn,pk:Integer;
begin
  with DataModule4.CDS_IH002 do
  begin

    if (mode<>'Add') and (Active=false) then Exit;

    if (mode='Chg') or (mode='Del') then
    begin
      // 元のソースコードにはロック排他制御があった
    end;//if

    if Active then  rn:=RecNo;


    SaveCursor := Screen.Cursor;        // 現マウスポインタを退避
    Screen.Cursor := crHourGlass;       // 砂時計に変更
    frm := TIH001.create(self,mode); // 見積メンテ画面を代入
    Screen.Cursor := SaveCursor;        // 保存していたマウスポインタに戻す
    frm.ShowModal;                      // 画面展開
    frm.Release;                        // TIH001インスタンス開放

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

{*******************************************************************************
 目的:検索ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TIH002.Button1Click(Sender: TObject);
var
  MHNO,TODT,FRDT,TKCD,TNCD:String;
begin
  inherited;

  //担当者CDと担当者名をDM4へ渡す準備
  MHNO:=EdtMHNO.Text;                               // 見積№
  TODT:=EdtMHIRDT.Text;                             // 見積依頼日
  FRDT:=EdtMHKGDT.Text;                             // 見積期限
  TKCD:=EdtTKCD.Text;                               // 得意先コード
  TNCD:=EdtTNCD.Text;                               // 担当者コード

  DBGrid1.DataSource.DataSet.Close;                 //DBGrid1の初期化

  DataModule4.OpenIH002MHData(MHNO,TODT,FRDT,TKCD,TNCD); //見積検索を開く

  DBGrid1.DataSource.DataSet.Open;                  // Grid1の展開
end;

{*******************************************************************************
 目的:追加ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TIH002.Button2Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Add');
  Button1Click(Sender); // 最新情報に更新
end;

{*******************************************************************************
 目的:変更ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TIH002.Button3Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Chg');
  Button1Click(Sender); // 最新情報に更新
end;

{*******************************************************************************
 目的:削除ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TIH002.Button4Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Del');
  Button1Click(Sender); // 最新情報に更新
end;

{*******************************************************************************
 目的:copyボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TIH002.Button7Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Cpy');
  Button1Click(Sender); // 最新情報に更新
end;

{*******************************************************************************
 目的:表示ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TIH002.Button8Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Dsp');
end;

{*******************************************************************************
 目的: グリッドソート実装
 引数:
 戻値:
 IndexDefsの定義はDatasnap.DBClient。
 並び順変更後はCDS開放前に項目名とindexを初期化すること。FormCloseの最初。
*******************************************************************************}
procedure TIH002.DBGrid1TitleClick(Column: TColumn);
var
 sFieldNM :String; //退避フィールド名
begin
  inherited;

with DBGrid1 do
  begin
    // 明細非表示時は処理無効
    if DataSource.DataSet.Active = False then Exit;

    // カラムのフィールド名を退避
    sFieldNM := Column.FieldName;

    with (DataSource.DataSet as TClientDataSet) do
    begin
      // インデックスフィールド作成
      if IndexDefs.Count = 0 then
        IndexDefs.Add('aIndex', '', []);



      //----------------------------//
      // 明細の表題／並び替えの制御 //
      //----------------------------//
      // ▲であればindex値が返る。▲以外であれば0なので▲のとき以下の処理を行う
      if AnsiPos('▲', Column.Title.Caption) <> 0 then
      begin
        // ----- 降順へ -----
        // 表題設定 古い▲を''に置換
        Column.Title.Caption := StringReplace(Column.Title.Caption, '▲', '', [rfReplaceAll]);
        Column.Title.Caption := Column.Title.Caption + '▼';

        // 降順フィールドの設定
        if IndexDefs[0].DescFields = '' then
          IndexDefs[0].DescFields := sFieldNM
        else
          IndexDefs[0].DescFields := IndexDefs[0].DescFields + ';' + sFieldNM;

        // インデックスフィールドのオプション初期化
        IndexDefs[0].Options := [];
      end
      // ▼のとき以下処理を行う
      else if AnsiPos('▼', Column.Title.Caption) <> 0 then
      begin
        // ----- 設定解除 -----
        // 表題設定
        Column.Title.Caption := StringReplace(Column.Title.Caption, '▼', '', [rfReplaceAll]);
        // 並び順の設定解除（降順フィールド）
        if AnsiPos(sFieldNM + ';', IndexDefs[0].DescFields) <> 0 then
          sFieldNM := sFieldNM + ';'
        else if AnsiPos(';' + sFieldNM, IndexDefs[0].DescFields) <> 0 then
          sFieldNM := ';' + sFieldNM;

        IndexDefs[0].DescFields := StringReplace(IndexDefs[0].DescFields, sFieldNM, '', [rfReplaceAll]);
        // カラムのフィールド名を再取得
        sFieldNM := Column.FieldName;

        // 並び順の設定解除（昇順フィールド）
        if AnsiPos(sFieldNM + ';', IndexDefs[0].Fields) <> 0 then
          sFieldNM := sFieldNM + ';'
        else if AnsiPos(';' + sFieldNM, IndexDefs[0].Fields) <> 0 then
          sFieldNM := ';' + sFieldNM;

        IndexDefs[0].Fields := StringReplace(IndexDefs[0].Fields, sFieldNM, '',[rfReplaceAll]);
        // 並び替え完全解除の場合インデックス名クリア
        if IndexDefs[0].Fields = '' then
          IndexName := '';

        // インデックスフィールドのオプション初期化
        IndexDefs[0].Options := [];
      end
      else
      begin
        // ----- 昇順へ -----
        // 表題設定
        Column.Title.Caption := Column.Title.Caption + '▲';

        // 昇順フィールドの設定
        if IndexDefs[0].Fields = '' then
          IndexDefs[0].Fields := sFieldNM
        else
          IndexDefs[0].Fields := IndexDefs[0].Fields + ';' + sFieldNM;

        // インデックスフィールドのオプション初期化
        IndexDefs[0].Options := [];
        // インデックス名設定
        if IndexName = '' then IndexName := 'aIndex';
      end;

      //データを開いたままソートを適用させるためIndexを削除して再設定
      DeleteIndex('aIndex');
      IndexName := 'aIndex';
      First;
    end;
  end;
end;

procedure TIH002.FormClose(Sender: TObject; var Action: TCloseAction);
var
  frm:TForm;
  i: Integer;
begin
  // 明細非表示時は処理無効
    if DBgrid1.DataSource.DataSet.Active = False then Exit;
  // 項目名の初期化
    for i:=0 to (DBGrid1.Columns.Count)-1 do
    begin
      if AnsiPos('▲', DBGrid1.Columns[i].Title.Caption) <> 0 then
        DBGrid1.Columns[i].Title.Caption := StringReplace( DBGrid1.Columns[i].Title.Caption, '▲', '', [rfReplaceAll]);
      if AnsiPos('▼', DBGrid1.Columns[i].Title.Caption) <> 0 then
        DBGrid1.Columns[i].Title.Caption := StringReplace( DBGrid1.Columns[i].Title.Caption, '▼', '', [rfReplaceAll]);
    end;
  // indexDefs[0]のフィールドを初期化
    with (DBgrid1.DataSource.DataSet as TClientDataSet) do
    begin
      // 昇順フィールドの初期化
      if IndexDefs[0].Fields <> '' then IndexDefs[0].Fields := '';
      // 降順フィールドの初期化
      if IndexDefs[0].DescFields <> '' then IndexDefs[0].DescFields := '';
      // IndexNameを初期化
      if IndexName = 'aIndex' then DeleteIndex('aIndex');
    end;

  inherited;

  with DataModule4 do
  begin
    FDQryF0004.Close;
    DataSrcF0004.DataSet.Close;
    DBGrid1.DataSource.DataSet.close();
  end;

end;

{$WARN GARBAGE OFF} // <-- end.以下にコメント追加
end.

//FormCloseのinherited前にCDSindex初期化を行う。
//先にinheritedを通過させると初期化ができなかったような気がする。
