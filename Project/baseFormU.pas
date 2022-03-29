unit baseFormU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TbaseForm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
    procedure setMsg2(msg:String);

  protected
    // �ϐ��ɂ��A�N�Z�X�ł���
    pMode : Integer;
    // �G���[���b�Z�[�W��memo�ɕ\������
    procedure setErrMsg(msg:String);
    // pMode�̒l�m�F���b�Z�[�W�ǉ�
    procedure setMsg1();
  end;

var
  baseForm: TbaseForm;

implementation

{$R *.dfm}

procedure TbaseForm.Button1Click(Sender: TObject);
// �I���{�^��
begin
  Close;
end;

procedure TbaseForm.setErrMsg(msg:String);
// �G���[���b�Z�[�W��memo�ɒǉ�
begin
  Memo1.Lines.Add(msg);
end;

procedure TbaseForm.setMsg1();
// pMemo�̊m�F���b�Z�[�W�ǉ�
begin
  Memo1.Lines.Add('���݂�pMemo�̒l��' + InttoStr(pMode) + '�ł��B');
end;

procedure TbaseForm.setMsg2(msg:String);
// public���\�b�h
begin
  Memo1.Lines.Add(msg);
end;

end.
