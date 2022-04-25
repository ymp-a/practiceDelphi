unit DM4;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Datasnap.Provider, Data.DB, Datasnap.DBClient,MidasLib,StrUtils;

type
  TDataModule4 = class(TDataModule)
    DataSrcMTHFLP: TDataSource;
    ClientDataSetMTHFLP: TClientDataSet;
    DataSetProMTHFLP: TDataSetProvider;
    FDQryMTHFLP: TFDQuery;
    FDQryMTMFLP: TFDQuery;
    DataSetProMTMFLP: TDataSetProvider;
    ClientDataSetMTMFLP: TClientDataSet;
    DataSrcMTMFLP: TDataSource;
    FDQryMTHFLPMHNO: TIntegerField;
    FDQryMTHFLPMHIRDT: TDateField;
    FDQryMTHFLPMHKGDT: TDateField;
    FDQryMTHFLPMHTKCD: TStringField;
    FDQryMTHFLPMHTKNM: TStringField;
    FDQryMTHFLPMHGSRO: TIntegerField;
    FDQryMTHFLPMHGKIN: TIntegerField;
    FDQryMTHFLPMHTNCD: TIntegerField;
    FDQryMTHFLPMHBIKO: TStringField;
    FDQryMTHFLPMHJTCD: TStringField;
    FDQryMTMFLPMTNO: TIntegerField;
    FDQryMTMFLPMTGNO: TIntegerField;
    FDQryMTMFLPMTSHCD: TStringField;
    FDQryMTMFLPMTSHNM: TStringField;
    FDQryMTMFLPMTTNKA: TBCDField;
    FDQryMTMFLPMTSRYO: TIntegerField;
    FDQryMTMFLPMTKIN: TIntegerField;
    FDQryMTMFLPMTBIKO: TStringField;
    FDQryMTMFLPMTJTCD: TStringField;
    ClientDataSetMTHFLPMHNO: TIntegerField;
    ClientDataSetMTHFLPMHIRDT: TDateField;
    ClientDataSetMTHFLPMHKGDT: TDateField;
    ClientDataSetMTHFLPMHTKCD: TStringField;
    ClientDataSetMTHFLPMHTKNM: TStringField;
    ClientDataSetMTHFLPMHGSRO: TIntegerField;
    ClientDataSetMTHFLPMHGKIN: TIntegerField;
    ClientDataSetMTHFLPMHTNCD: TIntegerField;
    ClientDataSetMTHFLPMHBIKO: TStringField;
    ClientDataSetMTHFLPMHJTCD: TStringField;
    ClientDataSetMTMFLPMTNO: TIntegerField;
    ClientDataSetMTMFLPMTGNO: TIntegerField;
    ClientDataSetMTMFLPMTSHCD: TStringField;
    ClientDataSetMTMFLPMTSHNM: TStringField;
    ClientDataSetMTMFLPMTTNKA: TBCDField;
    ClientDataSetMTMFLPMTSRYO: TIntegerField;
    ClientDataSetMTMFLPMTKIN: TIntegerField;
    ClientDataSetMTMFLPMTBIKO: TStringField;
    ClientDataSetMTMFLPMTJTCD: TStringField;
    FDQryF0004: TFDQuery;
    IntegerField1: TIntegerField;
    DateField1: TDateField;
    DateField2: TDateField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    DataSrcF0004: TDataSource;
    ClientDataSetMTMFLPdataJTCD: TBooleanField;
    ClientDataSetMTMFLPsumSRYO: TAggregateField;
    ClientDataSetMTMFLPsumKIN: TAggregateField;
    FDQryF0004TNTNCD: TIntegerField;
    FDQryF0004TNBKCD: TIntegerField;
    FDQryF0004TNPASS: TVarBytesField;
    FDQryF0004TNNAME: TStringField;
    FDQryF0004TNKGKB: TStringField;
    FDQryF0004TNSTKB: TStringField;
    FDQryF0004TNPWLA: TDateField;
    FDQryF0004TNCRDT: TDateField;
    FDQryF0004TNCRTM: TTimeField;
    FDQryF0004TNCRPG: TStringField;
    FDQryF0004TNCRWS: TStringField;
    FDQryF0004TNCRUS: TStringField;
    FDQryF0004TNUPDT: TDateField;
    FDQryF0004TNUPTM: TTimeField;
    FDQryF0004TNUPPG: TStringField;
    FDQryF0004TNUPWS: TStringField;
    FDQryF0004TNUPUS: TStringField;
    FDQryF0004TNJTCD: TStringField;
    DataSetProF0004: TDataSetProvider;
    ClientDataSetF0004: TClientDataSet;
    ClientDataSetF0004MHNO: TIntegerField;
    ClientDataSetF0004MHIRDT: TDateField;
    ClientDataSetF0004MHKGDT: TDateField;
    ClientDataSetF0004MHTKCD: TStringField;
    ClientDataSetF0004MHTKNM: TStringField;
    ClientDataSetF0004MHGSRO: TIntegerField;
    ClientDataSetF0004MHGKIN: TIntegerField;
    ClientDataSetF0004MHTNCD: TIntegerField;
    ClientDataSetF0004MHBIKO: TStringField;
    ClientDataSetF0004MHJTCD: TStringField;
    ClientDataSetF0004TNTNCD: TIntegerField;
    ClientDataSetF0004TNBKCD: TIntegerField;
    ClientDataSetF0004TNPASS: TVarBytesField;
    ClientDataSetF0004TNNAME: TStringField;
    ClientDataSetF0004TNKGKB: TStringField;
    ClientDataSetF0004TNSTKB: TStringField;
    ClientDataSetF0004TNPWLA: TDateField;
    ClientDataSetF0004TNCRDT: TDateField;
    ClientDataSetF0004TNCRTM: TTimeField;
    ClientDataSetF0004TNCRPG: TStringField;
    ClientDataSetF0004TNCRWS: TStringField;
    ClientDataSetF0004TNCRUS: TStringField;
    ClientDataSetF0004TNUPDT: TDateField;
    ClientDataSetF0004TNUPTM: TTimeField;
    ClientDataSetF0004TNUPPG: TStringField;
    ClientDataSetF0004TNUPWS: TStringField;
    ClientDataSetF0004TNUPUS: TStringField;
    ClientDataSetF0004TNJTCD: TStringField;
    DataSrc_IH001_MTH: TDataSource;
    CDS_IH001_MTH: TClientDataSet;
    IntegerField5: TIntegerField;
    DateField3: TDateField;
    DateField4: TDateField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField6: TIntegerField;
    IntegerField7: TIntegerField;
    IntegerField8: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    DataSetProIH001_MTH: TDataSetProvider;
    IH001_MTH: TFDQuery;
    IntegerField9: TIntegerField;
    DateField5: TDateField;
    DateField6: TDateField;
    StringField9: TStringField;
    StringField10: TStringField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    IntegerField12: TIntegerField;
    StringField11: TStringField;
    StringField12: TStringField;
    IH001_MTM: TFDQuery;
    IntegerField13: TIntegerField;
    IntegerField14: TIntegerField;
    StringField13: TStringField;
    StringField14: TStringField;
    BCDField1: TBCDField;
    IntegerField15: TIntegerField;
    IntegerField16: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    DataSetProIH001_MTM: TDataSetProvider;
    CDS_IH001_MTM: TClientDataSet;
    IntegerField17: TIntegerField;
    IntegerField18: TIntegerField;
    StringField17: TStringField;
    StringField18: TStringField;
    BCDField2: TBCDField;
    IntegerField19: TIntegerField;
    IntegerField20: TIntegerField;
    StringField19: TStringField;
    StringField20: TStringField;
    BooleanField1: TBooleanField;
    AggregateField1: TAggregateField;
    AggregateField2: TAggregateField;
    DataSrc_IH001_MTM: TDataSource;
    FDQryIH002: TFDQuery;
    IntegerField21: TIntegerField;
    DateField7: TDateField;
    DateField8: TDateField;
    StringField21: TStringField;
    StringField22: TStringField;
    IntegerField22: TIntegerField;
    IntegerField23: TIntegerField;
    IntegerField24: TIntegerField;
    StringField23: TStringField;
    StringField24: TStringField;
    IntegerField25: TIntegerField;
    IntegerField26: TIntegerField;
    VarBytesField1: TVarBytesField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    DateField9: TDateField;
    DateField10: TDateField;
    TimeField1: TTimeField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    DateField11: TDateField;
    TimeField2: TTimeField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    DataSrc_IH002: TDataSource;
    DataSetProIH002: TDataSetProvider;
    CDS_IH002: TClientDataSet;
    IntegerField27: TIntegerField;
    DateField12: TDateField;
    DateField13: TDateField;
    StringField35: TStringField;
    StringField36: TStringField;
    IntegerField28: TIntegerField;
    IntegerField29: TIntegerField;
    IntegerField30: TIntegerField;
    StringField37: TStringField;
    StringField38: TStringField;
    IntegerField31: TIntegerField;
    IntegerField32: TIntegerField;
    VarBytesField2: TVarBytesField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    DateField14: TDateField;
    DateField15: TDateField;
    TimeField3: TTimeField;
    StringField42: TStringField;
    StringField43: TStringField;
    StringField44: TStringField;
    DateField16: TDateField;
    TimeField4: TTimeField;
    StringField45: TStringField;
    StringField46: TStringField;
    StringField47: TStringField;
    StringField48: TStringField;
    FDQryGene: TFDQuery;
    DataSource4: TDataSource;
    CDS_IH001_MTMdelflag: TIntegerField;
    CDS_IH001_MTMmSRYO: TIntegerField;
    CDS_IH001_MTMmKIN: TIntegerField;
    // ClientDataSet�̓��t�t�B�[���h��OnSetText�C�x���g�ɒǉ�����
    procedure ClientDataSetTDateFieldSetText(Sender: TField; // ���t���̓`�F�b�N
      const Text: string);
    function DateFilldSetText(str:string):string;            // ���t�`���ɕϊ�
    //����m
  type dMTM = Record
    Exists :Boolean;
    MHNO:string;          //����CD
    JTCD:string;          //�g�p��~�敪
  end;
  private
    { Private �錾 }
  public
    { Public �錾 }

    procedure OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD: String); // ���σf�[�^�I�[�v��
    procedure OpenIH002MHData(MHNO,TODT,FRDT,TKCD,TNCD: String); // ���σf�[�^�I�[�v��
    function MTHMS(MHNO:string;IncD:boolean=false): dMTM; // ���χ��`�F�b�N
    function MHTNO(): dMTM; // ����No��Last+1�̔ԍ���ԋp
  end;

