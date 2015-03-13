unit EditDoel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TfrmEditDoel = class(TfrmHEdit)
    edtNaam: TEdit;
    Label1: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditDoel: TfrmEditDoel;

implementation

{$R *.dfm}

end.
