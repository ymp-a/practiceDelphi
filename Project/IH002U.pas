unit IH002U;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DspTran, Data.DB, System.Actions,
  Vcl.ActnList, PageTop, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Datasnap.DBClient, functions, Vcl.Mask, MaskEditDate, FireDAC.Comp.Client;

type
  TIH002 = class(TDspTranFrm)
    Label1: TLabel;
    EdtMHNO: TEdit;
    Label3: TLabel;
    EdtTKCD: TEdit;
    Label2: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    EdtTNCD: TEdit;
    EdtMHIRDT: TMaskEditDate;
    EdtMHKGDT: TMaskEditDate;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);      // �����{�^��
    procedure Button2Click(Sender: TObject);      // �ǉ��{�^��
    procedure Button3Click(Sender: TObject);      // �ύX�{�^��
    procedure Button4Click(Sender: TObject);      // �폜�{�^��
    procedure Button7Click(Sender: TObject);      // �R�s�[�{�^��
    procedure Button8Click(Sender: TObject);      // �\���{�^��
    procedure DBGrid1TitleClick(Column: TColumn); // Grid�\�[�g�@�\
    procedure EdtTNCDDblClick(Sender: TObject);   // TNCD�}�X�^����
    procedure EdtTNCDExit(Sender: TObject);       // �S���Җ������}��
  private
    { Private �錾 }
  public
    { Public �錾 }
  var
    pNo : integer;                                // ���χ�
    procedure ShwNextFrm(mode: string);           // ���[�h�Ǘ�
  end;

var
  IH002: TIH002;

implementation

{$R *.dfm}

uses DM4, IH001U, IH004MSU, DM3;

{===============================================================================
��ʓW�J���ɐݒ肷��C�x���g
===============================================================================}
procedure TIH002.FormShow(Sender: TObject);
begin
  inherited;
  Button1Click(Sender); // �����{�^���^�b�v
  EdtMHNO.SetFocus;     // ��ʓW�J���̏����t�H�[�J�X�w��
end;

