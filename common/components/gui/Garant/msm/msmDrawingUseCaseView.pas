unit msmDrawingUseCaseView;

// ������: "w:\common\components\gui\Garant\msm\msmDrawingUseCaseView.pas"
// ���������: "SimpleClass"
// ������� ������: "TmsmDrawingUseCaseView" MUID: (57D2DF7E00CE)

{$Include w:\common\components\gui\Garant\msm\msm.inc}

interface

uses
 l3IntfUses
 , msmConcreteUseCases
 , msmControllers
 , msmUseCase
 , msmUseCases
 //#UC START# *57D2DF7E00CEintf_uses*
 //#UC END# *57D2DF7E00CEintf_uses*
;

type
 //#UC START# *57D2DF7E00CEci*
 //#UC END# *57D2DF7E00CEci*
 _ConcreteUseCase_ = ImsmDrawingUseCase;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\gui\Garant\msm\msmUseCaseView.imp.pas}
 //#UC START# *57D2DF7E00CEcit*
 //#UC END# *57D2DF7E00CEcit*
 TmsmDrawingUseCaseView = class(_msmUseCaseView_, ImsmDrawingUseCaseView)
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure DoActivate; override;
   procedure DoActivated; override;
  public
   constructor Create(const aUseCase: ImsmDrawingUseCase;
    const aMainZone: ImsmViewParent;
    const aChildZone: ImsmViewParent;
    const aLeftZone: ImsmViewParent;
    const aFloatingZone: ImsmViewParent;
    const aTopZone: ImsmViewParent); reintroduce;
   class function Make(const aUseCase: ImsmDrawingUseCase;
    const aMainZone: ImsmViewParent;
    const aChildZone: ImsmViewParent;
    const aLeftZone: ImsmViewParent;
    const aFloatingZone: ImsmViewParent;
    const aTopZone: ImsmViewParent): ImsmDrawingUseCaseView; reintroduce;
 //#UC START# *57D2DF7E00CEpubl*
 //#UC END# *57D2DF7E00CEpubl*
 end;//TmsmDrawingUseCaseView

implementation

uses
 l3ImplUses
 , msmParentedViewControllerWithOwnership
 , msmModel
 , msmPanel
 , msmProportionalPanel
 , msmGenerateElement
 , msmSaveChangedElements
 , msmCopySelection
 , msmPaste
 , msmWordsManaging
 , msmSomeWordsListModel
 , msmSomeModelElementsListModel
 , msmSomeModelElementsList
 , msmMultiPanelViewParentHorz
 , msmMultiPanelViewParentVert
 , msmMultiPanelViewParent
 , msmButtonEditViewController
 , msmAddElement
 , msmDeleteSelection
 , msmChangeProperties
 , msmChangePropertiesBinding
 , msmLoadedWordsListModel
 , l3Memory
 //#UC START# *57D2DF7E00CEimpl_uses*
 , SysUtils
 , msmOpenInNewWindow
 , msmShowInNavigator
 , msmUpToParent
 , msmOperationsSeparator
 , msmListAndTreeInterfaces
 , msmListAndTreeViewUtils
 , msmCurrentElementShowAsListBinding
 , msmListOpener
 , msmListModel
 , msmListViewController
 , msmElementViews
 , msmDrawingViewController
 , msmTreeViewController
 , msmParentedViewController
 , msmModelElement
 , msmConcreteModels
 , msmListOwnerShowAsListBinding
 //#UC END# *57D2DF7E00CEimpl_uses*
;

type _Instance_R_ = TmsmDrawingUseCaseView;

{$Include w:\common\components\gui\Garant\msm\msmUseCaseView.imp.pas}

constructor TmsmDrawingUseCaseView.Create(const aUseCase: ImsmDrawingUseCase;
 const aMainZone: ImsmViewParent;
 const aChildZone: ImsmViewParent;
 const aLeftZone: ImsmViewParent;
 const aFloatingZone: ImsmViewParent;
 const aTopZone: ImsmViewParent);
