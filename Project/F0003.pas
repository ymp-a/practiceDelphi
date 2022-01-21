unit F0003;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  DBEditUNIC, Vcl.DBCGrids, Vcl.ExtCtrls;

type
  TF0003Frm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    EdtMHIRDT: TDBEditUNIC;
    EdtMHKGDT: TDBEditUNIC;
    EdtMHTKCD: TDBEditUNIC;
    EdtMHTNCD: TDBEditUNIC;
    EdtMHBIKO: TDBEditUNIC;
    EdtMHNO: TDBEditUNIC;
    EdtMHTKNM: TDBEditUNIC;
    DBCtrlGrid1: TDBCtrlGrid;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ChkDel1: TDBCheckBox;
    EdtMTGNO: TDBEditUNIC;
    EdtMTSHCD: TDBEditUNIC;
    EdtMTSHNM: TDBEditUNIC;
    EdtMTTNKA: TDBEditUNIC;
    EdtMTSRYO: TDBEditUNIC;
    EdtMTKIN: TDBEditUNIC;
    EdtMTBIKO: TDBEditUNIC;
    EdtMHGSRO: TDBEditUNIC;
    EdtMHGKIN: TDBEditUNIC;
    Label13: TLabel;
    Label14: TLabel;
    //�X�V�{�^���̏���
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private �錾 }
    //�_���`�F�b�N
    function  LogicalChecOk:Boolean;
  public
    { Public �錾 }
  var
    Mode : String;//���[�h���ʗp�i���g�p�j
  end;

var
  F0003Frm: TF0003Frm;

implementation

{$R *.dfm}

uses DM4, functions, Utilybs;

{*******************************************************************************
 �ړI:�X�V�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0003Frm.Button2Click(Sender: TObject);
begin
//�ǉ����[�h
  Button2.Enabled:=false;//�������̓{�^�����b�N
  Button3.Enabled:=false;//�I���{�^�������b�N
  try
    //LgcChkMsg:=true;
    if LogicalChecOk then
    if MessageDlg('�X�V���������s���܂��B��낵���ł����H',
        mtConfirmation, [mbYes,mbNo], 0) = mrYes then
    begin
//      ALLEditNumChk;
        //�X�V����
      //LgcChkMsg:=false;
      if LogicalChecOk then    //�ēx�m�F(�݌ɓ��̊֌W��)
      begin
        if (Mode = 'Add')or(Mode = 'Cpy') then
          //DbAdd
        else if Mode='Chg' then
          //DbChenge
        else if Mode = 'Del' then
          //DbDelete;
      end;
    end;
  finally
    Button2.Enabled:=true;//�I���{�^�������b�N
    Button3.Enabled:=true;//�{�^�����b�N����
  end;
end;

procedure TF0003Frm.Button3Click(Sender: TObject);
begin
  //��\���`�F�b�N
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;
  //��ʏI��
  Close;
end;

procedure TF0003Frm.FormShow(Sender: TObject);
begin
  DataModule4.ClientDataSetMTHFLP.Close;
  DataModule4.ClientDataSetMTMFLP.Close;
  DataModule4.ClientDataSetMTHFLP.Open;
  DataModule4.ClientDataSetMTMFLP.Open;
end;

function TF0003Frm.LogicalChecOk: Boolean;
begin

  Result :=False;

  if mode='Add' then
    //EdtTNCD.Color := clWindow;

  if mode='Del' then
  begin

    //���Ӑ悪��������폜�֎~
{    with DataModule3.FDQryGene do
    begin
      Close;
      SQL.Clear;
      SQL.Add(' SELECT TOTKCD FROM TOKMSP WHERE TOTNCD=:TNCD AND TOJTCD='''' ');
      ParamByName('TNCD').AsString:=EdtTNCD.Field.AsString;
      Open;
      if not IsEmpty then
      begin
        MessageDlg('�R�Â����Ӑ�(CD:'+FieldByName('TOTKCD').AsString+'�Ȃ�)�����邽�ߍ폜�ł��܂���', mtError, [mbOK], 0);
        Exit;
      end;
    end;
}
    Result:=true;
    exit;
  end;


//  EdtBKCD.Color := clWindow;

  ChkBlank(EdtMHNO,'���χ�');

  //�ǉ����[�h�̏ꍇ���χ��d���`�F�b�N���s���B
{  if (mode='Add') then
  begin
    if TNMMS(EdtTNCD.Field.AsString,true).Exists=true then
    begin
      MessageDlg('���χ����d�����Ă��܂��B', mtError, [mbOk], 0);
      EdtMHNO.SetFocus;
      EdtMHNO.Color := clERR;
      Exit;
    end;
  end;
}
  ChkBlank(EdtMHIRDT,'���ψ˗���');

  ChkBlank(EdtMHKGDT,'���ϊ���');

  ChkBlank(EdtMHTKCD,'���Ӑ�CD');

  ChkBlank(EdtMHTNCD,'�S����CD');


  Result :=True;

end;

end.
