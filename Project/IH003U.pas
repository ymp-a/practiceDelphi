unit IH003U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, EdtMaster, System.Actions, Vcl.ActnList,
  PageTop, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  DBEditUNIC;

type
  TIH003 = class(TEdtMasterFrm)
    Label1: TLabel;
    EdtTNCD: TDBEditUNIC;
    Label2: TLabel;
    EdtNAME: TDBEditUNIC;
    Label3: TLabel;
    EdtPass: TEdit;
    Label4: TLabel;
    CmbKGNM: TComboBox;
    Label5: TLabel;
    chkSTKB: TCheckBox;
    EdtKGKB: TDBEditUNIC;
    procedure FormShow(Sender: TObject);         // ��ʕ\���̏���
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private �錾 }
    procedure InzAddMode;override;               // �����ݒ�i�ǉ����[�h�j
    function  GetDecPass: string;                   // �����p
  public
    { Public �錾 }
  end;

var
  IH003: TIH003;

implementation

{$R *.dfm}

uses DM2, Utilybs, functions;

{===============================================================================
��ʓW�J��ɐݒ肷��C�x���g
===============================================================================}
procedure TIH003.FormShow(Sender: TObject);
begin
  if PageTopFrm1.EdtMode.Text<> '�ǉ�' then
  // �ҏW�p�ɐV�����N���C�A���g�f�[�^�Z�b�g���J��
  with DataModule2 do
  begin
    try
      CDS_IH003.Active := False; // CDS�����

      with FDQryIH003 do
      begin
        close;                   // SQL��������
        SQL.Clear;               // SQL������
        // SQL���J�n��
        SQL.Add(' select * , CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS');
        SQL.Add(' from TNMMSP where TNTNCD = :TNTNCD ');
        // DBGrid1�őI�𒆂̒S����CD��������
        ParamByName('TNTNCD').AsAnsiString := DataModule2.CDS_IH004.FieldByName('TNTNCD').AsString;

        Open;                    // FDQueryLogin2��W�J����

        if IsEmpty then          // FDQueryLogin2�Ƀf�[�^���Ȃ��ꍇ�̏���
        begin                               // ��O�G���[���b�Z�[�W���쐬
          raise Exception.Create('���ɍ폜����Ă���');
        end;
      end;

      CDS_IH003.Active := True;    // CDS���J��
      CDS_IH003.Edit;              // CDS�ҏW���[�h

      // ����
      if StrToIntDef(EdtKGKB.TEXT,-1)-1>=0 then
      begin
        case StrToIntDef(EdtKGKB.TEXT,0) of
          1: CmbKGNM.ItemIndex:=0;        // ���
          2: CmbKGNM.ItemIndex:=1;        // �Ɩ��Ǘ���
          5: CmbKGNM.ItemIndex:=2;        // �V�X�e���Ǘ���
        end;
      end;

      EdtPASS.Text:= GetDecPass;          // �p�X���[�h�̏����i������̕���PASS�������Ă���j

      // ������\���i��Ԃ�D�̎��̓`�F�b�N����j
      if DataModule2.CDS_IH003.FieldByName('TNSTKB').Asstring='D' then
        chkSTKB.Checked:=true
      else
        chkSTKB.Checked:=false;

      except on e:Exception do            // ��O����
      begin
        MessageDlg(E.Message, mtError, [mbOK], 0);
        self.close;
        abort;
      end;

    end; // try�����܂�


  end; // with�����܂�
end;

procedure TIH003.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  with DataModule2 do // �S���҃}�X�^�Ŏg�p����DM�̏I��
  begin
    FDQryGene.Close;
    FDQryIH003.Close;
    CDS_IH003.Close;
  end;
end;

{*******************************************************************************
 �ړI:�����ݒ�    (�ǉ����[�h�̐ݒ�)
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH003.InzAddMode;
begin
  inherited;
    with DataModule2 do
    begin
      // �ҏW�p��1���R�[�h�ǉ����Ă���
      CDS_IH003.Close;              // CDS�I��
      FDQryIH003.Close;                      // Qry�I��
      FDQryIH003.SQL.Clear;                  // SQL������
      FDQryIH003.SQL.add(' SELECT TOP 1 * ');
      FDQryIH003.SQL.add(' FROM TNMMSP ');   // �擪��1���R�[�h�𒊏o

      CDS_IH003.Open;               // CDS�J�n
      CDS_IH003.EmptyDataSet;       // CDS���o���R�[�h����ɂ���
      CDS_IH003.Append;             // CDS�ǉ����[�h
      try
        InitDataSet(CDS_IH003);     // detaset�̏������A0��NULL�ȂǓK�؂ȋ�̕\�L�ɂ��Ă���
      except
      end;
    end;
end;

{===============================================================================
�p�X���[�h�����p
===============================================================================}
function TIH003.GetDecPass: string;
begin
  result:='';

  with DataModule2.FDQryGene do
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT CAST(DECRYPTBYPASSPHRASE('''+DECKEY+''',TNPASS) AS varchar(10)) AS PASS ');
    SQL.Add('   FROM TNMMSP WHERE TNTNCD = :TNCD ');
    ParamByName('TNCD').AsString:=DataModule2.ClientDataSetTNMMSP.FieldByName('TNTNCD').AsString;
    Open;

    if IsEmpty=false then
    begin
      result:=FieldByName('PASS').AsString;
    end;
    Close;
    SQL.Clear;

  end;

end;

end.
