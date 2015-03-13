unit IDonatie;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ISpaarpot, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, HolderEdits;

type
  TfrmIDonatie = class(TfrmISpaarpot)
    Label4: TLabel;
    Label5: TLabel;
    edtBankNr: TEdit;
    edtBedrag: THCurrencyEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIDonatie: TfrmIDonatie;

implementation

{$R *.dfm}

end.
