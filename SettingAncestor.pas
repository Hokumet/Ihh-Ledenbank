unit SettingAncestor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, ExtCtrls, ExtDlgs, inifiles;

type
  TfrmSettingAncestor = class(TForm)
    Panel3: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    edtBackground: TEdit;
    edtLogin: TEdit;
    Panel1: TPanel;
    lAdi: TLabel;
    Label1: TLabel;
    btnBack: TButton;
    btnLog: TButton;
    OpenDialog: TOpenPictureDialog;
    Label2: TLabel;
    edtAnaekran: TEdit;
    btnAnaekran: TButton;
    Label3: TLabel;
    edtTitel: TEdit;
    Label4: TLabel;
    edtDatabase: TEdit;
    btnDatabase: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnLogClick(Sender: TObject);
    procedure btnAnaekranClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnDatabaseClick(Sender: TObject);
  private
  protected
    Inifile: TIniFile;
    procedure SaveValues; virtual;
    procedure LoadValues; virtual;
  public
  end;

var
  frmSettingAncestor: TfrmSettingAncestor;

implementation

uses Main, Math;

{$R *.dfm}

procedure TfrmSettingAncestor.FormCreate(Sender: TObject);
begin
 edtTitel.Text := TfrmMain(owner).Inifile.ReadString('anaekran','titel','');
 edtLogin.Text := TfrmMain(owner).Inifile.ReadString('login','logo','');
 edtBackground.Text := TfrmMain(owner).Inifile.ReadString('report','background','');
 edtAnaekran.Text := TfrmMain(owner).Inifile.ReadString('anaekran','anaekran','');
 edtDatabase.Text := TfrmMain(owner).Inifile.ReadString('Database','path','');
 Inifile :=  TfrmMain(owner).Inifile;
 LoadValues;
end;

procedure TfrmSettingAncestor.btnSaveClick(Sender: TObject);
begin
  SaveValues;
end;

procedure TfrmSettingAncestor.btnBackClick(Sender: TObject);
begin
  if(OpenDialog.Execute) then begin
    CopyFile(PChar(OpenDialog.FileName), PChar(ExtractFilePath(Application.ExeName) + ExtractFileName(OpenDialog.FileName)),False);
    FileSetAttr(PChar(ExtractFilePath(Application.ExeName) + ExtractFileName(OpenDialog.FileName)), 2);
    edtBackground.Text := ExtractFileName(OpenDialog.FileName);
  end
end;

procedure TfrmSettingAncestor.btnDatabaseClick(Sender: TObject);
begin
  if(OpenDialog.Execute) then begin
    edtDatabase.Text := ExtractFilePath(OpenDialog.FileName);
  end
end;

procedure TfrmSettingAncestor.btnLogClick(Sender: TObject);
begin
  if(OpenDialog.Execute) then begin
    CopyFile(PChar(OpenDialog.FileName), PChar(ExtractFilePath(Application.ExeName) + ExtractFileName(OpenDialog.FileName)),False);
    FileSetAttr(PChar(ExtractFilePath(Application.ExeName) + ExtractFileName(OpenDialog.FileName)), 2);
    edtLogin.Text := ExtractFileName(OpenDialog.FileName);
  end
end;

procedure TfrmSettingAncestor.btnAnaekranClick(Sender: TObject);
begin
  if(OpenDialog.Execute) then begin
    CopyFile(PChar(OpenDialog.FileName), PChar(ExtractFilePath(Application.ExeName) + ExtractFileName(OpenDialog.FileName)),False);
    FileSetAttr(PChar(ExtractFilePath(Application.ExeName) + ExtractFileName(OpenDialog.FileName)), 2);    
    edtAnaekran.Text := ExtractFileName(OpenDialog.FileName);
  end;
end;

procedure TfrmSettingAncestor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    btnCancel.Click;
end;

procedure TfrmSettingAncestor.LoadValues;
begin
  // Inherited
end;

procedure TfrmSettingAncestor.SaveValues;
begin
  TfrmMain(owner).Inifile.WriteString('anaekran','titel',edtTitel.Text);
  TfrmMain(owner).Inifile.WriteString('login','logo',edtLogin.Text);
  TfrmMain(owner).Inifile.WriteString('report','background',edtBackground.Text);
  TfrmMain(owner).Inifile.WriteString('anaekran','anaekran',edtAnaekran.Text);
  TfrmMain(owner).Inifile.WriteString('Database','path', edtDatabase.Text);
end;

end.
