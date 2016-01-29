unit PrimBaseSearchCard_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/BaseSearch/Forms/PrimBaseSearchCard_Form.pas"
// �����: 21.09.2009 20:00
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 �������� ����������::BaseSearch::View::BaseSearch$Module::PrimBaseSearchCard
//
// ������� �����
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3Interfaces,
  nevBase,
  afwInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  Classes
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  ,
  nevGUIInterfaces,
  vtPanel
  {$If not defined(NoVCM)}
  ,
  OfficeLike_ResultEx_Controls
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  OfficeLike_Result_Controls
  {$IfEnd} //not NoVCM
  ,
  BaseSearchInterfaces,
  nsMainMenuNew
  {$If defined(Nemesis)}
  ,
  nscHideField
  {$IfEnd} //Nemesis
  ,
  l3StringIDEx,
  nscSimpleEditor,
  PrimWorkJournalInterfaces
  {$If defined(Nemesis)}
  ,
  nscLister
  {$IfEnd} //Nemesis
  ,
  vcmEntityForm {a},
  Messages
  {$If defined(Nemesis)}
  ,
  nscInterfaces
  {$IfEnd} //Nemesis
  ,
  Windows
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 _BaseSearchPresentationFor296635421_Parent_ = TvcmEntityForm;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BaseSearchPresentationFor296635421.imp.pas}
 _vcmScrollableFormWithWheelSupport_Parent_ = _BaseSearchPresentationFor296635421_;
 {$Include w:\common\components\gui\Garant\VCM\implementation\Visual\vcmScrollableFormWithWheelSupport.imp.pas}
 _nscFormWithArrangeGrid_Parent_ = _vcmScrollableFormWithWheelSupport_;
 {$Include w:\common\components\gui\Garant\Nemesis\nscFormWithArrangeGrid.imp.pas}
 TPrimBaseSearchCardForm = {form} class(_nscFormWithArrangeGrid_, InsBaseSearchPresentation, InsWorkJournalListener, Il3WndProcRetListener, Il3Listener)
  {* ������� ����� }
 private
 // private fields
   f_qhBaseSearch : TQHRec;
   f_pnlMain : TvtPanel;
    {* ���� ��� �������� pnlMain}
   f_hfBaseSearch : TnscHideField;
    {* ���� ��� �������� hfBaseSearch}
   f_lrBaseSearch : TnscLister;
    {* ���� ��� �������� lrBaseSearch}
   f_CardTextLabel : TnscSimpleEditor;
    {* ���� ��� �������� CardTextLabel}
 protected
  procedure InitEntities; override;
  procedure MakeControls; override;
 private
 // private methods
   function LrBaseSearchGetItemCursor(aSender: TObject;
     aIndex: Integer): TCursor;
   procedure LrBaseSearchGetItemFont(Sender: TObject;
     Index: Integer;
     const aFont: Il3Font);
   procedure LrBaseSearchGetStrItem(Sender: TObject;
     Index: Integer;
     var ItemString: Il3CString);
   procedure LrBaseSearchActionElement(Sender: TObject;
     Index: Integer);
   procedure VcmEntityFormLoadState(const aState: IvcmBase;
     aStateType: TvcmStateType;
     var Loaded: Boolean);
   procedure VcmEntityFormSaveState(out aState: IvcmBase;
     aStateType: TvcmStateType;
     var Saved: Boolean);
   procedure CardTextLabelTextSourceTnscSimpleEditorCardTextLabelGetControlItemImg(aSender: TObject;
     const aControl: TnevControlInfo;
     out theImageInfo: TnevControlImageInfo);
   function CardTextLabelMouseAction(const aHotSpot: IevHotSpot;
     aButton: Tl3MouseButton;
     anAction: Tl3MouseAction;
     Keys: TShiftState;
     var NeedAsyncLoop: Boolean): Boolean;
   procedure CardTextLabelGetHotSpotInfo(Sender: TObject;
     const aHotSpot: IevHotSpot;
     const aKeys: TafwCursorState;
     var theInfo: TafwCursorInfo);
 protected
 // realized methods
   function WindowRequired: Boolean;
   function WindowCloseable: Boolean;
   function CanCloseWindow: Boolean;
   function IsQueryCard: Boolean;
   function TreatSuccessSearchAsManualOpen: Boolean;
   function AutoActivateWindow: Boolean;
   procedure JournalShrinked;
   {$If not defined(NoVCM)}
   procedure Result_OkExt_Execute(const aParams: IvcmExecuteParamsPrim);
     {* OK }
   {$IfEnd} //not NoVCM
   function Get_ContainerForBaseSearch: TnsContainerForBaseSearchInfo;
   function Get_ContextSearcher: InsContextSearcher;
   function Get_NeedSaveActiveClassBeforeSearch: Boolean;
   procedure WndProcRetListenerNotify(Msg: PCWPRetStruct;
     var theResult: Tl3HookProcResult);
    {$If defined(Nemesis)}
   function GridParentControl: TWinControl; override;
    {$IfEnd} //Nemesis
    {$If defined(Nemesis)}
   function DoBuildGrid: InscArrangeGrid; override;
    {$IfEnd} //Nemesis
    {$If defined(Nemesis)}
   procedure DoRecalcGrid(const aGrid: InscArrangeGrid); override;
    {$IfEnd} //Nemesis
 public
 // realized methods
   function SupportDisabled: Boolean;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure InitFields; override;
   procedure FinishDataUpdate; override;
   {$If not defined(NoVCM)}
   procedure InitControls; override;
     {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
    {$If not defined(NoVCM)}
   procedure FormInsertedIntoContainer; override;
    {$IfEnd} //not NoVCM
 protected
 // protected methods
   procedure LoadQueryHistory;
     {* ��������� ������ LoadQueryHistory }
   function QueryProcessor: InsBaseSearchQueryDataProcessor;
   procedure CardTextLabelResize(aSender: TObject);
 public
 // public properties
   property pnlMain: TvtPanel
     read f_pnlMain;
   property hfBaseSearch: TnscHideField
     read f_hfBaseSearch;
     {* ������� �������� }
   property lrBaseSearch: TnscLister
     read f_lrBaseSearch;
   property CardTextLabel: TnscSimpleEditor
     read f_CardTextLabel;
 end;//TPrimBaseSearchCardForm

 TvcmEntityFormRef = TPrimBaseSearchCardForm;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3Defaults,
  SearchUnit
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  ,
  nevTools,
  vtUtils,
  SearchRes,
  nsConst,
  evdTextStyle_Const,
  Graphics,
  l3Memory,
  l3String,
  MainMenuNewRes
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  ,
  l3ControlsTypes
  {$If not defined(NoVCL)}
  ,
  StdCtrls
  {$IfEnd} //not NoVCL
  
  {$If defined(Nemesis)}
  ,
  nscArrangeGridCell
  {$IfEnd} //Nemesis
  
  {$If defined(Nemesis)}
  ,
  nscFixedHeightControlCell
  {$IfEnd} //Nemesis
  
  {$If defined(Nemesis)}
  ,
  nscArrangeGrid
  {$IfEnd} //Nemesis
  ,
  l3ListenersManager,
  l3MessageID
  {$If not defined(NoScripts)}
  ,
  TtfwClassRef_Proxy
  {$IfEnd} //not NoScripts
  ,
  SysUtils,
  l3Base,
  l3InterfacesMisc,
  nsBaseSearchService,
  StdRes {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type _Instance_R_ = TPrimBaseSearchCardForm;

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BaseSearchPresentationFor296635421.imp.pas}

{$Include w:\common\components\gui\Garant\VCM\implementation\Visual\vcmScrollableFormWithWheelSupport.imp.pas}


{$Include w:\common\components\gui\Garant\Nemesis\nscFormWithArrangeGrid.imp.pas}

var
   { ������������ ������ BaseSearchLocalConst }
  str_BaseSearch : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'BaseSearch'; rValue : '������� �����');
   { '������� �����' }
  str_QueryHistory : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'QueryHistory'; rValue : '������� ��������');
   { '������� ��������' }

