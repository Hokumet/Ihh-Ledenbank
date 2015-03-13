unit EditAncestor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, AdoDB, StdCtrls, Contnrs, Buttons, Data.DB;

type
  TfrmEditAncestor = class(TForm)
    Panel3: TPanel;
    PageControl1: TPageControl;
    tbsGenel: TTabSheet;
    Panel2: TPanel;
    Panel1: TPanel;
    btnCancel: TBitBtn;
    btnSave: TBitBtn;
    btnReset: TBitBtn;
    LblAangemaakDoor: TLabel;
    lblAangemaaktOp: TLabel;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnResetClick(Sender: TObject);
  private
    { Private declarations }
  protected
    ID: Integer;
    TTable: TADOTable;
    MasterKey: String;
    TableObjectList: TObjectList;
    procedure loadDetailsTables; virtual;
    procedure loadValues; virtual;
    procedure saveValues; virtual;
    procedure cancelValues; virtual;
    procedure Eenmaal; virtual;
    procedure fillCmb(cmb:TComboBox; cmbTable:TADOTable; FieldName, def:String);
  public
    procedure loadDetails; virtual;
    constructor Create(Owner: TComponent; ID: Integer; AdoTable: TADOTable); overload;
    constructor Create(Owner: TComponent; ID: Integer; AdoTable: TADOTable; Key: String); overload;
  end;

var
  frmEditAncestor: TfrmEditAncestor;

implementation

uses Main, DateUtils;

{$R *.dfm}

{ TfrmEditAncestor }

constructor TfrmEditAncestor.Create(Owner: TComponent; ID: Integer; AdoTable: TADOTable);
begin
  inherited Create(Owner);
  TableObjectList := TObjectList.Create;
  TTable := AdoTable;
  Eenmaal;
  Self.Id := Id;
  if Id = 0 then begin
    TTable.Insert;
    loadValues;
  end
  else if Id = -1 then begin
  end
  else begin
    loadValues;
    loadDetailsTables;
    loadDetails;
    TTable.Edit;
  end;
  btnReset.Visible := not(Id = 0);
end;


constructor TfrmEditAncestor.Create(Owner: TComponent; ID: Integer;
  AdoTable: TADOTable; Key: String);
begin
  inherited Create(Owner);
  TableObjectList := TObjectList.Create;
  TTable := AdoTable;
  Eenmaal;
  Self.Id := Id;
  MasterKey := Key;
  if Id = 0  then begin
    TTable.Insert;
    loadValues;
  end
  else begin
    loadValues;
    loadDetailsTables;
    loadDetails;
    TTable.Edit;
  end;
  btnReset.Visible := not(Id = 0);
end;

procedure TfrmEditAncestor.loadValues;
begin
    LblAangemaakDoor.Caption := 'Aangemaakt door: ' + TTable.FieldByName('AangemaaktDoor').AsString ;
    lblAangemaaktOp.Caption := 'Aangemaakt op: ' + TTable.FieldByName('AangemaaktOp').AsString;
end;

procedure TfrmEditAncestor.saveValues;
var I: Integer;
begin
  for I := 0 to TableObjectList.Count -1 do begin
    TADOTable(TableObjectList.Items[I]).UpdateBatch;
  end;
  TTable.UpdateBatch;
end;

procedure TfrmEditAncestor.btnSaveClick(Sender: TObject);
begin
  if TTable.FieldByName('AangemaaktDoor').AsString = '' then begin
    TTable.FieldByName('AangemaaktDoor').AsString := TfrmMain(Owner).user;
    TTable.FieldByName('AangemaaktOp').AsDateTime := Date;
  end;
  saveValues;
end;

procedure TfrmEditAncestor.btnCancelClick(Sender: TObject);
begin
  cancelValues;
end;

procedure TfrmEditAncestor.cancelValues;
var I: Integer;
begin
  for I := 0 to TableObjectList.Count -1 do begin
    try
      TADOTable(TableObjectList.Items[I]).CancelBatch; 
    except
    on E: Exception do 
       //
    end;
  end;
  TTable.Cancel;
end;

procedure TfrmEditAncestor.loadDetails;
var I: Integer;
begin
  for I := 0 to TableObjectList.Count -1 do begin
    TADOTable(TableObjectList.Items[I]).Filtered := False;
    TADOTable(TableObjectList.Items[I]).Filter := Masterkey+ '= '+ IntToStr(Id);
    TADOTable(TableObjectList.Items[I]).Filtered := True;
  end;
  // verder vullen bij kind    
//  frameDagen.lvwItems.Clear;
end;

procedure TfrmEditAncestor.loadDetailsTables;
begin
//vullen bij kind
//  TDagen := TfrmMain.GetTableDagen;
//  TableObjectList.Add(TDagen);
//  frameDagen.FTable := TDagen;
end;

procedure TfrmEditAncestor.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #27 then begin
      TTable.Cancel;
      Close
    end;
end;

procedure TfrmEditAncestor.btnResetClick(Sender: TObject);
begin
  TTable.Cancel;
  loadValues;
  loadDetailsTables;
  loadDetails;
  TTable.edit;
end;


procedure TfrmEditAncestor.Eenmaal;
begin
//
end;

procedure TfrmEditAncestor.fillCmb(cmb: TComboBox; cmbTable:TADOTable; FieldName, def:String);
var I: Integer;
begin
  for I := 0 to cmbTable.RecordCount -1 do begin
    cmb.AddItem(cmbTable.FieldByName(FieldName).AsString, Pointer(cmbTable.FieldByName('Id').AsInteger));
    if(cmbTable.FieldByName(FieldName).AsString = def) then begin
      cmb.ItemIndex := I;
    end;
  end;
end;

end.
