unit IH005U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PrtTra, frxClass, frxExportPDF,
  System.Actions, Vcl.ActnList, PageTop, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Mask, MaskEditDate, NumberEdit, Utilybs;

type
  TIH005 = class(TPrintTra)
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    EdtTKRS: TEdit;
    EdtTKCD: TEdit;
    RdGDTKB: TRadioGroup;
    CkbDLDP: TCheckBox;
    CkbNotPrt: TCheckBox;
    EdtTRDTTO: TMaskEditDate;
    EdtTRDTFR: TMaskEditDate;
    Label4: TLabel;
    EdtMHNO: TNumberEdit;
    frxReport1: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnPrtClick(Sender: TObject);
    procedure BtnPrvClick(Sender: TObject);
  private
    { Private 宣言 }
    function LogicalChecOk:Boolean; //論理チェック
    procedure DataSetSQL;//印刷対象データ抽出
    procedure MMPrv;virtual;     //納品書帳票プレビュー
  public
    { Public 宣言 }
  end;

var
  IH005: TIH005;

implementation

{$R *.dfm}

uses functions, DM2;

procedure TIH005.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  with DataModule2 do
  begin
    CDS_IH005.Close;
    FDQryIH005.Close;
    FDQryIH005.SQL.Clear;
  end;
end;

procedure TIH005.BtnPrtClick(Sender: TObject);
{*******************************************************************************
 目的:印刷
 引数:
 戻値:
*******************************************************************************}
begin
  inherited;
{  //妥当性検査
  if LogicalChecOk then
  begin

    //データ抽出
    DataSetSQL;
    //データチェック
    if dmSUB703C.ClientDataSetF0703.RecordCount  =0  then
    begin
      MessageDlg('対象データがありません。',mtError,[mbOK],0);
      Exit;
    end;

    //出力先プリンタ設定
    if dmUtils.GetPRTNAM(dmUtils.GetComputerNameS,Self.Name) <> '' then
        frxReport1.PrintOptions.Printer := dmUtils.GetPRTNAM(dmUtils.GetComputerNameS,Self.Name);

    //出力指示内容セット
    PRTParmSET;

    frxReport1.PrintOptions.ShowDialog := False;
    frxReport1.PrepareReport();
    frxReport1.print;

    dmUtils.StartTransaction;

    try
      //チェックリスト区分更新
      UPD_CKLSTKB(1);

      dmUtils.Commit;
    except
      on e:Exception do
      begin
        dmUtils.Rollback;
        MessageDlg(E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;

  end;
 }
end;

procedure TIH005.BtnPrvClick(Sender: TObject);
{*******************************************************************************
 目的:印刷プレビュー
 引数:
 戻値:
*******************************************************************************}
begin
  inherited;
  //妥当性検査
  if LogicalChecOk then
  begin

    //データ抽出
    DataSetSQL;
    //データチェック
    if DataModule2.CDS_IH005.RecordCount  =0  then
    begin
      MessageDlg('対象データがありません。',mtError,[mbOK],0);
      Exit;
    end;

    //出力先プリンタ設定
//    if dmUtils.GetPRTNAM(dmUtils.GetComputerNameS,Self.Name) <> '' then
//        frxReport1.PrintOptions.Printer := dmUtils.GetPRTNAM(dmUtils.GetComputerNameS,Self.Name);
//
  //事務所出力
//  MMPrv;




    frxReport1.PrintOptions.ShowDialog := True;
    frxReport1.ShowReport();

   { dmUtils.StartTransaction;

    try
      //チェックリスト区分更新
      UPD_CKLSTKB(2);

      dmUtils.Commit;
    except
      on e:Exception do
      begin
        dmUtils.Rollback;
        MessageDlg(E.Message, mtError, [mbOK], 0);
        Abort;
      end;
    end;}
  end;

end;

function TIH005.LogicalChecOk: Boolean;
{*******************************************************************************
 目的:印刷前のエラーチェック
 引数:
 戻値:正常
*******************************************************************************}
{*論理チェック*}
begin
{  Result := True;
  EdtTRDTFR.Color:=clWindow;
  EdtTRDTTO.Color:=clWindow;

  ChkBlankPAS(EdtTRDTFR,'開始取引日');
  ChkBlankPAS(EdtTRDTTO,'終了取引日');

  if (EdtTRDTTO.Text < EdtTRDTFR.Text) then
  begin
    MessageDlg('範囲指定が正しくない。',mtError,[mbOK],0);
    EdtTRDTTo.Color:=clERR;
    EdtTRDTTo.SetFocus;
    Result := False;
    Exit;
  end;
  }
end;

procedure TIH005.DataSetSQL;
{*******************************************************************************
 目的:印刷対象データの抽出
 引数:
 戻値:
*******************************************************************************}
var
  SINM,HSNM:string;
begin
  DataModule2.CDS_IH005.Close;

  with DataModule2.FDQryIH005 do
  begin
      Close;                                        // FDQueryLogin初期化
      SQL.Clear;                                    // SQL文初期化

      // ここからSQL文↓
      SQL.Add(' select MH.* ,MM.* ');
      SQL.Add(' from MTMFLP AS MM ');
      SQL.Add(' LEFT JOIN MTHFLP AS MH ');
      SQL.Add(' ON MM.MTNO = MH.MHNO ');
      SQL.Add(' WHERE MHTKCD=001  ');

      //      if EdtTNCD.Text<>'' then                      // 担当者CD入力時の処理
//      begin
//        SQL.Add(' AND TNTNCD = :TNCD ');
//        ParamByName('TNCD').AsString:=EdtTNCD.Text; // 入力した担当者CDを'TNCD'に代入する
////        andFlg:=true;                             // 入力時フラグオン
//      end;
//
//      if EdtNAME.Text<>'' then                      // 担当者名入力時の処理
//      begin
//        SQL.Add(' AND TNNAME LIKE :NAME ');         // TNNAME LIKEに%入力名%をSQLStringに反映する
//        ParamByName('NAME').AsWideString :='%' +EdtNAME.Text+ '%'; // 部分一致の入力名を'NAME'へ代入する
////        andFlg:=true;                             // 入力時フラグオン
//      end;

      SQL.Add(' ORDER BY MHIRDT,MHTKCD,MTNO,MTGNO ');                 // 昇順

      Open();                                       // SQL文実行
//    end;

    DataModule2.CDS_IH005.Open();                   // CDSを開く


//      if DataModule2.CDS_IH004.Eof and DataModule2.CDS_IH004.Bof then
      if isEmpty then                               // データセットがなければ終了、上記も同義
      begin
        DataModule2.CDS_IH005.Active := False;
        raise Exception.Create('対象データが存在しません');
      end;

    end; // DataModule2.FDQryIH004ここまで
  DataModule2.CDS_IH005.Open;
end;

procedure TIH005.MMPrv;
//納品書のプレビュー
var
  prtnm:string;
begin
  //事務所出力

    with frxReport1 do
    begin
      //出力先プリンタ
//      prtnm:=GetPRTNAM(dmUtilYbs.GetComputerNameS,Self.Name);
//      if prtnm <> '' then
//        PrintOptions.Printer := prtnm;      プリンタなしでもいけないか？

      PrintOptions.ShowDialog := True;
      ShowReport();
    end;

end;

end.
