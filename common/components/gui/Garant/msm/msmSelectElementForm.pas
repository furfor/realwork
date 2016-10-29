unit msmSelectElementForm;

// ������: "w:\common\components\gui\Garant\msm\msmSelectElementForm.pas"
// ���������: "SimpleClass"
// ������� ������: "TmsmSelectElementForm" MUID: (57F50ED80120)

{$Include w:\common\components\msm.inc}

interface

uses
 l3IntfUses
 , msmRefcountedForm
 , msmUseCases
 , msmValuesForSelect
 , msmModelElementSelectService
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 //#UC START# *57F50ED80120intf_uses*
 , StdCtrls
 //, msmEdit
 , msmPanel
 , tfwScriptingInterfaces
 , msmConcreteModels
 , msmButton
 //#UC END# *57F50ED80120intf_uses*
;

type
 //#UC START# *57F50ED80120ci*
 //#UC END# *57F50ED80120ci*
 //#UC START# *57F50ED80120cit*
 //#UC END# *57F50ED80120cit*
 TmsmSelectElementForm = class(TmsmRefcountedForm)
  private
   f_UseCase: ImsmUseCase;
   f_ValuesForSelect: TmsmValuesForSelect;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   {$If NOT Defined(NoVCL)}
   function CloseQuery: Boolean; override;
    {* CloseQuery is called automatically when an attempt is made to close the form. CloseQuery can allow the form to close by returning true, or prevent the form from closing by returning false.

As implemented in TCustomForm, CloseQuery polls any MDI children by calling their CloseQuery methods. If no child form aborts the close, CloseQuery then calls the OnCloseQuery event handler, if it exists, to determine if the close should be allowed. If no such event handler exists, CloseQuery returns true. }
   {$IfEnd} // NOT Defined(NoVCL)
   {$If NOT Defined(NoVCL)}
   procedure DoClose(var Action: TCloseAction); override;
   {$IfEnd} // NOT Defined(NoVCL)
   procedure ClearFields; override;
  public
   class procedure SelectElement(const aSelector: ImsmElementSelector);
   {$If NOT Defined(NoVCL)}
   function ShowModal: Integer; override;
   {$IfEnd} // NOT Defined(NoVCL)
 //#UC START# *57F50ED80120publ*
  private
   f_Selector : ImsmElementSelector;
   f_List : ImsmListModel;
   //f_ValuesPanel : TmsmPanel;
   f_ValuesPanel : TScrollBox;
   f_Edit : ImsmCaptionModel;
   f_BottomPanel : TmsmPanel;
   f_OkButton : TmsmButton;
   f_CancelButton : TmsmButton;
   f_Values : ItfwArray;
 //#UC END# *57F50ED80120publ*
 end;//TmsmSelectElementForm

implementation

uses
 l3ImplUses
 , msmListControllerWithExternalView
 , msmEvents
 , msmListToCaptionBinding
 , msmEditViewController
 , msmListViewController
 , msmCaptionModel
 , msmListAndTreeViewUtils
 , msmMemoViewController
 , msmEditViewUtils
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 , msmListAndTreeInterfaces
 //#UC START# *57F50ED80120impl_uses*
 , Windows
 , SysUtils
 , Controls
 , l3String
 , msmUseCase
 , msmSingleViewParent
 , msmControllers
 , msmModelElements
 , msmModelElement
 , msmSomeModelElementsListModel
 , msmSomeModelElementsList
 , l3MinMax
 , msmSizeablePanel
 , vtSizeablePanel
 , msmLabel
 //#UC END# *57F50ED80120impl_uses*
;

type
 TmsmElementSelectBinding = class(TmsmListControllerWithExternalView)
  protected
   procedure DoActionElementEvent(anEvent: TmsmEvent);
   procedure LinkEventHandlers; override;
 end;//TmsmElementSelectBinding

 TmsmCurrentElementStereotypeDocToCaptionBinding = class(TmsmListToCaptionBinding)
  protected
   procedure DoCurrentElementChangedEvent(anEvent: TmsmEvent);
   procedure LinkDataToView; override;
   procedure LinkEventHandlers; override;
 end;//TmsmCurrentElementStereotypeDocToCaptionBinding

