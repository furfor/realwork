unit MainLiteExpress;

interface

uses
  Windows, Forms,
  MainMDIEx, MainEditor, Dialogs, l3ProgressComponent, l3Filer, k2Reader, evEvdRd,
  k2TagGen, k2DocumentGenerator, evdWriter, ImgList, Controls, OvcBase,
  
  l3Types,
  l3Base,
  l3Units,
  l3InterfacedComponent, evSubPn, Classes, dxBar, StdCtrls,

  nevTools,

  evAction, ActnList, StdActns, evSaveDocumentManager,
  evLoadDocumentManager,
  evEditorWindow,
  evInternalInterfaces,
  evEditorInterfaces,
  
  dxBarExtItems, k2StackGenerator, DdeMan, ComCtrls, Tabs, 
  evdReader, k2FileGenerator,

  nevNavigation,
  nevGUIInterfaces
  ;

type
  TMainLiteExpressForm = class(TMainEditorForm)
    dxBarManager: TdxBarManager;
    acFileExit: TFileExit;
    acOpen: TevAction;
    acNew: TevAction;
    acSave: TevAction;
    acSaveAs: TevAction;
    acUndo: TevAction;
    acRedo: TevAction;
    acPrintEx: TevAction;
    acCut: TevAction;
    acCopy: TevAction;
    acPaste: TevAction;
    acDelete: TevAction;
    acSpecialPaste: TevAction;
    acAdd: TevAction;
    acSelectAll: TevAction;
    acHideSelection: TevAction;
    acShowSpecial: TevAction;
    acShowDocumentParts: TevAction;
    acPrintPreviewMode: TevAction;
    acInsertSBS: TevAction;
    acInsertTable: TevAction;
    acInsertRow: TevAction;
    acDeleteRow: TevAction;
    acInsertColumn: TevAction;
    acDeleteColumn: TevAction;
    acMergeCells: TevAction;
    acSplitCells: TevAction;
    acJustifyLeft: TevAction;
    acJustifyCenter: TevAction;
    acJustifyRight: TevAction;
    acJustifyWidth: TevAction;
    acJustifyPreformatted: TevAction;
    btNew: TdxBarButton;
    miFile: TdxBarSubItem;
    btExit: TdxBarButton;
    btOpen: TdxBarButton;
    btCopy: TdxBarButton;
    btCut: TdxBarButton;
    btPaste: TdxBarButton;
    btPasteSpecial: TdxBarButton;
    miText: TdxBarSubItem;
    btUndo: TdxBarButton;
    btRedo: TdxBarButton;
    btAdd: TdxBarButton;
    btDelete: TdxBarButton;
    btSelectAll: TdxBarButton;
    btHideSelection: TdxBarButton;
    btShowSpecial: TdxBarButton;
    miView: TdxBarSubItem;
    btJustifyLeft: TdxBarButton;
    btJustifyCenter: TdxBarButton;
    btJustifyRight: TdxBarButton;
    btJustifyWidth: TdxBarButton;
    btJustifyPreformatted: TdxBarButton;
    miFormat: TdxBarSubItem;
    btInsertTable: TdxBarButton;
    btInsertRow: TdxBarButton;
    btDeleteRow: TdxBarButton;
    btInsertColumn: TdxBarButton;
    btDeleteColumn: TdxBarButton;
    acVAlignTop: TevAction;
    acVAlignCenter: TevAction;
    acVAlignBottom: TevAction;
    btVAlignTop: TdxBarButton;
    btVAlignCenter: TdxBarButton;
    btVAlignBottom: TdxBarButton;
    btSave: TdxBarButton;
    btSaveAs: TdxBarButton;
    btMergeCells: TdxBarButton;
    acHSplit: TevAction;
    acVSplit: TevAction;
    btHSplit: TdxBarButton;
    btShowDocumentParts: TdxBarButton;
    btPrintEx: TdxBarButton;
    acPrint: TevAction;
    btPrint: TdxBarButton;
    acDrawLines: TevAction;
    btDrawLines: TdxBarButton;
    btPrintPreview: TdxBarButton;
    acSearch: TevAction;
    acReplace: TevAction;
    acSearchAgain: TevAction;
    btSearch: TdxBarButton;
    btReplace: TdxBarButton;
    btSearchAgain: TdxBarButton;
    miSearch: TdxBarSubItem;
    acWindowCascade: TWindowCascade;
    acWindowTileHorizontal: TWindowTileHorizontal;
    acWindowTileVertical: TWindowTileVertical;
    acWindowMinimizeAll: TWindowMinimizeAll;
    acWindowArrange: TWindowArrange;
    btCascade: TdxBarButton;
    btTile: TdxBarButton;
    btMinimizeAll: TdxBarButton;
    btArrangeIcons: TdxBarButton;
    miWindow: TdxBarSubItem;
    acWindowClose: TWindowClose;
    btClose: TdxBarButton;
    acPersistent: TevAction;
    btPersistent: TdxBarButton;
    miMRU: TdxBarMRUListItem;
    liMDIChildren: TdxBarListItem;
    cbStyles: TdxBarCombo;
    acSplitTable: TevAction;
    acMergeTables: TevAction;
    btMergeTables: TdxBarButton;
    btSordersAndShade: TdxBarButton;
    seZoom: TdxBarSpinEdit;
    acMergeCellsHorz: TevAction;
    acMergeCellsVert: TevAction;
    btMergeCellsHorz: TdxBarButton;
    btMergeCellsVert: TdxBarButton;
    btInsertFile: TdxBarButton;
    miInsert: TdxBarSubItem;
    btInsertPicture: TdxBarButton;
    btInsertSBS: TdxBarButton;
    acSpellcheck: TevAction;
    btSpellCheck: TdxBarButton;
    miTools: TdxBarSubItem;
    acInsertPageBreak: TevAction;
    acInsertSectionBreak: TevAction;
    btInsertPageBreak: TdxBarButton;
    btInsertSectionBreak: TdxBarButton;
    miInsertBreak: TdxBarSubItem;
    btSubProperties: TdxBarButton;
    btSubDelete: TdxBarButton;
    btDocumentPartMerge: TdxBarButton;
    pmSub: TdxBarPopupMenu;
    pmSection: TdxBarPopupMenu;
    pmHyperlink: TdxBarPopupMenu;
    pmCell: TdxBarPopupMenu;
    btSectionPortrait: TdxBarButton;
    btSectionLandscape: TdxBarButton;
    btSectionSizeA4: TdxBarButton;
    btSectionSizeA3: TdxBarButton;
    btCellBordersAndShade: TdxBarButton;
    btCellMerge: TdxBarButton;
    btCellDelete: TdxBarButton;
    btHyperlinkProperties: TdxBarButton;
    btHyperlinkFollow: TdxBarButton;
    btHyperlinkDelete: TdxBarButton;
    pmEditor: TdxBarPopupMenu;
    pmExplorer: TdxBarPopupMenu;
    btSubFollow: TdxBarButton;
    btBuildDocumentStructure: TdxBarButton;
    btSendDocument: TdxBarButton;
    btEditStyles: TdxBarButton;
    acVisible: TevAction;
    btVisible: TdxBarButton;
    acWebStyle: TevAction;
    btWebStyle: TdxBarButton;
    btStyle1: TdxBarButton;
    btStyle2: TdxBarButton;
    btStyle3: TdxBarButton;
    btStyle4: TdxBarButton;
    btStyle5: TdxBarButton;
    btStyle6: TdxBarButton;
    btStyle7: TdxBarButton;
    btStyle8: TdxBarButton;
    btStyle9: TdxBarButton;
    btStyle0: TdxBarButton;
    siStyle: TdxBarSubItem;
    StatusBar: TStatusBar;
    btAdjustMargin: TdxBarButton;
    btInsertBlock: TdxBarButton;
    btConvertTextToTable: TdxBarButton;
    btLo2Up: TdxBarButton;
    btUp2Lo: TdxBarButton;
    btSwapLoUp: TdxBarButton;
    miConvert: TdxBarSubItem;
    btText2Para: TdxBarButton;
    btBuildContents: TdxBarButton;
    btMergeRows: TdxBarButton;
    dxBarSubItem1: TdxBarSubItem;
    btMDIChildrenList: TdxBarButton;
    btDeleteAllDocumentParts: TdxBarButton;
    btBullet: TdxBarButton;
    btNumbering: TdxBarButton;
    btIncIndent: TdxBarButton;
    btDecIndent: TdxBarButton;
    btSectionSizeA2: TdxBarButton;
    btSectionSizeA1: TdxBarButton;
    btAutoCompleteCfg: TdxBarButton;
    btAutoComplete: TdxBarButton;
    btnConvertTextToTable: TdxBarButton;
    dxInsertSubItems: TdxBarSubItem;
    dxDeleteItems: TdxBarSubItem;
    btnDeleteTable: TdxBarButton;
    btnDeleteCell: TdxBarButton;
    dxMergeCells: TdxBarSubItem;
    dxSplitCells: TdxBarSubItem;
    btnSplitTable: TdxBarButton;
    btnAlignBorrowCells: TdxBarButton;
    btnCellsNumbersAlign: TdxBarButton;
    btnInputCellWidth: TdxBarButton;
    dxTables: TdxBarSubItem;
    btnRussian: TdxBarButton;
    btnEngCharset: TdxBarButton;
    btnOEM2ANSI: TdxBarButton;
    btnANSI2OEM: TdxBarButton;
    btnDate2Text: TdxBarButton;
    btnMergePara: TdxBarButton;
    dxCellAlign: TdxBarSubItem;
    btVSplit: TdxBarButton;
    bcAlignWithSeparator: TdxBarButton;
    dxAboutBox: TdxBarButton;
    dxBarHelp: TdxBarSubItem;
    dxDocInfo: TdxBarButton;
    dxJump2Sub: TdxBarButton;
    dxFindTable: TdxBarButton;
    dxTblSetFrame: TdxBarButton;
    dxTblDelFrame: TdxBarButton;
    acOldNSRCTable: TevAction;
    dxOldNSRC: TdxBarButton;
    dxCopyWidths: TdxBarButton;
    dxPasteWidth: TdxBarButton;
    dxAAC: TdxBarButton;
    dxVerInfo: TdxBarButton;
    dxNotInPower: TdxBarButton;
    dxAppHeader: TdxBarButton;
    dxTextNonPrintable: TdxBarButton;
    dxTextSetPrintable: TdxBarButton;
    dxTranslate2Text: TdxBarButton;
    dxSetSeparators: TdxBarButton;
    dxInsertSubBtn: TdxBarButton;
    btnSplitCells: TdxBarButton;
    procedure miMRUClick(Sender: TObject);
    procedure liMDIChildrenGetData(Sender: TObject);
    procedure liMDIChildrenClick(Sender: TObject);
    procedure cbStylesChange(Sender: TObject);
    procedure cbStylesDropDown(Sender: TObject);
    procedure seZoomChange(Sender: TObject);
    procedure seZoomButtonClick(Sender: TdxBarSpinEdit;
      Button: TdxBarSpinEditButton);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnDeleteTableClick(Sender: TObject);
  private
    // internal fields
    f_FreezeStyles : Bool;
  protected
  // property methods
    function  pm_GetShowDocumentParts: Bool;
      override;
    procedure pm_SetShowDocumentParts(Value: Bool);
      override;
      {-}
    function  pm_GetWebStyle: Bool;
      override;
    procedure pm_SetWebStyle(Value: Bool);
      override;
      {-}
    function  pm_GetPrintPreview: Bool;
      override;
    procedure pm_SetPrintPreview(Value: Bool);
      override;
      {-}
    function  pm_GetShowSpecial: Bool;
      override;
    procedure pm_SetShowSpecial(Value: Bool);
      override;
      {-}
    function  pm_GetPersistentBlocks: Bool;
      override;
    procedure pm_SetPersistentBlocks(Value: Bool);
      override;
      {-}
  protected
  // internal methods
    procedure DoCreate;
      override;
      {-}
    function  PopupMenu(const aTarget : IUnknown;
                        const anIID   : array of TGUID;
                        const aMenu   : array of TdxBarPopupMenu): Bool;
      {-}                   
    procedure ShowHint(Sender: TObject);
      {-}
  public
  // public methods
    procedure UpdateMRU;
      override;
      {-}
    procedure CheckEditorProperties(aEditor: TevCustomEditorWindow);
      override;
      {-}
    procedure EditorWindowZoomChange(NewZoom : Integer);
      override;
      {-}
    function CreateMDIChild(aSender       : TObject;
                            const WinName : string = gNewDocName): TForm;
      override;
      {-}
    procedure CloseMDIChild(Form: TForm);
      override;
      {-}
    procedure UpdateName(aEditor : TCustomForm; const aName: string);
      override;
      {-}
    procedure EditorWindowStyleChange(const StyleName: string);
      override;
      {-}
    function  MouseAction(const aHotSpot    : IevHotSpot;
                          aButton           : TevMouseButton;
                          anAction          : TevMouseAction;
                          Keys              : TShiftState;
                          var NeedAsyncLoop : Bool): Bool;
      override;
      {-}
    procedure ShowSubMenu(const aSub : IevSub;
                          const aPt  : Tl3SPoint;
                          aComponent : TComponent);
      override;
      {-}
    procedure DoContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
      override;
      {-}
    procedure DoExplorerContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
      override;
      {-}
  end;//TMainLiteExpressForm