// start class TPrimBaseSearchCardForm

function TPrimBaseSearchCardForm.LrBaseSearchGetItemCursor(aSender: TObject;
  aIndex: Integer): TCursor;
//#UC START# *51237E59012E_4AB7A3210135_var*
//#UC END# *51237E59012E_4AB7A3210135_var*
begin
//#UC START# *51237E59012E_4AB7A3210135_impl*
 if (aIndex <> -1) and (f_qhBaseSearch.rH.Count > 0) then
  Result := crHandPoint
 else
  Result := crDefault;
//#UC END# *51237E59012E_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.LrBaseSearchGetItemCursor

procedure TPrimBaseSearchCardForm.LrBaseSearchGetItemFont(Sender: TObject;
  Index: Integer;
  const aFont: Il3Font);
//#UC START# *51237E6503D6_4AB7A3210135_var*
//#UC END# *51237E6503D6_4AB7A3210135_var*
begin
//#UC START# *51237E6503D6_4AB7A3210135_impl*
 with aFont do
  ForeColor := c_MainMenuColor;
 if (Index mod 2 = 0) then
  aFont.BackColor := c_mmSecondItemColor
 else
  aFont.BackColor := c_mmTreeColor;
//#UC END# *51237E6503D6_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.LrBaseSearchGetItemFont