procedure TmsmElementSelectBinding.DoActionElementEvent(anEvent: TmsmEvent);
//#UC START# *57F51FDF012B_57B2B0C602DF_57F51FDF012B_var*
//#UC END# *57F51FDF012B_57B2B0C602DF_57F51FDF012B_var*
begin
//#UC START# *57F51FDF012B_57B2B0C602DF_57F51FDF012B_impl*
 (View As TmsmSelectElementForm).ModalResult := mrOk;
//#UC END# *57F51FDF012B_57B2B0C602DF_57F51FDF012B_impl*
end;//TmsmElementSelectBinding.DoActionElementEvent

procedure TmsmElementSelectBinding.LinkEventHandlers;
begin
 inherited;
 Self.LinkEventHandler(ActionElementEvent.Instance, DoActionElementEvent);
end;//TmsmElementSelectBinding.LinkEventHandlers

procedure TmsmCurrentElementStereotypeDocToCaptionBinding.DoCurrentElementChangedEvent(anEvent: TmsmEvent);
//#UC START# *5810B6830253_57B31D1000FA_5810B6830253_var*
//#UC END# *5810B6830253_57B31D1000FA_5810B6830253_var*
begin
//#UC START# *5810B6830253_57B31D1000FA_5810B6830253_impl*
 inherited;
 if (Self.ModelToListen.CurrentElement = nil) then
  Self.ModelToFire.Caption := nil
 else
  Self.ModelToFire.Caption := Self.ModelToListen.CurrentElement.StringProp['msm:StereotypeDocumentation'];
//#UC END# *5810B6830253_57B31D1000FA_5810B6830253_impl*
end;//TmsmCurrentElementStereotypeDocToCaptionBinding.DoCurrentElementChangedEvent

procedure TmsmCurrentElementStereotypeDocToCaptionBinding.LinkDataToView;
//#UC START# *57B6A49900F4_5810B6830253_var*
//#UC END# *57B6A49900F4_5810B6830253_var*
begin
//#UC START# *57B6A49900F4_5810B6830253_impl*
 inherited;
//#UC END# *57B6A49900F4_5810B6830253_impl*
end;//TmsmCurrentElementStereotypeDocToCaptionBinding.LinkDataToView

procedure TmsmCurrentElementStereotypeDocToCaptionBinding.LinkEventHandlers;
begin
 inherited;
 Self.LinkEventHandler(CurrentElementChangedEvent.Instance, DoCurrentElementChangedEvent);
end;//TmsmCurrentElementStereotypeDocToCaptionBinding.LinkEventHandlers

class procedure TmsmSelectElementForm.SelectElement(const aSelector: ImsmElementSelector);
//#UC START# *57F50F400051_57F50ED80120_var*

 function FontName: AnsiString;
 begin//FontName
  if (Win32Platform = VER_PLATFORM_WIN32_NT) then
  begin
   if (Win32MajorVersion >= 6) then
   // - Vista
    Result := 'Segoe UI'
   else
    Result := 'Arial';
  end//Win32Platform = VER_PLATFORM_WIN32_NT
  else
   Result := 'Arial';
 end;//FontName
 
 function DisableActionElementEvent(const aController: ImsmController): ImsmController;
 begin//DisableActionElementEvent
  aController.DisableEvent(ActionElementEvent.Instance);
  Result := aController;
 end;//DisableActionElementEvent

