unit F0002;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, DBClient,
  Vcl.DBCtrls, DBEditUNIC, MaskEditDate, System.Actions, Vcl.ActnList;

type
  TF0002Frm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    chkSTKB: TCheckBox;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    EdtKGKB: TDBEditUNIC;
    CmbKGNM: TComboBox;
    EdtPASSw: TDBEditUNIC;
    EdtMode: TEdit;
    EdtPass: TEdit;
    EdtTNCD: TDBEditUNIC;
    EdtNAME: TDBEditUNIC;
    ActionList1: TActionList;
    F9: TAction;
    F6: TAction;
    // �@�@�@����TDBEdit�𗘗p�����checklogic�̍ۂɃu�����N���o�����B
    // ���R��CDS�I�[�v������Pass�����Ă��܂����߁B
    // ���̓t�H�[����͕����񂪂���悤�Ɍ����邪�����I�Ƀu�����N�����H

    procedure Button3Click(Sender: TObject);        // �I���{�^���̏���
    procedure Button2Click(Sender: TObject);        // �X�V�{�^���̏���
  private
    { Private �錾 }
    procedure DataOpen;                             // �f�[�^�I�[�v��

    function  LogicalChecOk:Boolean;                // �_���`�F�b�N
    procedure InzAddMode;virtual;                   // �����ݒ�i�ǉ����[�h�j
    procedure InzChgMode;virtual;                   // �����ݒ�i�ύX���[�h�j
//    procedure InzCpyMode;virtual;                 // �����ݒ�iCopy���[�h�j
    procedure InzDelMode;virtual;                   // �����ݒ�i�폜���[�h�j
//    procedure InzDspMode;virtual;                 // �����ݒ�i�\�����[�h�j

    procedure DbChenge;                             // �f�[�^�x�[�X�ւ̕ύX�i�ύX���[�h�j
    procedure DbAdd;                                // �f�[�^�x�[�X�ւ̕ύX�i�ǉ����[�h�j
    procedure DbDelete;                             // �f�[�^�x�[�X�ւ̕ύX�i�폜���[�h�j
    procedure SetEncPass;                           // �p�X���[�h�̕ۑ�
    function  GetDecPass: string;                   // �����p

  protected
    BKList:array[0..99] of TStringList;             // �R���{�l�ۊǃ��X�g
  var
    bFiest:Boolean;                                 // �ŏ������Ăт����Ȃ��̂Łi�r������p�j
    sOpenDATE,SOpenTime:string;
    objOwner:TComponent;                            // ��яo�����̃I�u�W�F�N�g��ۑ�
  public
    { Public �錾 }

    { Public declarations }
    // �S�������e��ʐ������̏���
    Constructor Create(AOwner:TComponent; Mode:String);        // �R���X�g���N�^
    procedure CreateBKList;                                    // �R���{�֘A
    procedure FldChange(WC:TWinControl;cl:TColor=clBtnFace);   // Edit(DBEdit),Memo�����ꊇ�ύX

  var
    Mode : String;                                  // ���[�h���ʗp
    eTNCD : String;                                 // �Í������W�b�N�ɓn���S����CD
    ePASS : String;                                 // �Í������W�b�N�ɓn�����͂���PASSText
  end;


var
  F0002Frm: TF0002Frm;

implementation

{$R *.dfm}

uses F0001, DM2, Utilybs, functions, DM3, EdtMaster, FncLock;