{*******************************************************************************
 �ړI:���[�h�Ǘ��̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH002.ShwNextFrm(mode: string);
var
  frm : Tform;
  frm3: TIH001;
  SaveCursor: TCursor;   // ���݂̃}�E�X�|�C���^�ێ��p
  rn,pk:Integer;
begin
  with DataModule4.CDS_IH002 do
  begin

    if (mode<>'Add') and (Active=false) then Exit;

    if (mode='Chg') or (mode='Del') then
    begin
      // ���̃\�[�X�R�[�h�ɂ̓��b�N�r�����䂪������
    end;

    if Active then  rn:=RecNo;          // CDS����Ƃ��A�N�e�B�u���R�[�h�ԍ��i�J�����g�s�j��rn�֊i�[����


    SaveCursor := Screen.Cursor;        // ���}�E�X�|�C���^��ޔ�
    Screen.Cursor := crHourGlass;       // �����v�ɕύX
    frm := TIH001.create(self,mode);    // ���σ����e��ʂ���
    Screen.Cursor := SaveCursor;        // �ۑ����Ă����}�E�X�|�C���^�ɖ߂�
    frm.ShowModal;                      // ��ʓW�J
    frm.Release;                        // TIH001��ʃC���X�^���X�J��

    //�Č����i���̍s�I���̂܂܍ĕ`�ʂ��邽�߂̏����j
    if mode<>'Dsp' then
    begin
      SaveCursor := Screen.Cursor;      //���}�E�X�|�C���^��ޔ�
      Screen.Cursor := crHourGlass;     //�����v�ɕύX

     Button1Click(self);                // CDS�ADBGrid1�f�[�^�I�[�v��(�ŐV���ɍX�V)
     if Active then                     // CDS�ł���PacketRecords�͗��p�ł��Ȃ�
      begin
        Refresh;                        // CDS_IH002�f�[�^���ŐV��
        if not IsEmpty then             // CDS�f�[�^�����݂���Ƃ�
        begin
          if rn<=0 then                 // ����i�I���s���Ȃ��ꍇ�j
            rn:=1                       // 1���Z�b�g
          else
          begin
            if (PacketRecords<rn)and(RecordCount<rn) then // �A�N�e�B�u���R�[�h51�ȏォ�ǉ��o�^��̏ꍇ
            begin
              pk:=PacketRecords;             // pk�ɍ���PacketRecords�i�p�����w���50�j�i�[
              PacketRecords:=rn-RecordCount; // �������̂���PacketRecords���Đݒ�i�p�P�b�g�ɓ��Ԃ����R�[�h�ő吔���w��j
              GetNextPacket;                 // Data�ɒǉ����ꂽ���R�[�h����Ԃ��B�ߒl0�Ȃ�S���R�[�h���擾�ρB���̏�����RecordCount���ω�����i��{rn�Ɠ����l�ɂȂ��Ă���j
              PacketRecords:=pk;             // PacketRecords��50��߂�
            end;
            if RecordCount<rn then rn:=RecordCount;       // rn�����̂Ƃ���RecordCount�ɂ��킹��i��O�p�^�[�����s���j
          end;

          RecNo:=rn;                                      // ���O�܂ō�Ƃ��Ă��I���s���w��
        end;
      end;


      Screen.Cursor := SaveCursor;      //�ۑ����Ă����}�E�X�|�C���^�ɖ߂�
    end;

  end; // with

end; // ShwNextFrm�����܂�

{*******************************************************************************
 �ړI:�����{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH002.Button1Click(Sender: TObject);
var
  MHNO,TODT,FRDT,TKCD,TNCD:String;
begin
  inherited;

  //�S����CD�ƒS���Җ���DM4�֓n������
  MHNO:=EdtMHNO.Text;                               // ���χ�
  TODT:=EdtMHIRDT.EditText;                         // ���ψ˗���
  FRDT:=EdtMHKGDT.EditText;                         // ���ϊ���
  TKCD:=EdtTKCD.Text;                               // ���Ӑ�R�[�h
  TNCD:=EdtTNCD.Text;                               // �S���҃R�[�h

  DBGrid1.DataSource.DataSet.Close;                 //DBGrid1�̏�����

  DataModule4.OpenIH002MHData(MHNO,TODT,FRDT,TKCD,TNCD); //���ό������J��

  DBGrid1.DataSource.DataSet.Open;                  // Grid1�̓W�J
end;

{*******************************************************************************
 �ړI:�ǉ��{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH002.Button2Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Add');
end;

{*******************************************************************************
 �ړI:�ύX�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH002.Button3Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Chg');
end;

{*******************************************************************************
 �ړI:�폜�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH002.Button4Click(Sender: TObject);
begin
  inherited;
  // �폜�ς̍s�̓A���[�g��\������
  if DataModule4.CDS_IH002.FieldByName('MHJTCD').AsString='D' then
    begin
    MessageDlg('���łɍ폜����Ă��܂��B�i�L�E�ցE�M�j', mtError, [mbOk], 0);
    Exit;
    end;
  ShwNextFrm('Del');
end;

{*******************************************************************************
 �ړI:copy�{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH002.Button7Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Cpy');
end;

{*******************************************************************************
 �ړI:�\���{�^���������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH002.Button8Click(Sender: TObject);
begin
  inherited;
  ShwNextFrm('Dsp');
end;

{*******************************************************************************
 �ړI:�S���҃}�X�^����
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH002.EdtTNCDDblClick(Sender: TObject);
Var
  frm : TForm;
begin
  // �ǎ��p���͏I������
  if (Sender as TEdit).ReadOnly=true then Exit;

  // �S���Ҍ������쐬
  frm := TIH004MS.Create(Self);
  // �S����CD�����͂���Ă���ΒS��������ʂ�EdtTNCD�e�L�X�g�ɃZ�b�g
  (frm as TIH004MS).EdtTNCD.text:=(Sender as TEdit).Text;

  // http://kakinotane.s7.xrea.com/delphi/d2/d034.html �i�ڍׁj
  // �S�������I�����̏���
  if frm.showmodal = mrok then
  begin
    // �I�����A�t�B�[���h�ɒl���Z�b�g  �Ȃ� �v���p�e�BSltTNCD ���g���Ă���H
    (Sender as TEdit).Text :=(frm as TIH004MS).SltTNCD;
    // TAB�L�[�������悤�ɃJ�[�\�������֓������w���H
    SendMessage(Handle, WM_NEXTDLGCTL, 0, 0);
  end;
  frm.Release;

end;

{===============================================================================
�S����CDExit���̃C�x���g ���͂���TNCD�����݂�����S������\������B
===============================================================================}
procedure TIH002.EdtTNCDExit(Sender: TObject);
var
  qry: TFDQuery;
begin
  qry:=DataModule3.FDQryGene;
  qry.Close;
  qry.SQL.Clear;
  qry.Params.Clear;

  qry.SQL.Add('select * from tnmmsp');
  qry.SQL.Add(' where tntncd=:cd');
  qry.SQL.Add('and tnstkb <> ''D'' ');
  qry.SQL.Add('');
  qry.ParamByName('cd').AsInteger:=StrToIntDef(EdtTNCD.Text,-1); // EdtTNCD.Text��Int�ϊ��ł��Ȃ��Ƃ�-1����
  qry.Open();

  if qry.IsEmpty then EdtTNCD.Text := '';  // �L����TNCD�ȊO�Ȃ���̓t�H�[�����N���A

  Label6.Caption:=qry.FieldByName('TNNAME').AsString; // �S���Җ���}��
  qry.close;

end;

{*******************************************************************************
 �ړI: �O���b�h�\�[�g����
 ����:
 �ߒl:
 IndexDefs�̒�`��Datasnap.DBClient�B
 ���я��ύX���CDS�J���O�ɍ��ږ���index�����������邱�ƁBFormClose�̍ŏ��B
*******************************************************************************}
procedure TIH002.DBGrid1TitleClick(Column: TColumn);
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

{===============================================================================
��ʏI�����ɐݒ肷��C�x���g
===============================================================================}
procedure TIH002.FormClose(Sender: TObject; var Action: TCloseAction);
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

  with DataModule4 do
  begin
    FDQryF0004.Close;
    DataSrcF0004.DataSet.Close;
    DBGrid1.DataSource.DataSet.close();
  end;

end;

{$WARN GARBAGE OFF} // <-- end.�ȉ��ɃR�����g�ǉ�
end.

// FormClose��inherited�O��CDSindex���������s���B
// ���inherited��ʉ߂�����Ə��������ł��Ȃ������悤�ȋC������B
// Button1Click(Sender);��Button1Click(self);��Button1Click(Button1);�̈Ⴂ���L�Q�Ɓ�
// https://yoshikawa-ybs.cybozu.com/o/ag.cgi?page=ReportView&rRID=1363456&rr=DR&cp=rp&sp=