implementation

uses
  SysUtils,

  l3MinMax,

  evCommonUtils,
  evFacadeGUI,
  evEditor,

  evdDOM
  ;

{$R *.dfm}

procedure TMainLiteExpressForm.DoCreate;
  //override;
  {-}
begin
 inherited;
 Application.OnHint := ShowHint;
 with dxBarManager do
 begin
  StoreInIniFile := true;
  IniFileName := ExtractFilePath(Application.ExeName) +
                 ChangeFileExt(ExtractFileName(Application.ExeName), '.ini');
  LoadFromIniFile(IniFileName);
 end;//with dxBarManager
end;

procedure TMainLiteExpressForm.UpdateMRU;
  //override;
  {-}
begin
 inherited;
 miMRU.Items := OpenDialog.HistoryList;
end;

function TMainLiteExpressForm.pm_GetShowDocumentParts: Bool;
  //override;
  {-}
begin
 Result := acShowDocumentParts.Checked;
end;

procedure TMainLiteExpressForm.pm_SetShowDocumentParts(Value: Bool);
  //override;
  {-}
begin
 acShowDocumentParts.Checked := Value;
end;

function TMainLiteExpressForm.pm_GetWebStyle: Bool;
  //override;
  {-}
begin
 Result := acWebStyle.Checked;
