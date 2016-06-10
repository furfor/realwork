unit BaseSearchInterfaces;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Search"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Search/BaseSearchInterfaces.pas"
// �����: 03.09.2009 14:22
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> F1 Common For Shell And Monitoring::Search::Search::BaseSearchInterfaces
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin)}
uses
  DynamicDocListUnit,
  DynamicTreeUnit,
  l3Interfaces
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  ,
  l3TreeInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  ,
  PrimBaseSearchInterfaces,
  ContextHistoryInterfaces,
  SysUtils
  ;

type
 InsBaseSearchVisibleWatcher = interface(IUnknown)
   ['{E98658D8-1553-40D7-A6E1-840C705598C9}']
   procedure VisibleChanged(aNewVisible: Boolean);
 end;//InsBaseSearchVisibleWatcher

 InsBaseSearchContextProvider = interface(IUnknown)
   ['{674A4919-B96A-489C-AFEC-726940684C28}']
   function pm_GetContext: Il3CString;
   procedure RepairMistakes;
   property Context: Il3CString
     read pm_GetContext;
 end;//InsBaseSearchContextProvider

 InsBaseSearchClass = interface(IUnknown)
   ['{F376FEAE-F09B-4E92-A508-6FB991BFBFB2}']
   function IsSame(const aAnother: InsBaseSearchClass): Boolean;
   function pm_GetAdapterNode: INodeBase;
   function pm_GetName: Il3CString;
   property AdapterNode: INodeBase
     read pm_GetAdapterNode;
   property Name: Il3CString
     read pm_GetName;
 end;//InsBaseSearchClass

 InsBaseSearchClassesEnumerator = interface(IUnknown)
   ['{A67B9BF0-F2F5-4F80-AB66-E23E6502043D}']
   function pm_GetCurrent: InsBaseSearchClass;
   procedure Reset;
   function MoveNext: Boolean;
   property Current: InsBaseSearchClass
     read pm_GetCurrent;
 end;//InsBaseSearchClassesEnumerator

 TnsBaseSearchKind = (
   ns_bskMenu
 , ns_bskList
 , ns_bskDocument
 , ns_bskQuery
 );//TnsBaseSearchKind

 TnsSearchArea = (
   ns_saEverywere
 , ns_saText
 , ns_saTitlesOnly
 );//TnsSearchArea

 InsBaseSearchDataReadyChecker = interface(IUnknown)
   ['{F01A4C08-BF24-4300-B7E1-EA5CE47AD428}']
   procedure CheckLocalDataReady;
 end;//InsBaseSearchDataReadyChecker

