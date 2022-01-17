unit DM2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, Datasnap.Provider, Datasnap.DBClient;

type
  TDataModule2 = class(TDataModule)
    FDQueryLogin: TFDQuery;
    FDConnection1: TFDConnection;
    DataSource1: TDataSource;
    FDQueryLoginTNTNCD: TIntegerField;
    FDQueryLoginTNBKCD: TIntegerField;
    FDQueryLoginTNPASS: TVarBytesField;
    FDQueryLoginTNNAME: TStringField;
    FDQueryLoginTNKGKB: TStringField;
    FDQueryLoginTNSTKB: TStringField;
    FDQueryLoginTNPWLA: TDateField;
    FDQueryLoginTNCRDT: TDateField;
    FDQueryLoginTNCRTM: TTimeField;
    FDQueryLoginTNCRPG: TStringField;
    FDQueryLoginTNCRWS: TStringField;
    FDQueryLoginTNCRUS: TStringField;
    FDQueryLoginTNUPDT: TDateField;
    FDQueryLoginTNUPTM: TTimeField;
    FDQueryLoginTNUPPG: TStringField;
    FDQueryLoginTNUPWS: TStringField;
    FDQueryLoginTNUPUS: TStringField;
    FDQueryLoginTNJTCD: TStringField;
    FDQueryLogin2: TFDQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    VarBytesField1: TVarBytesField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    DateField1: TDateField;
    DateField2: TDateField;
    TimeField1: TTimeField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    DateField3: TDateField;
    TimeField2: TTimeField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    DataSource2: TDataSource;
    FDQueryLogin3: TFDQuery;
    DataSource3: TDataSource;
    ClientDataSet1: TClientDataSet;
    ClientDataSet2: TClientDataSet;
    ClientDataSet3: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    DataSetProvider2: TDataSetProvider;
    DataSetProvider3: TDataSetProvider;
    ClientDataSet1TNTNCD: TIntegerField;
    ClientDataSet1TNBKCD: TIntegerField;
    ClientDataSet1TNPASS: TVarBytesField;
    ClientDataSet1TNNAME: TStringField;
    ClientDataSet1TNKGKB: TStringField;
    ClientDataSet1TNSTKB: TStringField;
    ClientDataSet1TNPWLA: TDateField;
    ClientDataSet1TNCRDT: TDateField;
    ClientDataSet1TNCRTM: TTimeField;
    ClientDataSet1TNCRPG: TStringField;
    ClientDataSet1TNCRWS: TStringField;
    ClientDataSet1TNCRUS: TStringField;
    ClientDataSet1TNUPDT: TDateField;
    ClientDataSet1TNUPTM: TTimeField;
    ClientDataSet1TNUPPG: TStringField;
    ClientDataSet1TNUPWS: TStringField;
    ClientDataSet1TNUPUS: TStringField;
    ClientDataSet1TNJTCD: TStringField;
  private
    { Private �錾 }
  public
    { Public �錾 }
    //�S���Ҍ���
    procedure OpenTNData(TNCD,NAME: String);
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses functions, Utilybs;

{$R *.dfm}


procedure TDataModule2.OpenTNData(TNCD,NAME: String);
var
  andFlg:boolean; //���̓t���O��ݒ�

begin
  //�t���O������
  andFlg:=false;

  with ClientDataSet1 do
  begin
    //�f�[�^�Z�b�g�����
    Active := False;
    //Close;

    with DataModule2.FDQueryLogin do
    begin
      Close;
      //SQL���J�n
      //SQL��������
      SQL.Clear;
      //��������SQL����
      SQL.Add(' SELECT * FROM TNMMSP  ');

      //�S����CD���͎��̏���
      if TNCD<>'' then
      begin
        //TNTNCD�ɓ��͂����S����CD��������
        SQL.Add(' WHERE TNTNCD >= :TNCD ');
        //���͂����S����CD��'TNCD'�ɑ������
        ParamByName('TNCD').AsString:=TNCD;
        //���͎��t���O�I��
        andFlg:=true;
      end;

      //�S���Җ����͎��̏���
      if NAME<>'' then
      begin
        //�S����CD���͗L����AND��WHERE�ɏ������򂷂�
        if andFlg=true then
         SQL.Add(' AND ')
         else SQL.Add(' WHERE ');

        //TNNAME LIKE��%���͖�%��SQLString�ɔ��f����
        SQL.Add(' TNNAME LIKE :NAME ');
        //������v�̓��͖���'NAME'�֑������
        ParamByName('NAME').AsWideString :='%' +NAME+ '%';
        //���͎��t���O�I��
        andFlg:=true;
      end;

      //����
//      SQL.Add(' ORDER BY TNTNCD ');
      Open;
    end;


    //�f�[�^�Z�b�g���J��
    Active := True;
    Open;
    //�Ώۃf�[�^�����݂��Ȃ��ꍇ�A�f�[�^�Z�b�g����ďI��
    if Eof and Bof then
    begin
    Active := False;
    raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
    end;
  end;

end;

end.
