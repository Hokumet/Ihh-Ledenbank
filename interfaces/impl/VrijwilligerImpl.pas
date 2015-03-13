unit VrijwilligerImpl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IVrijwilliger, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmVrijwilligerImpl = class(TfrmIVrijwilliger)
    Label3: TLabel;
    cmbBaan: TComboBox;
    edtVrijwilliger: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVrijwilligerImpl: TfrmVrijwilligerImpl;

implementation

{$R *.dfm}

end.
