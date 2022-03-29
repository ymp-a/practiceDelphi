unit MNK001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TMNK001Frm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject); // �S���ҏƉ�
    procedure Button2Click(Sender: TObject); // �S���҃����e
    procedure Button3Click(Sender: TObject); // ���ϏƉ�
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject); // ���ϓ���
  private
    { Private �錾 }

  public
    { Public �錾 }
  var
    Mode : String;                           // ���[�h���ʗp
  end;

var
  MNK001Frm: TMNK001Frm;

implementation

{$R *.dfm}

uses F0001, F0002, F0003, EdtMaster, DM3, FncLock, Utilybs, DM2, F0004,
  baseFormU, baseForm2U;

{*******************************************************************************
 �ړI:�S���ҏƉ�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TMNK001Frm.Button1Click(Sender: TObject);
var
  frm:TF0001Frm;
begin
  frm := TF0001Frm.Create(Application); // �S���ҏƉ��ʂ���
  frm.Mode := 'Dsp';                    // Dsp���[�h�Z�b�g
  frm.ShowModal;                        // ��ʓW�J
  FreeAndNil(frm);                      // F0001�C���X�^���X�J��
end;

{*******************************************************************************
 �ړI:�S���҃����e�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TMNK001Frm.Button2Click(Sender: TObject);
begin
  F0001Frm.ShwNextFrm('Add');
end;

{*******************************************************************************
 �ړI:���ϏƉ�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TMNK001Frm.Button3Click(Sender: TObject);
var frm:TF0004Frm;
begin
  frm := TF0004Frm.Create(Application); // �S���ҏƉ��ʂ���
  frm.Mode := 'Dsp';                    // Dsp���[�h�Z�b�g
  frm.ShowModal;                        // ��ʓW�J
  FreeAndNil(frm);                      // F0004�C���X�^���X�J��
end;

{*******************************************************************************
 �ړI:���ϓ��̓{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TMNK001Frm.Button4Click(Sender: TObject);
begin
  F0004Frm.ShwNextFrm('Add');
end;

{*******************************************************************************
 �ړI:�p���{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TMNK001Frm.Button5Click(Sender: TObject);
var frm:TbaseForm2;
begin
  frm := TbaseForm2.Create(Application); // �p����ʂ���
  frm.ShowModal;                         // ��ʓW�J
  FreeAndNil(frm);                       // TbaseForm2�C���X�^���X�J��
end;


end.
