unit MainAncestor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ImgList, ComCtrls, ToolWin, DB, ADODB,
  Menus, shellapi, Contnrs, inifiles, MyListView,
  PasswordAncestor, SettingAncestor, HEdit, HolderEdits;

const
  WM_ICONTRAY = WM_USER + 1;

type
  TfrmMainAncestor = class(TForm)
    imgMainButtons: TImageList;
    imgPmSmall: TImageList;
    pnlHeader: TPanel;
    lblHeader: TLabel;
    CoolBar: TCoolBar;
    ToolBar: TToolBar;
    btnNew: TToolButton;
    btnEdit: TToolButton;
    btnDelete: TToolButton;
    Seperator: TToolButton;
    DBCConnection: TADOConnection;
    StatusBar: TStatusBar;
    DBTUsers: TADOTable;
    DBTQuery: TADOQuery;
    DBTUsersId: TAutoIncField;
    DBTUsersgebruiker: TWideStringField;
    DBTUserswachtwoord: TWideStringField;
    DBTUserstype: TIntegerField;
    MainMenu1: TMainMenu;
    edtZoeken: TEdit;
    pmpSysTray: TPopupMenu;
    pmpGoster: TMenuItem;
    pmpRestart: TMenuItem;
    pmpKapat: TMenuItem;
    btnBegin: TToolButton;
    lvwItems: TMyListView;
    Bestand1: TMenuItem;
    Help1: TMenuItem;
    btnAbout: TMenuItem;
    btnRestart: TMenuItem;
    btnClose: TMenuItem;
    Extra1: TMenuItem;
    Instellingen1: TMenuItem;
    pmpNewMenu: TPopupMenu;
    pmpNewKopie: TMenuItem;
    btnPrint: TToolButton;
    DBTClone: TADOTable;
    ToolButton2: TToolButton;
    btnPrinten: TToolButton;
    pnlExtra: TPanel;
    lvwExtra: TListView;
    procedure FormCreate(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure lvwItemsSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure btnCloseClick(Sender: TObject);
    procedure btnRestartClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtZoekenKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pmpGosterClick(Sender: TObject);
    procedure pmpRestartClick(Sender: TObject);
    procedure btnHideClick(Sender: TObject);
    procedure btnaboutClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Instellingen1Click(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure pmpNieuwClick(Sender: TObject);
    procedure pmpNewKopieClick(Sender: TObject);
    procedure btnPrintenClick(Sender: TObject);
    procedure btnBeginClick(Sender: TObject);
  private
    TrayIconData: TNotifyIconData;
    procedure TrayMessage(var Msg: TMessage); message WM_ICONTRAY;
    procedure Initialize(var Message: TMessage); message WM_USER;
    procedure LoadDatabase;
  protected
    FieldCaptionAndFieldName: TStringList;
    FieldCaptionAndFieldType: TStringList;
    ExtraFieldCaptionAndFieldName: TStringList;
    ExtraFieldCaptionAndFieldType: TStringList;
    DatabaseLocation: String;
    DatabaseName: String;
    objectType: String;
    CurrentTable: TADOTable;
    ExtraTable: TADOTable;
    CurrentId: Integer;
    AdoTableList: TObjectList;
    Filtering: Boolean;
    SQL: String;
    frmHEdit: TfrmHEdit;
    showFix: Boolean;
    procedure ExportToExcel;
    procedure SendMail();
    procedure CloseDatase;
    procedure SetFilterFalse;
    procedure LoadFiltered(SQL: String); virtual;
    procedure Refresh; virtual;
    procedure RefreshExtraData(); virtual;
    procedure Zoeken; virtual;
    procedure ButtonClicked; virtual;
    procedure CloneSelected; virtual;
    procedure CloneRow(ATable, CloneTable: TADOTable; Tid: Integer);
    procedure CloneSubRows(ATable, CloneTable: TADOTable; Tid, Fid: Integer;
      FName: String);
    procedure CloneSubRow(ATable, CloneTable: TADOTable; Fid: Integer;
      FName: String);
    procedure OpenSettings(frmSettingAnc: TfrmSettingAncestor);
    procedure ShowOverzicht; virtual;
    procedure addColumn(Name: STring; Size: Integer); overload;
    procedure addColumn(Name: STring; Size: Integer; alignment: TAlignment); overload;
    procedure addColumn(CaptionName, FieldName: string; Size: Integer);overload;
    procedure addColumn(CaptionName, FieldName: string; Size: Integer; lvw: TListView);overload;
    procedure addColumn(CaptionName, FieldName, FieldType: string; Size: Integer);overload;
    procedure addColumn(CaptionName, FieldName, FieldType: string; Size: Integer; lvw: TListView);overload;
    procedure addColumn(CaptionName, FieldName, FieldType: string; Size: Integer; lvw: TListView;  alignment: TAlignment);overload;
    procedure OpenDatasets; virtual;
    procedure ExecuteFix; virtual;
    procedure SetDBReady(Filter, SortField: String);
    function GetEdtFieldFilter(FieldName: String; edtField: TEdit): String;
    function GetCurrencyFieldFilter(FieldName: String; edtField: THCurrencyEdit): String;
    function GetComboFieldFilter(FieldName: String; edtField: TCombobox): String;
    function GetLastNr(SortFieldName: String; STable:TADOTable): String;
    procedure StartProcs(); virtual;
    procedure ClearPanelFilter(panel: TPanel);
    function GetFilterFromPanel(panel: TPanel): String;
    procedure LoadSearchFields(panel: TPanel);
    procedure LoadComboField(comboField:TComboBox);
    procedure FillCmb(cmb: TComboBox; def: String);
  public
    Inifile: TIniFile;
    userType: Integer;
    user: String;
    setup: Boolean;
    procedure ReloadDatabase;
    procedure RefreshBackground(); virtual;
    function GetTablePassword: TADOTable;
    function GetTable(tableName: String): TADOTable; virtual;
    function GetReportTable(tableName: String): TADOTable; virtual;
  end;

var
  frmMainAncestor: TfrmMainAncestor;

implementation

uses StrUtils, ComObj;

{$R *.dfm}

type
  TLVBKIMAGE = packed record
    ulFlags: longint;
    hbm: HBitmap;
    pszImage: PChar;
    cchImageMax: Word;
    xOffsetPercent: Integer;
    yOffsetPercent: Integer;
  end;

const
  CLR_NONE = $FFFFFFFF;

  LVM_FIRST = $1000;
  LVM_SETTEXTBKCOLOR = (LVM_FIRST + 38);
  LVM_SETBKIMAGE = (LVM_FIRST + 68);

  LVBKIF_SOURCE_NONE = 0;
  LVBKIF_SOURCE_HBITMAP = 1;
  LVBKIF_SOURCE_URL = 2;
  LVBKIF_SOURCE_MASK = 3;
  LVBKIF_STYLE_NORMAL = 0;
  LVBKIF_STYLE_TILE = 16;
  LVBKIF_STYLE_MASK = 16;

procedure TfrmMainAncestor.FillCmb(cmb: TComboBox; def: String);
var I: Integer;
    table:String;
    field:String;
begin
  table :=  cmb.ImeName;
  field := cmb.Hint;
  DBTQuery.SQL.Clear;
  DBTQuery.SQL.Add('Select *  from '+ table);
  DBTQuery.ExecSQL;

  DBTQuery.Open;
  DBTQuery.First;

  cmb.AddItem('', Pointer(0));

  for I := 0 to DBTQuery.RecordCount -1 do begin
    cmb.AddItem(DBTQuery.FieldByName(field).AsString, Pointer(DBTQuery.FieldByName('Id').AsInteger));
    if(DBTQuery.FieldByName(field).AsString = def) then begin
      cmb.ItemIndex := I;
    end;
    DBTQuery.Next;
  end;
  if cmb.ItemIndex = -1 then
    cmb.ItemIndex := 0;
end;

procedure TfrmMainAncestor.FormCreate(Sender: TObject);
begin
  Inifile := TIniFile.Create(ExtractFilePath(Application.ExeName) +
    'config.ini');
  PostMessage(Self.Handle, WM_USER, 0, 0);
  showFix := Inifile.ReadString('app', 'convert', '') = 'datum';
  setup := Inifile.ReadString('app', 'setup', '') = 'muhaha';

  FieldCaptionAndFieldName := TStringList.Create;
  FieldCaptionAndFieldType := TStringList.Create;
  ExtraFieldCaptionAndFieldName := TStringList.Create;
  ExtraFieldCaptionAndFieldType := TStringList.Create;

  ReloadDatabase;
  StartProcs();
end;

procedure TfrmMainAncestor.lvwItemsSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  btnNew.Enabled := True;
  if Selected then
  begin
    //CurrentId := Integer(lvwItems.Selected.Data);
    //btnEdit.Enabled := not(Selected and (lvwItems.Selected.Data = nil));
   // btnDelete.Enabled := not(Selected and (lvwItems.Selected.Data = nil));
   // btnPrint.Enabled := not(Selected and (lvwItems.Selected.Data = nil));
    CurrentId :=Integer(Item.ListView.Selected.Data);
    btnEdit.Enabled := Selected;
    btnDelete.Enabled := Selected;
    btnPrint.Enabled := Selected;
    //pmpNewKopie.Visible := not(Selected and (lvwItems.Selected.Data = nil));

    //pmpNewKopie.Visible := Selected and not((lvwItems.Selected = nil)) and not((lvwItems.Selected.Data = nil));
  end
  else begin
    btnEdit.Enabled := false;
    btnDelete.Enabled := false;
  end;
end;

procedure TfrmMainAncestor.Refresh;
begin
  // moet in de inherited
end;

procedure TfrmMainAncestor.btnDeleteClick(Sender: TObject);
begin
  if MessageDlg('Weet u zeker dat u wilt verwijderen?', mtConfirmation,
    [mbOK, mbCancel], 0) = mrOk then
  begin
    if lvwItems.Selected = nil then
      Exit;
    CurrentTable.Locate('ID', Integer(lvwItems.Selected.Data), []);
    CurrentTable.Delete;
    Refresh;
  end;
end;

function TfrmMainAncestor.GetTablePassword: TADOTable;
begin
  DBTUsers.Refresh;
  Result := DBTUsers;
end;

procedure TfrmMainAncestor.FormShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if (Msg.Charcode = VK_INSERT) then
  begin
    btnNew.Click;
    Handled := True;
  end
  else if (Msg.Charcode = 112) then
  begin
    btnAbout.Click;
    Handled := True;
  end
  else if (Msg.Charcode = 114) then
  begin
    edtZoeken.SetFocus;
  end
  else
  begin
    if (lvwItems.Focused) then
    begin
      if (Msg.Charcode = VK_RETURN) then
      begin
        btnEdit.Click;
        Handled := True;
      end
      else if (Msg.Charcode = VK_DELETE) then
      begin
        btnDelete.Click;
        Handled := True;
      end
    end
  end;
end;

function TfrmMainAncestor.GetCurrencyFieldFilter(FieldName: String;
  edtField: THCurrencyEdit): String;
var
  tempString: String;
begin
  if edtField.Value > 0 then
  begin
    tempString := ' AND ' + FieldName + '=' + FloatToStr(edtField.Value);
    Result := StringReplace(tempString, ',', '.', [rfReplaceAll])
  end
  else
    Result := '';
end;

function TfrmMainAncestor.GetEdtFieldFilter(FieldName: String;
  edtField: TEdit): String;
begin
      { TODO : Like is not working }
  if not(edtField.Text = '') then begin
    if edtField.ImeName = 'like' then
      Result := ' AND ' + FieldName + ' like ' + QuotedStr(edtField.Text + '*')
    else
      Result := ' AND ' + FieldName + '='  + edtField.Text;
  end
  else
    Result := '';
end;

function TfrmMainAncestor.GetLastNr(SortFieldName: String;
  STable: TADOTable): String;
begin

  DBTQuery.Connection := STable.Connection;
  DBTQuery.SQL.Clear;
  DBTQuery.SQL.Add('Select * from ' + STable.TableName + ' Order by '+ SortFieldName + ' DESC');

  if not DBTQuery.Active then
    DBTQuery.Open;

  DBTQuery.ExecSQL;
  //DBTQuery.Last;
  //Result := DBTQuery.FieldByName(SortFieldName).AsString;
  DBTQuery.First;
  Result := DBTQuery.FieldByName(SortFieldName).AsString;
end;

function TfrmMainAncestor.GetComboFieldFilter(FieldName: String;
  edtField: TCombobox): String;
begin
  if not(edtField.Text = '') and not (edtField.Text = edtField.TextHint) then
    Result := ' AND ' + FieldName + '=' + QuotedStr(edtField.Text)
  else
    Result := '';
end;

procedure TfrmMainAncestor.Zoeken;
begin
  LoadFiltered(SQL);
end;

procedure TfrmMainAncestor.LoadFiltered(SQL: String);
begin
  // moet in deinherited
end;

procedure TfrmMainAncestor.btnBeginClick(Sender: TObject);
begin
  Refresh;
end;

procedure TfrmMainAncestor.btnCloseClick(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
  Application.Terminate;
end;

procedure TfrmMainAncestor.btnRestartClick(Sender: TObject);
var
  AppName: PChar;
begin
  AppName := PChar(Application.ExeName);
  ShellExecute(Handle, 'open', AppName, nil, nil, SW_SHOWNORMAL);
  Application.Terminate;
end;

procedure TfrmMainAncestor.btnHideClick(Sender: TObject);
begin
  with TrayIconData do
  begin
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(szTip, Application.Title);
  end;
  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
  Hide;
end;

procedure TfrmMainAncestor.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    SetFilterFalse;
  end;
end;

procedure TfrmMainAncestor.SendMail;
const
  olMailItem = 0;
var
  Outlook: OLEVariant;
  MailItem: Variant;
  MailInspector : Variant;
  stringlist : TStringList;
begin
  try
   Outlook:=GetActiveOleObject('Outlook.Application') ;
  except
   Outlook:=CreateOleObject('Outlook.Application') ;
  end;
  try
    Stringlist := TStringList.Create;
    MailItem := Outlook.CreateItem(olMailItem) ;
    MailItem.Subject := 'subject here';
    MailItem.Recipients.Add('someone@yahoo.com');
    MailItem.Attachments.Add('c:\boot.ini');
    Stringlist := TStringList.Create;
    StringList.Add('body here');
    MailItem.Body := StringList.text;
    MailInspector := MailItem.GetInspector;
    MailInspector.display(true); //true means modal
  finally
    Outlook := Unassigned;
    StringList.Free;
  end;
end;

procedure TfrmMainAncestor.SetDBReady(Filter, SortField: String);
begin
  lvwItems.Clear;
  lvwItems.Columns.Clear;

  CurrentTable.Filtered := False;
  if (AnsiStartsStr(' AND', Filter)) then
    CurrentTable.Filter := Copy(Filter, Pos('AND', Filter) + 4)
  else
    CurrentTable.Filter := Filter;
  CurrentTable.Filtered := True;
  CurrentTable.Sort := SortField;
  CurrentTable.Last;
  CurrentTable.RecNo;
end;

procedure TfrmMainAncestor.SetFilterFalse;
begin
  Filtering := False;
  ClearPanelFilter(nil);
  Refresh;
end;

function TfrmMainAncestor.GetFilterFromPanel(panel: TPanel): String;
var
  I: Integer;
  edt: TEdit;
  curr: THCurrencyEdit;
  combo: TComboBox;
  FieldName, FilterString: String;
  pnl:TPanel;
begin
  if panel = nil then
    pnl := pnlHeader
  else
    pnl := panel;

  for I := 0 to pnl.ControlCount - 1 do
  begin
    if pnl.Controls[I].Visible then
    begin
      if pnl.Controls[I] is TEdit then
      begin
        edt := TEdit(pnl.Controls[I]);
        FieldName := edt.HelpKeyword;
        FilterString := FilterString +
          GetEdtFieldFilter(FieldName, edt);
      end
      else if pnl.Controls[I] is THCurrencyEdit then
      begin
        curr := THCurrencyEdit(pnl.Controls[I]);
        FieldName := curr.HelpKeyword;
        FilterString := FilterString + GetCurrencyFieldFilter
          (FieldName, curr);
      end
      else if pnl.Controls[I] is TComboBox then
      begin
        combo := TComboBox(pnl.Controls[I]);
        FieldName := combo.HelpKeyword;
        FilterString := FilterString + GetComboFieldFilter
          (FieldName, combo);
      end;
    end;
  end;

  Result := FilterString;
end;

procedure TfrmMainAncestor.edtZoekenKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Zoeken;
end;

procedure TfrmMainAncestor.ExecuteFix;
begin
  // In the inherited
end;

procedure TfrmMainAncestor.TrayMessage(var Msg: TMessage);
var
  Point: TPoint;
begin
  case Msg.lParam of
    WM_LBUTTONDOWN, WM_RBUTTONDOWN:
      begin
        GetCursorPos(Point);
        pmpSysTray.Popup(Point.x, Point.y);
      end;
  end;
end;

procedure TfrmMainAncestor.pmpGosterClick(Sender: TObject);
begin
  Show;
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;

procedure TfrmMainAncestor.pmpRestartClick(Sender: TObject);
begin
  btnRestart.Click;
end;

procedure TfrmMainAncestor.addColumn(Name: String; Size: Integer);
var
  column: TListColumn;
begin
  lvwItems.Columns.BeginUpdate;
  column := lvwItems.Columns.Add;
  column.Caption := Name;
  column.Width := Size;
  column.alignment := taLeftJustify;

  lvwItems.Columns.EndUpdate;
end;

procedure TfrmMainAncestor.addColumn(Name: String; Size: Integer; alignment: TAlignment);
var
  column: TListColumn;
begin
  lvwItems.Columns.BeginUpdate;
  column := lvwItems.Columns.Add;
  column.Caption := Name;
  column.Width := Size;
  column.alignment := alignment;
  lvwItems.Columns.EndUpdate;
end;

procedure TfrmMainAncestor.addColumn(CaptionName, FieldName: string; Size: Integer);
begin
  addColumn(CaptionName, FieldName, 'edt', Size);
end;

procedure TfrmMainAncestor.addColumn(CaptionName, FieldName: string;  Size: Integer; lvw: TListView);
begin
  addColumn(CaptionName, FieldName, 'edt', Size, lvw);
end;

procedure TfrmMainAncestor.addColumn(CaptionName, FieldName, FieldType: string; Size: Integer);
begin
  addColumn(CaptionName, FieldName, FieldType, Size, lvwItems);
end;

procedure TfrmMainAncestor.addColumn(CaptionName, FieldName,FieldType: string; Size: Integer; lvw: TListView);
begin
  if FieldType = 'curr' then
    addColumn(CaptionName, FieldName, FieldType, Size, lvw, taRightJustify)
  else
    addColumn(CaptionName, FieldName, FieldType, Size, lvw, taLeftJustify)
end;

procedure TfrmMainAncestor.addColumn(CaptionName, FieldName, FieldType: string; Size: Integer; lvw: TListView; alignment: TAlignment);
var
  column: TListColumn;
begin
  if lvw = nil then begin
    column := lvwItems.Columns.Add;
    FieldCaptionAndFieldName.Values[CaptionName] := FieldName;
    FieldCaptionAndFieldType.Values[CaptionName] := FieldType;
  end
  else  begin
    column := lvw.Columns.Add;
    if lvw.Name = 'lvwItems' then begin
      FieldCaptionAndFieldName.Values[CaptionName] := FieldName;
      FieldCaptionAndFieldType.Values[CaptionName] := FieldType;
    end
    else begin
      ExtraFieldCaptionAndFieldName.Values[CaptionName] := FieldName;
      ExtraFieldCaptionAndFieldType.Values[CaptionName] := FieldType;
   end;
  end;
  column.Caption := CaptionName;
  column.Width := Size;
  column.alignment := alignment;
end;


procedure TfrmMainAncestor.btnaboutClick(Sender: TObject);
begin
  MessageDlg('' + #13 + 'Bu program Hökümet & Kiliç tarafindan yapilmistir.' +
    #13 + #13 + 'Istek ve temennileriniz için Hokumet@gmail.com adresine ' + #13
    + 'e-posta gönderebilirsiniz.' + #13 + #13 + 'Program versiyonu: 1.0',
    mtCustom, [mbOK], 0);

end;

procedure TfrmMainAncestor.btnPrintClick(Sender: TObject);
begin
  // Moet in de inherited     frmRepAncestor := TfrmRepAncestor.Create(Self,Integer(lvwItems.Selected.Data), DBTUyeler, DBTUyeGorevleri);
  if lvwItems.SelCount = 1 then
  begin
    // try
    // frmRepAncestor.ShowModal;
    // finally
    // frmRepAncestor.Free;
    // end;
  end
  else
  begin

  end;
end;

procedure TfrmMainAncestor.btnPrintenClick(Sender: TObject);
begin
  // try
  // frmRepAncestor.btnPrint.Click;
  // finally
  // frmRepAncestor.Free;
  // end;
end;

function TfrmMainAncestor.GetTable(tableName: String): TADOTable;
var
  I: Integer;
begin
  Result := nil;
  for I := 0 to AdoTableList.Count - 1 do
  begin
    if TADOTable(AdoTableList[I]).tableName = tableName then
    begin
      Result := TADOTable(AdoTableList[I]);
      Break;
    end;
  end;
end;

function TfrmMainAncestor.GetReportTable(tableName: String): TADOTable;
begin
  Result := nil;
end;

procedure TfrmMainAncestor.FormDestroy(Sender: TObject);
begin
  Inifile.Free;
  AdoTableList.Free;
  DBCConnection.Close;
  FieldCaptionAndFieldName.Free;
  FieldCaptionAndFieldType.Free;
  ExtraFieldCaptionAndFieldName.Free;
  ExtraFieldCaptionAndFieldType.Free;
end;

procedure TfrmMainAncestor.Initialize(var Message: TMessage);
var
  Bool: Boolean;
begin
//{$IFDEF HKC}
//  OpenDatasets;
//  btnBegin.Click;
//{$ELSE}
  Bool := False;
  PasswordAncestorDlg := TPasswordAncestorDlg.Create(Self);
  PasswordAncestorDlg.edtDatabase.Text := Inifile.ReadString('database',
    'path', '');

  try
    if PasswordAncestorDlg.ShowModal = mrOk then
    begin
      user := PasswordAncestorDlg.user;
      StatusBar.Panels.Items[1].Text := user;
      userType := PasswordAncestorDlg.userType;
      Bool := True;
      //OpenDatasets;
      //Refresh;
    end;
  finally
    PasswordAncestorDlg.Free;
    if not Bool then
      Application.Terminate()
      // else
      // btnGebruikers.Visible := not(userType = 1);
  end;
//{$ENDIF}
end;

procedure TfrmMainAncestor.Instellingen1Click(Sender: TObject);
begin
  frmSettingAncestor := TfrmSettingAncestor.Create(Self);
  try
    if frmSettingAncestor.ShowModal = mrOk then
      RefreshBackground;
  finally
    frmSettingAncestor.Free;
  end
end;

procedure TfrmMainAncestor.loadComboField(comboField: TComboBox);
var
  value: String;
begin
  value := CurrentTable.FieldByName(comboField.HelpKeyword).AsString;
  FillCmb(comboField,  value);
end;

procedure TfrmMainAncestor.RefreshBackground;
var
  BKimg: TLVBKIMAGE;
begin
  FillChar(BKimg, SizeOf(BKimg), 0);
  BKimg.ulFlags := LVBKIF_SOURCE_URL or LVBKIF_STYLE_TILE;
  if FileExists(ExtractFilePath(Application.ExeName) +
    Inifile.ReadString('anaekran', 'anaekran', '')) then
    BKimg.pszImage := PChar(ExtractFilePath(Application.ExeName) +
      Inifile.ReadString('anaekran', 'anaekran', ''));
  BKimg.xOffsetPercent := 0;
  BKimg.yOffsetPercent := 0;
  SendMessage(lvwItems.Handle, LVM_SETTEXTBKCOLOR, 0, CLR_NONE);
  SendMessage(lvwItems.Handle, LVM_SETBKIMAGE, 0, Integer(@BKimg));
end;

procedure TfrmMainAncestor.RefreshExtraData;
begin
  ///inherited
end;

procedure TfrmMainAncestor.ReloadDatabase;
begin
  CloseDatase;
  LoadDatabase;
  OpenDatasets;
  Refresh;
  LoadSearchFields(nil);
end;

procedure TfrmMainAncestor.LoadSearchFields(panel: TPanel);
var
  I: Integer;
  edt: TEdit;
  curr: THCurrencyEdit;
  combo: TComboBox;
  FieldName, FilterString: String;
  pnl:TPanel;

begin
  if panel = nil then
    pnl := pnlHeader
  else
    pnl := panel;

  for I := 0 to pnl.ControlCount - 1 do
  begin
    if pnl.Controls[I].Visible then
    begin
     if pnl.Controls[I] is TComboBox then
      begin
        combo := TComboBox(pnl.Controls[I]);
        LoadComboField(combo);
      end;
    end;
  end;
end;

procedure TfrmMainAncestor.LoadDatabase;
var
  Strlist: TStringList;
  PathZ: String;
begin
  Self.Caption := Inifile.ReadString('anaekran', 'titel', '');

  DatabaseLocation := Inifile.ReadString('database', 'path', '');
  DatabaseName := ExtractFileName(Application.ExeName);
  Strlist := TStringList.Create;

  if DatabaseLocation = '' then
  begin
    DatabaseLocation := ExtractFileDir(Application.ExeName);
    DatabaseLocation := DatabaseLocation + '\';
  end;

  PathZ := DatabaseLocation + ChangeFileExt(DatabaseName, '.accdb');
  DatabaseName := ChangeFileExt(DatabaseName, '.accdb');

  if not(FileExists(PathZ)) then
  begin
    PathZ := DatabaseLocation + ChangeFileExt(DatabaseName, '.mdb');
    DatabaseName := ChangeFileExt(DatabaseName, '.mdb');
  end
  else
  begin
    PathZ := PathZ + ';';
  end;
  Inifile.WriteString('database', 'path', DatabaseLocation);
  // EEROOOOOOOOR is ierrrrrr
  // HKC Strlist.Add('Provider=Microsoft.Jet.OLEDB.4.0;');
  // Strlist.Add('Data Source='+ PathZ);
  // Strlist.Add('Persist Security Info=False');

  Strlist.Add('Provider=Microsoft.ACE.OLEDB.12.0;');
  Strlist.Add('Data Source=' + PathZ);
  Strlist.Add
    ('Persist Security Info=True;Jet OLEDB:Database Password=ihhmuhasebe');

  DBCConnection.ConnectionString := Strlist.Text;
  DBCConnection.Connected := True;

  // Provider=Microsoft.ACE.OLEDB.12.0;Password="";
  // Data Source=D:\temp\Administratie.accdb;
  // Persist Security Info=True;Jet OLEDB:Database Password=ihhmuhasebe

  AdoTableList := TObjectList.Create;
  // DBTUyeler.Open;
  // AdoTableList.Add(DBTUyeler);
  //OpenDatasets;
  Filtering := False;
end;

procedure TfrmMainAncestor.btnEditClick(Sender: TObject);
begin
  try
    if frmHEdit.ShowModal = mrOk then begin
      if lvwItems.Focused then
        Refresh
      else
        RefreshExtraData
    end;
  finally
    frmHEdit.Free;
  end;
end;

procedure TfrmMainAncestor.ButtonClicked;
begin
  DBTClone.tableName := CurrentTable.tableName;
  CurrentTable.Filtered := False;
  edtZoeken.Text := '';
end;

procedure TfrmMainAncestor.pmpNieuwClick(Sender: TObject);
begin
  btnNew.Click;
end;

procedure TfrmMainAncestor.pmpNewKopieClick(Sender: TObject);
begin
  CloneSelected;
  Refresh;
end;

procedure TfrmMainAncestor.CloneSelected;
begin
  CloneRow(CurrentTable, DBTClone, Integer(lvwItems.Selected.Data));
end;

procedure TfrmMainAncestor.ClearPanelFilter(panel: TPanel);
var
  I: Integer;
  edt: TEdit;
  curr: THCurrencyEdit;
  combo: TComboBox;
  FieldName: String;
  pnl:TPanel;
begin
  if panel = nil then
    pnl := pnlHeader
  else
    pnl := panel;

  for I := 0 to pnl.ControlCount - 1 do
  begin
    if pnl.Controls[I].Visible then
    begin
      if pnl.Controls[I] is TEdit then
      begin
        edt := TEdit(pnl.Controls[I]);
        edt.Clear;
      end
      else if pnl.Controls[I] is THCurrencyEdit then
      begin
        curr := THCurrencyEdit(pnl.Controls[I]);
        curr.Clear;
      end
      else if pnl.Controls[I] is TComboBox then
      begin
        combo := TComboBox(pnl.Controls[I]);
        combo.ItemIndex := -1;
      end;
    end;
  end;
end;

procedure TfrmMainAncestor.CloneRow(ATable, CloneTable: TADOTable;
  Tid: Integer);
var
  I: Integer;
begin
  CloneTable.Open;
  CloneTable.Locate('ID', Tid, []);
  ATable.Append;
  for I := 1 to CloneTable.Fields.Count - 1 do
  begin
    ATable.Fields[I].AsVariant := CloneTable.Fields[I].AsVariant;
  end;
  ATable.Post;
  ATable.UpdateBatch();
  CloneTable.Close;
end;

procedure TfrmMainAncestor.CloneSubRows(ATable, CloneTable: TADOTable;
  Tid, Fid: Integer; FName: String);
var
  I: Integer;
begin
  CloneTable.Open;
  CloneTable.Filtered := False;
  CloneTable.Filter := FName + '=' + IntToStr(Tid);
  CloneTable.Filtered := True;
  CloneTable.First;
  for I := 0 to CloneTable.RecordCount - 1 do
  begin
    CloneSubRow(ATable, CloneTable, Fid, FName);
    CloneTable.Next;
  end;
  CloneTable.Close;
end;

procedure TfrmMainAncestor.CloseDatase;
begin
  DBCConnection.Close;
end;

procedure TfrmMainAncestor.CloneSubRow(ATable, CloneTable: TADOTable;
  Fid: Integer; FName: String);
var
  I: Integer;
begin
  ATable.Append;
  for I := 1 to CloneTable.Fields.Count - 1 do
  begin
    ATable.Fields[I].AsVariant := CloneTable.Fields[I].AsVariant;
  end;
  ATable.FieldByName(FName).AsInteger := Fid;
  ATable.Post;
  ATable.UpdateBatch();
end;

procedure TfrmMainAncestor.OpenDatasets;
begin
  // in de inherited

  DBTUsers.Open
end;

procedure TfrmMainAncestor.OpenSettings(frmSettingAnc: TfrmSettingAncestor);
begin
  try
    if frmSettingAnc.ShowModal = mrOk then
      RefreshBackground;
  finally
    frmSettingAnc.Free;
  end
end;

procedure TfrmMainAncestor.ShowOverzicht;
begin
  // in de inherited
end;

procedure TfrmMainAncestor.StartProcs;
begin
/// in the inherited
end;

procedure TfrmMainAncestor.ExportToExcel;
var
  { excel }
  Sheet, objExcel: Variant;
  Title: String;
  x, y: Integer;
begin
  Screen.Cursor := crHourGlass;
  try
    Title := 'Gekopieerde '+lvwItems.HelpKeyword+' gegevens';
    { create an instance of excel }
    objExcel := CreateOleObject('Excel.Application');
    objExcel.Visible := True;
    objExcel.Caption := 'Kopie ' + lvwItems.HelpKeyword;
    { add the sheet }
    objExcel.Workbooks.Add;
    objExcel.Workbooks[1].Sheets.Add;
    objExcel.Workbooks[1].WorkSheets[1].Name := Title;
    Sheet := objExcel.Workbooks[1].WorkSheets[Title];
    { create the columns }
    for x := 0 to (lvwItems.Columns.Count - 1) do begin
      Sheet.Cells[1, (x + 1)].Font.Bold := True;
      Sheet.Cells[1, (x + 1)] := lvwItems.Columns.Items[x].Caption;
    end;
    for y := 0 to (lvwItems.Items.Count - 1) do
    begin
      if lvwItems.Items.Item[y].Selected or (lvwItems.Selected = nil) then begin
        Sheet.Cells[(y + 3), 1] := lvwItems.Items.Item[y].Caption;
        for x := 0 to (lvwItems.Columns.Count - 2) do
        begin
              { if there was a conversion error then just add as normal i.e. string }
              Sheet.Cells[(y + 3), (x + 2)] := lvwItems.Items.Item[y]
                .SubItems.Strings[x];
        end;
      end;
    end;
    { Select cells and format }
    objExcel.Cells.select;
    objExcel.Selection.Font.Size := 9;
    objExcel.Selection.Font.Name := 'Arial';
    objExcel.Selection.Columns.AutoFit;
  except
    begin
      Screen.Cursor := crDefault;
      MessageDlg('Excel transaction cancelled.', mtInformation, [mbOK], 0);
      Exit;
    end;
  end;
  Screen.Cursor := crDefault;
end;


end.