procedure TPrimBaseSearchCardForm.LrBaseSearchGetStrItem(Sender: TObject;
  Index: Integer;
  var ItemString: Il3CString);
//#UC START# *51237E7003BF_4AB7A3210135_var*
//#UC END# *51237E7003BF_4AB7A3210135_var*
begin
//#UC START# *51237E7003BF_4AB7A3210135_impl*
 ItemString := nsMakeQueryStr(f_qhBaseSearch, Index);
//#UC END# *51237E7003BF_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.LrBaseSearchGetStrItem

procedure TPrimBaseSearchCardForm.LrBaseSearchActionElement(Sender: TObject;
  Index: Integer);
//#UC START# *51237E8901DC_4AB7A3210135_var*
var
 l_Query : IQuery;
 l_QueryProcessor: InsBaseSearchQueryDataProcessor;
//#UC END# *51237E8901DC_4AB7A3210135_var*
begin
//#UC START# *51237E8901DC_4AB7A3210135_impl*
 l_QueryProcessor := QueryProcessor;
 if (f_qhBaseSearch.rH.Count > 0) and
   Supports(f_qhBaseSearch.rH[Index], IQuery, l_Query) and
   Assigned(l_QueryProcessor) then
  l_QueryProcessor.SetDataFromQuery(l_Query);
//#UC END# *51237E8901DC_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.LrBaseSearchActionElement

procedure TPrimBaseSearchCardForm.VcmEntityFormLoadState(const aState: IvcmBase;
  aStateType: TvcmStateType;
  var Loaded: Boolean);
//#UC START# *51237ED3031C_4AB7A3210135_var*
//#UC END# *51237ED3031C_4AB7A3210135_var*
begin
//#UC START# *51237ED3031C_4AB7A3210135_impl*
 LoadQueryHistory;
//#UC END# *51237ED3031C_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.VcmEntityFormLoadState

procedure TPrimBaseSearchCardForm.VcmEntityFormSaveState(out aState: IvcmBase;
  aStateType: TvcmStateType;
  var Saved: Boolean);
//#UC START# *51237EDB0222_4AB7A3210135_var*
var
 l_Fake: TvcmBase;
//#UC END# *51237EDB0222_4AB7A3210135_var*
begin
//#UC START# *51237EDB0222_4AB7A3210135_impl*
 if (aStateType = vcm_stContent) then
 begin
  l_Fake := TvcmBase.Create;
  try
   Supports(l_Fake, IvcmBase, aState);
  finally
   vcmFree(l_Fake);
  end;//try..finally
 end;//aStateType = vcm_stContent
