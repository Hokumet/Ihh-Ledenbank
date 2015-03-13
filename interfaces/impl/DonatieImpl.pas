unit DonatieImpl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IDonatie, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, HolderEdits, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmDonatieImpl = class(TfrmIDonatie)
    Label6: TLabel;
    cmbDoel: TComboBox;
    edtDonatie: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDonatieImpl: TfrmDonatieImpl;

implementation

{$R *.dfm}

end.
