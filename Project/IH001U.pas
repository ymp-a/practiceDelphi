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
    procedure FormShow(Sender: TObject);         // ��ʕ\���̏���
    procedure FormClose(Sender: TObject; var Action: TCloseAction); // ��ʏI���̏���
    procedure Button3Click(Sender: TObject);     // �ǉ��{�^��
    procedure EdtMHTNCDExit(Sender: TObject);    // �S���Җ������}��
    procedure EdtMTTNKAExit(Sender: TObject);    // �P���~���ʏ���
    procedure EdtMTSRYOExit(Sender: TObject);    // �P���~���ʏ���
    procedure DBCtrlGrid1Exit(Sender: TObject);  // DBCtrlGrid1����J�[�\��out����
    procedure DBCtrlGrid1Enter(Sender: TObject); // DBCtrlGrid1�ɃJ�[�\��in�̏���
    procedure F6Execute(Sender: TObject);        // F6��������
  private
    { Private �錾 }
    gnocount:integer;                            // �s��

    procedure dspHeader;                         // �\��-�w�b�_�[���ڐݒ�
    procedure dspDetail;                         // �\��-���׍��ڐݒ�

    procedure hset();                            // �X�V���w�b�_�[�ݒ�
    procedure mset();                            // �X�V�����אݒ�

    //ClientDataSet�̃C�x���g�ɐݒ肷��C�x���g
    procedure AfterOpen(DataSet: TDataSet);      // CDSOpen����̏���
    procedure AfterInsert(DataSet: TDataSet);    // �s���ݒ��}������
    procedure AfterScroll(DataSet: TDataSet);    // DataSet�ҏW�m��ҏW���[�h�ؑ�


    procedure InzAddMode;override;               // �����ݒ�i�ǉ����[�h�j
    procedure InzChgMode;override;               // �����ݒ�i�ύX���[�h�j
//    procedure InzCpyMode;override;               // �����ݒ�iCopy���[�h�j
    procedure InzDelMode;override;               // �����ݒ�i�폜���[�h�j
    procedure InzDspMode;override;               // �����ݒ�i�\�����[�h�j
    procedure DbAdd;override;                    // �f�[�^�x�[�X�ւ̕ύX�i�ǉ����[�h�j
    procedure DbChenge;override;                 // �f�[�^�x�[�X�ւ̕ύX�i�ύX���[�h�j
    procedure DbDelete;override;                 // �f�[�^�x�[�X�ւ̕ύX�i�폜���[�h)
    function  LogicalChecOk:Boolean;override;    // �_���`�F�b�N


  public
    { Public �錾 }
  var
    Mode : String;                               // ���[�h���ʗp
    pNo : integer;                               // ���χ�
    pMode:integer;                               // ���[�h

  end;

var
  IH001: TIH001;

implementation

{$R *.dfm}

uses DM4, DM3, functions, MN001C, Utilybs, F0002;

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
  DataModule4.ClientDataSetMTMFLP.AfterOpen:=AfterOpen;     // CDS�֊e�C�x���g���Z�b�g����
  DataModule4.ClientDataSetMTMFLP.AfterInsert:=AfterInsert;
  DataModule4.ClientDataSetMTMFLP.AfterScroll:=AfterScroll;

  dspHeader;                                                // �\��-�w�b�_�[���ڐݒ�
  dspDetail;                                                // �\��-���׍��ڐݒ�
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;
  cds1.Open;                                                // CDSMTHFLP�I�[�v��
  cds2.Open;                                                // CDSMTMFLP�I�[�v��

  cds1.Edit;                                                // �ҏW���[�h
  cds2.Edit;                                                // �ҏW���[�h

