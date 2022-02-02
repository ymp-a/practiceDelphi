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
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
  var
    Mode : String;//���[�h���ʗp
  end;

var
  MNK001Frm: TMNK001Frm;

implementation

{$R *.dfm}

uses F0001, F0002, F0003, EdtMaster;

procedure TMNK001Frm.Button1Click(Sender: TObject);
var
  frm:TF0001Frm;
begin
  //�S���ҏƉ��ʂ���
  frm := TF0001Frm.Create(Application);
  frm.Mode := 'Dsp';
  //��ʓW�J
  frm.ShowModal;
  //F0001�C���X�^���X�J��
  FreeAndNil(frm);
end;

procedure TMNK001Frm.Button2Click(Sender: TObject);
var
  frm:TF0002Frm;
begin
  //�S���҃����e��ʂ���
  frm := TF0002Frm.Create(Application);
  frm.Mode := 'Add';
  //��ʓW�J
  frm.ShowModal;
  //F0001�C���X�^���X�J��
  FreeAndNil(frm);
  frm.Mode := '';
end;

procedure TMNK001Frm.Button4Click(Sender: TObject);
var
  frm:TForm;
begin
  //���ϓ��́iAdd�j��ʂ���
  frm := TF0003Frm.Create(Application);
  //��ʓW�J
  frm.ShowModal;
  //F0001�C���X�^���X�J��
  FreeAndNil(frm);
end;

end.