end;

procedure TMainLiteExpressForm.pm_SetWebStyle(Value: Bool);
  //override;
  {-}
begin
 acWebStyle.Checked := Value;
end;

function TMainLiteExpressForm.pm_GetPrintPreview: Bool;
  //override;
  {-}
begin
 Result := acPrintPreviewMode.Checked;
end;

procedure TMainLiteExpressForm.pm_SetPrintPreview(Value: Bool);
  //override;
  {-}
begin
 acPrintPreviewMode.Checked := Value;
end;

function TMainLiteExpressForm.pm_GetShowSpecial: Bool;
  //override;
  {-}
begin
 Result := acShowSpecial.Checked;
end;

procedure TMainLiteExpressForm.pm_SetShowSpecial(Value: Bool);
  //override;
  {-}
begin
 acShowSpecial.Checked := Value;
end;

function TMainLiteExpressForm.pm_GetPersistentBlocks: Bool;
  //override;
  {-}
begin
 Result := acPersistent.Checked;
end;

procedure TMainLiteExpressForm.pm_SetPersistentBlocks(Value: Bool);
  //override;
  {-}
begin
 acPersistent.Checked := Value;
end;

procedure TMainLiteExpressForm.miMRUClick(Sender: TObject);
var
 l_FileName: string;
begin
 with miMRU do
  l_FileName := Items[ItemIndex];
 LoadManager.FileName := l_FileName;
 CreateMDIChild(Sender, l_FileName);