//#UC END# *51237EDB0222_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.VcmEntityFormSaveState

procedure TPrimBaseSearchCardForm.CardTextLabelTextSourceTnscSimpleEditorCardTextLabelGetControlItemImg(aSender: TObject;
  const aControl: TnevControlInfo;
  out theImageInfo: TnevControlImageInfo);
//#UC START# *51237F970395_4AB7A3210135_var*
var
 l_Para : InevPara;
//#UC END# *51237F970395_4AB7A3210135_var*
begin
//#UC START# *51237F970395_4AB7A3210135_impl*
 theImageInfo.rImageList := vtMakeImageListWrapper(nsSearchRes.ImageList);
 theImageInfo.rFirstIndex := 0;
 if aControl.rControl.AsObject.QT(InevPara, l_Para) then
 begin
  if (l_Para.OwnerObj.PID = 1) then
   theImageInfo.rFirstIndex := 3;
 end;//aControl.QT(InevPara, l_Para)
//#UC END# *51237F970395_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.CardTextLabelTextSourceTnscSimpleEditorCardTextLabelGetControlItemImg

function TPrimBaseSearchCardForm.CardTextLabelMouseAction(const aHotSpot: IevHotSpot;
  aButton: Tl3MouseButton;
  anAction: Tl3MouseAction;
  Keys: TShiftState;
  var NeedAsyncLoop: Boolean): Boolean;
//#UC START# *51237FB70279_4AB7A3210135_var*
//#UC END# *51237FB70279_4AB7A3210135_var*
begin
//#UC START# *51237FB70279_4AB7A3210135_impl*
 Result := true;
 NeedAsyncLoop := false;
//#UC END# *51237FB70279_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.CardTextLabelMouseAction

procedure TPrimBaseSearchCardForm.CardTextLabelGetHotSpotInfo(Sender: TObject;
  const aHotSpot: IevHotSpot;
  const aKeys: TafwCursorState;
  var theInfo: TafwCursorInfo);
//#UC START# *5123803503BC_4AB7A3210135_var*
//#UC END# *5123803503BC_4AB7A3210135_var*
begin
//#UC START# *5123803503BC_4AB7A3210135_impl*
 theInfo.rHint := nil;
 theInfo.rCursor := ev_csArrow;
//#UC END# *5123803503BC_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.CardTextLabelGetHotSpotInfo

procedure TPrimBaseSearchCardForm.LoadQueryHistory;
//#UC START# *51237AB402B9_4AB7A3210135_var*
  procedure lp_SetTotal(const aLister       : TnscLister;
                        const aQueryHistory : TQHRec);
  begin//lp_SetTotal
   with aLister do
   begin
    if aQueryHistory.rH.Count = 0 then
     Total := 1
    else
     Total := aQueryHistory.rH.Count;
    // ����� ������, ��� Total ����� �� ����������, �� ������ ������ �������,
    // �������� ������� "�������� ���", ������� ����� ��������������
    // (CQ: OIT500021901):
    Invalidate;
   end;//with aLister
  end;//lp_SetTotal
//#UC END# *51237AB402B9_4AB7A3210135_var*
begin
//#UC START# *51237AB402B9_4AB7A3210135_impl*
 if not Assigned(f_qhBaseSearch.rH) then
  f_qhBaseSearch.rH := TnsQueryHistory.Create(cContextHistoryItems, QT_BASE_SEARCH);
 f_qhBaseSearch.rH.LoadQueries;
 lp_SetTotal(lrBaseSearch, f_qhBaseSearch);
//#UC END# *51237AB402B9_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.LoadQueryHistory

function TPrimBaseSearchCardForm.QueryProcessor: InsBaseSearchQueryDataProcessor;
//#UC START# *51237AFE01D0_4AB7A3210135_var*
//#UC END# *51237AFE01D0_4AB7A3210135_var*
begin
//#UC START# *51237AFE01D0_4AB7A3210135_impl*
 Supports(NativeMainForm, InsBaseSearchQueryDataProcessor, Result);
