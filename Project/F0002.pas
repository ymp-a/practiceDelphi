unit F0002;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,
  Vcl.DBCtrls, DBEditUNIC;

type
  TF0002Frm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    EdtPass: TEdit;
    chkSTKB: TCheckBox;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    EdtNAME: TDBEditUNIC;
    EdtKGKB: TDBEditUNIC;
    CmbKGNM: TComboBox;
    EdtTNCD: TDBEditUNIC;
    EdtPASSw: TDBEditUNIC;
    //�I���{�^���̏���
    procedure Button3Click(Sender: TObject);
    //��ʓW�J���̏���
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private �錾 }
    function  LogicalChecOk:Boolean;        //�_���`�F�b�N
    procedure DbChenge;                     //�f�[�^�x�[�X�ւ̕ύX�i�ύX���[�h�j
  public
    { Public �錾 }
  var
    Mode : String;
    eTNCD : String;
    ePASS : String;
  end;

var
  F0002Frm: TF0002Frm;

implementation

{$R *.dfm}

uses F0001, DM2, Utilybs, functions, DM3;

{*******************************************************************************
 �ړI:�n�j�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0002Frm.Button2Click(Sender: TObject);
begin
  //�ǉ����[�h
  Button2.Enabled:=false;//�������̓{�^�����b�N
  Button3.Enabled:=false;//�I���{�^�������b�N
  try
//    LgcChkMsg:=true;
    if LogicalChecOk then
    if MessageDlg('�X�V���������s���܂��B��낵���ł����H',
        mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
//      ALLEditNumChk;
        //�X�V����
      //LgcChkMsg:=false;
      if LogicalChecOk then    //�ēx�m�F(�݌ɓ��̊֌W��)
      begin
//        if (Mode = 'Add')or(Mode = 'Cpy') then
//          DbAdd
//        else if Mode='Chg' then
          DbChenge;
//        else if Mode = 'Del' then
//          DbDelete;
      end;
    end;
  finally
    Button3.Enabled:=true;//�I���{�^�������b�N
    Button2.Enabled:=true;//�{�^�����b�N����
  end;
end;

//�I���{�^���̏���
procedure TF0002Frm.Button3Click(Sender: TObject);
var
  frm : Tform;
begin
  //��\���`�F�b�N
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  //��ʏI��
  Close;
  //�S���҃}�X�^�Ŏg�p����DM�̏I��
  with DataModule3 do
  begin
    FDQryGene.Close;
    FDQueryLogin2.Close;
    ClientDataSet2.Close;
  end;


end; //�I���{�^���̏��������܂�


//��ʓW�J���̏���
procedure TF0002Frm.FormShow(Sender: TObject);
begin
  try
    DataModule3.DataOpen;

    //����
    if StrToIntDef(EdtKGKB.TEXT,-1)-1>=0 then
    begin
      case StrToIntDef(EdtKGKB.TEXT,0) of
        1: CmbKGNM.ItemIndex:=0;   //���
        2: CmbKGNM.ItemIndex:=1;   //�Ɩ��Ǘ���
        5: CmbKGNM.ItemIndex:=2;   //�V�X�e���Ǘ���
      end;
    end;

    //�p�X���[�h�̏���
    EdtPASS.Text:= DataModule3.GetDecPass;

    //������\��
    if DataModule3.FDQueryLogin2.FieldByName('TNSTKB').Asstring='D' then
      chkSTKB.Checked:=true
    else
      chkSTKB.Checked:=false;

    //���ׂĂ̗�O
    except on e:Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
      self.close;
      abort;
    end;

  end;

end; //��ʓW�J���̏��������܂�

function TF0002Frm.LogicalChecOk: Boolean;
begin

  Result :=False;

  if mode='Add' then
    EdtTNCD.Color := clWindow;

  if mode='Del' then
  begin

    //���Ӑ悪��������폜�֎~
    with DataModule3.FDQryGene do
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

    Result:=true;
    exit;
  end;


//  EdtBKCD.Color := clWindow;

  ChkBlank(EdtTNCD,'�S����CD');

  //�ǉ����[�h�̏ꍇKEY�d���`�F�b�N���s���B
//  if (mode='Add') or (mode='Cpy') then
//  begin
//    if TNMMS(EdtTNCD.Field.AsString,true).Exists=true then
//    begin
//      MessageDlg('�S����CD���d�����Ă��܂��B', mtError, [mbOk], 0);
//      EdtTNCD.SetFocus;
//      EdtTNCD.Color := clERR;
//      Exit;
//    end;
//  end;

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

procedure TF0002Frm.DbChenge;
begin


  with  DataModule3.ClientDataSet2 do
  begin
    dmUtilYbs.FDConnection1.StartTransaction;
    try

      //����
      case CmbKGNM.ItemIndex of
        0:FieldByName('TNKGKB').Asstring:='1'; //���
        1:FieldByName('TNKGKB').Asstring:='2'; //�Ɩ��Ǘ���
        2:FieldByName('TNKGKB').Asstring:='5'; //�V�X�e���Ǘ���
      end;

      //�g�p��~
      if chkSTKB.Checked then FieldByName('TNSTKB').Asstring:='D'
                         else FieldByName('TNSTKB').Asstring:='';

      //�폜
      FieldByName('TNJTCD').Asstring:='';

      //�p�X���[�h�ύX���������ꍇ
      if EdtPASS.Text <> DataModule3.GetDecPass then
        FieldByName('TNPWLA').AsDateTime := Date;    //�p�X���[�h�ŏI�X�V��

      //��\�����ڂ̐ݒ�
      FieldByName('TNUPWS').Asstring:=dmUtilYbs.GetComputerNameS;
      FieldByName('TNUPPG').Asstring:=self.Name;
      FieldByName('TNUPDT').AsDateTime:=Date;
      FieldByName('TNUPTM').AsDateTime:=Time;
      FieldByName('TNUPUS').AsString := dmUtilYbs.sUserName;               //�쐬���[�U�[

      //�f�[�^�x�[�X�X�V
      DataModule3.ClientDataSet2.Post;
      if ApplyUpdates(0) >  0 then              //�G���[�̏ꍇ�͒��f
      begin
        Abort;
      end;

      eTNCD:=EdtTNCD.Field.AsString;
      ePASS:=EdtPass.Text;

      DataModule3.SetEncPass(eTNCD, ePASS);   //�p�X���[�h�̈Í����o�^

      dmUtilYbs.FDConnection1.Commit;
      //�X�V�m�F�_�C�A���O
      MessageDlg('�X�V���������܂����i^��^�j',mtInformation, [mbOK], 0);

    except
    on e:Exception do
    begin
      dmUtilYbs.FDConnection1.Rollback;
      MessageDlg(E.Message, mtError, [mbOK], 0);
      Abort;
//           CancelUpdates;
    end;

    end;

  end;

  //Close;

end;



end.
