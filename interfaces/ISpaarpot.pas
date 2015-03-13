unit ISpaarpot;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IVrijwilliger, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmISpaarpot = class(TfrmIVrijwilliger)
    Label3: TLabel;
    cmbBetaling: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmISpaarpot: TfrmISpaarpot;

implementation

{$R *.dfm}

end.
