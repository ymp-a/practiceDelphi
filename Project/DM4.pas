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
    // ClientDataSet�̓��t�t�B�[���h��OnSetText�C�x���g�ɒǉ�����
    procedure ClientDataSetTDateFieldSetText(Sender: TField; // ���t���̓`�F�b�N
      const Text: string);
    function DateFilldSetText(str:string):string;            // ���t�`���ɕϊ�
  private
    { Private �錾 }
  public
    { Public �錾 }
    procedure OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD: String); // ���σf�[�^�I�[�v��
  end;

var
  DataModule4: TDataModule4;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DM2;

{$R *.dfm}

{*******************************************************************************
 �ړI:���σf�[�^�I�[�v��
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

end.
