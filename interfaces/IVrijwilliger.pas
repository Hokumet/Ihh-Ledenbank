unit IVrijwilliger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IAlgemeen, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmIVrijwilliger = class(TfrmIAlgemeen)
    Label2: TLabel;
    dtpLidDatum: TDateTimePicker;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIVrijwilliger: TfrmIVrijwilliger;

implementation

{$R *.dfm}

end.
