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
    frxReport0: TfrxReport;
    frxReport1: TfrxReport;
    frxReport2: TfrxReport;
    frxReport3: TfrxReport;
    frxReport4: TfrxReport;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnPrtClick(Sender: TObject);
    procedure BtnPrvClick(Sender: TObject);
  private
    { Private �錾 }
    function LogicalChecOk:Boolean; //�_���`�F�b�N
    procedure DataSetSQL;//����Ώۃf�[�^���o

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
    CDS_IH005MS.Close;
    FDQryIH005MS.Close;
    FDQryIH005MS.SQL.Clear;
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




    frxReport4.PrintOptions.ShowDialog := True;
    frxReport4.ShowReport();


{   //�������[�𓯎��o�� �d�Ȃ炸
    frxReport1.LoadFromFile('C:\data\report1.fr3');
    frxReport1.PrepareReport;
    frxReport1.LoadFromFile('C:\data\report2.fr3');
    frxReport1.PrepareReport(False);
    frxReport1.ShowPreparedReport;
}

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
  Result := True;
  EdtTRDTFR.Color:=clWindow;
  EdtTRDTTO.Color:=clWindow;


  if (EdtTRDTTO.Text < EdtTRDTFR.Text) then
  begin
    MessageDlg('�͈͎w�肪�������Ȃ��B',mtError,[mbOK],0);
    EdtTRDTTo.Color:=clERR;
    EdtTRDTTo.SetFocus;
    Result := False;
    Exit;
  end;

end;