end;

procedure TMainLiteExpressForm.CheckEditorProperties(aEditor: TevCustomEditorWindow);
begin
 inherited;
 seZoom.Value := aEditor.Zoom;
end;

procedure TMainLiteExpressForm.EditorWindowZoomChange(NewZoom : Integer);
begin
 inherited;
 if CheckActiveEditor then
  seZoom.Value := ActiveEditor.Editor.Zoom;
end;

procedure TMainLiteExpressForm.liMDIChildrenGetData(Sender: TObject);
begin
 with liMDIChildren do
   ItemIndex := Items.IndexOfObject(ActiveMDIChild);
end;

procedure TMainLiteExpressForm.liMDIChildrenClick(Sender: TObject);
begin
 with liMDIChildren do
   TCustomForm(Items.Objects[ItemIndex]).Show;
end;

function TMainLiteExpressForm.CreateMDIChild(aSender       : TObject;
                                             const WinName : string = gNewDocName): TForm;
  //override;
  {-}
begin
 Result := inherited CreateMDIChild(aSender, WinName);
 if (Result <> nil) then 
 begin
  liMDIChildren.Items.AddObject(WinName, Result);
  seZoom.Enabled := True;
  cbStyles.Enabled := True;
 end;//REsult <> nil
end;

procedure TMainLiteExpressForm.CloseMDIChild(Form: TForm);
  //override;
  {-}