var
  DataModule4: TDataModule4;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DM2, Utilybs;

{$R *.dfm}

{*******************************************************************************
 �ړI:���σf�[�^�I�[�v�� IH002�p
 ����:
 �ߒl:
*******************************************************************************}
procedure TDataModule4.OpenIH002MHData(MHNO,TODT,FRDT,TKCD,TNCD: String);
var
  andFlg:boolean; // ���̓t���O��ݒ�
  qry:TFDQuery;
  cds:TClientDataSet;
begin
  andFlg:=false;  // �t���O������

  qry:=FDQryIH002;
  cds:=CDS_IH002;

  with DataModule4 do
  begin
    cds.Close; // CSDIH002�̏�����

    qry.Close; // FDQryIH002�̏�����
    qry.SQL.Clear;        // SQL��������
    // ��������SQL����
    qry.SQL.Add(' SELECT * FROM MTHFLP  ');
    qry.SQL.Add(' LEFT JOIN TNMMSP ON TNTNCD = MHTNCD  ');
   // SQL.Add(' WHERE MHJTCD <> ''D'' '); // 'D'���\��������

    if MHNO<>'' then                          // ����NO���͎��̏���
    begin
      qry.SQL.Add('WHERE MHNO = :MHNO ');
      qry.ParamByName('MHNO').AsString:=MHNO;
      andFlg:=true;                           // ���͎��t���O�I��
    end;
                                              // Copy(TODT,1,4)��2022/04/22��2022���������邩�`�F�b�N���Ă�
    if StrToIntDef(Copy(TODT,1,4),0)<>0 then  // ���ψ˗������͎��̏���
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHIRDT = :TODT');
      qry.ParamByName('TODT').AsString:=TODT; // ���͂����S����CD��'TNCD'�ɑ������
      andFlg:=true;                           // ���͎��t���O�I��
    end;

    if StrToIntDef(Copy(FRDT,1,4),0)<>0 then  // ���ϊ������͎��̏���
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHKGDT = :FRDT');
      qry.ParamByName('FRDT').AsString:=FRDT; // ���͂����S����CD��'TNCD'�ɑ������
      andFlg:=true;                           // ���͎��t���O�I��
    end;

    if TKCD<>'' then                          // ���Ӑ���͎��̏���
    begin
    if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHTKCD = :TKCD');
      qry.ParamByName('TKCD').AsString:=TKCD; // ���͂����S����CD��'TNCD'�ɑ������
      andFlg:=true;                           // ���͎��t���O�I��
    end;

    if TNCD<>'' then                          // �S����CD���͎��̏���
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('TNTNCD = :TNCD ');         // TNTNCD�ɓ��͂����S����CD��������
      qry.ParamByName('TNCD').AsString:=TNCD; // ���͂����S����CD��'TNCD'�ɑ������
      andFlg:=true;                           // ���͎��t���O�I��
    end;

    qry.SQL.Add(' ORDER BY MHNO ');           // ����

    qry.Open;                                 // SQL�����s
    cds.Open;                                 // CDS�J�n



    // �Ώۃf�[�^�����݂��Ȃ��ꍇ�A�f�[�^�Z�b�g����ďI��
    if cds.IsEmpty then
    begin
      cds.Close;
      raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
    end;

  end;

end; // OpenTNData�����܂�

{*******************************************************************************
 �ړI:���σf�[�^�I�[�v�� F0004�p
 ����:
 �ߒl:
*******************************************************************************}
procedure TDataModule4.OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD: String);
var
  andFlg:boolean; // ���̓t���O��ݒ�
  qry:TFDQuery;
  cds:TClientDataSet;
begin
  andFlg:=false;  // �t���O������

  qry:=FDQryF0004;
  cds:=ClientDataSetF0004;

  with DataModule4 do
  begin
    cds.Close; // CSD�̏�����

    qry.Close; // FDQueryF0004������
    qry.SQL.Clear;        // SQL��������
    // ��������SQL����
    qry.SQL.Add(' SELECT * FROM MTHFLP  ');
    qry.SQL.Add(' LEFT JOIN TNMMSP ON TNTNCD = MHTNCD  ');
   // SQL.Add(' WHERE MHJTCD <> ''D'' '); // 'D'���\��������

    if MHNO<>'' then                      // ����NO���͎��̏���
    begin
      qry.SQL.Add('WHERE MHNO = :MHNO ');       // TNTNCD�ɓ��͂����S����CD��������
      qry.ParamByName('MHNO').AsString:=MHNO; // ���͂����S����CD��'TNCD'�ɑ������
      andFlg:=true;                       // ���͎��t���O�I��
    end;

    if TODT<>'' then                      // ���ψ˗������͎��̏���
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHIRDT = :TODT');
      qry.ParamByName('TODT').AsString:=TODT; // ���͂����S����CD��'TNCD'�ɑ������
      andFlg:=true;                       // ���͎��t���O�I��
    end;

    if TODT<>'' then                      // ���ϊ������͎��̏���
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHKGDT = :FRDT');
      qry.ParamByName('FRDT').AsString:=FRDT; // ���͂����S����CD��'TNCD'�ɑ������
      andFlg:=true;                       // ���͎��t���O�I��
    end;

    if TKCD<>'' then                      // ���Ӑ���͎��̏���
    begin
    if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('MHTKCD = :TKCD');
      qry.ParamByName('TKCD').AsString:=TKCD; // ���͂����S����CD��'TNCD'�ɑ������
      andFlg:=true;                       // ���͎��t���O�I��
    end;

    if TNCD<>'' then                      // �S����CD���͎��̏���
    begin
      if andFlg=true then qry.SQL.Add(' AND ') else qry.SQL.Add(' WHERE  ');
      qry.SQL.Add('TNTNCD = :TNCD ');  // TNTNCD�ɓ��͂����S����CD��������
      qry.ParamByName('TNCD').AsString:=TNCD; // ���͂����S����CD��'TNCD'�ɑ������
      andFlg:=true;                       // ���͎��t���O�I��
    end;

    qry.SQL.Add(' ORDER BY MHNO ');           // ����

    qry.Open;                      // SQL�����s
    cds.Open; // CDS�J�n



    // �Ώۃf�[�^�����݂��Ȃ��ꍇ�A�f�[�^�Z�b�g����ďI��
    if cds.IsEmpty then
    begin
      cds.Close;
      raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
    end;

  end;

end; // OpenTNData�����܂�

{*******************************************************************************
 �ړI: ���t�`�F�b�N
 ����:
 �ߒl:
*******************************************************************************}
procedure TDataModule4.ClientDataSetTDateFieldSetText(Sender: TField;
  const Text: string);
begin
  try
    Sender.AsString:=text;
  except                        // ���t�̌`���ȊO�̏ꍇ
  on e:Exception do             // �� ��O����
    begin                       // �ϊ��֐�
      Sender.AsString:=DateFilldSetText(text);
    end;
  end;
end;

{*******************************************************************************
 �ړI: ClientDataSet�̓��t�^�̃Z�b�g�e�L�X�g
 ����: �ȗ��N����(���͒l)
 �ߒl: �����N����(�X���b�V���L)
*******************************************************************************}
function TDataModule4.DateFilldSetText(str:string):string;
var
  inDT:integer;
  YYYY,YY,MM :integer;
begin

  Result:=str;

  str:=AnsiReplaceStr(str,'/','');

  if (str<>'')
   and (StrToIntDef(str,-1)>0) then // ���l�ȊO���͂���Ă����疳��
  begin

    inDT:=StrToIntDef(str,-1);

    // ���͎x���@�\�i�N���͂̏ȗ��j
    YYYY:= strtoint(FormatDateTime('YYYY',date));
    YY  := strtoint(FormatDateTime('YY',date));
    MM  := strtoint(FormatDateTime('MM',date));

    if (inDT > 9999)
    and(inDT <= 999999) then
    begin
      inDT := inDT + (YYYY-YY)*10000;
    end;

    if (inDT > 99)
    and(inDT <= 9999) then
    begin
      inDT := inDT + YYYY*10000;
    end;

    if (inDT <= 99)
    and(inDT <> 0) then
    begin
      inDT := inDT + YYYY*10000 +mm*100;
    end;

    Result:=FormatFloat('0000/00/00',inDT);

  end;

end;

{*******************************************************************************
 �ړI:���σw�b�_�[�Ƀf�[�^�����邩�`�F�b�N����
 ����:
 �ߒl:
*******************************************************************************}
function TDataModule4.MTHMS(MHNO:string;IncD:boolean=false): dMTM;
begin

  with FDQryGene do // �`�F�b�N���W�b�N�ȂǊm�F�p��SQL��temp�N�G���𗘗p����
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT * FROM MTHFLP ');
    SQL.Add(' WHERE MHNO = :MHNO ');
    if IncD=False then
      SQL.Add(' AND MHJTCD <> ''D''  ');
    ParamByName('MHNO').AsAnsiString:=MHNO;
    Open;

    if not eof then
    begin
      Result.Exists:= True;
      Result.MHNO := FieldByName('MHNO').AsString;     // ����CD
      Result.JTCD := FieldByName('MHJTCD').AsString;     // �g�p��~�敪
    end else begin
      Result.Exists:= False;
      Result.MHNO := '';     // ����CD
      Result.JTCD := '';     // �g�p��~�敪
    end;

    Close;
    SQL.Clear;
  end;

end;

function TDataModule4.MHTNO(): dMTM;
begin

  with FDQryGene do // �`�F�b�N���W�b�N�ȂǊm�F�p��SQL��temp�N�G���𗘗p����
  begin
    Close;
    SQL.Clear;
    SQL.Add(' SELECT * FROM MTHFLP ');
    Open;

    Result.Exists:= False;
    Result.MHNO := IntToStr(RecordCount+1);     // ����CD
    Result.JTCD := '';     // �g�p��~�敪

    Close;
    SQL.Clear;
  end;

end;

end.
