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
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
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
    procedure OpenTNData(TNCD,reNAME: String);
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses functions, Utilybs;

{$R *.dfm}

procedure TDataModule2.OpenTNData(TNCD,reNAME: String);
var
  andFlg:boolean; //���̓t���O��ݒ�

begin
  //�t���O������
  andFlg:=false;

  with ClientDataSet1 do
  begin
    //ClientDataSet1��������
    ClientDataSet1.Active := False;

    with FDQueryLogin do
    begin
      //FDQueryLogin������
      FDQueryLogin.Close;
      //SQL��������
      SQL.Clear;
      //��������SQL����
      SQL.Add(' SELECT * FROM TNMMSP  ');

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

      //�S���Җ����͎��̏���
      if reNAME<>'' then
      begin
        //�S����CD���͗L����AND��WHERE�ɏ������򂷂�
        if andFlg=true then SQL.Add(' AND ')
                       else SQL.Add(' WHERE ');

        //TNNAME LIKE��%���͖�%��SQLString�ɔ��f����
        SQL.Add(' TNNAME LIKE :NAME ');
        //������v�̓��͖���'NAME'�֑������
        ParamByName('NAME').AsWideString :='%' +reNAME+ '%';
        //���͎��t���O�I��
        andFlg:=true;
      end;

      //����
      SQL.Add(' ORDER BY TNTNCD ');
      //SQL�����s
      FDQueryLogin.Open;
    end;

    //ClientDataSet1���J��
    ClientDataSet1.Active := True;

    //�Ώۃf�[�^�����݂��Ȃ��ꍇ�A�f�[�^�Z�b�g����ďI��
    if Eof and Bof then
    begin
      Active := False;
      raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
    end;//��O���������܂�

  end;//ClientDataSet1�����܂�

end;//OpenTNData�����܂�

end.
