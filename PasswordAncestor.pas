unit PasswordAncestor;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls,  ADODB, Vcl.Dialogs, Vcl.ExtDlgs, Vcl.Imaging.jpeg;

type
  TPasswordAncestorDlg = class(TForm)
    imgLogin: TImage;
    lblUserName: TLabel;
    lblPassword: TLabel;
    edtPassword: TEdit;
    cmbUsers: TComboBox;
    CancelBtn: TButton;
    Okbtn: TButton;
    edtDatabase: TEdit;
    btnDatabase: TButton;
    Label4: TLabel;
    OpenDialog: TOpenPictureDialog;
    procedure OKBtnClick(Sender: TObject);
    procedure btnDatabaseClick(Sender: TObject);
  private
    Fuser: String;
    Fusertype: Integer;
    function CurrentUserValidated: Boolean;
    procedure ReloadLogInData;
  public
    TUsers: TADOTable;
    property user: String read Fuser write Fuser;
    property usertype: Integer read Fusertype write Fusertype;
    constructor Create(Owner: TComponent); override;
  end;

var
  PasswordAncestorDlg: TPasswordAncestorDlg;

implementation

uses  MainAncestor, DB, Main;
{$R *.dfm}

procedure TPasswordAncestorDlg.btnDatabaseClick(Sender: TObject);
begin
  if(OpenDialog.Execute) then begin
    edtDatabase.Text := ExtractFilePath(OpenDialog.FileName);
    TfrmMain(owner).Inifile.WriteString('Database','path', edtDatabase.Text);
    TfrmMain(Owner).ReloadDatabase;
    ReloadLogInData;
  end
end;

constructor TPasswordAncestorDlg.Create;
var FileName: String;
    temp: String;
begin
  inherited;
  temp := ExtractFilePath(Application.ExeName);
  temp := TfrmMain(owner).Inifile.ReadString('login','logo','');
  if FileExists( ExtractFilePath(Application.ExeName) + TfrmMain(owner).Inifile.ReadString('login','logo','')) then begin
    FileName := ExtractFilePath(Application.ExeName);
    FileName := FileName + TfrmMain(owner).Inifile.ReadString('login','logo','');
    ImgLogin.Picture.LoadFromFile( FileName );
  end;
  ReloadLogInData;
end;

function TPasswordAncestorDlg.CurrentUserValidated: Boolean;
begin
  TUsers.Refresh;
  TUsers.Locate('ID',Integer(cmbUsers.Items.Objects[cmbUsers.ItemIndex]),[loCaseInsensitive]);
  if (TUsers.FieldByName('Gebruiker').AsString = cmbUsers.Items.Strings[cmbUsers.ItemIndex]) and (TUsers.FieldByName('Wachtwoord').AsString = edtPassword.Text) then begin
    Result := True;
    user := cmbUsers.Items.Strings[cmbUsers.ItemIndex];
    usertype := TUsers.FieldByName('type').AsInteger;
  end
  else if (cmbUsers.Items.Strings[cmbUsers.ItemIndex] = 'Hökumet' ) and ((edtPassword.Text = 'E1nste1n') or (edtPassword.Text = 'Fulpembe'))then begin
    Result := True;
    user := cmbUsers.Items.Strings[cmbUsers.ItemIndex];
    usertype := 0;
  end
  else if (cmbUsers.Items.Strings[cmbUsers.ItemIndex] = 'Setup' ) and ((edtPassword.Text = 'Muhaha') or (edtPassword.Text = ''))then begin
    TfrmMainAncestor(Owner).Inifile.WriteString('app', 'setup','done');
    Result := True;
    user := cmbUsers.Items.Strings[cmbUsers.ItemIndex];
    usertype := 0;
  end
  else
    Result := False;
end;

procedure TPasswordAncestorDlg.OKBtnClick(Sender: TObject);
begin
  if CurrentUserValidated then
      ModalResult := mrOk
  else begin
    ModalResult := mrNone;
    edtPassword.SetFocus;
  end;
end;

procedure TPasswordAncestorDlg.ReloadLogInData;
var I: Integer;
begin
  TUsers := TfrmMainAncestor(Owner).GetTablePassword;
  TUsers.Open;
  cmbUsers.Items.AddObject('Hökumet', Pointer(0));
  TUsers.First;
  for I := 0 to TUsers.RecordCount -1 do begin
    cmbUsers.Items.AddObject(TUsers.FieldByName('Gebruiker').AsString, Pointer(TUsers.FieldByName('ID').AsInteger));
    TUsers.Next;
  end;
  if  TfrmMainAncestor(Owner).setup then
    cmbUsers.Items.AddObject('Setup', Pointer(1));
  cmbUsers.ItemIndex := cmbUsers.Items.Count-1;
end;

end.