{
  //�V�K
  if pMode=1 then
  begin
//    cds2.Append;
//    DBText1.Field.AsInteger:=1;
//    cds2.Post;
  end;

  //�ύX
  if pMode=2 then
  begin
    DBEdit1.Enabled:=false;
    DBEdit11Exit(DBEdit11);
  end;

  //�폜
  if pMode=3 then
  begin
    DBEdit1.Enabled:=false;
    Button1.Enabled:=false;
    x1:= ComponentCount;

    for I := 0 to x1-1 do
    begin
      compo := Components[I];
      if compo is TDBEdit then
        TDBEdit(compo).ReadOnly:=true;
      if compo is TDBCheckBox then
        TDBCheckBox(compo).ReadOnly:=true;
    end;

    DBEdit11Exit(DBEdit11);
  end;

  //�Ɖ�
  if pMode=4 then
  begin
    DBEdit1.Enabled:=false;
    Button1.Enabled:=false;
    button2.Enabled:=false;
    x1:= ComponentCount;

    for I := 0 to x1-1 do
    begin
      compo := Components[I];
      if compo is TDBEdit then
        TDBEdit(compo).ReadOnly:=true;
      if compo is TDBCheckBox then
        TDBCheckBox(compo).ReadOnly:=true;
    end;


    DBEdit11Exit(DBEdit11);
  end;
 }

  //DBCheckbox�̐ݒ�
  cds2.DisableControls;               // ��ʂ�����h�~
  cds2.First;                         // �ŏ��̃��R�[�h�Ɉړ�
  for I := 0 to cds2.RecordCount-1 do // cds2�S���R�[�h��'D'�`�F�b�N
  begin                               // 'D'�̃w�b�_�[���R�[�h�ɂ�dataJTCD�I��
    if cds2.FieldByName('MTJTCD').AsString='D' then
      cds2.FieldByName('dataJTCD').AsBoolean:=true
    else  cds2.FieldByName('dataJTCD').AsBoolean:=false ;

    cds2.Next;                        // ���R�[�h����i�߂�
  end;
  cds2.First;                         // �ŏ��̃��R�[�h�Ɉړ�
  cds2.EnableControls;                // active��ʑJ�ڍĊJ����

end;

{===============================================================================
��ʏI����ɐݒ肷��C�x���g
===============================================================================}
procedure TIH001.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    // ��\���`�F�b�N
  if (Button2.Enabled=false)or(Button2.Visible=false) then abort;

//  Close;              // ��ʏI��

  with DataModule4 do // �g�p����CDS��Qry���I��
  begin
    ClientDataSetMTHFLP.Close;
    ClientDataSetMTMFLP.Close;
    FDQryMTHFLP.Close;
    FDQryMTMFLP.Close;
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
    DBCtrlGrid1.DataSource.DataSet.Append;
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
  qry.ParamByName('cd').AsInteger:= EdtMHTNCD.Field.AsInteger;
  qry.Open();

  if qry.IsEmpty then EdtMHTNCD.Field.AsString := '';  // �L����TNCD�ȊO�Ȃ���̓t�H�[�����N���A

  Label15.Caption:=qry.FieldByName('TNNAME').AsString; // �S���Җ���}��
  qry.close;

end;

{===============================================================================
�P��Exit���̃C�x���g
===============================================================================}
procedure TIH001.EdtMTTNKAExit(Sender: TObject);
begin
  DBCtrlGrid1.DataSource.DataSet.Edit;
  EdtMTKIN.Field.AsInteger:=EdtMTTNKA.Field.AsInteger*EdtMTSRYO.Field.AsInteger;

end;

{===============================================================================
�P��Exit���̃C�x���g
===============================================================================}
procedure TIH001.EdtMTSRYOExit(Sender: TObject);
begin
  DBCtrlGrid1.DataSource.DataSet.Edit;
  EdtMTKIN.Field.AsInteger:=EdtMTTNKA.Field.AsInteger*EdtMTSRYO.Field.AsInteger;

end;

{===============================================================================
DBCtrlGrid�C�x���g
===============================================================================}
procedure TIH001.DBCtrlGrid1Enter(Sender: TObject);
begin
  DataModule4.ClientDataSetMTMFLP.Edit;   // DBCtrlGrid�ɃJ�[�\��in��CDS MTMFLP�ҏW���[�h
end;

{===============================================================================
DBCtrlGrid�C�x���g
===============================================================================}
procedure TIH001.DBCtrlGrid1Exit(Sender: TObject);
begin
  if DataModule4.ClientDataSetMTMFLP.State=dsEdit then
    DataModule4.ClientDataSetMTMFLP.Post; // DBCtrlGrid�ɃJ�[�\��in��CDS MTMFLP�m�肳����
