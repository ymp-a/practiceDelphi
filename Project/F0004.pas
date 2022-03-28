unit F0004;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, System.Actions, Vcl.ActnList;

type
  TF0004Frm = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    EdtMHNO: TEdit;
    EdtMHIRDT: TEdit;
    Button1: TButton;
    EdtMode: TEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Panel3: TPanel;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    EdtTKCD: TEdit;
    EdtTNCD: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtMHKGDT: TEdit;
    Label5: TLabel;
    Button6: TButton;
    ActionList1: TActionList;
    F1: TAction;
    F2: TAction;
    F8: TAction;
    F3: TAction;
    F9: TAction;
    F6: TAction;
    procedure Button1Click(Sender: TObject); // �����{�^��
    procedure Button3Click(Sender: TObject); // �I���{�^��
    procedure Button4Click(Sender: TObject); // �ǉ��{�^��
    procedure Button2Click(Sender: TObject); // �ύX�{�^��
    procedure Button5Click(Sender: TObject); // �폜�{�^��
    procedure Button6Click(Sender: TObject); // �\���{�^��
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private �錾 }
var
    bFiest:Boolean;                          //�ŏ������Ăт����Ȃ��̂Łi�r������p�j
    sOpenDATE,SOpenTime:string;
    objOwner:TComponent;                     //��яo�����̃I�u�W�F�N�g��ۑ�
  public
    { Public �錾 }
  var
    Mode:String;                             // ���[�h�Ǘ�
    pNo : integer;                           // ���χ�
    procedure ShwNextFrm(mode: string);      // ���[�h�Ǘ�
  end;

var
  F0004Frm: TF0004Frm;

implementation

{$R *.dfm}

uses DM4, MNK001, Utilybs, functions, F0003, EdtMaster, Datasnap.DBClient;

