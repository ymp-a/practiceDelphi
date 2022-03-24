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
    EdtMode: TEdit;
    Button4: TButton;
    Button5: TButton;
    //�I���{�^��
    procedure Button3Click(Sender: TObject);
    //�����{�^��
    procedure Button1Click(Sender: TObject);
    //�ύX�{�^��
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private �錾 }

  public
    { Public �錾 }
    var
      TNCD:String;
      reNAME:String;
      Mode:String;
  // ���[�h�Ǘ�
    procedure ShwNextFrm(mode: string);
  end;

var
  F0001Frm: TF0001Frm;

implementation

{$R *.dfm}

uses Unit1, DM2, F0002, EdtMaster, MNK001, DM3;

//�����{�^���̏���
procedure TF0001Frm.Button1Click(Sender: TObject);
begin
  begin
  if Mode = 'Add' then EdtMode.Text := '�ǉ�';
  if Mode = 'Chg' then EdtMode.Text := '�ύX';
  if Mode = 'Dsp' then EdtMode.Text := '�Ɖ�';
  end;

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
  frm : TF0002Frm;
begin
  //DBGrid1�Ƀf�[�^���Ȃ��ꍇ���f
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  if DBGrid1.DataSource.DataSet.Active=False then abort;
  if DBGrid1.DataSource.DataSet.IsEmpty then abort;

  ShwNextFrm('Chg');

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
end; // �I�����������܂�


// �ǉ��{�^���̏���
procedure TF0001Frm.Button4Click(Sender: TObject);
begin
  ShwNextFrm('Add');
end; // �ǉ��{�^���̏��������܂�

// �폜�{�^���̏���
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

procedure TF0001Frm.ShwNextFrm(mode: string);
var
  frm : Tform;
  SaveCursor: TCursor;   // ���݂̃}�E�X�|�C���^�ێ��p
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
    end;//if

    if Active then  rn:=RecNo;

    // ���}�E�X�|�C���^��ޔ�
    SaveCursor := Screen.Cursor;
    // �����v�ɕύX
    Screen.Cursor := crHourGlass;

    frm := TF0002Frm.create(self,mode); // �S���҃����e��ʂ���

    // �ۑ����Ă����}�E�X�|�C���^�ɖ߂�
    Screen.Cursor := SaveCursor;

    frm.ShowModal; // ��ʓW�J
    frm.Release;   // F0001�C���X�^���X�J��

    //�Č���
    if mode<>'Dsp' then
    begin    //���}�E�X�|�C���^��ޔ�
      SaveCursor := Screen.Cursor;
      //�����v�ɕύX
      Screen.Cursor := crHourGlass;

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

      //�ۑ����Ă����}�E�X�|�C���^�ɖ߂�
      Screen.Cursor := SaveCursor;
    end;

  end;//with
end;
end.
