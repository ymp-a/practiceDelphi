unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    EdtUserId: TEdit;
    EdtPsw: TEdit;
    //���O�C���{�^���^�b�v���̏���
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
    //���j���[�\��
    procedure crtMnuFrm();virtual;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Utilybs, DM2, MNK001, IniFilemnt, functions, System.IniFiles;

//�����{�^���^�b�v���̏���
procedure TForm1.Button1Click(Sender: TObject);
var
  KGKB:String;//�����敪
  frm:TForm;
//  PDevMode   : ^TDevMode;
begin
  //���[�U�[ID���͗��w�i�F��������
  EdtUserId.Color := clWindow;
  //PW�w�i�F��������
  EdtPsw.Color := clWindow;

  try

    try
    //dmUtilYbs�f�[�^���W���[�����쐬
      dmUtilYbs:=TdmUtilYbs.Create(self);//�T�[�o�[�ڑ��I��

      if dmUtilYbs.FDConnection1.Connected=true then  //�ڑ����̏���
      begin

        //�p�X���[�h�`�F�b�N�������敪�擾
        KGKB:=dmUtilYbs.PassMstChk(EdtUserId.Text,EdtPsw.Text);
        //���[�U�[ID���قȂ�Ƃ��̏���
        if KGKB = 'USERR' then
        begin
          //���[�U�[ID�̓��͗����s���N�ɂ���
          EdtUserId.Color := clERR;
          EdtUserId.SetFocus;
          Exit;
        end else
        //PW���قȂ�Ƃ��̏���
        if KGKB = 'PAERR' then
        begin
          //PW�����s���N�ɂ���
          EdtPsw.Color := clERR;
          EdtPsw.SetFocus;
          Exit;
        end;


        //���j���[�\��
        crtMnuFrm;      //�p���̂��߁A�t�@���N�V������

        //�v���O�������I��������T�[�o�[�ؒf���ĕ���
        dmUtilYbs.FDConnection1.Connected:=false;
        close;

      end; //�ڑ����̏��������܂�

      //�T�[�o�ڑ����̗�O����
      Except on e:Exception do
      begin
        //��O�G���[���b�Z�[�W�_�C�A���O��\������
        MessageDlg(E.Message, mtError, [mbOK], 0);
        abort;
      end;//Except�����܂�

    end;//tryExcept�����܂�

  finally
    dmUtilYbs.Free;    //�G���[���E�p�X���[�h�`�F�b�N�ň���������������Free�^���펞��PGM�I�����Free�B
  end; //tryfinally�����܂�

end; //�����{�^���^�b�v���̏��������܂�

//���j���[�\��
procedure TForm1.crtMnuFrm;
var
  frm:TForm;
begin
    //���j���[��ʂ�����
    frm := TMNK001Frm.Create(Application);
    //���O�C����ʂ��\���ɂ���
    Self.Hide;
    //��ʓW�J
    frm.ShowModal;
end; //���j���[�\�������܂�

procedure TForm1.FormShow(Sender: TObject);
const
  fileNm= 'PASWIN.ini';
var
  iniF : TIniFile;
  Database: string;
  DriverID: String;
  Server: String;
  User_Name: String;
  Password: String;
  ODBCAdvanced: String;
  OSAuthent: String;
begin
  try

    try // ini�t�@�C����Ǎ��ޏ���
      iniF :=  TIniFile.Create(ExtractFilePath(Application.ExeName)+fileNm);
    except
      MessageDlg('INI�t�@�C���̓ǂݎ��ŃG���[���������܂����B',mtError,[mbOK],0);
      Exit;
    end;

    //dmUtilYbs�f�[�^���W���[�����쐬
    dmUtilYbs:=TdmUtilYbs.Create(self);

    Database:=iniF.ReadString('LOGON','Database','');
    DriverID:= iniF.ReadString('LOGON','DriverID','');
    Server:= iniF.ReadString('LOGON','Server','');
    User_Name:= iniF.ReadString('LOGON','User_Name','');
    Password:= iniF.ReadString('LOGON','Password','');
    ODBCAdvanced:=iniF.ReadString('LOGON','ODBCAdvanced','');
    OSAuthent:=iniF.ReadString('LOGON','OSAuthent','');

    EdtUserId.Text := iniF.ReadString('Remote','UserId','');
    EdtPsw.Text := iniF.ReadString('Remote','Password','');

    with dmUtilYbs.FDConnection1 do
    begin
      close;
      Params.Clear;
      Params.Values['DriverID']    := DriverID ;
      Params.Values['Database']    := Database ;
      Params.Values['OSAuthent']   := OSAuthent;
      Params.Values['User_Name']   := User_Name;
      Params.Values['Password']    := Password ;
      Params.Values['ODBCAdvanced']:= ODBCAdvanced;
      Params.Values['Server']      := Server   ;

    end;



  finally
    FreeAndNil(iniF);
  end;

end;

end.
