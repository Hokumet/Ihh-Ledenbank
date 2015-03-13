unit IAlgemeen;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HEdit, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmIAlgemeen = class(TfrmHEdit)
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtLidNr: TEdit;
    edtNaam: TEdit;
    edtAdres: TEdit;
    edtPostcode: TEdit;
    edtPlaats: TEdit;
    edtTelefoon: TEdit;
    edtEmail: TEdit;
    edtOmschrijving: TMemo;
    edtAlgemeen: TEdit;
  private
    { Private declaratioh ns }
  public
    { Public declarations }
    procedure setLidNr(lidNr: String);
  end;

var
  frmIAlgemeen: TfrmIAlgemeen;

implementation

{$R *.dfm}

{ TfrmIAlgemeen }

procedure TfrmIAlgemeen.setLidNr(lidNr: String);
begin
  edtLidNr.Text := lidNr
end;

end.
