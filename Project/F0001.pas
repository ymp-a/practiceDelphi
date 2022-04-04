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
    procedure DBGrid1TitleClick(Column: TColumn); // グリッドソート
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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

uses Unit1, DM2, F0002, EdtMaster, MNK001, Datasnap.DBClient;

{*******************************************************************************
 目的:検索ボタン押下時の処理
 引数:
 戻値:
*******************************************************************************}
procedure TF0001Frm.Button1Click(Sender: TObject);
begin

  TNCD:=EdtTNCD.Text;                  // 担当者CDと担当者名をDM2へ渡す準備
  reNAME:=EdtNAME.Text;

//  DBGrid1.DataSource.DataSet.Close;    // DBGrid1の初期化
//  showmessage('');
//  DataModule2.OpenTNData(TNCD,reNAME); // 担当者検索を開く

//  DBGrid1.DataSource.DataSet.Open;     // DBGrid1を展開（DMでCDS管理の場合DataSetOpen必須?）
//  showmessage('');
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
    {
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
      }
  end; // with

end;

{*******************************************************************************
 目的: グリッドソート実装
 引数:
 戻値:
 IndexDefsの定義はDatasnap.DBClient。
 並び順変更後はCDS開放前に項目名とindexを初期化すること。FormCloseの最初。
*******************************************************************************}
procedure TF0001Frm.DBGrid1TitleClick(Column: TColumn);
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
      if AnsiPos('▲', Column.Title.Caption) <> 0 then
      begin
        // ----- 降順へ -----
        // 表題設定
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

procedure TF0001Frm.FormClose(Sender: TObject; var Action: TCloseAction);
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
  // indexの初期化
    with (DBgrid1.DataSource.DataSet as TClientDataSet) do
    begin
    if  IndexName = 'aIndex' then
     DeleteIndex('aIndex');
    end;

  inherited;

  with DataModule2 do
  begin
    FDQryTNMMSP.Close;
    ClientDataSetTNMMSP.Close;
  end;

end;

end.
