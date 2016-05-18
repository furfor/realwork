unit ExText_Form;
 {* ����� ���������, ���������� � IdsDocument � ������� ���������� ������������ ������� ����� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Document\Forms\ExText_Form.pas"
// ���������: "VCMContainer"
// ������� ������: "ExText" MUID: (49539DBA029D)
// ��� ����: "TExTextForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , Common_Strange_Controls
 , Search_Strange_Controls
 , Document_Strange_Controls
 , Base_Operations_Strange_Controls
 , Document_F1Lite_Controls
 , Base_Operations_Editions_Controls
 , l3TabbedContainersDispatcher
 , DocumentAndListInterfaces
 , DictionInterfacesPrim
 , InpharmInterfaces
 , ConsultationDomainInterfaces
 , L10nInterfaces
 , WorkWithDocumentInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , nevTools
 , bsTypes
 , l3TreeInterfaces
 , DocumentUnit
 , nsTypes
 , AdapterFacade
 , eeInterfaces
 , nevNavigation
 , l3Interfaces
 , Windows
 , l3Variant
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , nevContainers
 , evCustomEditorWindow
 , BaseSearchInterfaces
 , DocumentInterfaces
 , ExternalOperationUnit
 , bsTypesNew
 , NavigationInterfaces
 , Messages
 , afwInterfaces
 {$If NOT Defined(NoVCM)}
 , vcmControllers
 {$IfEnd} // NOT Defined(NoVCM)
 , eeSubPanel
 , vtScrollBar
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , bsInterfaces
 , Base_Operations_F1Specific_Controls
 {$If Defined(Nemesis)}
 , nscEditor
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscTextSource
 {$IfEnd} // Defined(Nemesis)
 , l3BaseStream
 , nsTypesNew
 , k2CustomFileGenerator
 , k2TagGen
 , l3InternalInterfaces
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Text_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 , PrimBaseSearchInterfaces
 , l3SimpleObject
 {$If Defined(Nemesis)}
 , nscNewInterfaces
 {$IfEnd} // Defined(Nemesis)
 , PresentationInterfaces
 , l3Core
 , Base_Operations_View_Controls
 , nevGUIInterfaces
 , afwNavigation
 , nevBase
 , l3LongintList
 , nsFoundBlocksList
 , DocInfoInterfaces
 , UnderControlUnit
 , BaseDocumentWithAttributesInterfaces
 , UnderControlInterfaces
 , Hypertext_Controls_Controls
 , evdTypes
 , l3StringIDEx
 , l3ProtoObject
;

const
 {* ������������ ������ LocalForChangedFragments }
 str_ViewChangesOpName: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ViewChangesOpName'; rValue : '����� ��������� ���������');
  {* '����� ��������� ���������' }

type
 IExTextFormState = interface(IvcmBase)
  ['{BE5E5BDA-BD9E-4C35-86E5-EA717CAA2E11}']
  function pm_GetInnerState: IvcmBase;
  function pm_GetNeedShowUserComments: Boolean;
  function Get_eeSubIdForTypedCorrespondentList: Integer;
  function pm_GetNeedShowComments: Boolean;
  function pm_GetNeedShowVersionComments: Boolean;
  property InnerState: IvcmBase
   read pm_GetInnerState;
  property NeedShowUserComments: Boolean
   read pm_GetNeedShowUserComments;
  property eeSubIdForTypedCorrespondentList: Integer
   read Get_eeSubIdForTypedCorrespondentList;
  property NeedShowComments: Boolean
   read pm_GetNeedShowComments;
  property NeedShowVersionComments: Boolean
   read pm_GetNeedShowVersionComments;
 end;//IExTextFormState

 TExTextFormState = class(Tl3ProtoObject, IExTextFormState)
  private
   f_InnerState: IvcmBase;
   f_NeedShowUserComments: Boolean;
   f_eeSubIdForTypedCorrespondentList: Integer;
   f_NeedShowComments: Boolean;
   f_NeedShowVersionComments: Boolean;
  protected
   function pm_GetInnerState: IvcmBase;
   function pm_GetNeedShowUserComments: Boolean;
   function Get_eeSubIdForTypedCorrespondentList: Integer;
   function pm_GetNeedShowComments: Boolean;
   function pm_GetNeedShowVersionComments: Boolean;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(const aInnerState: IvcmBase;
    aNeedShowUserComments: Boolean;
    aNeedShowComments: Boolean;
    aNeedShowVersionComments: Boolean;
    aEeSubIdForTypedCorrespondentList: Integer); reintroduce;
   class function Make(const aInnerState: IvcmBase;
    aNeedShowUserComments: Boolean;
    aNeedShowComments: Boolean;
    aNeedShowVersionComments: Boolean;
    aEeSubIdForTypedCorrespondentList: Integer): IExTextFormState; reintroduce;
   function QueryInterface(const IID: TGUID;
    out Obj): HResult; override;
 end;//TExTextFormState

 _SearcheableText_Parent_ = TvcmContainerForm;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\Forms\SearcheableText.imp.pas}
 _PageControlNotification_Parent_ = _SearcheableText_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\PageControlNotification.imp.pas}
 _TurnOnTimeMachine_Parent_ = _PageControlNotification_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\TurnOnTimeMachine.imp.pas}
 _TurnOffTimeMachine_Parent_ = _TurnOnTimeMachine_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\TurnOffTimeMachine.imp.pas}
 _WorkWithRedactions_Parent_ = _TurnOffTimeMachine_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\WorkWithRedactions.imp.pas}
 _DocumentPresentation_Parent_ = _WorkWithRedactions_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentPresentation.imp.pas}
 _HyperlinkProcessor_Parent_ = _DocumentPresentation_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkProcessor.imp.pas}
 _TextWithComments_Parent_ = _HyperlinkProcessor_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\TextWithComments.imp.pas}
 _DocumentUserTypes_Parent_ = _TextWithComments_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentUserTypes.imp.pas}
 _BlockSelector_Parent_ = _DocumentUserTypes_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BlockSelector.imp.pas}
 _CommonForTextAndFlashOperations_Parent_ = _BlockSelector_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\CommonForTextAndFlashOperations.imp.pas}
 _HyperlinkOperations_Parent_ = _CommonForTextAndFlashOperations_;
 {$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkOperations.imp.pas}
 _vcmChromeLikeTabCaptionProvider_Parent_ = _HyperlinkOperations_;
 {$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabCaptionProvider.imp.pas}
 _vcmChromeLikeTabIconUpdater_Parent_ = _vcmChromeLikeTabCaptionProvider_;
 {$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabIconUpdater.imp.pas}
 TExTextForm = class(_vcmChromeLikeTabIconUpdater_, Il3SelectedTabDependent)
  {* ����� ���������, ���������� � IdsDocument � ������� ���������� ������������ ������� ����� }
  private
   f_NeedAnnoingCheck: Boolean;
   f_InGoToInternet: Boolean;
   f_TabCaption: IvcmCString;
   f_DocumentLoaded: Boolean;
   f_eeSubIdForTypedCorrespondentList: Integer;
   {$If Defined(nsTest)}
   f_NeedShowIntranetWarningHack: Boolean;
    {* ���� ��� �������� NeedShowIntranetWarningHack }
   {$IfEnd} // Defined(nsTest)
  protected
   DocumentWithContents: IucbDocumentWithContents;
   DictionDocument: IdsDictionDocument;
    {* �������� ��������� �������. ����� ���� nil }
   MedicFirmDocument: IdsMedicFirmDocument;
    {* �������� ���. �����. ����� ���� nil }
   DrugDocument: IdsDrugDocument;
    {* ��������-��������. ����� ���� nil }
   Consultation: IsdsConsultation;
   dsConsultation: IdsConsultation;
   f_ControlMap: InsStringValueMap;
   f_LastBookmarkIndex: Integer;
   f_RecallCreateTOCTree: IdeSimpleTree;
   f_HyperlinkCallStatus: Boolean;
   AAC: IsdsAAC;
  private
   procedure DoFindInDict;
   procedure DoFocusViaMouseSet(aSender: TObject);
   procedure TextSourceTOCCreated(aSender: TObject;
    const aTOC: Il3SimpleTree);
   procedure TextSourceMakeDocumentContainer(Sender: TObject;
    var aMade: InevDocumentContainer);
   procedure TextSourceDocumentChanged(aSender: TObject;
    anOldDocument: Tl3Tag;
    aNewDocument: Tl3Tag);
   procedure OnHistoryState(Sender: TObject;
    var IsLast: Boolean);
   procedure GoToIntranetPrim(aNeedCheck: Boolean);
   procedure SetFocusToTextInAAC;
   function GetCorrespondentListTest: Boolean;
   function GetRespondentListTest: Boolean;
   procedure CheckLinkedWindows;
    {* �������������� ��������� ��������� ���� }
   procedure DoHyperlinkNavigate(Sender: TObject);
   procedure DoTextZOrderChanging(aSender: TObject;
    var aCanChangeZOrder: Boolean);
   function HasVisibleBookmarks(const aBookmarks: IeeSubList): Boolean;
   procedure ExcludeRootSub(const aParams: IvcmTestParamsPrim);
   function MakePositionListBySub(aSubID: Integer): IPositionList;
   procedure CheckIsDocumentSub(const aParams: IvcmTestParamsPrim);
   function ExtractRangeFromSubPanel(const aParams: IvcmExecuteParams): InevRange;
   function MakeCaption(const aDocument: IDocument;
    aShort: Boolean): Il3CString;
   procedure UpdateDocumentCaption(const aDocument: IDocument);
   procedure OpenDocumentInNewContainer(aOpenKind: TvcmMainFormOpenKind);
  protected
   function CheckParamForUserType(aUserType: Integer): Boolean;
   procedure DisableOperation(const aParams: IvcmTestParamsPrim);
   procedure CRToPartTest(const aParams: IvcmTestParamsPrim;
    aCRType: TlstCRType);
    {* ����� ���������� ��� ��� � ����� }
   procedure CRToPartExecute(const aParams: IvcmExecuteParamsPrim;
    aCRType: TlstCRType);
    {* ����� ���������� ��� ��� � ����� }
   procedure TurnOnTimeMachine(const aDate: Il3CString);
    {* �������� ������ ������� �� ���� }
   procedure OpenContents(aMode: TnsContentsOpenMode);
   function FiltrateTOCTree(const aTOC: Il3SimpleTree;
    NeedFiltrate: Boolean = True): Il3SimpleTree;
   procedure ShowWarningPage(SwitchActivity: Boolean;
    anOffset: TnsWarningSub = DocumentAndListInterfaces.cNoneWarningSub);
   function GetVisibleBookmarksCount(const aBookmarks: IeeSubList): Integer;
   function GetVisibleBookmark(const aBookmarks: IeeSubList;
    anIndex: Integer = 0): IeeSub;
   procedure EditBookmark(anID: Integer);
   function NeedShowIntranetWarning: Boolean;
   procedure GoToIntranet;
   procedure CheckForcedQueryForIntranet;
   procedure RequiestCheckForcedQueryForInternet;
   procedure UpdateSubPanelDescription;
   procedure InvalidateDataSources;
    {* �������������� ����� �������� ������ � ������������ ����������� ������ }
   procedure UpdateTechComment;
   procedure CreateTOC(const aTOC: IdeSimpleTree); virtual; abstract;
   procedure LoadFromSettings;
    {* ��������� ��������� � ����� }
   procedure ShowSubNumbers;
   procedure DoSettingsChanged;
    {* ���������� � ������ ���������\������ ��������. }
   function GetCurrentCaption: Il3CString;
   function GetCurrentImage: Integer;
   procedure CorrespondentsToSubTest(const aParams: IvcmTestParamsPrim);
   function ExtractSubFromSubPanel(const aTarget: IUnknown): IeeSub;
   procedure OpenPicture(const aPara: IeePara;
    const aPicture: IeePicture;
    aOpenKind: TvcmMainFormOpenKind = vcmInterfaces.vcm_okInCurrentTab);
   function LeafParaUnderCursor: IeePara;
   function MakePositionList(aCRType: TlstCRType): IPositionList;
   procedure SetFocusToText;
   function GetNeedsStatusBarItems: Boolean;
   function NeedShowTOC: Boolean;
    {* ����� �� ���������� ���������� }
   function ExtractRangeFromList(const aList: InevFlatSubsList): InevRange;
   function ExtractRangeFromSub(aID: Integer;
    aLayerID: Integer): InevRange;
   function IsPictureUnderCursor: Boolean;
   procedure ChangePositionByDataSource;
    {* �������� ������� � ��������� �� ������ ���������� ��������� ������ }
   function OpenCRList(aKind: TlstCRType;
    const aType: Il3SimpleNode;
    ReConvertNode: Boolean): Boolean;
    {* ������� ������ ���������������/������������ }
   procedure TypedCRToPartTest(const aParams: IvcmTestParamsPrim;
    aCRType: TlstCRType);
   procedure GetCorrespondentListEx(aParamsIndex: Integer;
    const aChoosedNode: Il3SimpleNode);
    {* �������, ��� ���? }
   procedure OpenCRListToPart(aCRType: TlstCRType;
    const aType: Il3SimpleNode;
    const aPositionList: IPositionList = nil);
   procedure GetRespondentListEx(aParamsIndex: Integer;
    const aChoosedNode: Il3SimpleNode);
   procedure SynchronizeWithRedationsForm;
   procedure ReloadRedaction(aChangeType: TnsChangeRedactionType;
    aRedaction: TRedactionID = 0); overload; virtual; abstract;
   function ReloadRedaction(const aDate: AdapterDate): Boolean; overload; virtual; abstract;
   procedure SetActualRedaction; virtual; abstract;
   function ExtractRangeFromContents(const aData: IUnknown;
    aUserType: Integer): InevRange; virtual; abstract;
   procedure ExportBlock(const aRange: InevRange;
    ToActiveWindow: Boolean); virtual; abstract;
   procedure SelectBlock(const aRange: InevRange); virtual; abstract;
   procedure CopyBlock(const aRange: InevRange); virtual; abstract;
   procedure PrintBlock(const aRange: InevRange); virtual; abstract;
   procedure PrintDialogBlock(const aRange: InevRange); virtual; abstract;
   procedure PreviewBlock(const aRange: InevRange); virtual; abstract;
   function FindBookmarkInText(const aBookmark: IBookmark;
    out aSub: IeeSub): Boolean; virtual; abstract;
   procedure InitHyperLink(const aHyperLink: IevHyperlink;
    const aBaseEntity: IUnknown); virtual; abstract;
   function EnableRedactionOps(const aParams: IvcmTestParamsPrim): Boolean; virtual; abstract;
   procedure OpenInWindow(aNew: Boolean = True); virtual; abstract;
   procedure DoSwitchToFirstTab;
   procedure OpenRedactionList;
   procedure dftMedicFirmSynchroViewQueryMaximized(aSender: TObject); override;
    {* ���������� ������� dftMedicFirmSynchroView.OnQueryMaximized }
   procedure dftTranslationQueryMaximized(aSender: TObject); override;
    {* ���������� ������� dftTranslation.OnQueryMaximized }
   procedure DoTabActivate; override;
    {* ������� �� ������������ ������� }
   procedure SetBookmark; override;
    {* ������������� �������� �� ������� ����� �������� ��������� }
   function CanAddBookmark: Boolean; override;
    {* ����� �� ������ ��������� �������� }
   function DocumentIsValid: Boolean; override;
    {* ���� �� ��������, ������� � ������ }
   function RedactionCurrentPara: IeeLeafPara; override;
    {* ������� �������� �������� ��� ������������� � ����� ���������� �������� }
   function DoProcessExternalOperation(const anOperation: IExternalOperation): Boolean; override;
    {* ���������� ������� �������� }
   procedure GotoPoint(aPointID: Cardinal;
    aPointType: TDocumentPositionType = bsTypesNew.dptSub); override;
    {* ������� �� ����� � ��������� }
   procedure OpenRedactionLocalLink(const aDocument: IDocument;
    aSub: Cardinal;
    aBehaviour: TbsProcessHyperLinkBehaviour); override;
    {* ��������� ��������� ������ �� ������ �������� }
   function HyperlinkDocument: IDocument; override;
    {* �������� �� �������� ���� ������ }
   function pm_GetHyperlinkText: TevCustomEditorWindow; override;
   function CanBeChanged: Boolean; override;
    {* ����� �� �������� ���� ������� }
   function IsFloating: Boolean; override;
    {* ����� ��������� }
   function pm_GetTextWithComments: TevCustomEditorWindow; override;
   function NeedGotoNeighbours: Boolean; override;
    {* ���� �� ���������� �� ������� ����� }
   procedure OpenRedactionGlobalLink(const aDocument: IDocument;
    aSub: Cardinal;
    aBehaviour: TbsProcessHyperLinkBehaviour); override;
   procedure TabBecomeActive;
   procedure TabBecomeInactive;
   procedure dftDrugSynchroViewQueryOpen(aSender: TObject); override;
    {* ���������� ������� dftDrugSynchroView.OnQueryOpen }
   procedure dftDictSubEntryQueryClose(aSender: TObject); override;
    {* ���������� ������� dftDictSubEntry.OnQueryClose }
   procedure dftTranslationQueryClose(aSender: TObject); override;
    {* ���������� ������� dftTranslation.OnQueryClose }
   procedure dftChronologyQueryClose(aSender: TObject); override;
    {* ���������� ������� dftChronology.OnQueryClose }
   procedure dftDrugSynchroViewQueryMaximized(aSender: TObject); override;
    {* ���������� ������� dftDrugSynchroView.OnQueryMaximized }
   procedure dftAnnotationQueryClose(aSender: TObject); override;
    {* ���������� ������� dftAnnotation.OnQueryClose }
   procedure dftDocSynchroViewQueryMaximized(aSender: TObject); override;
    {* ���������� ������� dftDocSynchroView.OnQueryMaximized }
   procedure dftRelatedDocQueryClose(aSender: TObject); override;
    {* ���������� ������� dftRelatedDoc.OnQueryClose }
   procedure dftTranslationQueryOpen(aSender: TObject); override;
    {* ���������� ������� dftTranslation.OnQueryOpen }
   procedure dftDocSynchroViewQueryOpen(aSender: TObject); override;
    {* ���������� ������� dftDocSynchroView.OnQueryOpen }
   procedure dftMedicFirmSynchroViewQueryOpen(aSender: TObject); override;
    {* ���������� ������� dftMedicFirmSynchroView.OnQueryOpen }
   {$If NOT Defined(NoVCL)}
   procedure WndProc(var Message: TMessage); override;
   {$IfEnd} // NOT Defined(NoVCL)
   procedure FinishDataUpdate; override;
   function DoSettingChanged(const aSettingId: TafwSettingId): Boolean; override;
    {* ���������� ��������� ��������� ��������� }
   procedure SettingsReplaceFinish; override;
   procedure UserSettingsChanged; override;
    {* ���������� ��������� ������������ }
   {$If NOT Defined(NoVCM)}
   procedure NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
    const aNew: IvcmViewAreaController); override;
    {* ��������� �������� ������. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
    {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function DoSaveState(out theState: IvcmBase;
    aStateType: TvcmStateType;
    aForClone: Boolean): Boolean; override;
    {* ��������� ��������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function DoLoadState(const aState: IvcmBase;
    aStateType: TvcmStateType): Boolean; override;
    {* ��������� ��������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   function CanAddToControl: Boolean; override;
    {* ����� �� ��������� �� �������� }
   function DoMakeLinkDocInfo(const aDocument: IDocument;
    aPointType: TDocumentPositionType;
    aSub: Cardinal): IdeDocInfo; override;
   function DoProcessLocalLink(const aDocument: IDocument;
    aPointType: TDocumentPositionType;
    aSub: Cardinal;
    aBehaviour: TbsProcessHyperLinkBehaviour): Boolean; override;
    {* ��������� ��������� ������ }
   function NeedsStatusBarItems: Boolean; override;
    {* ����������, ��� �������� � ��������� ������ ���� ���� ����������� }
   {$If NOT Defined(NoVCM)}
   procedure InitControls; override;
    {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   procedure VersionCommentsVisibleInvertedByUser(NewState: Boolean); override;
   procedure DoDocumentShowTechCommentsExecute; override;
   function pm_GetHyperlinkSubID: Integer; override;
   procedure DoSetHyperlinkCallStatus(aValue: Boolean); override;
    {* ���������� ����, ������������ ������������� ������� �� ������ }
   {$If NOT Defined(NoVCM)}
   procedure FormInsertedIntoContainer; override;
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure BecomeVisible; override;
   {$IfEnd} // NOT Defined(NoVCM)
   procedure ClearFields; override;
   function GetBehaviourFromEffects(anEffects: TafwJumpToEffects): TbsProcessHyperLinkBehaviour; override;
   function GetDocumentShortName(const aDoc: IDocument;
    aExportSelection: Boolean): Il3CString; override;
   {$If NOT Defined(NoVCM)}
   function DoGetTabCaption: IvcmCString; override;
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
   function DoGetFormSetTabCaption: IvcmCString; override;
   {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
   {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
   function DoGetTabImageIndex: Integer; override;
   {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
   {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
   function DoGetCanDefineFormSetIcon: Boolean; override;
   {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
   procedure AfterOpenHyperlinkInNewTab; override;
   function GetParaIDForSaveInWorkJournal: Integer; override;
   function NeedSaveInWorkJournal: Boolean; override;
   {$If NOT Defined(NoVCM)}
   function DoGetNeedAddFormToTasksPanel: Boolean; override;
   {$IfEnd} // NOT Defined(NoVCM)
  public
   procedure Document_OpenCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
    {* �������, ��� ���? }
   procedure Document_OpenCorrespondentList_Execute(aKind: TlstCRType;
    const aCRType: Il3SimpleNode);
    {* �������, ��� ���? }
   procedure Document_OpenCorrespondentList(const aParams: IvcmExecuteParamsPrim);
    {* �������, ��� ���? }
   procedure Document_OpenRespondentList_Test(const aParams: IvcmTestParamsPrim);
    {* �������, ��� ���? }
   procedure Document_OpenRespondentList_Execute(aKind: TlstCRType;
    const aCRType: Il3SimpleNode);
    {* �������, ��� ���? }
   procedure Document_OpenRespondentList(const aParams: IvcmExecuteParamsPrim);
    {* �������, ��� ���? }
   procedure Document_GetAttributesFrmAct_Test(const aParams: IvcmTestParamsPrim);
    {* ���������� � ��������� }
   procedure Document_GetAttributesFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ���������� � ��������� }
   function Loadable_Load_Execute(const aNode: IeeNode;
    const aData: IUnknown;
    anOp: TListLogicOperation = LLO_NONE): Boolean;
    {* �������, ��� ����� ������� ���� �����? }
   procedure Loadable_Load(const aParams: IvcmExecuteParamsPrim);
    {* �������, ��� ����� ������� ���� �����? }
   procedure Document_GetRelatedDocFrmAct_Test(const aParams: IvcmTestParamsPrim);
    {* ������� � ��������� }
   procedure Document_GetRelatedDocFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������� � ��������� }
   procedure Document_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
    {* ������ �� �������� }
   procedure Document_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ �� �������� }
   procedure Document_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
    {* ������ �� ��������� }
   procedure Document_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ �� ��������� }
   function Document_AttributesCanBeClosed_Execute: Boolean;
    {* ��� �������� �� ������� � Facet ��� ���-�� �������� }
   procedure Document_AttributesCanBeClosed(const aParams: IvcmExecuteParamsPrim);
    {* ��� �������� �� ������� � Facet ��� ���-�� �������� }
   procedure Document_CommonDocumentOpenNewWindow_Execute(aUserType: Integer);
    {* ��� ���? }
   procedure Document_CommonDocumentOpenNewWindow(const aParams: IvcmExecuteParamsPrim);
    {* ��� ���? }
   procedure System_TimeMachineStateChange_Execute(aStayInCurrentRedaction: Boolean = False);
   procedure System_TimeMachineStateChange(const aParams: IvcmExecuteParamsPrim);
   procedure Redactions_RedactionOnID_Execute(aRedactionID: TRedactionID);
   procedure Redactions_RedactionOnID(const aParams: IvcmExecuteParamsPrim);
   function Document_FindExplanation_Execute: Boolean;
    {* ����� ���������� }
   procedure Document_FindExplanation(const aParams: IvcmExecuteParamsPrim);
    {* ����� ���������� }
   procedure Selection_FindInDict_Test(const aParams: IvcmTestParamsPrim);
    {* ����� � �������� ������� }
   procedure Selection_FindInDict_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ����� � �������� ������� }
   function Document_SetPosition_Execute(aPointID: Cardinal;
    aPointType: TDocumentPositionType = bsTypesNew.dptSub;
    aUserType: Integer = 0): Boolean;
   procedure Document_SetPosition(const aParams: IvcmExecuteParamsPrim);
   procedure Document_SetActive_Execute(aUserType: Integer);
   procedure Document_SetActive(const aParams: IvcmExecuteParamsPrim);
   procedure Document_ExportBlock_Execute(const aData: IUnknown;
    aUserType: Integer;
    aToActiveWindow: Boolean);
   procedure Document_ExportBlock(const aParams: IvcmExecuteParamsPrim);
   procedure Document_GetCurrentPosition_Test(const aParams: IvcmTestParamsPrim);
   function Document_GetCurrentPosition_Execute: Integer;
   procedure Document_GetCurrentPosition(const aParams: IvcmExecuteParamsPrim);
   procedure Document_SelectBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_SelectBlock(const aParams: IvcmExecuteParamsPrim);
   procedure Document_CopyBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_CopyBlock(const aParams: IvcmExecuteParamsPrim);
   procedure Document_PrintBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_PrintBlock(const aParams: IvcmExecuteParamsPrim);
   procedure Document_PrintDialogBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_PrintDialogBlock(const aParams: IvcmExecuteParamsPrim);
   procedure Document_PreviewBlock_Execute(const aData: IUnknown;
    aUserType: Integer);
   procedure Document_PreviewBlock(const aParams: IvcmExecuteParamsPrim);
   procedure Document_ShowRespondentListToPart_Execute(const aList: IPositionList;
    const aCurrent: Il3SimpleNode = nil);
   procedure Document_ShowRespondentListToPart(const aParams: IvcmExecuteParamsPrim);
   procedure Document_ShowCorrespondentListToPart_Execute(const aList: IPositionList;
    const aCurrent: Il3SimpleNode = nil);
   procedure Document_ShowCorrespondentListToPart(const aParams: IvcmExecuteParamsPrim);
   procedure Document_ModifyBookmarkNotify_Execute(const anEntity: IUnknown);
   procedure Document_ModifyBookmarkNotify(const aParams: IvcmExecuteParamsPrim);
   procedure Document_AddBookmarkFromContents_Execute(const aTag: Il3TagRef);
   procedure Document_AddBookmarkFromContents(const aParams: IvcmExecuteParamsPrim);
   procedure Document_GetCorrespondentListExFrmAct_Test(const aParams: IvcmTestParamsPrim);
    {* ������ �� �������� (��� ����������) }
   procedure Document_GetCorrespondentListExFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ �� �������� (��� ����������) }
   procedure Document_GetRespondentListExFrmAct_Test(const aParams: IvcmTestParamsPrim);
    {* ������ �� ��������� (��� ����������) }
   procedure Document_GetRespondentListExFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ �� ��������� (��� ����������) }
   procedure TimeMachine_TimeMachineOnOff_Test(const aParams: IvcmTestParamsPrim);
   procedure TimeMachine_TimeMachineOnOff_Execute;
   procedure TimeMachine_TimeMachineOnOff(const aParams: IvcmExecuteParamsPrim);
   procedure TimeMachine_TimeMachineOffAndReset_Test(const aParams: IvcmTestParamsPrim);
   procedure TimeMachine_TimeMachineOffAndReset_Execute;
   procedure TimeMachine_TimeMachineOffAndReset(const aParams: IvcmExecuteParamsPrim);
   procedure Document_OpenNotSureTopic_Execute;
   procedure Document_OpenNotSureTopic(const aParams: IvcmExecuteParamsPrim);
   procedure Redactions_ActualRedaction_Test(const aParams: IvcmTestParamsPrim);
   procedure Redactions_ActualRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Edit_ToggleFoundWords_Test(const aParams: IvcmTestParamsPrim);
    {* ������������ ��������� �������� }
   procedure Edit_ToggleFoundWords_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������������ ��������� �������� }
   function Document_GotoPara_Execute(const aPara: Il3TagRef;
    aUserType: Integer): Boolean;
   procedure Document_GotoPara(const aParams: IvcmExecuteParamsPrim);
   procedure TimeMachine_TimeMachineOnOffNew_Test(const aParams: IvcmTestParamsPrim);
    {* �������� ������ ������� }
   procedure TimeMachine_TimeMachineOnOffNew_Execute(const aParams: IvcmExecuteParamsPrim);
    {* �������� ������ ������� }
   procedure TimeMachine_TimeMachineOnOffNew_GetState(var State: TvcmOperationStateIndex);
    {* �������� ������ ������� }
   procedure Redactions_OpenRedactionListFrmAct_Test(const aParams: IvcmTestParamsPrim);
    {* ������ �������� }
   procedure Redactions_OpenRedactionListFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ �������� }
   procedure Redactions_OpenRedactionListFrmAct_GetState(var State: TvcmOperationStateIndex);
    {* ������ �������� }
   procedure Document_GetParaForPositionning_Test(const aParams: IvcmTestParamsPrim);
   function Document_GetParaForPositionning_Execute: IeeLeafPara;
   procedure Document_GetParaForPositionning(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetTypedCorrespondentList_GetState(var State: TvcmOperationStateIndex);
   procedure DocumentBlock_GetTypedRespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetTypedRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_GetAnnotationDocFrmAct_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_GetAnnotationDocFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_SimilarDocuments_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_SimilarDocuments_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_UserCR1_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_UserCR1_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_UserCR1_GetState(var State: TvcmOperationStateIndex);
   procedure DocumentBlockHeader_UserCR2_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_UserCR2_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_UserCR2_GetState(var State: TvcmOperationStateIndex);
   procedure DocumentBlockHeader_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Redactions_PrevRedaction_Test(const aParams: IvcmTestParamsPrim);
   procedure Redactions_PrevRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Redactions_NextRedaction_Test(const aParams: IvcmTestParamsPrim);
   procedure Redactions_NextRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_AddToControl_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_AddToControl_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_AddToControl_GetState(var State: TvcmOperationStateIndex);
   procedure Selection_ShowCorrespondentListToPart_Test(const aParams: IvcmTestParamsPrim);
   procedure Selection_ShowCorrespondentListToPart_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Selection_ShowRespondentListToPart_Test(const aParams: IvcmTestParamsPrim);
   procedure Selection_ShowRespondentListToPart_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnOnControl_ClearStatusSettings_Test(const aParams: IvcmTestParamsPrim);
    {* ������ ������ ������� "�������" }
   procedure WarnOnControl_ClearStatusSettings_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ ������ ������� "�������" }
   procedure TasksPanel_TimeMachineOnOff_Test(const aParams: IvcmTestParamsPrim);
   procedure TasksPanel_TimeMachineOnOff_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure TasksPanel_TimeMachineOnOff_GetState(var State: TvcmOperationStateIndex);
   procedure DocumentBlockHeader_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_Print_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_Print_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockHeader_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlockHeader_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlockBookmarks_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
    {* ���������� �������� �� �������� }
   procedure DocumentBlockBookmarks_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ���������� �������� �� �������� }
   procedure DocumentBlock_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_Copy_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_Copy_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_Print_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_Print_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_OpenContentsFrmAct_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_OpenContentsFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_OpenContentsFrmAct_GetState(var State: TvcmOperationStateIndex);
   procedure Document_ShowDocumentPicture_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_ShowDocumentPicture_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure ExternalObject_Open_Test(const aParams: IvcmTestParamsPrim);
   procedure ExternalObject_Open_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure ExternalObject_Save_Test(const aParams: IvcmTestParamsPrim);
   procedure ExternalObject_Save_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnRedaction_OpenActualRedaction_Test(const aParams: IvcmTestParamsPrim);
   procedure WarnRedaction_OpenActualRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnTimeMachine_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
   procedure WarnTimeMachine_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnTimeMachine_ShowInfo_GetState(var State: TvcmOperationStateIndex);
   procedure WarnTimeMachine_TimeMachineOnOffNew_Test(const aParams: IvcmTestParamsPrim);
   procedure WarnTimeMachine_TimeMachineOnOffNew_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnTimeMachine_TimeMachineOnOffNew_GetState(var State: TvcmOperationStateIndex);
   procedure WarnJuror_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
   procedure WarnJuror_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure WarnJuror_ShowInfo_GetState(var State: TvcmOperationStateIndex);
   procedure WarnOnControl_ShowChanges_Test(const aParams: IvcmTestParamsPrim);
    {* �������� ��������� }
   procedure WarnOnControl_ShowChanges_Execute(const aParams: IvcmExecuteParamsPrim);
    {* �������� ��������� }
   procedure WarnOnControl_ClearStatus_Test(const aParams: IvcmTestParamsPrim);
    {* �������� ������ "�������" }
   procedure WarnOnControl_ClearStatus_Execute(const aParams: IvcmExecuteParamsPrim);
    {* �������� ������ "�������" }
   procedure BookmarkIcon_Delete_Test(const aParams: IvcmTestParamsPrim);
   procedure BookmarkIcon_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure BookmarkIcon_Edit_Test(const aParams: IvcmTestParamsPrim);
   procedure BookmarkIcon_Edit_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure UserCommentIcon_Delete_Test(const aParams: IvcmTestParamsPrim);
   procedure UserCommentIcon_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure UserCommentIcon_HideShow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure UserCommentIcon_HideShow_GetState(var State: TvcmOperationStateIndex);
   procedure UserComment_Delete_Test(const aParams: IvcmTestParamsPrim);
   procedure UserComment_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_AddUserComment_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_AddUserComment_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_GetGraphicImage_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_GetGraphicImage_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_DocumentSynchroOpenWindow_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_DocumentSynchroOpenWindow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_DocumentSynchroOpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_DocumentSynchroOpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_DictListOpenFrmAct_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_DictListOpenFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_GotoBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_GotoBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_LiteratureListForDictionary_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_LiteratureListForDictionary_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_EditBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_EditBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_DeleteBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_DeleteBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_OpenProducedDrugList_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_OpenProducedDrugList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_OpenSimilarDrugList_Test(const aParams: IvcmTestParamsPrim);
   procedure Document_OpenSimilarDrugList_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Selection_InsertHyperlink_Test(const aParams: IvcmTestParamsPrim);
    {* ��������� ������... }
   procedure Selection_InsertHyperlink_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ��������� ������... }
   procedure Selection_InsertHyperlink_GetState(var State: TvcmOperationStateIndex);
    {* ��������� ������... }
   procedure WarnRedaction_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
    {* �������� ����� �������������� }
   procedure WarnRedaction_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
    {* �������� ����� �������������� }
   procedure WarnRedaction_ShowInfo_GetState(var State: TvcmOperationStateIndex);
    {* �������� ����� �������������� }
   procedure DocumentBlock_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_Select_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_Select_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Document_ViewChangedFragments_Test(const aParams: IvcmTestParamsPrim);
    {* ����� ��������� ��������� }
   procedure Document_ViewChangedFragments_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ����� ��������� ��������� }
   procedure DocumentSubPanel_UpdateSubPanel_Execute;
   procedure DocumentSubPanel_UpdateSubPanel(const aParams: IvcmExecuteParamsPrim);
   procedure IntranetSourcePoint_GoToIntranet_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Picture_Open_Test(const aParams: IvcmTestParamsPrim);
    {* ������� � ������� ���� }
   procedure Picture_Open_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������� � ������� ���� }
   procedure Picture_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
    {* ������� � ����� ���� }
   procedure Picture_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������� � ����� ���� }
   function BaseSearchPresentationHolder_GetBaseSearchPresentation_Execute: InsBaseSearchPresentation;
   procedure BaseSearchPresentationHolder_GetBaseSearchPresentation(const aParams: IvcmExecuteParamsPrim);
   procedure Text_SelectWord_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_SelectWord_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Text_SelectPara_Test(const aParams: IvcmTestParamsPrim);
   procedure Text_SelectPara_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure Picture_OpenNewTab_Test(const aParams: IvcmTestParamsPrim);
    {* ������� � ����� ������� }
   procedure Picture_OpenNewTab_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������� � ����� ������� }
   procedure Document_CommonDocumentOpenNewTab_Execute(aUserType: Integer);
   procedure Document_CommonDocumentOpenNewTab(const aParams: IvcmExecuteParamsPrim);
   procedure DocumentBlock_GetSimilarDocsToBlock_Test(const aParams: IvcmTestParamsPrim);
   procedure DocumentBlock_GetSimilarDocsToBlock_Execute(const aParams: IvcmExecuteParamsPrim);
   {$If NOT Defined(NoVCM)}
   procedure SetPositionByDS; override;
    {* ���������� ����� ����� �������� ������� ��������� �������� ������. [$136258455] }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function NeedDrawCaption: Boolean; override;
    {* ����� �� �������� ��������� ���� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function DoGetTabInfo(out theCaption: Il3CString;
    out theItemIndex: Integer): Boolean; override;
    {* ���������� � ��������, � ������� ����������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function NeedSetMyFocus: Boolean; override;
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure NotifyUserTypeSet; override;
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   function GetIsMainObjectForm: Boolean; override;
   {$IfEnd} // NOT Defined(NoVCM)
  public
   {$If Defined(nsTest)}
   property NeedShowIntranetWarningHack: Boolean
    read f_NeedShowIntranetWarningHack
    write f_NeedShowIntranetWarningHack;
    {* ��� ��� �������� ��������� ��� ������ }
   {$IfEnd} // Defined(nsTest)
 end;//TExTextForm

var g_GoToIntranetMessage: THandle = 0;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , DocumentUserTypes_dftRelatedDoc_UserType
 , DocumentUserTypes_dftAnnotation_UserType
 , DocumentUserTypes_dftRelatedSynchroView_UserType
 , DocumentUserTypes_dftDictSubEntry_UserType
 , DocumentUserTypes_dftConsultation_UserType
 , DocumentUserTypes_dftTranslation_UserType
 , DocumentUserTypes_dftChronology_UserType
 , DocumentUserTypes_dftAutoreferatAfterSearch_UserType
 , DocumentUserTypes_dftTips_UserType
 , DocumentUserTypes_dftAutoreferat_UserType
 , DocumentUserTypes_dftMedicFirmSynchroView_UserType
 , DocumentUserTypes_dftDrugSynchroView_UserType
 , DocumentUserTypes_dftDocSynchroView_UserType
 , DocumentUserTypes_dftAnnotationSynchroView_UserType
 , DocumentUserTypes_dftNone_UserType
 , DocumentUserTypes_dftDocument_UserType
 , DocumentUserTypes_dftAACLeft_UserType
 , DocumentUserTypes_dftAACRight_UserType
 , DocumentUserTypes_dftAACContentsLeft_UserType
 , DocumentUserTypes_dftAACContentsRight_UserType
 , DocumentUserTypes_dftDrug_UserType
 , DocumentUserTypes_dftDictEntry_UserType
 , DocumentUserTypes_dftMedDictEntry_UserType
 , DocumentUserTypes_dftMedicFirm_UserType
 , evSubWaiter
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmBase
 {$IfEnd} // NOT Defined(NoVCM)
 , ConsultingUnit
 , DataAdapter
 {$If NOT Defined(NoVCM)}
 , vcmGUI
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmForm
 {$IfEnd} // NOT Defined(NoVCM)
 , nsConst
 , nsExternalObjectPrim
 , nsValueMaps
 , nsValueMapsIDs
 , bsChangeRedationWorker
 , eeEditorExport
 , l3Bits
 , l3Chars
 , l3String
 , evTypes
 {$If Defined(k2ForEditor)}
 , evParaTools
 {$IfEnd} // Defined(k2ForEditor)
 , BaseTreeSupportUnit
 , FoldersUnit
 , BaseTypesUnit
 , nsDocumentTools
 {$If Defined(Nemesis)}
 , eePara
 {$IfEnd} // Defined(Nemesis)
 , eeInterfacesEx
 {$If Defined(Nemesis)}
 , eeParaTools
 {$IfEnd} // Defined(Nemesis)
 , F1Like_InternalOperations_Controls
 , nsSwitchVersionCommentsEvent
 , nsTextTabActivateEvent
 , nsUseDocumentSubPanelOperationEvent
 {$If NOT Defined(NoVCM)}
 , vcmUtils
 {$IfEnd} // NOT Defined(NoVCM)
 , StartUnit
 , evCustomEditor
 , FoldersDomainInterfaces
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , deSimpleTree
 , F1TagDataProviderInterface
 , Graphics
 , WarningConst
 , ControlStatusUtils
 , resWarnImages
 , bsDocumentMissingMessage
 , bsUtils
 , nsInternalPictureData
 , BitmapPara_Const
 , Base_Operations_AAC_Controls
 , AACTextContainerPrim_Form
 , k2Const
 , evEditorWithOperations
 , eeEditor
 , nevRangeList
 , nevRangeListTools
 , evMultiSelectionBlock
 {$If NOT Defined(NoVGScene)}
 , vgRemindersLineManager
 {$IfEnd} // NOT Defined(NoVGScene)
 , nsTabbedInterfaceTypes
 , nscDocumentHistory
 , evSubPn
 , l3MessageID
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts)}
 , ExTextFormWordsPack
 {$IfEnd} // NOT Defined(NoScripts)
 , nsTrialSupport
 , bsDocumentContextSearcher
 , afwFacade
 , Printers
 , l3Stream
 , l3Base
 , l3Types
 , Classes
 , SysUtils
 , nsUtils
 , nsToMSWordOp
 , afwSettingsChangePublisher
 {$If NOT Defined(NoVCM)}
 , vcmMessagesSupport
 {$IfEnd} // NOT Defined(NoVCM)
 , nsExportToFileEvent
 , nsExportToWordEvent
 , nsSendDocumentByEMailEvent
 , nsDocumentPrintPreviewEvent
 , nsBaseTextOperationsConst
 , f1MultilinkResolver
 , nsQuestions
 , nsExternalObjectModelPart
 , l3DialogService
 , evdBlockNameAdder
 , nsSearchInDocumentEvent
 , nsSearchInDocumentDoneEvent
 , nsSearchInDocumentNextEvent
 , nsSearchInDocumentPrevEvent
 , nsSearchWindowManager
 , l3InterfacesMisc
 , nsBaseSearchService
 , nsManagers
 , LoggingUnit
 , bsConvert
 , nsTimeMachineOffEvent
 , nsHyperLinkProcessor
 , deDocInfo
 , nsOpenUtils
 , nsTabbedContainerUtils
 {$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
 , vcmTabbedContainerFormDispatcher
 {$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)
 , nsHyperlinkProcessorTypes
 , DocumentRes
 , vtUtils
 , evdStyles
 , k2Tags
 , evOp
 , DynamicTreeUnit
 , ExternalObjectUnit
 , nsDocumentFromListNavigationEvent
 {$If Defined(Nemesis)}
 , nscStatusBarItemDef
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscStatusBarOperationDef
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscStatusBarDelimiterDef
 {$IfEnd} // Defined(Nemesis)
 , DocumentUtil
 {$If Defined(Nemesis)}
 , nscStatusBarOperationDefsList
 {$IfEnd} // Defined(Nemesis)
 , Common_FormDefinitions_Controls
 , evConstStringData
 , evdHyperlinkInfo
 , nsHyperlinkToDocumentProducerConst
 , nsFolders
 , nsTagNodeTools
 , ParaList_Const
 , LeafPara_Const
 , Block_Const
 , LeafParaDecorationsHolder_Const
 , CommentPara_Const
 , evSubImplementation
 , Document_Const
;

type
 // ExcludeForChildDocuments

 // ExcludeSaveToFolder

 // ExcludeInpharmSynchro

 // ExcludeLoadFromFolder

 // ExcludeEditOperations

 // ExcludeForConsultation

 // ExcludeFindContextForInpharm

 // IncludeForLegalDocumentPrim

 // IncludeForLegalDocument

 // ExcludeUserCommentIconHideShow

 // IncludeForLegalDocumentAndDrug

 // ExcludeRedactionOnID

 // ExcludeGetAttributesFrmAct

 // ExcludeComments

 // ExcludeShowUserComments

 // ExcludeBookmarkIcon

 // ExcludeUserCommentIconDelete

 // IncludeForLegalDocumentAndDrugs

 // IncludeGetGraphicImage

 // ExcludeInsertHyperlink

 // IncludeDocumentSynchroOpen

 // IncludeDictListOpenFrmAct

 // ExcludeGotoBookmark

 // IncludeAddBookmarkFromContents

 // ExcludeAddBookmark

 // IncludeLiteratureListForDictionary

 // ExcludeShowCommentsGroup

 // ExcludeCompareEditions

 // ExcludeBookmarkOperations

 // ExcludeOpenNewWindow

 // IncludeOpenProducedDrugList

 // IncludeOpenSimilarDrugList

 // ExcludeForAACContents

 // BaseSearchPresentationForAACLeft

 TnsDocumentPointWaiter = class(TevSubWaiter)
  {* ����� ��� �������� �������� �� ��������� ����� ��������� }
  private
   f_Pos: TbsDocPos;
   f_Form: TExTextForm;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   function TrySelectPara(const aContainer: InevDocumentContainer;
    const aSel: InevSelection;
    aParaID: Integer): Boolean; override;
   function TrySelectSub(const aContainer: InevDocumentContainer;
    const aSel: InevSelection;
    aSubID: Integer;
    aType: Integer): Boolean; override;
  public
   constructor Create(aForm: TExTextForm;
    const aPos: TbsDocPos); reintroduce;
   class function Make(aForm: TExTextForm;
    const aPos: TbsDocPos): InevWaiter; reintroduce;
 end;//TnsDocumentPointWaiter

constructor TnsDocumentPointWaiter.Create(aForm: TExTextForm;
 const aPos: TbsDocPos);
//#UC START# *4C0669610060_4C066918002D_var*
//#UC END# *4C0669610060_4C066918002D_var*
begin
//#UC START# *4C0669610060_4C066918002D_impl*
 inherited Create(aForm.Text, aPos.rPos, DocPosTypeToEdtSubType(aPos.rRefType));
 f_Pos := aPos;
 f_Form := aForm;
//#UC END# *4C0669610060_4C066918002D_impl*
end;//TnsDocumentPointWaiter.Create

class function TnsDocumentPointWaiter.Make(aForm: TExTextForm;
 const aPos: TbsDocPos): InevWaiter;
var
 l_Inst : TnsDocumentPointWaiter;
begin
 l_Inst := Create(aForm, aPos);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TnsDocumentPointWaiter.Make

procedure TnsDocumentPointWaiter.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_4C066918002D_var*
//#UC END# *479731C50290_4C066918002D_var*
begin
//#UC START# *479731C50290_4C066918002D_impl*
 Finalize(f_Pos);
 f_Form := nil;
 inherited;
//#UC END# *479731C50290_4C066918002D_impl*
end;//TnsDocumentPointWaiter.Cleanup

function TnsDocumentPointWaiter.TrySelectPara(const aContainer: InevDocumentContainer;
 const aSel: InevSelection;
 aParaID: Integer): Boolean;
//#UC START# *4BFFA0FF01D2_4C066918002D_var*
var
 l_Para      : InevPara;
 l_View      : InevView;
 l_Block     : Tl3Variant;
 l_Doc       : Tl3Variant;
 l_Part      : IevDocumentPart;
 l_Obj       : InevObject;
 l_Fmt       : TnevFormatInfoPrim;
 l_Addr      : TevAddress;
 l_BlockObj  : InevObject;
 l_SubHandle : Integer;
//#UC END# *4BFFA0FF01D2_4C066918002D_var*
begin
//#UC START# *4BFFA0FF01D2_4C066918002D_impl*
 Result := inherited TrySelectPara(aContainer, aSel, aParaID);
 try
  if not Result then
  begin
   //http://mdp.garant.ru/pages/viewpage.action?pageId=420416039
   if ((f_Form.Text.AACLike = nev_aacLeft) and ((f_Pos.rRefType <> dptPara)
    or ((f_Pos.rRefType = dptSub) and (f_Pos.rPos <> 0)))) then
   begin
    f_Form.Text.Try2GoByHyperlinkUnderCursor;
    Exit;
   end // if Text.AACLike = nev_aacLeft then
   else
   // "�������� �������������" - ������� � �������� ������ � ����� �����
   // �� ����������� � ������ ����� ���������
   // http://mdp.garant.ru/pages/viewpage.action?pageId=420416039
   if ((f_Form.Text.AACLike = nev_aacLeft) and (f_Pos.rRefType = dptPara)) and
      f_Form.AAC.Right.HasDoc then
   begin
    // ������ �������� � ������ �����
    if f_Form.AAC.Right.Container.FindObjByID(f_Pos.rPos, l_Obj) then
    try
     if Supports(l_Obj, InevPara, l_Para) then
     try
      l_SubHandle := l_Para.AsObject.rAtomEx([k2_tiSubs, k2_tiChildren, k2_tiHandle, Ord(ev_sbtSub),
       k2_tiChildren, k2_tiByIndex, 0]).IntA[k2_tiHandle];
      if (l_SubHandle <= 0) then
       if evInPara(l_Para.AsObject, k2_typBlock, l_Block) then
       begin
        l_SubHandle := l_Block.IntA[k2_tiHandle];
        l_Block.BoolA[k2_tiCollapsed] := False;
       end; // if evInPara(l_Para.AsObject, k2_typBlock, l_Block) then
      if (l_SubHandle > 0) then
      begin
       l_Addr := TevAddress_C(-1, l_SubHandle);
       if (f_Form.Text.SearchHyperLinkAddress(true, true, l_Addr)) then
        Exit;
      end;//if (l_SubHandle > 0) then
     finally
      l_Para := nil;
     end;//try..finally
    finally
     l_Obj := nil;
    end;//try..finally
   end;// if ((f_Form.Text.AACLike = nev_aacLeft) and (f_Pos.rRefType = dptPara))
   if (f_Pos.rPara <> nil) then
   // - http://mdp.garant.ru/pages/viewpage.action?pageId=217157085
   begin
    Result := true;
    // - ����� �����������
    if f_Form.GotoSub(f_Pos.rPara) then
     Exit;
    if (f_Pos.rPara <> nil) then
     begin
      if f_Pos.rPara.AsObject.QT(InevPara, l_Para) then
       try
        if evInPara(l_Para.AsObject, k2_typBlock, l_Block) AND
           (l_Block.IntA[k2_tiLayerID] = Ord(ev_sbtSub)) then
        begin
         if evInPara(l_Block.AsObject, k2_typDocument, l_Doc) then
         begin
          l_Part := TevDocumentPartImplementation.Make(l_Doc,
                                                       nil,
                                                       l_Block.IntA[k2_tiHandle],
                                                       l_Block.IntA[k2_tiLayerID]);
          try
           if f_Form.GotoBlock(l_Part) then
            Exit;
          finally
           l_Part := nil;
          end;//try..finally
         end;//evInPara(l_Block, k2_typDocument, l_Doc)
        end;//evInPara(l_Para, k2_typBlock, l_Block)
       finally
        l_Para := nil;
       end;//f_Pos.rPara <> nil
     end;//try..finally
    Result := false;
   end;//f_Pos.rPara <> nil
  end;//not Result
 finally
  if Result then
  // - ����� ���� ����� �������� �����������, ���� ��������� �� �����
  // http://mdp.garant.ru/pages/viewpage.action?pageId=236718088
  begin
   if (f_Form <> nil) then
   begin
    with f_Form.Text do
    begin
     if TextSource.DocumentContainer.FindObjByID(aParaID, l_Obj) then
     begin
      if (l_Obj <> nil) then
      begin
       l_Fmt := View.FormatInfoByPara(l_Obj);
       if (l_Fmt <> nil) AND l_Fmt.IsHidden(true, true) then
       begin
        if not l_Obj.AsObject.QT(InevPara, l_Para) then
         Assert(false);
        if l_Para.IsLegalComment then
        begin
         if l_Para.IsComment then
          ShowComments := True
         else
         begin
          {$IfDef evNeedCollapsedVersionComments}
          View.IsObjectCollapsed[l_Para] := false;
          {$Else evNeedCollapsedVersionComments}
          ShowVersionComments := True;
          {$EndIf evNeedCollapsedVersionComments}
         end;//l_Para.IsComment
         InevSelection(Selection).SelectPoint(l_Para.MakePoint, true);
        end;//l_Para.IsLegalComment
       end;//l_Obj.IsHidden(aView.Metrics, aView.FormatInfoByPara(l_Obj), true)
      end;//l_Obj <> nil
     end;//TextSource.DocumentContainer.FindObjByID(aParaID, l_Obj)
    end;//with f_Form.Text
   end;//f_Form <> nil
  end;//Result
 end;//try..finally
//#UC END# *4BFFA0FF01D2_4C066918002D_impl*
end;//TnsDocumentPointWaiter.TrySelectPara

function TnsDocumentPointWaiter.TrySelectSub(const aContainer: InevDocumentContainer;
 const aSel: InevSelection;
 aSubID: Integer;
 aType: Integer): Boolean;
//#UC START# *5715DB6E02FC_4C066918002D_var*
var
 l_Sub      : IevSub;
 l_Para     : Tl3Variant;
 l_Addr     : TevAddress;
 l_Block    : Tl3Variant;
 l_SubHandle: Integer;
//#UC END# *5715DB6E02FC_4C066918002D_var*
begin
//#UC START# *5715DB6E02FC_4C066918002D_impl*
 Result := inherited TrySelectSub(aContainer, aSel, aSubID, aType);
 if not Result and (f_Form.AAC <> nil) and (f_Form.AAC.Right <> nil) and f_Form.AAC.Right.HasDoc then
 begin
  l_Sub := f_Form.AAC.Right.Container.SubList.SubEx[aSubID, aType];
  if (l_Sub <> nil) and l_Sub.Exists then
  begin
   l_Para := l_Sub.Para;
   l_SubHandle := 0;
   if evInBlock(l_Para, ev_bvkRight, l_Block) then
   begin
    l_SubHandle := l_Block.IntA[k2_tiHandle];
    l_Block.BoolA[k2_tiCollapsed] := False;
   end; // if evInPara(l_Para.AsObject, k2_typBlock, l_Block) then
   if (l_SubHandle > 0) then
   begin
    l_Addr := TevAddress_C(-1, l_SubHandle);
    f_Form.Text.SearchHyperLinkAddress(true, true, l_Addr);
   end; // if (l_SubHandle > 0) then
  end; // if (l_Sub <> nil) and l_Sub.Exists then
 end; // if not Result then
//#UC END# *5715DB6E02FC_4C066918002D_impl*
end;//TnsDocumentPointWaiter.TrySelectSub

constructor TExTextFormState.Create(const aInnerState: IvcmBase;
 aNeedShowUserComments: Boolean;
 aNeedShowComments: Boolean;
 aNeedShowVersionComments: Boolean;
 aEeSubIdForTypedCorrespondentList: Integer);
//#UC START# *56558B510110_56558AAF003B_var*
//#UC END# *56558B510110_56558AAF003B_var*
begin
//#UC START# *56558B510110_56558AAF003B_impl*
 inherited Create;
 f_InnerState := aInnerState;
 f_NeedShowUserComments := aNeedShowUserComments;
 f_NeedShowComments := aNeedShowComments;
 f_NeedShowVersionComments := aNeedShowVersionComments;
 f_eeSubIdForTypedCorrespondentList := aEeSubIdForTypedCorrespondentList;
//#UC END# *56558B510110_56558AAF003B_impl*
end;//TExTextFormState.Create

class function TExTextFormState.Make(const aInnerState: IvcmBase;
 aNeedShowUserComments: Boolean;
 aNeedShowComments: Boolean;
 aNeedShowVersionComments: Boolean;
 aEeSubIdForTypedCorrespondentList: Integer): IExTextFormState;
var
 l_Inst : TExTextFormState;
begin
 l_Inst := Create(aInnerState, aNeedShowUserComments, aNeedShowComments, aNeedShowVersionComments, aEeSubIdForTypedCorrespondentList);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TExTextFormState.Make

function TExTextFormState.pm_GetInnerState: IvcmBase;
//#UC START# *56558A84014E_56558AAF003Bget_var*
//#UC END# *56558A84014E_56558AAF003Bget_var*
begin
//#UC START# *56558A84014E_56558AAF003Bget_impl*
 Result := f_InnerState;
//#UC END# *56558A84014E_56558AAF003Bget_impl*
end;//TExTextFormState.pm_GetInnerState

function TExTextFormState.pm_GetNeedShowUserComments: Boolean;
//#UC START# *56558A99000A_56558AAF003Bget_var*
//#UC END# *56558A99000A_56558AAF003Bget_var*
begin
//#UC START# *56558A99000A_56558AAF003Bget_impl*
 Result := f_NeedShowUserComments;
//#UC END# *56558A99000A_56558AAF003Bget_impl*
end;//TExTextFormState.pm_GetNeedShowUserComments

function TExTextFormState.Get_eeSubIdForTypedCorrespondentList: Integer;
//#UC START# *5656B27E015A_56558AAF003Bget_var*
//#UC END# *5656B27E015A_56558AAF003Bget_var*
begin
//#UC START# *5656B27E015A_56558AAF003Bget_impl*
 Result := f_eeSubIdForTypedCorrespondentList;
//#UC END# *5656B27E015A_56558AAF003Bget_impl*
end;//TExTextFormState.Get_eeSubIdForTypedCorrespondentList

function TExTextFormState.pm_GetNeedShowComments: Boolean;
//#UC START# *565C49D7029F_56558AAF003Bget_var*
//#UC END# *565C49D7029F_56558AAF003Bget_var*
begin
//#UC START# *565C49D7029F_56558AAF003Bget_impl*
 Result := f_NeedShowComments;
//#UC END# *565C49D7029F_56558AAF003Bget_impl*
end;//TExTextFormState.pm_GetNeedShowComments

function TExTextFormState.pm_GetNeedShowVersionComments: Boolean;
//#UC START# *565C49E9039D_56558AAF003Bget_var*
//#UC END# *565C49E9039D_56558AAF003Bget_var*
begin
//#UC START# *565C49E9039D_56558AAF003Bget_impl*
 Result := f_NeedShowVersionComments;
//#UC END# *565C49E9039D_56558AAF003Bget_impl*
end;//TExTextFormState.pm_GetNeedShowVersionComments

procedure TExTextFormState.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_56558AAF003B_var*
//#UC END# *479731C50290_56558AAF003B_var*
begin
//#UC START# *479731C50290_56558AAF003B_impl*
 f_InnerState := nil;
 inherited;
//#UC END# *479731C50290_56558AAF003B_impl*
end;//TExTextFormState.Cleanup

function TExTextFormState.QueryInterface(const IID: TGUID;
 out Obj): HResult;
//#UC START# *561145D802BB_56558AAF003B_var*
//#UC END# *561145D802BB_56558AAF003B_var*
begin
//#UC START# *561145D802BB_56558AAF003B_impl*
 // �� ��� ����� � ���������. � ������. � ����� �� �������� ��� ������.
 // - http://mdp.garant.ru/pages/viewpage.action?pageId=612730339
 if (not IsEqualGUID(IID, IExTextFormState)) and (f_InnerState <> nil) then
  Result := f_InnerState.QueryInterface(IID, Obj)
 else
  Result := inherited QueryInterface(IID, Obj);
//#UC END# *561145D802BB_56558AAF003B_impl*
end;//TExTextFormState.QueryInterface

type _Instance_R_ = TExTextForm;

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\Forms\SearcheableText.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\PageControlNotification.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\TurnOnTimeMachine.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\Document\TurnOffTimeMachine.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\WorkWithRedactions.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentPresentation.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkProcessor.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\TextWithComments.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\DocumentUserTypes.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\BlockSelector.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\CommonForTextAndFlashOperations.imp.pas}

{$Include w:\garant6x\implementation\Garant\GbaNemesis\View\HyperlinkOperations.imp.pas}

{$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabCaptionProvider.imp.pas}

{$Include w:\common\components\gui\Garant\VCM\implementation\Visual\ChromeLike\vcmChromeLikeTabIconUpdater.imp.pas}

function TExTextForm.CheckParamForUserType(aUserType: Integer): Boolean;
//#UC START# *4A8EEFED022C_49539DBA029D_var*
//#UC END# *4A8EEFED022C_49539DBA029D_var*
begin
//#UC START# *4A8EEFED022C_49539DBA029D_impl*
 if (aUserType = dftNone) then
  Result := true
 else
 begin
  // � ����� �� � ���� �������� ������ ��� ������?
  // �� ������-�� ����� �� �����...
  Result := (UserType <> dftNone) and
            (aUserType <> dftNone) and
            ((UserType = aUserType) or
             ((UserType in [dftAACLeft]) and
              (aUserType = dftDocument)
             )
            );
 end;
//#UC END# *4A8EEFED022C_49539DBA029D_impl*
end;//TExTextForm.CheckParamForUserType

procedure TExTextForm.DisableOperation(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AED97022A_49539DBA029D_var*
//#UC END# *4C3AED97022A_49539DBA029D_var*
begin
//#UC START# *4C3AED97022A_49539DBA029D_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C3AED97022A_49539DBA029D_impl*
end;//TExTextForm.DisableOperation

procedure TExTextForm.CRToPartTest(const aParams: IvcmTestParamsPrim;
 aCRType: TlstCRType);
 {* ����� ���������� ��� ��� � ����� }
//#UC START# *4C3B036300C4_49539DBA029D_var*
var
 l_Strings : IvcmStrings;
 l_List    : IvcmNodes;
//#UC END# *4C3B036300C4_49539DBA029D_var*
begin
//#UC START# *4C3B036300C4_49539DBA029D_impl*
 with aParams do
 begin
  if (ZoneType = vcm_ztChild) or (UserType in [dftAACRight, dftAACContentsRight]) then
   Op.Flag[vcm_ofEnabled] := False
  else
   aParams.Op.Flag[vcm_ofEnabled] := Assigned(Document) and
                                     Text.HasSelection;
  if Op.Flag[vcm_ofEnabled] and
     Assigned(dsDocument) and
     Assigned(dsDocument.DocInfo) then
  begin
   with DocumentSet do
    case aCRType of
     crtCorrespondents:
      Op.Flag[vcm_ofEnabled] := HasCorrespondents;
     crtRespondents:
      Op.Flag[vcm_ofEnabled] := HasRespondents;
    end;//case aCRType of
   l_Strings := Op.SubItems;
   if Assigned(l_Strings) then
   try
    l_Strings.Clear;
    l_List := Op.SubNodes;
    if (l_List.Count = 0) then
     l_List.Add(DefDataAdapter.CRSimpleListTypeRootNode);
   finally
    l_Strings := nil;
   end;//try..finally
  end;//if Op.Flag[vcm_ofVisible]
 end;//with aParams do
//#UC END# *4C3B036300C4_49539DBA029D_impl*
end;//TExTextForm.CRToPartTest

procedure TExTextForm.CRToPartExecute(const aParams: IvcmExecuteParamsPrim;
 aCRType: TlstCRType);
 {* ����� ���������� ��� ��� � ����� }
//#UC START# *4C3B0399027D_49539DBA029D_var*
//#UC END# *4C3B0399027D_49539DBA029D_var*
begin
//#UC START# *4C3B0399027D_49539DBA029D_impl*
 if (UserType = dftDocument) then
  OpenCRListToPart(aCRType, aParams.CurrentNode);
//#UC END# *4C3B0399027D_49539DBA029D_impl*
end;//TExTextForm.CRToPartExecute

procedure TExTextForm.TurnOnTimeMachine(const aDate: Il3CString);
 {* �������� ������ ������� �� ���� }
//#UC START# *4C3B040002CA_49539DBA029D_var*
var
 l_Date: BaseTypesUnit.TDate;
//#UC END# *4C3B040002CA_49539DBA029D_var*
begin
//#UC START# *4C3B040002CA_49539DBA029D_impl*
 // ��� ������ � ��������� ���� ���������� ���������� ��������
 // (TControl.Click), ����������� ��� ��������:
 if l3Same(aDate, DefDataAdapter.TimeMachine.DateStr) then
  Exit;
 // ��������� �������� �� ����
 try
  DecodeDate(nsStrToDate(aDate),
             l_Date.rYear, l_Date.rMonth, l_Date.rDay);
 except
  on EConvertError do
  begin
   if not l3CharSetPresent(aDate, cc_Digits) then
    TimeMachineOnOff(True);
   Exit;
  end;//on EConvertError
 end;//try..except
 nsTimeMachineOn(Document, l_Date);
//#UC END# *4C3B040002CA_49539DBA029D_impl*
end;//TExTextForm.TurnOnTimeMachine

procedure TExTextForm.OpenContents(aMode: TnsContentsOpenMode);
//#UC START# *4C3B3D3A0254_49539DBA029D_var*
var
 l_ST : Il3SimpleTree;
 l_SimpleTree : IdeSimpleTree;
 l_Adornments : InsDocumentAdornments;
//#UC END# *4C3B3D3A0254_49539DBA029D_var*
begin
//#UC START# *4C3B3D3A0254_49539DBA029D_impl*
 // �� InClose ���������, ������, ��� �����, ������� ��������� � ���������
 // ����������� �������� ���������� ���� ��������� � ��� ���������� ����������
 // ������, � ���������� ���������� �����, ��� �� ���������. �������� ��� �����
 // ���������� �� �������� ������ � ���������� �� ����� ������������ �� ������
 // vcmFormSetFactory:
 if not (Self.as_IvcmEntityForm).InClose and (DocumentWithContents <> nil) then
 begin
  l_ST := FiltrateTOCTree(Text.TextSource.ContentsTree);
  try
   if (l_ST <> nil) then
    if (l_ST.CountView = 0) then
     l_ST := nil;
   Supports(Text.TextSource.DocumentContainer, InsDocumentAdornments, l_Adornments);
   try
    l_SimpleTree := TdeSimpleTree.Make(l_ST, l_Adornments);
    try
     if not l_SimpleTree.Empty then
      DocumentWithContents.OpenContents(l_SimpleTree, aMode, Text.TextSource.DocumentContainer);
    finally
     l_SimpleTree := nil;
    end;//try..finally
   finally
    l_Adornments := nil;
   end;//try..finally
  finally
   l_ST := nil;
  end;//try..finally
 end;//not (Self.as_IvcmEntityForm).InClose and (DocumentWithContents <> nil)
//#UC END# *4C3B3D3A0254_49539DBA029D_impl*
end;//TExTextForm.OpenContents

function TExTextForm.FiltrateTOCTree(const aTOC: Il3SimpleTree;
 NeedFiltrate: Boolean = True): Il3SimpleTree;
//#UC START# *4C3B3E270109_49539DBA029D_var*
(*var
 l_FilterableTree: Il3FilterableTree;
 l_Dummy: Integer;*)
//#UC END# *4C3B3E270109_49539DBA029D_var*
begin
//#UC START# *4C3B3E270109_49539DBA029D_impl*
{ if NeedFiltrate and Supports(aTOC, Il3FilterableTree, l_FilterableTree) then
  Result := l_FilterableTree.MakeFiltered(l_FilterableTree.CloneFilters, nil, l_Dummy)
 else}
  Result := aTOC;
//#UC END# *4C3B3E270109_49539DBA029D_impl*
end;//TExTextForm.FiltrateTOCTree

procedure TExTextForm.ShowWarningPage(SwitchActivity: Boolean;
 anOffset: TnsWarningSub = DocumentAndListInterfaces.cNoneWarningSub);
//#UC START# *4C3B4CCF0068_49539DBA029D_var*

 function lp_NeedOpen: Boolean;
 begin
  if FormIsMainInDocumentSet and Assigned(dsDocument) then
  begin
   if SwitchActivity then
    Result := not Op_Warning_SwitchActive.Call(Aggregate, anOffset)
   else
    Result := not Op_Warning_BecomeActive.Call(Aggregate, anOffset);
   // http://mdp.garant.ru/pages/viewpage.action?pageId=260447845&focusedCommentId=271192159#comment-271192159
   // - ��������� ��� ������ ���������, �� �������� ������� � �� ��������,
   //   ����� ����� ������� ���� � ������. 
  end//FormIsMainInDocumentSet and Assigned(dsDocument)
  else
   Result := false;
 end;//lp_NeedOpen

//#UC END# *4C3B4CCF0068_49539DBA029D_var*
begin
//#UC START# *4C3B4CCF0068_49539DBA029D_impl*
 if (DocumentSet <> nil) AND lp_NeedOpen then
  DocumentSet.OpenWarning;
//#UC END# *4C3B4CCF0068_49539DBA029D_impl*
end;//TExTextForm.ShowWarningPage

function TExTextForm.GetVisibleBookmarksCount(const aBookmarks: IeeSubList): Integer;
//#UC START# *4C3EC2DE00A4_49539DBA029D_var*
var
 I: Integer;
//#UC END# *4C3EC2DE00A4_49539DBA029D_var*
begin
//#UC START# *4C3EC2DE00A4_49539DBA029D_impl*
 Result := 0;
 if Assigned(aBookmarks) then
  for I := 0 to Pred(aBookmarks.Count) do
   if aBookmarks.Subs[I].Flags and ev_sfOwn = ev_sfOwn then
    Inc(Result);
//#UC END# *4C3EC2DE00A4_49539DBA029D_impl*
end;//TExTextForm.GetVisibleBookmarksCount

function TExTextForm.GetVisibleBookmark(const aBookmarks: IeeSubList;
 anIndex: Integer = 0): IeeSub;
//#UC START# *4C3EC308025F_49539DBA029D_var*
var
 CurIndex,
 I: Integer;
//#UC END# *4C3EC308025F_49539DBA029D_var*
begin
//#UC START# *4C3EC308025F_49539DBA029D_impl*
 Result := nil;
 CurIndex := 0;
 if Assigned(aBookmarks) then
  for I := 0 to Pred(aBookmarks.Count) do
   if aBookmarks.Subs[I].Flags and ev_sfOwn = ev_sfOwn then
   begin
    if CurIndex = anIndex then
    begin
     Result := aBookmarks.Subs[I];
     break;
    end;
    Inc(CurIndex);
   end;
//#UC END# *4C3EC308025F_49539DBA029D_impl*
end;//TExTextForm.GetVisibleBookmark

procedure TExTextForm.EditBookmark(anID: Integer);
//#UC START# *4C3EC3570265_49539DBA029D_var*
var
 l_FoldersNode : IFoldersNode;
 l_Entity      : IvcmEntity;
//#UC END# *4C3EC3570265_49539DBA029D_var*
begin
//#UC START# *4C3EC3570265_49539DBA029D_impl*
 if nsFindBookmarkForEditInFolders(anID, l_FoldersNode, l_Entity, true, Text.TextSource.DocumentContainer) then
  try
   Op_FoldersControl_EditElement.Call(l_Entity, l_FoldersNode);
  finally
   l_Entity := nil;
   l_FoldersNode := nil;
  end//try..finally
 else
  Say(war_EditMissingBookmark);
//#UC END# *4C3EC3570265_49539DBA029D_impl*
end;//TExTextForm.EditBookmark

function TExTextForm.NeedShowIntranetWarning: Boolean;
//#UC START# *4C40039C03CD_49539DBA029D_var*
//#UC END# *4C40039C03CD_49539DBA029D_var*
begin
//#UC START# *4C40039C03CD_49539DBA029D_impl*
 {$IfDef nsTest}
 if NeedShowIntranetWarningHack then
  Result := Assigned(Document)
 else
 {$EndIf nsTest}
  Result := defDataAdapter.RevisionCheckEnabled and
            Assigned(Document) and
            {Document.GetNewRevisionAvailable}
            (Document.GetChangeStatus <> 0)
            ;
//#UC END# *4C40039C03CD_49539DBA029D_impl*
end;//TExTextForm.NeedShowIntranetWarning

procedure TExTextForm.GoToIntranet;
//#UC START# *4C4003D00232_49539DBA029D_var*
//#UC END# *4C4003D00232_49539DBA029D_var*
begin
//#UC START# *4C4003D00232_49539DBA029D_impl*
 f_InGoToInternet := True;
 try
  f_NeedAnnoingCheck := False; // http://mdp.garant.ru/pages/viewpage.action?pageId=352453000
  Case MessageDlg(str_InActualDocumentAction,
                  [BsControlStatusHint(Document.GetChangeStatus, true)]) of
   -1:
    GoToIntranetPrim(true);
   -2, mrCancel : // mrCancel - ��� ��������� �������� ���� (�� Esc)
    // - ������ �� ������
    ;
   else
    Assert(false);
  end;//Case MessageDlg(str_InActualDocumentAction..
 finally
  f_InGoToInternet := False;
 end;
//#UC END# *4C4003D00232_49539DBA029D_impl*
end;//TExTextForm.GoToIntranet

procedure TExTextForm.CheckForcedQueryForIntranet;
//#UC START# *4C40042A0193_49539DBA029D_var*
//#UC END# *4C40042A0193_49539DBA029D_var*
begin
//#UC START# *4C40042A0193_49539DBA029D_impl*
 {$IfDef nsTest}
 if not NeedShowIntranetWarningHack then
 {$EndIf nsTest}
  if f_NeedAnnoingCheck and NeedShowIntranetWarning then
  begin
   f_NeedAnnoingCheck := False;
   PostMessage(Handle, g_GoToIntranetMessage, 0, 0);
  end;//f_NeedAnnoingCheck and NeedShowIntranetWarning
//#UC END# *4C40042A0193_49539DBA029D_impl*
end;//TExTextForm.CheckForcedQueryForIntranet

procedure TExTextForm.DoFindInDict;
//#UC START# *4C80FB6E0249_49539DBA029D_var*

 function DeleteEndlines(const S: Il3CString): Il3CString;
 begin//DeleteEndlines
  Result := S;
  l3Replace(Result, [#$D], cc_HardSpace);
  l3DeleteChars(Result, [#$A]);
 end;//DeleteEndlines

var
 l_Str : Il3CString;
 l_Range: InevRange;
 l_Pt: InevBasePoint;
//#UC END# *4C80FB6E0249_49539DBA029D_var*
begin
//#UC START# *4C80FB6E0249_49539DBA029D_impl*
 if (ViewArea <> nil) AND defDataAdapter.IsExplanatoryExists then
 begin
  if (Text.HasSelection) then
   l_Range := InevSelection(Text.Selection).GetBlock
  else
  begin
   l_Pt := Text.Selection.Cursor.ClonePoint(Text.View);
   l_Range := l_Pt.Obj.Range;
   l_Range.Select(Text.View, l_Pt, ev_stWord);
  end;
  if not l_Range.Collapsed(Text.View) then
   l_Str := DeleteEndlines(l3Trim(evAsString(l_Range.Data)))
  else
   l_Str := nil;
  TdmStdRes.OpenTermByContext(l_Str, ViewArea.Language);
 end;//ViewArea <> nil
//#UC END# *4C80FB6E0249_49539DBA029D_impl*
end;//TExTextForm.DoFindInDict

procedure TExTextForm.RequiestCheckForcedQueryForInternet;
//#UC START# *4C931477005F_49539DBA029D_var*
//#UC END# *4C931477005F_49539DBA029D_var*
begin
//#UC START# *4C931477005F_49539DBA029D_impl*
 f_NeedAnnoingCheck := not f_InGoToInternet and
                       afw.Application.Settings.LoadBoolean(pi_Document_ForceAskForIntranet,
                                                            dv_Document_ForceAskForIntranet);
//#UC END# *4C931477005F_49539DBA029D_impl*
end;//TExTextForm.RequiestCheckForcedQueryForInternet

procedure TExTextForm.UpdateSubPanelDescription;
//#UC START# *4DF1F81F02DE_49539DBA029D_var*
var
 l_Document : IDocument;
 l_SubDescriptors : TevSubDescriptors;
//#UC END# *4DF1F81F02DE_49539DBA029D_var*
begin
//#UC START# *4DF1F81F02DE_49539DBA029D_impl*
 if (UserType in [dftDocument, dftDrug, dftAACLeft, dftAACContentsRight]) then
  l_SubDescriptors := nsDocumentRes.SubDescriptors
 else
  l_SubDescriptors := nsDocumentRes.LiteSubDescriptors;
 l_Document := Document;
 with Settings, l_SubDescriptors{SubPanel.SubDescriptors} do
 begin
  SubsLayer.Flag5.Visible := (UserType = dftDocument) and
    LoadBoolean(pi_Document_SubPanel_ShowBlocks,
                dv_Document_SubPanel_ShowBlocks) and
    ((l_Document = nil) or (l_Document.GetDocType <> DT_BOOK));
  if (l_SubDescriptors = nsDocumentRes.LiteSubDescriptors) then
  begin
   BookmarksLayer.Flag2.Visible := false;
   MarksLayer.Flag0.Visible := not Text.ShowComments or
                               LoadBoolean(pi_Document_SubPanel_ShowJurorComments,
                                           dv_Document_SubPanel_ShowJurorComments);
   MarksLayer.Flag1.Visible := Op_Contents_HasUserComments.Call(Aggregate) AND
                               (not Text.ShowUserComments or
                               LoadBoolean(pi_Document_SubPanel_ShowUserComments,
                                           dv_Document_SubPanel_ShowUserComments));
   MarksLayer.Flag2.Visible := false;
   SubsLayer.Visible := LoadBoolean(pi_Document_SubPanel_ShowSubNumbers,
                                    dv_Document_SubPanel_ShowSubNumbers);
  end//l_SubDescriptors = nsDocumentRes.LiteSubDescriptors
  else
  begin
   BookmarksLayer.Flag2.Visible := Op_Contents_HasBookmarks.Call(Aggregate) AND
                                   LoadBoolean(pi_Document_SubPanel_ShowBookmarks,
                                               dv_Document_SubPanel_ShowBookmarks);
   MarksLayer.Flag0.Visible := (not Text.ShowComments or
                               LoadBoolean(pi_Document_SubPanel_ShowJurorComments,
                                           dv_Document_SubPanel_ShowJurorComments));
   MarksLayer.Flag1.Visible := Op_Contents_HasUserComments.Call(Aggregate) AND
                               (not Text.ShowUserComments or
                               LoadBoolean(pi_Document_SubPanel_ShowUserComments,
                                           dv_Document_SubPanel_ShowUserComments));
   MarksLayer.Flag2.Visible := {false}not Text.ShowVersionComments or
                                      LoadBoolean(pi_Document_SubPanel_ShowVersionComments,
                                                  dv_Document_SubPanel_ShowVersionComments);
   SubsLayer.Visible := LoadBoolean(pi_Document_SubPanel_ShowSubNumbers,
                                    dv_Document_SubPanel_ShowSubNumbers);
  end;//l_SubDescriptors = nsDocumentRes.LiteSubDescriptors
 end;//with Settings
 if (SubPanel.SubDescriptors <> l_SubDescriptors) then
  SubPanel.SubDescriptors := l_SubDescriptors;
 SubPanel.Visible := not (UserType in [dftAACRight,
                                       dftAACContentsLeft{,
                                       dftAACContentsRight}]);
//#UC END# *4DF1F81F02DE_49539DBA029D_impl*
end;//TExTextForm.UpdateSubPanelDescription

procedure TExTextForm.DoFocusViaMouseSet(aSender: TObject);
//#UC START# *4E7B48CB02C1_49539DBA029D_var*
//#UC END# *4E7B48CB02C1_49539DBA029D_var*
begin
//#UC START# *4E7B48CB02C1_49539DBA029D_impl*
 if Op_Contents_IsContentsVisible.Call(Aggregate) then
  Op_Contents_ToggleContentsVisibility.Call(Aggregate);
//#UC END# *4E7B48CB02C1_49539DBA029D_impl*
end;//TExTextForm.DoFocusViaMouseSet

procedure TExTextForm.InvalidateDataSources;
 {* �������������� ����� �������� ������ � ������������ ����������� ������ }
//#UC START# *4EBA9E0201FC_49539DBA029D_var*
//#UC END# *4EBA9E0201FC_49539DBA029D_var*
begin
//#UC START# *4EBA9E0201FC_49539DBA029D_impl*
 if FormDataChangedInfo.NeedProcess then
 begin
  FormDataChangedInfo.NeedProcess := False;
   // - ����� ��������� � ������, ����� ������ ����� ���� ��������� � ����������
   //   ���������, ��� ���������� ���� ����� ���� �� MakeDocumentContainer;
  if (ViewArea <> nil) then
  begin
   //Assert(false, '� �������� �� �� ����? � ����� �� ��� ������?');
   // - �������� :-(
   // �������� ������ �������:
   if ViewArea.TimeMachineOff then
    DefDataAdapter.TimeMachine.SwitchOff;
   if FormDataChangedInfo.FromHistory then
   begin
    with Text.TextSource do
     // ���� ��������� ������, �� ��������������� ���������:
     if not Assigned(DocumentContainer) or
        not DocumentContainer.IsSame(ViewArea.Container) then
      DocumentContainer := ViewArea.Container;
   end
   else//FormDataChangedInfo.FromHistory
   begin
    with Text do
    begin
     ShowUserComments := True;
     ShowComments := True;
     ShowVersionComments := Settings.LoadBoolean(pi_Document_ShowVersionsComment, dv_Document_ShowVersionsComment);
    end;//with Text
    ChangePositionByDataSource;
   end;//FormDataChangedInfo.FromHistory
   Text.IsStaticText := ViewArea.IsReadOnly;
   Text.PreviewCaleeArea := ViewArea.PreviewCaleeArea;
   CheckControllableState([dcsExitFromSystem]);
   // �������� ��� ������������:
   if (dsConsultation <> nil) then
    CCaption := dsConsultation.DisplayName;
   // ���� ��� ��������� ��������, ����� � ������� �������� ������ ����� c
   // ������������� _DataSource (��� �������� �� ���������, ��. �����
   // sfsOnlyIfDataSourceChanged), ������ ����� ����� ������ �� ������� �����
   // ������������� ������� ������������� �� ������� ��������:
   if FormDataChangedInfo.FromHistory then
    SynchronizeWithRedationsForm;
   UpdateSubPanelDescription;
   RequiestCheckForcedQueryForInternet;
  end;//if (ViewArea <> nil) then
 end;//if FormDataChangedInfo.NeedProcess then
 if Assigned(f_RecallCreateTOCTree) then
  CreateTOC(f_RecallCreateTOCTree);
//#UC END# *4EBA9E0201FC_49539DBA029D_impl*
end;//TExTextForm.InvalidateDataSources

procedure TExTextForm.UpdateTechComment;
//#UC START# *4EBA9FDE0189_49539DBA029D_var*
//#UC END# *4EBA9FDE0189_49539DBA029D_var*
begin
//#UC START# *4EBA9FDE0189_49539DBA029D_impl*
 Text.ShowTechComments := afw.Application.IsInternal and
                          Settings.LoadBoolean(pi_Document_ShowTechComment,
                                               dv_Document_ShowTechComment);
//#UC END# *4EBA9FDE0189_49539DBA029D_impl*
end;//TExTextForm.UpdateTechComment

procedure TExTextForm.LoadFromSettings;
 {* ��������� ��������� � ����� }
//#UC START# *4EBAAEB20259_49539DBA029D_var*
//#UC END# *4EBAAEB20259_49539DBA029D_var*
begin
//#UC START# *4EBAAEB20259_49539DBA029D_impl*
 with Settings do
 begin
  Text.PersistentSelection :=
   LoadBoolean(pi_Document_PermanentSelection, dv_Document_PermanentSelection);
  with Text do
  begin
   ShowDocumentParts := LoadBoolean(pi_Document_ShowBlockBorders,
                                    dv_Document_ShowBlockBorders);
   DrawSpecial := LoadBoolean(pi_Document_ShowSpecial,
                              dv_Document_ShowSpecial);
  end;//with Text do
 end;//with Settings do
 UpdateSubPanelDescription;
 UpdateTechComment;
//#UC END# *4EBAAEB20259_49539DBA029D_impl*
end;//TExTextForm.LoadFromSettings

procedure TExTextForm.ShowSubNumbers;
//#UC START# *4EBAAF2F03D6_49539DBA029D_var*
//#UC END# *4EBAAF2F03D6_49539DBA029D_var*
begin
//#UC START# *4EBAAF2F03D6_49539DBA029D_impl*
 with Settings do
  SaveBoolean(pi_Document_SubPanel_ShowSubNumbers,
              not LoadBoolean(pi_Document_SubPanel_ShowSubNumbers,
                              dv_Document_SubPanel_ShowSubNumbers),
              dv_Document_SubPanel_ShowSubNumbers);
//#UC END# *4EBAAF2F03D6_49539DBA029D_impl*
end;//TExTextForm.ShowSubNumbers

procedure TExTextForm.TextSourceTOCCreated(aSender: TObject;
 const aTOC: Il3SimpleTree);
//#UC START# *4EBAB1080234_49539DBA029D_var*
var
 l_Adornments : InsDocumentAdornments;
//#UC END# *4EBAB1080234_49539DBA029D_var*
begin
//#UC START# *4EBAB1080234_49539DBA029D_impl*
 Supports(Text.TextSource.DocumentContainer, InsDocumentAdornments, l_Adornments);
 try
  CreateTOC(TdeSimpleTree.Make(aTOC, l_Adornments));
 finally
  l_Adornments := nil;
 end;//try..finally
 TdmStdRes.CheckBaseSearchDataReady(NativeMainForm);
//#UC END# *4EBAB1080234_49539DBA029D_impl*
end;//TExTextForm.TextSourceTOCCreated

procedure TExTextForm.TextSourceMakeDocumentContainer(Sender: TObject;
 var aMade: InevDocumentContainer);
//#UC START# *4EBAB3C4024F_49539DBA029D_var*
var
 l_Container : InevDocumentContainer;
//#UC END# *4EBAB3C4024F_49539DBA029D_var*
begin
//#UC START# *4EBAB3C4024F_49539DBA029D_impl*
 if (ViewArea <> nil) then
 begin
  l_Container := ViewArea.Container;
  if (l_Container <> nil) then
  begin
   aMade := l_Container;
   InvalidateDataSources;
   f_DocumentLoaded := True;
  end;//if l_Container <> nil then
 end;//ViewArea <> nil
//#UC END# *4EBAB3C4024F_49539DBA029D_impl*
end;//TExTextForm.TextSourceMakeDocumentContainer

procedure TExTextForm.TextSourceDocumentChanged(aSender: TObject;
 anOldDocument: Tl3Tag;
 aNewDocument: Tl3Tag);
//#UC START# *4EBAB40900C2_49539DBA029D_var*

 function GetDocumentName(const aDocument: IDocument): Il3CString;
 begin
  Result := nsGetDocumentName(aDocument);
 end;

var
 l_Document: IDocument;
 l_DocName: IvcmCString;
//#UC END# *4EBAB40900C2_49539DBA029D_var*
begin
//#UC START# *4EBAB40900C2_49539DBA029D_impl*
 TvgRemindersLineManager.ClosePopupForms;

 TdmStdRes.CheckBaseSearchDataReady(NativeMainForm);
 if (aNewDocument <> nil) and
    l3IOk(aNewDocument.Owner.QueryInterface(IDocument, l_Document)) then
 begin
  UpdateDocumentCaption(l_Document);
  if not (l_Document.GetDocType in [DT_AUTO_REFERAT]) then
   TnscDocumentHistory.Instance.AddDocument(l_Document.GetInternalId);
  if (UserType in [dftAACLeft, dftAACContentsRight]) then
  begin
   l_DocName := MakeCaption(l_Document, False);
   Container.SetTabCaption(l_DocName);
   CCaption := l_DocName;
   TvcmEntityForm(Container.AsForm.VCLWinControl).CCaption := CCaption;
  end;

  if (UserType in [dftAutoreferat, dftAutoreferatAfterSearch, dftAACLeft, dftAACContentsRight]) then
   Dispatcher.UpdateStatus;

  LoadFromSettings;
  ContextChanged(nil);
  CheckLinkedWindows;
 end;//aNewDocument <> nil..
//#UC END# *4EBAB40900C2_49539DBA029D_impl*
end;//TExTextForm.TextSourceDocumentChanged

procedure TExTextForm.OnHistoryState(Sender: TObject;
 var IsLast: Boolean);
//#UC START# *4EBAB68B0050_49539DBA029D_var*
//#UC END# *4EBAB68B0050_49539DBA029D_var*
begin
//#UC START# *4EBAB68B0050_49539DBA029D_impl*
 if (Dispatcher.History <> nil) then
  IsLast := Dispatcher.History.IsLast;
 // - http://mdp.garant.ru/pages/viewpage.action?pageId=565841783
//#UC END# *4EBAB68B0050_49539DBA029D_impl*
end;//TExTextForm.OnHistoryState

procedure TExTextForm.DoSettingsChanged;
 {* ���������� � ������ ���������\������ ��������. }
//#UC START# *4EBABF090101_49539DBA029D_var*
//#UC END# *4EBABF090101_49539DBA029D_var*
begin
//#UC START# *4EBABF090101_49539DBA029D_impl*
 // ����� �������� ������ "��������� ���������", ��� ����� ������������ ���
 // ����������, ���� ������������ �������� ������� �������� ��������� ���������:
 if (UserType in [dftDocument, dftDrug]) then
  OpenContents(ns_comNotForce);
 LoadFromSettings;
//#UC END# *4EBABF090101_49539DBA029D_impl*
end;//TExTextForm.DoSettingsChanged

function TExTextForm.GetCurrentCaption: Il3CString;
//#UC START# *4EBABF3902F7_49539DBA029D_var*
//#UC END# *4EBABF3902F7_49539DBA029D_var*
begin
//#UC START# *4EBABF3902F7_49539DBA029D_impl*
 if (UserType in [dftDictEntry, dftDictSubEntry]) and
   (ViewArea <> nil) then
  Result := bsLanguageCaption(ViewArea.Language)
 else
  Result := nsCStr(CurUserType.Caption);
//#UC END# *4EBABF3902F7_49539DBA029D_impl*
end;//TExTextForm.GetCurrentCaption

function TExTextForm.GetCurrentImage: Integer;
//#UC START# *4EBABF5503AA_49539DBA029D_var*
//#UC END# *4EBABF5503AA_49539DBA029D_var*
begin
//#UC START# *4EBABF5503AA_49539DBA029D_impl*
 if not (UserType in [dftDictEntry, dftDictSubEntry]) then
  Result := CurUserType.ImageIndex
 else
 if (ViewArea <> nil) and Assigned(ViewArea.DocInfo) then
  Result := bsLanguageImage(ViewArea.DocInfo.Language)
 else
  Result := -1;
//#UC END# *4EBABF5503AA_49539DBA029D_impl*
end;//TExTextForm.GetCurrentImage

procedure TExTextForm.CorrespondentsToSubTest(const aParams: IvcmTestParamsPrim);
//#UC START# *4EDF70F902E1_49539DBA029D_var*
var
 l_Root : Il3SimpleNode;
 l_Child : Il3SimpleNode;
 l_Sub: IeeSub;
//#UC END# *4EDF70F902E1_49539DBA029D_var*
begin
//#UC START# *4EDF70F902E1_49539DBA029D_impl*
 with aParams do
 begin
  if (ZoneType = vcm_ztChild) then
   Op.Flag[vcm_ofEnabled] := False
  else
   aParams.Op.Flag[vcm_ofEnabled] := Assigned(Document);
  if Op.Flag[vcm_ofEnabled] and
     Assigned(dsDocument) then
  begin
   l_Sub := ExtractSubFromSubPanel(aParams.Target);
   if Assigned(l_Sub) then
   begin
    l_Root := nsGetFilteredCorrespondentsTypeTree(Text.Document.DocumentContainer.SubList.SubEx[l_Sub.ID, l_Sub.LayerID]);
    if Assigned(l_Root) then
    begin
     if (Op.SubItems <> nil) then
      Op.SubItems.Clear;
     Op.SubNodes.Clear;
     l_Child := l_Root.Child;
     while (l_Child <> nil) do
     begin
      Op.SubNodes.Add(l_Child);
      if l_Child.IsLast then
       break;
      l_Child := l_Child.Next; 
     end;//l_Child <> nil
     Op.SubNodes.ShowRoot := true; 
    end//Assigned(l_Root)
    else
     aParams.Op.Flag[vcm_ofEnabled] := False;
   end//Assigned(l_Sub)
   else
    aParams.Op.Flag[vcm_ofEnabled] := False;
  end//Op.Flag[vcm_ofEnabled]..
  else
   aParams.Op.Flag[vcm_ofEnabled] := False;
 end;//with aParams do
//#UC END# *4EDF70F902E1_49539DBA029D_impl*
end;//TExTextForm.CorrespondentsToSubTest

function TExTextForm.ExtractSubFromSubPanel(const aTarget: IUnknown): IeeSub;
//#UC START# *4EDF72CC0158_49539DBA029D_var*
var
 l_eeSub: IeeSub;
//#UC END# *4EDF72CC0158_49539DBA029D_var*
begin
//#UC START# *4EDF72CC0158_49539DBA029D_impl*
 if Supports(aTarget, IeeSub, l_eeSub) and
    (l_eeSub.LayerID = Ord(ev_sbtSub)) then
  Result := l_eeSub
 else
  Result := nil;
//#UC END# *4EDF72CC0158_49539DBA029D_impl*
end;//TExTextForm.ExtractSubFromSubPanel

procedure TExTextForm.GoToIntranetPrim(aNeedCheck: Boolean);
//#UC START# *4F184AD903C9_49539DBA029D_var*
var
 l_Para: IeePara;
 l_ParaID: LongWord;
//#UC END# *4F184AD903C9_49539DBA029D_var*
begin
//#UC START# *4F184AD903C9_49539DBA029D_impl*
 l_Para := GetTopParaID;
 if Assigned(l_Para) then
  l_Para := eeFindNumberedPara(l_Para, Text as IeeDocumentEx);
 if Assigned(l_Para) then
  l_ParaID := l_Para.ID
 else
  l_ParaID := 0;
 DefDataAdapter.OpenIntranetDocument(Document.GetInternalId, l_ParaID, aNeedCheck);
//#UC END# *4F184AD903C9_49539DBA029D_impl*
end;//TExTextForm.GoToIntranetPrim

procedure TExTextForm.OpenPicture(const aPara: IeePara;
 const aPicture: IeePicture;
 aOpenKind: TvcmMainFormOpenKind = vcmInterfaces.vcm_okInCurrentTab);
//#UC START# *4F6719C001DB_49539DBA029D_var*
var
 l_Cont  : IvcmContainer;
//#UC END# *4F6719C001DB_49539DBA029D_var*
begin
//#UC START# *4F6719C001DB_49539DBA029D_impl*
 if (aPicture <> nil) then
 begin
  l_Cont := nsOpenNewWindowTabbed(NativeMainForm, aOpenKind);
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=530839714
  TdmStdRes.OpenPicture(l_Cont,
                        TnsInternalPictureData.Make(aPara,
                                                    aPicture,
                                                    nsGetDocumentShortName(Document)));
 end;//aPicture <> nil
//#UC END# *4F6719C001DB_49539DBA029D_impl*
end;//TExTextForm.OpenPicture

function TExTextForm.LeafParaUnderCursor: IeePara;
//#UC START# *4F672B0E03A8_49539DBA029D_var*
//#UC END# *4F672B0E03A8_49539DBA029D_var*
begin
//#UC START# *4F672B0E03A8_49539DBA029D_impl*
 if (Text.Selection <> nil) AND
    (Text.Selection.Cursor <> nil) then
  Result := TeePara.Make(Text.Selection.Cursor.MostInner.Obj.AsPara.AsObject, Text)
 else
  Result := nil; 
//#UC END# *4F672B0E03A8_49539DBA029D_impl*
end;//TExTextForm.LeafParaUnderCursor

function TExTextForm.MakePositionList(aCRType: TlstCRType): IPositionList;
var l_PositionList: IPositionList absolute Result;

 procedure CollectParas(const aRange: InevRange);
 var l_WasCorrection: Boolean;

  function DoIt(const anItem: InevRange;
   anIndex: Integer): Boolean;
   {* �������������� ������� ��� ������ Iterate �� CollectParas }

   function CorrectPara(const aPara: InevObject): Boolean;
   //#UC START# *4F981D29027B__var*

    function ParaHasAnySub(const aPara: InevObject): Boolean;
    begin//ParaHasAnySub
     Result := false;
     with aPara.AsObject.rAtomEx([k2_tiSubs, k2_tiChildren, k2_tiHandle, Ord(ev_sbtSub)]) do
      if IsValid then
       if (ChildrenCount > 0) then
        Result := true;
    end;//ParaHasAnySub

    procedure AddBlockToList(aBlock : Tl3Variant);
    var
     l_Pos : DocumentUnit.TPosition;
    begin//AddBlockToList
     l3FillChar(l_Pos, SizeOf(l_Pos));
     l_Pos.rPoint := Cardinal(aBlock.IntA[k2_tiHandle]);
     l_Pos.rType := PT_SUB;
     l_PositionList.Add(l_Pos);
    end;//AddBlockToList

   var
    l_P : InevPara;
    l_Block : Tl3Variant;
   //#UC END# *4F981D29027B__var*
   begin
   //#UC START# *4F981D29027B__impl*
    Result := false;
    if not l_WasCorrection then
    begin
     l_WasCorrection := true;
     if (aCRType = crtCorrespondents) then
     begin
      if ParaHasAnySub(aPara) then
       // - �� ��������� ���� ���� �� ���� Sub - ������ �� ������
       Exit;
      if not aPara.AsObject.QT(InevPara, l_P) then
      begin
       Assert(false);
       Exit;
      end;//not aPara.QT(InevPara, l_P)
      l_P := l_P.Prev;
      while (l_P <> nil) AND l_P.AsObject.IsValid do
      begin
       if not l_P.AsObject.IsKindOf(k2_typCommentPara) then
       // - ������ ���������� ����������� ������������
       begin
        if l_P.AsObject.IsKindOf(k2_typParaList) then
         // - ��� ��������� ���� ������ ��������, ���� �� �� �������
         Exit;
        if not l_P.IsLegalComment then
         // - ��� �� �����������
         if not l3IsNil(l_P.AsObject.PCharLenA[k2_tiText]) then
          // - � ���� �� ������ �����
          Exit;
        if ParaHasAnySub(l_P) then
         AddParaToList(l_P);
        if (l_P.PID = 0) then
        // - ��� ������ ��������
         if evInPara(l_P.AsObject, k2_typBlock, l_Block) then
         // - ���� ��� ����
          AddBlockToList(l_Block);
          // - ��������� ���� � ������
       end;//not l_P.IsKindOf(k2_typCommentPara)
       l_P := l_P.Prev;
      end;//while l_P <> nil..
     end;//aCRType = crtCorrespondents
    end;//l_WasCorrection
   //#UC END# *4F981D29027B__impl*
   end;//CorrectPara


   procedure AddParaToList(const aPara: InevObject);
   //#UC START# *4F98298400DA__var*
   var
    l_Pos : DocumentUnit.TPosition;
   //#UC END# *4F98298400DA__var*
   begin
   //#UC START# *4F98298400DA__impl*
    l3FillChar(l_Pos, SizeOf(l_Pos));
    l_Pos.rPoint := Cardinal(aPara.AsObject.IntA[k2_tiHandle]);
    if (l_Pos.rPoint <> 0) AND (l_Pos.rPoint <> Cardinal(-1)) then
    begin
     l_Pos.rType := PT_PARA;
     l_PositionList.Add(l_Pos);
    end;//l_Pos.rPoint <> 0
   //#UC END# *4F98298400DA__impl*
   end;//AddParaToList

  //#UC START# *4F981D630001__var*
  var
   l_P : PInevObject;
  //#UC END# *4F981D630001__var*
  begin
  //#UC START# *4F981D630001__impl*
   Result := true;
   l_P := anItem.Obj;
   if l_P.AsObject.IsKindOf(k2_typParaList) then
    CollectParas(anItem)
   else
   if l_P.AsObject.IsKindOf(k2_typLeafPara) then
   begin
    if not CorrectPara(l_P^) then
     AddParaToList(l_P^);
   end;//l_P.IsKindOf(k2_typLeafPara)
  //#UC END# *4F981D630001__impl*
  end;//DoIt

 //#UC START# *4F980CDF02C7__var*
 //#UC END# *4F980CDF02C7__var*
 begin
  //#UC START# *4F980CDF02C7iter*
  l_WasCorrection := false;
  aRange.
  //#UC END# *4F980CDF02C7iter*
  IterateF(L2InevRangePrimIterateAction(@DoIt));
 end;//CollectParas

//#UC START# *4F97FB9C0324_49539DBA029D_var*
var
 l_Block: InevRange;
//#UC END# *4F97FB9C0324_49539DBA029D_var*
begin
//#UC START# *4F97FB9C0324_49539DBA029D_impl*
 l_Block := InevSelection(Text.Selection).GetBlock;
 try
  if (l_Block = nil) OR
      l_Block.Solid(Text.View) then // - ������� ����� ��������
   Result := nil
  else
  begin
   Result := defDataAdapter.NativeAdapter.MakePositionList;
   CollectParas(l_Block);
  end;//l_Block = nil..
 finally
  l_Block := nil;
 end;//try..finally
//#UC END# *4F97FB9C0324_49539DBA029D_impl*
end;//TExTextForm.MakePositionList

procedure TExTextForm.SetFocusToText;
//#UC START# *4FF437680128_49539DBA029D_var*
//#UC END# *4FF437680128_49539DBA029D_var*
begin
//#UC START# *4FF437680128_49539DBA029D_impl*
 if Text.CanFocus then
  Text.SetFocus;
//#UC END# *4FF437680128_49539DBA029D_impl*
end;//TExTextForm.SetFocusToText

procedure TExTextForm.SetFocusToTextInAAC;
//#UC START# *4FF4378900EB_49539DBA029D_var*
//#UC END# *4FF4378900EB_49539DBA029D_var*
begin
//#UC START# *4FF4378900EB_49539DBA029D_impl*
 if (UserType = dftAACLeft) OR (UserType = dftAACContentsLeft) then
  SetFocusToText;
//#UC END# *4FF4378900EB_49539DBA029D_impl*
end;//TExTextForm.SetFocusToTextInAAC

function TExTextForm.GetNeedsStatusBarItems: Boolean;
//#UC START# *501013340168_49539DBA029D_var*
//#UC END# *501013340168_49539DBA029D_var*
begin
//#UC START# *501013340168_49539DBA029D_impl*
 Result := UserType in [dftDocument, dftDrug, dftAACLeft, dftAACContentsRight];
//#UC END# *501013340168_49539DBA029D_impl*
end;//TExTextForm.GetNeedsStatusBarItems

function TExTextForm.GetCorrespondentListTest: Boolean;
//#UC START# *50111C6102B7_49539DBA029D_var*
//#UC END# *50111C6102B7_49539DBA029D_var*
begin
//#UC START# *50111C6102B7_49539DBA029D_impl*
//  if (ZoneType = vcm_ztChild) then
//  begin
//   Result := False;
//   Exit;
//  end;    ����������� ����� ExcludeUserType http://mdp.garant.ru/pages/viewpage.action?pageId=379233069&focusedCommentId=379249025#comment-379249025
 Result := False;
 if Assigned(dsDocument) then
  if DocumentIsValid then
   Result := DocumentSet.HasCorrespondents;
//#UC END# *50111C6102B7_49539DBA029D_impl*
end;//TExTextForm.GetCorrespondentListTest

function TExTextForm.GetRespondentListTest: Boolean;
//#UC START# *50111CAC03B5_49539DBA029D_var*
//#UC END# *50111CAC03B5_49539DBA029D_var*
begin
//#UC START# *50111CAC03B5_49539DBA029D_impl*
//  if (ZoneType = vcm_ztChild) then
//  begin
//   Result := False;
//   Exit;
//  end;         ����������� ����� ExcludeUserType http://mdp.garant.ru/pages/viewpage.action?pageId=379233069&focusedCommentId=379249025#comment-379249025
 Result := False;
 if Assigned(dsDocument) then
  if DocumentIsValid then
   Result := DocumentSet.HasRespondents;
//#UC END# *50111CAC03B5_49539DBA029D_impl*
end;//TExTextForm.GetRespondentListTest

function TExTextForm.NeedShowTOC: Boolean;
 {* ����� �� ���������� ���������� }
//#UC START# *502B835801B4_49539DBA029D_var*
//#UC END# *502B835801B4_49539DBA029D_var*
begin
//#UC START# *502B835801B4_49539DBA029D_impl*
 Result := (UserType in [dftDocument, dftDrug, dftAACLeft, dftAACContentsRight]);
//#UC END# *502B835801B4_49539DBA029D_impl*
end;//TExTextForm.NeedShowTOC

procedure TExTextForm.CheckLinkedWindows;
 {* �������������� ��������� ��������� ���� }
//#UC START# *502D3AFC0282_49539DBA029D_var*
var
 l_Addr : TevAddress;
//#UC END# *502D3AFC0282_49539DBA029D_var*
begin
//#UC START# *502D3AFC0282_49539DBA029D_impl*
 if (UserType = dftAACContentsLeft) then
  if Assigned(dsDocument) and
     Assigned(dsDocument.DocInfo) then
  begin
   if (dsDocument.DocInfo.Pos.rRefType = dptSub) then
   begin
    //if not Dispatcher.History.InBF then
    begin
     l_Addr := TevAddress_C(0, dsDocument.DocInfo.Pos.rPos);
     if not Text.SearchHyperLinkAddress(true, true, l_Addr) then
      if (Text.Selection <> nil) then
       //if Text.Selection.Collapsed then
       if Dispatcher.History.InBF then
       begin
        Text.GotoTop;
        //Text.NextHyperlink;
       end;//Dispatcher.History.InBF
     end;//not Dispatcher.History.InBF
   end;//dsDocument.DocInfo.Pos.rRefType = dptSub
  end;//Assigned(dsDocument)
//#UC END# *502D3AFC0282_49539DBA029D_impl*
end;//TExTextForm.CheckLinkedWindows

procedure TExTextForm.DoHyperlinkNavigate(Sender: TObject);
//#UC START# *502D43D50306_49539DBA029D_var*
//#UC END# *502D43D50306_49539DBA029D_var*
begin
//#UC START# *502D43D50306_49539DBA029D_impl*
 if (UserType = dftAACContentsLeft) then
  if (dsDocument <> nil) then
   if not Dispatcher.History.InBF then
    if (Text <> nil) AND Text.HasDocument then
    begin
     Text.OnHyperlinkNavigate := nil;
     try
      Self.OpenHyperlink;
     finally
      Text.OnHyperlinkNavigate := Self.DoHyperlinkNavigate;
     end;//try..finally
    end;//Text <> nil
//#UC END# *502D43D50306_49539DBA029D_impl*
end;//TExTextForm.DoHyperlinkNavigate

procedure TExTextForm.DoTextZOrderChanging(aSender: TObject;
 var aCanChangeZOrder: Boolean);
//#UC START# *527CB40000BD_49539DBA029D_var*
//#UC END# *527CB40000BD_49539DBA029D_var*
begin
//#UC START# *527CB40000BD_49539DBA029D_impl*
 // �������: �� ���� ��������� �������� Z-order ���� ��� ��� ���� ������
 // http://mdp.garant.ru/pages/viewpage.action?pageId=488604061
{ aCanChangeZOrder := ((csLoading in ComponentState) or (csDestroying in ComponentState)) OR
  ((aSender is TControl) and VtFindRemindersOverControl(TControl(aSender))); }
//#UC END# *527CB40000BD_49539DBA029D_impl*
end;//TExTextForm.DoTextZOrderChanging

function TExTextForm.HasVisibleBookmarks(const aBookmarks: IeeSubList): Boolean;
//#UC START# *52876E7B02BC_49539DBA029D_var*
var
 I: Integer;
//#UC END# *52876E7B02BC_49539DBA029D_var*
begin
//#UC START# *52876E7B02BC_49539DBA029D_impl*
 Result := False;
 if Assigned(aBookmarks) then
  for I := 0 to Pred(aBookmarks.Count) do
   if aBookmarks.Subs[I].Flags and ev_sfOwn = ev_sfOwn then
   begin
    Result := True;
    Break;
   end;
//#UC END# *52876E7B02BC_49539DBA029D_impl*
end;//TExTextForm.HasVisibleBookmarks

procedure TExTextForm.ExcludeRootSub(const aParams: IvcmTestParamsPrim);
//#UC START# *5287A5D4007D_49539DBA029D_var*
var
 l_Sub: IeeSub;
//#UC END# *5287A5D4007D_49539DBA029D_var*
begin
//#UC START# *5287A5D4007D_49539DBA029D_impl*
 l_Sub := ExtractSubFromSubPanel(aParams.Target);
 aParams.Op.Flag[vcm_ofEnabled] := Assigned(l_Sub) and (l_Sub.ID <> c_DocumentSubID);
//#UC END# *5287A5D4007D_49539DBA029D_impl*
end;//TExTextForm.ExcludeRootSub

function TExTextForm.MakePositionListBySub(aSubID: Integer): IPositionList;
//#UC START# *5287A6130217_49539DBA029D_var*
var
 l_Pos: DocumentUnit.TPosition;
//#UC END# *5287A6130217_49539DBA029D_var*
begin
//#UC START# *5287A6130217_49539DBA029D_impl*
 Result := defDataAdapter.NativeAdapter.MakePositionList;
 with l_Pos do
 begin
  rType := PT_SUB;
  rPoint := aSubID;
 end;
 Result.Add(l_Pos);
//#UC END# *5287A6130217_49539DBA029D_impl*
end;//TExTextForm.MakePositionListBySub

procedure TExTextForm.CheckIsDocumentSub(const aParams: IvcmTestParamsPrim);
//#UC START# *5287A65300FD_49539DBA029D_var*
var
 l_Sub: IeeSub;
//#UC END# *5287A65300FD_49539DBA029D_var*
begin
//#UC START# *5287A65300FD_49539DBA029D_impl*
 l_Sub := ExtractSubFromSubPanel(aParams.Target);
 aParams.Op.Flag[vcm_ofEnabled] := Assigned(l_Sub) and (l_Sub.ID = c_DocumentSubID)
//#UC END# *5287A65300FD_49539DBA029D_impl*
end;//TExTextForm.CheckIsDocumentSub

function TExTextForm.ExtractRangeFromSubPanel(const aParams: IvcmExecuteParams): InevRange;
//#UC START# *5287A6D60096_49539DBA029D_var*
var
 l_Sub: IeeSub;
//#UC END# *5287A6D60096_49539DBA029D_var*
begin
//#UC START# *5287A6D60096_49539DBA029D_impl*
 l_Sub := ExtractSubFromSubPanel(aParams.Target);
 if Assigned(l_Sub) then
  Result := ExtractRangeFromSub(l_Sub.ID, l_Sub.LayerID)
 else
  Result := nil;
//#UC END# *5287A6D60096_49539DBA029D_impl*
end;//TExTextForm.ExtractRangeFromSubPanel

function TExTextForm.ExtractRangeFromList(const aList: InevFlatSubsList): InevRange;
//#UC START# *4F85B66E0260_49539DBA029D_var*
var
 l_Range: InevRange;
 l_Ranges: TnevRangeList;
 l_IDX: Integer;
//#UC END# *4F85B66E0260_49539DBA029D_var*
begin
//#UC START# *4F85B66E0260_49539DBA029D_impl*
 if (aList.Count = 1) then
  with aList.First do
   Result := ExtractRangeFromSub(ID, LayerID)
 else
 begin
  l_Ranges := TnevRangeList.Make;
  try
   for l_IDX := 0 to aList.Count - 1 do
   begin
    l_Range := ExtractRangeFromSub(aList.Items[l_IDX].ID, aList.Items[l_IDX].LayerID);
    if l_Range <> nil then
     nevAddRangeToList(l_Ranges, l_Range);
   end; // for l_IDX := 0 to aList.Count - 1 do
   Result := TevMultiSelectionBlock.Make(Text.TextSource.Document.AsObject, l_Ranges)
  finally
   FreeAndNil(l_Ranges);
  end;//try..finally
 end;//aList.Count = 1
//#UC END# *4F85B66E0260_49539DBA029D_impl*
end;//TExTextForm.ExtractRangeFromList

function TExTextForm.ExtractRangeFromSub(aID: Integer;
 aLayerID: Integer): InevRange;
//#UC START# *4F85B63D00DE_49539DBA029D_var*
var
 l_Para: InevPara;
//#UC END# *4F85B63D00DE_49539DBA029D_var*
begin
//#UC START# *4F85B63D00DE_49539DBA029D_impl*
 if Text.Document.DocumentContainer.SubList.SubEx[aID, aLayerID].Para.QT(InevPara, l_Para) then
  Result := l_Para.SubRange(Text.View, 0, MaxInt).ParentRange(MaxInt)
 else
  Result := nil;
//#UC END# *4F85B63D00DE_49539DBA029D_impl*
end;//TExTextForm.ExtractRangeFromSub

function TExTextForm.MakeCaption(const aDocument: IDocument;
 aShort: Boolean): Il3CString;
//#UC START# *53BE2C3D0176_49539DBA029D_var*

 function lp_GetDocumentName(const aDoc: IDocument): Il3CString;
 begin
  Result := nsGetDocumentName(aDoc);
 end;//lp_GetDocumentName

 function lp_GetDocumentShortName(const aDoc: IDocument): Il3CString;
 begin
  Result := nsGetDocumentShortName(aDoc);
 end;

//#UC END# *53BE2C3D0176_49539DBA029D_var*
begin
//#UC START# *53BE2C3D0176_49539DBA029D_impl*
 case UserType of
  dftDocument, dftDictEntry, dftTips, dftMedDictEntry, dftMedicFirm:
  begin
   if (not aShort) then
   begin
    if not TdmStdRes.IsCurEditionActual(aDocument) then
     Result := vcmFmt(str_nsRedactionCaption, [lp_GetDocumentName(aDocument)])
    else
     Result := l3Cat(CurUserType.Caption + ' : ', lp_GetDocumentName(aDocument));
   end
   else
    Result := lp_GetDocumentName(aDocument);
    // - http://mdp.garant.ru/pages/viewpage.action?pageId=531971274
  end;//dftDocument..
  dftAutoreferat,
  dftAutoreferatAfterSearch,
  dftDrug:
   if aShort then
   begin
    //http://mdp.garant.ru/pages/viewpage.action?pageId=562605136
    if (UserType in [dftAutoreferatAfterSearch, dftAutoreferat]) then
     Result := lp_GetDocumentShortName(aDocument)
    else
     Result := lp_GetDocumentName(aDocument)
   end
   else
    Result := l3Cat(CurUserType.Caption + ' : ', lp_GetDocumentName(aDocument));
  dftAACLeft,
  dftAACRight,
  dftAACContentsRight:
   if aShort then
    Result := lp_GetDocumentShortName(aDocument)
   else
    Result := l3Cat([str_dftDocumentCaption.AsCStr, vcmCStr(' : '), lp_GetDocumentName(aDocument)]);
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=571639740
 end;//case UserType
//#UC END# *53BE2C3D0176_49539DBA029D_impl*
end;//TExTextForm.MakeCaption

procedure TExTextForm.UpdateDocumentCaption(const aDocument: IDocument);
//#UC START# *53C3A82F01C0_49539DBA029D_var*
var
 l_Caption: Il3CString;
//#UC END# *53C3A82F01C0_49539DBA029D_var*
begin
//#UC START# *53C3A82F01C0_49539DBA029D_impl*
 Assert(aDocument <> nil);
 l_Caption := MakeCaption(aDocument, False);
 try
  f_TabCaption := MakeCaption(aDocument, True);
  if (not l3IsNil(l_Caption)) then
  begin
   CCaption := l_Caption;
   if (UserType in [dftAACLeft, dftAACRight, dftAACContentsRight, dftDictEntry]) then
    UpdateTabCaption(l_Caption);
   // - http://mdp.garant.ru/pages/viewpage.action?pageId=590762358
  end;
 finally
  l_Caption := nil;
 end;
//#UC END# *53C3A82F01C0_49539DBA029D_impl*
end;//TExTextForm.UpdateDocumentCaption

function TExTextForm.IsPictureUnderCursor: Boolean;
//#UC START# *53DF35EA01CE_49539DBA029D_var*
var
 l_EP : IeePara;
//#UC END# *53DF35EA01CE_49539DBA029D_var*
begin
//#UC START# *53DF35EA01CE_49539DBA029D_impl*
 l_EP := LeafParaUnderCursor;
 Result := (l_EP <> nil);
 if Result then
  if not Supports(l_EP, IeePicture) then
   Result := false;
//#UC END# *53DF35EA01CE_49539DBA029D_impl*
end;//TExTextForm.IsPictureUnderCursor

procedure TExTextForm.OpenDocumentInNewContainer(aOpenKind: TvcmMainFormOpenKind);
//#UC START# *55546DEA0384_49539DBA029D_var*
var
 l_NewDocument : IDocument;
 l_Cont        : IvcmContainer;
 l_TopPara     : IeePara;
//#UC END# *55546DEA0384_49539DBA029D_var*
begin
//#UC START# *55546DEA0384_49539DBA029D_impl*
 if (Document <> nil) then
 begin
  l_Cont := nsOpenNewWindowTabbed(NativeMainForm, aOpenKind);
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=560729118
  if (l_Cont <> nil) then
  try
   l_TopPara := GetTopParaID;
   try
    l_NewDocument := defDataAdapter.TimeMachine.CorrectDocumentEdition(Document);
    try
     if (l_TopPara <> nil) then
      TdmStdRes.OpenDocument(TdeDocInfo.Make(l_NewDocument,
                                             TbsDocPos_P(l_TopPara)),
                             l_Cont)
     else
      TdmStdRes.OpenDocument(TdeDocInfo.Make(l_NewDocument), l_Cont);
    finally
     l_NewDocument := nil;
    end;//try..finally
   finally
    l_TopPara := nil;
   end;//try..finally
  finally
   l_Cont := nil;
  end;//try..finally
 end;//Document <> nil
//#UC END# *55546DEA0384_49539DBA029D_impl*
end;//TExTextForm.OpenDocumentInNewContainer

procedure TExTextForm.ChangePositionByDataSource;
 {* �������� ������� � ��������� �� ������ ���������� ��������� ������ }
//#UC START# *49883D6D03A2_49539DBA029D_var*
//#UC END# *49883D6D03A2_49539DBA029D_var*
begin
//#UC START# *49883D6D03A2_49539DBA029D_impl*
 if (ViewArea <> nil) then
 begin
(*  Il3Lock(Text).Lock(Text);
  try*)
  Text.TextSource.DocumentContainer.LinkWaiter(TnsDocumentPointWaiter.Make(Self, ViewArea.DocInfo.Pos));
(*  finally
   Il3Lock(Text).Unlock(Text);
  end;//try..finally*)
 end;//ViewArea <> nil
//#UC END# *49883D6D03A2_49539DBA029D_impl*
end;//TExTextForm.ChangePositionByDataSource

function TExTextForm.OpenCRList(aKind: TlstCRType;
 const aType: Il3SimpleNode;
 ReConvertNode: Boolean): Boolean;
 {* ������� ������ ���������������/������������ }
//#UC START# *49886FBC0385_49539DBA029D_var*
var
 l_Node: Il3SimpleNode;
//#UC END# *49886FBC0385_49539DBA029D_var*
begin
//#UC START# *49886FBC0385_49539DBA029D_impl*
 Result := true;
 if ReConvertNode then
  l_Node := bsConvertFilteredCRNode(aType)
 else
  l_Node := aType;
 OpenCRListOpExecute(aKind, l_Node);
//#UC END# *49886FBC0385_49539DBA029D_impl*
end;//TExTextForm.OpenCRList

procedure TExTextForm.TypedCRToPartTest(const aParams: IvcmTestParamsPrim;
 aCRType: TlstCRType);
//#UC START# *4988773A0053_49539DBA029D_var*
const
 CRListCaptions : array [1..2] of PvcmStringID = (@str_RespListForText, @str_RespListForPart);
var
 l_List    : IvcmNodes;
 l_Strings : IvcmStrings;
//#UC END# *4988773A0053_49539DBA029D_var*
begin
//#UC START# *4988773A0053_49539DBA029D_impl*
 OpenCRListOpTest(aParams, aCRType);
 with aParams do
 begin
  if Op.Flag[vcm_ofEnabled] then
  begin
   l_Strings := Op.SubItems;
   l_List := Op.SubNodes;
   if (l_Strings <> nil) and (l_List <> nil) then
   begin
    with DefDataAdapter do
     if Text.HasSelection then
     begin
      l_Strings.Add(vcmCStr(CRListCaptions[1]^));
      l_List.Add(CRSimpleListTypeRootNode);
      //
      l_Strings.Add(vcmCStr(CRListCaptions[2]^));
      l_List.Add(CRSimpleListTypeRootNode);
     end
     else
      l_List.Add(CRSimpleListTypeRootNode);
   end;//l_Strings <> nil
  end;
 end;
//#UC END# *4988773A0053_49539DBA029D_impl*
end;//TExTextForm.TypedCRToPartTest

procedure TExTextForm.GetCorrespondentListEx(aParamsIndex: Integer;
 const aChoosedNode: Il3SimpleNode);
 {* �������, ��� ���? }
//#UC START# *498878B60084_49539DBA029D_var*
//#UC END# *498878B60084_49539DBA029D_var*
begin
//#UC START# *498878B60084_49539DBA029D_impl*
 case aParamsIndex of
  0, 1:
   OpenCRListOpExecute(crtCorrespondents, aChoosedNode);
  2:
   OpenCRListToPart(crtCorrespondents, aChoosedNode);
  else
   Assert(False);
 end;//case aParamsIndex
//#UC END# *498878B60084_49539DBA029D_impl*
end;//TExTextForm.GetCorrespondentListEx

procedure TExTextForm.OpenCRListToPart(aCRType: TlstCRType;
 const aType: Il3SimpleNode;
 const aPositionList: IPositionList = nil);
//#UC START# *498879F203D8_49539DBA029D_var*
var
 l_PositionList : IPositionList;
 l_Node         : INodeBase;
//#UC END# *498879F203D8_49539DBA029D_var*
begin
//#UC START# *498879F203D8_49539DBA029D_impl*
 if Assigned(dsDocument) then
 begin
  if Assigned(aPositionList) then
   l_PositionList := aPositionList
  else
   l_PositionList := MakePositionList(aCRType);
  if Assigned (l_PositionList) then
  begin
   if Supports(aType, INodeBase, l_Node) then
    DocumentSet.OpenCRToPart(l_PositionList, l_Node, aCRType)
   else
    DocumentSet.OpenCRToPart(l_PositionList, nil, aCRType);
  end//Assigned(l_PositionList)
  else
  begin
   //Assert(false,'� ����� �����-������ Assigned(l_PositionList) �������?');
   // - �� - ������ ������ ����� ��� �������
   // http://mdp.garant.ru/pages/viewpage.action?pageId=269063249
   // �� �� ����� ������ ������� OpenCRType, ������ ��� �������� ������� ��
   // ���������� ������� ��������� ���������� ����� ����\���� � ������� �����
   // �������� (CQ: OIT500017328):
   case aCRType of
    crtCorrespondents:
     op_Document_OpenCorrespondentList.Call(Self.As_IvcmEntityForm, aCRType, aType);
    crtRespondents:
     op_Document_OpenRespondentList.Call(Self.As_IvcmEntityForm, aCRType, aType);
   end;//case aCRType
   //OpenCRList(aCRType, aType);
  end;//Assigned(l_PositionList)
 end;//if Assigned(dsDocument) then
//#UC END# *498879F203D8_49539DBA029D_impl*
end;//TExTextForm.OpenCRListToPart

procedure TExTextForm.GetRespondentListEx(aParamsIndex: Integer;
 const aChoosedNode: Il3SimpleNode);
//#UC START# *49889018003E_49539DBA029D_var*
//#UC END# *49889018003E_49539DBA029D_var*
begin
//#UC START# *49889018003E_49539DBA029D_impl*
 case aParamsIndex of
  0, 1:
   OpenCRListOpExecute(crtRespondents, aChoosedNode);
  2:
   OpenCRListToPart(crtRespondents, aChoosedNode);
  else
   Assert(False);
 end;//case aParamsIndex
//#UC END# *49889018003E_49539DBA029D_impl*
end;//TExTextForm.GetRespondentListEx

procedure TExTextForm.SynchronizeWithRedationsForm;
//#UC START# *4A793A0A032F_49539DBA029D_var*
//#UC END# *4A793A0A032F_49539DBA029D_var*
begin
//#UC START# *4A793A0A032F_49539DBA029D_impl*
 op_Editions_SetCurrent.Call(Aggregate, Document);
//#UC END# *4A793A0A032F_49539DBA029D_impl*
end;//TExTextForm.SynchronizeWithRedationsForm

procedure TExTextForm.DoSwitchToFirstTab;
//#UC START# *4B043ABF0363_49539DBA029D_var*
//#UC END# *4B043ABF0363_49539DBA029D_var*
begin
//#UC START# *4B043ABF0363_49539DBA029D_impl*
 if (UserType in [dftRelatedDoc,
                              dftDictSubEntry,
                              dftAnnotation,
                              dftTranslation,
                              dftChronology]) then
 // - http://mdp.garant.ru/pages/viewpage.action?pageId=573677603
  op_Switcher_SetFirstPageActive.Call(Container)
 else
  SafeClose;
//#UC END# *4B043ABF0363_49539DBA029D_impl*
end;//TExTextForm.DoSwitchToFirstTab

procedure TExTextForm.OpenRedactionList;
//#UC START# *4B2631930324_49539DBA029D_var*
//#UC END# *4B2631930324_49539DBA029D_var*
begin
//#UC START# *4B2631930324_49539DBA029D_impl*
 DocumentSet.OpenEditions;
//#UC END# *4B2631930324_49539DBA029D_impl*
end;//TExTextForm.OpenRedactionList

procedure TExTextForm.dftMedicFirmSynchroViewQueryMaximized(aSender: TObject);
 {* ���������� ������� dftMedicFirmSynchroView.OnQueryMaximized }
//#UC START# *08687812598B_49539DBA029D_var*
//#UC END# *08687812598B_49539DBA029D_var*
begin
//#UC START# *08687812598B_49539DBA029D_impl*
  if HasDoc then
   OpenInWindow;
//#UC END# *08687812598B_49539DBA029D_impl*
end;//TExTextForm.dftMedicFirmSynchroViewQueryMaximized

procedure TExTextForm.dftTranslationQueryMaximized(aSender: TObject);
 {* ���������� ������� dftTranslation.OnQueryMaximized }
//#UC START# *0B8413148796_49539DBA029D_var*
//#UC END# *0B8413148796_49539DBA029D_var*
begin
//#UC START# *0B8413148796_49539DBA029D_impl*
  if HasDoc then
   OpenInWindow;
//#UC END# *0B8413148796_49539DBA029D_impl*
end;//TExTextForm.dftTranslationQueryMaximized

procedure TExTextForm.DoTabActivate;
 {* ������� �� ������������ ������� }
//#UC START# *497F16AC015A_49539DBA029D_var*
var
 l_ActivationKind : TnsTextTabActivateKind;
//#UC END# *497F16AC015A_49539DBA029D_var*
begin
//#UC START# *497F16AC015A_49539DBA029D_impl*
 if (sdsBaseDocument <> nil) then
 begin
  case UserType of
   dftRelatedDoc:
    l_ActivationKind := ttakRelated;
   dftAnnotation:
    l_ActivationKind := ttakAnnotation;
   else
    Exit;
  end;//case UserType of
  TnsTextTabActivateEvent.Log(sdsBaseDocument.DocInfo.Doc, l_ActivationKind);
 end;//sdsBaseDocument <> nil
//#UC END# *497F16AC015A_49539DBA029D_impl*
end;//TExTextForm.DoTabActivate

procedure TExTextForm.Document_OpenCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
 {* �������, ��� ���? }
//#UC START# *4988752302F4_49539DBA029Dtest_var*
//#UC END# *4988752302F4_49539DBA029Dtest_var*
begin
//#UC START# *4988752302F4_49539DBA029Dtest_impl*
 TypedCRToPartTest(aParams, crtCorrespondents);
//#UC END# *4988752302F4_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenCorrespondentList_Test

procedure TExTextForm.Document_OpenCorrespondentList_Execute(aKind: TlstCRType;
 const aCRType: Il3SimpleNode);
 {* �������, ��� ���? }
//#UC START# *4988752302F4_49539DBA029Dexec_var*
//#UC END# *4988752302F4_49539DBA029Dexec_var*
begin
//#UC START# *4988752302F4_49539DBA029Dexec_impl*
 if not Operation(TdmStdRes.opcode_Document_GetCorrespondentListExFrmAct) then
  Assert(false);
 if not OpenCRList(aKind, aCRType, True) then
  Assert(false);
  //GetCorrespondentListEx(aParams.ItemIndex, bsConvertFilteredCRNode(aParams.CurrentNode));
//#UC END# *4988752302F4_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenCorrespondentList_Execute

procedure TExTextForm.Document_OpenCorrespondentList(const aParams: IvcmExecuteParamsPrim);
 {* �������, ��� ���? }
begin
 with (aParams.Data As IDocument_OpenCorrespondentList_Params) do
  Self.Document_OpenCorrespondentList_Execute(Kind, CRType);
end;//TExTextForm.Document_OpenCorrespondentList

procedure TExTextForm.Document_OpenRespondentList_Test(const aParams: IvcmTestParamsPrim);
 {* �������, ��� ���? }
//#UC START# *49888E8003B9_49539DBA029Dtest_var*
//#UC END# *49888E8003B9_49539DBA029Dtest_var*
begin
//#UC START# *49888E8003B9_49539DBA029Dtest_impl*
 TypedCRToPartTest(aParams, crtRespondents);
//#UC END# *49888E8003B9_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenRespondentList_Test

procedure TExTextForm.Document_OpenRespondentList_Execute(aKind: TlstCRType;
 const aCRType: Il3SimpleNode);
 {* �������, ��� ���? }
//#UC START# *49888E8003B9_49539DBA029Dexec_var*
//#UC END# *49888E8003B9_49539DBA029Dexec_var*
begin
//#UC START# *49888E8003B9_49539DBA029Dexec_impl*
 if not Operation(TdmStdRes.opcode_Document_GetRespondentListExFrmAct) then
  Assert(false);
 if not OpenCRList(aKind, aCRType, false) then
  Assert(false);
  //GetRespondentListEx(aParams.ItemIndex, aParams.CurrentNode);
//#UC END# *49888E8003B9_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenRespondentList_Execute

procedure TExTextForm.Document_OpenRespondentList(const aParams: IvcmExecuteParamsPrim);
 {* �������, ��� ���? }
begin
 with (aParams.Data As IDocument_OpenRespondentList_Params) do
  Self.Document_OpenRespondentList_Execute(Kind, CRType);
end;//TExTextForm.Document_OpenRespondentList

procedure TExTextForm.Document_GetAttributesFrmAct_Test(const aParams: IvcmTestParamsPrim);
 {* ���������� � ��������� }
//#UC START# *498891640253_49539DBA029Dtest_var*
//#UC END# *498891640253_49539DBA029Dtest_var*
begin
//#UC START# *498891640253_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] :=
  (not (UserType in [dftAACContentsLeft, dftAACContentsRight])) AND
  ((UserType in [dftAACLeft, dftAACRight]) OR
    (ZoneType <> vcm_ztChild));
 if aParams.Op.Flag[vcm_ofEnabled] then
  OpenAttributesOpTest(aParams);
//#UC END# *498891640253_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetAttributesFrmAct_Test

procedure TExTextForm.Document_GetAttributesFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ���������� � ��������� }
//#UC START# *498891640253_49539DBA029Dexec_var*
//#UC END# *498891640253_49539DBA029Dexec_var*
begin
//#UC START# *498891640253_49539DBA029Dexec_impl*
 OpenAttributesOpExecute;
//#UC END# *498891640253_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetAttributesFrmAct_Execute

function TExTextForm.Loadable_Load_Execute(const aNode: IeeNode;
 const aData: IUnknown;
 anOp: TListLogicOperation = LLO_NONE): Boolean;
 {* �������, ��� ����� ������� ���� �����? }
//#UC START# *49895A2102E8_49539DBA029Dexec_var*
var
 l_FolderNode : INode;
 l_BaseEntity : IUnknown;
 l_Hyperlink  : IevHyperlink;
 l_HyperlinkUndo: InevOp;
//#UC END# *49895A2102E8_49539DBA029Dexec_var*
begin
//#UC START# *49895A2102E8_49539DBA029Dexec_impl*
 Result := true;
 if Supports(aNode, INode, l_FolderNode) then
  try
   if not Supports(aData, IevHyperlink, l_Hyperlink) then
    if not Supports(aData, Il3CString) then
     Supports(Text.Selection, IevHyperlink, l_Hyperlink);

   try
    l_FolderNode.Open(l_BaseEntity);
   except
    on ECanNotFindData do
    begin
     nsSayAdapterObjectMissing(Self, l_FolderNode);
     Result := false;
     Exit;
    end;//on ECanNotFindData
   end;//try..except
   try
    if (l_Hyperlink = nil) then
     case TFoldersItemType(l_FolderNode.GetObjectType) of
       FIT_LIST: ;
        // !Stub! ���� �� �����
       FIT_QUERY: ;
        // !Stub! ���� �� �����
       FIT_BOOKMARK,
       FIT_PHARM_BOOKMARK:
        TdmStdres.OpenEntityAsDocument(l_BaseEntity, nil);
     end//case TFoldersItemType(l_FolderNode.GetObjectType)
    else
    if (l_Hyperlink.ID >= 0) then
     try
      l_HyperlinkUndo := Text.StartOp;
      try
       if not l_Hyperlink.Exists then
        l_Hyperlink.Insert;
       try
        InitHyperLink(l_Hyperlink, l_BaseEntity);
       except
        on EUnsupported do
        begin
         Say(err_UnsupportedHyperlinkTarget);
         Result := false;
         Exit;
        end;//on EUnsupported
       end;//try..except
      finally
       l_HyperlinkUndo := nil;
      end;//try..finally
     finally
      l_Hyperlink := nil;
     end;//try..finally
   finally
    l_BaseEntity := nil;
   end;//try..finally
  finally
   l_FolderNode := nil;
  end;//try..finally
//#UC END# *49895A2102E8_49539DBA029Dexec_impl*
end;//TExTextForm.Loadable_Load_Execute

procedure TExTextForm.Loadable_Load(const aParams: IvcmExecuteParamsPrim);
 {* �������, ��� ����� ������� ���� �����? }
begin
 with (aParams.Data As ILoadable_Load_Params) do
  ResultValue := Self.Loadable_Load_Execute(Node, Data, nOp);
end;//TExTextForm.Loadable_Load

procedure TExTextForm.Document_GetRelatedDocFrmAct_Test(const aParams: IvcmTestParamsPrim);
 {* ������� � ��������� }
//#UC START# *498993C801DC_49539DBA029Dtest_var*
//#UC END# *498993C801DC_49539DBA029Dtest_var*
begin
//#UC START# *498993C801DC_49539DBA029Dtest_impl*
(* aParams.Op.Flag[vcm_ofEnabled] := (ZoneType <> vcm_ztChild);*)
 // http://mdp.garant.ru/pages/viewpage.action?pageId=380047003
 if aParams.Op.Flag[vcm_ofEnabled] then
  OpenRelatedDocOpTest(aParams);
//#UC END# *498993C801DC_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetRelatedDocFrmAct_Test

procedure TExTextForm.Document_GetRelatedDocFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������� � ��������� }
//#UC START# *498993C801DC_49539DBA029Dexec_var*
//#UC END# *498993C801DC_49539DBA029Dexec_var*
begin
//#UC START# *498993C801DC_49539DBA029Dexec_impl*
 // ������ �� ������, �.�. ��� FormActivate - http://mdp.garant.ru/pages/viewpage.action?pageId=135136020&focusedCommentId=136258958#comment-136258958
//#UC END# *498993C801DC_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetRelatedDocFrmAct_Execute

procedure TExTextForm.SetBookmark;
 {* ������������� �������� �� ������� ����� �������� ��������� }
//#UC START# *4989CD040306_49539DBA029D_var*
//#UC END# *4989CD040306_49539DBA029D_var*
begin
//#UC START# *4989CD040306_49539DBA029D_impl*
 AddBookmark(GetParaForPositionning(False));
//#UC END# *4989CD040306_49539DBA029D_impl*
end;//TExTextForm.SetBookmark

function TExTextForm.CanAddBookmark: Boolean;
 {* ����� �� ������ ��������� �������� }
//#UC START# *4989CF90010A_49539DBA029D_var*
//#UC END# *4989CF90010A_49539DBA029D_var*
begin
//#UC START# *4989CF90010A_49539DBA029D_impl*
 Result := true;
//#UC END# *4989CF90010A_49539DBA029D_impl*
end;//TExTextForm.CanAddBookmark

procedure TExTextForm.Document_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
 {* ������ �� �������� }
//#UC START# *4989D65C0275_49539DBA029Dtest_var*
//#UC END# *4989D65C0275_49539DBA029Dtest_var*
begin
//#UC START# *4989D65C0275_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := GetCorrespondentListTest;
//#UC END# *4989D65C0275_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetCorrespondentList_Test

procedure TExTextForm.Document_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ �� �������� }
//#UC START# *4989D65C0275_49539DBA029Dexec_var*
//#UC END# *4989D65C0275_49539DBA029Dexec_var*
begin
//#UC START# *4989D65C0275_49539DBA029Dexec_impl*
 OpenCRListOpExecute(crtCorrespondents, nil);
//#UC END# *4989D65C0275_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetCorrespondentList_Execute

procedure TExTextForm.Document_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
 {* ������ �� ��������� }
//#UC START# *4989D8430128_49539DBA029Dtest_var*
//#UC END# *4989D8430128_49539DBA029Dtest_var*
begin
//#UC START# *4989D8430128_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := GetRespondentListTest;
//#UC END# *4989D8430128_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetRespondentList_Test

procedure TExTextForm.Document_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ �� ��������� }
//#UC START# *4989D8430128_49539DBA029Dexec_var*
//#UC END# *4989D8430128_49539DBA029Dexec_var*
begin
//#UC START# *4989D8430128_49539DBA029Dexec_impl*
 OpenCRListOpExecute(crtRespondents, nil);
//#UC END# *4989D8430128_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetRespondentList_Execute

function TExTextForm.Document_AttributesCanBeClosed_Execute: Boolean;
 {* ��� �������� �� ������� � Facet ��� ���-�� �������� }
//#UC START# *4989DE3702CF_49539DBA029Dexec_var*
const
 c_CanCloseFormTypes = [
  dftNone,
  dftDocument,
  dftDictEntry,
  dftTips,
  dftMedDictEntry,
  dftMedicFirm
 ];
//#UC END# *4989DE3702CF_49539DBA029Dexec_var*
begin
//#UC START# *4989DE3702CF_49539DBA029Dexec_impl*
 Result := (UserType in c_CanCloseFormTypes) and
           OpenAttributesOpCanBeClosed;
//#UC END# *4989DE3702CF_49539DBA029Dexec_impl*
end;//TExTextForm.Document_AttributesCanBeClosed_Execute

procedure TExTextForm.Document_AttributesCanBeClosed(const aParams: IvcmExecuteParamsPrim);
 {* ��� �������� �� ������� � Facet ��� ���-�� �������� }
begin
 with (aParams.Data As IDocument_AttributesCanBeClosed_Params) do
  ResultValue := Self.Document_AttributesCanBeClosed_Execute;
end;//TExTextForm.Document_AttributesCanBeClosed

function TExTextForm.DocumentIsValid: Boolean;
 {* ���� �� ��������, ������� � ������ }
//#UC START# *4A7C0E1A005C_49539DBA029D_var*
//#UC END# *4A7C0E1A005C_49539DBA029D_var*
begin
//#UC START# *4A7C0E1A005C_49539DBA029D_impl*
 Result := (Document <> nil);
//#UC END# *4A7C0E1A005C_49539DBA029D_impl*
end;//TExTextForm.DocumentIsValid

function TExTextForm.RedactionCurrentPara: IeeLeafPara;
 {* ������� �������� �������� ��� ������������� � ����� ���������� �������� }
//#UC START# *4A7FCEA9025D_49539DBA029D_var*
//#UC END# *4A7FCEA9025D_49539DBA029D_var*
begin
//#UC START# *4A7FCEA9025D_49539DBA029D_impl*
 Result := GetParaForPositionning;
//#UC END# *4A7FCEA9025D_49539DBA029D_impl*
end;//TExTextForm.RedactionCurrentPara

function TExTextForm.DoProcessExternalOperation(const anOperation: IExternalOperation): Boolean;
 {* ���������� ������� �������� }
//#UC START# *4A815E860391_49539DBA029D_var*
var
 l_Operartion: TbsObjectId;
 l_Form: IvcmEntityForm;
const
 gc_Confirmation: array [Boolean] of PvcmMessageID = (@inf_PaymentRejected, @inf_PaymentConfirmed);
//#UC END# *4A815E860391_49539DBA029D_var*
begin
//#UC START# *4A815E860391_49539DBA029D_impl*
 Result := True;
 if Assigned(anOperation) then
 begin
  l_Operartion := anOperation.GetId;
  if l_Operartion = EOI_ESTIMATION then
  begin
   if (Consultation <> nil) then
    try
     Consultation.GiveMark;
    except
     on EbsConsultationAlreadyMark do
      Say(inf_ConsulationAlreadyMark);
     on EbsConsultationWasDeleted do
      Say(inf_ConsultationWasDeleted);
    end;//try..except
  end//l_Operartion = EOI_ESTIMATION
  else
   if l_Operartion in [EOI_PAYMENT_CONFIRM, EOI_PAYMENT_REFUSAL] then
   begin
    if (Consultation <> nil) then
     try
      Consultation.ConfirmPayment(l_Operartion = EOI_PAYMENT_CONFIRM);
      Say(gc_Confirmation[l_Operartion = EOI_PAYMENT_CONFIRM]^);
     except
      on EbsConsultationAlreadyConfirmed do
       Say(inf_ConsulationAlreadyConfirmed);
      on EbsConsultationWasDeleted do
       Say(inf_ConsultationWasDeleted);
      on EbsPaymentForbidden do
       Say(war_PaymentForbidden);
      on ENoConnection do
       Say(war_NoConnection);
      on ENoSubscription do
       Say(war_NoSubscription, [defDataAdapter.GetDealerInfo]);
     end;{try..except}
   end//l_Operartion in [EOI_PAYMENT_CONFIRM, EOI_PAYMENT_REFUSAL]
   else
    if (l_Operartion = EOI_SHOW_HELP_TOPIC) and (UserType = dftConsultation) then
     Application.HelpSystem.ShowTopicHelp(cHelpConsultingRules, '')
    else
     if (l_Operartion = EOI_CONSULTATION_CALL_GARANT) then
      nsDoShellExecute(nsStringMapManager.Map[smap_InternetCaptions].DisplayNameToValue(vcmCStr(str_ilnCatalogue)))
     else
      if (l_Operartion = EOI_SHOW_CONSULTATION_LIST) then
      begin
       if (Consultation <> nil) then
       begin
        f_HyperlinkCallStatus := false; // http://mdp.garant.ru/pages/viewpage.action?pageId=342335537       
        if NativeMainForm.HasForm(fm_efList.rFormID, vcm_ztChild, True, @l_Form) then
         l_Form.SetActiveInParent;
       end;
      end
      else
       Result := False;
 end;

//#UC END# *4A815E860391_49539DBA029D_impl*
end;//TExTextForm.DoProcessExternalOperation

procedure TExTextForm.GotoPoint(aPointID: Cardinal;
 aPointType: TDocumentPositionType = bsTypesNew.dptSub);
 {* ������� �� ����� � ��������� }
//#UC START# *4A8164E801AE_49539DBA029D_var*
var
 l_Document : IDocument;
 l_Sub      : IeeSub;
//#UC END# *4A8164E801AE_49539DBA029D_var*
begin
//#UC START# *4A8164E801AE_49539DBA029D_impl*
 if Text.TextSource.HasDocument then
 begin
  if (aPointType = dptSub) then
  begin
   if (aPointID AND POSITION_TYPE_MASK = POSITION_TYPE_PARA_ID) then
    aPointType := dptPara;
   l3ClearMask(Integer(aPointID), Integer(POSITION_TYPE_MASK));
  end;//aPointType = dptSub
  case aPointType of
   dptPara :
    try
     Text.GoToPara(aPointID);
    except
     on E: Exception do
      l3System.Exception2Log(E);
    end;//try..except
   dptSub  :
    begin
     l_Document := Document;
     try
      l_Sub := Text.Editor.Data.Document.Subs.SubsByID[aPointID];
      if (l_Sub <> nil) and
         l_Sub.Exists then
       l_Sub.Select;
     finally
      l_Document := nil;
     end;//try..finally
    end;//dptSub
   dptBookmark :
    begin
     l_Sub := Text.Editor.Data.Document.Bookmarks.SubsByID[aPointID];
     if (l_Sub <> nil) and
        l_Sub.Exists then
      l_Sub.Select;
    end;//dptBookmark
   dptMarker :
    begin
     l_Sub := Text.Editor.Data.Document.Markers.SubsByID[aPointID];
     if (l_Sub <> nil) and
        l_Sub.Exists then
      l_Sub.Select;
    end;//dptMarker
   dptMark :
    begin
     l_Sub := Text.Editor.Data.Document.Marks.SubsByID[aPointID];
     if (l_Sub <> nil) and
        l_Sub.Exists then
      l_Sub.Select;
    end;//dptMark
   dptDocumentPlace:
    if aPointID = LongWord(Ord(ev_dpEnd)) then
     Text.GotoBottom;
  end;//case aPointType
 end//Text.TextSource.HasDocument
 else
 if (ViewArea <> nil) then
  ViewArea.DocInfo.SetPosition(TbsDocPos_C(aPointType, aPointID));
//#UC END# *4A8164E801AE_49539DBA029D_impl*
end;//TExTextForm.GotoPoint

procedure TExTextForm.OpenRedactionLocalLink(const aDocument: IDocument;
 aSub: Cardinal;
 aBehaviour: TbsProcessHyperLinkBehaviour);
 {* ��������� ��������� ������ �� ������ �������� }
//#UC START# *4A81650B014A_49539DBA029D_var*
//#UC END# *4A81650B014A_49539DBA029D_var*
begin
//#UC START# *4A81650B014A_49539DBA029D_impl*
 OpenRedactionGlobalLink(aDocument, aSub, aBehaviour);
//#UC END# *4A81650B014A_49539DBA029D_impl*
end;//TExTextForm.OpenRedactionLocalLink

function TExTextForm.HyperlinkDocument: IDocument;
 {* �������� �� �������� ���� ������ }
//#UC START# *4A8168BB0217_49539DBA029D_var*
//#UC END# *4A8168BB0217_49539DBA029D_var*
begin
//#UC START# *4A8168BB0217_49539DBA029D_impl*
 Result := Document;
//#UC END# *4A8168BB0217_49539DBA029D_impl*
end;//TExTextForm.HyperlinkDocument

function TExTextForm.pm_GetHyperlinkText: TevCustomEditorWindow;
//#UC START# *4A82BC390036_49539DBA029Dget_var*
//#UC END# *4A82BC390036_49539DBA029Dget_var*
begin
//#UC START# *4A82BC390036_49539DBA029Dget_impl*
 Result := Text;
//#UC END# *4A82BC390036_49539DBA029Dget_impl*
end;//TExTextForm.pm_GetHyperlinkText

function TExTextForm.CanBeChanged: Boolean;
 {* ����� �� �������� ���� ������� }
//#UC START# *4A8931130363_49539DBA029D_var*
//#UC END# *4A8931130363_49539DBA029D_var*
begin
//#UC START# *4A8931130363_49539DBA029D_impl*
 Result := true;
//#UC END# *4A8931130363_49539DBA029D_impl*
end;//TExTextForm.CanBeChanged

function TExTextForm.IsFloating: Boolean;
 {* ����� ��������� }
//#UC START# *4A8A9DB0001A_49539DBA029D_var*
//#UC END# *4A8A9DB0001A_49539DBA029D_var*
begin
//#UC START# *4A8A9DB0001A_49539DBA029D_impl*
 Result := false;
//#UC END# *4A8A9DB0001A_49539DBA029D_impl*
end;//TExTextForm.IsFloating

function TExTextForm.pm_GetTextWithComments: TevCustomEditorWindow;
//#UC START# *4A8AAD450084_49539DBA029Dget_var*
//#UC END# *4A8AAD450084_49539DBA029Dget_var*
begin
//#UC START# *4A8AAD450084_49539DBA029Dget_impl*
 Result := Text;
//#UC END# *4A8AAD450084_49539DBA029Dget_impl*
end;//TExTextForm.pm_GetTextWithComments

procedure TExTextForm.Document_CommonDocumentOpenNewWindow_Execute(aUserType: Integer);
 {* ��� ���? }
//#UC START# *4A8EF02E007D_49539DBA029Dexec_var*
var
 l_NewDocument : IDocument;
 l_Cont        : IvcmContainer;
 l_TopPara     : IeePara;
//#UC END# *4A8EF02E007D_49539DBA029Dexec_var*
begin
//#UC START# *4A8EF02E007D_49539DBA029Dexec_impl*
 // �������� ����� ���� ������� ��� ����� � ���������� UserType

 if not CheckParamForUserType(aUserType) then
  Exit;
 OpenDocumentInNewContainer(vcm_okInNewWindow);
//#UC END# *4A8EF02E007D_49539DBA029Dexec_impl*
end;//TExTextForm.Document_CommonDocumentOpenNewWindow_Execute

procedure TExTextForm.Document_CommonDocumentOpenNewWindow(const aParams: IvcmExecuteParamsPrim);
 {* ��� ���? }
begin
 with (aParams.Data As IDocument_CommonDocumentOpenNewWindow_Params) do
  Self.Document_CommonDocumentOpenNewWindow_Execute(UserType);
end;//TExTextForm.Document_CommonDocumentOpenNewWindow

procedure TExTextForm.System_TimeMachineStateChange_Execute(aStayInCurrentRedaction: Boolean = False);
//#UC START# *4A8EF367029E_49539DBA029Dexec_var*
//#UC END# *4A8EF367029E_49539DBA029Dexec_var*
begin
//#UC START# *4A8EF367029E_49539DBA029Dexec_impl*
 if (UserType = dftDocument) then
 begin
  if not defDataAdapter.TimeMachine.IsOn then
  begin
   if aStayInCurrentRedaction then
    f_DontResetRedactions := True;
   if not f_DontResetRedactions then
    SetActualRedaction
   else
   // ����� �� ���� ������ ������� ��� � http://mdp.garant.ru/pages/viewpage.action?pageId=342866563
   // ��������� ���� �������� - and dsDocument.TimeMachineOff
   if Visible and Assigned(dsDocument) and dsDocument.TimeMachineOff then
    DocumentSet.OpenWarning;
  end//not defDataAdapter.TimeMachine.IsOn
  else
  if not ReloadRedaction(defDataAdapter.TimeMachine.Date) and
     Visible and Assigned(dsDocument) and dsDocument.TimeMachineOff then
   DocumentSet.OpenWarning;
 end;//UserType = dftDocument
 f_DontResetRedactions := False;
//#UC END# *4A8EF367029E_49539DBA029Dexec_impl*
end;//TExTextForm.System_TimeMachineStateChange_Execute

procedure TExTextForm.System_TimeMachineStateChange(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As ISystem_TimeMachineStateChange_Params) do
  Self.System_TimeMachineStateChange_Execute(StayInCurrentRedaction);
end;//TExTextForm.System_TimeMachineStateChange

procedure TExTextForm.Redactions_RedactionOnID_Execute(aRedactionID: TRedactionID);
//#UC START# *4A8EF4B50044_49539DBA029Dexec_var*
//#UC END# *4A8EF4B50044_49539DBA029Dexec_var*
begin
//#UC START# *4A8EF4B50044_49539DBA029Dexec_impl*
 if (UserType = dftDocument) and
    (Document <> nil) then
  ReloadRedaction(crtID, aRedactionID);
//#UC END# *4A8EF4B50044_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_RedactionOnID_Execute

procedure TExTextForm.Redactions_RedactionOnID(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IRedactions_RedactionOnID_Params) do
  Self.Redactions_RedactionOnID_Execute(RedactionID);
end;//TExTextForm.Redactions_RedactionOnID

function TExTextForm.Document_FindExplanation_Execute: Boolean;
 {* ����� ���������� }
//#UC START# *4A9D26B80015_49539DBA029Dexec_var*
//#UC END# *4A9D26B80015_49539DBA029Dexec_var*
begin
//#UC START# *4A9D26B80015_49539DBA029Dexec_impl*
 Result := true;
 if Text.HasSelection then
  DoFindInDict
 else
  Result := false;
//#UC END# *4A9D26B80015_49539DBA029Dexec_impl*
end;//TExTextForm.Document_FindExplanation_Execute

procedure TExTextForm.Document_FindExplanation(const aParams: IvcmExecuteParamsPrim);
 {* ����� ���������� }
begin
 with (aParams.Data As IDocument_FindExplanation_Params) do
  ResultValue := Self.Document_FindExplanation_Execute;
end;//TExTextForm.Document_FindExplanation

procedure TExTextForm.Selection_FindInDict_Test(const aParams: IvcmTestParamsPrim);
 {* ����� � �������� ������� }
//#UC START# *4A9D3FC50134_49539DBA029Dtest_var*
//#UC END# *4A9D3FC50134_49539DBA029Dtest_var*
begin
//#UC START# *4A9D3FC50134_49539DBA029Dtest_impl*
 if aParams.Op.Flag[vcm_ofEnabled] then 
  aParams.Op.Flag[vcm_ofEnabled] := (Document <> nil) and
                                   (not IsPictureUnderCursor) and
                                   defDataAdapter.IsExplanatoryExists;
//#UC END# *4A9D3FC50134_49539DBA029Dtest_impl*
end;//TExTextForm.Selection_FindInDict_Test

procedure TExTextForm.Selection_FindInDict_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ����� � �������� ������� }
//#UC START# *4A9D3FC50134_49539DBA029Dexec_var*
//#UC END# *4A9D3FC50134_49539DBA029Dexec_var*
begin
//#UC START# *4A9D3FC50134_49539DBA029Dexec_impl*
 DoFindInDict;
//#UC END# *4A9D3FC50134_49539DBA029Dexec_impl*
end;//TExTextForm.Selection_FindInDict_Execute

function TExTextForm.Document_SetPosition_Execute(aPointID: Cardinal;
 aPointType: TDocumentPositionType = bsTypesNew.dptSub;
 aUserType: Integer = 0): Boolean;
//#UC START# *4AE9D38A02DA_49539DBA029Dexec_var*
//#UC END# *4AE9D38A02DA_49539DBA029Dexec_var*
begin
//#UC START# *4AE9D38A02DA_49539DBA029Dexec_impl*
 if not CheckParamForUserType(aUserType) then
 begin
  Result := false;
  Exit;
 end;//not CheckParamForUserType(aUserType)
 Result := true;
 GoToPoint(aPointID, aPointType)
//#UC END# *4AE9D38A02DA_49539DBA029Dexec_impl*
end;//TExTextForm.Document_SetPosition_Execute

procedure TExTextForm.Document_SetPosition(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_SetPosition_Params) do
  ResultValue := Self.Document_SetPosition_Execute(PointID, PointType, UserType);
end;//TExTextForm.Document_SetPosition

procedure TExTextForm.Document_SetActive_Execute(aUserType: Integer);
//#UC START# *4AE9D9AF02FE_49539DBA029Dexec_var*
//#UC END# *4AE9D9AF02FE_49539DBA029Dexec_var*
begin
//#UC START# *4AE9D9AF02FE_49539DBA029Dexec_impl*
 if (ZoneType = vcm_ztChild) and
    (UserType = aUserType) then
 begin
  if IsActiveInParent then
   SetInactiveInParent
  else
   SetActiveInParent;
 end;//ZoneType = vcm_ztChild
//#UC END# *4AE9D9AF02FE_49539DBA029Dexec_impl*
end;//TExTextForm.Document_SetActive_Execute

procedure TExTextForm.Document_SetActive(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_SetActive_Params) do
  Self.Document_SetActive_Execute(UserType);
end;//TExTextForm.Document_SetActive

procedure TExTextForm.Document_ExportBlock_Execute(const aData: IUnknown;
 aUserType: Integer;
 aToActiveWindow: Boolean);
//#UC START# *4AE9DC070264_49539DBA029Dexec_var*
//#UC END# *4AE9DC070264_49539DBA029Dexec_var*
begin
//#UC START# *4AE9DC070264_49539DBA029Dexec_impl*
 ExportBlock(ExtractRangeFromContents(aData, aUserType), aToActiveWindow);
//#UC END# *4AE9DC070264_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ExportBlock_Execute

procedure TExTextForm.Document_ExportBlock(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_ExportBlock_Params) do
  Self.Document_ExportBlock_Execute(Data, UserType, ToActiveWindow);
end;//TExTextForm.Document_ExportBlock

procedure TExTextForm.Document_GetCurrentPosition_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AEAF9C000D8_49539DBA029Dtest_var*
//#UC END# *4AEAF9C000D8_49539DBA029Dtest_var*
begin
//#UC START# *4AEAF9C000D8_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (UserType in [dftDocument, dftMedicFirm]);
//#UC END# *4AEAF9C000D8_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetCurrentPosition_Test

function TExTextForm.Document_GetCurrentPosition_Execute: Integer;
//#UC START# *4AEAF9C000D8_49539DBA029Dexec_var*
var
 l_CurSub : IeeSub;
//#UC END# *4AEAF9C000D8_49539DBA029Dexec_var*
begin
//#UC START# *4AEAF9C000D8_49539DBA029Dexec_impl*
 l_CurSub := Text.GetNearestSubByCursor;
 try
  if (l_CurSub <> nil) then
   Result := l_CurSub.ID
  else
   Result := -1;
 finally
  l_CurSub := nil;
 end;//try..finally
//#UC END# *4AEAF9C000D8_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetCurrentPosition_Execute

procedure TExTextForm.Document_GetCurrentPosition(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_GetCurrentPosition_Params) do
  ResultValue := Self.Document_GetCurrentPosition_Execute;
end;//TExTextForm.Document_GetCurrentPosition

procedure TExTextForm.Document_SelectBlock_Execute(const aData: IUnknown;
 aUserType: Integer);
//#UC START# *4AEB097001C3_49539DBA029Dexec_var*
//#UC END# *4AEB097001C3_49539DBA029Dexec_var*
begin
//#UC START# *4AEB097001C3_49539DBA029Dexec_impl*
 SelectBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB097001C3_49539DBA029Dexec_impl*
end;//TExTextForm.Document_SelectBlock_Execute

procedure TExTextForm.Document_SelectBlock(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_SelectBlock_Params) do
  Self.Document_SelectBlock_Execute(Data, UserType);
end;//TExTextForm.Document_SelectBlock

procedure TExTextForm.Document_CopyBlock_Execute(const aData: IUnknown;
 aUserType: Integer);
//#UC START# *4AEB09C50287_49539DBA029Dexec_var*
//#UC END# *4AEB09C50287_49539DBA029Dexec_var*
begin
//#UC START# *4AEB09C50287_49539DBA029Dexec_impl*
 CopyBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB09C50287_49539DBA029Dexec_impl*
end;//TExTextForm.Document_CopyBlock_Execute

procedure TExTextForm.Document_CopyBlock(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_CopyBlock_Params) do
  Self.Document_CopyBlock_Execute(Data, UserType);
end;//TExTextForm.Document_CopyBlock

procedure TExTextForm.Document_PrintBlock_Execute(const aData: IUnknown;
 aUserType: Integer);
//#UC START# *4AEB0A1C0270_49539DBA029Dexec_var*
//#UC END# *4AEB0A1C0270_49539DBA029Dexec_var*
begin
//#UC START# *4AEB0A1C0270_49539DBA029Dexec_impl*
 PrintBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB0A1C0270_49539DBA029Dexec_impl*
end;//TExTextForm.Document_PrintBlock_Execute

procedure TExTextForm.Document_PrintBlock(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_PrintBlock_Params) do
  Self.Document_PrintBlock_Execute(Data, UserType);
end;//TExTextForm.Document_PrintBlock

procedure TExTextForm.Document_PrintDialogBlock_Execute(const aData: IUnknown;
 aUserType: Integer);
//#UC START# *4AEB0A550165_49539DBA029Dexec_var*
//#UC END# *4AEB0A550165_49539DBA029Dexec_var*
begin
//#UC START# *4AEB0A550165_49539DBA029Dexec_impl*
 PrintDialogBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB0A550165_49539DBA029Dexec_impl*
end;//TExTextForm.Document_PrintDialogBlock_Execute

procedure TExTextForm.Document_PrintDialogBlock(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_PrintDialogBlock_Params) do
  Self.Document_PrintDialogBlock_Execute(Data, UserType);
end;//TExTextForm.Document_PrintDialogBlock

procedure TExTextForm.Document_PreviewBlock_Execute(const aData: IUnknown;
 aUserType: Integer);
//#UC START# *4AEB0A8E002E_49539DBA029Dexec_var*
//#UC END# *4AEB0A8E002E_49539DBA029Dexec_var*
begin
//#UC START# *4AEB0A8E002E_49539DBA029Dexec_impl*
 PreviewBlock(ExtractRangeFromContents(aData, aUserType));
//#UC END# *4AEB0A8E002E_49539DBA029Dexec_impl*
end;//TExTextForm.Document_PreviewBlock_Execute

procedure TExTextForm.Document_PreviewBlock(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_PreviewBlock_Params) do
  Self.Document_PreviewBlock_Execute(Data, UserType);
end;//TExTextForm.Document_PreviewBlock

procedure TExTextForm.Document_ShowRespondentListToPart_Execute(const aList: IPositionList;
 const aCurrent: Il3SimpleNode = nil);
//#UC START# *4AEEEE970141_49539DBA029Dexec_var*
//#UC END# *4AEEEE970141_49539DBA029Dexec_var*
begin
//#UC START# *4AEEEE970141_49539DBA029Dexec_impl*
 if (UserType in [dftDocument, dftAACLeft]) then
  OpenCRListToPart(crtRespondents, aCurrent, aList);
//#UC END# *4AEEEE970141_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ShowRespondentListToPart_Execute

procedure TExTextForm.Document_ShowRespondentListToPart(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_ShowRespondentListToPart_Params) do
  Self.Document_ShowRespondentListToPart_Execute(List, Current);
end;//TExTextForm.Document_ShowRespondentListToPart

procedure TExTextForm.Document_ShowCorrespondentListToPart_Execute(const aList: IPositionList;
 const aCurrent: Il3SimpleNode = nil);
//#UC START# *4AEEEEB7027C_49539DBA029Dexec_var*
//#UC END# *4AEEEEB7027C_49539DBA029Dexec_var*
begin
//#UC START# *4AEEEEB7027C_49539DBA029Dexec_impl*
 if (UserType in [dftDocument, dftAACLeft]) then
  OpenCRListToPart(crtCorrespondents, aCurrent, aList);
//#UC END# *4AEEEEB7027C_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ShowCorrespondentListToPart_Execute

procedure TExTextForm.Document_ShowCorrespondentListToPart(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_ShowCorrespondentListToPart_Params) do
  Self.Document_ShowCorrespondentListToPart_Execute(List, Current);
end;//TExTextForm.Document_ShowCorrespondentListToPart

procedure TExTextForm.Document_ModifyBookmarkNotify_Execute(const anEntity: IUnknown);
//#UC START# *4AEEF7F40304_49539DBA029Dexec_var*
var
 l_Bookmark : IBookmark;
 l_Sub      : IeeSub;
//#UC END# *4AEEF7F40304_49539DBA029Dexec_var*
begin
//#UC START# *4AEEF7F40304_49539DBA029Dexec_impl*
 if (Document <> nil) and
    (Text.Editor.Data.Document.Bookmarks.Count > 0) and
    Supports(anEntity, IBookmark, l_Bookmark) then
  try
   if FindBookmarkInText(l_Bookmark, l_Sub) then
    try
     l_Sub.Name := nsGetBookmarkName(l_Bookmark).AsWStr;
    finally
     l_Sub := nil;
    end;//try..finally
  finally
   l_Bookmark := nil;
  end;//try..finally
//#UC END# *4AEEF7F40304_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ModifyBookmarkNotify_Execute

procedure TExTextForm.Document_ModifyBookmarkNotify(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_ModifyBookmarkNotify_Params) do
  Self.Document_ModifyBookmarkNotify_Execute(nEntity);
end;//TExTextForm.Document_ModifyBookmarkNotify

procedure TExTextForm.Document_AddBookmarkFromContents_Execute(const aTag: Il3TagRef);
//#UC START# *4AEEF87B00E1_49539DBA029Dexec_var*
var
 l_eePara: IeePara;
//#UC END# *4AEEF87B00E1_49539DBA029Dexec_var*
begin
//#UC START# *4AEEF87B00E1_49539DBA029Dexec_impl*
 if (Document <> nil) and
    (aTag <> nil) then
 begin
  l_eePara := TeePara.Make(aTag.AsObject.Box, Text As IeeDocumentEx);
  try
   AddBookmark(eeFindNumberedPara(l_eePara, Text as IeeDocumentEx));
  finally
   l_eePara := nil;
  end;
 end;//Document <> nil
//#UC END# *4AEEF87B00E1_49539DBA029Dexec_impl*
end;//TExTextForm.Document_AddBookmarkFromContents_Execute

procedure TExTextForm.Document_AddBookmarkFromContents(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_AddBookmarkFromContents_Params) do
  Self.Document_AddBookmarkFromContents_Execute(Tag);
end;//TExTextForm.Document_AddBookmarkFromContents

procedure TExTextForm.Document_GetCorrespondentListExFrmAct_Test(const aParams: IvcmTestParamsPrim);
 {* ������ �� �������� (��� ����������) }
//#UC START# *4AF329F6002A_49539DBA029Dtest_var*
//#UC END# *4AF329F6002A_49539DBA029Dtest_var*
begin
//#UC START# *4AF329F6002A_49539DBA029Dtest_impl*
 TypedCRToPartTest(aParams, crtCorrespondents);
//#UC END# *4AF329F6002A_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetCorrespondentListExFrmAct_Test

procedure TExTextForm.Document_GetCorrespondentListExFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ �� �������� (��� ����������) }
//#UC START# *4AF329F6002A_49539DBA029Dexec_var*
//#UC END# *4AF329F6002A_49539DBA029Dexec_var*
begin
//#UC START# *4AF329F6002A_49539DBA029Dexec_impl*
 if (aParams.CurrentNode <> nil) OR (aParams.ItemIndex >= 0) then
  GetCorrespondentListEx(aParams.ItemIndex, bsConvertFilteredCRNode(aParams.CurrentNode));
//#UC END# *4AF329F6002A_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetCorrespondentListExFrmAct_Execute

procedure TExTextForm.Document_GetRespondentListExFrmAct_Test(const aParams: IvcmTestParamsPrim);
 {* ������ �� ��������� (��� ����������) }
//#UC START# *4AF329FD014D_49539DBA029Dtest_var*
//#UC END# *4AF329FD014D_49539DBA029Dtest_var*
begin
//#UC START# *4AF329FD014D_49539DBA029Dtest_impl*
 TypedCRToPartTest(aParams, crtRespondents);
//#UC END# *4AF329FD014D_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetRespondentListExFrmAct_Test

procedure TExTextForm.Document_GetRespondentListExFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ �� ��������� (��� ����������) }
//#UC START# *4AF329FD014D_49539DBA029Dexec_var*
//#UC END# *4AF329FD014D_49539DBA029Dexec_var*
begin
//#UC START# *4AF329FD014D_49539DBA029Dexec_impl*
 if (aParams.CurrentNode <> nil) OR (aParams.ItemIndex >= 0) then
  GetRespondentListEx(aParams.ItemIndex, aParams.CurrentNode);
//#UC END# *4AF329FD014D_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetRespondentListExFrmAct_Execute

procedure TExTextForm.TimeMachine_TimeMachineOnOff_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AF83BDB03AE_49539DBA029Dtest_var*
//#UC END# *4AF83BDB03AE_49539DBA029Dtest_var*
begin
//#UC START# *4AF83BDB03AE_49539DBA029Dtest_impl*
 with aParams do
 begin
  Op.Flag[vcm_ofEnabled] := Assigned(Document) and
   (not Document.GetNotTm or DefDataAdapter.TimeMachine.IsOn);
  if Op.Flag[vcm_ofEnabled] then
   Op.Flag[vcm_ofChecked] := defDataAdapter.TimeMachine.IsOn;
 end;//with aParams do
//#UC END# *4AF83BDB03AE_49539DBA029Dtest_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOff_Test

procedure TExTextForm.TimeMachine_TimeMachineOnOff_Execute;
//#UC START# *4AF83BDB03AE_49539DBA029Dexec_var*
//#UC END# *4AF83BDB03AE_49539DBA029Dexec_var*
begin
//#UC START# *4AF83BDB03AE_49539DBA029Dexec_impl*
 f_DontResetRedactions := true;
 TimeMachineOnOff;
//#UC END# *4AF83BDB03AE_49539DBA029Dexec_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOff_Execute

procedure TExTextForm.TimeMachine_TimeMachineOnOff(const aParams: IvcmExecuteParamsPrim);
begin
 Self.TimeMachine_TimeMachineOnOff_Execute;
end;//TExTextForm.TimeMachine_TimeMachineOnOff

procedure TExTextForm.TimeMachine_TimeMachineOffAndReset_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AF83BEB0393_49539DBA029Dtest_var*
//#UC END# *4AF83BEB0393_49539DBA029Dtest_var*
begin
//#UC START# *4AF83BEB0393_49539DBA029Dtest_impl*
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := defDataAdapter.TimeMachine.IsOn;
//#UC END# *4AF83BEB0393_49539DBA029Dtest_impl*
end;//TExTextForm.TimeMachine_TimeMachineOffAndReset_Test

procedure TExTextForm.TimeMachine_TimeMachineOffAndReset_Execute;
//#UC START# *4AF83BEB0393_49539DBA029Dexec_var*
//#UC END# *4AF83BEB0393_49539DBA029Dexec_var*
begin
//#UC START# *4AF83BEB0393_49539DBA029Dexec_impl*
 TimeMachineOnOff(True);
//#UC END# *4AF83BEB0393_49539DBA029Dexec_impl*
end;//TExTextForm.TimeMachine_TimeMachineOffAndReset_Execute

procedure TExTextForm.TimeMachine_TimeMachineOffAndReset(const aParams: IvcmExecuteParamsPrim);
begin
 Self.TimeMachine_TimeMachineOffAndReset_Execute;
end;//TExTextForm.TimeMachine_TimeMachineOffAndReset

procedure TExTextForm.Document_OpenNotSureTopic_Execute;
//#UC START# *4AF83C3D01DA_49539DBA029Dexec_var*
var
 l_Document: IDocument;
//#UC END# *4AF83C3D01DA_49539DBA029Dexec_var*
begin
//#UC START# *4AF83C3D01DA_49539DBA029Dexec_impl*
 if (UserType = dftDocument) then
 begin
  l_Document := defDataAdapter.TimeMachine.NotSureHelp;
  if Assigned(l_Document) then
   try
    TdmStdRes.OpenDocumentWithCheck(TdeDocInfo.Make(l_Document), NativeMainForm);
   finally
    l_Document := nil;
   end;//try..finally
 end;//UserType = dftDocument
//#UC END# *4AF83C3D01DA_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenNotSureTopic_Execute

procedure TExTextForm.Document_OpenNotSureTopic(const aParams: IvcmExecuteParamsPrim);
begin
 Self.Document_OpenNotSureTopic_Execute;
end;//TExTextForm.Document_OpenNotSureTopic

procedure TExTextForm.Redactions_ActualRedaction_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4AFAF4900270_49539DBA029Dtest_var*
//#UC END# *4AFAF4900270_49539DBA029Dtest_var*
begin
//#UC START# *4AFAF4900270_49539DBA029Dtest_impl*
 if EnableRedactionOps(aParams) and Assigned(ViewArea) then
  aParams.Op.Flag[vcm_ofChecked] := TdmStdRes.IsCurEditionActual(ViewArea.DocInfo.Doc);
//#UC END# *4AFAF4900270_49539DBA029Dtest_impl*
end;//TExTextForm.Redactions_ActualRedaction_Test

procedure TExTextForm.Redactions_ActualRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4AFAF4900270_49539DBA029Dexec_var*
//#UC END# *4AFAF4900270_49539DBA029Dexec_var*
begin
//#UC START# *4AFAF4900270_49539DBA029Dexec_impl*
 SetActualRedaction;
//#UC END# *4AFAF4900270_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_ActualRedaction_Execute

procedure TExTextForm.Edit_ToggleFoundWords_Test(const aParams: IvcmTestParamsPrim);
 {* ������������ ��������� �������� }
//#UC START# *4AFD4230031F_49539DBA029Dtest_var*
//#UC END# *4AFD4230031F_49539DBA029Dtest_var*
begin
//#UC START# *4AFD4230031F_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofChecked] := (Text.ExcludeSuper = []);
//#UC END# *4AFD4230031F_49539DBA029Dtest_impl*
end;//TExTextForm.Edit_ToggleFoundWords_Test

procedure TExTextForm.Edit_ToggleFoundWords_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������������ ��������� �������� }
//#UC START# *4AFD4230031F_49539DBA029Dexec_var*
//#UC END# *4AFD4230031F_49539DBA029Dexec_var*
begin
//#UC START# *4AFD4230031F_49539DBA029Dexec_impl*
 with Text do
  if (ExcludeSuper = []) then
   ExcludeSuper := [ev_slFoundWords]
  else
   ExcludeSuper := [];
//#UC END# *4AFD4230031F_49539DBA029Dexec_impl*
end;//TExTextForm.Edit_ToggleFoundWords_Execute

function TExTextForm.Document_GotoPara_Execute(const aPara: Il3TagRef;
 aUserType: Integer): Boolean;
//#UC START# *4AFD4A45003B_49539DBA029Dexec_var*
var
 l_O : InevObject;
//#UC END# *4AFD4A45003B_49539DBA029Dexec_var*
begin
//#UC START# *4AFD4A45003B_49539DBA029Dexec_impl*
 if not CheckParamForUserType(aUserType) then
 begin
  Result := false;
  Exit;
 end;//not CheckParamForUserType(aUserType)
 Result := true;
 if not aPara.AsObject.QT(InevObject, l_O) then
  Assert(false);
 Text.GotoTag(l_O);
//#UC END# *4AFD4A45003B_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GotoPara_Execute

procedure TExTextForm.Document_GotoPara(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_GotoPara_Params) do
  ResultValue := Self.Document_GotoPara_Execute(Para, UserType);
end;//TExTextForm.Document_GotoPara

procedure TExTextForm.TimeMachine_TimeMachineOnOffNew_Test(const aParams: IvcmTestParamsPrim);
 {* �������� ������ ������� }
//#UC START# *4B261EC80086_49539DBA029Dtest_var*
//#UC END# *4B261EC80086_49539DBA029Dtest_var*
begin
//#UC START# *4B261EC80086_49539DBA029Dtest_impl*
 with aParams do
 begin
  Op.Flag[vcm_ofEnabled] := Assigned(Document)
   and (not Document.GetNotTm or DefDataAdapter.TimeMachine.IsOn)
   and not (UserType in [dftAACContentsRight, dftAACContentsLeft]);
  if Op.Flag[vcm_ofEnabled] then
   Op.Flag[vcm_ofChecked] := defDataAdapter.TimeMachine.IsOn;
 end;//with aParams do
//#UC END# *4B261EC80086_49539DBA029Dtest_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOffNew_Test

procedure TExTextForm.TimeMachine_TimeMachineOnOffNew_Execute(const aParams: IvcmExecuteParamsPrim);
 {* �������� ������ ������� }
//#UC START# *4B261EC80086_49539DBA029Dexec_var*
//#UC END# *4B261EC80086_49539DBA029Dexec_var*
begin
//#UC START# *4B261EC80086_49539DBA029Dexec_impl*
 if DefDataAdapter.TimeMachine.IsOn then
  TdmStdRes.OpenTurnOffTimeMachine(InsTurnOffTimeMachine(Self))
 else
  TdmStdRes.OpenTurnOnTimeMachine(InsTurnOnTimeMachine(Self));
//#UC END# *4B261EC80086_49539DBA029Dexec_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOffNew_Execute

procedure TExTextForm.TimeMachine_TimeMachineOnOffNew_GetState(var State: TvcmOperationStateIndex);
 {* �������� ������ ������� }
//#UC START# *4B261EC80086_49539DBA029Dgetstate_var*
//#UC END# *4B261EC80086_49539DBA029Dgetstate_var*
begin
//#UC START# *4B261EC80086_49539DBA029Dgetstate_impl*
 if (Document <> nil) then
 begin
  if not defDataAdapter.TimeMachine.IsOn then
   State := st_user_TimeMachine_TimeMachineOnOffNew_MachineOn
  else
   State := st_user_TimeMachine_TimeMachineOnOffNew_MachineOff;
 end//Document <> nil
 else
  State := vcm_DefaultOperationState;
//#UC END# *4B261EC80086_49539DBA029Dgetstate_impl*
end;//TExTextForm.TimeMachine_TimeMachineOnOffNew_GetState

procedure TExTextForm.Redactions_OpenRedactionListFrmAct_Test(const aParams: IvcmTestParamsPrim);
 {* ������ �������� }
//#UC START# *4B262F9701DE_49539DBA029Dtest_var*
//#UC END# *4B262F9701DE_49539DBA029Dtest_var*
begin
//#UC START# *4B262F9701DE_49539DBA029Dtest_impl*
 EnableRedactionOps(aParams);
//#UC END# *4B262F9701DE_49539DBA029Dtest_impl*
end;//TExTextForm.Redactions_OpenRedactionListFrmAct_Test

procedure TExTextForm.Redactions_OpenRedactionListFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ �������� }
//#UC START# *4B262F9701DE_49539DBA029Dexec_var*
//#UC END# *4B262F9701DE_49539DBA029Dexec_var*
begin
//#UC START# *4B262F9701DE_49539DBA029Dexec_impl*
 OpenRedactionList;
//#UC END# *4B262F9701DE_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_OpenRedactionListFrmAct_Execute

procedure TExTextForm.Redactions_OpenRedactionListFrmAct_GetState(var State: TvcmOperationStateIndex);
 {* ������ �������� }
//#UC START# *4B262F9701DE_49539DBA029Dgetstate_var*
//#UC END# *4B262F9701DE_49539DBA029Dgetstate_var*
begin
//#UC START# *4B262F9701DE_49539DBA029Dgetstate_impl*
 State := vcm_DefaultOperationState;
//#UC END# *4B262F9701DE_49539DBA029Dgetstate_impl*
end;//TExTextForm.Redactions_OpenRedactionListFrmAct_GetState

procedure TExTextForm.Document_GetParaForPositionning_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4B506F4D0196_49539DBA029Dtest_var*
//#UC END# *4B506F4D0196_49539DBA029Dtest_var*
begin
//#UC START# *4B506F4D0196_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (UserType in [dftDocument, dftMedicFirm]);
//#UC END# *4B506F4D0196_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetParaForPositionning_Test

function TExTextForm.Document_GetParaForPositionning_Execute: IeeLeafPara;
//#UC START# *4B506F4D0196_49539DBA029Dexec_var*
//#UC END# *4B506F4D0196_49539DBA029Dexec_var*
begin
//#UC START# *4B506F4D0196_49539DBA029Dexec_impl*
 Result := GetParaForPositionning;
//#UC END# *4B506F4D0196_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetParaForPositionning_Execute

procedure TExTextForm.Document_GetParaForPositionning(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_GetParaForPositionning_Params) do
  ResultValue := Self.Document_GetParaForPositionning_Execute;
end;//TExTextForm.Document_GetParaForPositionning

function TExTextForm.NeedGotoNeighbours: Boolean;
 {* ���� �� ���������� �� ������� ����� }
//#UC START# *4C068AB5026A_49539DBA029D_var*
//#UC END# *4C068AB5026A_49539DBA029D_var*
begin
//#UC START# *4C068AB5026A_49539DBA029D_impl*
 Result := true;
//#UC END# *4C068AB5026A_49539DBA029D_impl*
end;//TExTextForm.NeedGotoNeighbours

procedure TExTextForm.DocumentBlock_GetCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDB3003B_49539DBA029Dtest_var*
//#UC END# *4C2AEDB3003B_49539DBA029Dtest_var*
begin
//#UC START# *4C2AEDB3003B_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := false;
//#UC END# *4C2AEDB3003B_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_GetCorrespondentList_Test

procedure TExTextForm.DocumentBlock_GetCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDB3003B_49539DBA029Dexec_var*
//#UC END# *4C2AEDB3003B_49539DBA029Dexec_var*
begin
//#UC START# *4C2AEDB3003B_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C2AEDB3003B_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_GetCorrespondentList_Execute

procedure TExTextForm.DocumentBlock_GetRespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDC503CC_49539DBA029Dtest_var*
//#UC END# *4C2AEDC503CC_49539DBA029Dtest_var*
begin
//#UC START# *4C2AEDC503CC_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := false;
//#UC END# *4C2AEDC503CC_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_GetRespondentList_Test

procedure TExTextForm.DocumentBlock_GetRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDC503CC_49539DBA029Dexec_var*
//#UC END# *4C2AEDC503CC_49539DBA029Dexec_var*
begin
//#UC START# *4C2AEDC503CC_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C2AEDC503CC_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_GetRespondentList_Execute

procedure TExTextForm.DocumentBlock_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDDA0335_49539DBA029Dtest_var*
var
 l_eeSub: IeeSub;
//#UC END# *4C2AEDDA0335_49539DBA029Dtest_var*
begin
//#UC START# *4C2AEDDA0335_49539DBA029Dtest_impl*
 ExcludeRootSub(aParams);
 if aParams.Op.Flag[vcm_ofEnabled] then
  CorrespondentsToSubTest(aParams);

 if aParams.Op.Flag[vcm_ofChecked] then
 begin
  l_eeSub := ExtractSubFromSubPanel(aParams.Target);
  if l_eeSub.ID <> f_eeSubIdForTypedCorrespondentList then
   aParams.Op.Flag[vcm_ofChecked] := False;
 end;
//#UC END# *4C2AEDDA0335_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_GetTypedCorrespondentList_Test

procedure TExTextForm.DocumentBlock_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDDA0335_49539DBA029Dexec_var*
var
 l_eeSub: IeeSub;
//#UC END# *4C2AEDDA0335_49539DBA029Dexec_var*
begin
//#UC START# *4C2AEDDA0335_49539DBA029Dexec_impl*
 TnsUseDocumentSubPanelOperationEvent.Instance.Log;
 l_eeSub := ExtractSubFromSubPanel(aParams.Target);
 if Assigned(l_eeSub) then
 begin
  f_eeSubIdForTypedCorrespondentList := l_eeSub.ID;
  OpenCRListToPart(crtCorrespondents,
                   bsConvertFilteredCRNode(aParams.CurrentNode),
                   MakePositionListBySub(l_eeSub.ID));
 end;
//#UC END# *4C2AEDDA0335_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_GetTypedCorrespondentList_Execute

procedure TExTextForm.DocumentBlock_GetTypedCorrespondentList_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C2AEDDA0335_49539DBA029Dgetstate_var*
//#UC END# *4C2AEDDA0335_49539DBA029Dgetstate_var*
begin
//#UC START# *4C2AEDDA0335_49539DBA029Dgetstate_impl*
 State := st_user_DocumentBlock_GetTypedCorrespondentList_InText;
//#UC END# *4C2AEDDA0335_49539DBA029Dgetstate_impl*
end;//TExTextForm.DocumentBlock_GetTypedCorrespondentList_GetState

procedure TExTextForm.DocumentBlock_GetTypedRespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C2AEDE7028C_49539DBA029Dtest_var*
//#UC END# *4C2AEDE7028C_49539DBA029Dtest_var*
begin
//#UC START# *4C2AEDE7028C_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := false;
//#UC END# *4C2AEDE7028C_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_GetTypedRespondentList_Test

procedure TExTextForm.DocumentBlock_GetTypedRespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C2AEDE7028C_49539DBA029Dexec_var*
//#UC END# *4C2AEDE7028C_49539DBA029Dexec_var*
begin
//#UC START# *4C2AEDE7028C_49539DBA029Dexec_impl*
 Assert(false, '��� ����������� ��������');
//#UC END# *4C2AEDE7028C_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_GetTypedRespondentList_Execute

procedure TExTextForm.Document_GetAnnotationDocFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AA77E00A3_49539DBA029Dtest_var*
//#UC END# *4C3AA77E00A3_49539DBA029Dtest_var*
begin
//#UC START# *4C3AA77E00A3_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := defDataAdapter.Monitoring.IsExist and
  (ZoneType <> vcm_ztChild) and (Document <> nil) and
  Assigned(dsDocument) and DocumentSet.HasAnnotation
//#UC END# *4C3AA77E00A3_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetAnnotationDocFrmAct_Test

procedure TExTextForm.Document_GetAnnotationDocFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AA77E00A3_49539DBA029Dexec_var*
//#UC END# *4C3AA77E00A3_49539DBA029Dexec_var*
begin
//#UC START# *4C3AA77E00A3_49539DBA029Dexec_impl*
 // - ������ �� ������, �.�. ��� FormActivate
//#UC END# *4C3AA77E00A3_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetAnnotationDocFrmAct_Execute

procedure TExTextForm.Document_SimilarDocuments_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AA78E024D_49539DBA029Dtest_var*
//#UC END# *4C3AA78E024D_49539DBA029Dtest_var*
begin
//#UC START# *4C3AA78E024D_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (dsDocument <> nil) and dsDocument.HasSimilarDocuments;
//#UC END# *4C3AA78E024D_49539DBA029Dtest_impl*
end;//TExTextForm.Document_SimilarDocuments_Test

procedure TExTextForm.Document_SimilarDocuments_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AA78E024D_49539DBA029Dexec_var*
//#UC END# *4C3AA78E024D_49539DBA029Dexec_var*
begin
//#UC START# *4C3AA78E024D_49539DBA029Dexec_impl*
 if (dsDocument <> nil) then
  dsDocument.OpenSimilarDocuments;
//#UC END# *4C3AA78E024D_49539DBA029Dexec_impl*
end;//TExTextForm.Document_SimilarDocuments_Execute

procedure TExTextForm.DocumentBlockHeader_UserCR1_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ADF860163_49539DBA029Dtest_var*
//#UC END# *4C3ADF860163_49539DBA029Dtest_var*
begin
//#UC START# *4C3ADF860163_49539DBA029Dtest_impl*
 DisableOperation(aParams);
 // http://mdp.garant.ru/pages/viewpage.action?pageId=273590436
 {CheckIsDocumentSub(aParams);
 if aParams.Op.Flag[vcm_ofEnabled] and Assigned(dsDocument) then
  with DocumentSet.UserCRListInfo[ulFirst] do
  begin
   aParams.Op.Flag[vcm_ofEnabled] := Has;
   if Has then
   begin
    aParams.Op.Flag[vcm_ofEnabled] := Has;
    aParams.Op.Hint := vcmFmt(vcmCStr(str_CorrespondetsDocumentSuffix),
     [Caption]);
    aParams.Op.Caption := vcmFmt(vcmCStr(str_CorrespondetsDocumentSuffix),
     [Caption]);
   end//UserCRListInfo[ulFirst].ListType <> crtNone
   else
    aParams.Op.Hint := nil;
  end//with DocumentSet
 else
  aParams.Op.Flag[vcm_ofEnabled] := False;
 aParams.Op.Flag[vcm_ofChecked] := False;}
//#UC END# *4C3ADF860163_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR1_Test

procedure TExTextForm.DocumentBlockHeader_UserCR1_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ADF860163_49539DBA029Dexec_var*
//#UC END# *4C3ADF860163_49539DBA029Dexec_var*
begin
//#UC START# *4C3ADF860163_49539DBA029Dexec_impl*
 TnsUseDocumentSubPanelOperationEvent.Instance.Log;
//#UC END# *4C3ADF860163_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR1_Execute

procedure TExTextForm.DocumentBlockHeader_UserCR1_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3ADF860163_49539DBA029Dgetstate_var*
//#UC END# *4C3ADF860163_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3ADF860163_49539DBA029Dgetstate_impl*
 if (dsDocument <> nil) then
 begin
  if (DocumentSet.UserCRListInfo[ulFirst].ListType = crtCorrespondents) then
   State := st_user_DocumentBlockHeader_UserCR1_Corr
  else
   State := vcm_DefaultOperationState;
 end//dsDocument <> nil
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3ADF860163_49539DBA029Dgetstate_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR1_GetState

procedure TExTextForm.DocumentBlockHeader_UserCR2_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ADF950028_49539DBA029Dtest_var*
//#UC END# *4C3ADF950028_49539DBA029Dtest_var*
begin
//#UC START# *4C3ADF950028_49539DBA029Dtest_impl*
 DisableOperation(aParams);
 // http://mdp.garant.ru/pages/viewpage.action?pageId=273590436
 {CheckIsDocumentSub(aParams);
 if aParams.Op.Flag[vcm_ofEnabled] and Assigned(dsDocument) then
  with DocumentSet.UserCRListInfo[ulSecond] do
  begin
   aParams.Op.Flag[vcm_ofEnabled] := Has;
   if Has then
   begin
    aParams.Op.Hint := vcmFmt(vcmCStr(str_CorrespondetsDocumentSuffix),
     [Caption]);
    aParams.Op.Caption := vcmFmt(vcmCStr(str_CorrespondetsDocumentSuffix),
     [Caption]);
   end//UserCRSheetTypes[ulSecond] <> crtNone
   else
    aParams.Op.Hint := nil;
  end//with DocumentSet
 else
  aParams.Op.Flag[vcm_ofEnabled] := False;
 aParams.Op.Flag[vcm_ofChecked] := False;}
//#UC END# *4C3ADF950028_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR2_Test

procedure TExTextForm.DocumentBlockHeader_UserCR2_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ADF950028_49539DBA029Dexec_var*
//#UC END# *4C3ADF950028_49539DBA029Dexec_var*
begin
//#UC START# *4C3ADF950028_49539DBA029Dexec_impl*
 TnsUseDocumentSubPanelOperationEvent.Instance.Log;
//#UC END# *4C3ADF950028_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR2_Execute

procedure TExTextForm.DocumentBlockHeader_UserCR2_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3ADF950028_49539DBA029Dgetstate_var*
//#UC END# *4C3ADF950028_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3ADF950028_49539DBA029Dgetstate_impl*
 if (dsDocument <> nil) then
 begin
  if (DocumentSet.UserCRListInfo[ulSecond].ListType = crtCorrespondents) then
   State := st_user_DocumentBlockHeader_UserCR2_Corr
  else
   State := vcm_DefaultOperationState;
 end//dsDocument <> nil
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3ADF950028_49539DBA029Dgetstate_impl*
end;//TExTextForm.DocumentBlockHeader_UserCR2_GetState

procedure TExTextForm.DocumentBlockHeader_GetTypedCorrespondentList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ADFA5018F_49539DBA029Dtest_var*
//#UC END# *4C3ADFA5018F_49539DBA029Dtest_var*
begin
//#UC START# *4C3ADFA5018F_49539DBA029Dtest_impl*
 CheckIsDocumentSub(aParams);
 aParams.Op.Flag[vcm_ofChecked] := False;
 if aParams.Op.Flag[vcm_ofEnabled] then
  CorrespondentsToSubTest(aParams);
//#UC END# *4C3ADFA5018F_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_GetTypedCorrespondentList_Test

procedure TExTextForm.DocumentBlockHeader_GetTypedCorrespondentList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ADFA5018F_49539DBA029Dexec_var*
//#UC END# *4C3ADFA5018F_49539DBA029Dexec_var*
begin
//#UC START# *4C3ADFA5018F_49539DBA029Dexec_impl*
 Document_GetCorrespondentListExFrmAct_Execute(aParams);
 TnsUseDocumentSubPanelOperationEvent.Instance.Log;
//#UC END# *4C3ADFA5018F_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_GetTypedCorrespondentList_Execute

procedure TExTextForm.Redactions_PrevRedaction_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AE0950253_49539DBA029Dtest_var*
//#UC END# *4C3AE0950253_49539DBA029Dtest_var*
begin
//#UC START# *4C3AE0950253_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (ViewArea <> nil) and ViewArea.HasPrevRedaction;
//#UC END# *4C3AE0950253_49539DBA029Dtest_impl*
end;//TExTextForm.Redactions_PrevRedaction_Test

procedure TExTextForm.Redactions_PrevRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AE0950253_49539DBA029Dexec_var*
//#UC END# *4C3AE0950253_49539DBA029Dexec_var*
begin
//#UC START# *4C3AE0950253_49539DBA029Dexec_impl*
 // ��������� ���������� ��������
 ReloadRedaction(crtPrevious);
//#UC END# *4C3AE0950253_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_PrevRedaction_Execute

procedure TExTextForm.Redactions_NextRedaction_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AE0CD0079_49539DBA029Dtest_var*
//#UC END# *4C3AE0CD0079_49539DBA029Dtest_var*
begin
//#UC START# *4C3AE0CD0079_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (ViewArea <> nil) and
  ViewArea.HasNextRedaction;
//#UC END# *4C3AE0CD0079_49539DBA029Dtest_impl*
end;//TExTextForm.Redactions_NextRedaction_Test

procedure TExTextForm.Redactions_NextRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AE0CD0079_49539DBA029Dexec_var*
//#UC END# *4C3AE0CD0079_49539DBA029Dexec_var*
begin
//#UC START# *4C3AE0CD0079_49539DBA029Dexec_impl*
 // ��������� ��������� ��������
 ReloadRedaction(crtNext);
//#UC END# *4C3AE0CD0079_49539DBA029Dexec_impl*
end;//TExTextForm.Redactions_NextRedaction_Execute

procedure TExTextForm.Text_AddToControl_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AFAD90234_49539DBA029Dtest_var*
//#UC END# *4C3AFAD90234_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFAD90234_49539DBA029Dtest_impl*
 Document_AddToControl_Test(aParams);
//#UC END# *4C3AFAD90234_49539DBA029Dtest_impl*
end;//TExTextForm.Text_AddToControl_Test

procedure TExTextForm.Text_AddToControl_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AFAD90234_49539DBA029Dexec_var*
//#UC END# *4C3AFAD90234_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFAD90234_49539DBA029Dexec_impl*
 Document_AddToControl_Execute(aParams);
//#UC END# *4C3AFAD90234_49539DBA029Dexec_impl*
end;//TExTextForm.Text_AddToControl_Execute

procedure TExTextForm.Text_AddToControl_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3AFAD90234_49539DBA029Dgetstate_var*
var
 l_Controllable : IControllable;
//#UC END# *4C3AFAD90234_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3AFAD90234_49539DBA029Dgetstate_impl*
 if Supports(Document, IControllable, l_Controllable) then
  try
   if l_Controllable.GetControlled then
    State := st_user_Text_AddToControl_RemoveFromControl
   else
    State := vcm_DefaultOperationState;
  finally
   l_Controllable := nil;
  end;//try..finally
//#UC END# *4C3AFAD90234_49539DBA029Dgetstate_impl*
end;//TExTextForm.Text_AddToControl_GetState

procedure TExTextForm.Selection_ShowCorrespondentListToPart_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AFB450234_49539DBA029Dtest_var*
//#UC END# *4C3AFB450234_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFB450234_49539DBA029Dtest_impl*
 CRToPartTest(aParams, crtCorrespondents);
//#UC END# *4C3AFB450234_49539DBA029Dtest_impl*
end;//TExTextForm.Selection_ShowCorrespondentListToPart_Test

procedure TExTextForm.Selection_ShowCorrespondentListToPart_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AFB450234_49539DBA029Dexec_var*
//#UC END# *4C3AFB450234_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFB450234_49539DBA029Dexec_impl*
 CRToPartExecute(aParams, crtCorrespondents);
//#UC END# *4C3AFB450234_49539DBA029Dexec_impl*
end;//TExTextForm.Selection_ShowCorrespondentListToPart_Execute

procedure TExTextForm.Selection_ShowRespondentListToPart_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AFB51020D_49539DBA029Dtest_var*
//#UC END# *4C3AFB51020D_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFB51020D_49539DBA029Dtest_impl*
 CRToPartTest(aParams, crtRespondents);
//#UC END# *4C3AFB51020D_49539DBA029Dtest_impl*
end;//TExTextForm.Selection_ShowRespondentListToPart_Test

procedure TExTextForm.Selection_ShowRespondentListToPart_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AFB51020D_49539DBA029Dexec_var*
//#UC END# *4C3AFB51020D_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFB51020D_49539DBA029Dexec_impl*
 CRToPartExecute(aParams, crtRespondents);
//#UC END# *4C3AFB51020D_49539DBA029Dexec_impl*
end;//TExTextForm.Selection_ShowRespondentListToPart_Execute

procedure TExTextForm.WarnOnControl_ClearStatusSettings_Test(const aParams: IvcmTestParamsPrim);
 {* ������ ������ ������� "�������" }
//#UC START# *4C3AFBA702E4_49539DBA029Dtest_var*
var
 l_Strings : IvcmStrings;
 l_StringsSource: InsStringsSource;
//#UC END# *4C3AFBA702E4_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFBA702E4_49539DBA029Dtest_impl*
 l_Strings := aParams.Op.SubItems;
 if (l_Strings = nil) then
  Exit;
 if (l_Strings.Count = 0) and
  Supports(f_ControlMap, InsStringsSource, l_StringsSource) then
 try
  l_StringsSource.FillStrings(l_Strings);
 finally
  l_StringsSource := nil;
 end;//try..finally
 aParams.Op.SelectedString := f_ControlMap.
  ValueToDisplayName(afw.Settings.LoadString(pi_DropChangeStatus, dv_DropChangeStatus));
//#UC END# *4C3AFBA702E4_49539DBA029Dtest_impl*
end;//TExTextForm.WarnOnControl_ClearStatusSettings_Test

procedure TExTextForm.WarnOnControl_ClearStatusSettings_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ ������ ������� "�������" }
//#UC START# *4C3AFBA702E4_49539DBA029Dexec_var*
var l_Str: Il3CString;
//#UC END# *4C3AFBA702E4_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFBA702E4_49539DBA029Dexec_impl*
 l_Str := f_ControlMap.DisplayNameToValue(aParams.SelectedString);
 if not l3Same(afw.Settings.LoadString(pi_DropChangeStatus, dv_DropChangeStatus), l_Str) then
 begin
  afw.Settings.SaveString(pi_DropChangeStatus, l_Str);
  CheckControllableState([dcsAfterReview, dcsExitFromSystem]);
 end;//if GetString(pi_DropChangeStatus,
//#UC END# *4C3AFBA702E4_49539DBA029Dexec_impl*
end;//TExTextForm.WarnOnControl_ClearStatusSettings_Execute

procedure TExTextForm.TasksPanel_TimeMachineOnOff_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3AFC1302FF_49539DBA029Dtest_var*
//#UC END# *4C3AFC1302FF_49539DBA029Dtest_var*
begin
//#UC START# *4C3AFC1302FF_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := Assigned(Document) and
  (not Document.GetNotTm or DefDataAdapter.TimeMachine.IsOn);
//#UC END# *4C3AFC1302FF_49539DBA029Dtest_impl*
end;//TExTextForm.TasksPanel_TimeMachineOnOff_Test

procedure TExTextForm.TasksPanel_TimeMachineOnOff_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3AFC1302FF_49539DBA029Dexec_var*
var
 l_Date: Il3CString;
//#UC END# *4C3AFC1302FF_49539DBA029Dexec_var*
begin
//#UC START# *4C3AFC1302FF_49539DBA029Dexec_impl*
 if DefDataAdapter.TimeMachine.IsOn then
  TimeMachineOnOff
 else
 begin
  l_Date := vcmSelectDate(l3CStr(vcmConstString(
   str_CalendarCaptionTimeMachineOn)), nil);
  if not l3IsNil(l_Date) then
   TurnOnTimeMachine(l_Date);
 end;//if DefDataAdapter.TimeMachine.IsOn then
//#UC END# *4C3AFC1302FF_49539DBA029Dexec_impl*
end;//TExTextForm.TasksPanel_TimeMachineOnOff_Execute

procedure TExTextForm.TasksPanel_TimeMachineOnOff_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3AFC1302FF_49539DBA029Dgetstate_var*
//#UC END# *4C3AFC1302FF_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3AFC1302FF_49539DBA029Dgetstate_impl*
 if DefDataAdapter.TimeMachine.IsOn then
  State := st_user_TasksPanel_TimeMachineOnOff_Off
 else
  State := st_user_TasksPanel_TimeMachineOnOff_On;
//#UC END# *4C3AFC1302FF_49539DBA029Dgetstate_impl*
end;//TExTextForm.TasksPanel_TimeMachineOnOff_GetState

procedure TExTextForm.DocumentBlockHeader_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B17DC02C4_49539DBA029Dtest_var*
//#UC END# *4C3B17DC02C4_49539DBA029Dtest_var*
begin
//#UC START# *4C3B17DC02C4_49539DBA029Dtest_impl*
 DisableOperation(aParams);
 // http://mdp.garant.ru/pages/viewpage.action?pageId=469280508
 //CheckIsDocumentSub(aParams);
//#UC END# *4C3B17DC02C4_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_AddBookmark_Test

procedure TExTextForm.DocumentBlockHeader_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B17DC02C4_49539DBA029Dexec_var*
//#UC END# *4C3B17DC02C4_49539DBA029Dexec_var*
begin
//#UC START# *4C3B17DC02C4_49539DBA029Dexec_impl*
 DocumentBlockBookmarks_AddBookmark_Execute(aParams);
//#UC END# *4C3B17DC02C4_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_AddBookmark_Execute

procedure TExTextForm.DocumentBlockHeader_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B17ED0192_49539DBA029Dtest_var*
//#UC END# *4C3B17ED0192_49539DBA029Dtest_var*
begin
//#UC START# *4C3B17ED0192_49539DBA029Dtest_impl*
// DisableOperation(aParams);
 // http://mdp.garant.ru/pages/viewpage.action?pageId=273590436
 CheckIsDocumentSub(aParams);
 if aParams.Op.Flag[vcm_ofEnabled] then
  //NotEmptyDocumentWithTrialModeTest(aParams);
  NotEmptyDocumentTest(aParams);
 TnsToMSWordOp.Test(aParams);
//#UC END# *4C3B17ED0192_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_ToMSWord_Test

procedure TExTextForm.DocumentBlockHeader_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B17ED0192_49539DBA029Dexec_var*
const
 cMap: array [Boolean] of TnsExportKind = (ekShell, ekActiveWord);
//#UC END# *4C3B17ED0192_49539DBA029Dexec_var*
begin
//#UC START# *4C3B17ED0192_49539DBA029Dexec_impl*
 DocumentExport(cMap[aParams.ItemIndex > 1], False);
 TnsUseDocumentSubPanelOperationEvent.Instance.Log;
//#UC END# *4C3B17ED0192_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_ToMSWord_Execute

procedure TExTextForm.DocumentBlockHeader_Print_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B17FF03D2_49539DBA029Dtest_var*
//#UC END# *4C3B17FF03D2_49539DBA029Dtest_var*
begin
//#UC START# *4C3B17FF03D2_49539DBA029Dtest_impl*
// DisableOperation(aParams);
 // http://mdp.garant.ru/pages/viewpage.action?pageId=273590436
 File_Print_Test(aParams);
 //nsDisableOperationInTrialMode(aParams);
 CheckIsDocumentSub(aParams);
//#UC END# *4C3B17FF03D2_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_Print_Test

procedure TExTextForm.DocumentBlockHeader_Print_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B17FF03D2_49539DBA029Dexec_var*
//#UC END# *4C3B17FF03D2_49539DBA029Dexec_var*
begin
//#UC START# *4C3B17FF03D2_49539DBA029Dexec_impl*
 DocumentPrint;
 TnsUseDocumentSubPanelOperationEvent.Instance.Log;
//#UC END# *4C3B17FF03D2_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_Print_Execute

procedure TExTextForm.DocumentBlockHeader_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B180E038F_49539DBA029Dtest_var*
//#UC END# *4C3B180E038F_49539DBA029Dtest_var*
begin
//#UC START# *4C3B180E038F_49539DBA029Dtest_impl*
// DisableOperation(aParams);
 // http://mdp.garant.ru/pages/viewpage.action?pageId=273590436
 File_Print_Test(aParams);
 //nsDisableOperationInTrialMode(aParams);
 CheckIsDocumentSub(aParams);
//#UC END# *4C3B180E038F_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockHeader_PrintDialog_Test

procedure TExTextForm.DocumentBlockHeader_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B180E038F_49539DBA029Dexec_var*
var
 l_Preview: IafwComplexDocumentPreview;
//#UC END# *4C3B180E038F_49539DBA029Dexec_var*
begin
//#UC START# *4C3B180E038F_49539DBA029Dexec_impl*
 if (afw.Application <> nil) AND (afw.Application.PrintManager <> nil) then
 begin
  l_Preview := MakePreview;
  try
   afw.Application.PrintManager.PrintDialog(l_Preview);
   TnsUseDocumentSubPanelOperationEvent.Instance.Log;
  finally
   l_Preview := nil;
  end;//try..finally
 end;//if (afw.Application <> nil) AND...
//#UC END# *4C3B180E038F_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockHeader_PrintDialog_Execute

procedure TExTextForm.DocumentBlockBookmarks_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
 {* ���������� �������� �� �������� }
//#UC START# *4C3B1AEA0127_49539DBA029Dtest_var*
//#UC END# *4C3B1AEA0127_49539DBA029Dtest_var*
begin
//#UC START# *4C3B1AEA0127_49539DBA029Dtest_impl*
 // http://mdp.garant.ru/pages/viewpage.action?pageId=469280508
 DisableOperation(aParams);
//#UC END# *4C3B1AEA0127_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlockBookmarks_AddBookmark_Test

procedure TExTextForm.DocumentBlockBookmarks_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ���������� �������� �� �������� }
//#UC START# *4C3B1AEA0127_49539DBA029Dexec_var*
var
 l_eeSub: IeeSub;
//#UC END# *4C3B1AEA0127_49539DBA029Dexec_var*
begin
//#UC START# *4C3B1AEA0127_49539DBA029Dexec_impl*
 if (Document <> nil) and
    Supports(aParams.Target, IeeSub, l_eeSub) and
    (l_eeSub.LayerID = Ord(ev_sbtSub)) then
 begin
  AddBookmark(l_eeSub.LeafPara);
  TnsUseDocumentSubPanelOperationEvent.Instance.Log;
 end;//Document <> nil..
//#UC END# *4C3B1AEA0127_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlockBookmarks_AddBookmark_Execute

procedure TExTextForm.DocumentBlock_ToMSWord_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1AFB0270_49539DBA029Dtest_var*
//#UC END# *4C3B1AFB0270_49539DBA029Dtest_var*
begin
//#UC START# *4C3B1AFB0270_49539DBA029Dtest_impl*
 DisableOperation(aParams);
 // http://mdp.garant.ru/pages/viewpage.action?pageId=273590436
 {ExcludeRootSub(aParams);
 nsDisableOperationInTrialMode(aParams);
 TnsToMSWordOp.Test(aParams);}
//#UC END# *4C3B1AFB0270_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_ToMSWord_Test

procedure TExTextForm.DocumentBlock_ToMSWord_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1AFB0270_49539DBA029Dexec_var*
//#UC END# *4C3B1AFB0270_49539DBA029Dexec_var*
begin
//#UC START# *4C3B1AFB0270_49539DBA029Dexec_impl*
 Assert(False);
 //TnsUseDocumentSubPanelOperationEvent.Instance.Log;
 //ExportBlock(ExtractRangeFromSubPanel(aParams), aParams.ItemIndex > 1);
//#UC END# *4C3B1AFB0270_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_ToMSWord_Execute

procedure TExTextForm.DocumentBlock_PrintDialog_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1B0F0237_49539DBA029Dtest_var*
//#UC END# *4C3B1B0F0237_49539DBA029Dtest_var*
begin
//#UC START# *4C3B1B0F0237_49539DBA029Dtest_impl*
 DisableOperation(aParams);
 // http://mdp.garant.ru/pages/viewpage.action?pageId=273590436
 {ExcludeRootSub(aParams);
 nsDisableOperationInTrialMode(aParams);}
//#UC END# *4C3B1B0F0237_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_PrintDialog_Test

procedure TExTextForm.DocumentBlock_PrintDialog_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1B0F0237_49539DBA029Dexec_var*
//#UC END# *4C3B1B0F0237_49539DBA029Dexec_var*
begin
//#UC START# *4C3B1B0F0237_49539DBA029Dexec_impl*
 Assert(False);
 //TnsUseDocumentSubPanelOperationEvent.Instance.Log;
 //PrintDialogBlock(ExtractRangeFromSubPanel(aParams));
//#UC END# *4C3B1B0F0237_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_PrintDialog_Execute

procedure TExTextForm.DocumentBlock_Copy_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B1B1D003C_49539DBA029Dtest_var*
//#UC END# *4C3B1B1D003C_49539DBA029Dtest_var*
begin
//#UC START# *4C3B1B1D003C_49539DBA029Dtest_impl*
 DisableOperation(aParams);
 // http://mdp.garant.ru/pages/viewpage.action?pageId=273590436
 {ExcludeRootSub(aParams);
 nsDisableOperationInTrialMode(aParams);}
//#UC END# *4C3B1B1D003C_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_Copy_Test

procedure TExTextForm.DocumentBlock_Copy_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B1B1D003C_49539DBA029Dexec_var*
//#UC END# *4C3B1B1D003C_49539DBA029Dexec_var*
begin
//#UC START# *4C3B1B1D003C_49539DBA029Dexec_impl*
 Assert(False);
 //TnsUseDocumentSubPanelOperationEvent.Instance.Log;
 //CopyBlock(ExtractRangeFromSubPanel(aParams));
//#UC END# *4C3B1B1D003C_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_Copy_Execute

procedure TExTextForm.DocumentBlock_Print_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B241401AA_49539DBA029Dtest_var*
//#UC END# *4C3B241401AA_49539DBA029Dtest_var*
begin
//#UC START# *4C3B241401AA_49539DBA029Dtest_impl*
 DisableOperation(aParams);
//#UC END# *4C3B241401AA_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_Print_Test

procedure TExTextForm.DocumentBlock_Print_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B241401AA_49539DBA029Dexec_var*
//#UC END# *4C3B241401AA_49539DBA029Dexec_var*
begin
//#UC START# *4C3B241401AA_49539DBA029Dexec_impl*
 Assert(false, '�� ����������');
//#UC END# *4C3B241401AA_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_Print_Execute

procedure TExTextForm.Document_OpenContentsFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B3754034D_49539DBA029Dtest_var*
//#UC END# *4C3B3754034D_49539DBA029Dtest_var*
begin
//#UC START# *4C3B3754034D_49539DBA029Dtest_impl*
 if Assigned(Aggregate) then
 begin
  // ���� �� � ��������� ����������
  if (DocumentWithContents <> nil) then
  begin
   aParams.Op.Flag[vcm_ofEnabled] := (DocumentWithContents.dsContents <> nil)
                                     and not DocumentWithContents.dsContents.Empty
   // begin - http://mdp.garant.ru/pages/viewpage.action?pageId=342331306
                                     or (Text.TextSource.ContentsTree <> nil) and (Text.TextSource.ContentsTree.CountView > 0);
   // end - http://mdp.garant.ru/pages/viewpage.action?pageId=342331306
   if aParams.Op.Flag[vcm_ofEnabled] then
    if Op_Contents_IsContentsVisible.Call(Aggregate) then
     aParams.Op.Flag[vcm_ofChecked] := true;
  end//DocumentWithContents <> nil
  else
   aParams.Op.Flag[vcm_ofEnabled] := false;
 end;//Assigned(Aggregate)
//#UC END# *4C3B3754034D_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenContentsFrmAct_Test

procedure TExTextForm.Document_OpenContentsFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B3754034D_49539DBA029Dexec_var*
//#UC END# *4C3B3754034D_49539DBA029Dexec_var*
begin
//#UC START# *4C3B3754034D_49539DBA029Dexec_impl*
 if not Op_Contents_ToggleContentsVisibility.Call(Aggregate) then
  OpenContents(ns_comForce);
//#UC END# *4C3B3754034D_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenContentsFrmAct_Execute

procedure TExTextForm.Document_OpenContentsFrmAct_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3B3754034D_49539DBA029Dgetstate_var*
//#UC END# *4C3B3754034D_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3B3754034D_49539DBA029Dgetstate_impl*
 if (UserType = dftDrug) then
  State := st_user_Document_OpenContentsFrmAct_Drug
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3B3754034D_49539DBA029Dgetstate_impl*
end;//TExTextForm.Document_OpenContentsFrmAct_GetState

procedure TExTextForm.Document_ShowDocumentPicture_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B3792000E_49539DBA029Dtest_var*
//#UC END# *4C3B3792000E_49539DBA029Dtest_var*
begin
//#UC START# *4C3B3792000E_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := afw.Application.IsInternal;
//#UC END# *4C3B3792000E_49539DBA029Dtest_impl*
end;//TExTextForm.Document_ShowDocumentPicture_Test

procedure TExTextForm.Document_ShowDocumentPicture_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B3792000E_49539DBA029Dexec_var*
//#UC END# *4C3B3792000E_49539DBA029Dexec_var*
begin
//#UC START# *4C3B3792000E_49539DBA029Dexec_impl*
 if afw.Application.IsInternal then
  try
   DefDataAdapter.CommonInterfaces.ShowPicturesOnNumber(Document.GetInternalId);
  except
   on EWorkingParamsNotFound do
    Say(err_ShowPictureInvalidParams);
   on EExternalApplicationError do ;
  end;
//#UC END# *4C3B3792000E_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ShowDocumentPicture_Execute

procedure TExTextForm.ExternalObject_Open_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B49DB03BC_49539DBA029Dtest_var*
var
 l_eeHotSpot: IeeHotSpot;
//#UC END# *4C3B49DB03BC_49539DBA029Dtest_var*
begin
//#UC START# *4C3B49DB03BC_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) and
  (l_eeHotSpot.Hyperlink <> nil) and (l_eeHotSpot.Hyperlink.Address{$IfDef XE4}.rTafwAddress{$EndIf}.TypeID = CI_BLOB);
//#UC END# *4C3B49DB03BC_49539DBA029Dtest_impl*
end;//TExTextForm.ExternalObject_Open_Test

procedure TExTextForm.ExternalObject_Open_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B49DB03BC_49539DBA029Dexec_var*
var
 l_HotSpot: IeeHotSpot;
//#UC END# *4C3B49DB03BC_49539DBA029Dexec_var*
begin
//#UC START# *4C3B49DB03BC_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeHotSpot, l_HotSpot) and (l_HotSpot.Hyperlink <> nil) then
  nsProcessHyperLink(l_HotSpot.Hyperlink, False, Self, Aggregate, Document);
//#UC END# *4C3B49DB03BC_49539DBA029Dexec_impl*
end;//TExTextForm.ExternalObject_Open_Execute

procedure TExTextForm.ExternalObject_Save_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B49EA00C4_49539DBA029Dtest_var*
//#UC END# *4C3B49EA00C4_49539DBA029Dtest_var*
begin
//#UC START# *4C3B49EA00C4_49539DBA029Dtest_impl*
 ExternalObject_Open_Test(aParams);
//#UC END# *4C3B49EA00C4_49539DBA029Dtest_impl*
end;//TExTextForm.ExternalObject_Save_Test

procedure TExTextForm.ExternalObject_Save_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B49EA00C4_49539DBA029Dexec_var*
var
 l_HotSpot: IeeHotSpot;
//#UC END# *4C3B49EA00C4_49539DBA029Dexec_var*
begin
//#UC START# *4C3B49EA00C4_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeHotSpot, l_HotSpot) and (l_HotSpot.Hyperlink <> nil) then
 try
  nsSaveHyperLinkExternalObject(l_HotSpot.Hyperlink, Self, Document);
 finally
  l_HotSpot := nil;
 end;//if Supports(aParams.Target, IeeHotSpot, l_HotSpot) and
//#UC END# *4C3B49EA00C4_49539DBA029Dexec_impl*
end;//TExTextForm.ExternalObject_Save_Execute

procedure TExTextForm.WarnRedaction_OpenActualRedaction_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B4A7D029B_49539DBA029Dtest_var*
//#UC END# *4C3B4A7D029B_49539DBA029Dtest_var*
begin
//#UC START# *4C3B4A7D029B_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := FormIsMainInDocumentSet;
//#UC END# *4C3B4A7D029B_49539DBA029Dtest_impl*
end;//TExTextForm.WarnRedaction_OpenActualRedaction_Test

procedure TExTextForm.WarnRedaction_OpenActualRedaction_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B4A7D029B_49539DBA029Dexec_var*
//#UC END# *4C3B4A7D029B_49539DBA029Dexec_var*
begin
//#UC START# *4C3B4A7D029B_49539DBA029Dexec_impl*
 if Assigned(ViewArea) and
    not TdmStdRes.IsCurEditionActual(ViewArea.DocInfo.Doc) then
  SetActualRedaction;
//#UC END# *4C3B4A7D029B_49539DBA029Dexec_impl*
end;//TExTextForm.WarnRedaction_OpenActualRedaction_Execute

procedure TExTextForm.WarnTimeMachine_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B500B0126_49539DBA029Dtest_var*
//#UC END# *4C3B500B0126_49539DBA029Dtest_var*
begin
//#UC START# *4C3B500B0126_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := Assigned(dsDocument) and
  Assigned(DocumentSet) and
  DocumentSet.HasTimeMachineWarning;
//#UC END# *4C3B500B0126_49539DBA029Dtest_impl*
end;//TExTextForm.WarnTimeMachine_ShowInfo_Test

procedure TExTextForm.WarnTimeMachine_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B500B0126_49539DBA029Dexec_var*
//#UC END# *4C3B500B0126_49539DBA029Dexec_var*
begin
//#UC START# *4C3B500B0126_49539DBA029Dexec_impl*
 ShowWarningPage(true{false{True}, cTimeMachineWarningSub);
              // ^ - ������� ������ ���������, ���� �������� � ������
              // http://mdp.garant.ru/pages/viewpage.action?pageId=266898633&focusedCommentId=285508953#comment-285508953
              // � ��� � ���� "�����" - http://mdp.garant.ru/pages/viewpage.action?pageId=287219564
//#UC END# *4C3B500B0126_49539DBA029Dexec_impl*
end;//TExTextForm.WarnTimeMachine_ShowInfo_Execute

procedure TExTextForm.WarnTimeMachine_ShowInfo_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3B500B0126_49539DBA029Dgetstate_var*
var l_Form: IvcmEntityForm;
//#UC END# *4C3B500B0126_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3B500B0126_49539DBA029Dgetstate_impl*
 if Assigned(Aggregate) and Aggregate.HasForm(fm_WarningForm.rFormID, @l_Form) and
  l_Form.IsActiveInParent then
  State := st_user_WarnTimeMachine_ShowInfo_Hide
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3B500B0126_49539DBA029Dgetstate_impl*
end;//TExTextForm.WarnTimeMachine_ShowInfo_GetState

procedure TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B504A0202_49539DBA029Dtest_var*
//#UC END# *4C3B504A0202_49539DBA029Dtest_var*
begin
//#UC START# *4C3B504A0202_49539DBA029Dtest_impl*
 // - ������ �� ������
//#UC END# *4C3B504A0202_49539DBA029Dtest_impl*
end;//TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_Test

procedure TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B504A0202_49539DBA029Dexec_var*
//#UC END# *4C3B504A0202_49539DBA029Dexec_var*
begin
//#UC START# *4C3B504A0202_49539DBA029Dexec_impl*
 TimeMachine_TimeMachineOnOffNew_Execute(aParams);
//#UC END# *4C3B504A0202_49539DBA029Dexec_impl*
end;//TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_Execute

procedure TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3B504A0202_49539DBA029Dgetstate_var*
//#UC END# *4C3B504A0202_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3B504A0202_49539DBA029Dgetstate_impl*
 TimeMachine_TimeMachineOnOffNew_GetState(State);
//#UC END# *4C3B504A0202_49539DBA029Dgetstate_impl*
end;//TExTextForm.WarnTimeMachine_TimeMachineOnOffNew_GetState

procedure TExTextForm.WarnJuror_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3B52D6021F_49539DBA029Dtest_var*
//#UC END# *4C3B52D6021F_49539DBA029Dtest_var*
begin
//#UC START# *4C3B52D6021F_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := FormIsMainInDocumentSet;
//#UC END# *4C3B52D6021F_49539DBA029Dtest_impl*
end;//TExTextForm.WarnJuror_ShowInfo_Test

procedure TExTextForm.WarnJuror_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3B52D6021F_49539DBA029Dexec_var*
//#UC END# *4C3B52D6021F_49539DBA029Dexec_var*
begin
//#UC START# *4C3B52D6021F_49539DBA029Dexec_impl*
 ShowWarningPage(true{false{True}, cSimpleWarningSub);
              // ^ - ������� ������ ���������, ���� �������� � ������
              // http://mdp.garant.ru/pages/viewpage.action?pageId=266898633&focusedCommentId=285508953#comment-285508953
              // � ��� � ���� "�����" - http://mdp.garant.ru/pages/viewpage.action?pageId=287219564
//#UC END# *4C3B52D6021F_49539DBA029Dexec_impl*
end;//TExTextForm.WarnJuror_ShowInfo_Execute

procedure TExTextForm.WarnJuror_ShowInfo_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3B52D6021F_49539DBA029Dgetstate_var*
var l_Form: IvcmEntityForm;
//#UC END# *4C3B52D6021F_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3B52D6021F_49539DBA029Dgetstate_impl*
 if Assigned(Aggregate) and Aggregate.HasForm(fm_WarningForm.rFormID, @l_Form) and
  l_Form.IsActiveInParent then
  State := st_user_WarnJuror_ShowInfo_Hide
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C3B52D6021F_49539DBA029Dgetstate_impl*
end;//TExTextForm.WarnJuror_ShowInfo_GetState

procedure TExTextForm.WarnOnControl_ShowChanges_Test(const aParams: IvcmTestParamsPrim);
 {* �������� ��������� }
//#UC START# *4C3B5337022E_49539DBA029Dtest_var*
var
 l_Controllable : IControllable;
//#UC END# *4C3B5337022E_49539DBA029Dtest_var*
begin
//#UC START# *4C3B5337022E_49539DBA029Dtest_impl*
 Document_CompareEditions_Test(aParams);
 if aParams.Op.Flag[vcm_ofEnabled] and
  Supports(Document, IControllable, l_Controllable) then
  aParams.Op.Flag[vcm_ofEnabled] := (l_Controllable.GetControlStatus and CS_CHANGED) = CS_CHANGED;
//#UC END# *4C3B5337022E_49539DBA029Dtest_impl*
end;//TExTextForm.WarnOnControl_ShowChanges_Test

procedure TExTextForm.WarnOnControl_ShowChanges_Execute(const aParams: IvcmExecuteParamsPrim);
 {* �������� ��������� }
//#UC START# *4C3B5337022E_49539DBA029Dexec_var*
//#UC END# *4C3B5337022E_49539DBA029Dexec_var*
begin
//#UC START# *4C3B5337022E_49539DBA029Dexec_impl*
 Document_CompareEditions_Execute(aParams);
//#UC END# *4C3B5337022E_49539DBA029Dexec_impl*
end;//TExTextForm.WarnOnControl_ShowChanges_Execute

procedure TExTextForm.WarnOnControl_ClearStatus_Test(const aParams: IvcmTestParamsPrim);
 {* �������� ������ "�������" }
//#UC START# *4C3B535F0064_49539DBA029Dtest_var*
//#UC END# *4C3B535F0064_49539DBA029Dtest_var*
begin
//#UC START# *4C3B535F0064_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := (ucpUnderControl <> nil) and ucpUnderControl.HasControlStatus;
//#UC END# *4C3B535F0064_49539DBA029Dtest_impl*
end;//TExTextForm.WarnOnControl_ClearStatus_Test

procedure TExTextForm.WarnOnControl_ClearStatus_Execute(const aParams: IvcmExecuteParamsPrim);
 {* �������� ������ "�������" }
//#UC START# *4C3B535F0064_49539DBA029Dexec_var*
//#UC END# *4C3B535F0064_49539DBA029Dexec_var*
begin
//#UC START# *4C3B535F0064_49539DBA029Dexec_impl*
 if (ucpUnderControl <> nil) then
 begin
  ucpUnderControl.ClearControlStatus;
  UpdateUnderControlList;
 end;//ViewArea <> nil
//#UC END# *4C3B535F0064_49539DBA029Dexec_impl*
end;//TExTextForm.WarnOnControl_ClearStatus_Execute

procedure TExTextForm.BookmarkIcon_Delete_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3C71290115_49539DBA029Dtest_var*
var
 l_eeSub: IeeSub;
//#UC END# *4C3C71290115_49539DBA029Dtest_var*
begin
//#UC START# *4C3C71290115_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := Supports(aParams.Target, IeeSub, l_eeSub) and (l_eeSub.LayerID = Ord(ev_sbtBookmark));
//#UC END# *4C3C71290115_49539DBA029Dtest_impl*
end;//TExTextForm.BookmarkIcon_Delete_Test

procedure TExTextForm.BookmarkIcon_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C71290115_49539DBA029Dexec_var*
var
 l_eeSub: IeeSub;
//#UC END# *4C3C71290115_49539DBA029Dexec_var*
begin
//#UC START# *4C3C71290115_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeSub, l_eeSub) and (l_eeSub.LayerID = Ord(ev_sbtBookmark)) then
 try
  case nsDeleteBookmark(l_eeSub.ID, Text.TextSource.DocumentContainer) of
// ������ �� �����, �.�. �������� ��������� � ���� ���������� � ���� ����� �����������.
//   drOk: l_eeSub.Delete;
   drDenied: Say(err_CanNotDeleteBookmark);
  end;
 finally
  l_eeSub := nil;
 end;
//#UC END# *4C3C71290115_49539DBA029Dexec_impl*
end;//TExTextForm.BookmarkIcon_Delete_Execute

procedure TExTextForm.BookmarkIcon_Edit_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3C7131036E_49539DBA029Dtest_var*
//#UC END# *4C3C7131036E_49539DBA029Dtest_var*
begin
//#UC START# *4C3C7131036E_49539DBA029Dtest_impl*
 BookmarkIcon_Delete_Test(aParams); // � dfm-� ���� ������ �� ���� � ��� �� �����
//#UC END# *4C3C7131036E_49539DBA029Dtest_impl*
end;//TExTextForm.BookmarkIcon_Edit_Test

procedure TExTextForm.BookmarkIcon_Edit_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C7131036E_49539DBA029Dexec_var*
var
 l_eeSub: IeeSub;
//#UC END# *4C3C7131036E_49539DBA029Dexec_var*
begin
//#UC START# *4C3C7131036E_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeSub, l_eeSub) and (l_eeSub.LayerID = Ord(ev_sbtBookmark)) then
 try
  EditBookmark(l_eeSub.ID);
 finally
  l_eeSub := nil;
 end;
//#UC END# *4C3C7131036E_49539DBA029Dexec_impl*
end;//TExTextForm.BookmarkIcon_Edit_Execute

procedure TExTextForm.UserCommentIcon_Delete_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3C71D20351_49539DBA029Dtest_var*
var
 l_eeSub: IeeSub;
//#UC END# *4C3C71D20351_49539DBA029Dtest_var*
begin
//#UC START# *4C3C71D20351_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := Supports(aParams.Target, IeeSub, l_eeSub) and
  (l_eeSub.LayerID = Ord(ev_sbtMark)) and
  not Text.IsStaticText and (l_eeSub.Flag = 2);
//#UC END# *4C3C71D20351_49539DBA029Dtest_impl*
end;//TExTextForm.UserCommentIcon_Delete_Test

procedure TExTextForm.UserCommentIcon_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C71D20351_49539DBA029Dexec_var*
var
 l_eeSub: IeeSub;
//#UC END# *4C3C71D20351_49539DBA029Dexec_var*
begin
//#UC START# *4C3C71D20351_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeSub, l_eeSub) and
    (l_eeSub.LayerID = Ord(ev_sbtMark)) and
    (l_eeSub.Para <> nil) then
  // ������� �������� �� ������� ��������� �����
  l_eeSub.Para.Delete;
//#UC END# *4C3C71D20351_49539DBA029Dexec_impl*
end;//TExTextForm.UserCommentIcon_Delete_Execute

procedure TExTextForm.UserCommentIcon_HideShow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C71E4033D_49539DBA029Dexec_var*
var
 l_eeSub: IeeSub;
 l_Status: Bool;
//#UC END# *4C3C71E4033D_49539DBA029Dexec_var*
begin
//#UC START# *4C3C71E4033D_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeSub, l_eeSub) and (l_eeSub.LayerID = Ord(ev_sbtMark)) then
 begin
  case l_eeSub.Flag of
   1: begin
       l_Status := not Text.ShowComments;
       Text.ShowComments := l_Status;
      end;//1
   2: begin
       l_Status := not Text.ShowUserComments;
       Text.ShowUserComments := l_Status;
      end;//2
   3: begin
       InvertVersionCommentsVisibleByUser;
       if Text.ShowVersionComments then
        l_eeSub.Select;
       // http://mdp.garant.ru/pages/viewpage.action?pageId=235868034
      end;//3
  end; // case l_eeSub.Flag
 end;//Supports(aParams.Target, IeeSub, l_eeSub)
 l_eeSub := nil;
//#UC END# *4C3C71E4033D_49539DBA029Dexec_impl*
end;//TExTextForm.UserCommentIcon_HideShow_Execute

procedure TExTextForm.UserCommentIcon_HideShow_GetState(var State: TvcmOperationStateIndex);
//#UC START# *4C3C71E4033D_49539DBA029Dgetstate_var*
var
 l_eeSub : IeeSub;
//#UC END# *4C3C71E4033D_49539DBA029Dgetstate_var*
begin
//#UC START# *4C3C71E4033D_49539DBA029Dgetstate_impl*
 with SubPanel.ScreenToClient(Mouse.CursorPos) do
  SubPanel.CheckSubOnPoint(X, Y, l_eeSub);
 if (l_eeSub <> nil) and
    (l_eeSub.LayerID = Ord(ev_sbtMark)) then
 begin
  case l_eeSub.Flag of
   1 : if Text.ShowComments then
        State := st_user_UserCommentIcon_HideShow_GarantShown
       else
        State := st_user_UserCommentIcon_HideShow_GarantHidden;
   2 : if Text.ShowUserComments then
        State := st_user_UserCommentIcon_HideShow_UserShown
       else
        State := st_user_UserCommentIcon_HideShow_UserHidden;
   3 : if Text.ShowVersionComments then
        State := st_user_UserCommentIcon_HideShow_VersionShown
       else
        State := st_user_UserCommentIcon_HideShow_VersionHidden;
  end; // case l_eeSub.Flag
 end//Supports(aParams.Target, IeeSub, l_eeSub)
 else
  State := st_user_UserCommentIcon_HideShow_Invisible;
 l_eeSub := nil;
//#UC END# *4C3C71E4033D_49539DBA029Dgetstate_impl*
end;//TExTextForm.UserCommentIcon_HideShow_GetState

procedure TExTextForm.UserComment_Delete_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3C74C603B6_49539DBA029Dtest_var*
var
 l_eeHotSpot: IeeHotSpot;
 l_eeTextPara: IeeTextPara;
 l_EP: IeePara;
//#UC END# *4C3C74C603B6_49539DBA029Dtest_var*
begin
//#UC START# *4C3C74C603B6_49539DBA029Dtest_impl*
 if Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) and Supports(l_eeHotSpot.Para, IeeTextPara, l_eeTextPara) then
  aParams.Op.Flag[vcm_ofEnabled] := l_eeTextPara.IsUserComment and not Text.IsStaticText
 else
 begin
  l_EP := LeafParaUnderCursor;
  aParams.Op.Flag[vcm_ofEnabled] := (l_EP <> nil) and l_EP.IsUserComment;
 end;
//#UC END# *4C3C74C603B6_49539DBA029Dtest_impl*
end;//TExTextForm.UserComment_Delete_Test

procedure TExTextForm.UserComment_Delete_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C74C603B6_49539DBA029Dexec_var*
var
 l_eeHotSpot: IeeHotSpot;
 l_EP: IeePara;
//#UC END# *4C3C74C603B6_49539DBA029Dexec_var*
begin
//#UC START# *4C3C74C603B6_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) and (l_eeHotSpot.Para <> nil) and (l_eeHotSpot.Para.Block <> nil) then
  (l_eeHotSpot.Para.Block As IeePara).Delete
 else
 begin
  l_EP := LeafParaUnderCursor;
  if l_EP.IsUserComment then
   if (l_EP.Block <> nil) then
    (l_EP.Block As IeePara).Delete;
 end;
//#UC END# *4C3C74C603B6_49539DBA029Dexec_impl*
end;//TExTextForm.UserComment_Delete_Execute

procedure TExTextForm.Text_AddUserComment_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3C75240091_49539DBA029Dtest_var*
var
 l_HotSpot: IeeHotSpot;
 l_EP: IeePara;
//#UC END# *4C3C75240091_49539DBA029Dtest_var*
begin
//#UC START# *4C3C75240091_49539DBA029Dtest_impl*
 if (UserType in [dftAACContentsRight, dftAACContentsLeft, dftAACRight]) then
  aParams.Op.Flag[vcm_ofVisible] := False;

 if (aParams.Control is TeeEditor) and TeeEditor(aParams.Control).CanUserModify then
  if (Document <> nil) then
  begin
   if (aParams.Target <> nil) and Supports(aParams.Target, IeeHotSpot, l_HotSpot) then
    l_EP := l_HotSpot.Para
   else
    l_EP := LeafParaUnderCursor;

   if (l_EP <> nil) then
    if l_EP.AsObject.IsKindOf(k2_typLeafPara) then
    begin
     aParams.Op.Flag[vcm_ofEnabled] := True;
     Exit;
    end;
  end;
 aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C3C75240091_49539DBA029Dtest_impl*
end;//TExTextForm.Text_AddUserComment_Test

procedure TExTextForm.Text_AddUserComment_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C75240091_49539DBA029Dexec_var*
var
 l_eeHotSpot: IeeHotSpot;
 l_Obj: InevObject;
 l_EP: IeePara;
//#UC END# *4C3C75240091_49539DBA029Dexec_var*
begin
//#UC START# *4C3C75240091_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) then
  l_EP := l_eeHotSpot.Para
 else
  l_EP := LeafParaUnderCursor;

 if (l_EP <> nil) then
 begin
  if not Text.ShowUserComments then
   Text.ShowUserComments := True;
   if l_EP.AsObject.QT(InevObject, l_Obj, Text.Processor) then
   try
    InevSelection(Text.Selection).SelectPoint(l_Obj.MakePoint, false);
    Text.InsertUserComment;
   finally
    l_Obj := nil;
   end;//try..finally
 end;//l_EP <> nil
//#UC END# *4C3C75240091_49539DBA029Dexec_impl*
end;//TExTextForm.Text_AddUserComment_Execute

procedure TExTextForm.Document_GetGraphicImage_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3C77CC012A_49539DBA029Dtest_var*
//#UC END# *4C3C77CC012A_49539DBA029Dtest_var*
begin
//#UC START# *4C3C77CC012A_49539DBA029Dtest_impl*
 with aParams do
  Op.Flag[vcm_ofEnabled] := (Document <> nil) and Document.HasInternetImage;
//#UC END# *4C3C77CC012A_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GetGraphicImage_Test

procedure TExTextForm.Document_GetGraphicImage_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3C77CC012A_49539DBA029Dexec_var*
var
 l_ExternalLink: IExternalLink;
//#UC END# *4C3C77CC012A_49539DBA029Dexec_var*
begin
//#UC START# *4C3C77CC012A_49539DBA029Dexec_impl*
(* if (aParams.Count >= 1) and Supports(aParams.AsIU[0], IExternalLink, l_ExternalLink) then
 else*)
  if (Document <> nil) and Document.HasInternetImage then
   Document.GetInternetImageUrl(0, l_ExternalLink);
 if (l_ExternalLink <> nil) then
  try
   nsExecuteExternalLink(l_ExternalLink);
  finally
   l_ExternalLink := nil;
  end;
//#UC END# *4C3C77CC012A_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GetGraphicImage_Execute

procedure TExTextForm.Document_DocumentSynchroOpenWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EA65F0233_49539DBA029Dtest_var*
//#UC END# *4C3EA65F0233_49539DBA029Dtest_var*
begin
//#UC START# *4C3EA65F0233_49539DBA029Dtest_impl*
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := TextSource.HasDocument;
//#UC END# *4C3EA65F0233_49539DBA029Dtest_impl*
end;//TExTextForm.Document_DocumentSynchroOpenWindow_Test

procedure TExTextForm.Document_DocumentSynchroOpenWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EA65F0233_49539DBA029Dexec_var*
//#UC END# *4C3EA65F0233_49539DBA029Dexec_var*
begin
//#UC START# *4C3EA65F0233_49539DBA029Dexec_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *4C3EA65F0233_49539DBA029Dexec_impl*
end;//TExTextForm.Document_DocumentSynchroOpenWindow_Execute

procedure TExTextForm.Document_DocumentSynchroOpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EA671007A_49539DBA029Dtest_var*
//#UC END# *4C3EA671007A_49539DBA029Dtest_var*
begin
//#UC START# *4C3EA671007A_49539DBA029Dtest_impl*
 if aParams.Op.Flag[vcm_ofEnabled] then
  aParams.Op.Flag[vcm_ofEnabled] := TextSource.HasDocument;
//#UC END# *4C3EA671007A_49539DBA029Dtest_impl*
end;//TExTextForm.Document_DocumentSynchroOpenNewWindow_Test

procedure TExTextForm.Document_DocumentSynchroOpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EA671007A_49539DBA029Dexec_var*
//#UC END# *4C3EA671007A_49539DBA029Dexec_var*
begin
//#UC START# *4C3EA671007A_49539DBA029Dexec_impl*
 if HasDoc then
  OpenInWindow;
//#UC END# *4C3EA671007A_49539DBA029Dexec_impl*
end;//TExTextForm.Document_DocumentSynchroOpenNewWindow_Execute

procedure TExTextForm.Document_DictListOpenFrmAct_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EA90300E1_49539DBA029Dtest_var*
//var
// l_Form: IvcmEntityForm;
//#UC END# *4C3EA90300E1_49539DBA029Dtest_var*
begin
//#UC START# *4C3EA90300E1_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=290266547
 (*if NativeMainForm.HasForm(fm_enDiction.rFormID, vcm_ztNavigator, True, @l_Form) then
 try
  aParams.Op.Flag[vcm_ofEnabled] := not l_Form.IsActiveInParent;
 finally
  l_Form := nil;
 end;{try..finally}*)
//#UC END# *4C3EA90300E1_49539DBA029Dtest_impl*
end;//TExTextForm.Document_DictListOpenFrmAct_Test

procedure TExTextForm.Document_DictListOpenFrmAct_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EA90300E1_49539DBA029Dexec_var*
//var
// l_Form: IvcmEntityForm;
//#UC END# *4C3EA90300E1_49539DBA029Dexec_var*
begin
//#UC START# *4C3EA90300E1_49539DBA029Dexec_impl*
 Assert(False);
(* if NativeMainForm.HasForm(fm_enDiction.rFormID, vcm_ztNavigator, True, @l_Form) then
 try
  l_Form.SetActiveInParent;
 finally
  l_Form := nil;
 end;{try..finally}*)
//#UC END# *4C3EA90300E1_49539DBA029Dexec_impl*
end;//TExTextForm.Document_DictListOpenFrmAct_Execute

procedure TExTextForm.Document_GotoBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EBF860139_49539DBA029Dtest_var*
var
 l_Count,
 l_Index: Integer;
 l_BookmarkList: IeeSubList;
//#UC END# *4C3EBF860139_49539DBA029Dtest_var*
begin
//#UC START# *4C3EBF860139_49539DBA029Dtest_impl*
// ��������� �������� ������ ��������
 if (Document <> nil) then
 begin
  l_BookmarkList := Text.Editor.Data.Document.Bookmarks;
  try
   l_Count := GetVisibleBookmarksCount(l_BookmarkList);
   if (l_Count > 0) then
   begin
    with aParams.Op.SubItems do
    begin
     Clear;
     for l_Index := 0 to Pred(l_BookmarkList.Count) do
      if l_BookmarkList.Subs[l_Index].Flags and ev_sfOwn = ev_sfOwn then
       Add(l_BookmarkList.Subs[l_Index].Name);
    end;//with aParams.Op.SubItems
   end//l_Count > 0
   else
    aParams.Op.Flag[vcm_ofEnabled] := False;
  finally
   l_BookmarkList := nil;
  end;//try..finally
 end//Document <> nil
 else
  aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C3EBF860139_49539DBA029Dtest_impl*
end;//TExTextForm.Document_GotoBookmark_Test

procedure TExTextForm.Document_GotoBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EBF860139_49539DBA029Dexec_var*
var
 l_Count,
 l_Index: Integer;
 l_BookmarkList: IeeSubList;
 l_Sub: IeeSub;
//#UC END# *4C3EBF860139_49539DBA029Dexec_var*
begin
//#UC START# *4C3EBF860139_49539DBA029Dexec_impl*
 l_Index := aParams.ItemIndex;
 if (l_Index >= 0) then
 begin
  l_BookmarkList := Text.Editor.Data.Document.Bookmarks;
  l_Count := GetVisibleBookmarksCount(l_BookmarkList);
  if (l_Index = 0) then
  begin
   if (f_LastBookmarkIndex >= Pred(l_Count)) then
    f_LastBookmarkIndex := 0
   else
    Inc(f_LastBookmarkIndex);
   l_Index := f_LastBookmarkIndex;
  end//l_Index = 0
  else
  begin
   Dec(l_Index);
   f_LastBookmarkIndex := l_Index;
  end;//l_Index = 0
  l_Sub := GetVisibleBookmark(l_BookmarkList, l_Index);
  if (l_Sub <> nil) and
     l_Sub.Exists then
   l_Sub.Select;
 end;//l_Index >= 0
//#UC END# *4C3EBF860139_49539DBA029Dexec_impl*
end;//TExTextForm.Document_GotoBookmark_Execute

procedure TExTextForm.Document_LiteratureListForDictionary_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED13D03A5_49539DBA029Dtest_var*
//#UC END# *4C3ED13D03A5_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED13D03A5_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofVisible] := (DictionDocument <> nil) and DictionDocument.IsMainDiction;
//#UC END# *4C3ED13D03A5_49539DBA029Dtest_impl*
end;//TExTextForm.Document_LiteratureListForDictionary_Test

procedure TExTextForm.Document_LiteratureListForDictionary_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED13D03A5_49539DBA029Dexec_var*
//#UC END# *4C3ED13D03A5_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED13D03A5_49539DBA029Dexec_impl*
 if (DictionDocument <> nil) then
  DictionDocument.OpenLiteratureList;
//#UC END# *4C3ED13D03A5_49539DBA029Dexec_impl*
end;//TExTextForm.Document_LiteratureListForDictionary_Execute

procedure TExTextForm.Text_EditBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED54100A2_49539DBA029Dtest_var*
var
 l_eeHotSpot: IeeHotSpot;
//#UC END# *4C3ED54100A2_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED54100A2_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) and
  (l_eeHotSpot.Para <> nil) and HasVisibleBookmarks(l_eeHotSpot.Para.Bookmarks);
//#UC END# *4C3ED54100A2_49539DBA029Dtest_impl*
end;//TExTextForm.Text_EditBookmark_Test

procedure TExTextForm.Text_EditBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED54100A2_49539DBA029Dexec_var*
var
 l_eeHotSpot: IeeHotSpot;
 l_Bookmark: IeeSub;
//#UC END# *4C3ED54100A2_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED54100A2_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) and
    (l_eeHotSpot.Para <> nil) then
 try
  l_Bookmark := GetVisibleBookmark(l_eeHotSpot.Para.BookMarks);
  try
   if Assigned(l_Bookmark) then
    EditBookmark(l_Bookmark.ID);
  finally
   l_Bookmark := nil;
  end;
 finally
  l_eeHotSpot := nil;
 end;
//#UC END# *4C3ED54100A2_49539DBA029Dexec_impl*
end;//TExTextForm.Text_EditBookmark_Execute

procedure TExTextForm.Text_DeleteBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED54D03D4_49539DBA029Dtest_var*
//#UC END# *4C3ED54D03D4_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED54D03D4_49539DBA029Dtest_impl*
 Text_EditBookmark_Test(aParams);
//#UC END# *4C3ED54D03D4_49539DBA029Dtest_impl*
end;//TExTextForm.Text_DeleteBookmark_Test

procedure TExTextForm.Text_DeleteBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED54D03D4_49539DBA029Dexec_var*
var
 l_eeHotSpot: IeeHotSpot;
 l_Bookmark: IeeSub;
//#UC END# *4C3ED54D03D4_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED54D03D4_49539DBA029Dexec_impl*
 if Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) and
    (l_eeHotSpot.Para <> nil) then
 try
  l_Bookmark := GetVisibleBookmark(l_eeHotSpot.Para.BookMarks);
  try
   if Assigned(l_Bookmark) then
   case nsDeleteBookmark(l_Bookmark.ID, Text.TextSource.DocumentContainer) of
//   ������ �� �����, �.�. �������� ��������� � ���� ���������� � ���� ����� �����������.
//    drOk: l_eeHotSpot.Para.BookMarks.Subs[0].Delete;
    drDenied: Say(err_CanNotDeleteBookmark);
   end;
  finally
   l_Bookmark := nil;
  end;
 finally
  l_eeHotSpot := nil;
 end;
//#UC END# *4C3ED54D03D4_49539DBA029Dexec_impl*
end;//TExTextForm.Text_DeleteBookmark_Execute

procedure TExTextForm.Text_AddBookmark_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED5D502AE_49539DBA029Dtest_var*
var
 l_eeHotSpot: IeeHotSpot;
// l_Para: IeeLeafPara;
// l_Picture: IeePicture;
//#UC END# *4C3ED5D502AE_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED5D502AE_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (Document <> nil) and
   Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) and
   (l_eeHotSpot.Para <> nil) and
   Supports(l_eeHotSpot.Para, IeeLeafPara{, l_Para});
// * Old Code. �������� ������������ ��������� ��������
// * ���������� ��������� � ������� ������ �������� � _OnExecute
// begin
//  if (l_eeHotSpot.Para.ID >= 0) then
//  begin
//   if (l_eeHotSpot.Para.ID > 0) or
//      Supports(l_eeHotSpot.Para, IeePicture, l_Picture) then
//    aParams.Op.Flag[vcm_ofVisible] := True;
//  end
//  else
//   aParams.Op.Flag[vcm_ofVisible] := False;
// end

 l_eeHotSpot := nil;
//#UC END# *4C3ED5D502AE_49539DBA029Dtest_impl*
end;//TExTextForm.Text_AddBookmark_Test

procedure TExTextForm.Text_AddBookmark_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED5D502AE_49539DBA029Dexec_var*
var
 l_eeHotSpot: IeeHotSpot;
//#UC END# *4C3ED5D502AE_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED5D502AE_49539DBA029Dexec_impl*
 if (Document <> nil) and
    Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) and
    (l_eeHotSpot.Para <> nil) then
 try
  AddBookmark(eeFindNumberedPara(l_eeHotSpot.Para, Text as IeeDocumentEx));
 finally
  l_eeHotSpot := nil;
 end;
//#UC END# *4C3ED5D502AE_49539DBA029Dexec_impl*
end;//TExTextForm.Text_AddBookmark_Execute

procedure TExTextForm.Text_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3ED7190010_49539DBA029Dtest_var*
//#UC END# *4C3ED7190010_49539DBA029Dtest_var*
begin
//#UC START# *4C3ED7190010_49539DBA029Dtest_impl*
 // � ��� ���� ������ ���� ����� ������������ ���� "������� ������� �������� �
 // ����� ����"
 // http://mdp.garant.ru/pages/viewpage.action?pageId=484815594
 aParams.Op.Flag[vcm_ofEnabled] := (UserType in [dftDocument, dftMedicFirm,
  dftAACContentsRight, dftAACLeft]) and
  (Document <> nil);
//#UC END# *4C3ED7190010_49539DBA029Dtest_impl*
end;//TExTextForm.Text_OpenNewWindow_Test

procedure TExTextForm.Text_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3ED7190010_49539DBA029Dexec_var*
//#UC END# *4C3ED7190010_49539DBA029Dexec_var*
begin
//#UC START# *4C3ED7190010_49539DBA029Dexec_impl*
 if Assigned(dsDocument) then
  OpenInWindow
 else
  op_Document_CommonDocumentOpenNewWindow.Call(Self.As_IvcmEntityForm, UserType);
//#UC END# *4C3ED7190010_49539DBA029Dexec_impl*
end;//TExTextForm.Text_OpenNewWindow_Execute

procedure TExTextForm.Document_OpenProducedDrugList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EDBA7030C_49539DBA029Dtest_var*
//#UC END# *4C3EDBA7030C_49539DBA029Dtest_var*
begin
//#UC START# *4C3EDBA7030C_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (MedicFirmDocument <> nil);
 aParams.Op.Flag[vcm_ofVisible] := defDataAdapter.IsInpharmExists;
//#UC END# *4C3EDBA7030C_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenProducedDrugList_Test

procedure TExTextForm.Document_OpenProducedDrugList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EDBA7030C_49539DBA029Dexec_var*
//#UC END# *4C3EDBA7030C_49539DBA029Dexec_var*
begin
//#UC START# *4C3EDBA7030C_49539DBA029Dexec_impl*
 if (MedicFirmDocument <> nil) then
  MedicFirmDocument.OpenDrugList; 
//#UC END# *4C3EDBA7030C_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenProducedDrugList_Execute

procedure TExTextForm.Document_OpenSimilarDrugList_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C3EDBB80283_49539DBA029Dtest_var*
//#UC END# *4C3EDBB80283_49539DBA029Dtest_var*
begin
//#UC START# *4C3EDBB80283_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := (DrugDocument <> nil);
 aParams.Op.Flag[vcm_ofVisible] := defDataAdapter.IsInpharmExists;
//#UC END# *4C3EDBB80283_49539DBA029Dtest_impl*
end;//TExTextForm.Document_OpenSimilarDrugList_Test

procedure TExTextForm.Document_OpenSimilarDrugList_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C3EDBB80283_49539DBA029Dexec_var*
//#UC END# *4C3EDBB80283_49539DBA029Dexec_var*
begin
//#UC START# *4C3EDBB80283_49539DBA029Dexec_impl*
 if (DrugDocument <> nil) then
  DrugDocument.OpenDrugInternationalNameSynonims;
//#UC END# *4C3EDBB80283_49539DBA029Dexec_impl*
end;//TExTextForm.Document_OpenSimilarDrugList_Execute

procedure TExTextForm.Selection_InsertHyperlink_Test(const aParams: IvcmTestParamsPrim);
 {* ��������� ������... }
//#UC START# *4C7B96FA02DA_49539DBA029Dtest_var*
var
 l_Hyperlink : IevHyperlink;
 l_TempPara  : IeePara;
 l_TextPara  : IeeTextPara;
 l_Selection : InevSelection;
//#UC END# *4C7B96FA02DA_49539DBA029Dtest_var*
begin
//#UC START# *4C7B96FA02DA_49539DBA029Dtest_impl*
 if (aParams.Control is TevCustomEditor) then
 begin
  l_Selection := TevCustomEditor(aParams.Control).Selection;
  if (l_Selection <> nil) and not l_Selection.IsMulti then
  begin
   if Supports(l_Selection, IevHyperlink, l_Hyperlink) then
   try
    if (l_Hyperlink.ID < 0) then
     aParams.Op.Flag[vcm_ofEnabled] := False
    else
    begin
     l_TempPara := TeePara.Make(l_Hyperlink.Para.AsObject, aParams.Control as IeeDocumentEx);
     try
      if Supports(l_TempPara, IeeTextPara, l_TextPara) then
      try
       if not l_TextPara.IsUserComment or l3IsNil(l_TextPara.Text) then
        aParams.Op.Flag[vcm_ofEnabled] := False;
      finally
       l_TextPara := nil;
      end//try..finally
      else
       aParams.Op.Flag[vcm_ofEnabled] := False;
     finally
      l_TempPara := nil;
     end;
    end;//l_Hyperlink.ID < 0
   finally
    l_Hyperlink := nil;
   end//try..finally
   else
    aParams.Op.Flag[vcm_ofEnabled] := False;
  end
  else
   aParams.Op.Flag[vcm_ofEnabled] := False;

  if (aParams.Control is TevEditorWithOperations) and aParams.Op.Flag[vcm_ofEnabled] then
   aParams.Op.Flag[vcm_ofEnabled] := not TevEditorWithOperations(aParams.Control).IsReadOnlyTarget(aParams.Target);
 end//aParams.Control Is TevCustomEditor
 else
  aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C7B96FA02DA_49539DBA029Dtest_impl*
end;//TExTextForm.Selection_InsertHyperlink_Test

procedure TExTextForm.Selection_InsertHyperlink_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ��������� ������... }
//#UC START# *4C7B96FA02DA_49539DBA029Dexec_var*
var
 l_Caption   : TvcmStringID;
 l_Hyperlink : IevHyperlink;
//#UC END# *4C7B96FA02DA_49539DBA029Dexec_var*
begin
//#UC START# *4C7B96FA02DA_49539DBA029Dexec_impl*
 if (aParams.Control Is TevCustomEditor) then
 begin
  if Supports(TevCustomEditor(aParams.Control).Selection, IevHyperlink, l_Hyperlink) then
   try
    if (l_Hyperlink.ID >= 0) then
    begin
     if not l_Hyperlink.Exists then
      l_Caption := str_SetHyperLink
     else
      l_Caption := str_ChangeHyperLink;
     TdmStdRes.SelectOpenWithUserData(Self.As_IvcmEntityForm,
                                      FilterInfoFactory.MakeFilterInfo(ffNone, sfMyDocumentsAndCommon),
                                      l_Caption,
                                      l_Hyperlink);
    end;//l_Hyperlink.ID
   finally
    l_Hyperlink := nil;
   end;//try..finally
 end;//aParams.Control Is TevCustomEditor
//#UC END# *4C7B96FA02DA_49539DBA029Dexec_impl*
end;//TExTextForm.Selection_InsertHyperlink_Execute

procedure TExTextForm.Selection_InsertHyperlink_GetState(var State: TvcmOperationStateIndex);
 {* ��������� ������... }
//#UC START# *4C7B96FA02DA_49539DBA029Dgetstate_var*
var
 l_Hyperlink : IevHyperlink;
 l_Selection : InevSelection;
//#UC END# *4C7B96FA02DA_49539DBA029Dgetstate_var*
begin
//#UC START# *4C7B96FA02DA_49539DBA029Dgetstate_impl*
 State := vcm_DefaultOperationState;
 l_Selection := Text.Selection;
 if (l_Selection <> nil) AND not l_Selection.IsMulti then
 begin
  if Supports(l_Selection, IevHyperlink, l_Hyperlink) then
   try
    if (l_Hyperlink.ID > 0) then
     State := st_user_Selection_InsertHyperlink_ModifyLink;
   finally
    l_Hyperlink := nil;
   end//try..finally
 end;//(l_Selection <> nil) AND not l_Selection.IsMulti
//#UC END# *4C7B96FA02DA_49539DBA029Dgetstate_impl*
end;//TExTextForm.Selection_InsertHyperlink_GetState

procedure TExTextForm.WarnRedaction_ShowInfo_Test(const aParams: IvcmTestParamsPrim);
 {* �������� ����� �������������� }
//#UC START# *4C7D354603D3_49539DBA029Dtest_var*
//#UC END# *4C7D354603D3_49539DBA029Dtest_var*
begin
//#UC START# *4C7D354603D3_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := FormIsMainInDocumentSet;
//#UC END# *4C7D354603D3_49539DBA029Dtest_impl*
end;//TExTextForm.WarnRedaction_ShowInfo_Test

procedure TExTextForm.WarnRedaction_ShowInfo_Execute(const aParams: IvcmExecuteParamsPrim);
 {* �������� ����� �������������� }
//#UC START# *4C7D354603D3_49539DBA029Dexec_var*
//#UC END# *4C7D354603D3_49539DBA029Dexec_var*
begin
//#UC START# *4C7D354603D3_49539DBA029Dexec_impl*
 ShowWarningPage(true{false{True}, cEditionWarningSub);
              // ^ - ������� ������ ���������, ���� �������� � ������
              // http://mdp.garant.ru/pages/viewpage.action?pageId=266898633&focusedCommentId=285508953#comment-285508953
              // � ��� � ���� "�����" - http://mdp.garant.ru/pages/viewpage.action?pageId=287219564
//#UC END# *4C7D354603D3_49539DBA029Dexec_impl*
end;//TExTextForm.WarnRedaction_ShowInfo_Execute

procedure TExTextForm.WarnRedaction_ShowInfo_GetState(var State: TvcmOperationStateIndex);
 {* �������� ����� �������������� }
//#UC START# *4C7D354603D3_49539DBA029Dgetstate_var*
var l_Form: IvcmEntityForm;
//#UC END# *4C7D354603D3_49539DBA029Dgetstate_var*
begin
//#UC START# *4C7D354603D3_49539DBA029Dgetstate_impl*
 if Assigned(Aggregate) and Aggregate.HasForm(fm_WarningForm.rFormID, @l_Form) and
  l_Form.IsActiveInParent then
  State := st_user_WarnRedaction_ShowInfo_Hide
 else
  State := vcm_DefaultOperationState;
//#UC END# *4C7D354603D3_49539DBA029Dgetstate_impl*
end;//TExTextForm.WarnRedaction_ShowInfo_GetState

procedure TExTextForm.DocumentBlock_PrintPreview_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C879306001C_49539DBA029Dtest_var*
//#UC END# *4C879306001C_49539DBA029Dtest_var*
begin
//#UC START# *4C879306001C_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C879306001C_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_PrintPreview_Test

procedure TExTextForm.DocumentBlock_PrintPreview_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C879306001C_49539DBA029Dexec_var*
//#UC END# *4C879306001C_49539DBA029Dexec_var*
begin
//#UC START# *4C879306001C_49539DBA029Dexec_impl*
 Assert(false);
//#UC END# *4C879306001C_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_PrintPreview_Execute

procedure TExTextForm.DocumentBlock_Select_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C87931D00FC_49539DBA029Dtest_var*
//#UC END# *4C87931D00FC_49539DBA029Dtest_var*
begin
//#UC START# *4C87931D00FC_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := False;
//#UC END# *4C87931D00FC_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_Select_Test

procedure TExTextForm.DocumentBlock_Select_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C87931D00FC_49539DBA029Dexec_var*
//#UC END# *4C87931D00FC_49539DBA029Dexec_var*
begin
//#UC START# *4C87931D00FC_49539DBA029Dexec_impl*
 Assert(false);
//#UC END# *4C87931D00FC_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_Select_Execute

procedure TExTextForm.Document_ViewChangedFragments_Test(const aParams: IvcmTestParamsPrim);
 {* ����� ��������� ��������� }
//#UC START# *4DDCBABC03B7_49539DBA029Dtest_var*
//#UC END# *4DDCBABC03B7_49539DBA029Dtest_var*
begin
//#UC START# *4DDCBABC03B7_49539DBA029Dtest_impl*
 Document_CompareEditions_Test(aParams);
//#UC END# *4DDCBABC03B7_49539DBA029Dtest_impl*
end;//TExTextForm.Document_ViewChangedFragments_Test

procedure TExTextForm.Document_ViewChangedFragments_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ����� ��������� ��������� }
//#UC START# *4DDCBABC03B7_49539DBA029Dexec_var*
//#UC END# *4DDCBABC03B7_49539DBA029Dexec_var*
begin
//#UC START# *4DDCBABC03B7_49539DBA029Dexec_impl*
 TdmStdRes.ViewChangedFragmentsForPrevEdition(Self.Document);
//#UC END# *4DDCBABC03B7_49539DBA029Dexec_impl*
end;//TExTextForm.Document_ViewChangedFragments_Execute

procedure TExTextForm.DocumentSubPanel_UpdateSubPanel_Execute;
//#UC START# *4DF20436002A_49539DBA029Dexec_var*
//#UC END# *4DF20436002A_49539DBA029Dexec_var*
begin
//#UC START# *4DF20436002A_49539DBA029Dexec_impl*
 UpdateSubPanelDescription;
//#UC END# *4DF20436002A_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentSubPanel_UpdateSubPanel_Execute

procedure TExTextForm.DocumentSubPanel_UpdateSubPanel(const aParams: IvcmExecuteParamsPrim);
begin
 Self.DocumentSubPanel_UpdateSubPanel_Execute;
end;//TExTextForm.DocumentSubPanel_UpdateSubPanel

procedure TExTextForm.IntranetSourcePoint_GoToIntranet_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4F184B42019E_49539DBA029Dexec_var*
//#UC END# *4F184B42019E_49539DBA029Dexec_var*
begin
//#UC START# *4F184B42019E_49539DBA029Dexec_impl*
 GoToIntranetPrim(false);
//#UC END# *4F184B42019E_49539DBA029Dexec_impl*
end;//TExTextForm.IntranetSourcePoint_GoToIntranet_Execute

procedure TExTextForm.Picture_Open_Test(const aParams: IvcmTestParamsPrim);
 {* ������� � ������� ���� }
//#UC START# *4F672A7903C1_49539DBA029Dtest_var*
//#UC END# *4F672A7903C1_49539DBA029Dtest_var*
begin
//#UC START# *4F672A7903C1_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := IsPictureUnderCursor and (aParams.Control = Text);
//#UC END# *4F672A7903C1_49539DBA029Dtest_impl*
end;//TExTextForm.Picture_Open_Test

procedure TExTextForm.Picture_Open_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������� � ������� ���� }
//#UC START# *4F672A7903C1_49539DBA029Dexec_var*
var
 l_EP : IeePara;
 l_Picture : IeePicture;
//#UC END# *4F672A7903C1_49539DBA029Dexec_var*
begin
//#UC START# *4F672A7903C1_49539DBA029Dexec_impl*
 l_EP := LeafParaUnderCursor;
 if Supports(l_EP, IeePicture, l_Picture) then
  OpenPicture(l_EP, l_Picture);
//#UC END# *4F672A7903C1_49539DBA029Dexec_impl*
end;//TExTextForm.Picture_Open_Execute

procedure TExTextForm.Picture_OpenNewWindow_Test(const aParams: IvcmTestParamsPrim);
 {* ������� � ����� ���� }
//#UC START# *4F672A9C0083_49539DBA029Dtest_var*
//#UC END# *4F672A9C0083_49539DBA029Dtest_var*
begin
//#UC START# *4F672A9C0083_49539DBA029Dtest_impl*
 Picture_Open_Test(aParams);
//#UC END# *4F672A9C0083_49539DBA029Dtest_impl*
end;//TExTextForm.Picture_OpenNewWindow_Test

procedure TExTextForm.Picture_OpenNewWindow_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������� � ����� ���� }
//#UC START# *4F672A9C0083_49539DBA029Dexec_var*
var
 l_EP : IeePara;
 l_Picture : IeePicture;
//#UC END# *4F672A9C0083_49539DBA029Dexec_var*
begin
//#UC START# *4F672A9C0083_49539DBA029Dexec_impl*
 l_EP := LeafParaUnderCursor;
 if Supports(l_EP, IeePicture, l_Picture) then
  OpenPicture(l_EP, l_Picture, vcm_okInNewWindow);
//#UC END# *4F672A9C0083_49539DBA029Dexec_impl*
end;//TExTextForm.Picture_OpenNewWindow_Execute

function TExTextForm.BaseSearchPresentationHolder_GetBaseSearchPresentation_Execute: InsBaseSearchPresentation;
//#UC START# *5072D45A035C_49539DBA029Dexec_var*
//#UC END# *5072D45A035C_49539DBA029Dexec_var*
begin
//#UC START# *5072D45A035C_49539DBA029Dexec_impl*
 Assert(UserType = dftAACLeft);
 Result := Self;
//#UC END# *5072D45A035C_49539DBA029Dexec_impl*
end;//TExTextForm.BaseSearchPresentationHolder_GetBaseSearchPresentation_Execute

procedure TExTextForm.BaseSearchPresentationHolder_GetBaseSearchPresentation(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IBaseSearchPresentationHolder_GetBaseSearchPresentation_Params) do
  ResultValue := Self.BaseSearchPresentationHolder_GetBaseSearchPresentation_Execute;
end;//TExTextForm.BaseSearchPresentationHolder_GetBaseSearchPresentation

procedure TExTextForm.Text_SelectWord_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *528777B1010F_49539DBA029Dtest_var*
var
 l_eeHotSpot: IeeHotSpot;
//#UC END# *528777B1010F_49539DBA029Dtest_var*
begin
//#UC START# *528777B1010F_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := not ((Document = nil) or
  (Supports(aParams.Target, IeeHotSpot, l_eeHotSpot) and l_eeHotSpot.InSelection));
//#UC END# *528777B1010F_49539DBA029Dtest_impl*
end;//TExTextForm.Text_SelectWord_Test

procedure TExTextForm.Text_SelectWord_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *528777B1010F_49539DBA029Dexec_var*
//#UC END# *528777B1010F_49539DBA029Dexec_var*
begin
//#UC START# *528777B1010F_49539DBA029Dexec_impl*
 Text.Select(ev_stWord);
//#UC END# *528777B1010F_49539DBA029Dexec_impl*
end;//TExTextForm.Text_SelectWord_Execute

procedure TExTextForm.Text_SelectPara_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *528777C803B4_49539DBA029Dtest_var*
//#UC END# *528777C803B4_49539DBA029Dtest_var*
begin
//#UC START# *528777C803B4_49539DBA029Dtest_impl*
 Text_SelectWord_Test(aParams);
//#UC END# *528777C803B4_49539DBA029Dtest_impl*
end;//TExTextForm.Text_SelectPara_Test

procedure TExTextForm.Text_SelectPara_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *528777C803B4_49539DBA029Dexec_var*
//#UC END# *528777C803B4_49539DBA029Dexec_var*
begin
//#UC START# *528777C803B4_49539DBA029Dexec_impl*
 Text.Select(ev_stPara);
//#UC END# *528777C803B4_49539DBA029Dexec_impl*
end;//TExTextForm.Text_SelectPara_Execute

procedure TExTextForm.OpenRedactionGlobalLink(const aDocument: IDocument;
 aSub: Cardinal;
 aBehaviour: TbsProcessHyperLinkBehaviour);
//#UC START# *53A303BE03A8_49539DBA029D_var*

 function lp_GetDocumentRedactionID(const aDoc: IDocument): TRedactionID;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=477628351 *)
 var
  l_DocState: IDocumentState;
  l_DocRedactionInfo: TRedactionInfo;
 begin
   Assert(aDoc <> nil);
   aDoc.GetCurrentState(l_DocState);
   Assert(l_DocState <> nil);
   try
    l_DocState.GetCurrentRedaction(l_DocRedactionInfo);
    Result := l_DocRedactionInfo.rID;
   finally
    l_DocState := nil;
    Finalize(l_DocRedactionInfo);
   end;//try..finally
 end;//lp_GetDocumentRedactionID

 function lp_GetDocumentRedactionIndex(const aDoc: IDocument; aRedactionID: TRedactionID): Integer;
 //http://mdp.garant.ru/pages/viewpage.action?pageId=477628351
 var
  l_RedactionItemInfo: TRedactionInfo;
  l_RedactionList: IRedactionInfoList;
  l_Index: Integer;
 begin
  aDoc.GetRedactionsList(l_RedactionList);
  try
   for l_Index := 0 to l_RedactionList.Count - 1 do
   begin
    l_RedactionList.pm_GetItem(l_Index, l_RedactionItemInfo);
    try
     if (l_RedactionItemInfo.rID = aRedactionID) then
     begin
      Result := l_Index;
      Exit;
     end;//if (l_RedactionItemInfo.rID = aRedactionID)
    finally
     Finalize(l_RedactionItemInfo);
    end;//try..finally
   end;//for l_Index := 0 to l_RedactionList.Count - 1
  finally
   l_RedactionList := nil;
  end;//try..finally
 end;//lp_GetDocumentRedactionIndex

const
 cOpenKindMap : array[TbsProcessHyperLinkBehaviour] of TvcmMainFormOpenKind = (vcm_okInCurrentTab,
  vcm_okInNewTab, vcm_okInNewTab, vcm_okInNewWindow);
var
 l_Block: Tl3Variant;
 l_Ob: InevObject;
 l_Para: IeeLeafPara;
 l_CurrentRedactionIndex: Integer;
 l_AnotherRedactionIndex: Integer;
 l_ActiveElement: InevActiveElement;
 l_LeftDocument: IDocument;
 l_RightDocument: IDocument;
 l_LP : InevLeafPara;
 l_Cont: IvcmContainer;
 l_JumpToText: Boolean; // ������ � ����� ��������� ��� � ���������. 513615258
//#UC END# *53A303BE03A8_49539DBA029D_var*
begin
//#UC START# *53A303BE03A8_49539DBA029D_impl*
 // ��������� �������� ����� ��������� ����� ��������� ���������, �� ��������
 // ����� ����������� � ��������� ���������, ����������� � aDocument.
 // � ���� ����� ������.
 // http://mdp.garant.ru/pages/viewpage.action?pageId=476811628
 Assert(HyperlinkDocument <> nil);
 //http://mdp.garant.ru/pages/viewpage.action?pageId=477628351
 l_CurrentRedactionIndex := lp_GetDocumentRedactionIndex(HyperlinkDocument,
                                                         lp_GetDocumentRedactionID(aDocument));
 Assert(aDocument <> nil);
 l_AnotherRedactionIndex := lp_GetDocumentRedactionIndex(HyperlinkDocument,
                                                         lp_GetDocumentRedactionID(HyperlinkDocument));

 // ������ � ����� ��������� ��� � ���������. 513615258
 l_JumpToText := Settings.LoadBoolean(pi_Document_ShowVersionCommentsLinkBehaviour,
                                     dv_Document_ShowVersionCommentsLinkBehaviour);

 if TvcmTabbedContainerFormDispatcher.Instance.NeedUseTabs then
  l_Cont := nsOpenNewWindowTabbed(NativeMainForm, cOpenKindMap[aBehaviour])
 else
 if (aBehaviour = phbInNewWindow) then
  l_Cont := nsOpenNewWindowParams(NativeMainForm)
 else
  l_Cont := nil;
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=557299523
  
 // ������ ��� ���������������� � �� �������� TbsDocPos � ��������� ������
 // �����/����, � �������� ����� ��� ����������� ����� � ���������, ����
 // ����� ���������
 // http://mdp.garant.ru/pages/viewpage.action?pageId=476379343
 // http://mdp.garant.ru/pages/viewpage.action?pageId=475141260
 l_ActiveElement := (Text as TevCustomEditorWindow).ActiveElement;
 try
  // � ������ ������ �� �������� � ������� ��������� - ������� ���� ��������, ��� ��
  // http://mdp.garant.ru/pages/viewpage.action?pageId=495139252
  if (l_ActiveElement <> nil) and (l_ActiveElement.Para.AsObject.IntA[k2_tiStyle] <> ev_saVersionInfo) then
  begin
   TdmStdRes.OpenDocument(TdeDocInfo.Make(aDocument, TbsDocPos_C(dptSub, aSub)), l_Cont);
   Exit;
  end;//if (l_ActiveElement <> nil)
  if Assigned(l_ActiveElement) and
   evInPara(l_ActiveElement.Para.AsObject, k2_typBlock, l_Block) then
  begin
   l_Block.Child[0].QT(InevObject, l_Ob);
   l_LP := EvFindNumberedPara(l_Ob);
   if (l_LP = nil) then
    l_Para := TeeLeafPara.Make(nil, Text) as IeeLeafPara
   else
    l_Para := TeeLeafPara.Make(l_LP.AsObject, Text) as IeeLeafPara;
  end//if Assigned(l_ActiveElement)
  else
   l_Para := TeeLeafPara.Make((Text as TevCustomEditorWindow).Selection.Cursor.MostInner.Obj^.AsObject, Text) as IeeLeafPara;
 finally
  l_ActiveElement := nil;
 end;//try..finally
 try
  //�������, � ����� ��������, � ����� �������� ��� ���������, ��� ����� ���� � ���������, ���� ���� ��������
  //������� ��������, ������� �� ����, �� ������ ��������� ����� ���������, ��� � �������. ���� �� ������ -
  //������� ������ ���� � ������ ����. ���� � ������� - � �����. ����� �� ���������� �� ������������ ���������/
  // http://mdp.garant.ru/pages/viewpage.action?pageId=453155865
  if (l_CurrentRedactionIndex > l_AnotherRedactionIndex) then
  begin
   l_LeftDocument := aDocument;
   l_RightDocument := HyperlinkDocument;
  end//if (l_CurrentRedactionIndex > l_AnotherRedactionIndex) 
  else
  if (l_CurrentRedactionIndex < l_AnotherRedactionIndex) then
  begin
   l_LeftDocument := HyperlinkDocument;
   l_RightDocument := aDocument;
  end//if (l_CurrentRedactionIndex < l_AnotherRedactionIndex)
  else
   Assert(False, '��� ���������� �� ������ ��� ���������� ����� � ��� �� �������� ���������');

  if l_JumpToText // ������ � ����� ��������� ��� � ���������. 513615258
   then TdmStdRes.OpenDocument(TdeDocInfo.Make(aDocument, TbsDocPos_C(dptSub, aSub)), l_Cont)
   else TdmStdRes.MakeCompareEditions(l_LeftDocument, l_RightDocument, TbsDocPos_C(dptSub, aSub), HyperlinkDocument, l_Para, l_Cont);
 finally
  l_Para := nil;
  l_LeftDocument := nil;
  l_RightDocument := nil;
 end;//try..finally
//#UC END# *53A303BE03A8_49539DBA029D_impl*
end;//TExTextForm.OpenRedactionGlobalLink

procedure TExTextForm.Picture_OpenNewTab_Test(const aParams: IvcmTestParamsPrim);
 {* ������� � ����� ������� }
//#UC START# *53DF276802DD_49539DBA029Dtest_var*
//#UC END# *53DF276802DD_49539DBA029Dtest_var*
begin
//#UC START# *53DF276802DD_49539DBA029Dtest_impl*
 Picture_OpenNewWindow_Test(aParams);
//#UC END# *53DF276802DD_49539DBA029Dtest_impl*
end;//TExTextForm.Picture_OpenNewTab_Test

procedure TExTextForm.Picture_OpenNewTab_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������� � ����� ������� }
//#UC START# *53DF276802DD_49539DBA029Dexec_var*
var
 l_EP : IeePara;
 l_Picture : IeePicture;
//#UC END# *53DF276802DD_49539DBA029Dexec_var*
begin
//#UC START# *53DF276802DD_49539DBA029Dexec_impl*
 l_EP := LeafParaUnderCursor;
 if Supports(l_EP, IeePicture, l_Picture) then
  OpenPicture(l_EP, l_Picture, vcm_okInNewTab);
//#UC END# *53DF276802DD_49539DBA029Dexec_impl*
end;//TExTextForm.Picture_OpenNewTab_Execute

procedure TExTextForm.TabBecomeActive;
//#UC START# *54868B67034A_49539DBA029D_var*
//#UC END# *54868B67034A_49539DBA029D_var*
begin
//#UC START# *54868B67034A_49539DBA029D_impl*
 UpdateSubPanelDescription;
//#UC END# *54868B67034A_49539DBA029D_impl*
end;//TExTextForm.TabBecomeActive

procedure TExTextForm.TabBecomeInactive;
//#UC START# *54868B84029F_49539DBA029D_var*
//#UC END# *54868B84029F_49539DBA029D_var*
begin
//#UC START# *54868B84029F_49539DBA029D_impl*
 // ������ �� ������
//#UC END# *54868B84029F_49539DBA029D_impl*
end;//TExTextForm.TabBecomeInactive

procedure TExTextForm.Document_CommonDocumentOpenNewTab_Execute(aUserType: Integer);
//#UC START# *55545C63026E_49539DBA029Dexec_var*
//#UC END# *55545C63026E_49539DBA029Dexec_var*
begin
//#UC START# *55545C63026E_49539DBA029Dexec_impl*
 if not CheckParamForUserType(aUserType) then
  Exit;
 OpenDocumentInNewContainer(vcm_okInNewTab);
//#UC END# *55545C63026E_49539DBA029Dexec_impl*
end;//TExTextForm.Document_CommonDocumentOpenNewTab_Execute

procedure TExTextForm.Document_CommonDocumentOpenNewTab(const aParams: IvcmExecuteParamsPrim);
begin
 with (aParams.Data As IDocument_CommonDocumentOpenNewTab_Params) do
  Self.Document_CommonDocumentOpenNewTab_Execute(UserType);
end;//TExTextForm.Document_CommonDocumentOpenNewTab

procedure TExTextForm.DocumentBlock_GetSimilarDocsToBlock_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *5587AA310201_49539DBA029Dtest_var*
var
 l_eeSub: IeeSub;
//#UC END# *5587AA310201_49539DBA029Dtest_var*
begin
//#UC START# *5587AA310201_49539DBA029Dtest_impl*
 aParams.Op.Flag[vcm_ofEnabled] := TextSource.HasDocument
                               and Supports(aParams.Target, IeeSub, l_eeSub)
                               and (l_eeSub.LayerID = Ord(ev_sbtSub))
                               and Assigned(sdsDocInfo)
                               and sdsDocInfo.HasSimilarToFragment(l_eeSub.ID);
//#UC END# *5587AA310201_49539DBA029Dtest_impl*
end;//TExTextForm.DocumentBlock_GetSimilarDocsToBlock_Test

procedure TExTextForm.DocumentBlock_GetSimilarDocsToBlock_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *5587AA310201_49539DBA029Dexec_var*
var
 l_eeSub: IeeSub;
//#UC END# *5587AA310201_49539DBA029Dexec_var*
begin
//#UC START# *5587AA310201_49539DBA029Dexec_impl*
 if (dsDocument <> nil) and Supports(aParams.Target, IeeSub, l_eeSub) then
  dsDocument.OpenSimilarDocumentsToFragment(l_eeSub.ID);
//#UC END# *5587AA310201_49539DBA029Dexec_impl*
end;//TExTextForm.DocumentBlock_GetSimilarDocsToBlock_Execute

procedure TExTextForm.dftDrugSynchroViewQueryOpen(aSender: TObject);
 {* ���������� ������� dftDrugSynchroView.OnQueryOpen }
//#UC START# *664D52829DD3_49539DBA029D_var*
//#UC END# *664D52829DD3_49539DBA029D_var*
begin
//#UC START# *664D52829DD3_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *664D52829DD3_49539DBA029D_impl*
end;//TExTextForm.dftDrugSynchroViewQueryOpen

procedure TExTextForm.dftDictSubEntryQueryClose(aSender: TObject);
 {* ���������� ������� dftDictSubEntry.OnQueryClose }
//#UC START# *701BC3512B2B_49539DBA029D_var*
//#UC END# *701BC3512B2B_49539DBA029D_var*
begin
//#UC START# *701BC3512B2B_49539DBA029D_impl*
 DoSwitchToFirstTab;
//#UC END# *701BC3512B2B_49539DBA029D_impl*
end;//TExTextForm.dftDictSubEntryQueryClose

procedure TExTextForm.dftTranslationQueryClose(aSender: TObject);
 {* ���������� ������� dftTranslation.OnQueryClose }
//#UC START# *7401AD950C39_49539DBA029D_var*
//#UC END# *7401AD950C39_49539DBA029D_var*
begin
//#UC START# *7401AD950C39_49539DBA029D_impl*
 DoSwitchToFirstTab;
//#UC END# *7401AD950C39_49539DBA029D_impl*
end;//TExTextForm.dftTranslationQueryClose

procedure TExTextForm.dftChronologyQueryClose(aSender: TObject);
 {* ���������� ������� dftChronology.OnQueryClose }
//#UC START# *8418208BCCA0_49539DBA029D_var*
//#UC END# *8418208BCCA0_49539DBA029D_var*
begin
//#UC START# *8418208BCCA0_49539DBA029D_impl*
 DoSwitchToFirstTab;
//#UC END# *8418208BCCA0_49539DBA029D_impl*
end;//TExTextForm.dftChronologyQueryClose

procedure TExTextForm.dftDrugSynchroViewQueryMaximized(aSender: TObject);
 {* ���������� ������� dftDrugSynchroView.OnQueryMaximized }
//#UC START# *8A8A353C1A57_49539DBA029D_var*
//#UC END# *8A8A353C1A57_49539DBA029D_var*
begin
//#UC START# *8A8A353C1A57_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow;
//#UC END# *8A8A353C1A57_49539DBA029D_impl*
end;//TExTextForm.dftDrugSynchroViewQueryMaximized

procedure TExTextForm.dftAnnotationQueryClose(aSender: TObject);
 {* ���������� ������� dftAnnotation.OnQueryClose }
//#UC START# *918005C1AFE3_49539DBA029D_var*
//#UC END# *918005C1AFE3_49539DBA029D_var*
begin
//#UC START# *918005C1AFE3_49539DBA029D_impl*
 DoSwitchToFirstTab;
//#UC END# *918005C1AFE3_49539DBA029D_impl*
end;//TExTextForm.dftAnnotationQueryClose

procedure TExTextForm.dftDocSynchroViewQueryMaximized(aSender: TObject);
 {* ���������� ������� dftDocSynchroView.OnQueryMaximized }
//#UC START# *931EEB23421A_49539DBA029D_var*
//#UC END# *931EEB23421A_49539DBA029D_var*
begin
//#UC START# *931EEB23421A_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow;
//#UC END# *931EEB23421A_49539DBA029D_impl*
end;//TExTextForm.dftDocSynchroViewQueryMaximized

procedure TExTextForm.dftRelatedDocQueryClose(aSender: TObject);
 {* ���������� ������� dftRelatedDoc.OnQueryClose }
//#UC START# *A2BF852CD6C7_49539DBA029D_var*
//#UC END# *A2BF852CD6C7_49539DBA029D_var*
begin
//#UC START# *A2BF852CD6C7_49539DBA029D_impl*
 DoSwitchToFirstTab;
//#UC END# *A2BF852CD6C7_49539DBA029D_impl*
end;//TExTextForm.dftRelatedDocQueryClose

procedure TExTextForm.dftTranslationQueryOpen(aSender: TObject);
 {* ���������� ������� dftTranslation.OnQueryOpen }
//#UC START# *AF0C9051AEEF_49539DBA029D_var*
//#UC END# *AF0C9051AEEF_49539DBA029D_var*
begin
//#UC START# *AF0C9051AEEF_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *AF0C9051AEEF_49539DBA029D_impl*
end;//TExTextForm.dftTranslationQueryOpen

procedure TExTextForm.dftDocSynchroViewQueryOpen(aSender: TObject);
 {* ���������� ������� dftDocSynchroView.OnQueryOpen }
//#UC START# *BB5471A3EA8E_49539DBA029D_var*
//#UC END# *BB5471A3EA8E_49539DBA029D_var*
begin
//#UC START# *BB5471A3EA8E_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *BB5471A3EA8E_49539DBA029D_impl*
end;//TExTextForm.dftDocSynchroViewQueryOpen

procedure TExTextForm.dftMedicFirmSynchroViewQueryOpen(aSender: TObject);
 {* ���������� ������� dftMedicFirmSynchroView.OnQueryOpen }
//#UC START# *FD0B95191C1E_49539DBA029D_var*
//#UC END# *FD0B95191C1E_49539DBA029D_var*
begin
//#UC START# *FD0B95191C1E_49539DBA029D_impl*
 if HasDoc then
  OpenInWindow(False);
//#UC END# *FD0B95191C1E_49539DBA029D_impl*
end;//TExTextForm.dftMedicFirmSynchroViewQueryOpen

{$If NOT Defined(NoVCL)}
procedure TExTextForm.WndProc(var Message: TMessage);
//#UC START# *47E136A80191_49539DBA029D_var*
//#UC END# *47E136A80191_49539DBA029D_var*
begin
//#UC START# *47E136A80191_49539DBA029D_impl*
 if Message.Msg = g_GoToIntranetMessage then
  GoToIntranet
 else
  inherited WndProc(Message);
//#UC END# *47E136A80191_49539DBA029D_impl*
end;//TExTextForm.WndProc
{$IfEnd} // NOT Defined(NoVCL)

procedure TExTextForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_49539DBA029D_var*

 function lp_ShowMessage: Boolean;
 begin
  Result := (UserType = dftDocument) and
     Assigned(ViewArea) and
     Assigned(ViewArea.DocInfo) and
    (not Assigned(ViewArea.DocInfo.Doc) or
     not ViewArea.DocInfo.Doc.IsAlive);
 end;//function lp_ShowMessage: Boolean;

//#UC END# *47EA4E9002C6_49539DBA029D_var*
begin
//#UC START# *47EA4E9002C6_49539DBA029D_impl*
 inherited;
 if lp_ShowMessage then
  TbsDocumentMissingMessage.Show;
//#UC END# *47EA4E9002C6_49539DBA029D_impl*
end;//TExTextForm.FinishDataUpdate

function TExTextForm.DoSettingChanged(const aSettingId: TafwSettingId): Boolean;
 {* ���������� ��������� ��������� ��������� }
//#UC START# *47EA863A035C_49539DBA029D_var*
//#UC END# *47EA863A035C_49539DBA029D_var*
begin
//#UC START# *47EA863A035C_49539DBA029D_impl*
 Result := False;
 if (aSettingId = pi_Document_PermanentSelection) then
 begin
  Text.PersistentSelection :=
   Settings.LoadBoolean(pi_Document_PermanentSelection,
                        dv_Document_PermanentSelection);
  Result := True;
 end//aSettingId = pi_Document_PermanentSelection
 else
 if (aSettingId = pi_Document_ShowBlockBorders) then
 begin
  Text.ShowDocumentParts := Settings.LoadBoolean(pi_Document_ShowBlockBorders,
                                                 dv_Document_ShowBlockBorders);
  Result := True;
 end//aSettingId = pi_Document_ShowBlockBorders
 else
 if (aSettingId = pi_Document_ShowSpecial) then
 begin
  Text.DrawSpecial := Settings.LoadBoolean(pi_Document_ShowSpecial,
                                           dv_Document_ShowSpecial);
  Result := True;
 end//aSettingId = pi_Document_ShowSpecial
 else
 if (aSettingId = pi_Document_SubPanel_ShowBlocks) or
    (aSettingId = pi_Document_SubPanel_ShowBookmarks) or
    (aSettingId = pi_Document_SubPanel_ShowJurorComments) or
    (aSettingId = pi_Document_SubPanel_ShowUserComments) or
    (aSettingId = pi_Document_SubPanel_ShowSubNumbers) then
 begin
  UpdateSubPanelDescription;
  Result := True;
 end//aSettingId = pi_Document_SubPanel_ShowBlocks..
 else
 if (aSettingId = pi_Document_ShowTechComment) then
 begin
  UpdateTechComment;
  Result := True;
 end;//aSettingId = pi_Document_ShowTechComment
//#UC END# *47EA863A035C_49539DBA029D_impl*
end;//TExTextForm.DoSettingChanged

procedure TExTextForm.SettingsReplaceFinish;
//#UC START# *47EA8B9601FE_49539DBA029D_var*
//#UC END# *47EA8B9601FE_49539DBA029D_var*
begin
//#UC START# *47EA8B9601FE_49539DBA029D_impl*
 inherited;
 DoSettingsChanged;
//#UC END# *47EA8B9601FE_49539DBA029D_impl*
end;//TExTextForm.SettingsReplaceFinish

procedure TExTextForm.UserSettingsChanged;
 {* ���������� ��������� ������������ }
//#UC START# *4958BE910345_49539DBA029D_var*
//#UC END# *4958BE910345_49539DBA029D_var*
begin
//#UC START# *4958BE910345_49539DBA029D_impl*
 inherited;
 DoSettingsChanged;
//#UC END# *4958BE910345_49539DBA029D_impl*
end;//TExTextForm.UserSettingsChanged

{$If NOT Defined(NoVCM)}
procedure TExTextForm.NotifyDataSourceChanged(const anOld: IvcmViewAreaController;
 const aNew: IvcmViewAreaController);
 {* ��������� �������� ������. ��� ���������� � �������� }
//#UC START# *497469C90140_49539DBA029D_var*

 procedure lp_CheckBaseSearchArea;
 var
  l_BaseSearcher: InsBaseSearcher;
  l_BSPresentation: InsBaseSearchPresentation;
 begin
  l_BaseSearcher := TnsBaseSearchService.Instance.GetBaseSearcher(As_IvcmEntityForm);
  if l3IEQ(Self as InsBaseSearchPresentation, l_BaseSearcher.Presentation) then
   TnsBaseSearchService.Instance.GetBaseSearcher(As_IvcmEntityForm).WindowData.Area := ns_saText;
   // - http://mdp.garant.ru/pages/viewpage.action?pageId=611210158
 end;

var
 l_Doc: IDocument;
 l_Caption: Il3CString;
//#UC END# *497469C90140_49539DBA029D_var*
begin
//#UC START# *497469C90140_49539DBA029D_impl*
 inherited;
 if (aNew <> nil) then
 begin
  CheckLinkedWindows;
  if (anOld = nil) then
   lp_CheckBaseSearchArea;
   
  if (dsBaseDocument <> nil) AND (dsBaseDocument.DocInfo <> nil) then
   l_Doc := dsBaseDocument.DocInfo.Doc;
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=590755363
  // ����� ���������� Caption, ����� ��� �������� ��������� � ����� ������� ���
  // ������������ �� ��� ��������� � ����� ����� ������������ �� ��� ���,
  // ���� �� ��������� TextSourceDocumentChanged, �.�. ���� ������������ ���
  // �� ���������� �������. http://mdp.garant.ru/pages/viewpage.action?pageId=340174500
  if (l_Doc <> nil) then
  try
   UpdateDocumentCaption(l_Doc);
  finally
   l_Doc := nil;
  end;//try..finally
 end;//if (aNew <> nil)...

 if Assigned(ViewArea) then
  Text.IsStaticText := ViewArea.IsReadOnly; // ������ ����� ��� ������ ���� �� ����� ��� �� ���.
                                            // http://mdp.garant.ru/pages/viewpage.action?pageId=401506914
//#UC END# *497469C90140_49539DBA029D_impl*
end;//TExTextForm.NotifyDataSourceChanged
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TExTextForm.DoInit(aFromHistory: Boolean);
 {* ������������� �����. ��� ���������� � �������� }
//#UC START# *49803F5503AA_49539DBA029D_var*
//#UC END# *49803F5503AA_49539DBA029D_var*
begin
//#UC START# *49803F5503AA_49539DBA029D_impl*
 inherited;
 nsWarnImages;
 f_LastBookmarkIndex := -1;
 f_InGoToInternet := False;
 LoadFromSettings;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=290953654
(* with SubPanel do
 begin
  if (UserType in [dftDocument, dftDrug]) then
   SubDescriptors := nsDocumentRes.SubDescriptors
  else
   SubDescriptors := nsDocumentRes.LiteSubDescriptors;
 end;//with SubPanel do*)
 //LoadFromSettings;
 // - ���������� ����
 // http://mdp.garant.ru/pages/viewpage.action?pageId=290953654
//#UC END# *49803F5503AA_49539DBA029D_impl*
end;//TExTextForm.DoInit
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TExTextForm.DoSaveState(out theState: IvcmBase;
 aStateType: TvcmStateType;
 aForClone: Boolean): Boolean;
 {* ��������� ��������� �����. ��� ���������� � �������� }
//#UC START# *49806ED503D5_49539DBA029D_var*
var
 l_InnerState: IvcmBase;
 l_State: IExTextFormState;
//#UC END# *49806ED503D5_49539DBA029D_var*
begin
//#UC START# *49806ED503D5_49539DBA029D_impl*
 Result := inherited DoSaveState(l_InnerState, aStateType, aForClone);
 l_State := TExTextFormState.Make(l_InnerState,
   Text.ShowUserComments,
   Text.ShowComments,
   Text.ShowVersionComments,
   f_eeSubIdForTypedCorrespondentList);
 theState := l_State;
//#UC END# *49806ED503D5_49539DBA029D_impl*
end;//TExTextForm.DoSaveState
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TExTextForm.DoLoadState(const aState: IvcmBase;
 aStateType: TvcmStateType): Boolean;
 {* ��������� ��������� �����. ��� ���������� � �������� }
//#UC START# *49807428008C_49539DBA029D_var*
var
 l_State: IExTextFormState;
//#UC END# *49807428008C_49539DBA029D_var*
begin
//#UC START# *49807428008C_49539DBA029D_impl*
 if Supports(aState, IExTextFormState, l_State) then
 begin
  Text.ShowUserComments := l_State.NeedShowUserComments;
  Text.ShowComments := l_State.NeedShowComments;
  Text.ShowVersionComments := l_State.NeedShowVersionComments;
  f_eeSubIdForTypedCorrespondentList := l_State.eeSubIdForTypedCorrespondentList;
  Result := inherited DoLoadState(aState, aStateType);

  // ���� ������� ������, ������� ����� ��� ����, ����� Text.ShowUserComments
  // �� ����������� ������������� � True � InvalidateDataSources,
  // ��� ��������� ������ "FromHistory" � "NeedProcess"
  // �� ��� ���� ����� FormDataChangedInfo.
  // http://mdp.garant.ru/pages/viewpage.action?pageId=609420481
  FormDataChangedInfo.Init(True);
  FormDataChangedInfo.NeedProcess := True;
 end
 else
 begin
  Assert(False);
  Result := inherited DoLoadState(aState, aStateType);
 end;
//#UC END# *49807428008C_49539DBA029D_impl*
end;//TExTextForm.DoLoadState
{$IfEnd} // NOT Defined(NoVCM)

function TExTextForm.CanAddToControl: Boolean;
 {* ����� �� ��������� �� �������� }
//#UC START# *4988675A0308_49539DBA029D_var*
//#UC END# *4988675A0308_49539DBA029D_var*
begin
//#UC START# *4988675A0308_49539DBA029D_impl*
 Result := (UserType = dftDocument);
//#UC END# *4988675A0308_49539DBA029D_impl*
end;//TExTextForm.CanAddToControl

{$If NOT Defined(NoVCM)}
procedure TExTextForm.SetPositionByDS;
 {* ���������� ����� ����� �������� ������� ��������� �������� ������. [$136258455] }
//#UC START# *498953170108_49539DBA029D_var*
//#UC END# *498953170108_49539DBA029D_var*
begin
//#UC START# *498953170108_49539DBA029D_impl*
 inherited;
 ChangePositionByDataSource;
//#UC END# *498953170108_49539DBA029D_impl*
end;//TExTextForm.SetPositionByDS
{$IfEnd} // NOT Defined(NoVCM)

function TExTextForm.DoMakeLinkDocInfo(const aDocument: IDocument;
 aPointType: TDocumentPositionType;
 aSub: Cardinal): IdeDocInfo;
//#UC START# *4A815FB3005D_49539DBA029D_var*
//#UC END# *4A815FB3005D_49539DBA029D_var*
begin
//#UC START# *4A815FB3005D_49539DBA029D_impl*
 Assert(ViewArea <> nil);
 Result := ViewArea.MakeGotoPointData(aDocument, aPointType, aSub);
//#UC END# *4A815FB3005D_49539DBA029D_impl*
end;//TExTextForm.DoMakeLinkDocInfo

function TExTextForm.DoProcessLocalLink(const aDocument: IDocument;
 aPointType: TDocumentPositionType;
 aSub: Cardinal;
 aBehaviour: TbsProcessHyperLinkBehaviour): Boolean;
 {* ��������� ��������� ������ }
//#UC START# *4A8160720125_49539DBA029D_var*
//#UC END# *4A8160720125_49539DBA029D_var*
begin
//#UC START# *4A8160720125_49539DBA029D_impl*
 Result := false;
 if (UserType in [dftDocSynchroView,
                  dftRelatedSynchroView,
                  dftMedicFirmSynchroView] +
                 [dftAACLeft,
                  dftAACRight,
                  dftAACContentsLeft,
                  dftAACContentsRight])
                 // - � ��� ��-������ ���� ��������� ����� ���������
                 //   �.�. ����� ������������ ���� ������, ���� ����� ��������
                 //   ��������� 
  then
  Exit;
 if aDocument.GetDocType = DT_BOOK then
  Exit;
 Result := inherited DoProcessLocalLink(aDocument, aPointType, aSub, aBehaviour);
//#UC END# *4A8160720125_49539DBA029D_impl*
end;//TExTextForm.DoProcessLocalLink

{$If NOT Defined(NoVCM)}
function TExTextForm.NeedDrawCaption: Boolean;
 {* ����� �� �������� ��������� ���� }
//#UC START# *4A84183701B9_49539DBA029D_var*
//#UC END# *4A84183701B9_49539DBA029D_var*
begin
//#UC START# *4A84183701B9_49539DBA029D_impl*
 Result := not (UserType in [dftAACLeft,
                             dftAACRight,
                             dftAACContentsLeft,
                             dftAACContentsRight]);
//#UC END# *4A84183701B9_49539DBA029D_impl*
end;//TExTextForm.NeedDrawCaption
{$IfEnd} // NOT Defined(NoVCM)

function TExTextForm.NeedsStatusBarItems: Boolean;
 {* ����������, ��� �������� � ��������� ������ ���� ���� ����������� }
//#UC START# *4A8E5CEC021F_49539DBA029D_var*
//#UC END# *4A8E5CEC021F_49539DBA029D_var*
begin
//#UC START# *4A8E5CEC021F_49539DBA029D_impl*
 Result := GetNeedsStatusBarItems;
//#UC END# *4A8E5CEC021F_49539DBA029D_impl*
end;//TExTextForm.NeedsStatusBarItems

{$If NOT Defined(NoVCM)}
procedure TExTextForm.InitControls;
 {* ��������� ������������� ���������. ��� ���������� � �������� }
//#UC START# *4A8E8F2E0195_49539DBA029D_var*
//#UC END# *4A8E8F2E0195_49539DBA029D_var*
begin
//#UC START# *4A8E8F2E0195_49539DBA029D_impl*
 inherited;
 TextSource.OnMakeDocumentContainer := TextSourceMakeDocumentContainer;
 TextSource.OnDocumentChanged := TextSourceDocumentChanged;
 TextSource.OnTOCCreated := Self.TextSourceTOCCreated;
 SubPanel.Color := clWhite;
 Text.LeftIndentDelta := 7{2};
                      // ^ http://mdp.garant.ru/pages/viewpage.action?pageId=294590299
 Text.OnFocusViaMouseSet := Self.DoFocusViaMouseSet;
 Text.OnHistory := Self.OnHistoryState;
 Assert(not Assigned(Text.OnHyperlinkNavigate));
 Text.OnHyperlinkNavigate := Self.DoHyperlinkNavigate;
 Text.OnZOrderChanging := Self.DoTextZOrderChanging;
//#UC END# *4A8E8F2E0195_49539DBA029D_impl*
end;//TExTextForm.InitControls
{$IfEnd} // NOT Defined(NoVCM)

procedure TExTextForm.VersionCommentsVisibleInvertedByUser(NewState: Boolean);
//#UC START# *4AAA150A0244_49539DBA029D_var*
//#UC END# *4AAA150A0244_49539DBA029D_var*
begin
//#UC START# *4AAA150A0244_49539DBA029D_impl*
 TnsSwitchVersionCommentsEvent.Log(NewState);
//#UC END# *4AAA150A0244_49539DBA029D_impl*
end;//TExTextForm.VersionCommentsVisibleInvertedByUser

{$If NOT Defined(NoVCM)}
function TExTextForm.DoGetTabInfo(out theCaption: Il3CString;
 out theItemIndex: Integer): Boolean;
 {* ���������� � ��������, � ������� ����������� �����. ��� ���������� � �������� }
//#UC START# *4AC497FD00A2_49539DBA029D_var*
//#UC END# *4AC497FD00A2_49539DBA029D_var*
begin
//#UC START# *4AC497FD00A2_49539DBA029D_impl*
 Result := not (UserType in [dftNone,
                             dftDocument,
                             dftRelatedDoc,
                             dftDocSynchroView,
                             dftRelatedSynchroView,
                             dftDictEntry,
                             //dftDictSubEntry,
                             dftAnnotation,
                             //dftAutoreferatAfterSearch,
                             //dftConsultation,
                             dftTranslation,
                             dftAnnotationSynchroView,
                             dftTips,
                             dftMedDictEntry,
                             //dftAutoreferat,
                             //dftDrug,
                             dftMedicFirm,
                             dftMedicFirmSynchroView]);
 if Result then
 begin
  theCaption := GetCurrentCaption;
  theItemIndex := GetCurrentImage;
 end;//UserType in..
//#UC END# *4AC497FD00A2_49539DBA029D_impl*
end;//TExTextForm.DoGetTabInfo
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
function TExTextForm.NeedSetMyFocus: Boolean;
//#UC START# *4B4F13E80365_49539DBA029D_var*
//#UC END# *4B4F13E80365_49539DBA029D_var*
begin
//#UC START# *4B4F13E80365_49539DBA029D_impl*
 Case UserType of
  dftAACContentsLeft:
   Result := true;
  dftAACRight:
   Result := false;
  dftAACContentsRight:
   Result := false;
  dftAACLeft:
   Result := true;
  else
   Result := inherited NeedSetMyFocus;
 end;//Case UserType
//#UC END# *4B4F13E80365_49539DBA029D_impl*
end;//TExTextForm.NeedSetMyFocus
{$IfEnd} // NOT Defined(NoVCM)

procedure TExTextForm.DoDocumentShowTechCommentsExecute;
//#UC START# *4C8DCD3B015C_49539DBA029D_var*
//#UC END# *4C8DCD3B015C_49539DBA029D_var*
begin
//#UC START# *4C8DCD3B015C_49539DBA029D_impl*
 with Settings do
  SaveBoolean(pi_Document_ShowTechComment,
              not LoadBoolean(pi_Document_ShowTechComment,
                              dv_Document_ShowTechComment),
              dv_Document_ShowTechComment);
//#UC END# *4C8DCD3B015C_49539DBA029D_impl*
end;//TExTextForm.DoDocumentShowTechCommentsExecute

function TExTextForm.pm_GetHyperlinkSubID: Integer;
//#UC START# *4CE41B300315_49539DBA029Dget_var*
var
 l_Para : IeePara;
//#UC END# *4CE41B300315_49539DBA029Dget_var*
begin
//#UC START# *4CE41B300315_49539DBA029Dget_impl*
 //����� ��� ���-���������� ������������� ������ �� Para,
 //��-�� ���� ��� �������� ������ �� ����������� �������������
 //http://mdp.garant.ru/pages/viewpage.action?pageId=401514692
 if (UserType in [dftAACContentsRight, dftAACContentsLeft])
  and Assigned(dsDocument) and Assigned(dsDocument.DocInfo) then
 begin
  if (dsDocument.DocInfo.Pos.rRefType = dptSub) then
   Result := dsDocument.DocInfo.Pos.rPos
  else//(dsDocument.DocInfo.Pos.rRefType = dptSub)
  if (dsDocument.DocInfo.Pos.rRefType = dptPara) then
   Result := Integer(Cardinal(dsDocument.DocInfo.Pos.rPos) OR POSITION_TYPE_PARA_ID);
 end//(UserType in [dftAACContentsRight, dftAACContentsLeft])
 else
 begin
  l_Para := GetParaForPositionning;
  if (l_Para = nil) then
   Result := inherited pm_GetHyperlinkSubID
  else
  begin
   if (l_Para.Subs <> nil) AND (l_Para.Subs.Count > 0) then
    Result := l_Para.Subs.Subs[0].ID
   else
   begin
    Result := l_Para.ID;
    if (Result <> 0) then
     Result := Integer(Cardinal(Result) OR POSITION_TYPE_PARA_ID);
   end;//l_Para.Subs <> nil
  end;//l_Para = nil
 end;
//#UC END# *4CE41B300315_49539DBA029Dget_impl*
end;//TExTextForm.pm_GetHyperlinkSubID

{$If NOT Defined(NoVCM)}
procedure TExTextForm.NotifyUserTypeSet;
//#UC START# *4D78E2BB0211_49539DBA029D_var*
const
 cnAACRightLeftIndentMin = 60;
var
 l_LeftIndent: Integer;
//#UC END# *4D78E2BB0211_49539DBA029D_var*
begin
//#UC START# *4D78E2BB0211_49539DBA029D_impl*
 inherited;
 if (UserType in [dftAACRight, dftAACLeft, dftAACContentsRight, dftAACContentsLeft]) then
  Text.NeedDrawDocumentEdge := False;

 case UserType of
  dftAACContentsLeft:
   begin
    Text.AACLike := nev_aacLeft;
    Text.Color := cAACContentsBackColor;
    Text.RMargin := 0;
    Text.LMargin := 0;
    Text.LeftIndentDelta := 0;
   end;
  dftAACContentsRight:
   begin
    Text.AACLike := nev_aacRight;
    l_LeftIndent := NativeMainForm.AsForm.Get_VCLWinControl.Width * 7 div 100;
    if l_LeftIndent < cnAACRightLeftIndentMin then
     l_LeftIndent := cnAACRightLeftIndentMin;
    Text.LeftIndentDelta := l_LeftIndent - Text.LMargin; // http://mdp.garant.ru/pages/viewpage.action?pageId=388860126
    Text.LeftIndentDelta := Text.LeftIndentDelta - 23; // http://mdp.garant.ru/pages/viewpage.action?pageId=617799931
   end;
  dftAACLeft:
   begin
    Text.AACLike := nev_aacTextLeft;
    Text.LeftIndentDelta := 45; // http://mdp.garant.ru/pages/viewpage.action?pageId=390577778
    Text.RMargin := 45;
   end;
  dftAACRight:
   begin
    //Text.LeftIndentDelta := AACTextContainerPrim_Form.LeftIndentDeltaForAACRight;
    Text.AACLike := nev_aacTextRight;
    Text.LeftIndentDelta := 35 - Text.LMargin;
    Text.RMargin := 10;
   end;
 else
  Text.AACLike := nev_aacNone;
 end;
//#UC END# *4D78E2BB0211_49539DBA029D_impl*
end;//TExTextForm.NotifyUserTypeSet
{$IfEnd} // NOT Defined(NoVCM)

procedure TExTextForm.DoSetHyperlinkCallStatus(aValue: Boolean);
 {* ���������� ����, ������������ ������������� ������� �� ������ }
//#UC START# *4F382E2D01C1_49539DBA029D_var*
//#UC END# *4F382E2D01C1_49539DBA029D_var*
begin
//#UC START# *4F382E2D01C1_49539DBA029D_impl*
 f_HyperlinkCallStatus := aValue;
//#UC END# *4F382E2D01C1_49539DBA029D_impl*
end;//TExTextForm.DoSetHyperlinkCallStatus

{$If NOT Defined(NoVCM)}
procedure TExTextForm.FormInsertedIntoContainer;
//#UC START# *4F7C65380244_49539DBA029D_var*
var
 l_VScroll: TvtScrollBar;
//#UC END# *4F7C65380244_49539DBA029D_var*
begin
//#UC START# *4F7C65380244_49539DBA029D_impl*
 inherited;
 SetFocusToTextInAAC;
 if (UserType in [dftAACRight, dftAACLeft, dftAACContentsRight, dftAACContentsLeft]) then
 begin
  l_VScroll := Op_AACTextContainer_GetVScrollBar.Call(Aggregate, (UserType = dftAACLeft) or (UserType = dftAACContentsLeft));
  if Assigned(l_VScroll) then
   Text.VScrollBar := l_VScroll;
  if (UserType = dftAACRight) then
   Op_AACTextContainer_SetJumpTo.Call(Aggregate, Self.JumpTo);
 end;//UserType in [dftAACRight, dftAACLeft]
//#UC END# *4F7C65380244_49539DBA029D_impl*
end;//TExTextForm.FormInsertedIntoContainer
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TExTextForm.BecomeVisible;
//#UC START# *4F7C808A0349_49539DBA029D_var*
//#UC END# *4F7C808A0349_49539DBA029D_var*
begin
//#UC START# *4F7C808A0349_49539DBA029D_impl*
 inherited;
 SetFocusToTextInAAC;
//#UC END# *4F7C808A0349_49539DBA029D_impl*
end;//TExTextForm.BecomeVisible
{$IfEnd} // NOT Defined(NoVCM)

procedure TExTextForm.ClearFields;
begin
 f_ControlMap := nil;
 f_RecallCreateTOCTree := nil;
 inherited;
end;//TExTextForm.ClearFields

{$If NOT Defined(NoVCM)}
function TExTextForm.GetIsMainObjectForm: Boolean;
//#UC START# *501174B10018_49539DBA029D_var*
//#UC END# *501174B10018_49539DBA029D_var*
begin
//#UC START# *501174B10018_49539DBA029D_impl*
 Case UserType of
  dftAACContentsLeft,
  dftAACRight:
   Result := false;
  dftAACContentsRight,
  dftAACLeft:
   Result := true;
  else
   Result := inherited GetIsMainObjectForm;
 end;//Case UserType
//#UC END# *501174B10018_49539DBA029D_impl*
end;//TExTextForm.GetIsMainObjectForm
{$IfEnd} // NOT Defined(NoVCM)

function TExTextForm.GetBehaviourFromEffects(anEffects: TafwJumpToEffects): TbsProcessHyperLinkBehaviour;
//#UC START# *53A95A1A0073_49539DBA029D_var*
//#UC END# *53A95A1A0073_49539DBA029D_var*
begin
//#UC START# *53A95A1A0073_49539DBA029D_impl*
 Result := inherited GetBehaviourFromEffects(anEffects);
 if UserType = dftAACContentsLeft then
  if Result in [phbInNewTabNoActivate, phbInNewTabActivate, phbInNewWindow] then // ������, ����������, ��� ������. �� ����� �������� ������ ���������, ��� ��� ����� ����� � ���������.
   Result := phbInSameContainer;
//#UC END# *53A95A1A0073_49539DBA029D_impl*
end;//TExTextForm.GetBehaviourFromEffects

function TExTextForm.GetDocumentShortName(const aDoc: IDocument;
 aExportSelection: Boolean): Il3CString;
//#UC START# *53D8E4B702E4_49539DBA029D_var*
//#UC END# *53D8E4B702E4_49539DBA029D_var*
begin
//#UC START# *53D8E4B702E4_49539DBA029D_impl*
 if (UserType in [dftAutoreferat, dftAutoreferatAfterSearch]) then
  Result := nsGetDocumentName(aDoc)
  // - ������ ��� �������� ����� ������ ������ ������ ������ �������� ���,
  // ��� ��������
  // http://mdp.garant.ru/pages/viewpage.action?pageId=569225205
 else
  Result := inherited GetDocumentShortName(aDoc, aExportSelection);
//#UC END# *53D8E4B702E4_49539DBA029D_impl*
end;//TExTextForm.GetDocumentShortName

{$If NOT Defined(NoVCM)}
function TExTextForm.DoGetTabCaption: IvcmCString;
//#UC START# *53F1C6EF02C9_49539DBA029D_var*
//#UC END# *53F1C6EF02C9_49539DBA029D_var*
begin
//#UC START# *53F1C6EF02C9_49539DBA029D_impl*
 Result := f_TabCaption;
//#UC END# *53F1C6EF02C9_49539DBA029D_impl*
end;//TExTextForm.DoGetTabCaption
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
function TExTextForm.DoGetFormSetTabCaption: IvcmCString;
//#UC START# *54058CBC0182_49539DBA029D_var*
//#UC END# *54058CBC0182_49539DBA029D_var*
begin
//#UC START# *54058CBC0182_49539DBA029D_impl*
 Result := DoGetTabCaption
//#UC END# *54058CBC0182_49539DBA029D_impl*
end;//TExTextForm.DoGetFormSetTabCaption
{$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)

{$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
function TExTextForm.DoGetTabImageIndex: Integer;
//#UC START# *543E3AA801D0_49539DBA029D_var*
//#UC END# *543E3AA801D0_49539DBA029D_var*
begin
//#UC START# *543E3AA801D0_49539DBA029D_impl*
 Result := 0;
 case UserType of
  dftDrug:
   Result := NsTabIconIndex(titDrug);
  dftMedicFirm:
   Result := NsTabIconIndex(titMedicFirm);
  dftConsultation:
   Result := NsTabIconIndex(titConsultation);   
 else
  if (DataSource <> nil) and (DataSource.UseCaseController <> nil) then
   Result := DataSource.UseCaseController.FormSetImageIndex;
 end;
 if (Result <= 0) then
  Result := NsTabIconIndex(titDocumentNormal);
//#UC END# *543E3AA801D0_49539DBA029D_impl*
end;//TExTextForm.DoGetTabImageIndex
{$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)

{$If NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)}
function TExTextForm.DoGetCanDefineFormSetIcon: Boolean;
//#UC START# *544609B9032D_49539DBA029D_var*
//#UC END# *544609B9032D_49539DBA029D_var*
begin
//#UC START# *544609B9032D_49539DBA029D_impl*
 Result := (UserType <> dftMedicFirmSynchroView);
//#UC END# *544609B9032D_49539DBA029D_impl*
end;//TExTextForm.DoGetCanDefineFormSetIcon
{$IfEnd} // NOT Defined(NoVCM) AND NOT Defined(NoVGScene) AND NOT Defined(NoTabs)

procedure TExTextForm.AfterOpenHyperlinkInNewTab;
//#UC START# *544E049F00F7_49539DBA029D_var*
//#UC END# *544E049F00F7_49539DBA029D_var*
begin
//#UC START# *544E049F00F7_49539DBA029D_impl*
 UpdateSubPanelDescription;
//#UC END# *544E049F00F7_49539DBA029D_impl*
end;//TExTextForm.AfterOpenHyperlinkInNewTab

function TExTextForm.GetParaIDForSaveInWorkJournal: Integer;
//#UC START# *54EED7B70228_49539DBA029D_var*
//#UC END# *54EED7B70228_49539DBA029D_var*
begin
//#UC START# *54EED7B70228_49539DBA029D_impl*
 if Text.HasDocument then
  Result := Inherited GetParaIDFOrSaveInWorkJournal
 else
 if (not f_DocumentLoaded) then
 begin
  // ���� �������� ������� �� ����������� - ������ ������� �� DocInfo
  if (sdsBaseDocument <> nil) and
     (sdsBaseDocument.DocInfo <> nil) then
   Result := sdsBaseDocument.DocInfo.Pos.rPos
  else
   Result := 0;
 end;
 // - http://mdp.garant.ru/pages/viewpage.action?pageId=589874196 
//#UC END# *54EED7B70228_49539DBA029D_impl*
end;//TExTextForm.GetParaIDForSaveInWorkJournal

function TExTextForm.NeedSaveInWorkJournal: Boolean;
//#UC START# *54EED7DF0249_49539DBA029D_var*
//#UC END# *54EED7DF0249_49539DBA029D_var*
begin
//#UC START# *54EED7DF0249_49539DBA029D_impl*
 Result := Inherited NeedSaveInWorkJournal and
           (Text.HasDocument or
            ((not f_DocumentLoaded) and
            (sdsBaseDocument <> nil) and
            (sdsBaseDocument.DocInfo <> nil)));
 // - http://mdp.garant.ru/pages/viewpage.action?pageId=589874196
//#UC END# *54EED7DF0249_49539DBA029D_impl*
end;//TExTextForm.NeedSaveInWorkJournal

{$If NOT Defined(NoVCM)}
function TExTextForm.DoGetNeedAddFormToTasksPanel: Boolean;
//#UC START# *54F458DD01CE_49539DBA029D_var*
//#UC END# *54F458DD01CE_49539DBA029D_var*
begin
//#UC START# *54F458DD01CE_49539DBA029D_impl*
 Result := (UserType <> dftDictSubEntry) and Inherited DoGetNeedAddFormToTasksPanel;
 // - http://mdp.garant.ru/pages/viewpage.action?pageId=588809860
//#UC END# *54F458DD01CE_49539DBA029D_impl*
end;//TExTextForm.DoGetNeedAddFormToTasksPanel
{$IfEnd} // NOT Defined(NoVCM)

initialization
//#UC START# *4C40048600C1*
 g_GoToIntranetMessage := RegisterWindowMessage('{A6BE0224-FE97-4984-8E91-B24104812165}');
//#UC END# *4C40048600C1*
 str_ViewChangesOpName.Init;
 {* ������������� str_ViewChangesOpName }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TExTextForm);
 {* ����������� ExText }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
