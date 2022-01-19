program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  PageTop in '..\CSD\Base\PageTop.pas' {PageTopFrm: TFrame},
  Clndr in '..\CSD\Base\Clndr.pas' {ClndrFrm},
  DspMaster in '..\CSD\Base\DspMaster.pas' {DspMasterFrm},
  DspTran in '..\CSD\Base\DspTran.pas' {DspTranFrm},
  EdtLogin in '..\CSD\Base\EdtLogin.pas' {EdtLoginFrm},
  EdtMaster in '..\CSD\Base\EdtMaster.pas' {EdtMasterFrm},
  EdtTraHM in '..\CSD\Base\EdtTraHM.pas' {EdtTraHMFrm},
  EdtTraTab in '..\CSD\Base\EdtTraTab.pas' {EdtTraTabFrm},
  FncLock in '..\CSD\Base\FncLock.pas',
  Prompt in '..\CSD\Base\Prompt.pas' {PromptFrm},
  PrtTra in '..\CSD\Base\PrtTra.pas' {PrintTra},
  SltMaster in '..\CSD\Base\SltMaster.pas' {SltMasterFrm},
  Utilybs in '..\CSD\Base\Utilybs.pas' {dmUtilYbs: TDataModule},
  functions in '..\CSD\Common\functions.pas',
  IniFilemnt in '..\CSD\Common\IniFilemnt.pas',
  DMPASCmn in '..\CSD\DM\DMPASCmn.pas' {DataModulePASCmn: TDataModule},
  DMPASCus in '..\CSD\DM\DMPASCus.pas' {DataModulePASCus: TDataModule},
  DMPASMsp in '..\CSD\DM\DMPASMsp.pas' {DataModulePASMsp: TDataModule},
  DMPASMst in '..\CSD\DM\DMPASMst.pas' {DataModulePASMst: TDataModule},
  DMPASPrt in '..\CSD\DM\DMPASPrt.pas' {DataModulePASPrt: TDataModule},
  DMPASTra in '..\CSD\DM\DMPASTra.pas' {DataModulePASTra: TDataModule},
  M0001 in '..\CSD\MENU\M0001.pas' {M0001Frm},
  M0002 in '..\CSD\MENU\M0002.pas' {M0002Frm},
  M0003 in '..\CSD\MENU\M0003.pas' {M0003Frm},
  MN001 in '..\CSD\MENU\MN001.pas' {MN001Frm},
  MN001C in '..\CSD\MENU\MN001C.pas' {MN001CFrm},
  DM2 in 'DM2.pas' {DataModule2: TDataModule},
  MNK001 in 'MNK001.pas' {MNK001Frm},
  F0001 in 'F0001.pas' {F0001Frm},
  F0002 in 'F0002.pas' {F0002Frm},
  DM3 in 'DM3.pas' {DataModule3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TdmUtilYbs, dmUtilYbs);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TF0002Frm, F0002Frm);
  Application.CreateForm(TDataModule3, DataModule3);
  Application.Run;
end.
