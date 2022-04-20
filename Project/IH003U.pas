unit IH003U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EdtMaster, System.Actions, Vcl.ActnList,
  PageTop, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  DBEditUNIC, FireDAC.Comp.Client, Data.DB, DBClient;

type
  TIH003 = class(TEdtMasterFrm)
    Label1: TLabel;
    EdtTNCD: TDBEditUNIC;
    Label2: TLabel;
    EdtNAME: TDBEditUNIC;
    Label3: TLabel;
    EdtPass: TEdit;
    Label4: TLabel;
    CmbKGNM: TComboBox;
    Label5: TLabel;
    chkSTKB: TCheckBox;
    EdtKGKB: TDBEditUNIC;
    procedure FormShow(Sender: TObject);         // ��ʕ\���̏���
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private �錾 }
    procedure tset();                            // �X�V���w�b�_�[�ݒ�
    procedure InzAddMode;override;               // �����ݒ�i�ǉ����[�h�j
    procedure InzChgMode;override;               // �����ݒ�i�ύX���[�h�j
    function  GetDecPass: string;                // �����p
    procedure DbAdd;override;                    // �f�[�^�x�[�X�ւ̕ύX�i�ǉ����[�h�j
    procedure DbChenge;override;                 // �f�[�^�x�[�X�ւ̕ύX�i�ύX���[�h�j
    function  LogicalChecOk:Boolean;override;    // �_���`�F�b�N
    procedure SetEncPass;                        // �p�X���[�h�̕ۑ�

  public
    { Public �錾 }
  end;

var
  IH003: TIH003;

implementation

{$R *.dfm}

uses DM2, Utilybs, functions;

{===============================================================================
��ʓW�J��ɐݒ肷��C�x���g
===============================================================================}
procedure TIH003.FormShow(Sender: TObject);
begin
  if PageTopFrm1.EdtMode.Text<> '�ǉ�' then
  // �ҏW�p�ɐV�����N���C�A���g�f�[�^�Z�b�g���J��
  with DataModule2 do
  begin
    try
      CDS_IH003.Active := False; // CDS�����

      with FDQryIH003 do
      begin
        close;                   // SQL��������
        SQL.Clear;               // SQL������
        // SQL���J�n��
        SQL.Add(' select * , CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS');
        SQL.Add(' from TNMMSP where TNTNCD = :TNTNCD ');
        // DBGrid1�őI�𒆂̒S����CD��������
        ParamByName('TNTNCD').AsAnsiString := DataModule2.CDS_IH004.FieldByName('TNTNCD').AsString;

        Open;                    // FDQueryLogin2��W�J����

        if IsEmpty then          // FDQueryLogin2�Ƀf�[�^���Ȃ��ꍇ�̏���
        begin                               // ��O�G���[���b�Z�[�W���쐬
          raise Exception.Create('���ɍ폜����Ă���');
        end;
      end;

      CDS_IH003.Active := True;    // CDS���J��
      CDS_IH003.Edit;              // CDS�ҏW���[�h

      // ����
      if StrToIntDef(EdtKGKB.TEXT,-1)-1>=0 then
      begin
        case StrToIntDef(EdtKGKB.TEXT,0) of
          1: CmbKGNM.ItemIndex:=0;        // ���
          2: CmbKGNM.ItemIndex:=1;        // �Ɩ��Ǘ���
          5: CmbKGNM.ItemIndex:=2;        // �V�X�e���Ǘ���
        end;
      end;

      EdtPASS.Text:= GetDecPass;          // �p�X���[�h�̏����i������̕���PASS�������Ă���j

      // ������\���i��Ԃ�D�̎��̓`�F�b�N����j
      if DataModule2.CDS_IH003.FieldByName('TNSTKB').Asstring='D' then
        chkSTKB.Checked:=true
      else
        chkSTKB.Checked:=false;

      except on e:Exception do            // ��O����
      begin
        MessageDlg(E.Message, mtError, [mbOK], 0);
        self.close;
        abort;
      end;

    end; // try�����܂�


  end; // with�����܂�
end;

procedure TIH003.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DataModule2 do // �S���҃}�X�^�Ŏg�p����DM�̏I��
  begin
    FDQryGene.Close;
    FDQryIH003.Close;
    CDS_IH003.Close;
  end;
end;