//#UC END# *51237AFE01D0_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.QueryProcessor

procedure TPrimBaseSearchCardForm.CardTextLabelResize(aSender: TObject);
//#UC START# *530D96990038_4AB7A3210135_var*
//#UC END# *530D96990038_4AB7A3210135_var*
begin
//#UC START# *530D96990038_4AB7A3210135_impl*
 RecalcGrid;
//#UC END# *530D96990038_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.CardTextLabelResize

function TPrimBaseSearchCardForm.WindowRequired: Boolean;
//#UC START# *496B4C41023E_4AB7A3210135_var*
//#UC END# *496B4C41023E_4AB7A3210135_var*
begin
//#UC START# *496B4C41023E_4AB7A3210135_impl*
 Result := True;
//#UC END# *496B4C41023E_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.WindowRequired

function TPrimBaseSearchCardForm.WindowCloseable: Boolean;
//#UC START# *496B4C500246_4AB7A3210135_var*
//#UC END# *496B4C500246_4AB7A3210135_var*
begin
//#UC START# *496B4C500246_4AB7A3210135_impl*
 Result := Dispatcher.History.CanBack;
//#UC END# *496B4C500246_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.WindowCloseable

function TPrimBaseSearchCardForm.CanCloseWindow: Boolean;
//#UC START# *496B4CA000B6_4AB7A3210135_var*
//#UC END# *496B4CA000B6_4AB7A3210135_var*
begin
//#UC START# *496B4CA000B6_4AB7A3210135_impl*
 Result := False;
 Dispatcher.History.Back;
//#UC END# *496B4CA000B6_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.CanCloseWindow

function TPrimBaseSearchCardForm.IsQueryCard: Boolean;
//#UC START# *496B4CD9005F_4AB7A3210135_var*
//#UC END# *496B4CD9005F_4AB7A3210135_var*
begin
//#UC START# *496B4CD9005F_4AB7A3210135_impl*
 Result := True;
//#UC END# *496B4CD9005F_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.IsQueryCard

function TPrimBaseSearchCardForm.TreatSuccessSearchAsManualOpen: Boolean;
//#UC START# *496B4CE30132_4AB7A3210135_var*
//#UC END# *496B4CE30132_4AB7A3210135_var*
begin
//#UC START# *496B4CE30132_4AB7A3210135_impl*
 Result := False;
//#UC END# *496B4CE30132_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.TreatSuccessSearchAsManualOpen

function TPrimBaseSearchCardForm.AutoActivateWindow: Boolean;
//#UC START# *496B4CED0306_4AB7A3210135_var*
//#UC END# *496B4CED0306_4AB7A3210135_var*
begin
//#UC START# *496B4CED0306_4AB7A3210135_impl*
 Result := True;
//#UC END# *496B4CED0306_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.AutoActivateWindow

procedure TPrimBaseSearchCardForm.JournalShrinked;
//#UC START# *4A83AA610299_4AB7A3210135_var*
//#UC END# *4A83AA610299_4AB7A3210135_var*
begin
//#UC START# *4A83AA610299_4AB7A3210135_impl*
 LoadQueryHistory;
//#UC END# *4A83AA610299_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.JournalShrinked

{$If not defined(NoVCM)}
procedure TPrimBaseSearchCardForm.Result_OkExt_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4A8AD47D0357_4AB7A3210135exec_var*
var
 l_QueryProcessor: InsBaseSearchQueryDataProcessor;
//#UC END# *4A8AD47D0357_4AB7A3210135exec_var*
begin
//#UC START# *4A8AD47D0357_4AB7A3210135exec_impl*
 l_QueryProcessor := QueryProcessor;
 if Assigned(l_QueryProcessor) then
  try
   l_QueryProcessor.RequestFind;
  except
   on ETryToFindEmptyContext do
    Ask(inf_SimpleMainMenuSearchCondition);
  end;//try..except
//#UC END# *4A8AD47D0357_4AB7A3210135exec_impl*
end;//TPrimBaseSearchCardForm.Result_OkExt_Execute
{$IfEnd} //not NoVCM

