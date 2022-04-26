unit IH001U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EdtTraHM, System.Actions, Vcl.ActnList,
  Vcl.DBCGrids, PageTop, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, DBEditUNIC, Vcl.DBCtrls,
  Vcl.Mask, FireDAC.Comp.Client, Data.DB, DBClient;

type
  TIH001 = class(TEdtTraHMFrm)
    EdtMHBIKO: TDBEditUNIC;
    Label6: TLabel;
    EdtMHKGDT: TDBEditUNIC;
    Label3: TLabel;
    Label15: TLabel;
    EdtMHTNCD: TDBEditUNIC;
    Label5: TLabel;
    EdtMHIRDT: TDBEditUNIC;
    Label2: TLabel;
    EdtMHTKNM: TDBEditUNIC;
    EdtMHTKCD: TDBEditUNIC;
    Label4: TLabel;
    EdtMHNO: TDBEditUNIC;
    Label1: TLabel;
    EdtMHGKIN: TDBEditUNIC;
    Label14: TLabel;
    EdtMHGSRO: TDBEditUNIC;
    Label13: TLabel;
    EdtMTTNKA: TDBEditUNIC;
    EdtMTBIKO: TDBEditUNIC;
    EdtMTKIN: TDBEditUNIC;
    EdtMTSRYO: TDBEditUNIC;
    EdtMTSHNM: TDBEditUNIC;
    EdtMTSHCD: TDBEditUNIC;
    ChkDel1: TDBCheckBox;
    EdtMTGNO: TDBText;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label7: TLabel;
    Button3: TButton;
    EdtMTNO: TDBText;
    Label16: TLabel;
    Label17: TLabel;
    mSRYO: TDBEditUNIC;
    mKIN: TDBEditUNIC;
    Label18: TLabel;
    Label19: TLabel;
    procedure FormShow(Sender: TObject);         // ��ʕ\���̏���
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // ��ʏI���̏���
    procedure Button3Click(Sender: TObject);     // �ǉ��{�^��
    procedure EdtMHTNCDExit(Sender: TObject);    // �S���Җ������}��
    procedure EdtMTTNKAExit(Sender: TObject);    // �P���~���ʏ���
    procedure EdtMTSRYOExit(Sender: TObject);    // �P���~���ʏ���
    procedure DBCtrlGrid1Exit(Sender: TObject);  // DBCtrlGrid1����J�[�\��out����
    procedure DBCtrlGrid1Enter(Sender: TObject); // DBCtrlGrid1�ɃJ�[�\��in�̏���
    procedure F6Execute(Sender: TObject);        // F6��������
    procedure EdtTNCDDblClick(Sender: TObject);  // TNCD�}�X�^����

  private
    { Private �錾 }
    gnocount:integer;                            // �s��

    procedure dspHeader;                         // �\��-�w�b�_�[���ڐݒ�
    procedure dspDetail;                         // �\��-���׍��ڐݒ�

    procedure hset();                            // �X�V���w�b�_�[�ݒ�
    procedure mset();                            // �X�V�����אݒ�

    //ClientDataSet�ɐݒ肷��C�x���g
    procedure AfterOpen(DataSet: TDataSet);      // CDSOpen����̏���
    procedure AfterInsert(DataSet: TDataSet);    // �s���ݒ��}������
    procedure AfterScroll(DataSet: TDataSet);    // DataSet�ҏW�m��ҏW���[�h�ؑ�
    procedure BeforeScroll(DataSet: TDataSet);   // �s�J�ڎ��̐��ʋ��z�̍��v�𔽉f������

    procedure InzAddMode;override;               // �����ݒ�i�ǉ����[�h�j
    procedure InzChgMode;override;               // �����ݒ�i�ύX���[�h�j
    procedure InzCpyMode;override;               // �����ݒ�iCopy���[�h�j
    procedure InzDelMode;override;               // �����ݒ�i�폜���[�h�j
    procedure InzDspMode;override;               // �����ݒ�i�\�����[�h�j
    procedure DbAdd;override;                    // �f�[�^�x�[�X�ւ̕ύX�i�ǉ����[�h�j
    procedure DbChenge;override;                 // �f�[�^�x�[�X�ւ̕ύX�i�ύX���[�h�j
    procedure DbDelete;override;                 // �f�[�^�x�[�X�ւ̕ύX�i�폜���[�h)
    function  LogicalChecOk:Boolean;override;    // �_���`�F�b�N


  public
    { Public �錾 }
  var
    pNo : integer;                               // ���χ�
    pMode:integer;                               // ���[�h
    copyNo:Integer;
  end;

var
  IH001: TIH001;

implementation

{$R *.dfm}

uses DM4, DM3, functions, MN001C, Utilybs, F0002, IH004MSU;

