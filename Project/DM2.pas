unit DM2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, Datasnap.Provider, Datasnap.DBClient, FireDAC.Comp.UI;

type
  TDataModule2 = class(TDataModule)
    FDQryTNMMSP: TFDQuery;
    FDConnection1: TFDConnection;
    DataSrcTNMMSP: TDataSource;
    FDQryTNMMSPTNTNCD: TIntegerField;
    FDQryTNMMSPTNBKCD: TIntegerField;
    FDQryTNMMSPTNPASS: TVarBytesField;
    FDQryTNMMSPTNNAME: TStringField;
    FDQryTNMMSPTNKGKB: TStringField;
    FDQryTNMMSPTNSTKB: TStringField;
    FDQryTNMMSPTNPWLA: TDateField;
    FDQryTNMMSPTNCRDT: TDateField;
    FDQryTNMMSPTNCRTM: TTimeField;
    FDQryTNMMSPTNCRPG: TStringField;
    FDQryTNMMSPTNCRWS: TStringField;
    FDQryTNMMSPTNCRUS: TStringField;
    FDQryTNMMSPTNUPDT: TDateField;
    FDQryTNMMSPTNUPTM: TTimeField;
    FDQryTNMMSPTNUPPG: TStringField;
    FDQryTNMMSPTNUPWS: TStringField;
    FDQryTNMMSPTNUPUS: TStringField;
    FDQryTNMMSPTNJTCD: TStringField;
    ClientDataSetTNMMSP: TClientDataSet;
    DataSetProTNMMSP: TDataSetProvider;
    ClientDataSetTNMMSPTNTNCD: TIntegerField;
    ClientDataSetTNMMSPTNBKCD: TIntegerField;
    ClientDataSetTNMMSPTNPASS: TVarBytesField;
    ClientDataSetTNMMSPTNNAME: TStringField;
    ClientDataSetTNMMSPTNKGKB: TStringField;
    ClientDataSetTNMMSPTNSTKB: TStringField;
    ClientDataSetTNMMSPTNPWLA: TDateField;
    ClientDataSetTNMMSPTNCRDT: TDateField;
    ClientDataSetTNMMSPTNCRTM: TTimeField;
    ClientDataSetTNMMSPTNCRPG: TStringField;
    ClientDataSetTNMMSPTNCRWS: TStringField;
    ClientDataSetTNMMSPTNCRUS: TStringField;
    ClientDataSetTNMMSPTNUPDT: TDateField;
    ClientDataSetTNMMSPTNUPTM: TTimeField;
    ClientDataSetTNMMSPTNUPPG: TStringField;
    ClientDataSetTNMMSPTNUPWS: TStringField;
    ClientDataSetTNMMSPTNUPUS: TStringField;
    ClientDataSetTNMMSPTNJTCD: TStringField;

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

uses functions, Utilybs, F0001;

{$R *.dfm}

procedure TDataModule2.OpenTNData(TNCD,reNAME: String);
var
  andFlg:boolean; //���̓t���O��ݒ�

begin
  //�t���O������
  andFlg:=false;

  with ClientDataSetTNMMSP do
  begin
    //ClientDataSet1��������
    ClientDataSetTNMMSP.Active := False;

    with FDQryTNMMSP do
    begin
      //FDQueryLogin������
      FDQryTNMMSP.Close;
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
      FDQryTNMMSP.Open;
    end;

    //ClientDataSet1���J��
    ClientDataSetTNMMSP.Active := True;

    //�Ώۃf�[�^�����݂��Ȃ��ꍇ�A�f�[�^�Z�b�g����ďI��
    if Eof and Bof then
    begin
      Active := False;
      raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
    end;//��O���������܂�

  end;//ClientDataSet1�����܂�

end;//OpenTNData�����܂�

end.