(*
 MnsSupportDisabled = PureMixIn
   function SupportDisabled: Boolean;
 end;//MnsSupportDisabled
*)

 InsBaseSearchQueryDataProcessor = interface(IUnknown)
   ['{40201F1F-3C11-4497-B812-5CC0D75A2355}']
   procedure SetDataFromQuery(const aQuery: IUnknown);
   procedure RequestFind;
   procedure RequestCheckFragmentsCount;
   procedure RequestCheckFindBack;
 end;//InsBaseSearchQueryDataProcessor

 InsSearchWindow = interface(IUnknown)
   ['{793F257C-3520-4B48-AE36-4CB918875D2E}']
   function pm_GetIsActive: Boolean;
   function pm_GetIsMainInUseCase: Boolean;
   function pm_GetVisible: Boolean;
   function Get_Container: IvcmContainer;
   procedure ParamsChanged;
   procedure PresentationChanged;
   procedure ExampleChanged;
   procedure CheckFindEnabled;
   procedure ClassNamesChanged;
   procedure CloseWindow;
   procedure ActivateWindow(aNeedFlash: Boolean = True);
   procedure CheckFragmentsCount;
   procedure ForceUpdateClassForHistory;
   property IsActive: Boolean
     read pm_GetIsActive;
   property IsMainInUseCase: Boolean
     read pm_GetIsMainInUseCase;
   property Visible: Boolean
     read pm_GetVisible;
   property Container: IvcmContainer
     read Get_Container;
 end;//InsSearchWindow

 InsContextSearcher = interface(IUnknown)
   ['{3E94FD76-AA33-4F11-894F-7F6344176794}']
   function pm_GetArea: TnsSearchArea;
   procedure pm_SetArea(aValue: TnsSearchArea);
   function Get_VisibleWatcher: InsBaseSearchVisibleWatcher;
   function Kind: TnsBaseSearchKind;
   function Find(const aContext: InsBaseSearchContextProvider;
    const aProcessor: InsBaseSearchResultProcessor): Boolean;
   function AllowSearchInTitles: Boolean;
   function IsLocalSearchArea: Boolean;
   procedure ContextChanged(const aNewContext: Il3CString);
   function IsLocalDataReady: Boolean;
   function FindBack(const aContext: InsBaseSearchContextProvider;
    const aProcessor: InsBaseSearchResultProcessor): Boolean;
     {* ������ ����� }
   function FindBackSupported: Boolean;
   function FindBackEnabled: Boolean;
   function FragmentsCountSuffix: Il3CString;
   function AllowPrompts: Boolean;
   function PromptsInfo: LongWord;
   function SwitchToTextIfPossible: Boolean;
   function IsSearchLocked: Boolean;
   property Area: TnsSearchArea
     read pm_GetArea
     write pm_SetArea;
   property VisibleWatcher: InsBaseSearchVisibleWatcher
     read Get_VisibleWatcher;
  // MnsSupportDisabled
   function SupportDisabled: Boolean;
 end;//InsContextSearcher

 InsMistakesCorrector = interface(IUnknown)
   ['{48789C4F-0569-4518-821B-EA5BF3A64480}']
   procedure Correct(const aCorrectedContext: Il3StringsEx;
    const aMistakesList: Il3StringsEx);
 end;//InsMistakesCorrector

 TnsContainerForBaseSearchInfo = record
   rContainer : IvcmContainer;
   rZone : TvcmZoneType;
 end;//TnsContainerForBaseSearchInfo

 TnsBaseSearchOpenKind = (
  {* ���� �������� �������� ������ }
   ns_bsokLocal // ��������� ����� ��������� (Ctrl+F)
 , ns_bsokSpecify // ��������
 , ns_bsokGlobal // ���������� ����� (F4)
 );//TnsBaseSearchOpenKind

 ETryToFindEmptyContext = class(Exception)
 end;//ETryToFindEmptyContext

