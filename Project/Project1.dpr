program Project1;

uses
  Vcl.Forms,
//  MidasLib,
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
  DM3 in 'DM3.pas' {DataModule3: TDataModule},
  F0003 in 'F0003.pas' {F0003Frm},
  DM4 in 'DM4.pas' {DataModule4: TDataModule},
  F0004 in 'F0004.pas' {F0004Frm},
  baseFormU in 'baseFormU.pas' {baseForm},
  baseForm2U in 'baseForm2U.pas' {baseForm2},
  F0001S in 'F0001S.pas' {F0001SFrm},
  IH001U in 'IH001U.pas' {IH001},
  IH002U in 'IH002U.pas' {IH002},
  IH004U in 'IH004U.pas' {IH004},
  IH003U in 'IH003U.pas' {IH003},
  IH004MSU in 'IH004MSU.pas' {IH004MS},
  IH005U in 'IH005U.pas' {IH005};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;
  Application.CreateForm(TEdtLoginFrm, EdtLoginFrm);
  Application.Run;
end.