end;

//�V���[�g�J�b�g F6
procedure TIH001.F6Execute(Sender: TObject);
begin

  if Button1.Enabled = false  then exit;//�{�^�������Ȃ����͏������Ȃ�

  Button1.SetFocus;

  if Button1.Focused = true then
     Button1Click(Sender);

end;

{===============================================================================
�\��-���׍��ڐݒ�
===============================================================================}
procedure TIH001.dspDetail;
var
  qry: TFDQuery;
begin
  qry := DataModule4.FDQryMTMFLP;
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

  qry := DataModule4.FDQryMTHFLP;
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

end;

{===============================================================================
�X�V���w�b�_�[�ݒ�
===============================================================================}
procedure TIH001.hset();
var
  cds1: TClientDataSet;
begin
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds1.Edit;
  //�폜���[�h�̂�D�ōX�V
  //���ύXM�ō폜�f�[�^�����鎖��z��
  //�����̏����ł͕ύXM�ō폜�f�[�^�����Ԃ��
  if Mode = 'Del' then
    cds1.FieldByName('MHJTCD').AsString:='D'
  else cds1.FieldByName('MHJTCD').AsString:=''  ;

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
begin
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;

  cds2.DisableControls;
  cds2.first;
  for I := 0 to cds2.RecordCount-1 do
  begin
    cds2.FieldByName('MTNO').AsInteger:=cds1.FieldByName('MHNO').AsInteger;

    if cds2.FieldByName('dataJTCD').AsBoolean then
      cds2.FieldByName('MTJTCD').AsString:='D'
    else cds2.FieldByName('MTJTCD').AsString:=''  ;


    cds2.Next;
  end;


  cds2.EnableControls;
  cds2.Post;
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
    Dataset.FieldByName('mtno').AsInteger:= DataModule4.FDQryMTHFLP.FieldByName('mhno').AsInteger; // �iAfterScroll�Ńt�B�[���h�l�Ȃ����ē{���邩��ǋL�j
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
�_���`�F�b�N�@�����F�Ȃ��A�߂�l�FBool
===============================================================================}
function TIH001.LogicalChecOk: Boolean;
begin

  Result :=False;

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
  if (mode='Add') then
  begin
    if DataModule3.TNMMS(EdtMHTNCD.Field.AsString,true).Exists=true then
    begin
      MessageDlg('���χ����d�����Ă��܂��B', mtError, [mbOk], 0);
      EdtMHNO.SetFocus;
      EdtMHNO.Color := clERR;
      Exit;
    end;
  end;

  ChkBlank(EdtMHIRDT,'���ψ˗���');

  ChkBlank(EdtMHKGDT,'���ϊ���');

  ChkBlank(EdtMHTKCD,'���Ӑ�CD');

  ChkBlank(EdtMHTNCD,'�S����CD');

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
//  EdtMode.Text := '�ǉ�';
  Label15.Caption:='';    // �S���Җ����u�����N�ɏ�����

 //�r������
 //     �ǉ����[�h�Ń��b�N�t�@�C���̃��R�[�h���P���쐬����B
 //     �J��Ԃ����͂Ȃǂ�����̂ō쐬�͂P��̂�

//  if bFiest then
//  begin
//    bFiest:=False;
//     //�r������p��Form���J���������擾
//    sOpenDATE:=dmUtilYbs.GetStmDate;
//    SOpenTime:=dmUtilYbs.GetStmTime;
//
//  end;

  FormShow(self);

end;

{*******************************************************************************
 �ړI:�����ݒ�   (�ύX���[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH001.InzChgMode;
begin
  inherited;
//  EdtMode.Text := '�ύX';
  pNo:=DataModule4.FDQryF0004.FieldByName('mhno').Asinteger;
  dspHeader;                         // �\��-�w�b�_�[���ڐݒ�
  dspDetail;                         // �\��-���׍��ڐݒ�

  ChgReadOnly(EdtMHNO,true);         // TNCD��Ǎ���p�ɂ��邩�̔��ʏ���
end;

{*******************************************************************************
 �ړI:�����ݒ�   (�폜���[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH001.InzDelMode;
begin
  inherited;
//  EdtMode.Text := '�폜';
  Button1.Enabled:=false;//�������͒ǉ��{�^�����b�N
  pNo:=DataModule4.FDQryF0004.FieldByName('mhno').Asinteger;
  dspHeader;                         // �\��-�w�b�_�[���ڐݒ�
  dspDetail;                         // �\��-���׍��ڐݒ�

//  ChgReadOnly(EdtMHNO,true);         // TNCD��Ǎ���p�ɂ��邩�̔��ʏ���
//  ChgReadOnly(EdtMHIRDT,true);       // ChgReadOnly���\�b�h��ReadOnly:=False;
//  ChgReadOnly(EdtMHKGDT,true);       // Color:=clWindow;
//  ChgReadOnly(EdtMHTKCD,true);       // TabStop:=True;���s���Ă���
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

    panel1.Enabled:=false;                 // �����ł͂Ƀp�l���P�ʂ�Enabledfalse���Ă���
    panel2.Enabled:=false;                 // �V���v���ł��񂽂�
    F0002Frm.FldChange(Panel1);            // ���̓t�H�[���̐F���ꊇ�ύX���Ă���
    F0002Frm.FldChange(Panel2);

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
//  EdtMode.Text := '�Ɖ�';
//  Button1.Enabled:=false;                                    // �������͒ǉ��{�^�������b�N
//  Button2.Enabled:=false;                                    // �������͍X�V�{�^�������b�N

  pNo:=DataModule4.FDQryF0004.FieldByName('mhno').Asinteger; // pNo�l��DM4��������Ă���
  dspHeader;                                                 // �\��-�w�b�_�[���ڐݒ�
  dspDetail;                                                 // �\��-���׍��ڐݒ�

//  ChgReadOnly(EdtMHNO,true);
//  ChgReadOnly(EdtMHIRDT,true);
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

{    x1:= ComponentCount;                   // ��̃R�����g�A�E�g���ЂƂ܂Ƃ߂����̂��ȉ�
    for I := 0 to x1-1 do                  // �R���|�[�l���g�̐��J��Ԃ�����
    begin
      compo := Components[I];              // �R���|�[�l���g��index[0]����i�[����
      if compo is TDBEditUnic then         // �R���|�[�l���g��TEditUnic�̂Ƃ�
//        TDBEdit(compo).ReadOnly:=true;     // ReadOnly���I���ɂ���A�t�H�[���̐F�͕ς��Ȃ�
         ChgReadOnly(compo,true);          // ChgReadOnly���\�b�h�𗘗p���Ă�OK
      if compo is TDBCheckBox then         // �R���|�[�l���g��TDBCheckBox�̂Ƃ�
        TDBCheckBox(compo).ReadOnly:=true; // ReadOnly���I���ɂ���
    end;                                   // Enabledfalse�ɂ���ɂ͕s�����ȃ��W�b�N
}
//    ActionList1[1].Enabled:=false;         // �t�@���N�V�����L�[�X�V�iF6�j�̖���
                                           // ActionList�C���f�b�N�X�̓��X�g���я��ʂ�

//    panel1.Enabled:=false;                 // �����ł͂Ƀp�l���P�ʂ�Enabledfalse���Ă���
//    panel2.Enabled:=false;                 // �V���v���ł��񂽂�
//    F0002Frm.FldChange(Panel1);            // ���̓t�H�[���̐F���ꊇ�ύX���Ă���
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
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;

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
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;

  hset;                   // �w�b�_�[���ڃZ�b�g
  mset;                   // ���׍��ڃZ�b�g

  try
    con.StartTransaction; // �ύX�g�����U�N�V�����J�n�i�K���R�~�b�g�����[���o�b�N���邱�Ɓj

//    cds1.ApplyUpdates(0);
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
  cds1 := DataModule4.ClientDataSetMTHFLP;
  cds2 := DataModule4.ClientDataSetMTMFLP;

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