{*******************************************************************************
 �ړI:�����{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0004Frm.Button1Click(Sender: TObject);
var
  MHNO,TODT,FRDT,TKCD,TNCD:String;
begin
  begin                                             // ���j���[����J�ڂ����ۂ�Mode�Ǘ�
  if Mode = 'Add' then EdtMode.Text := '�ǉ�';
  if Mode = 'Chg' then EdtMode.Text := '�ύX';
  if Mode = 'Dsp' then EdtMode.Text := '�Ɖ�';
  end;

  //�S����CD�ƒS���Җ���DM4�֓n������
  MHNO:=EdtMHNO.Text;                               // ���χ�
  TODT:=EdtMHIRDT.Text;                             // ���ψ˗���
  FRDT:=EdtMHKGDT.Text;                             // ���ϊ���
  TKCD:=EdtTKCD.Text;                               // ���Ӑ�R�[�h
  TNCD:=EdtTNCD.Text;                               // �S���҃R�[�h

  DBGrid1.DataSource.DataSet.Close;                 //DBGrid1�̏�����

  DataModule4.OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD); //���ό������J��

end;

{*******************************************************************************
 �ړI:�ύX�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0004Frm.Button2Click(Sender: TObject);
begin
  ShwNextFrm('Chg');
end;

{*******************************************************************************
 �ړI:�I���{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0004Frm.Button3Click(Sender: TObject);
begin
  //��\���`�F�b�N
  if (Button3.Enabled=false)or(Button3.Visible=false) then abort;

  Close; //��ʏI��
end;

{*******************************************************************************
 �ړI:�ǉ��{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0004Frm.Button4Click(Sender: TObject);
begin
  ShwNextFrm('Add');
end;

{*******************************************************************************
 �ړI:�폜�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0004Frm.Button5Click(Sender: TObject);
begin
  ShwNextFrm('Del');
end;

{*******************************************************************************
 �ړI:�\���{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0004Frm.Button6Click(Sender: TObject);
begin
  ShwNextFrm('Dsp');
end;

{*******************************************************************************
 �ړI:���[�h�Ǘ��̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TF0004Frm.ShwNextFrm(mode: string);
var
  frm : Tform;
  frm3: TF0003Frm;
  SaveCursor: TCursor;   // ���݂̃}�E�X�|�C���^�ێ��p
  rn,pk:Integer;
begin
  with DataModule4.FDQryF0004 do
  begin

    if (mode<>'Add') and (Active=false) then Exit;

    if (mode='Chg') or (mode='Del') then
    begin
      // ���̃\�[�X�R�[�h�ɂ̓��b�N�r�����䂪������
    end;//if

    if Active then  rn:=RecNo;


    SaveCursor := Screen.Cursor;        // ���}�E�X�|�C���^��ޔ�
    Screen.Cursor := crHourGlass;       // �����v�ɕύX
    frm := TF0003Frm.create(self,mode); // ���σ����e��ʂ���
    Screen.Cursor := SaveCursor;        // �ۑ����Ă����}�E�X�|�C���^�ɖ߂�
    frm.ShowModal;                      // ��ʓW�J
    frm.Release;                        // F0003�C���X�^���X�J��

    //�Č���
    if mode<>'Dsp' then
    begin
      SaveCursor := Screen.Cursor;      //���}�E�X�|�C���^��ޔ�
      Screen.Cursor := crHourGlass;     //�����v�ɕύX

      if DataModule4.FDQryF0004.Active then
        DataModule4.FDQryF0004.Refresh; // Qry�C���X�^���X�̉���H

    {  if Active then                   // CDS�ł���PacketRecords�͗��p�ł��Ȃ�
      begin
        Refresh;
        if not IsEmpty then
        begin
          if rn<=0 then
            rn:=1
          else
          begin
            if (FDQryF0004.Records<rn)and(RecordCount<rn) then
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
     }

      Screen.Cursor := SaveCursor;      //�ۑ����Ă����}�E�X�|�C���^�ɖ߂�
    end;

  end; // with

end; // ShwNextFrm�����܂�

{*******************************************************************************
 �ړI: �O���b�h�\�[�g����
 ����:
 �ߒl:
 IndexDefs�̒�`��Datasnap.DBClient�B
 ���я��ύX���CDS�J���O�ɍ��ږ���index�����������邱�ƁBFormClose�̍ŏ��B
*******************************************************************************}
procedure TF0004Frm.DBGrid1TitleClick(Column: TColumn);
var
 sFieldNM :String; //�ޔ��t�B�[���h��
begin
  inherited;

with DBGrid1 do
  begin
    // ���ה�\�����͏�������
    if DataSource.DataSet.Active = False then Exit;

    // �J�����̃t�B�[���h����ޔ�
    sFieldNM := Column.FieldName;

    with (DataSource.DataSet as TClientDataSet) do
    begin
      // �C���f�b�N�X�t�B�[���h�쐬
      if IndexDefs.Count = 0 then
        IndexDefs.Add('aIndex', '', []);



      //----------------------------//
      // ���ׂ̕\��^���ёւ��̐��� //
      //----------------------------//
      if AnsiPos('��', Column.Title.Caption) <> 0 then
      begin
        // ----- �~���� -----
        // �\��ݒ�
        Column.Title.Caption := StringReplace(Column.Title.Caption, '��', '', [rfReplaceAll]);
        Column.Title.Caption := Column.Title.Caption + '��';

        // �~���t�B�[���h�̐ݒ�
        if IndexDefs[0].DescFields = '' then
          IndexDefs[0].DescFields := sFieldNM
        else
          IndexDefs[0].DescFields := IndexDefs[0].DescFields + ';' + sFieldNM;

        // �C���f�b�N�X�t�B�[���h�̃I�v�V����������
        IndexDefs[0].Options := [];
      end
      else if AnsiPos('��', Column.Title.Caption) <> 0 then
      begin
        // ----- �ݒ���� -----
        // �\��ݒ�
        Column.Title.Caption := StringReplace(Column.Title.Caption, '��', '', [rfReplaceAll]);
        // ���я��̐ݒ�����i�~���t�B�[���h�j
        if AnsiPos(sFieldNM + ';', IndexDefs[0].DescFields) <> 0 then
          sFieldNM := sFieldNM + ';'
        else if AnsiPos(';' + sFieldNM, IndexDefs[0].DescFields) <> 0 then
          sFieldNM := ';' + sFieldNM;

        IndexDefs[0].DescFields := StringReplace(IndexDefs[0].DescFields, sFieldNM, '', [rfReplaceAll]);
        // �J�����̃t�B�[���h�����Ď擾
        sFieldNM := Column.FieldName;

        // ���я��̐ݒ�����i�����t�B�[���h�j
        if AnsiPos(sFieldNM + ';', IndexDefs[0].Fields) <> 0 then
          sFieldNM := sFieldNM + ';'
        else if AnsiPos(';' + sFieldNM, IndexDefs[0].Fields) <> 0 then
          sFieldNM := ';' + sFieldNM;

        IndexDefs[0].Fields := StringReplace(IndexDefs[0].Fields, sFieldNM, '',[rfReplaceAll]);
        // ���ёւ����S�����̏ꍇ�C���f�b�N�X���N���A
        if IndexDefs[0].Fields = '' then
          IndexName := '';

        // �C���f�b�N�X�t�B�[���h�̃I�v�V����������
        IndexDefs[0].Options := [];
      end
      else
      begin
        // ----- ������ -----
        // �\��ݒ�
        Column.Title.Caption := Column.Title.Caption + '��';

        // �����t�B�[���h�̐ݒ�
        if IndexDefs[0].Fields = '' then
          IndexDefs[0].Fields := sFieldNM
        else
          IndexDefs[0].Fields := IndexDefs[0].Fields + ';' + sFieldNM;

        // �C���f�b�N�X�t�B�[���h�̃I�v�V����������
        IndexDefs[0].Options := [];
        // �C���f�b�N�X���ݒ�
        if IndexName = '' then IndexName := 'aIndex';
      end;

      //�f�[�^���J�����܂܃\�[�g��K�p�����邽��Index���폜���čĐݒ�
      DeleteIndex('aIndex');
      IndexName := 'aIndex';
      First;
    end;
  end;
end;

procedure TF0004Frm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  frm:TForm;
  i: Integer;
begin
  // ���ה�\�����͏�������
    if DBgrid1.DataSource.DataSet.Active = False then Exit;
  // ���ږ��̏�����
    for i:=0 to (DBGrid1.Columns.Count)-1 do
    begin
      if AnsiPos('��', DBGrid1.Columns[i].Title.Caption) <> 0 then
        DBGrid1.Columns[i].Title.Caption := StringReplace( DBGrid1.Columns[i].Title.Caption, '��', '', [rfReplaceAll]);
      if AnsiPos('��', DBGrid1.Columns[i].Title.Caption) <> 0 then
        DBGrid1.Columns[i].Title.Caption := StringReplace( DBGrid1.Columns[i].Title.Caption, '��', '', [rfReplaceAll]);
    end;
  // index�̏�����
    with (DBgrid1.DataSource.DataSet as TClientDataSet) do
    begin
    if  IndexName = 'aIndex' then
     DeleteIndex('aIndex');
    end;

  inherited;

  with DataModule4 do
  begin
    FDQryF0004.Close;
    DataSrcF0004.DataSet.Close;
  end;

end;

end.