var
 l_Index: Integer;
begin
 with liMDIChildren.Items do
 begin
  l_Index := IndexOfObject(Form);
  if l_Index > -1 then
   Delete(l_Index);
  seZoom.Enabled := (Count > 0);
  cbStyles.Enabled := (Count > 0);
 end;//with liMDIChildren.Items
 inherited;
end;

procedure TMainLiteExpressForm.UpdateName(aEditor : TCustomForm; const aName: string);
  //override;
  {-}
var
  I: Integer;
begin
 inherited;
 with liMDIChildren do 
 begin
   I := Items.IndexOfObject(aEditor);
   if (0 <= I) and (I < Items.Count) then Items[I] := aName;
 end;//with liMDIChildren
end;

procedure TMainLiteExpressForm.cbStylesChange(Sender: TObject);
var
 l_Style  : String;
 ActChild : TForm;
 l_Editor : TevEditor;
begin
 if not f_FreezeStyles then
 begin
  ActChild := ActiveMDIChild;
  l_Style := cbStyles.Text; // "������ �� ����� ����..." ����� ��� ���������� �� ��������� �������.
  if ActChild <> nil then
   Windows.SetFocus(ActChild.Handle);
  if CheckActiveEditor then
   with cbStyles do
   begin
    l_Editor := ActiveEditor.Editor;
    evSetStyleByName(l_Editor, cbStyles.Items, l_Style, False);
    cbStyles.Text := l_Editor.TextPara.Style.Name;
   end; // with cbStyles do
 end;//not f_FreezeStyles
end;

procedure TMainLiteExpressForm.cbStylesDropDown(Sender: TObject);
begin
 if CheckActiveEditor then
 begin
  try
   cbStyles.Items.Assign(ActiveEditor.Editor.TextPara.Style.Styles.Items)
  except
   cbStyles.Items.Clear;
  end;{try..except}
 end;{ActiveEditor <> nil..}
