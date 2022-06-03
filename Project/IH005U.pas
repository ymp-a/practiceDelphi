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
    { Private �錾 }
    function LogicalChecOk:Boolean; //�_���`�F�b�N
    procedure DataSetSQL;//����Ώۃf�[�^���o
    procedure MMPrv;virtual;     //�[�i�����[�v���r���[
  public
    { Public �錾 }
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
 �ړI:���
 ����:
 �ߒl:
*******************************************************************************}
begin
  inherited;
{  //�Ó�������
  if LogicalChecOk then
  begin

    //�f�[�^���o
    DataSetSQL;
    //�f�[�^�`�F�b�N
    if dmSUB703C.ClientDataSetF0703.RecordCount  =0  then
    begin
      MessageDlg('�Ώۃf�[�^������܂���B',mtError,[mbOK],0);
      Exit;
    end;

    //�o�͐�v�����^�ݒ�
    if dmUtils.GetPRTNAM(dmUtils.GetComputerNameS,Self.Name) <> '' then
        frxReport1.PrintOptions.Printer := dmUtils.GetPRTNAM(dmUtils.GetComputerNameS,Self.Name);

    //�o�͎w�����e�Z�b�g
    PRTParmSET;

    frxReport1.PrintOptions.ShowDialog := False;
    frxReport1.PrepareReport();
    frxReport1.print;

    dmUtils.StartTransaction;

    try
      //�`�F�b�N���X�g�敪�X�V
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
 �ړI:����v���r���[
 ����:
 �ߒl:
*******************************************************************************}
begin
  inherited;
  //�Ó�������
  if LogicalChecOk then
  begin

    //�f�[�^���o
    DataSetSQL;
    //�f�[�^�`�F�b�N
    if DataModule2.CDS_IH005.RecordCount  =0  then
    begin
      MessageDlg('�Ώۃf�[�^������܂���B',mtError,[mbOK],0);
      Exit;
    end;

    //�o�͐�v�����^�ݒ�
//    if dmUtils.GetPRTNAM(dmUtils.GetComputerNameS,Self.Name) <> '' then
//        frxReport1.PrintOptions.Printer := dmUtils.GetPRTNAM(dmUtils.GetComputerNameS,Self.Name);
//
  //�������o��
//  MMPrv;




    frxReport1.PrintOptions.ShowDialog := True;
    frxReport1.ShowReport();

   { dmUtils.StartTransaction;

    try
      //�`�F�b�N���X�g�敪�X�V
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
 �ړI:����O�̃G���[�`�F�b�N
 ����:
 �ߒl:����
*******************************************************************************}
{*�_���`�F�b�N*}
begin
{  Result := True;
  EdtTRDTFR.Color:=clWindow;
  EdtTRDTTO.Color:=clWindow;

  ChkBlankPAS(EdtTRDTFR,'�J�n�����');
  ChkBlankPAS(EdtTRDTTO,'�I�������');

  if (EdtTRDTTO.Text < EdtTRDTFR.Text) then
  begin
    MessageDlg('�͈͎w�肪�������Ȃ��B',mtError,[mbOK],0);
    EdtTRDTTo.Color:=clERR;
    EdtTRDTTo.SetFocus;
    Result := False;
    Exit;
  end;
  }
end;

procedure TIH005.DataSetSQL;
{*******************************************************************************
 �ړI:����Ώۃf�[�^�̒��o
 ����:
 �ߒl:
*******************************************************************************}
var
  SINM,HSNM:string;
begin
  DataModule2.CDS_IH005.Close;

  with DataModule2.FDQryIH005 do
  begin
      Close;                                        // FDQueryLogin������
      SQL.Clear;                                    // SQL��������

      // ��������SQL����
      SQL.Add(' select MH.* ,MM.* ');
      SQL.Add(' from MTMFLP AS MM ');
      SQL.Add(' LEFT JOIN MTHFLP AS MH ');
      SQL.Add(' ON MM.MTNO = MH.MHNO ');
      SQL.Add(' WHERE MHTKCD=001  ');

      //      if EdtTNCD.Text<>'' then                      // �S����CD���͎��̏���
//      begin
//        SQL.Add(' AND TNTNCD = :TNCD ');
//        ParamByName('TNCD').AsString:=EdtTNCD.Text; // ���͂����S����CD��'TNCD'�ɑ������
////        andFlg:=true;                             // ���͎��t���O�I��
//      end;
//
//      if EdtNAME.Text<>'' then                      // �S���Җ����͎��̏���
//      begin
//        SQL.Add(' AND TNNAME LIKE :NAME ');         // TNNAME LIKE��%���͖�%��SQLString�ɔ��f����
//        ParamByName('NAME').AsWideString :='%' +EdtNAME.Text+ '%'; // ������v�̓��͖���'NAME'�֑������
////        andFlg:=true;                             // ���͎��t���O�I��
//      end;

      SQL.Add(' ORDER BY MHIRDT,MHTKCD,MTNO,MTGNO ');                 // ����

      Open();                                       // SQL�����s
//    end;

    DataModule2.CDS_IH005.Open();                   // CDS���J��


//      if DataModule2.CDS_IH004.Eof and DataModule2.CDS_IH004.Bof then
      if isEmpty then                               // �f�[�^�Z�b�g���Ȃ���ΏI���A��L�����`
      begin
        DataModule2.CDS_IH005.Active := False;
        raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
      end;

    end; // DataModule2.FDQryIH004�����܂�
  DataModule2.CDS_IH005.Open;
end;

procedure TIH005.MMPrv;
//�[�i���̃v���r���[
var
  prtnm:string;
begin
  //�������o��

    with frxReport1 do
    begin
      //�o�͐�v�����^
//      prtnm:=GetPRTNAM(dmUtilYbs.GetComputerNameS,Self.Name);
//      if prtnm <> '' then
//        PrintOptions.Printer := prtnm;      �v�����^�Ȃ��ł������Ȃ����H

      PrintOptions.ShowDialog := True;
      ShowReport();
    end;

end;

end.
