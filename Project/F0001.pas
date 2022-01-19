unit F0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TF0001Frm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtTNCD: TEdit;
    EdtNAME: TEdit;
    Button1: TButton;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    //�I���{�^��
    procedure Button3Click(Sender: TObject);
    //�����{�^��
    procedure Button1Click(Sender: TObject);
    //�ύX�{�^��
    procedure Button2Click(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
    var
      TNCD:String;
      reNAME:String;
  end;

var
  F0001Frm: TF0001Frm;

implementation

{$R *.dfm}

uses Unit1, DM2, F0002;

//�����{�^���̏���
procedure TF0001Frm.Button1Click(Sender: TObject);
begin
  //�S����CD�ƒS���Җ���DM2�֓n������
  TNCD:=EdtTNCD.Text;
  reNAME:=EdtNAME.Text;

  //DBGrid1�̏�����
  DBGrid1.DataSource.DataSet.Close;

  //�S���Ҍ������J��
  DataModule2.OpenTNData(TNCD,reNAME);

end; // �����{�^���̏��������܂�

//�ύX�{�^���̏���
procedure TF0001Frm.Button2Click(Sender: TObject);
var
  frm : Tform;
begin
  //DBGrid1�Ƀf�[�^���Ȃ��ꍇ���f
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  if DBGrid1.DataSource.DataSet.Active=False then abort;
  if DBGrid1.DataSource.DataSet.IsEmpty then abort;

  //�S���҃����e��ʂ�����
  frm := TF0002Frm.create(self);
  //�Ɖ��ʂ��\���ɂ���
  Self.Hide;
  //��ʓW�J����
  frm.ShowModal;

  //F0002�C���X�^���X�J��
  FreeAndNil(frm);
  //�Ɖ��ʕ���
  Self.Show;
  //�ŐV��Ԃ�\������
  Button1Click(Button1);

end; //�ύX�{�^���̏��������܂�

//�I���{�^���̏���
procedure TF0001Frm.Button3Click(Sender: TObject);
begin
  //��\���`�F�b�N
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  //��ʏI��
  Close;
end; //�I���{�^���̏��������܂�

end.
