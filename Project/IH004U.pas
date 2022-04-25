unit IH004U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DspMaster, Data.DB, System.Actions,
  Vcl.ActnList, PageTop, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Datasnap.DBClient;

type
  TIH004 = class(TDspMasterFrm)
    EdtTNCD: TEdit;
    Label1: TLabel;
    EdtNAME: TEdit;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn); // Grid�\�[�g�@�\
  private
    { Private �錾 }
  public
    { Public �錾 }
    procedure ShwNextFrm(mode: string);      // ���[�h�Ǘ�
  end;

var
  IH004: TIH004;

implementation

{$R *.dfm}

uses DM2, IH003U;

procedure TIH004.Button1Click(Sender: TObject);
{*******************************************************************************
 �ړI:�S���҃}�X�^�Ƀf�[�^�I�[�v��
 ����:
 �ߒl:
*******************************************************************************}
begin
  inherited;

  DBGrid1.DataSource.DataSet.Close;    // DBGrid1�̏�����

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
//        andFlg:=true;                       // ���͎��t���O�I��
      end;

      if EdtNAME.Text<>'' then                    // �S���Җ����͎��̏���
      begin
        SQL.Add(' AND TNNAME LIKE :NAME ');                      // TNNAME LIKE��%���͖�%��SQLString�ɔ��f����
        ParamByName('NAME').AsWideString :='%' +EdtNAME.Text+ '%'; // ������v�̓��͖���'NAME'�֑������
//        andFlg:=true;                                        // ���͎��t���O�I��
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

  DBGrid1.DataSource.DataSet.Open;

end;// OpenTNData�����܂�


procedure TIH004.Button2Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Add');
  Button1Click(Sender); // �ŐV���ɍX�V
end;

procedure TIH004.Button3Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Chg');
  Button1Click(Sender); // �ŐV���ɍX�V
end;

procedure TIH004.Button4Click(Sender: TObject);
begin
  inherited;
  // �폜�ς̍s�̓A���[�g��\������
  if DataModule2.CDS_IH004.FieldByName('TNSTKB').AsString='D' then
    begin
    MessageDlg('���łɍ폜����Ă��܂��B�i�L�E�ցE�M�j', mtError, [mbOk], 0);
    Exit;
    end;
  ShwNextFrm('Del');
  Button1Click(Sender); // �ŐV���ɍX�V
end;

procedure TIH004.FormClose(Sender: TObject; var Action: TCloseAction);
var
  frm:TForm;
  i: Integer;
begin
  // ���ה�\�����͏�������
    if DBgrid1.DataSource.DataSet.Active = False then Exit;

    with (DBGrid1.DataSource.DataSet as TClientDataSet) do
    begin
      // IndexDefs�����݂���Ƃ�
      if IndexDefs.count <> 0 then
      begin
        // ���ږ��̏�����
        for i:=0 to (DBGrid1.Columns.Count)-1 do
        begin
          if AnsiPos('��', DBGrid1.Columns[i].Title.Caption) <> 0 then
            DBGrid1.Columns[i].Title.Caption := StringReplace( DBGrid1.Columns[i].Title.Caption, '��', '', [rfReplaceAll]);
          if AnsiPos('��', DBGrid1.Columns[i].Title.Caption) <> 0 then
            DBGrid1.Columns[i].Title.Caption := StringReplace( DBGrid1.Columns[i].Title.Caption, '��', '', [rfReplaceAll]);
        end;

        // indexDefs[0]�̃t�B�[���h��������
        // �����t�B�[���h�̏�����
        if IndexDefs[0].Fields <> '' then IndexDefs[0].Fields := '';
        // �~���t�B�[���h�̏�����
        if IndexDefs[0].DescFields <> '' then IndexDefs[0].DescFields := '';
        // IndexName��������
        if IndexName = 'aIndex' then DeleteIndex('aIndex');
      end;
    end;
  inherited;
  with DataModule2 do
  begin
    FDQryIH004.Close;
    CDS_IH004.Close;
  end;
end;

procedure TIH004.FormShow(Sender: TObject);
begin
  inherited;
  Button1Click(Self);
  EdtTNCD.SetFocus;
end;

{*******************************************************************************
 �ړI:���[�h�Ǘ��̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH004.ShwNextFrm(mode: string);
var
  frm : Tform;
  SaveCursor: TCursor;   // ���݂̃}�E�X�|�C���^�ێ��p
  rn,pk:Integer;
begin
  with DataModule2.CDS_IH004 do
  begin

    if (mode<>'Add') and (Active=false) then Exit;

    if (mode='Chg') or (mode='Del') then
    begin
      // ���̃\�[�X�R�[�h�ɂ̓��b�N�r�����䂪������
    end;//if

    if Active then  rn:=RecNo;


    SaveCursor := Screen.Cursor;        // ���}�E�X�|�C���^��ޔ�
    Screen.Cursor := crHourGlass;       // �����v�ɕύX
    frm := TIH003.create(self,mode);    // �S�������e��ʂ���
    Screen.Cursor := SaveCursor;        // �ۑ����Ă����}�E�X�|�C���^�ɖ߂�
    frm.ShowModal;                      // ��ʓW�J
    frm.Release;                        // TIH003�C���X�^���X�J��

    //�Č���
    if mode<>'Dsp' then
    begin
      SaveCursor := Screen.Cursor;      //���}�E�X�|�C���^��ޔ�
      Screen.Cursor := crHourGlass;     //�����v�ɕύX

      if Active then
        Refresh; // Qry�C���X�^���X�̉���H

     if Active then                   // CDS�ł���PacketRecords�͗��p�ł��Ȃ�
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
procedure TIH004.DBGrid1TitleClick(Column: TColumn);
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
      // ���ł����index�l���Ԃ�B���ȊO�ł����0�Ȃ̂Ł��̂Ƃ��ȉ��̏������s��
      if AnsiPos('��', Column.Title.Caption) <> 0 then
      begin
        // ----- �~���� -----
        // �\��ݒ� �Â�����''�ɒu��
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
      // ���̂Ƃ��ȉ��������s��
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

end.