function TPrimBaseSearchCardForm.SupportDisabled: Boolean;
//#UC START# *4ACA17770179_4AB7A3210135_var*
//#UC END# *4ACA17770179_4AB7A3210135_var*
begin
//#UC START# *4ACA17770179_4AB7A3210135_impl*
 Result := False;
//#UC END# *4ACA17770179_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.SupportDisabled

function TPrimBaseSearchCardForm.Get_ContainerForBaseSearch: TnsContainerForBaseSearchInfo;
//#UC START# *4ACA195801CB_4AB7A3210135get_var*
//#UC END# *4ACA195801CB_4AB7A3210135get_var*
begin
//#UC START# *4ACA195801CB_4AB7A3210135get_impl*
 Result.rContainer := Container;
 Result.rZone := vcm_ztChild;
//#UC END# *4ACA195801CB_4AB7A3210135get_impl*
end;//TPrimBaseSearchCardForm.Get_ContainerForBaseSearch

function TPrimBaseSearchCardForm.Get_ContextSearcher: InsContextSearcher;
//#UC START# *4AD6EAA3034A_4AB7A3210135get_var*
//#UC END# *4AD6EAA3034A_4AB7A3210135get_var*
begin
//#UC START# *4AD6EAA3034A_4AB7A3210135get_impl*
 Result := nil; 
//#UC END# *4AD6EAA3034A_4AB7A3210135get_impl*
end;//TPrimBaseSearchCardForm.Get_ContextSearcher

function TPrimBaseSearchCardForm.Get_NeedSaveActiveClassBeforeSearch: Boolean;
//#UC START# *4F1D607E0027_4AB7A3210135get_var*
//#UC END# *4F1D607E0027_4AB7A3210135get_var*
begin
//#UC START# *4F1D607E0027_4AB7A3210135get_impl*
 Result := false;
//#UC END# *4F1D607E0027_4AB7A3210135get_impl*
end;//TPrimBaseSearchCardForm.Get_NeedSaveActiveClassBeforeSearch

procedure TPrimBaseSearchCardForm.WndProcRetListenerNotify(Msg: PCWPRetStruct;
  var theResult: Tl3HookProcResult);
//#UC START# *4F79CF9200A0_4AB7A3210135_var*
 function lp_TopHwnd: THandle;
 var
  C: TWinControl;
 begin
  C := Self;
  while Assigned(C.Parent) do
   C := C.Parent;
  Result := C.Handle;
 end;
//#UC END# *4F79CF9200A0_4AB7A3210135_var*
begin
//#UC START# *4F79CF9200A0_4AB7A3210135_impl*
 if (Msg.Message = WM_SIZE) and (Msg.wParam = SIZE_RESTORED) then
  if (Msg.Hwnd = lp_TopHwnd) then
   RecalcGrid;
//#UC END# *4F79CF9200A0_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.WndProcRetListenerNotify

{$If defined(Nemesis)}
function TPrimBaseSearchCardForm.GridParentControl: TWinControl;
//#UC START# *530496230291_4AB7A3210135_var*
//#UC END# *530496230291_4AB7A3210135_var*
begin
//#UC START# *530496230291_4AB7A3210135_impl*
 Result := pnlMain;
//#UC END# *530496230291_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.GridParentControl
{$IfEnd} //Nemesis

{$If defined(Nemesis)}
function TPrimBaseSearchCardForm.DoBuildGrid: InscArrangeGrid;
//#UC START# *530496BF0361_4AB7A3210135_var*
//#UC END# *530496BF0361_4AB7A3210135_var*
begin
//#UC START# *530496BF0361_4AB7A3210135_impl*
 Result := TnscArrangeGrid.Make(false, true);
 with Result do
 begin
  AddColumn;
  AddRow;
  AddRow;
  Cell[0, 0] := TnscFixedHeightControlCell.Make(CardTextLabel);
  Cell[1, 0] := TnscHideFieldCell.Make(hfBaseSearch, true);
 end;
