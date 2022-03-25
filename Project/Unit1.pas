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
    procedure Button1Click(Sender: TObject); // ���O�C���{�^���̏���
    procedure FormShow(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
    procedure crtMnuFrm();virtual;           // ���j���[�\��
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Utilybs, DM2, MNK001, IniFilemnt, functions, System.IniFiles;

{*******************************************************************************
 �ړI:�����{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TForm1.Button1Click(Sender: TObject);
var
  KGKB:String;                 // �����敪
  frm:TForm;
//  PDevMode   : ^TDevMode;
begin
  EdtUserId.Color := clWindow; // ���[�U�[ID���͗��w�i�F��������
  EdtPsw.Color := clWindow;    // PW�w�i�F��������

  try

    try
    // dmUtilYbs�f�[�^���W���[�����쐬
      dmUtilYbs:=TdmUtilYbs.Create(self); // �T�[�o�[�ڑ��I��

      if dmUtilYbs.FDConnection1.Connected=true then  // �ڑ����̏���
      begin
        // �p�X���[�h�`�F�b�N�������敪�擾
        KGKB:=dmUtilYbs.PassMstChk(EdtUserId.Text,EdtPsw.Text);

        if KGKB = 'USERR' then      // ���[�U�[ID���قȂ�Ƃ�
        begin
          EdtUserId.Color := clERR; // ���[�U�[ID�̓��͗����s���N�ɂ���
          EdtUserId.SetFocus;
          Exit;
        end else

        if KGKB = 'PAERR' then      // PW���قȂ�Ƃ�
        begin
          EdtPsw.Color := clERR;    // PW�����s���N�ɂ���
          EdtPsw.SetFocus;
          Exit;
        end;

        crtMnuFrm;                  // ���j���[�\��


        dmUtilYbs.FDConnection1.Connected:=false; // �T�[�o�[�ؒf���ĕ���
        close;

      end; // �ڑ����̏��������܂�


      Except on e:Exception do // �T�[�o�ڑ����̗�O����
      begin
        // ��O�G���[���b�Z�[�W�_�C�A���O��\��
        MessageDlg(E.Message, mtError, [mbOK], 0);
        abort;
      end; // Except�����܂�

    end; // tryExcept�����܂�

  finally
    dmUtilYbs.Free; // �G���[���E�p�X���[�h�`�F�b�N�ň���������������Free�^���펞��PGM�I�����Free�B
  end; // tryfinally�����܂�

end; // �����{�^���^�b�v���̏��������܂�

{*******************************************************************************
 �ړI:���j���[�\��
 ����:
 �ߒl:
*******************************************************************************}
procedure TForm1.crtMnuFrm;
var
  frm:TForm;
begin
    frm := TMNK001Frm.Create(Application); // ���j���[��ʂ�����
    Self.Hide;                             // ���O�C����ʂ��\���ɂ���
    frm.ShowModal;                         // ��ʓW�J

end; // ���j���[�\�������܂�

{*******************************************************************************
 �ړI:���O�C����ʓW�J���̏���
 ����:
 �ߒl:
*******************************************************************************}
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

    // dmUtilYbs�f�[�^���W���[�����쐬
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