var
 l_F : TmsmSelectElementForm;

 procedure SetupUseCase;

  procedure SetupValues(const aUseCase: ImsmUseCase; aParent: TmsmViewParentControl);

   function CreateValueSizeablePanel(aHeight: Integer): TmsmSizeablePanel;
   begin//CreateValueSizeablePanel
    Result := TmsmSizeablePanel.Create(aParent);
    Result.Parent := aParent;
    Result.Height := aHeight;
    Result.Align := alTop;
    //Result.BorderStyle := bsSingle;
    Result.Font.Name := FontName;
    Result.Font.Size := 8;
    Result.SizeableSides := [szBottom];
    Result.SplitterBevel := bvRaised;
   end;//CreateValueSizeablePanel

  var
   l_ValueParent : TmsmViewParentControl;
   l_IsEdit : Boolean;
   l_IsMemo : Boolean;
   l_VL : ItfwArray;

   procedure CreateValueParent;
   const
    cMaxListCount = 6;
   var
    l_ValuePanel : TmsmPanel;
    l_ValueSizeablePanel : TmsmSizeablePanel;
    l_Height : Integer;
   begin//CreateValueParent
    l_ValuePanel := nil;
    l_ValueSizeablePanel := nil;
    l_ValueParent := nil;
    if l_IsEdit AND not l_IsMemo
       //OR (l_VL = nil)
       OR ((l_VL <> nil) AND (l_VL.Count < cMaxListCount)) then
    begin
     l_ValuePanel := TmsmPanel.Create(aParent);
     l_ValuePanel.Parent := aParent;
     if l_IsEdit then
     begin
      if l_IsMemo then
       l_ValuePanel.Height := 80{120}
      else
       l_ValuePanel.Height := 24{30};
     end//l_IsEdit
     else
      l_ValuePanel.Height := Min(l_VL.Count, cMaxListCount) * 16 + 8 - 2 - 2;
     l_ValuePanel.Align := alTop;
     //l_ValuePanel.BorderStyle := bsSingle;
     l_ValuePanel.BorderStyle := bsNone;
     l_ValuePanel.BevelOuter := bvRaised;
     l_ValuePanel.Font.Name := FontName;
     l_ValuePanel.Font.Size := 8;
     l_ValueParent := l_ValuePanel;
    end//l_IsEdit AND not l_IsMemo
    else
    begin
     l_Height := 24;
     if l_IsEdit then
     begin
      if l_IsMemo then
       l_Height := 80{120}
      else
       l_Height := 24{30};
     end//l_IsEdit
     else
      l_Height := Min(l_VL.Count, cMaxListCount) * 16 + 8 - 2 - 2;
     l_ValueSizeablePanel := CreateValueSizeablePanel(l_Height);
     l_ValueParent := l_ValueSizeablePanel;
    end;//l_IsEdit AND not l_IsMemo
   end;//CreateValueParent
   
  var
   l_Values : ItfwArray;
   l_Index : Integer;
   l_Name : AnsiString;
   l_E : ImsmModelElement;
   l_ValueElement : ImsmModelElement;
   l_LeftPanel : TmsmSizeablePanel;
   l_V : TtfwStackValue;
   l_Caption : ImsmCaptionModel;
   l_List : ImsmListModel;
   l_ListContext : TmsmListViewtInitContext;
   l_EV : TmsmValueForSelect;
   l_EditContext : TmsmEditViewInitContext;
   l_StereoDoc : ImsmCaptionModel;
  begin//SetupValues
   l_Values := aSelector.KeyValues;
   Assert(l_Values <> nil);
   l_F.f_Values := l_Values;
   for l_Index := 0 to Pred(l_Values.Count) do
   begin
    l_E := TmsmModelElement.MakeFromValue(l_Values.Items[l_Index]);
    l_EV := TmsmValueForSelect_C(l_E);
    l_Name := l_E.Call([], 'msm:Name').AsDelphiString;
    Assert(l_Name <> '');
    l_V := l_E.Call([], 'msm:Value');
    l_VL := l_E.CallAndGetList([], 'msm:ValueList');

    l_IsEdit := (l_VL = nil) OR (l_VL.Count <= 0);
    l_IsMemo := l_E.BoolProp['msm:IsMemo'];

    CreateValueParent;
    
    Assert(l_ValueParent <> nil);

    l_LeftPanel := TmsmSizeablePanel.Create(l_ValueParent);
    l_LeftPanel.Parent := l_ValueParent;
    l_LeftPanel.Width := 95{90}{80};
    l_LeftPanel.Align := alLeft;
    l_LeftPanel.Caption := l_Name;
    l_LeftPanel.SizeableSides := [szRight];
    l_LeftPanel.SplitterBevel := bvRaised;
    l_LeftPanel.InheritedPaint := true;
    l_LeftPanel.Font.Name := FontName;
    l_LeftPanel.Font.Size := 8;

    if l_IsEdit then
    begin
     l_Caption := TmsmCaptionModel.Make;
     if (l_V.rType = tfw_vtStr) then
      l_Caption.Caption := l_V.AsString
     else
     if (l_V.rType = tfw_vtNil) then
      l_Caption.Caption := TtfwCStringFactory.C('')
     else
     if (l_V.rType = tfw_vtBool) then
      l_Caption.Caption := l_V.AsPrintable
     else
     if (l_V.rType = tfw_vtInt) then
      l_Caption.Caption := l_V.AsPrintable
     else
      Assert(false);
     l_EditContext := TmsmEditViewInitContext_C;
     l_EditContext.rReadOnly := l_E.BoolProp['msm:IsReadOnly']; 
     if l_IsMemo then
      aUseCase.AddController(
       DisableActionElementEvent
       (
        TmsmMemoViewController.Make(l_Caption, TmsmSingleViewParent.Make(l_ValueParent), l_EditContext)
       )
      )
     else
      aUseCase.AddController(
       DisableActionElementEvent
       (
        TmsmEditViewController.Make(l_Caption, TmsmSingleViewParent.Make(l_ValueParent), l_EditContext)
       )
      );
     l_EV.rCaption := l_Caption;
     if (l_Name = 'Name') then
      l_F.f_Edit := l_Caption;
    end//l_IsEdit
    else
    begin//l_IsEdit
     l_List := TmsmSomeModelElementsListModel.Make(TmsmSomeModelElementsList.Make(l_VL), l_Name);
     l_ListContext := TmsmListViewtInitContext_C;
     if (l_Name = 'Stereotype') then
     begin
      l_ListContext.rImageNameProp := 'msm:View:StereotypeImageFileName';
      l_F.f_List := l_List;
     end;//l_Name = 'Stereotype'
     aUseCase.AddController(
      DisableActionElementEvent
      (
       TmsmListViewController.Make(l_List, TmsmSingleViewParent.Make(l_ValueParent), l_ListContext)
      )
     );
     if (l_Name = 'Stereotype') then
     begin
      l_ValueParent := CreateValueSizeablePanel(80);
      l_StereoDoc := TmsmCaptionModel.Make;
      l_EditContext := TmsmEditViewInitContext_C;
      l_EditContext.rReadOnly := true;
      aUseCase.AddController(
       DisableActionElementEvent
       (
        TmsmMemoViewController.Make(l_StereoDoc, TmsmSingleViewParent.Make(l_ValueParent), l_EditContext)
       )
      );
      aUseCase.Bind(TmsmCurrentElementStereotypeDocToCaptionBinding.Make(l_List, l_StereoDoc));
      aUseCase.Bind(TmsmElementSelectBinding.Make(l_F, l_List));
     end;//l_Name = 'Stereotype'
     l_EV.rList := l_List;
     if (l_V.rType = tfw_vtStr) then
      l_ValueElement := nil
     else
     if (l_V.rType = tfw_vtBool) then
      l_ValueElement := nil
     else
      l_ValueElement := TmsmModelElement.MakeFromValue(l_V);
     if (l_ValueElement <> nil) then
      l_List.CurrentElement := l_ValueElement;
     l_EV.rCurrentElement := l_ValueElement;
    end;//l_IsEdit
    l_F.f_ValuesForSelect.Add(l_EV);
   end;//for l_Index
  end;//SetupValues

 var
  l_Index : Integer; 
 begin//SetupUseCase
  Assert(l_F.f_ValuesForSelect = nil);
  l_F.f_ValuesForSelect := TmsmValuesForSelect.Create;
  l_F.f_UseCase := TmsmUseCase.Make;
  SetupValues(l_F.f_UseCase, l_F.f_ValuesPanel);
  l_F.f_UseCase.Activate;
  for l_Index := 0 to Pred(l_F.f_ValuesForSelect.Count) do
   with l_F.f_ValuesForSelect.ItemSlot(l_Index)^ do
    if (rList <> nil) then
     if (rCurrentElement <> nil) then
      rList.CurrentElement := rCurrentElement;
 end;//SetupUseCase

