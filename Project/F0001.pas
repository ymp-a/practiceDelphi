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
      NAME:String;
  end;

var
  F0001Frm: TF0001Frm;

implementation

{$R *.dfm}

uses Unit1, DM2, F0002;

//�����{�^���̏���
procedure TF0001Frm.Button1Click(Sender: TObject);
var
  andFlg:boolean; //���̓t���O��ݒ�

begin
  TNCD:=EdtTNCD.Text;


//  DBGrid1.DataSource.DataSet.Close;
//  DataModule2.OpenTNData(TNCD,NAME);
//  DBGrid1.DataSource.DataSet.Open;
  //�t���O������
  andFlg:=false;

  //�����ɍ��킹�����ʂ�Grid�\��������
  with DataModule2.FDQueryLogin do
  begin
    //FDQueryLogin�����
    Close;
    //SQL��������
    SQL.Clear;
    //��������SQL����
    SQL.Add(' SELECT * FROM TNMMSP  ');

    //�S����CD���͎��̏���
    if EdtTNCD.Text<>'' then
    begin
      //TNTNCD�ɓ��͂����S����CD��������
      SQL.Add(' WHERE TNTNCD >= :TNCD ');
      //���͂����S����CD��'TNCD'�ɑ������
      ParamByName('TNCD').AsString:=EdtTNCD.Text;
      //���͎��t���O�I��
      andFlg:=true;
    end;

    //�S���Җ����͎��̏���
      NAME:=EdtNAME.Text;
    if NAME<>'' then
    begin
      //�S����CD���͗L����AND��WHERE�ɏ������򂷂�
      if andFlg=true then SQL.Add(' AND ') else SQL.Add(' WHERE ');
      //TNNAME LIKE��%���͖�%��SQLString�ɔ��f����
      SQL.Add(' TNNAME LIKE :NAME ');
      //������v�̓��͖���'NAME'�֑������
      ParamByName('NAME').AsWideString := '%' + EdtNAME.Text + '%';
      //���͎��t���O�I��
      andFlg:=true;
    end;

    //����
    SQL.Add(' ORDER BY TNTNCD ');
    //FDQueryLogin��W�J����
    Open;
  end; //DataModule2.FDQueryLogin�����܂�

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
  //��ʓW�J����
  frm.ShowModal;
//  FreeAndNil(frm); ����Ȃ��H���������グ��ۂɕK�v�H
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
