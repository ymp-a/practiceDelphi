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
    EdtMode: TEdit;
    Button4: TButton;
    Button5: TButton;
    //終了ボタン
    procedure Button3Click(Sender: TObject);
    //検索ボタン
    procedure Button1Click(Sender: TObject);
    //変更ボタン
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private 宣言 }

  public
    { Public 宣言 }
    var
      TNCD:String;
      reNAME:String;
      Mode:String;
  // モード管理
    procedure ShwNextFrm(mode: string);
  end;

var
  F0001Frm: TF0001Frm;

implementation

{$R *.dfm}

uses Unit1, DM2, F0002, EdtMaster, MNK001, DM3;

//検索ボタンの処理
procedure TF0001Frm.Button1Click(Sender: TObject);
begin
  begin
  if Mode = 'Add' then EdtMode.Text := '追加';
  if Mode = 'Chg' then EdtMode.Text := '変更';
  if Mode = 'Dsp' then EdtMode.Text := '照会';
  end;

  //担当者CDと担当者名をDM2へ渡す準備
  TNCD:=EdtTNCD.Text;
  reNAME:=EdtNAME.Text;

  //DBGrid1の初期化
  DBGrid1.DataSource.DataSet.Close;

  //担当者検索を開く
  DataModule2.OpenTNData(TNCD,reNAME);

end; // 検索ボタンの処理ここまで


//変更ボタンの処理
procedure TF0001Frm.Button2Click(Sender: TObject);
var
  frm : TF0002Frm;
begin
  //DBGrid1にデータがない場合中断
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  if DBGrid1.DataSource.DataSet.Active=False then abort;
  if DBGrid1.DataSource.DataSet.IsEmpty then abort;

  ShwNextFrm('Chg');

  //照会画面復活
  Self.Show;
  //最新状態を表示する
  Button1Click(Button1);
end; //変更ボタンの処理ここまで

//終了ボタンの処理
procedure TF0001Frm.Button3Click(Sender: TObject);
begin
  //非表示チェック
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  //画面終了
  Close;
end; // 終了処理ここまで


// 追加ボタンの処理
procedure TF0001Frm.Button4Click(Sender: TObject);
begin
  ShwNextFrm('Add');
end; // 追加ボタンの処理ここまで

// 削除ボタンの処理
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

procedure TF0001Frm.ShwNextFrm(mode: string);
var
  frm : Tform;
  SaveCursor: TCursor;   // 現在のマウスポインタ保持用
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
    end;//if

    if Active then  rn:=RecNo;

    // 現マウスポインタを退避
    SaveCursor := Screen.Cursor;
    // 砂時計に変更
    Screen.Cursor := crHourGlass;

    frm := TF0002Frm.create(self,mode); // 担当者メンテ画面を代入

    // 保存していたマウスポインタに戻す
    Screen.Cursor := SaveCursor;

    frm.ShowModal; // 画面展開
    frm.Release;   // F0001インスタンス開放

    //再検索
    if mode<>'Dsp' then
    begin    //現マウスポインタを退避
      SaveCursor := Screen.Cursor;
      //砂時計に変更
      Screen.Cursor := crHourGlass;

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

      //保存していたマウスポインタに戻す
      Screen.Cursor := SaveCursor;
    end;

  end;//with
end;
end.
