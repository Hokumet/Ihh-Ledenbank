unit EditBetaling;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HEdit, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB;

type
  TfrmEditBetaling = class(TfrmHEdit)
    Label1: TLabel;
    edtType: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditBetaling: TfrmEditBetaling;

implementation

{$R *.dfm}

end.