//#UC START# *57D2DFA70064_57D2DF7E00CE_var*

 function AddNavigatorOperations(const aController: ImsmController; const aModel: ImsmListLikeModel): ImsmController;
 begin//AddNavigatorOperations
  aController.AddOperation(TmsmOpenInNewWindow.Make('Open in new window', aModel));
  aController.AddOperation(TmsmOperationsSeparator.Make);
  aController.AddOperation(TmsmGenerateElement.Make('Generate element', aModel));
  aController.AddOperation(TmsmOperationsSeparator.Make);
  aController.AddOperation(TmsmSaveChangedElements.Make('Save changed', aModel));
  aController.AddOperation(TmsmOperationsSeparator.Make);
  aController.AddOperation(TmsmCopySelection.Make('Copy', aModel));
  aController.AddOperation(TmsmPaste.Make('Paste', aModel));
  aController.AddOperation(TmsmDeleteSelection.Make('Delete', aModel));
  aController.AddOperation(TmsmOperationsSeparator.Make);
  aController.AddOperation(TmsmAddElement.Make('Add element', aModel));
  aController.AddOperation(TmsmOperationsSeparator.Make);
  aController.AddOperation(TmsmChangeProperties.Make('Properties', aModel));
  Result := aController;
 end;//AddNavigatorOperations

 function AddReadonlyListOperations(const aController: ImsmController; const aModel: ImsmListLikeModel): ImsmController;
 begin//
  Assert(aUseCase.FloatingNavigator <> nil);
  AddNavigatorOperations(aController, aModel);
  aController.AddOperation(TmsmOperationsSeparator.Make);
  aController.AddOperation(TmsmShowInNavigator.Make('Show in navigator', aModel, aUseCase.FloatingNavigator));
  Result := aController;
 end;//AddReadonlyListOperations

 function AddListLikeOperations(const aController: ImsmController; const aModel: ImsmListLikeModel): ImsmController;
 begin//AddListLikeOperations
  AddReadonlyListOperations(aController, aModel);
  Result := aController;
 end;//AddListLikeOperations

 function AddListOperations(const aController: ImsmController; const aModel: ImsmListModel): ImsmController;
 begin//AddListOperations
  AddListLikeOperations(aController, aModel);
  Result := aController;
 end;//AddListOperations

 function AddMainListOperations(const aController: ImsmController; const aModel: ImsmListModel): ImsmController;
 begin//AddMainListOperations
  aController.AddOperation(TmsmUpToParent.Make('Up to parent', aModel));
  aController.AddOperation(TmsmOperationsSeparator.Make);
  AddListOperations(aController, aModel);
  Result := aController;
 end;//AddMainListOperations

 function AddDiagramOperations(const aController: ImsmController; const aModel: ImsmDrawingModel): ImsmController;
 begin//AddDiagramOperations
  aController.AddOperation(TmsmUpToParent.Make('Parent diagram', aModel));
  aController.AddOperation(TmsmOperationsSeparator.Make);
  AddListOperations(aController, aModel);
  Result := aController;
 end;//AddDiagramOperations

 function DisableActionElementEvent(const aController: ImsmController): ImsmController;
 begin//DisableActionElementEvent
  aController.DisableEvent(ActionElementEvent.Instance);
  Result := aController;
 end;//DisableActionElementEvent

 procedure AddChildView(const aChildModel: ImsmListModel; const aParent: ImsmViewParent; const aContext: TmsmListViewtInitContext); overload;
 begin//AddChildView
  Bind(TmsmCurrentElementShowAsListBinding.Make(aUseCase.MainList, aChildModel));
  Bind(TmsmCurrentElementShowAsListBinding.Make(aUseCase.Drawing, aChildModel));
  Bind(TmsmChangePropertiesBinding.Make(aChildModel));
  //Bind(TmsmListOpener.Make(aChildModel, aUseCase.MainList));

  AddController(
   AddListOperations
   (
    DisableActionElementEvent
    (
     TmsmListViewController.Make(aChildModel, aParent, aContext)
    )
    , aChildModel
   )
  );
 end;//AddChildView

 procedure AddChildView(const aView: TmsmModelElementView; const aParent: ImsmViewParent; const aContext: TmsmListViewtInitContext); overload;
 begin//AddChildView
  AddChildView(TmsmListModel.MakeListForViewed(aView), aParent, aContext);
 end;//AddChildView

 procedure AddChildView(const aName: String; const aParent: ImsmViewParent; const aContext: TmsmListViewtInitContext); overload;
 begin//AddChildView
  AddChildView(TmsmModelElementView_C(aName), aParent, aContext);
 end;//AddChildView

 procedure AddChildViews(const aNames: array of String; const aParent: ImsmViewParent; const aContext: TmsmListViewtInitContext);
 var
  l_Index : Integer;
 begin//AddChildViews
  for l_Index := Low(aNames) to High(aNames) do
   AddChildView(aNames[l_Index], aParent, aContext);
 end;//AddChildViews
 
