unit HEditDetails;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, HEdit, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, HFrame;

type
  TfrmEditDetails = class(TfrmHEdit)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    frAncestor1: TfrAncestor;
    Panel1: TPanel;
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEditDetails: TfrmEditDetails;

implementation

{$R *.dfm}

end.