//#UC END# *57F50F400051_57F50ED80120_var*
begin
//#UC START# *57F50F400051_57F50ED80120_impl*
 l_F := TmsmSelectElementForm.Create(Application);
 try
  l_F.Width := 800;
  l_F.Height := 700;
  l_F.Position := poScreenCenter;
  l_F.Caption := aSelector.SelectFormCaption;

  l_F.f_BottomPanel := TmsmPanel.Create(l_F);
  l_F.f_BottomPanel.Height := 40;
  l_F.f_BottomPanel.Align := alBottom;
  l_F.f_BottomPanel.Parent := l_F;

  l_F.f_OkButton := TmsmButton.Create(l_F);
  l_F.f_OkButton.Caption := 'Ok';
  l_F.f_OkButton.Left := 10;
  l_F.f_OkButton.Top := (l_F.f_BottomPanel.Height - l_F.f_OkButton.Height) div 2;
  l_F.f_OkButton.Parent := l_F.f_BottomPanel;
  l_F.f_OkButton.ModalResult := mrOk;
  
  l_F.f_CancelButton := TmsmButton.Create(l_F);
  l_F.f_CancelButton.Caption := 'Cancel';
  l_F.f_CancelButton.Left := l_F.f_OkButton.Left + l_F.f_OkButton.Width + 10;
  l_F.f_CancelButton.Top := l_F.f_OkButton.Top;
  l_F.f_CancelButton.Parent := l_F.f_BottomPanel;
  l_F.f_CancelButton.ModalResult := mrCancel;
  l_F.f_CancelButton.Cancel := true;

  //l_F.f_ValuesPanel := TmsmPanel.Create(l_F);
  l_F.f_ValuesPanel := TScrollBox.Create(l_F);
  //l_F.f_ValuesPanel.Height := 300;
  //l_F.f_ValuesPanel.Align := alTop;
  l_F.f_ValuesPanel.Align := alClient;
  l_F.f_ValuesPanel.Parent := l_F;

  l_F.f_Selector := aSelector;
  l_F.f_List := nil;

  SetupUseCase;
  l_F.ShowModal;
  l_F.f_UseCase := nil;
  l_F.f_Selector := nil;
  l_F.f_List := nil;
  l_F.f_Values := nil;
 finally
  FreeAndNil(l_F);
 end;//try..finally
