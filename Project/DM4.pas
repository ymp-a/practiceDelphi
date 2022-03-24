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
    //���t�ȗ�����
    //ClientDataSet�̓��t�t�B�[���h��OnSetText�C�x���g�ɒǉ�����
    procedure ClientDataSetTDateFieldSetText(Sender: TField;
      const Text: string);
    function DateFilldSetText(str:string):string;
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

procedure TDataModule4.OpenMHData(MHNO,TODT,FRDT,TKCD,TNCD: String);
var
  andFlg:boolean; //���̓t���O��ݒ�

begin
  //�t���O������
  andFlg:=false;

  with FDQryF0004 do
  begin
    //FDQueryLogin������
    FDQryF0004.Close;
    //SQL��������
    SQL.Clear;
    //��������SQL����
    SQL.Add(' SELECT * FROM MTHFLP  ');
    SQL.Add(' LEFT JOIN TNMMSP ON TNTNCD = MHTNCD  ');
   // SQL.Add(' WHERE MHJTCD <> ''D'' ');

    // ����NO���͎��̏���
    if MHNO<>'' then
    begin
      //TNTNCD�ɓ��͂����S����CD��������
      SQL.Add('AND MHNO = :MHNO ');
      //���͂����S����CD��'TNCD'�ɑ������
      ParamByName('MHNO').AsString:=MHNO;
      //���͎��t���O�I��
      andFlg:=true;
    end;

    // ���ψ˗������͎��̏���
    if TODT<>'' then
    begin
      SQL.Add(' AND MHIRDT = :TODT');
      //���͂����S����CD��'TNCD'�ɑ������
      ParamByName('TODT').AsString:=TODT;
      //���͎��t���O�I��
      andFlg:=true;
    end;

    // ���ϊ������͎��̏���
    if TODT<>'' then
    begin
      SQL.Add(' AND MHKGDT = :FRDT');
      //���͂����S����CD��'TNCD'�ɑ������
      ParamByName('FRDT').AsString:=FRDT;
      //���͎��t���O�I��
      andFlg:=true;
    end;

    // ���Ӑ���͎��̏���
    if TKCD<>'' then
    begin
      SQL.Add(' AND MHTKCD = :TKCD');
      //���͂����S����CD��'TNCD'�ɑ������
      ParamByName('TKCD').AsString:=TKCD;
      //���͎��t���O�I��
      andFlg:=true;
    end;

    //�S����CD���͎��̏���
    if TNCD<>'' then
    begin
      //TNTNCD�ɓ��͂����S����CD��������
      SQL.Add(' WHERE TNTNCD = :TNCD ');
      //���͂����S����CD��'TNCD'�ɑ������
      ParamByName('TNCD').AsString:=TNCD;
      //���͎��t���O�I��
      andFlg:=true;
    end;


    //����
    SQL.Add(' ORDER BY MHNO ');
    //SQL�����s
    FDQryF0004.Open;
  end;


  //�Ώۃf�[�^�����݂��Ȃ��ꍇ�A�f�[�^�Z�b�g����ďI��
  if FDQryF0004.IsEmpty then
  begin
    FDQryF0004.Close;
    raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
  end;//��O���������܂�


end;//OpenTNData�����܂�

procedure TDataModule4.ClientDataSetTDateFieldSetText(Sender: TField;
  const Text: string);
begin
  try
    Sender.AsString:=text;
  except                        //���t�̌`���łȂ���΃G���[
  on e:Exception do             //��
    begin                         //�ϊ�
      Sender.AsString:=DateFilldSetText(text);
    end;
  end;
end;

function TDataModule4.DateFilldSetText(str:string):string;
{*******************************************************************************
 �ړI: ClientDataSet�̓��t�^�̃Z�b�g�e�L�X�g
 ����: �ȗ��N����(���͒l)
 �ߒl: �����N����(�X���b�V���L)
*******************************************************************************}
var
  inDT:integer;
  YYYY,YY,MM :integer;
begin

  Result:=str;

  str:=AnsiReplaceStr(str,'/','');

  if (str<>'')
   and (StrToIntDef(str,-1)>0) then     //���l�ȊO���͂���Ă����疳��
  begin

    inDT:=StrToIntDef(str,-1);

    //���͎x���@�\�i�N���͂̏ȗ��j
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
