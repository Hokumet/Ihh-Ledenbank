unit SpaarpotImpl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ISpaarpot, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmSpaarpotImpl = class(TfrmISpaarpot)
    Label4: TLabel;
    edtSpaarpotNr: TEdit;
    edtSpaarpot: TEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSpaarpotImpl: TfrmSpaarpotImpl;

implementation

{$R *.dfm}

end.