{*******************************************************************************
 �ړI:�R���X�g���N�^�[�̃I�[�o�[���C�h    (���[�h�̐ݒ�)
 ����:�ďo���[�h
 �ߒl:
*******************************************************************************}
Constructor TF0002Frm.Create(AOwner:TComponent; Mode:String);
var
  bkCr:TCursor;
begin
  bFiest:=true;     //�ŏ��ł���


  bkCr:=Screen.Cursor;
  try
    Screen.Cursor:=crHourGlass;

    inherited  Create(AOwner);
    objOwner:=AOwner;
    self.Mode := Mode;
    //���[�h�̐ݒ�
    if Mode = 'Add' then
        InzAddMode
    else if Mode='Chg' then
        InzChgMode
    else if Mode='Cpy' then
//        InzCpyMode
    else if Mode = 'Del' then
        InzDelMode
    else if Mode = 'Dsp' then
//        InzDspMode;
  finally
    Screen.Cursor:=bkCr;
  end;

end;

{*******************************************************************************
 �ړI:�X�V�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0002Frm.Button2Click(Sender: TObject);
begin
  //�ǉ����[�h
  Button2.Enabled:=false;   //�������̓{�^�����b�N
  Button3.Enabled:=false;   //�I���{�^�������b�N
  try
//    LgcChkMsg:=true;
    if LogicalChecOk then
    if MessageDlg('�X�V���������s���܂��B��낵���ł����H',
        mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
//      ALLEditNumChk;
        //�X�V����
      //LgcChkMsg:=false;
      if LogicalChecOk then //�ēx�m�F(�݌ɓ��̊֌W��)
      begin
        if (Mode = 'Add')or(Mode = 'Cpy') then
          DbAdd
        else if Mode='Chg' then
          DbChenge
        else if Mode = 'Del' then
          DbDelete;
      end;
    end;
  finally
    Button3.Enabled:=true;  //�I���{�^�������b�N
    Button2.Enabled:=true;  //�{�^�����b�N����
  end;
end;

{*******************************************************************************
 �ړI:�I���{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0002Frm.Button3Click(Sender: TObject);
var
  i:integer;
begin
  // ��\���`�F�b�N
  if (Button3.Enabled=false)or(Button3.Visible=false) then
   abort;

  Close; // ��ʏI��

  // BKList�p��
 { for i:=0 to 99 do
  begin
    BKList[i]:=nil;
    BKList[i].Free;
  end;
}
//  Application.Title:=bkTitle;

  with DataModule3 do // �S���҃}�X�^�Ŏg�p����DM�̏I��
  begin
    FDQryGene.Close;
    FDQryF0002.Close;
    ClientDataSetF0002.Close;
  end;

end; //�I���{�^���̏��������܂�

{===============================================================================
�_���`�F�b�N�@�����F�Ȃ��A�߂�l�FBool
===============================================================================}
function TF0002Frm.LogicalChecOk: Boolean;
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
    if DataModule3.TNMMS(EdtTNCD.Text,true).Exists=true then
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
�f�[�^�x�[�X�ւ̕ύX�i�ύX���[�h�j
===============================================================================}
procedure TF0002Frm.DbChenge;
begin

  with  DataModule3.ClientDataSetF0002 do                    // ����LiteVer�̕ύX���[�h
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

  //Close;

end;


{===============================================================================
�f�[�^�x�[�X�ւ̕ύX�i�ǉ����[�h�j
===============================================================================}
procedure TF0002Frm.DbAdd;
begin

  with  DataModule3.ClientDataSetF0002 do
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

      // �p�X���[�h�ŏI�X�V��
      FieldByName('TNPWLA').AsDateTime := Date;

      // ��\�����ڂ̐ݒ�i�ύX�҂Ȃǂ̃��O�L�^�p�j
      FieldByName('TNCRWS').Asstring:=dmUtilYbs.GetComputerNameS;
      FieldByName('TNCRPG').Asstring:=self.Name;
      FieldByName('TNCRDT').AsDateTime:=Date;
      FieldByName('TNCRTM').AsDateTime:=Time;
      FieldByName('TNCRUS').AsString := dmUtilYbs.sUserName; // �쐬���[�U�[


      // �f�[�^�x�[�X�X�V
       Post;                                                 // CDS�̕ҏW���e���m�肷��
      if ApplyUpdates(0) >  0 then                           // �G���[�̏ꍇ�͒��f
      begin
        Abort;
      end;

      SetEncPass;                                            // �p�X���[�h�̈Í����o�^��

      dmUtilYbs.FDConnection1.Commit;                        // �R�~�b�g
      // �X�V�m�F�_�C�A���O
      MessageDlg('�V�K�o�^���������܂����i�E�ցE�j',mtInformation, [mbOK], 0);

    except
    on e:Exception do
    begin
      dmUtilYbs.FDConnection1.Rollback;                      // �G���[���̓��[���o�b�N
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
    end;

    end;

    InzAddMode;                                              // �A���Œǉ��X�V�ł���悤�Ƀ��Z�b�g

    EdtPASS.Text:='';                                        // Pass���̓t�H�[����������
    CmbKGNM.ItemIndex:=0;

    EdtTNCD.SetFocus;
  end;

  //Close;

end;


{===============================================================================
�f�[�^�x�[�X�ւ̕ύX�i�폜���[�h�j
===============================================================================}
procedure TF0002Frm.DbDelete;
begin
  inherited;

  with  DataModule3.ClientDataSetF0002 do
  begin
    dmUtilYbs.FDConnection1.StartTransaction;                // �g�����U�N�V���������J�n
    try
      // �폜
      FieldByName('TNSTKB').Asstring:='D';

      // ��\�����ڂ̐ݒ�
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

      dmUtilYbs.FDConnection1.Commit;                        // �R�~�b�g
      // �X�V�m�F�_�C�A���O
      MessageDlg('�폜���������܂����i��o���j',mtInformation, [mbOK], 0);

      except                                                 // ��O����
      on e:Exception do
      begin
        dmUtilYbs.FDConnection1.Rollback;                    // ���[���o�b�N
        MessageDlg(E.Message, mtError, [mbOK], 0);
        Abort;
      end;

    end;

  end;

  Close;

end;


{===============================================================================
DBEditBox ComboBox�l�A�g����
===============================================================================}

// �R���{�{�b�N�X�l�ۊǃ��X�g�쐬
// ��������TComboBox�̃^�O�Ƀ��[�N��StringList�w�W���Z�b�g���֘A�t��
procedure TF0002Frm.CreateBKList;
var
//  str,nam:string;
  i,tg:integer;
begin
  tg:=0;
  for i:=0 to Self.ComponentCount-1 do
  begin
    if Self.Components[i] is TComboBox then
    begin
      TComboBox(Self.Components[i]).Tag:=tg; // �R���{�{�b�N�X��Tag�v���p�e�B��BKList�Ɗ֘A�t��
      BKList[tg]:=nil;
      BKList[tg]:=TStringList.Create;
      BKList[tg].Clear;
      inc(tg);
    end;
  end;
end;



{===============================================================================
�p�X���[�h�����p
===============================================================================}
function TF0002Frm.GetDecPass: string;
begin
  result:='';

  with DataModule3.FDQryGene do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS ');
    SQL.Add('   FROM TNMMSP WHERE TNTNCD = :TNCD ');
    ParamByName('TNCD').AsString:=DataModule2.ClientDataSetTNMMSP.FieldByName('TNTNCD').AsString;
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
�p�X���[�h�Í����p
===============================================================================}
procedure TF0002Frm.SetEncPass;
begin
  with DataModule3.FDQryGene do
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

{*******************************************************************************
 �ړI:�����ݒ�    (�ǉ����[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0002Frm.InzAddMode;
begin
  EdtMode.Text := '�ǉ�';

 // �r������
 // �ǉ����[�h�Ń��b�N�t�@�C���̃��R�[�h���P���쐬����B
 // �J��Ԃ����͂Ȃǂ�����̂ō쐬�͂P��̂�

  if bFiest then
  begin
    bFiest:=False;
    // �r������p��Form���J���������擾
    sOpenDATE:=dmUtilYbs.GetStmDate;
    SOpenTime:=dmUtilYbs.GetStmTime;
{    try
      LockADD('ADD', Self.Name,sOpenDATE,SOpenTime,dmUtilYbs.sUserName,dmUtilYbs.GetComputerNameS,dmUtilYbs.sUserName,dmUtilYbs.GetComputerNameS,self.Name,self.Caption);
    except
      on e:Exception do//���ׂĂ̗�O
      begin
        Screen.Cursor := crDefault;
        MessageDlg(E.Message, mtError, [mbOK], 0);
        PostMessage(Handle,WM_CLOSE,0,0);
        //Exit;
        abort;
      end;
    end;
}
  end;

  with DataModule3 do
  begin
    // �ҏW�p��1���R�[�h�ǉ����Ă���
    ClientDataSetF0002.Close;              // CDS�I��
    FDQryF0002.Close;                      // Qry�I��
    FDQryF0002.SQL.Clear;                  // SQL������
    FDQryF0002.SQL.add(' SELECT TOP 1 * ');
    FDQryF0002.SQL.add(' FROM TNMMSP ');   // �擪��1���R�[�h�𒊏o

    ClientDataSetF0002.Open;               // CDS�J�n
    ClientDataSetF0002.EmptyDataSet;       // CDS���o���R�[�h����ɂ���
    ClientDataSetF0002.Append;             // CDS�ǉ����[�h
    try
      InitDataSet(ClientDataSetF0002);     // detaset�̏������A0��NULL�ȂǓK�؂ȋ�̕\�L�ɂ��Ă���
    except
    end;
  end;

end;

{*******************************************************************************
 �ړI:�����ݒ�   (�ύX���[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0002Frm.InzChgMode;
begin
  EdtMode.Text := '�ύX';

  DataOpen;                  // �Ɖ�f�[�^������1���R�[�hSQL�o�͂���

  ChgReadOnly(EdtTNCD,true); // TNCD��Ǎ���p�ɂ��邩�̔��ʏ���

end;

{*******************************************************************************
 �ړI:�����ݒ�    (�폜���[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0002Frm.InzDelMode;
begin
  EdtMode.Text := '�폜';

  DataOpen;                // �Ɖ�f�[�^������1���R�[�hSQL�o�͂���

  Panel1.Enabled := False; // �p�l��1�͈̔͂���͕s�ɂ���

  FldChange(Panel1);       //�ꊇ��Edit,Memo��Color��BtnFace�ɕύX�B���̓R���|�[�l���g�̐F���D�F�ɂ���B

end;


{===============================================================================
�f�[�^�I�[�v��
===============================================================================}
procedure TF0002Frm.DataOpen;
begin
  // �ҏW�p�ɐV�����N���C�A���g�f�[�^�Z�b�g���J��
  with DataModule3 do
  begin
    try
      ClientDataSetF0002.Active := False; // CDS�����
      FDQryF0002.close;                   // SQL��������
      FDQryF0002.SQL.Clear;               // SQL������
      // SQL���J�n��
      FDQryF0002.SQL.Add(' select * , CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS');
      FDQryF0002.SQL.Add(' from TNMMSP where TNTNCD = :TNTNCD ');
      // DBGrid1�őI�𒆂̒S����CD��������
      FDQryF0002.ParamByName('TNTNCD').AsAnsiString := DataModule2.ClientDataSetTNMMSP.FieldByName('TNTNCD').AsString;

      FDQryF0002.Open;                    // FDQueryLogin2��W�J����

      if FDQryF0002.IsEmpty then          // FDQueryLogin2�Ƀf�[�^���Ȃ��ꍇ�̏���
      begin                               // ��O�G���[���b�Z�[�W���쐬
        raise Exception.Create('���ɍ폜����Ă���');
      end;

    ClientDataSetF0002.Active := True;    // CDS���J��
    ClientDataSetF0002.Edit;              // CDS�ҏW���[�h

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
      if DataModule3.ClientDataSetF0002.FieldByName('TNSTKB').Asstring='D' then
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

end; // DataOpen�����܂�

{*******************************************************************************
 �ړI: �ꊇ��Edit�R���g���[��������ύX����B
 ����: TWinControl(TPanel)
 �ߒl:
*******************************************************************************}
procedure TF0002Frm.FldChange(WC:TWinControl;cl:TColor=clBtnFace);
Var
 i: Integer;
 CC:TControl;
begin

  if WC.ControlCount = 0 then Exit;

  with WC do begin
  for i :=0 to ControlCount - 1 do
    begin
      if Controls[i] is TEdit then
      begin
         TEdit(Controls[i]).Color := cl;
      end ;
      if Controls[i] is TMaskEditDate then
      begin
      TMaskEditDate(Controls[i]).Color := cl;
      end ;
      if Controls[i] is TDBEdit then
      begin
         TDBEdit(Controls[i]).Color := cl;
      end;
      if Controls[i] is TMemo then
      begin
         TMemo(Controls[i]).Color := cl;
      end;
      if Controls[i] is TComboBox then
      begin
         TComboBox(Controls[i]).Color := cl;
      end;
      if Controls[i] is TDBComboBox then
      begin
         TDBComboBox(Controls[i]).Color := cl;
      end;
      if Controls[i] is TRadioButton then
      begin
        TRadioButton(Controls[i]).Color := cl;
      end;
      // �ĉ�A���s���B
      CC := WC.Controls[i];
      if CC is TWinControl then FldChange(TWinControl(CC));

    end;

  end;

end;


end.
