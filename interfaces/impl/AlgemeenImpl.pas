unit AlgemeenImpl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IAlgemeen, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmAlgemeenImpl = class(TfrmIAlgemeen)
    Label2: TLabel;
    cmbCategorie: TComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAlgemeenImpl: TfrmAlgemeenImpl;

implementation

{$R *.dfm}

end.