//#UC END# *57F50F400051_57F50ED80120_impl*
end;//TmsmSelectElementForm.SelectElement

procedure TmsmSelectElementForm.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_57F50ED80120_var*
//#UC END# *479731C50290_57F50ED80120_var*
begin
//#UC START# *479731C50290_57F50ED80120_impl*
 f_List := nil;
 f_UseCase := nil;
 f_Selector := nil;
 f_Values := nil;
 f_Edit := nil;
 FreeAndNil(f_ValuesForSelect);
 inherited;
//#UC END# *479731C50290_57F50ED80120_impl*
end;//TmsmSelectElementForm.Cleanup

{$If NOT Defined(NoVCL)}
function TmsmSelectElementForm.CloseQuery: Boolean;
 {* CloseQuery is called automatically when an attempt is made to close the form. CloseQuery can allow the form to close by returning true, or prevent the form from closing by returning false.

As implemented in TCustomForm, CloseQuery polls any MDI children by calling their CloseQuery methods. If no child form aborts the close, CloseQuery then calls the OnCloseQuery event handler, if it exists, to determine if the close should be allowed. If no such event handler exists, CloseQuery returns true. }
//#UC START# *4980403E021E_57F50ED80120_var*

 function ValidateData: Boolean;
 begin//ValidateData
  Result := false;