(*
 MnsBaseSearchPresentationState = PureMixIn
  {* http://mdp.garant.ru/pages/viewpage.action?pageId=321989072
http://mdp.garant.ru/pages/viewpage.action?pageId=321989072&focusedCommentId=330698655#comment-330698655 }
   function FormCloseWasRequested: Boolean;
     {* ���� ��� ��������� ���������
http://mdp.garant.ru/pages/viewpage.action?pageId=321989072&focusedCommentId=330698655#comment-330698655
������ ����� ��� ������ ���������� � �������. ������ �� ���� � ����� ��, ������� �� ���� ������� }
 end;//MnsBaseSearchPresentationState
*)

 InsBaseSearchListSource = interface(IUnknown)
   ['{A3EE6B9E-5CDF-4D52-9384-3ADB2C60D102}']
   function Get_SearchList: IDynList;
   property SearchList: IDynList
     read Get_SearchList;
 end;//InsBaseSearchListSource

 InsBaseSearchPresentation = interface(IUnknown{, ��� �������� �� ������� ����� ������ �����������������})
  {* ������������� "�������� ������" }
   ['{6F7CE717-5FD9-45EE-9487-F4F1A0F9C248}']
   function Get_ContainerForBaseSearch: TnsContainerForBaseSearchInfo;
   function Get_ContextSearcher: InsContextSearcher;
   function Get_NeedSaveActiveClassBeforeSearch: Boolean;
   function WindowRequired: Boolean;
   function WindowCloseable: Boolean;
   function CanCloseWindow: Boolean;
   function IsQueryCard: Boolean;
   function TreatSuccessSearchAsManualOpen: Boolean;
   function AutoActivateWindow: Boolean;
   property ContainerForBaseSearch: TnsContainerForBaseSearchInfo
     read Get_ContainerForBaseSearch;
   property ContextSearcher: InsContextSearcher
     read Get_ContextSearcher;
   property NeedSaveActiveClassBeforeSearch: Boolean
     read Get_NeedSaveActiveClassBeforeSearch;
     {* ��������� �� �������� ����� �� ������ (��� � ������) ��� ����� (��� � ��)
http://mdp.garant.ru/pages/viewpage.action?pageId=327826220
������ ������ ��� ���� ��� ������������ �������� - ��������� ����� ��� ����������, �.�. ��������� ��������� ����� ������ ��� ��� }
  // MnsSupportDisabled
   function SupportDisabled: Boolean;
  // MnsBaseSearchPresentationState
   function FormCloseWasRequested: Boolean;
     {* ���� ��� ��������� ���������
http://mdp.garant.ru/pages/viewpage.action?pageId=321989072&focusedCommentId=330698655#comment-330698655
������ ����� ��� ������ ���������� � �������. ������ �� ���� � ����� ��, ������� �� ���� ������� }
 end;//InsBaseSearchPresentation

 InsCutToLeafFilter = interface(IUnknown)
   ['{82C20B16-25CE-4A11-A1AA-BC052236983F}']
   function pm_GetLeafCount: LongWord;
   property LeafCount: LongWord
     read pm_GetLeafCount;
 end;//InsCutToLeafFilter

 InsPromptForDocFilter = interface(IUnknown)
   ['{37181736-0998-4C7D-9DFD-6245F00168A6}']
   function Get_InternalDocNumber: Longword;
   property InternalDocNumber: Longword
     read Get_InternalDocNumber;
 end;//InsPromptForDocFilter

 InsBaseSearchPromptFilters = interface(Il3TreeFilters)
   ['{1C61F6BE-82F5-4A17-AA9F-A2AD82FE6F96}']
   function Get_ForDoc: InsPromptForDocFilter;
   function pm_GetLeaf: InsCutToLeafFilter;
   function SetLeaf(const aFilter: InsCutToLeafFilter): InsBaseSearchPromptFilters;
   function SetPromptForDoc(const aFilter: InsPromptForDocFilter): InsBaseSearchPromptFilters;
   property ForDoc: InsPromptForDocFilter
     read Get_ForDoc;
   property Leaf: InsCutToLeafFilter
     read pm_GetLeaf;
 end;//InsBaseSearchPromptFilters

 TbsBaseSearchResult = (
   bsrNone // � ������ ���� ��������� ������ �� ������
 , bsrContinueSearch // ���������� �����
 , bsrSearchFinished // ����� � ����� ��������
 , bsrSearchFinishedNotFound // � ������ ������ �� �������
 , bsrSearchFinishedAllInHidden // ������ ����� �������, �� ��� � ������� ������
 );//TbsBaseSearchResult

 IbsBaseDocumentContextSearcher = interface(IUnknown{, ����������� ����� � ���������})
   ['{12BC458F-160F-4D3E-AE17-B95998B2B341}']
   function pm_GetCanContinue: Boolean;
   function Get_CanFindBack: Boolean;
   function pm_GetFragmentsCount: Integer;
   function pm_GetContext: Il3CString;
   function Find(const aContext: Il3CString): TbsBaseSearchResult;
     {* ����� }
   procedure ContextChanged(const aNewContext: Il3CString);
   function FindBack: TbsBaseSearchResult;
     {* �������� � ����������� ��������� }
   property CanContinue: Boolean
     read pm_GetCanContinue;
     {* ����� �� ����� ���� ��������� (F3) }
   property CanFindBack: Boolean
     read Get_CanFindBack;
   property FragmentsCount: Integer
     read pm_GetFragmentsCount;
   property Context: Il3CString
     read pm_GetContext;
 end;//IbsBaseDocumentContextSearcher

(*
 MnsPresentationHolder = PureMixIn
   function ValidateBaseSearchForm(const aForm: IvcmEntityForm): Boolean;
     {* ���������, ��� ����� �� "��� �������", �.�. �������� � �� �� ������� ����, ��� � ��� Searcher }
   function pm_GetPresentation: InsBaseSearchPresentation;
   procedure pm_SetPresentation(const aValue: InsBaseSearchPresentation);
   procedure RemovePresentation(const aPresentation: InsBaseSearchPresentation);
   property Presentation: InsBaseSearchPresentation
     read pm_GetPresentation
     write pm_SetPresentation;
 end;//MnsPresentationHolder
*)

 InsBaseSearchClassesListener = interface(IUnknown)
   ['{7936540E-3122-4B48-AFEC-E517EEAC43D6}']
   procedure NotifyClassesChanged;
 end;//InsBaseSearchClassesListener

const
  { SearchClassesConst }
 ns_bscNone = nil;

type
 InsMainMenuLikeBaseSearchOwner = interface(IUnknown)
  {* ����������, ��� �������� �� �������� ������� �� �� }
   ['{DF3EF06D-56F1-477C-932A-6CC09342E7DD}']
   function IsIt: Boolean;
 end;//InsMainMenuLikeBaseSearchOwner

 TnsBaseSearchStateElement = (
   ns_sseContext
 , ns_sseNeedShowWindow
 , ns_sseOpenKind
 , ns_sseActiveClass
 , ns_sseSearchArea
 );//TnsBaseSearchStateElement

 TnsBaseSearchStateElements = set of TnsBaseSearchStateElement;

 InsBaseSearcherInitialState = interface(IUnknown)
   ['{E92D641C-DB96-46E9-8DC6-9C0802A7FE41}']
   function pm_GetContext: Il3CString;
   function pm_GetNeedShowWindow: Boolean;
   function pm_GetOpenKind: TnsBaseSearchOpenKind;
   function pm_GetElements: TnsBaseSearchStateElements;
   function pm_GetCurrentSearchClass: InsBaseSearchClass;
   function pm_GetSearchArea: TnsSearchArea;
   function pm_GetNeedActivate: Boolean;
   property Context: Il3CString
     read pm_GetContext;
   property NeedShowWindow: Boolean
     read pm_GetNeedShowWindow;
   property OpenKind: TnsBaseSearchOpenKind
     read pm_GetOpenKind;
   property Elements: TnsBaseSearchStateElements
     read pm_GetElements;
   property CurrentSearchClass: InsBaseSearchClass
     read pm_GetCurrentSearchClass;
   property SearchArea: TnsSearchArea
     read pm_GetSearchArea;
   property NeedActivate: Boolean
     read pm_GetNeedActivate;
 end;//InsBaseSearcherInitialState

 InsBaseSearchInitialStateProvider = interface(IUnknown)
   ['{A5D8EBF4-4701-484C-A32D-EAB41D4411B8}']
   function pm_GetInitialState: InsBaseSearcherInitialState;
   function pm_GetStateForClone: InsBaseSearcherInitialState;
   property InitialState: InsBaseSearcherInitialState
     read pm_GetInitialState;
   property StateForClone: InsBaseSearcherInitialState
     read pm_GetStateForClone;
 end;//InsBaseSearchInitialStateProvider

 InsBaseSearchClasses = interface(IUnknown)
   ['{3D7D5C7D-2890-4D29-804A-F50E579A28CB}']
   function pm_GetFirstClass: InsBaseSearchClass;
   function GetEnumerator: InsBaseSearchClassesEnumerator;
   procedure Subscribe(const aListener: InsBaseSearchClassesListener);
   procedure Unsubscribe(const aListener: InsBaseSearchClassesListener);
   function GetClassByPath(const aPath: Tl3WString): InsBaseSearchClass;
   property FirstClass: InsBaseSearchClass
     read pm_GetFirstClass;
 end;//InsBaseSearchClasses

 InsBaseSearcherWindowData = interface(IUnknown)
   ['{DD7D1F2D-820E-444C-9DF2-8780A9B6256D}']
   function pm_GetClassesAnywayDisabled: Boolean;
   function pm_GetAllowSearchInTitles: Boolean;
   function pm_GetFindEnabled: Boolean;
   function pm_GetFindBackSupported: Boolean;
   function pm_GetFindBackEnabled: Boolean;
   function pm_GetFragmentsCountSuffix: Il3CString;
   function pm_GetPromptTree: Il3SimpleTree;
   function pm_GetErrorWords: IvcmStrings;
   procedure pm_SetErrorWords(const aValue: IvcmStrings);
   function pm_GetContextKind: TnsBaseSearchKind;
   function pm_GetAvailableClasses: InsBaseSearchClasses;
   function pm_GetContext: Il3CString;
   procedure pm_SetContext(const aValue: Il3CString);
   function pm_GetActiveClass: InsBaseSearchClass;
   procedure pm_SetActiveClass(const aValue: InsBaseSearchClass);
   function pm_GetArea: TnsSearchArea;
   procedure pm_SetArea(aValue: TnsSearchArea);
   function pm_GetExampleText: Il3CString;
   function pm_GetActiveClassForSaveState: InsBaseSearchClass;
   procedure StoreActiveClass;
   property ClassesAnywayDisabled: Boolean
     read pm_GetClassesAnywayDisabled;
   property AllowSearchInTitles: Boolean
     read pm_GetAllowSearchInTitles;
   property FindEnabled: Boolean
     read pm_GetFindEnabled;
   property FindBackSupported: Boolean
     read pm_GetFindBackSupported;
     {* � �������� ����� ������ ����� }
   property FindBackEnabled: Boolean
     read pm_GetFindBackEnabled;
     {* ����� ����� �������� � ������ ������ }
   property FragmentsCountSuffix: Il3CString
     read pm_GetFragmentsCountSuffix;
   property PromptTree: Il3SimpleTree
     read pm_GetPromptTree;
   property ErrorWords: IvcmStrings
     read pm_GetErrorWords
     write pm_SetErrorWords;
   property ContextKind: TnsBaseSearchKind
     read pm_GetContextKind;
   property AvailableClasses: InsBaseSearchClasses
     read pm_GetAvailableClasses;
   property Context: Il3CString
     read pm_GetContext
     write pm_SetContext;
   property ActiveClass: InsBaseSearchClass
     read pm_GetActiveClass
     write pm_SetActiveClass;
   property Area: TnsSearchArea
     read pm_GetArea
     write pm_SetArea;
   property ExampleText: Il3CString
     read pm_GetExampleText;
   property ActiveClassForSaveState: InsBaseSearchClass
     read pm_GetActiveClassForSaveState;
     {* http://mdp.garant.ru/pages/viewpage.action?pageId=300026165 }
  // MnsPresentationHolder
   function ValidateBaseSearchForm(const aForm: IvcmEntityForm): Boolean;
     {* ���������, ��� ����� �� "��� �������", �.�. �������� � �� �� ������� ����, ��� � ��� Searcher }
   function pm_GetPresentation: InsBaseSearchPresentation;
   procedure pm_SetPresentation(const aValue: InsBaseSearchPresentation);
   procedure RemovePresentation(const aPresentation: InsBaseSearchPresentation);
   property Presentation: InsBaseSearchPresentation
     read pm_GetPresentation
     write pm_SetPresentation;
 end;//InsBaseSearcherWindowData

 InsBaseSearcher = interface(IUnknown)
   ['{A794F871-A872-47EC-B5D2-C2FFE1FF4138}']
   procedure DropActiveClass;
     {* http://mdp.garant.ru/pages/viewpage.action?pageId=269069309&focusedCommentId=296624258#comment-296624258 }
   function MakeState: InsBaseSearcherInitialState;
   procedure AssignState(const aState: InsBaseSearcherInitialState);
   procedure ForceUpdateClassForHistory;
   function MakeStateParams(aStateElements: TnsBaseSearchStateElements;
     aForClone: Boolean): InsBaseSearcherInitialState;
   procedure ContainerIsClosing;
   procedure Find;
     {* ��������� ������ Find }
   procedure FindBack;
     {* ��������� ������ FindBack }
   procedure ApplyCurrentExample;
     {* ��������� ������ ApplyCurrentExample }
   function pm_GetSearchWindow: InsSearchWindow;
   procedure pm_SetSearchWindow(const aValue: InsSearchWindow);
   function pm_GetWindowData: InsBaseSearcherWindowData;
   procedure ShowWindowByUser(OpenKind: TnsBaseSearchOpenKind);
   property SearchWindow: InsSearchWindow
     read pm_GetSearchWindow
     write pm_SetSearchWindow;
   property WindowData: InsBaseSearcherWindowData
     read pm_GetWindowData;
  // MnsPresentationHolder
   function ValidateBaseSearchForm(const aForm: IvcmEntityForm): Boolean;
     {* ���������, ��� ����� �� "��� �������", �.�. �������� � �� �� ������� ����, ��� � ��� Searcher }
   function pm_GetPresentation: InsBaseSearchPresentation;
   procedure pm_SetPresentation(const aValue: InsBaseSearchPresentation);
   procedure RemovePresentation(const aPresentation: InsBaseSearchPresentation);
   property Presentation: InsBaseSearchPresentation
     read pm_GetPresentation
     write pm_SetPresentation;
 end;//InsBaseSearcher

 TnsBaseSearchWindowState = (
   ns_wsClosed // ���� �������
 , ns_wsOpened // ���� �������
 , ns_wsForce // ���� ���� ������� �������������
 );//TnsBaseSearchWindowState

 InsBaseSearcherWindowDataState = interface(IUnknown)
   ['{FEF02F60-B5AC-4322-B2AD-D71F9F0AC310}']
   function pm_GetActiveClass: InsBaseSearchClass;
   function pm_GetContext: Il3CString;
   function pm_GetWindowState: TnsBaseSearchWindowState;
   property ActiveClass: InsBaseSearchClass
     read pm_GetActiveClass;
   property Context: Il3CString
     read pm_GetContext;
   property WindowState: TnsBaseSearchWindowState
     read pm_GetWindowState;
 end;//InsBaseSearcherWindowDataState

 TnsBaseSearcherChangeElement = (
   ns_ceContext
 , ns_ceActiveClass
 , ns_ceSearchArea
 );//TnsBaseSearcherChangeElement

 TnsBaseSearcherChangeElements = set of TnsBaseSearcherChangeElement;

 InsBaseSearchWindowDataListener = interface(IUnknown)
   ['{077A6E65-4EFE-4D18-B636-37CE23834A28}']
   procedure NotifyBaseSearcherDataChanged(aChangedElements: TnsBaseSearcherChangeElements);
 end;//InsBaseSearchWindowDataListener

 InsBaseSearcherProvider = interface(IUnknown)
   ['{75F17410-E8D4-42B9-84D5-DC1EA4486A12}']
   function Get_BaseSearcher: InsBaseSearcher;
   property BaseSearcher: InsBaseSearcher
     read Get_BaseSearcher;
 end;//InsBaseSearcherProvider

const
  { SearchStateElementConstants }
 ns_sseAll = [ns_sseContext, ns_sseNeedShowWindow, ns_sseOpenKind, ns_sseActiveClass, ns_sseSearchArea];

type
 TnsSearchAreas = set of TnsSearchArea;

 InsBaseSearchView = interface;
 { - ��������������� �������� InsBaseSearchView. }

 InsBaseSearchModelListener = interface;
 { - ��������������� �������� InsBaseSearchModelListener. }

 InsBaseSearchModel = interface(IUnknown)
   ['{A177D497-27C7-44EC-AE4F-1F7E80356A8E}']
   function pm_GetActiveClass: InsBaseSearchClass;
   procedure pm_SetActiveClass(const aValue: InsBaseSearchClass);
   function pm_GetContext: Il3CString;
   procedure pm_SetContext(const aValue: Il3CString);
   function pm_GetArea: TnsSearchArea;
   procedure pm_SetArea(aValue: TnsSearchArea);
   function pm_GetAvailableAreas: TnsSearchAreas;
   function pm_GetFindBackSupported: Boolean;
   function pm_GetFindBackEnabled: Boolean;
   function pm_GetFindEnabled: Boolean;
   function pm_GetIsLocalSearchArea: Boolean;
   function pm_GetExampleText: Il3CString;
   function Find(const aProcessor: InsBaseSearchResultProcessor): Boolean;
   function FindBack(const aProcessor: InsBaseSearchResultProcessor): Boolean;
   procedure AddView(const aVie: InsBaseSearchView);
   procedure RemoveView(const aView: InsBaseSearchView);
   procedure SubscribeListener(const aListener: InsBaseSearchModelListener);
   procedure UnsubscribeListener(const aListener: InsBaseSearchModelListener);
   property ActiveClass: InsBaseSearchClass
     read pm_GetActiveClass
     write pm_SetActiveClass;
   property Context: Il3CString
     read pm_GetContext
     write pm_SetContext;
   property Area: TnsSearchArea
     read pm_GetArea
     write pm_SetArea;
   property AvailableAreas: TnsSearchAreas
     read pm_GetAvailableAreas;
   property FindBackSupported: Boolean
     read pm_GetFindBackSupported;
   property FindBackEnabled: Boolean
     read pm_GetFindBackEnabled;
   property FindEnabled: Boolean
     read pm_GetFindEnabled;
   property IsLocalSearchArea: Boolean
     read pm_GetIsLocalSearchArea;
   property ExampleText: Il3CString
     read pm_GetExampleText;
 end;//InsBaseSearchModel

 InsBaseSearchController = interface;
 { - ��������������� �������� InsBaseSearchController. }

 InsBaseSearchView = interface(IUnknown)
   ['{D7052746-10B0-4077-976C-EE5166E62B84}']
   function pm_GetBaseSearchController: InsBaseSearchController;
   procedure pm_SetBaseSearchController(const aValue: InsBaseSearchController);
   procedure NotifyBaseSearchModelChanged(const aModel: InsBaseSearchModel);
   property BaseSearchController: InsBaseSearchController
     read pm_GetBaseSearchController
     write pm_SetBaseSearchController;
 end;//InsBaseSearchView

 InsBaseSearchController = interface(InsBaseSearchPresentation)
   ['{45CA43A1-2CEA-4D58-AF9A-3209F08E099A}']
   function pm_GetBaseSearchModel: InsBaseSearchModel;
   procedure pm_SetBaseSearchModel(const aValue: InsBaseSearchModel);
   property BaseSearchModel: InsBaseSearchModel
     read pm_GetBaseSearchModel
     write pm_SetBaseSearchModel;
 end;//InsBaseSearchController

 InsBaseSearcherState = interface(IUnknown)
   ['{2E299BC4-4889-4C2D-BFF6-E0F740D84E63}']
   function pm_GetActiveClass: InsBaseSearchClass;
   function pm_GetArea: TnsSearchArea;
   function pm_GetContext: Il3CString;
   property ActiveClass: InsBaseSearchClass
     read pm_GetActiveClass;
   property Area: TnsSearchArea
     read pm_GetArea;
   property Context: Il3CString
     read pm_GetContext;
 end;//InsBaseSearcherState

 InsBaseSearchModelListener = interface(IUnknown)
   ['{1DC524FF-884C-41F7-B466-84D4A3F890DB}']
   procedure NotifyBaseSearchModelChanged(const aModel: InsBaseSearchModel);
 end;//InsBaseSearchModelListener
{$IfEnd} //not Admin

implementation

end.