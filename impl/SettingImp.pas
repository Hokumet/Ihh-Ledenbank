unit SettingImp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, SettingAncestor, Vcl.ExtDlgs,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmSettingImp = class(TfrmSettingAncestor)
    Label5: TLabel;
    edtWordDocument: TEdit;
    btnWorddoc: TButton;
    odWordDoc: TOpenDialog;
    procedure btnWorddocClick(Sender: TObject);
  private
  protected
    procedure LoadValues; override;
    procedure SaveValues; override;
  public
  end;

var
  frmSettingImp: TfrmSettingImp;

implementation

{$R *.dfm}

{ TfrmSettingImp }

procedure TfrmSettingImp.btnWorddocClick(Sender: TObject);
begin
  inherited;
  if(odWordDoc.Execute) then begin
    edtWordDocument.Text :=  odWordDoc.FileName;
  end
end;

procedure TfrmSettingImp.LoadValues;
begin
 edtWordDocument.Text := Inifile.ReadString('app','worddoc','');
end;

procedure TfrmSettingImp.SaveValues;
begin
  inherited;
  Inifile.WriteString('app','worddoc', edtWordDocument.Text);
end;

end.