{===============================================================================
��ʓW�J��ɐݒ肷��C�x���g
===============================================================================}
procedure TIH001.FormShow(Sender: TObject);
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  compo: TObject;
  I: Integer;
  x1: Integer;
  x2: Integer;
begin
  inherited;
  DataModule4.CDS_IH001_MTM.AfterOpen:=AfterOpen;           // CDS�֊e�C�x���g���Z�b�g����
  DataModule4.CDS_IH001_MTM.AfterInsert:=AfterInsert;
  DataModule4.CDS_IH001_MTM.AfterScroll:=AfterScroll;
  DataModule4.CDS_IH001_MTM.BeforeScroll:=BeforeScroll;

  dspHeader;                                                // �\��-�w�b�_�[���ڐݒ� Qry
  dspDetail;                                                // �\��-���׍��ڐݒ� Qry
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;
  cds1.Open;                                                // CDSMTHFLP�I�[�v��
  cds2.Open;                                                // CDSMTMFLP�I�[�v��
  cds1.Edit;                                                // �ҏW���[�h
  cds2.Edit;                                                // �ҏW���[�h
  EdtMHTNCDExit(self);                                      // �S���Җ�����Ε\��

  //DBCheckbox�̐ݒ�
  cds2.DisableControls;               // ��ʂ�����h�~
  cds2.First;                         // �ŏ��̃��R�[�h�Ɉړ�
  for I := 0 to cds2.RecordCount-1 do // cds2�S���R�[�h��'D'�`�F�b�N
  begin                               // 'D'�̃w�b�_�[���R�[�h�ɂ�dataJTCD�I��(DBCheckBox�̕\��)
    if cds2.FieldByName('MTJTCD').AsString='D' then
    begin
      cds2.FieldByName('dataJTCD').AsBoolean:=true;
    end else
    begin
      cds2.FieldByName('dataJTCD').AsBoolean:=false;
    end;
    cds2.Next;                        // ���R�[�h����i�߂�
  end;
  cds2.First;                         // �ŏ��̃��R�[�h�Ɉړ�
  cds2.EnableControls;                // active��ʑJ�ڍĊJ����



  // �ǉ��A�R�s�[���[�h���͍ŐV�̌��χ����Z�b�g
  if (Mode='Add') or (Mode='Cpy') then
    DataModule4.CDS_IH001_MTH.FieldByName('MHNO').AsString:=DataModule4.MHTNO().MHNO;

  // �ǉ����[�h���͌��ψ˗����ɓ��͓����Z�b�g
  if (Mode='Add') then
    DataModule4.CDS_IH001_MTH.FieldByName('MHIRDT').AsString :=DateToStr(Date);
end;

{===============================================================================
��ʏI����ɐݒ肷��C�x���g
===============================================================================}
procedure TIH001.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    // ��\���`�F�b�N
  if (Button2.Enabled=false)or(Button2.Visible=false) then abort;

  with DataModule4 do   // �g�p����CDS��Qry���I��
  begin
    CDS_IH001_MTH.Close;
    CDS_IH001_MTM.Close;
    IH001_MTH.Close;
    IH001_MTM.Close;
  end;

end;