end;

procedure TMainLiteExpressForm.EditorWindowStyleChange(const StyleName: string);
begin
 inherited;
 f_FreezeStyles := True;
 try
  if CheckActiveEditor then cbStyles.Text := StyleName;
 finally
  f_FreezeStyles := False;
 end;//try..finally
end;

procedure TMainLiteExpressForm.seZoomChange(Sender: TObject);
begin
 if CheckActiveEditor then
  ActiveEditor.Editor.Zoom := seZoom.IntValue;
end;

procedure TMainLiteExpressForm.seZoomButtonClick(Sender: TdxBarSpinEdit;
  Button: TdxBarSpinEditButton);
begin
 seZoom.IntValue := seZoom.IntCurValue;
end;

procedure TMainLiteExpressForm.FormCreate(Sender: TObject);
begin
 inherited;
 {$IfNDef evSpellChecker}
 btSpellCheck.Visible := ivNever;
 {$EndIf evSpellChecker}
end;

function TMainLiteExpressForm.MouseAction(const aHotSpot    : IevHotSpot;
                                          aButton           : TevMouseButton;
                                          anAction          : TevMouseAction;
                                          Keys              : TShiftState;
                                          var NeedAsyncLoop : Bool): Bool;
  //override;
  {-}
begin
 Result := inherited MouseAction(aHotSpot, aButton, anAction, Keys, NeedAsyncLoop);
 if not Result then
  case aButton of
   ev_mbRight : begin
    if (anAction = ev_maUp) then 
    begin
      Result := PopupMenu(aHotSpot,
                          [IevHyperlink, IevSub, IedCell, IevdSection],
                          [pmHyperlink, pmSub, pmCell, pmSection]);
      if not Result then 
      begin
       CurrentTarget := nil;
       pmEditor.PopupFromCursorPos;
       Result := True;
      end;//not Result
    end 
    else
     Result := False;
   end;//ev_mbRight
   else Result := False;
  end;//Case aButton
end;

function TMainLiteExpressForm.PopupMenu(const aTarget : IUnknown;
                                        const anIID   : array of TGUID;
                                        const aMenu   : array of TdxBarPopupMenu): Bool;
  {-}
var
 i : Long;
begin
 Result := False;
 if (aTarget <> nil) then
  for i := Low(anIID) to High(anIID) do
   if (i > High(aMenu)) then
    Break
   else 
   if l3IOk(aTarget.QueryInterface(anIID[i], CurrentTarget)) then 
   begin
    aMenu[i].PopupFromCursorPos;
    Result := True;
    Break;
   end;//l3IOk..
end;

procedure TMainLiteExpressForm.ShowSubMenu(const aSub : IevSub;
                                           const aPt  : Tl3SPoint;
                                           aComponent : TComponent);
  //override;
  {-}
begin
 CurrentTarget := aSub;
 pmSub.PopupFromCursorPos;
end;

procedure TMainLiteExpressForm.DoContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
  //override;
  {-}
begin                                     
 Handled := True;
 CurrentTarget := nil;
 pmEditor.PopupFromCursorPos;
end;

procedure TMainLiteExpressForm.DoExplorerContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
  //override;
  {-}
begin
 Handled := True;
 CurrentTarget := nil;
 pmExplorer.PopupFromCursorPos;
end;

procedure TMainLiteExpressForm.ShowHint(Sender: TObject);
begin
 StatusBar.Panels[0].Text := Application.Hint;
end;

procedure TMainLiteExpressForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 inherited;
 with dxBarManager do
  SaveToIniFile(IniFileName);
end;

procedure TMainLiteExpressForm.btnDeleteTableClick(Sender: TObject);
var
 l_Table: IedTable;
begin
 if CheckActiveEditor then
 begin
  l_Table:= ActiveEditor.Editor.Range.Table;
  if l_Table <> nil then
   l_Table.Delete;
 end; // if CheckActiveEditor then
end;

end.