{*******************************************************************************
 �ړI:�����ݒ�    (�ǉ����[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH003.InzAddMode;
begin
  inherited;
    with DataModule2 do
    begin
      // �ҏW�p��1���R�[�h�ǉ����Ă���
      CDS_IH003.Close;              // CDS�I��
      FDQryIH003.Close;                      // Qry�I��
      FDQryIH003.SQL.Clear;                  // SQL������
      FDQryIH003.SQL.add(' SELECT TOP 1 * ');
      FDQryIH003.SQL.add(' FROM TNMMSP ');   // �擪��1���R�[�h�𒊏o

      CDS_IH003.Open;               // CDS�J�n
      CDS_IH003.EmptyDataSet;       // CDS���o���R�[�h����ɂ���
      CDS_IH003.Append;             // CDS�ǉ����[�h �Ō�̍s��+1���Ă�C���[�W
      try
        InitDataSet(CDS_IH003);     // detaset�̏������A0��NULL�ȂǓK�؂ȋ�̕\�L�ɂ��Ă���
      except
      end;
    end;
end;

{*******************************************************************************
 �ړI:�����ݒ�   (�ύX���[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH003.InzChgMode;
begin
  inherited;
//  pNo:=DataModule2.CDS_IH002.FieldByName('mhno').Asinteger;

//  ChgReadOnly(EdtMHNO,true);         // TNCD��Ǎ���p�ɂ��邩�̔��ʏ���

end;

{===============================================================================
�p�X���[�h�����p
===============================================================================}
function TIH003.GetDecPass: string;
begin
  result:='';

  with DataModule2.FDQryGene do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS ');
    SQL.Add('   FROM TNMMSP WHERE TNTNCD = :TNCD ');
    ParamByName('TNCD').AsString:=DataModule2.CDS_IH004.FieldByName('TNTNCD').AsString;
    Open;

    if IsEmpty=false then
    begin
      result:=FieldByName('PASS').AsString;
    end;
    Close;
    SQL.Clear;

  end;

end;

{===============================================================================
�f�[�^�x�[�X�ւ̕ύX�i�ǉ����[�h�j
===============================================================================}
procedure TIH003.DbAdd;
var
  cds1: TClientDataSet;
  con: TFDConnection;
begin
  inherited;
  con:= UtilYbs.dmUtilYbs.FDConnection1;
  cds1 := DataModule2.CDS_IH003;


  tset;                   // ���ڃZ�b�g

  try
    con.StartTransaction; // �ύX�g�����U�N�V�����J�n�i�K���R�~�b�g�����[���o�b�N���邱�Ɓj

    cds1.ApplyUpdates(0); // �f�[�^�X�V


    //�f�[�^�x�[�X�X�V
//    if ApplyUpdates(0) >  0 then             //�G���[�̏ꍇ�͒��f
//    begin
//      Abort;
//    end;
    SetEncPass;           // �Í���
    con.Commit;           // �R�~�b�g
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
procedure TIH003.DbChenge;
begin
  inherited;

  with  DataModule2.CDS_IH003 do                    // ����LiteVer�̕ύX���[�h
  begin
    // �ύX�g�����U�N�V�����J�n�i�K���R�~�b�g�����[���o�b�N���邱�Ɓj
    dmUtilYbs.FDConnection1.StartTransaction;
    try

      // ����
      case CmbKGNM.ItemIndex of
        0:FieldByName('TNKGKB').Asstring:='1';               // ���
        1:FieldByName('TNKGKB').Asstring:='2';               // �Ɩ��Ǘ���
        2:FieldByName('TNKGKB').Asstring:='5';               // �V�X�e���Ǘ���
      end;

      // �g�p��~
      if chkSTKB.Checked then FieldByName('TNSTKB').Asstring:='D'
                         else FieldByName('TNSTKB').Asstring:='';

      // �폜�i�g�p��~�敪�j�H
      FieldByName('TNJTCD').Asstring:='';

      // �p�X���[�h�ύX���������ꍇ
      if EdtPASS.Text <> GetDecPass then
        FieldByName('TNPWLA').AsDateTime := Date;            // �p�X���[�h�ŏI�X�V��

      // ��\�����ڂ̐ݒ�i�ύX�҂Ȃǂ̃��O�L�^�p�j
      FieldByName('TNUPWS').Asstring:=dmUtilYbs.GetComputerNameS;
      FieldByName('TNUPPG').Asstring:=self.Name;
      FieldByName('TNUPDT').AsDateTime:=Date;
      FieldByName('TNUPTM').AsDateTime:=Time;
      FieldByName('TNUPUS').AsString := dmUtilYbs.sUserName; // �쐬���[�U�[

      // �f�[�^�x�[�X�X�V
      Post;
      if ApplyUpdates(0) >  0 then                           // �G���[�̏ꍇ�͒��f
      begin
        Abort;
      end;

      SetEncPass;                                            // �p�X���[�h�̈Í����o�^��

      dmUtilYbs.FDConnection1.Commit;                        // �R�~�b�g
      //�X�V�m�F�_�C�A���O
      MessageDlg('�X�V���������܂����i^��^�j',mtInformation, [mbOK], 0);

      except                                                 // ��O����
      on e:Exception do
      begin
        dmUtilYbs.FDConnection1.Rollback;                    //�G���[���̓��[���o�b�N
        MessageDlg(E.Message, mtError, [mbOK], 0);
        Abort;
      end;

    end;

  end;

  Close;

end;

{===============================================================================
�X�V���S���}�X�^���ڃZ�b�g
===============================================================================}
procedure TIH003.tset();
begin
  with  DataModule2.CDS_IH003 do
  begin
    // ����
    case CmbKGNM.ItemIndex of
      0:FieldByName('TNKGKB').Asstring:='1';               // ���
      1:FieldByName('TNKGKB').Asstring:='2';               // �Ɩ��Ǘ���
      2:FieldByName('TNKGKB').Asstring:='5';               // �V�X�e���Ǘ���
    end;

    // �g�p��~
    if chkSTKB.Checked then FieldByName('TNSTKB').Asstring:='D'
                       else FieldByName('TNSTKB').Asstring:='';

    // �폜�i�g�p��~�敪�j�H
    FieldByName('TNJTCD').Asstring:='';

    // �p�X���[�h�ŏI�X�V��
    FieldByName('TNPWLA').AsDateTime := Date;

    // ��\�����ڂ̐ݒ�i�ύX�҂Ȃǂ̃��O�L�^�p�j
    FieldByName('TNCRWS').Asstring:=dmUtilYbs.GetComputerNameS;
    FieldByName('TNCRPG').Asstring:=self.Name;
    FieldByName('TNCRDT').AsDateTime:=Date;
    FieldByName('TNCRTM').AsDateTime:=Time;
    FieldByName('TNCRUS').AsString := dmUtilYbs.sUserName; // �쐬���[�U�[


    // �f�[�^�x�[�X�X�V
    Post;
  end;
end;

{===============================================================================
�_���`�F�b�N�@�����F�Ȃ��A�߂�l�FBool
===============================================================================}
function TIH003.LogicalChecOk: Boolean;
begin

  Result :=False;

  if mode='Add' then
    EdtTNCD.Color := clWindow; // �S����CD�t�H�[���ɔ���������

  if mode='Del' then
  begin

    //���Ӑ悪��������폜�֎~
{    with DataModule3.FDQryGene do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT TOTKCD FROM TOKMSP WHERE TOTNCD=:TNCD AND TOJTCD='''' ');
      ParamByName('TNCD').AsString:=EdtTNCD.text;
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


//  EdtBKCD.Color := clWindow;

  ChkBlank(EdtTNCD,'�S����CD');

  //�ǉ����[�h�̏ꍇKEY�d���`�F�b�N���s���B
  if (mode='Add') or (mode='Cpy') then
  begin
    if DataModule2.TNMMS(EdtTNCD.Text,true).Exists=true then
    begin
      MessageDlg('�S����CD���d�����Ă��܂��B', mtError, [mbOk], 0);
      EdtTNCD.SetFocus;
      EdtTNCD.Color := clERR;
      Exit;
    end;
  end;

  ChkBlank(EdtNAME,'�S���Җ�');

  ChkBlank(EdtPASS,'�p�X���[�h');

  ChkBlank(CmbKGNM,'�����敪');

//  ChkBlank(EdtBKCD,'����CD');

//  if BKMMS(EdtBKCD.Field.AsString).Exists=false then
//  begin
//    MessageDlg('����CD���s���ł��B',mterror,[mbok],0);
//    EdtBKCD.SetFocus;
//    EdtBKCD.Color:=clERR;
//    exit;
//  end;

  Result :=True;

end;

{===============================================================================
�p�X���[�h�Í����p
===============================================================================}
procedure TIH003.SetEncPass;
begin
  with DataModule2.FDQryGene do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' UPDATE TNMMSP ');
    SQL.Add('    SET TNPASS = ENCRYPTBYPASSPHRASE('''+DECKEY+''',:PASS) ');
    SQL.Add('  WHERE TNTNCD = :TNCD ');
    ParamByName('PASS').AsAnsiString:=EdtPass.Text;
    ParamByName('TNCD').AsAnsiString:=EdtTNCD.Text;
    ExecSQL;
  end;

end;

end.