//#UC END# *530496BF0361_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.DoBuildGrid
{$IfEnd} //Nemesis

{$If defined(Nemesis)}
procedure TPrimBaseSearchCardForm.DoRecalcGrid(const aGrid: InscArrangeGrid);
//#UC START# *5304972201A1_4AB7A3210135_var*
//#UC END# *5304972201A1_4AB7A3210135_var*
begin
//#UC START# *5304972201A1_4AB7A3210135_impl*
 if (aGrid <> nil) then
 begin
  Realign;
  with aGrid do
  begin
   Cell[0, 0].MinHeight := CardTextLabel.Height;
   Cell[1, 0].MinHeight := hfBaseSearch.Height;
  end;//with aGrid
  aGrid.Recalc;
  ArrangeGrid;
 end;//aGrid <> nil
//#UC END# *5304972201A1_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.DoRecalcGrid
{$IfEnd} //Nemesis

procedure TPrimBaseSearchCardForm.Cleanup;
//#UC START# *479731C50290_4AB7A3210135_var*
//#UC END# *479731C50290_4AB7A3210135_var*
begin
//#UC START# *479731C50290_4AB7A3210135_impl*
 Tl3ListenersManager.Remove(Self as Il3Listener);
 TdmStdRes.MakeWorkJournal.UnRegisterListener(Self);
 vcmFree(f_qhBaseSearch.rH);
 inherited;
//#UC END# *479731C50290_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.Cleanup

procedure TPrimBaseSearchCardForm.InitFields;
//#UC START# *47A042E100E2_4AB7A3210135_var*
//#UC END# *47A042E100E2_4AB7A3210135_var*
begin
//#UC START# *47A042E100E2_4AB7A3210135_impl*
 inherited;
 hfBaseSearch.StyleId := evd_saColorSelectionForBaseSearch;
 hfBaseSearch.Images := dmStdRes.LargeImageList;
 TdmStdRes.MakeWorkJournal.RegisterListener(Self);
 LoadQueryHistory;
 {$IfOpt D+}
 //CardTextLabel.DrawSpecial := true;
 {$EndIf}
 CardTextLabel.TabStop := False;
 CardTextLabel.Color := clWhite;
 CardTextLabel.AllowRubberTables := nev_rtmFitToWindow;
 CardTextLabel.WebStyle := true;
 CardTextLabel.TextSource.DocumentContainer.ReadFrom(Tl3StringStream.Make(l3PCharLen(vcmCStr(str_BaseSearchQueryLabel))));
//#UC END# *47A042E100E2_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.InitFields

procedure TPrimBaseSearchCardForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_4AB7A3210135_var*
//#UC END# *47EA4E9002C6_4AB7A3210135_var*
begin
//#UC START# *47EA4E9002C6_4AB7A3210135_impl*
 inherited;
 LoadQueryHistory;
//#UC END# *47EA4E9002C6_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.FinishDataUpdate

