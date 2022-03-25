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
    procedure OpenTNData(TNCD,reNAME: String); // �S���҃}�X�^�f�[�^�I�[�v��
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses functions, Utilybs, F0001;

{$R *.dfm}

{*******************************************************************************
 �ړI:�S���҃}�X�^�Ƀf�[�^�I�[�v��
 ����:
 �ߒl:
*******************************************************************************}
procedure TDataModule2.OpenTNData(TNCD,reNAME: String);
var
  andFlg:boolean; // ���̓t���O��ݒ�

begin

  andFlg:=false;  // �t���O������

  with ClientDataSetTNMMSP do
  begin
    ClientDataSetTNMMSP.Active := False; // CDS��������

    with FDQryTNMMSP do
    begin
      FDQryTNMMSP.Close; // FDQueryLogin������
      SQL.Clear;         // SQL��������
      // ��������SQL����
      SQL.Add(' SELECT * FROM TNMMSP  ');

      if TNCD<>'' then                      // �S����CD���͎��̏���
      begin
        SQL.Add(' WHERE TNTNCD = :TNCD ');  // TNTNCD�ɓ��͂����S����CD��������
        ParamByName('TNCD').AsString:=TNCD; // ���͂����S����CD��'TNCD'�ɑ������
        andFlg:=true;                       // ���͎��t���O�I��
      end;

      if reNAME<>'' then                    // �S���Җ����͎��̏���
      begin

        if andFlg=true then SQL.Add(' AND ')                 // �S����CD���͗L����AND��WHERE�ɏ������򂷂�
                       else SQL.Add(' WHERE ');
        SQL.Add(' TNNAME LIKE :NAME ');                      // TNNAME LIKE��%���͖�%��SQLString�ɔ��f����
        ParamByName('NAME').AsWideString :='%' +reNAME+ '%'; // ������v�̓��͖���'NAME'�֑������
        andFlg:=true;                                        // ���͎��t���O�I��
      end;

      SQL.Add(' ORDER BY TNTNCD ');     // ����

      FDQryTNMMSP.Open;                 // SQL�����s
    end;

    ClientDataSetTNMMSP.Active := True; // CDS���J��


    if Eof and Bof then // �Ώۃf�[�^�����݂��Ȃ��ꍇ�A�f�[�^�Z�b�g����ďI��
    begin
      Active := False;
      raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
    end;

  end;// CDS�����܂�

end;// OpenTNData�����܂�

end.