{*******************************************************************************
 �ړI:�ǉ��{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH001.Button3Click(Sender: TObject);
begin
  inherited;
  if DBCtrlGrid1.DataSource.DataSet.Active then
  begin
    DBCtrlGrid1.DataSource.DataSet.Append; // �ŏI�s�Ƀ��R�[�h�ǉ�����
  end;
end;

{===============================================================================
�S����CDExit���̃C�x���g ���͂���TNCD�����݂�����S������\������B
===============================================================================}
procedure TIH001.EdtMHTNCDExit(Sender: TObject);
var
  qry: TFDQuery;
begin
  qry:=DataModule3.FDQryGene;
  qry.Close;
  qry.SQL.Clear;
  qry.Params.Clear;

  qry.SQL.Add('select * from tnmmsp');
  qry.SQL.Add(' where tntncd=:cd');
  qry.SQL.Add('and tnstkb <> ''D'' ');
  qry.SQL.Add('');
  qry.ParamByName('cd').AsInteger:= EdtMHTNCD.Field.AsInteger; // �����́i�󔒁j��0�Ɏ����ϊ������֗�
  qry.Open();

  if qry.IsEmpty then EdtMHTNCD.Field.AsString := '';  // �L����TNCD�ȊO�Ȃ���̓t�H�[�����N���A

  Label15.Caption:=qry.FieldByName('TNNAME').AsString; // �S���Җ���}��
  qry.close;

end;

{===============================================================================
�P��Exit���̃C�x���g�i����*�P���j
===============================================================================}
procedure TIH001.EdtMTTNKAExit(Sender: TObject);
begin
  DBCtrlGrid1.DataSource.DataSet.Edit;
  EdtMTKIN.Field.AsInteger:=EdtMTTNKA.Field.AsInteger*EdtMTSRYO.Field.AsInteger;

end;

{===============================================================================
�P��Exit���̃C�x���g�i����*�P���j
===============================================================================}
procedure TIH001.EdtMTSRYOExit(Sender: TObject);
begin
  DBCtrlGrid1.DataSource.DataSet.Edit;
  EdtMTKIN.Field.AsInteger:=EdtMTTNKA.Field.AsInteger*EdtMTSRYO.Field.AsInteger;

end;

{===============================================================================
DBCtrlGridEnter���̃C�x���g
===============================================================================}
procedure TIH001.DBCtrlGrid1Enter(Sender: TObject);
begin
  DataModule4.CDS_IH001_MTM.Edit;   // DBCtrlGrid�ɃJ�[�\��in��CDS MTMFLP�ҏW���[�h
end;

{===============================================================================
DBCtrlGridExit���̃C�x���g
===============================================================================}
procedure TIH001.DBCtrlGrid1Exit(Sender: TObject);
var
  I:Integer;
  cds1: TClientDataSet;
  cds2: TClientDataSet;
begin
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;

  if DataModule4.CDS_IH001_MTM.State=dsEdit then
  begin

    //DBCheckbox�̐ݒ�
    cds2.DisableControls;               // ��ʂ�����h�~
    cds2.First;                         // �ŏ��̃��R�[�h�Ɉړ�
    for I := 0 to cds2.RecordCount-1 do // cds2�S���R�[�h��'D'�`�F�b�N
    begin                               // 'D'�̃w�b�_�[���R�[�h�ɂ�dataJTCD�I��
      if cds2.FieldByName('dataJTCD').AsBoolean=true then
      begin
        // ���ʂƋ��z���}�C�i�X�t�B�[���h�Ɋi�[����
        DataModule4.CDS_IH001_MTM.FieldByName('mSRYO').AsInteger:=
        DataModule4.CDS_IH001_MTM.FieldByName('MTSRYO').AsInteger;
        DataModule4.CDS_IH001_MTM.FieldByName('mKIN').AsInteger:=
        DataModule4.CDS_IH001_MTM.FieldByName('MTKIN').AsInteger;
      end else
      begin
        // ���׍폜�`�F�b�N���Ȃ��Ƃ��}�C�i�X�t�B�[���h��0�ɂ���
        DataModule4.CDS_IH001_MTM.FieldByName('mSRYO').AsInteger:=0;
        DataModule4.CDS_IH001_MTM.FieldByName('mKIN').AsInteger:=0;
      end;
      cds2.Next;                        // ���R�[�h����i�߂�
    end;
    cds2.First;                         // �ŏ��̃��R�[�h�Ɉړ�
    cds2.EnableControls;                // active��ʑJ�ڍĊJ����

    DataModule4.CDS_IH001_MTM.Post;     // DBCtrlGrid�ɃJ�[�\��in��CDS MTMFLP�m�肳����
   end;
end;

{===============================================================================
�V���[�g�J�b�g F6�@�p�����̍폜��ʂ�F6�L�[�������ɂ���������
===============================================================================}
procedure TIH001.F6Execute(Sender: TObject);
begin

  if Button1.Enabled = false  then exit;// �{�^��1�������Ȃ����͏I������

    Button1.SetFocus;                   // �{�^��1�փt�H�[�J�X�Z�b�g

  if Button1.Focused = true then        // �t�H�[�J�X�Z�b�g�ł�������
     Button1Click(Sender);              // �{�^��1�N���b�N�C�x���g����

end;

{===============================================================================
 �S���҃}�X�^���������i�_�u���N���b�N�C�x���g�j
===============================================================================}
procedure TIH001.EdtTNCDDblClick(Sender: TObject);
Var
  frm : TForm;
begin
  // �ǎ��p���͏I������
  if (Sender as TDBEditUNIC).ReadOnly=true then Exit;

  // �S���Ҍ������쐬
  frm := TIH004MS.Create(Self);
  // �S����CD�����͂���Ă���ΒS��������ʂ�EdtTNCD�e�L�X�g�ɃZ�b�g
  (frm as TIH004MS).EdtTNCD.text:=(Sender as TDBEditUNIC).Text;

  // http://kakinotane.s7.xrea.com/delphi/d2/d034.html �i�ڍׁj
  // �S�������I�����̏���
  if frm.showmodal = mrok then
  begin
    // �I�����A�t�B�[���h�ɒl���Z�b�g  �Ȃ� �v���p�e�BSltTNCD ���g���Ă���H
    (Sender as TDBEditUNIC).Field.AsString :=(frm as TIH004MS).SltTNCD;
    // TAB�L�[�������悤�ɃJ�[�\�������֓������w��
    SendMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
  frm.Release;

end;

{===============================================================================
�\��-���׍��ڐݒ�
===============================================================================}
procedure TIH001.dspDetail;
var
  qry: TFDQuery;
begin
  qry := DataModule4.IH001_MTM;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.Params.Clear;

    qry.SQL.Add('select * from mtmflp');
    qry.SQL.Add(' where mtno=:no ');
    qry.SQL.Add('');
    qry.SQL.Add('order by mtno,mtgno');
    qry.SQL.Add('');

    qry.ParamByName('no').AsInteger:=pNo;
    qry.Open();

  finally

  end;

end;

{===============================================================================
�\��-�w�b�_�[���ڐݒ�
===============================================================================}
procedure TIH001.dspHeader;
var
  qry: TFDQuery;
begin
  Label15.Caption:='';

  qry := DataModule4.IH001_MTH;
  try
    qry.Close;
    qry.SQL.Clear;
    qry.Params.Clear;

    qry.SQL.Add('select * from mthflp');
    qry.SQL.Add(' left join  tnmmsp on mhtncd=tntncd');
    qry.SQL.Add(' where mhno=:no ');
    qry.SQL.Add('');
    qry.SQL.Add('');
    qry.SQL.Add('');

    qry.ParamByName('no').AsInteger:=pNo;
    qry.Open();

  finally

  end;

  if Mode='Cpy' then // Cpy�p�ɂ�����W�J���Ă���
  begin
    try
      DataModule4.FDQryMTHFLP.Close;
      DataModule4.FDQryMTHFLP.SQL.Clear;
      DataModule4.FDQryMTHFLP.Params.Clear;

      DataModule4.FDQryMTHFLP.SQL.Add('select * from mthflp');
      DataModule4.FDQryMTHFLP.SQL.Add(' left join  tnmmsp on mhtncd=tntncd');
      DataModule4.FDQryMTHFLP.SQL.Add(' where mhno=:no ');
      DataModule4.FDQryMTHFLP.SQL.Add('');
      DataModule4.FDQryMTHFLP.SQL.Add('');
      DataModule4.FDQryMTHFLP.SQL.Add('');

      DataModule4.FDQryMTHFLP.ParamByName('no').AsInteger:=pNo;
      DataModule4.FDQryMTHFLP.Open();

    finally

    end;
  end;

end;

{===============================================================================
�X�V���w�b�_�[�ݒ�
===============================================================================}
procedure TIH001.hset();
var
  cds1: TClientDataSet;
begin
  cds1 := DataModule4.CDS_IH001_MTH;
  cds1.Edit;
  //�폜���[�h�̂�D�ōX�V
  //���ύXM�ō폜�f�[�^�����鎖��z��
  //�����̏����ł͕ύXM�ō폜�f�[�^�����Ԃ��
  if PageTopFrm1.EdtMode.Text = '�폜' then
  begin
    cds1.FieldByName('MHJTCD').AsString:='D';
//    mset; // �w�b�_�[���Ŗ��׊m�菈�����邱�Ƃō폜�t���O�I���A���v���ʁA���z��0�ɏ��������Ă���
  end else cds1.FieldByName('MHJTCD').AsString:=''  ;

  cds1.FieldByName('MHGKIN').AsInteger:=EdtMHGKIN.Field.Value;
  cds1.FieldByName('MHGSRO').AsInteger:=EdtMHGSRO.Field.value;
  cds1.Post;

end;

{===============================================================================
�X�V�����אݒ�
===============================================================================}
procedure TIH001.mset();
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  I: Integer;
  count: Integer;
begin
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;
  count := 0; // MTJTCD��'D'�̐����`�F�b�N����


  cds2.DisableControls;
  cds2.first;
  for I := 0 to cds2.RecordCount-1 do
  begin
    cds2.FieldByName('MTNO').AsInteger:=cds1.FieldByName('MHNO').AsInteger;

    // ���ϖ��ׂɃ`�F�b�N������Ƃ��A�������͌��σw�b�_�[���폜��Ԃ̂Ƃ�DBCheckBox�\���𔽉f����
    if (cds2.FieldByName('dataJTCD').AsBoolean) or (cds1.FieldByName('MHJTCD').AsString='D') then
    begin
      cds2.FieldByName('MTJTCD').AsString:='D';
      cds2.FieldByName('dataJTCD').AsBoolean:=true;
    end else
    begin
      cds2.FieldByName('MTJTCD').AsString:='';
      cds2.FieldByName('dataJTCD').AsBoolean:=false;
    end;

    // �ύX���[�h�����ϖ��ׂ�DBCheckBox�����ׂč폜�`�F�b�N�Ȃ�w�b�_�[��'D'�ɂ���
    if PageTopFrm1.EdtMode.Text = '�ύX' then
    begin
      if cds2.FieldByName('MTJTCD').AsString='D' then
        count := count + 1;

      if count = cds2.RecordCount then
      begin
        cds1.Edit;;
        cds1.FieldByName('MHJTCD').AsString:='D';
        cds1.Post;
      end;
    end;


    cds2.Next;
  end;


  cds2.EnableControls;
  cds2.Post;
  // �폜���[�h���A���σw�b�_�[�̍��v����0�A���z0���m�肳���邽�ߍČĂяo��
  if PageTopFrm1.EdtMode.Text = '�폜' then hset;

end;

{===============================================================================
ClientDataSet�̃C�x���g�ɐݒ肷��C�x���g
===============================================================================}
procedure TIH001.AfterInsert(DataSet: TDataSet);
begin
  if DataSet.FieldByName('mtgno').AsInteger=0 then    // �s��0�̂Ƃ�
  begin
    Dataset.Edit;                                     // �ҏW���[�h�J�n
    inc(gnocount);                                    // gncount += 1�Ɠ��`�A�C���N�������g���\�b�h
    DataSet.FieldByName('mtgno').AsInteger:=gnocount; // �s����ݒ肷��
    Dataset.FieldByName('mtno').AsInteger:= DataModule4.IH001_MTH.FieldByName('mhno').AsInteger; // �iAfterScroll�Ńt�B�[���h�l�Ȃ����ē{���邩��ǋL�j
  end;

  Dataset.FieldByName('dataJTCD').AsBoolean:=false;   // data���CD��false������
  Dataset.FieldByName('MTJTCD').AsString:='';         // ���CD�ɋ�

end;

{===============================================================================
ClientDataSet�̃C�x���g�ɐݒ肷��C�x���g
===============================================================================}
procedure TIH001.AfterOpen(DataSet: TDataSet);
begin
  DataSet.Last;                                       // ���R�[�h�Ō���Q��
  if dataset.FieldByName('mtgno').AsInteger<=0 then   // �s����0�ȉ��̂Ƃ�
  begin
    gnocount:=0;                                      // �s��0�ɐݒ�
  end else begin                                      // �s��������Ƃ�
    gnocount:=dataset.FieldByName('mtgno').AsInteger; // �Ō�����R�[�h�̍s�����擾
  end;
  DataSet.First;                                      // ���R�[�h�őO��Q��

end;

{===============================================================================
ClientDataSet�̃C�x���g�ɐݒ肷��C�x���g
===============================================================================}
procedure TIH001.AfterScroll(DataSet: TDataSet);
begin
  Dataset.Edit; // DataSet�ҏW���[�h if FRecordCount = 0 �̂Ƃ� AfterInsert�ֈڍs����
  Dataset.Post; // �����Ńt�B�[���hMTNO�̒l���K�v�ł��G���[���ł�
  Dataset.Edit;

end;

{===============================================================================
ClientDataSet�̃C�x���g�ɐݒ肷��C�x���g
===============================================================================}
procedure TIH001.BeforeScroll(DataSet: TDataSet);
begin
  if PageTopFrm1.EdtMode.Text <> '�ǉ�' then  // Add�����O���R->�X�^�b�N�I�[�o�[�t���[����̂���
  begin
  Dataset.Edit;

  // ���׍폜�`�F�b�N������Ƃ��A�܂��̓w�b�_�[���'D'�̂Ƃ�
  if DataModule4.CDS_IH001_MTM.FieldByName('dataJTCD').AsBoolean=true then
    begin
      // ���ʂƋ��z���}�C�i�X�t�B�[���h�Ɋi�[����
      DataModule4.CDS_IH001_MTM.FieldByName('mSRYO').AsInteger:=
      DataModule4.CDS_IH001_MTM.FieldByName('MTSRYO').AsInteger;
      DataModule4.CDS_IH001_MTM.FieldByName('mKIN').AsInteger:=
      DataModule4.CDS_IH001_MTM.FieldByName('MTKIN').AsInteger;
    end else
    begin
      // ���׍폜�`�F�b�N���Ȃ��Ƃ��}�C�i�X�t�B�[���h��0�ɂ���
      DataModule4.CDS_IH001_MTM.FieldByName('mSRYO').AsInteger:=0;
      DataModule4.CDS_IH001_MTM.FieldByName('mKIN').AsInteger:=0;
    end;

  Dataset.Post;
  Dataset.Edit;
  end;
end;

{===============================================================================
�_���`�F�b�N�@�����F�Ȃ��A�߂�l�FBool
===============================================================================}
function TIH001.LogicalChecOk: Boolean;
var
 I:Integer;
 Delflag:Boolean;
begin

  Result :=False;
  Delflag :=False;

  if mode='Add' then
    //EdtTNCD.Color := clWindow;

  if mode='Del' then
  begin

    //���Ӑ悪��������폜�֎~
{    with DataModule3.FDQryGene do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT TOTKCD FROM TOKMSP WHERE TOTNCD=:TNCD AND TOJTCD='''' ');
      ParamByName('TNCD').AsString:=EdtTNCD.Field.AsString;
      Open;
      if not IsEmpty then
      begin
        MessageDlg('�R�Â����Ӑ�(CD:'+FieldByName('TOTKCD').AsString+'�Ȃ�)�����邽�ߍ폜�ł��܂���', mtError, [mbOK], 0);
        Exit;
      end;
    end;
}
    Result:=true;
    exit;
  end;



  ChkBlank(EdtMHNO,'���χ�');

  //�ǉ����[�h�̏ꍇ���χ��d���`�F�b�N���s���B
  if (mode='Add') or (mode='Cpy') then
  begin
    if DataModule4.MTHMS(EdtMHNO.Field.AsString,true).Exists=true then
    begin
      MessageDlg('���χ����d�����Ă��܂��B', mtError, [mbOk], 0);
      EdtMHNO.SetFocus;
      EdtMHNO.Color := clERR;
      Exit;
    end;
  end;

  ChkBlank(EdtMHIRDT,'���ψ˗���');

  ChkBlank(EdtMHKGDT,'���ϊ���');

  // ���ψ˗��������ϊ����`�F�b�N
  if EdtMHIRDT.Field.AsDateTime > EdtMHKGDT.Field.AsDateTime then
  begin
    MessageDlg('���ϊ��������ψ˗������O�ɂȂ��Ă��܂��B', mtError, [mbOk], 0);
    EdtMHKGDT.SetFocus;
    EdtMHKGDT.Color := clERR;
    Exit;
  end;

  ChkBlank(EdtMHTKCD,'���Ӑ�CD');

  ChkBlank(EdtMHTNCD,'�S����CD');

  // ��̍s�폜����
  // DBCheckbox�̐ݒ�
  DataModule4.CDS_IH001_MTM.DisableControls;               // ��ʂ�����h�~
  DataModule4.CDS_IH001_MTM.First;                         // �ŏ��̃��R�[�h�Ɉړ�
  for I := 0 to DataModule4.CDS_IH001_MTM.RecordCount-1 do // cds2�S���R�[�h�̋󔒃`�F�b�N
  begin                                                    // ���iCD���i���A���v���z�A���l���󔒂Ȃ�s�폜
    if (DataModule4.CDS_IH001_MTM.FieldByName('MTSHCD').AsString='') AND
       (DataModule4.CDS_IH001_MTM.FieldByName('MTSHNM').AsString='') AND
       ((DataModule4.CDS_IH001_MTM.FieldByName('MTKIN').AsString='0') OR
       (DataModule4.CDS_IH001_MTM.FieldByName('MTKIN').AsString=''))  AND
       (DataModule4.CDS_IH001_MTM.FieldByName('MTBIKO').AsString='') then
       begin
         DataModule4.CDS_IH001_MTM.EnableControls;         // �폜�_�C�A���O�\���ŉ�ʑJ�ڍĊJ����
         if MessageDlg('�s�ԍ�'+EdtMTGNO.Field.AsString+'���폜���܂��B��낵���ł����H',
            mtConfirmation, [mbYes,mbNo], 0) = mrYes then
            DBCtrlGrid1.DataSource.DataSet.Delete;         // �s�폜�ł���
            DataModule4.CDS_IH001_MTM.DisableControls;     // �폜�_�C�A���O���ʂ�����h�~����
       end;

    DataModule4.CDS_IH001_MTM.Next;                        // ���R�[�h����i�߂�
  end;
  DataModule4.CDS_IH001_MTM.First;                         // �ŏ��̃��R�[�h�Ɉړ�

  // ���ύs�ԍ�������Ă��ꍇ���R�[�h�ԍ��ƍ��킹��
  for I := 0 to DataModule4.CDS_IH001_MTM.RecordCount-1 do // cds2�S���R�[�h�̋󔒃`�F�b�N
  begin // ���ύs�ԍ��ƃ��R�[�h�C���f�b�N�X+1������Ȃ����
    if DataModule4.CDS_IH001_MTM.FieldByName('MTGNO').AsInteger<>I+1 then
        DataModule4.CDS_IH001_MTM.FieldByName('MTGNO').AsInteger:=I+1; // �s�ԍ��ƃ��R�[�h�C���f�b�N�X+1���i�[
    DataModule4.CDS_IH001_MTM.Next;                        // ���R�[�h����i�߂�
  end;

  DataModule4.CDS_IH001_MTM.First;                         // �ŏ��̃��R�[�h�Ɉړ�
  DataModule4.CDS_IH001_MTM.EnableControls;                // active��ʑJ�ڍĊJ����
// �s�폜��ɍs�ǉ�����ƃ��R�[�h�Ō�+1�ōs�ԍ��𐶐����邽�ߔԍ������ł��܂��B�d�l�ł����̂��H

  ChkBlank(EdtMTSHCD,'���iCD');

  Result :=True;

end;

{*******************************************************************************
 �ړI:�����ݒ�    (�ǉ����[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH001.InzAddMode;
begin
  inherited;

  ChkDel1.Enabled:=false;            // �ǉ����[�h���͍폜Box�ɐG�点�Ȃ�
end;

{*******************************************************************************
 �ړI:�����ݒ�   (�ύX���[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH001.InzChgMode;
begin
  inherited;
//  EdtMode.Text := '�ύX';          // �p�����Ƃł���Ă�
  pNo:=DataModule4.CDS_IH002.FieldByName('mhno').Asinteger;

  ChgReadOnly(EdtMHNO,true);         // TNCD��Ǎ���p�ɂ��邩�̔��ʏ���

end;

{*******************************************************************************
 �ړI:�����ݒ�   (copy���[�h�̐ݒ�) 2�p�ӂ���CDS����l���R�s�[����
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH001.InzCpyMode;
begin
  inherited;
  pNo:=DataModule4.CDS_IH002.FieldByName('mhno').Asinteger;
  DataModule4.CDS_IH001_MTH.Open;       // CDS_IH001_MTH�W�J �R�s�[�p
  DataModule4.ClientDataSetMTHFLP.Open; // CDSMTHFLP�W�J     �R�s�[�p

  DataModule4.CDS_IH001_MTH.Insert; // �}�����[�h����CDS_IH001_MTH�w�b�_�[�l�������������̂�

  // �w�b�_�[�t�B�[���h��ClientDataSetMTHFLP�l���i�[����
  DataModule4.CDS_IH001_MTH.FieldByName('MHIRDT').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHIRDT').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHKGDT').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHKGDT').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHTKCD').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHTKCD').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHTKNM').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHTKNM').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHTNCD').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHTNCD').AsString;
  DataModule4.CDS_IH001_MTH.FieldByName('MHBIKO').AsString:=DataModule4.ClientDataSetMTHFLP.FieldByName('MHBIKO').AsString;

  DataModule4.ClientDataSetMTHFLP.Close; // CDSMTHFLP���Ƃ���

end;

{*******************************************************************************
 �ړI:�����ݒ�   (�폜���[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH001.InzDelMode;
begin
  inherited;

  pNo:=DataModule4.CDS_IH002.FieldByName('mhno').Asinteger;

end;

{*******************************************************************************
 �ړI:�����ݒ�   (�Ɖ�[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH001.InzDspMode;
var
  compo: TObject;
  I: Integer;
  x1: Integer;
  x2: Integer;
begin
  inherited;
//  EdtMode.Text := '�Ɖ�';                                  // �p�����ł���Ă�
//  Button1.Enabled:=false;                                  // �������͒ǉ��{�^�������b�N
//  Button2.Enabled:=false;                                  // �������͍X�V�{�^�������b�N

  pNo:=DataModule4.CDS_IH002.FieldByName('mhno').Asinteger;  // pNo�l��DM4��������Ă���


//  ChgReadOnly(EdtMHNO,true);             // �e�R���|�[�l���g��ǎ��p�ɂ���p�^�[��
//  ChgReadOnly(EdtMHIRDT,true);           // �L�q�ʂ����[�Ȃ��Ȃ�
//  ChgReadOnly(EdtMHKGDT,true);
//  ChgReadOnly(EdtMHTKCD,true);
//  ChgReadOnly(EdtMHTKNM,true);
//  ChgReadOnly(EdtMHTNCD,true);
//  ChgReadOnly(EdtMHBIKO,true);
//  ChgReadOnly(EdtMTSHCD,true);
//  ChgReadOnly(EdtMTSHNM,true);
//  ChgReadOnly(EdtMTTNKA,true);
//  ChgReadOnly(EdtMTSRYO,true);
//  ChgReadOnly(EdtMTKIN,true);
//  ChgReadOnly(EdtMTBIKO,true);
//  ChkDel1.Enabled:=false;
//  ChgReadOnly(EdtMHGSRO,true);
//  ChgReadOnly(EdtMHGKIN,true);

{    x1:= ComponentCount;                  // ��̏������܂Ƃ߂����̂��ȉ�
    for I := 0 to x1-1 do                  // �R���|�[�l���g�̐��J�Ԃ�����
    begin
      compo := Components[I];              // �R���|�[�l���g��index[0]����i�[����
      if compo is TDBEditUnic then         // �R���|�[�l���g��TEditUnic�̂Ƃ�
//        TDBEdit(compo).ReadOnly:=true;   // ReadOnly���I���ɂ���A�t�H�[���̐F�͕ς��Ȃ�
         ChgReadOnly(compo,true);          // ChgReadOnly���\�b�h�𗘗p���Ă�OK
      if compo is TDBCheckBox then         // �R���|�[�l���g��TDBCheckBox�̂Ƃ�
        TDBCheckBox(compo).ReadOnly:=true; // ReadOnly���I���ɂ���
    end;                                   // Enabledfalse�ɂ���ɂ͕s�����ȃ��W�b�N
}
//    ActionList1[1].Enabled:=false;       // �t�@���N�V�����L�[�X�V�iF6�j�̖���
                                           // ActionList�C���f�b�N�X�̓��X�g���я��ʂ�

//    panel1.Enabled:=false;               // �����ł̓p�l���P�ʂ�Enabledfalse���Ă���
//    panel2.Enabled:=false;               // �V���v���ł��񂽂�
//    F0002Frm.FldChange(Panel1);          // ���̓t�H�[���̐F���ꊇ�ύX���Ă���
//    F0002Frm.FldChange(Panel2);
end;

{===============================================================================
�f�[�^�x�[�X�ւ̕ύX�i�ǉ����[�h�j
===============================================================================}
procedure TIH001.DbAdd;
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  con: TFDConnection;
begin
  inherited;
  con:= UtilYbs.dmUtilYbs.FDConnection1;
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;

  hset;                   // �w�b�_�[���ڃZ�b�g
  mset;                   // ���׍��ڃZ�b�g

  try
    con.StartTransaction; // �ύX�g�����U�N�V�����J�n�i�K���R�~�b�g�����[���o�b�N���邱�Ɓj

    cds1.ApplyUpdates(0); // �f�[�^�X�V
    cds2.ApplyUpdates(0); // ���L�̕��@�ł������͈ꏏ�H

    //�f�[�^�x�[�X�X�V
//    if ApplyUpdates(0) >  0 then             //�G���[�̏ꍇ�͒��f
//    begin
//      Abort;
//    end;

    con.Commit;           //�R�~�b�g
    MessageDlg('�V�K�o�^���������܂����i�E�ցE�j',mtInformation, [mbOK], 0); //�X�V�m�F�_�C�A���O

    except
    on e:Exception do     // ��O����
    begin
      con.Rollback;       // �G���[���̓��[���o�b�N
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
    end;

  end; // try�����܂�

   Close;                  // ��ʏI��

end;

{===============================================================================
�f�[�^�x�[�X�ւ̕ύX�i�ύX���[�h�j
===============================================================================}
procedure TIH001.DbChenge;
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  con: TFDConnection;
begin
  inherited;
  con:= UtilYbs.dmUtilYbs.FDConnection1;
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;

  hset;                   // �w�b�_�[���ڃZ�b�g
  mset;                   // ���׍��ڃZ�b�g

  try
    con.StartTransaction; // �ύX�g�����U�N�V�����J�n�i�K���R�~�b�g�����[���o�b�N���邱�Ɓj

//    cds1.ApplyUpdates(0); // ���Ƃǂ���̏������ł�����
//    cds2.ApplyUpdates(0);

    //�f�[�^�x�[�X�X�V
    if cds1.ApplyUpdates(0) >  0 then
    begin
      Abort;              // �G���[�̏ꍇ�͒��f
    end;

    if cds2.ApplyUpdates(0) >  0 then
    begin
      Abort;              // �G���[�̏ꍇ�͒��f
    end;

    con.Commit;           // �R�~�b�g
    MessageDlg('�ύX���������܂����i^��^�j',mtInformation, [mbOK], 0); //�X�V�m�F�_�C�A���O

    except
    on e:Exception do     // ��O����
    begin
      con.Rollback;       // �G���[���̓��[���o�b�N
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
    end;

  end;

  Close;                  // ��ʏI��

end;


{===============================================================================
�f�[�^�x�[�X�ւ̕ύX�i�폜���[�h�j
===============================================================================}
procedure TIH001.DbDelete;
var
  cds1: TClientDataSet;
  cds2: TClientDataSet;
  con: TFDConnection;
begin
  inherited;
  con:= UtilYbs.dmUtilYbs.FDConnection1;
  cds1 := DataModule4.CDS_IH001_MTH;
  cds2 := DataModule4.CDS_IH001_MTM;

  hset;                   // �w�b�_�[���ڃZ�b�g
  mset;                   // ���׍��ڃZ�b�g

  try
    con.StartTransaction; // �ύX�g�����U�N�V�����J�n�i�K���R�~�b�g�����[���o�b�N���邱�Ɓj
    //�폜

    //�f�[�^�x�[�X�X�V
    if cds1.ApplyUpdates(0) >  0 then              //�G���[�̏ꍇ�͒��f
    begin
      Abort;              // �G���[�̏ꍇ�͒��f
    end;

    if cds2.ApplyUpdates(0) >  0 then
    begin
      Abort;              // �G���[�̏ꍇ�͒��f
    end;

    con.Commit;           // �R�~�b�g
    MessageDlg('�폜���������܂����i��o���j',mtInformation, [mbOK], 0); //�X�V�m�F�_�C�A���O

    except
    on e:Exception do     // ��O����
    begin
      con.Rollback;       // ���[���o�b�N
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
    end;

  end;

  Close;                  // ��ʏI��

end;

end.