var
 l_ListContext : TmsmListViewtInitContext;
 l_DrawingZone : ImsmViewParent;
 l_AllWords : ImsmListModel;
 l_NavigatorZone : ImsmViewParent;
//#UC END# *57D2DFA70064_57D2DF7E00CE_var*
begin
//#UC START# *57D2DFA70064_57D2DF7E00CE_impl*
 inherited Create(aUseCase);
(* aUseCase.AddController(
  TmsmMainFormController.Make(Self, aUseCase.Caption)
 );*)

 l_DrawingZone := TmsmMultiPanelViewParentHorz.Make(
  BindViewParentToModelAndZone(
   AddViewParentForRelease(TmsmProportionalPanel.Create(nil))
   , aUseCase.Drawing, aMainZone
  )
 );

 AddController(
  AddDiagramOperations
  (
   TmsmDrawingViewController.Make(aUseCase.Drawing, l_DrawingZone)
   , aUseCase.Drawing
  )
 );

 AddController(
  AddMainListOperations
  (
   DisableActionElementEvent
   (
    TmsmListViewController.Make(aUseCase.Drawing, l_DrawingZone)
   )
   , aUseCase.Drawing
  )
 );

 AddController(
  AddMainListOperations
  (
   DisableActionElementEvent
   (
    TmsmListViewController.Make(aUseCase.MainList, aMainZone)
   )
   , aUseCase.MainList
  )
 );

 if (aLeftZone <> nil) then
 begin
  AddController(
   AddListLikeOperations
   (
    TmsmTreeViewController.Make(aUseCase.Navigator, aLeftZone)
    , aUseCase.Navigator
   )
  );
 end;//aLeftZone <> nil

 if (aChildZone <> nil) then
 begin
  l_ListContext := TmsmListViewtInitContext_C;
  AddChildViews(['Depends', 'Inherits', 'Implements', {'Inner',} 'Children', 'Constants', 'Attributes', 'Operations', 'Dependencies', 'Implemented', 'Overridden', 'Parameters'],
                aChildZone,
                l_ListContext
                );
  if false then
  begin
   AddChildView(TmsmModelElementView_C('UpList', 'UpText'),
                aChildZone,
                l_ListContext);
  end;//false
  if false then
  begin
   l_ListContext := TmsmListViewtInitContext_C;
   l_ListContext.rMultiStrokeItem := true;
   AddChildView(TmsmModelElementView_C('SelfList', 'DocumentationNotEmpty'),
                aChildZone,
                l_ListContext);
  end;//false
 end;//aChildZone <> nil

 if (aFloatingZone <> nil) then
 begin
  l_NavigatorZone := TmsmMultiPanelViewParentVert.Make(
   BindViewParentToModelAndZone(
    AddViewParentForRelease(TmsmProportionalPanel.Create(nil))
    , aUseCase.FloatingNavigator, aFloatingZone
   )
  );

  AddController(
   AddListLikeOperations(
   //AddNavigatorOperations(
    TmsmTreeViewController.Make(aUseCase.FloatingNavigator, l_NavigatorZone),
    aUseCase.FloatingNavigator
   )
  );

  AddController(
   AddReadonlyListOperations(
    DisableActionElementEvent
    (
     TmsmListViewController.Make(aUseCase.FoundElements, l_NavigatorZone)
    )
    , aUseCase.FoundElements
   )
  );

  if true{false} then
  begin
   l_AllWords := TmsmLoadedWordsListModel.Make;
   AddController(
    AddReadonlyListOperations(
     DisableActionElementEvent
     (
      TmsmListViewController.Make(l_AllWords, aFloatingZone)
     )
     , l_AllWords
    )
   );
   // - ������ ���� ���� ������
   Bind(TmsmListOpener.Make(l_AllWords, aUseCase.MainList));
  end;//false
  
  if true{false} then
  begin
   l_AllWords := TmsmSomeWordsListModel.Make('Primitives');
   AddController(
    AddReadonlyListOperations(
     DisableActionElementEvent
     (
      TmsmListViewController.Make(l_AllWords, aFloatingZone)
     )
     , l_AllWords
    )
   );
   // - ������ ����������
   Bind(TmsmListOpener.Make(l_AllWords, aUseCase.MainList));
  end;//false

  if true then
  begin
   if false then
   begin
    l_ListContext := TmsmListViewtInitContext_C;
    l_ListContext.rImageNameProp := 'msm:View:StereotypeImageFileName';
    AddChildView('AllowedElements', aFloatingZone, l_ListContext);
    // - ������ ����������� ��������� ��� �������� ��������
   end;//false
   if false{true} then
   begin
    l_ListContext := TmsmListViewtInitContext_C;
    AddChildView('AccessibleTypes', aFloatingZone, l_ListContext);
    // - ������ �����, ������� ����� ������������ ������� �������
   end;//true
   if true then
   begin
    l_ListContext := TmsmListViewtInitContext_C;
    AddChildView('CanImplement', aFloatingZone, l_ListContext);
    // - ������ �������, ������� ����� ������������� ������� �������
   end;//true
   if true then
   begin
    l_ListContext := TmsmListViewtInitContext_C;
    AddChildView('CanOverride', aFloatingZone, l_ListContext);
    // - ������ �������, ������� ����� ����������� ������� �������
   end;//true 
  end;//true
 end;//aFloatingZone <> nil

 if (aTopZone <> nil) then
 begin
  AddController(TmsmButtonEditViewController.Make(aUseCase.ElementToFind, aTopZone));
 end;//aTopZone <> nil
