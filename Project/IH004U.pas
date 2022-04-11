unit IH004U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DspMaster, Data.DB, System.Actions,
  Vcl.ActnList, PageTop, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TIH004 = class(TDspMasterFrm)
    EdtTNCD: TEdit;
    Label1: TLabel;
    EdtNAME: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
  end;

var
  IH004: TIH004;

implementation

{$R *.dfm}

uses DM2;

procedure TIH004.Button1Click(Sender: TObject);
{*******************************************************************************
 �ړI:�S���҃}�X�^�Ƀf�[�^�I�[�v��
 ����:
 �ߒl:
*******************************************************************************}
var
  andFlg:boolean; // ���̓t���O��ݒ�

begin

  andFlg:=false;  // �t���O������

  begin
    DataModule2.CDS_IH004.Close; // CDS��������

    with DataModule2.FDQryIH004 do
    begin
      Close; // FDQueryLogin������
      SQL.Clear;         // SQL��������
//      Params.Clear;

      // ��������SQL����
      SQL.Add(' SELECT * FROM TNMMSP  ');
      SQL.Add(' where 1=1 ');
      if EdtTNCD.Text<>'' then // �S����CD���͎��̏���
      begin
        SQL.Add(' AND TNTNCD = :TNCD ');
        ParamByName('TNCD').AsString:=EdtTNCD.Text; // ���͂����S����CD��'TNCD'�ɑ������
        andFlg:=true;                       // ���͎��t���O�I��
      end;

      if EdtNAME.Text<>'' then                    // �S���Җ����͎��̏���
      begin
        SQL.Add(' AND TNNAME LIKE :NAME ');                      // TNNAME LIKE��%���͖�%��SQLString�ɔ��f����
        ParamByName('NAME').AsWideString :='%' +EdtNAME.Text+ '%'; // ������v�̓��͖���'NAME'�֑������
        andFlg:=true;                                        // ���͎��t���O�I��
      end;

      SQL.Add(' ORDER BY TNTNCD ');     // ����

      Open();                 // SQL�����s
    end;

    DataModule2.CDS_IH004.Open(); // CDS���J��


    if DataModule2.CDS_IH004.Eof and DataModule2.CDS_IH004.Bof then // �Ώۃf�[�^�����݂��Ȃ��ꍇ�A�f�[�^�Z�b�g����ďI��
    begin
      DataModule2.CDS_IH004.Active := False;
      raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
    end;

  end;// CDS�����܂�

end;// OpenTNData�����܂�


procedure TIH004.FormShow(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
end;

end.