(*  if l3IsNil(f_Edit.Caption) then
  begin
   Result := false;
   Exit;
  end;//f_Edit.Caption*)
  if (f_List <> nil) then
   if (f_List.CurrentElement = nil) then
   begin
    Result := false;
    Exit;
   end;//f_List.CurrentElement = nil
  Result := true;
 end;//ValidateData

 procedure ApplyData;
 var
  l_Index : Integer;
  l_CE : ImsmModelElement;
  l_Caption : AnsiString;
 begin//ApplyData
  for l_Index := 0 to Pred(f_ValuesForSelect.Count) do
  begin
   with f_ValuesForSelect.ItemSlot(l_Index)^ do
    if (rCaption <> nil) then
     rElement.StringProp['msm:Value'] := rCaption.Caption
    else
    if (rList <> nil) then
     rElement.ElementProp['msm:Value'] := rList.CurrentElement
    else
     Assert(false); 
  end;//for l_Index
  if (f_List = nil) then
   l_CE := nil
  else
   l_CE := f_List.CurrentElement;
  if (f_Edit = nil) then
   l_Caption := ''
  else
   l_Caption := l3Str(f_Edit.Caption);   
  f_Selector.SelectElement(l_Caption, l_CE, f_Values);
 end;//ApplyData

//#UC END# *4980403E021E_57F50ED80120_var*
begin
//#UC START# *4980403E021E_57F50ED80120_impl*
 Result := inherited CloseQuery;
 if Result then
 begin
  if (ModalResult = mrOK) then
  begin
   if not ValidateData then
   begin
    Result := false;
    Exit;
   end;//not ValidateData
   ApplyData;
   Result := true;
  end;//ModalResult = mrOK
 end;//Result
//#UC END# *4980403E021E_57F50ED80120_impl*
end;//TmsmSelectElementForm.CloseQuery
{$IfEnd} // NOT Defined(NoVCL)

{$If NOT Defined(NoVCL)}
function TmsmSelectElementForm.ShowModal: Integer;
//#UC START# *520B42AF0115_57F50ED80120_var*
//#UC END# *520B42AF0115_57F50ED80120_var*
begin
//#UC START# *520B42AF0115_57F50ED80120_impl*
 //Assert(f_Edit <> nil);
 Assert(f_Selector <> nil);
 //Assert(f_List <> nil);
 Result := inherited ShowModal;
//#UC END# *520B42AF0115_57F50ED80120_impl*
end;//TmsmSelectElementForm.ShowModal
{$IfEnd} // NOT Defined(NoVCL)

{$If NOT Defined(NoVCL)}
procedure TmsmSelectElementForm.DoClose(var Action: TCloseAction);
//#UC START# *5576E05C0204_57F50ED80120_var*
//#UC END# *5576E05C0204_57F50ED80120_var*
begin
//#UC START# *5576E05C0204_57F50ED80120_impl*
 inherited;
//#UC END# *5576E05C0204_57F50ED80120_impl*
end;//TmsmSelectElementForm.DoClose
{$IfEnd} // NOT Defined(NoVCL)

procedure TmsmSelectElementForm.ClearFields;
begin
 f_UseCase := nil;
 inherited;
end;//TmsmSelectElementForm.ClearFields

//#UC START# *57F50ED80120impl*
{$R *.dfm}
//#UC END# *57F50ED80120impl*

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TmsmSelectElementForm);
 {* ����������� TmsmSelectElementForm }
{$IfEnd} // NOT Defined(NoScripts)

end.
