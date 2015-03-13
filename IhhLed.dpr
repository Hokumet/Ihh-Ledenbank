program IhhLed;

uses
  Vcl.Forms,
  HEdit in 'HEdit.pas' {frmHEdit},
  EditAncestor in 'EditAncestor.pas' {frmEditAncestor},
  PasswordAncestor in 'PasswordAncestor.pas' {PasswordAncestorDlg},
  SettingAncestor in 'SettingAncestor.pas' {frmSettingAncestor},
  MainAncestor in 'MainAncestor.pas' {frmMainAncestor},
  Main in 'Main.pas' {frmMain},
  EditBetaling in 'lists\EditBetaling.pas' {frmEditBetaling},
  EditDoel in 'lists\EditDoel.pas' {frmEditDoel},
  EditLand in 'lists\EditLand.pas' {frmEditLand},
  EditProject in 'lists\EditProject.pas' {frmEditProject},
  IAlgemeen in 'interfaces\IAlgemeen.pas' {frmIAlgemeen},
  IVrijwilliger in 'interfaces\IVrijwilliger.pas' {frmIVrijwilliger},
  ISpaarpot in 'interfaces\ISpaarpot.pas' {frmISpaarpot},
  IDonatie in 'interfaces\IDonatie.pas' {frmIDonatie},
  IBroeder in 'interfaces\IBroeder.pas' {frmIBroeder},
  AlgemeenImpl in 'interfaces\impl\AlgemeenImpl.pas' {frmAlgemeenImpl},
  BroederImpl in 'interfaces\impl\BroederImpl.pas' {frmBroederImpl},
  DonatieImpl in 'interfaces\impl\DonatieImpl.pas' {frmDonatieImpl},
  SpaarpotImpl in 'interfaces\impl\SpaarpotImpl.pas' {frmSpaarpotImpl},
  VrijwilligerImpl in 'interfaces\impl\VrijwilligerImpl.pas' {frmVrijwilligerImpl},
  SettingImp in 'impl\SettingImp.pas' {frmSettingImp},
  EditBaan in 'lists\EditBaan.pas' {frmEditBaan},
  Vcl.Themes,
  Vcl.Styles,
  Keywords in 'Keywords.pas' {frmKeywords},
  HEditDetails in 'HEditDetails.pas' {frmEditDetails},
  HFrame in 'HFrame.pas' {frAncestor: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmEditDetails, frmEditDetails);
  Application.Run;
end.
