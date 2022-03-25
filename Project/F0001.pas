unit F0001;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

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
    EdtMode: TEdit;
    Button4: TButton;
    Button5: TButton;
    ActionList1: TActionList;
    F1: TAction;
    F2: TAction;
    F8: TAction;
    F3: TAction;
    F9: TAction;
    procedure Button3Click(Sender: TObject); // �I���{�^��
    procedure Button1Click(Sender: TObject); // �����{�^��
    procedure Button2Click(Sender: TObject); // �ύX�{�^��
    procedure Button4Click(Sender: TObject); // �ǉ��{�^��
    procedure Button5Click(Sender: TObject); // �폜�{�^��
  private
    { Private �錾 }

  public
    { Public �錾 }
    var
      TNCD:String;
      reNAME:String;
      Mode:String;
    procedure ShwNextFrm(mode: string);      // ���[�h�Ǘ�
  end;

var
  F0001Frm: TF0001Frm;

implementation

{$R *.dfm}

uses Unit1, DM2, F0002, EdtMaster, MNK001, DM3;

{*******************************************************************************
 �ړI:�����{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0001Frm.Button1Click(Sender: TObject);
begin
  begin
  if Mode = 'Add' then EdtMode.Text := '�ǉ�';
  if Mode = 'Chg' then EdtMode.Text := '�ύX';
  if Mode = 'Dsp' then EdtMode.Text := '�Ɖ�';
  end;

  TNCD:=EdtTNCD.Text;                  // �S����CD�ƒS���Җ���DM2�֓n������
  reNAME:=EdtNAME.Text;

  DBGrid1.DataSource.DataSet.Close;    // DBGrid1�̏�����

  DataModule2.OpenTNData(TNCD,reNAME); // �S���Ҍ������J��

end; // �����{�^���̏��������܂�


{*******************************************************************************
 �ړI:�ύX�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0001Frm.Button2Click(Sender: TObject);
var
  frm : TF0002Frm;
begin
  // DBGrid1�Ƀf�[�^���Ȃ��ꍇ���f
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  if DBGrid1.DataSource.DataSet.Active=False then abort;
  if DBGrid1.DataSource.DataSet.IsEmpty then abort;

  ShwNextFrm('Chg');

  Self.Show;             // �Ɖ��ʕ���
  Button1Click(Button1); // DBGrid1�̏�Ԃ��X�V

end; //�ύX�{�^���̏��������܂�

{*******************************************************************************
 �ړI:�I���{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0001Frm.Button3Click(Sender: TObject);
begin
  // ��\���`�F�b�N
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  Close; // ��ʏI��

end; // �I�����������܂�


{*******************************************************************************
 �ړI:�ǉ��{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0001Frm.Button4Click(Sender: TObject);
begin
  ShwNextFrm('Add');
end; // �ǉ��{�^���̏��������܂�

{*******************************************************************************
 �ړI:�폜�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0001Frm.Button5Click(Sender: TObject);
begin
  if DataModule2.ClientDataSetTNMMSP.Active=false then Exit;


  if DataModule2.ClientDataSetTNMMSP.FieldByName('TNSTKB').AsString='D' then
  begin
    MessageDlg('�폜�ς݂ł�(T_T)', mtError, [mbOK], 0);
    Exit;
  end;

  ShwNextFrm('Del');

end;

{*******************************************************************************
 �ړI:���[�h�Ǘ��̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0001Frm.ShwNextFrm(mode: string);
var
  frm : Tform;
  SaveCursor: TCursor; // ���݂̃}�E�X�|�C���^�ێ��p
  rn,pk:Integer;
begin
  with DataModule2.ClientDataSetTNMMSP do
  begin

    if (mode<>'Add') and (Active=false) then Exit;

    if (mode='Chg') or (mode='Del') then
    begin
{      try
      // �r������
        LockRecord('TNMMSP',FieldByName('TNTNCD').AsString,'0','0','0','0',dmUtilYbs.GetComputerNameS,dmUtilYbs.sWrkStn,self.Name,self.Caption );
      except
        on e:Exception do
        // ���ׂĂ̗�O
        begin
          MessageDlg(E.Message, mtError, [mbOK], 0);
          abort;
        end;
      end;//try
  }
    end; // if

    if Active then  rn:=RecNo;

    SaveCursor := Screen.Cursor;        // ���}�E�X�|�C���^��ޔ�
    Screen.Cursor := crHourGlass;       // �����v�ɕύX

    frm := TF0002Frm.create(self,mode); // �S���҃����e��ʂ���

    Screen.Cursor := SaveCursor;        // �ۑ����Ă����}�E�X�|�C���^�ɖ߂�

    frm.ShowModal;                      // ��ʓW�J
    frm.Release;                        // F0001�C���X�^���X�J��

    // �Č���
    if mode<>'Dsp' then
    begin
      SaveCursor := Screen.Cursor;      // ���}�E�X�|�C���^��ޔ�
      Screen.Cursor := crHourGlass;     // �����v�ɕύX

      if DataModule3.FDQryF0002.Active then
        DataModule3.FDQryF0002.Refresh;

      if Active then
      begin
        Refresh;
        if not IsEmpty then
        begin
          if rn<=0 then
            rn:=1
          else
          begin
            if (PacketRecords<rn)and(RecordCount<rn) then
            begin
              pk:=PacketRecords;
              PacketRecords:=rn-RecordCount;
              GetNextPacket;
              PacketRecords:=pk;
            end;
            if RecordCount<rn then rn:=RecordCount;
          end;

          RecNo:=rn;
        end;

      end;

      Screen.Cursor := SaveCursor;      // �ۑ����Ă����}�E�X�|�C���^�ɖ߂�

    end;

  end; // with

end;

end.