procedure TIH005.DataSetSQL;
{*******************************************************************************
 �ړI:����Ώۃf�[�^�̒��o
 ����:
 �ߒl:
*******************************************************************************}

begin
  DataModule2.CDS_IH005.Close;
  DataModule2.CDS_IH005MS.Close;

  with DataModule2.FDQryIH005 do
  begin
    Close;                                        // FDQueryLogin������
      SQL.Clear;                                    // SQL��������

      // ��������SQL���� PageHeader
      SQL.Add(' select ');
      SQL.Add(' DENSE_RANK() OVER(ORDER BY T.OldMTNO) AS NewMTNO, ');
      SQL.Add(' T.MHNO,T.MHIRDT,T.MHTKNM ');
      SQL.Add(' FROM ');
      SQL.Add(' (select ');
      SQL.Add(' (case when (MTGNO > 3) and (MTGNO % 3 = 0) then (RANK() OVER(ORDER BY MHIRDT,MHTKCD))+(MTGNO/3-1) ');
      SQL.Add(' else ');
      SQL.Add(' (case when (MTGNO > 3) and (MTGNO % 3 = 2) then (RANK() OVER(ORDER BY MHIRDT,MHTKCD))+(MTGNO/3) ');
      SQL.Add(' else ');
      SQL.Add(' (case when (MTGNO > 3) and (MTGNO % 3 = 1) then (RANK() OVER(ORDER BY MHIRDT,MHTKCD))+(MTGNO/3)  ');
      SQL.Add(' else ');
      SQL.Add('   (RANK() OVER(ORDER BY MHIRDT,MHTKCD,MHNO)) end)end)end) AS OldMTNO, ');
      SQL.Add('  ');
      SQL.Add(' (case when (MTGNO % 3 = 1) then 1  ');
      SQL.Add(' else ');
      SQL.Add('   (case when (MTGNO % 3 = 2) then 2 ');
      SQL.Add(' else ');
      SQL.Add('     (case when (MTGNO % 3 = 0) then 3 ');
      SQL.Add(' else ');
      SQL.Add(' 	  0 end) end) end) as NewGNO, ');
      SQL.Add('  ');
      SQL.Add(' MH.*, MM.* ');
      SQL.Add(' FROM MTMFLP AS MM ');
      SQL.Add(' LEFT JOIN MTHFLP AS MH ');
      SQL.Add(' ON MM.MTNO = MH.MHNO) AS T ');
      SQL.Add('  ');
      SQL.Add(' WHERE 1=1 ');
      SQL.Add(' AND T.MTJTCD<>''D'' ');

      //���͓�
      if RdGDTKB.ItemIndex=0 then
      begin
        if EdtTRDTFR.Text <> '' then
        begin
          SQL.Add(' AND MHIRDT >= :TRDTFR ');
          ParamByName('TRDTFR').AsString := EdtTRDTFR.EditText;
        end;
        if EdtTRDTTO.Text <> '' then
        begin
          SQL.Add(' AND MHIRDT <= :TRDTTO ');
          ParamByName('TRDTTO').AsString := EdtTRDTTO.EditText;
        end;
      end
      else
      //�˗���
      begin
        if EdtTRDTFR.Text <> '' then
        begin
          SQL.Add(' AND MHKGDT >= :TRDTFR ');
          ParamByName('TRDTFR').AsString := EdtTRDTFR.EditText;
        end;
        if EdtTRDTTO.Text <> '' then
        begin
          SQL.Add(' AND MHKGDT <= :TRDTTO ');
          ParamByName('TRDTTO').AsString := EdtTRDTTO.EditText;
        end;
      end;

      // ���Ӑ�
      if EdtTKCD.Text<>'' then
      begin
        SQL.Add(' AND T.MHTKCD= :TKCD ');
        ParamByName('TKCD').AsString := EdtTKCD.Text;
      end;

      // ���χ�
      if EdtMHNO.Text<>'0' then
      begin
        SQL.Add(' AND T.MHNO= :MHNO ');
        ParamByName('MHNO').AsString := EdtMHNO.Text;
      end;

      SQL.Add(' GROUP BY T.OldMTNO,T.MHIRDT,T.MHNO,T.MHTKNM ');
      SQL.Add('  ');

      Open();                                       // SQL�����s


      if isEmpty then                               // �f�[�^�Z�b�g���Ȃ���ΏI��
      begin
        DataModule2.CDS_IH005.Active := False;
        raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
      end;

       DataModule2.CDS_IH005.Open();                   // CDS���J��

  end;

  with DataModule2.FDQryIH005MS do
  begin
      Close;                                        // FDQueryLogin������
      SQL.Clear;                                    // SQL��������

      // ��������SQL���� ���׍s
      SQL.Add(' select ');
      SQL.Add(' DENSE_RANK() OVER(ORDER BY T.OldMTNO) AS NewMTNO, ');
      SQL.Add(' T.* ');
      SQL.Add(' FROM ');
      SQL.Add('  ');
      SQL.Add('  ');
      SQL.Add(' (select ');
      SQL.Add(' (case when (MTGNO > 3) and (MTGNO % 3 = 0) then (RANK() OVER(ORDER BY MHIRDT,MHTKCD))+(MTGNO/3-1) ');
      SQL.Add(' else ');
      SQL.Add('   (case when (MTGNO > 3) and (MTGNO % 3 = 2) then (RANK() OVER(ORDER BY MHIRDT,MHTKCD))+(MTGNO/3)  ');
      SQL.Add(' else ');
      SQL.Add(' (case when (MTGNO > 3) and (MTGNO % 3 = 1) then (RANK() OVER(ORDER BY MHIRDT,MHTKCD))+(MTGNO/3)  ');
      SQL.Add(' else ');
      SQL.Add(' (RANK() OVER(ORDER BY MHIRDT,MHTKCD,MHNO)) end)end)end) AS OldMTNO, ');
      SQL.Add('  ');
      SQL.Add(' (case when (MTGNO % 3 = 1) then 1  ');
      SQL.Add(' else ');
      SQL.Add(' (case when (MTGNO % 3 = 2) then 2  ');
      SQL.Add(' else ');
      SQL.Add(' (case when (MTGNO % 3 = 0) then 3  ');
      SQL.Add(' else ');
      SQL.Add(' 0 end) end) end) as NewGNO, ');
      SQL.Add('  ');
      SQL.Add(' MH.*, ');
      SQL.Add(' MM.* ');
      SQL.Add('  ');
      SQL.Add('  ');
      SQL.Add(' from MTMFLP AS MM ');
      SQL.Add(' LEFT JOIN MTHFLP AS MH ');
      SQL.Add(' ON MM.MTNO = MH.MHNO) AS T ');
      SQL.Add(' WHERE 1=1  ');
      SQL.Add(' AND T.MTJTCD<>''D'' ');
      SQL.Add('  ');
      SQL.Add('  ');
      SQL.Add('  ');
      SQL.Add('  ');
      SQL.Add('  ');
      SQL.Add('  ');


      //���͓�
      if RdGDTKB.ItemIndex=0 then
      begin
        if EdtTRDTFR.Text <> '' then
        begin
          SQL.Add(' AND MHIRDT >= :TRDTFR ');
          ParamByName('TRDTFR').AsString := EdtTRDTFR.EditText;
        end;
        if EdtTRDTTO.Text <> '' then
        begin
          SQL.Add(' AND MHIRDT <= :TRDTTO ');
          ParamByName('TRDTTO').AsString := EdtTRDTTO.EditText;
        end;
      end
      else
      //�˗���
      begin
        if EdtTRDTFR.Text <> '' then
        begin
          SQL.Add(' AND MHKGDT >= :TRDTFR ');
          ParamByName('TRDTFR').AsString := EdtTRDTFR.EditText;
        end;
        if EdtTRDTTO.Text <> '' then
        begin
          SQL.Add(' AND MHKGDT <= :TRDTTO ');
          ParamByName('TRDTTO').AsString := EdtTRDTTO.EditText;
        end;
      end;

      // ���Ӑ�
      if EdtTKCD.Text<>'' then
      begin
        SQL.Add(' AND T.MHTKCD = :TKCD ');         //
        ParamByName('TKCD').AsString := EdtTKCD.Text;
      end;

      // ���χ�
      if EdtMHNO.Text<>'0' then
      begin
        SQL.Add(' AND T.MHNO= :MHNO ');
        ParamByName('MHNO').AsString := EdtMHNO.Text;
      end;


      Open();                                       // SQL�����s


      if isEmpty then                               // �f�[�^�Z�b�g���Ȃ���ΏI��
      begin
        DataModule2.CDS_IH005MS.Active := False;
        raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
      end;

      DataModule2.CDS_IH005MS.Open();                   // CDS���J��

    end; // DataModule2.FDQryIH005MS�����܂�

end;



end.
