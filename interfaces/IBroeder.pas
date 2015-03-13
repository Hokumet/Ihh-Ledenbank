unit IBroeder;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IDonatie, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, HolderEdits, Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmIBroeder = class(TfrmIDonatie)
    cmbLand: TComboBox;
    Label6: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIBroeder: TfrmIBroeder;

implementation

{$R *.dfm}

end.
