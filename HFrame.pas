unit HFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ADODB, ExtCtrls, ComCtrls, StdCtrls, EditAncestor, Menus;

type
  TfrAncestor = class(TFrame)
    lvwItems: TListView;
    Panel1: TPanel;
    btnNew: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    pmpRightClick: TPopupMenu;
    Yeni1: TMenuItem;
    Degistir1: TMenuItem;
    Sil1: TMenuItem;
    lblTitel: TLabel;
    procedure lvwItemsDblClick(Sender: TObject);
    procedure lvwItemsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btnDeleteClick(Sender: TObject);
    procedure lvwItemsClick(Sender: TObject);
  private
    FForm: TfrmEditAncestor;
    FFTable: TADOTable;
    FTitel: String;
    procedure SetTitel(const Value: String);
    procedure LoadItems(Velden: array of string);
  public
    // Use this and other properties to set the owner form and table to use with new edit and delete
    property FTable: TADOTable read FFTable write FFTable;
    property EForm: TfrmEditAncestor read FForm write FForm;
    property Titel: String read FTitel write SetTitel;

    procedure addColumn(Name: STring; Size: Integer);
    procedure addAlignColumn(Name: STring; Size: Integer; alingment: TAlignment);
    //procedure LoadItems(Velden: Array of string);
    function editObject: Boolean;
  end;

implementation

{$R *.dfm}

procedure TfrAncestor.lvwItemsDblClick(Sender: TObject);
begin
  btnEdit.Click;
end;

procedure TfrAncestor.addColumn(Name: STring; Size: Integer);
var column: TListColumn;
begin
  lvwItems.Columns.BeginUpdate;
  column := lvwItems.Columns.Add;
  column.Caption := Name;
  column.Width := Size;

  lvwItems.Columns.EndUpdate;
end;

procedure TfrAncestor.addAlignColumn(Name: STring; Size: Integer;
  alingment: TAlignment);
var column: TListColumn;
begin
  lvwItems.Columns.BeginUpdate;
  column := lvwItems.Columns.Add;
  column.Caption := Name;
  column.Width := Size;
  column.Alignment := alingment;

  lvwItems.Columns.EndUpdate;

end;

procedure TfrAncestor.lvwItemsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  btnEdit.Enabled := Selected;
  btnDelete.Enabled := Selected;
end;

function TfrAncestor.editObject: Boolean;
begin
  Result := False;
    try
      if EForm.ShowModal = mrOk then begin
        Result := True;
      end
    finally
      EForm.Free;
    end;
end;

procedure TfrAncestor.btnDeleteClick(Sender: TObject);
begin
  FTable.Locate('ID', Integer(lvwItems.Selected.Data), []);
  FTable.DeleteRecords(arCurrent);
  TfrmEditAncestor(Self.Owner).loadDetails;
end;

procedure TfrAncestor.lvwItemsClick(Sender: TObject);
begin
  btnEdit.Enabled := lvwItems.Selected <> nil;
  btnDelete.Enabled := lvwItems.Selected <> nil;
end;

procedure TfrAncestor.SetTitel(const Value: String);
begin
  FTitel := Value;
  lblTitel.Caption := FTitel;
end;

procedure TfrAncestor.LoadItems(Velden: array of string);
begin
// FFTable.FieldByName('').AsVariant
end;


end.
