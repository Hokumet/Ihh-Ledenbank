unit EditBaan;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HEdit, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmEditBaan = class(TfrmHEdit)
    Label1: TLabel;
    edtNaam: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditBaan: TfrmEditBaan;

implementation

{$R *.dfm}

end.
