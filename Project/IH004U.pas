unit IH004U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DspMaster, Data.DB, System.Actions,
  Vcl.ActnList, PageTop, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Datasnap.DBClient;

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
    procedure DBGrid1TitleClick(Column: TColumn); // Gridソート機能
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
var
  frm:TForm;
  i: Integer;
begin
  // 明細非表示時は処理無効
    if DBgrid1.DataSource.DataSet.Active = False then Exit;

    with (DBGrid1.DataSource.DataSet as TClientDataSet) do
    begin
      // IndexDefsが存在するとき
      if IndexDefs.count <> 0 then
      begin
        // 項目名の初期化
        for i:=0 to (DBGrid1.Columns.Count)-1 do
        begin
          if AnsiPos('▲', DBGrid1.Columns[i].Title.Caption) <> 0 then
            DBGrid1.Columns[i].Title.Caption := StringReplace( DBGrid1.Columns[i].Title.Caption, '▲', '', [rfReplaceAll]);
          if AnsiPos('▼', DBGrid1.Columns[i].Title.Caption) <> 0 then
            DBGrid1.Columns[i].Title.Caption := StringReplace( DBGrid1.Columns[i].Title.Caption, '▼', '', [rfReplaceAll]);
        end;

        // indexDefs[0]のフィールドを初期化
        // 昇順フィールドの初期化
        if IndexDefs[0].Fields <> '' then IndexDefs[0].Fields := '';
        // 降順フィールドの初期化
        if IndexDefs[0].DescFields <> '' then IndexDefs[0].DescFields := '';
        // IndexNameを初期化
        if IndexName = 'aIndex' then DeleteIndex('aIndex');
      end;
    end;
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

{*******************************************************************************
 目的: グリッドソート実装
 引数:
 戻値:
 IndexDefsの定義はDatasnap.DBClient。
 並び順変更後はCDS開放前に項目名とindexを初期化すること。FormCloseの最初。
*******************************************************************************}
procedure TIH004.DBGrid1TitleClick(Column: TColumn);
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

end.
