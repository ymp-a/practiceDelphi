unit baseForm2U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, baseFormU, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TbaseForm2 = class(TbaseForm)
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private �錾 }
    procedure setMsg1();
  public
    { Public �錾 }
  end;

var
  baseForm2: TbaseForm2;

implementation

{$R *.dfm}

procedure TbaseForm2.Button1Click(Sender: TObject);
begin
  inherited; // �p������button1Click�����s�����

end;

procedure TbaseForm2.Button2Click(Sender: TObject);
begin
  inherited;
  // �p�������\�b�h���Ăяo��
  setErrMsg('�G���[�ł�');
  pMode:=9;
  setMsg1();
  setMsg2('public�̃��\�b�h�����s�ł��܂�');

end;

procedure TbaseForm2.setMsg1;
begin
  inherited; // �p������setMsg1�����s
  // ����ɏ�����ǉ�
  Memo1.Lines.Add('�p���悩��ǉ�');
end;

end.