//#UC END# *57D2DFA70064_57D2DF7E00CE_impl*
end;//TmsmDrawingUseCaseView.Create

class function TmsmDrawingUseCaseView.Make(const aUseCase: ImsmDrawingUseCase;
 const aMainZone: ImsmViewParent;
 const aChildZone: ImsmViewParent;
 const aLeftZone: ImsmViewParent;
 const aFloatingZone: ImsmViewParent;
 const aTopZone: ImsmViewParent): ImsmDrawingUseCaseView;
var
 l_Inst : TmsmDrawingUseCaseView;
begin
 l_Inst := Create(aUseCase, aMainZone, aChildZone, aLeftZone, aFloatingZone, aTopZone);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TmsmDrawingUseCaseView.Make

procedure TmsmDrawingUseCaseView.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_57D2DF7E00CE_var*
//#UC END# *479731C50290_57D2DF7E00CE_var*
begin
//#UC START# *479731C50290_57D2DF7E00CE_impl*
 inherited;
//#UC END# *479731C50290_57D2DF7E00CE_impl*
end;//TmsmDrawingUseCaseView.Cleanup

procedure TmsmDrawingUseCaseView.DoActivate;
//#UC START# *57D2B82102BD_57D2DF7E00CE_var*
//#UC END# *57D2B82102BD_57D2DF7E00CE_var*
begin
//#UC START# *57D2B82102BD_57D2DF7E00CE_impl*
 inherited;
//#UC END# *57D2B82102BD_57D2DF7E00CE_impl*
end;//TmsmDrawingUseCaseView.DoActivate

procedure TmsmDrawingUseCaseView.DoActivated;
//#UC START# *57DAB38900EF_57D2DF7E00CE_var*
//#UC END# *57DAB38900EF_57D2DF7E00CE_var*
begin
//#UC START# *57DAB38900EF_57D2DF7E00CE_impl*
 inherited;
//#UC END# *57DAB38900EF_57D2DF7E00CE_impl*
end;//TmsmDrawingUseCaseView.DoActivated

//#UC START# *57D2DF7E00CEimpl*
//#UC END# *57D2DF7E00CEimpl*

end.
