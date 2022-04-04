unit DM2;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Comp.UI, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, Datasnap.DBClient,
  Datasnap.Provider,MidasLib;

type
  TDataModule2 = class(TDataModule)
    FDQryTNMMSP: TFDQuery;
    DataSrcTNMMSP: TDataSource;
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
    FDQry1: TFDQuery;
    DataSrc1: TDataSource;
    FDQry1TNTNCD: TIntegerField;
    FDQry1TNBKCD: TIntegerField;
    FDQry1TNPASS: TVarBytesField;
    FDQry1TNNAME: TStringField;
    FDQry1TNKGKB: TStringField;
    FDQry1TNSTKB: TStringField;
    FDQry1TNPWLA: TDateField;
    FDQry1TNCRDT: TDateField;
    FDQry1TNCRTM: TTimeField;
    FDQry1TNCRPG: TStringField;
    FDQry1TNCRWS: TStringField;
    FDQry1TNCRUS: TStringField;
    FDQry1TNUPDT: TDateField;
    FDQry1TNUPTM: TTimeField;
    FDQry1TNUPPG: TStringField;
    FDQry1TNUPWS: TStringField;
    FDQry1TNUPUS: TStringField;
    FDQry1TNJTCD: TStringField;

  private
    { Private �錾 }
  public
    { Public �錾 }
//    procedure OpenTNData(TNCD,reNAME: String); // �S���҃}�X�^�f�[�^�I�[�v��
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
{procedure TDataModule2.OpenTNData(TNCD,reNAME: String);
var
  andFlg:boolean; // ���̓t���O��ݒ�

begin

  andFlg:=false;  // �t���O������

  begin
    ClientDataSetTNMMSP.Close; // CDS��������

    with FDQryTNMMSP do
    begin
      FDQryTNMMSP.Close; // FDQueryLogin������
      SQL.Clear;         // SQL��������
//      Params.Clear;

      // ��������SQL����
      SQL.Add(' SELECT * FROM TNMMSP  ');
      SQL.Add(' where 1=1 ');
      if TNCD<>'' then // �S����CD���͎��̏���
      begin
        SQL.Add(' AND TNTNCD = ''3'' '); // TNTNCD�ɓ��͂����S����CD��������
//        ParamByName('TNCD').AsString:=TNCD; // ���͂����S����CD��'TNCD'�ɑ������
        andFlg:=true;                       // ���͎��t���O�I��
      end;

      if reNAME<>'' then                    // �S���Җ����͎��̏���
      begin

       // if andFlg=true then SQL.Add(' AND ')                 // �S����CD���͗L����AND��WHERE�ɏ������򂷂�
       //                else SQL.Add(' WHERE ');
        SQL.Add(' AND TNNAME LIKE :NAME ');                      // TNNAME LIKE��%���͖�%��SQLString�ɔ��f����
        ParamByName('NAME').AsWideString :='%' +reNAME+ '%'; // ������v�̓��͖���'NAME'�֑������
        andFlg:=true;                                        // ���͎��t���O�I��
      end;

      SQL.Add(' ORDER BY TNTNCD ');     // ����

      FDQryTNMMSP.Open();                 // SQL�����s
    end;

    ClientDataSetTNMMSP.Open(); // CDS���J��


    if ClientDataSetTNMMSP.Eof and ClientDataSetTNMMSP.Bof then // �Ώۃf�[�^�����݂��Ȃ��ꍇ�A�f�[�^�Z�b�g����ďI��
    begin
      ClientDataSetTNMMSP.Active := False;
      raise Exception.Create('�Ώۃf�[�^�����݂��܂���');
    end;

  end;// CDS�����܂�

end;// OpenTNData�����܂�
 }
end.