{$If not defined(NoVCM)}
procedure TPrimBaseSearchCardForm.InitControls;
//#UC START# *4A8E8F2E0195_4AB7A3210135_var*
//#UC END# *4A8E8F2E0195_4AB7A3210135_var*
begin
//#UC START# *4A8E8F2E0195_4AB7A3210135_impl*
 inherited
 Width := 679;
 Height := 470;
 Caption := str_BaseSearch.AsStr;
 OnLoadState := vcmEntityFormLoadState;
 OnSaveState := vcmEntityFormSaveState;

 with pnlMain do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  Color := clWhite;
 end;

 with lrBaseSearch do
 begin
  Align := alClient;
  AutoRowHeight := False;
  BorderStyle := bsNone;
  IntegralHeight := False;
  ProtectColor.BackColor := clRed;
  ProtectColor.TextColor := clWhite;
  SelectColor.BackColor := clHighlight;
  SelectColor.TextColor := clHighlightText;
  SelectNonFocusColor.BackColor := $00F9F8FA;
  SelectNonFocusColor.TextColor := clBtnText;
  UseTabStops := True;
  MultiStrokeItem := True;
  ViewOptions := [voShowInterRowSpace];
  ActionElementMode := l3_amSingleClick;
  StyleId := -32;
  OnGetStrItem := lrBaseSearchGetStrItem;
  OnGetItemFont := lrBaseSearchGetItemFont;
  OnGetItemCursor := lrBaseSearchGetItemCursor;
  OnActionElement := lrBaseSearchActionElement;
 end;

 with hfBaseSearch do
 begin
  Align := alClient;
  Caption := str_QueryHistory.AsStr;
  ButtonCloseImage := 1;
  ButtonImageList := dmMainMenuNew.ilSmallIcons;
  ButtonOpenImage := 0;
  ClientControl := lrBaseSearch;
  ClientIndent := 20;
  HeaderImage := 73;
  LeftHeaderIndent := 20;
  LeftImageIndent := 10;
  Options := [];
  TopHeaderIndent := 15;
  TabOrder := 0;
  StyleId := -33;
  SettingId := 'sthfBaseSearch';
  Height := 70{lrBaseSearch.Height};
  Width := pnlMain.Width;
 end;

 with CardTextLabel do
 begin
  Cursor := crArrow;
  Height := 71;
  IsStaticText := True;
  ScrollStyle := ssNone;
  OnGetHotSpotInfo := CardTextLabelGetHotSpotInfo;
  OnMouseAction := CardTextLabelMouseAction;
  TextSource.OnGetControlItemImg := CardTextLabelTextSourceTnscSimpleEditorCardTextLabelGetControlItemImg;
  DisableMouseWheelProcessing := True;
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=294584542
  OnResize := CardTextLabelResize;
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=518759939
 end;
 BuildGrid;
 ArrangeGrid;
 RecalcGrid;
//#UC END# *4A8E8F2E0195_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
procedure TPrimBaseSearchCardForm.FormInsertedIntoContainer;
//#UC START# *4F7C65380244_4AB7A3210135_var*
//#UC END# *4F7C65380244_4AB7A3210135_var*
begin
//#UC START# *4F7C65380244_4AB7A3210135_impl*
 inherited;
 Tl3ListenersManager.Add(Self as Il3Listener);
//#UC END# *4F7C65380244_4AB7A3210135_impl*
end;//TPrimBaseSearchCardForm.FormInsertedIntoContainer
{$IfEnd} //not NoVCM

procedure TPrimBaseSearchCardForm.InitEntities;
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Result, nil);
  {$If not defined(NoVCM)}
  PublishOp(en_Result, op_OkExt, Result_OkExt_Execute, nil, nil);
  ShowInContextMenu(en_Result, op_OkExt, false);
  ShowInToolbar(en_Result, op_OkExt, false);
  {$IfEnd} //not NoVCM

 end;//with Entities.Entities
end;

procedure TPrimBaseSearchCardForm.MakeControls;
begin
 inherited;
 f_pnlMain := TvtPanel.Create(Self);
 f_pnlMain.Name := 'pnlMain';
 f_pnlMain.Parent := Self;
 f_hfBaseSearch := TnscHideField.Create(Self);
 f_hfBaseSearch.Name := 'hfBaseSearch';
 f_hfBaseSearch.Parent := pnlMain;
 f_hfBaseSearch.Caption := '������� ��������';
 f_lrBaseSearch := TnscLister.Create(Self);
 f_lrBaseSearch.Name := 'lrBaseSearch';
 f_lrBaseSearch.Parent := hfBaseSearch;
 f_CardTextLabel := TnscSimpleEditor.Create(Self);
 f_CardTextLabel.Name := 'CardTextLabel';
 f_CardTextLabel.Parent := pnlMain;
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_BaseSearch
 str_BaseSearch.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_QueryHistory
 str_QueryHistory.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings) AND not defined(NoScripts)}
// ����������� PrimBaseSearchCard
 TtfwClassRef.Register(TPrimBaseSearchCardForm);
{$IfEnd} //not Admin AND not Monitorings AND not NoScripts

end.