unit IH004MSU;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IH004U, Data.DB, System.Actions,
  Vcl.ActnList, PageTop, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls;

type
  TIH004MS = class(TIH004)
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private �錾 }
    rstTNCD :string;
    function  GetTNCD: string;
  public
    { Public �錾 }
    property SltTNCD : String read GetTNCD; // �S���R�[�h �Ȃ�GetTNCD�H ����rstTNCD�ł͂��߁H
  end;                                      // public�ϐ��͐F��ȂƂ�����݂��邩��H

var
  IH004MS: TIH004MS;

implementation

{$R *.dfm}

{*******************************************************************************
 �ړI:�I���{�^�����^�b�v���̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH004MS.Button2Click(Sender: TObject);
begin
  //  inherited; //Button2Click�̏������قȂ邽�ߌp�����Ă͂����Ȃ�
  DBGrid1.SetFocus;
  rstTNCD := DBGrid1.DataSource.DataSet.FieldByName('TNTNCD').AsString;
  ModalResult := mrOk;
end;


{*******************************************************************************
 �ړI:�I���s���_�u���N���b�N�������̏���
 ����:
 �ߒl:
*******************************************************************************}
procedure TIH004MS.DBGrid1DblClick(Sender: TObject);
begin
//  inherited; // �p�����ɂȂ��̂ŋL�ڂ���Ӗ����Ȃ��͂�

  rstTNCD := DBGrid1.DataSource.DataSet.FieldByName('TNTNCD').AsString;
  ModalResult := mrOk;

end;

{*******************************************************************************
 �ړI:GetTNCD�֐��̏���
 ����:
 �ߒl:
*******************************************************************************}
function TIH004MS.GetTNCD: string;
begin
  Result := rstTNCD;
end;

end.
