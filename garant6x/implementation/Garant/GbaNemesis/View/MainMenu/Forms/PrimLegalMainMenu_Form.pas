unit PrimLegalMainMenu_Form;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\MainMenu\Forms\PrimLegalMainMenu_Form.pas"
// ���������: "VCMForm"
// ������� ������: "PrimLegalMainMenu" MUID: (4AC9E7B40342)
// ��� ����: "TPrimLegalMainMenuForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , MainMenuWithBaseSearchSupport_Form
 , vtPanel
 {$If Defined(Nemesis)}
 , nscHideField
 {$IfEnd} // Defined(Nemesis)
 {$If Defined(Nemesis)}
 , nscTreeViewHotTruck
 {$IfEnd} // Defined(Nemesis)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TPrimLegalMainMenuForm = {abstract} class(TMainMenuWithBaseSearchSupportForm)
  private
   f_hfReferences: TnscHideField;
    {* ������-������� }
   f_tvReferences: TnscTreeViewHotTruck;
   f_hfLawNews: TnscHideField;
    {* ��������� � ���������������� }
   f_tvLawNews: TnscTreeViewHotTruck;
  private
   procedure UpdateMainMenuForm;
  protected
   procedure UpdateCaption;
   procedure FinishDataUpdate; override;
   procedure SettingsReplaceFinish; override;
   procedure UserSettingsChanged; override;
    {* ���������� ��������� ������������ }
   {$If NOT Defined(NoVCM)}
   procedure DoInit(aFromHistory: Boolean); override;
    {* ������������� �����. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   procedure LoadTrees; override;
   {$If NOT Defined(NoVCM)}
   procedure MakeControls; override;
   {$IfEnd} // NOT Defined(NoVCM)
  public
   property hfReferences: TnscHideField
    read f_hfReferences;
    {* ������-������� }
   property tvReferences: TnscTreeViewHotTruck
    read f_tvReferences;
   property hfLawNews: TnscHideField
    read f_hfLawNews;
    {* ��������� � ���������������� }
   property tvLawNews: TnscTreeViewHotTruck
    read f_tvLawNews;
 end;//TPrimLegalMainMenuForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , nsMainMenuNew
 , smLawNewsTree
 , smNewSchoolReferencesTree
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmHistoryService
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(DesignTimeLibrary)}
 , evStyleTableSpy
 {$IfEnd} // NOT Defined(DesignTimeLibrary)
 , SysUtils
 , afwFacade
 //#UC START# *4AC9E7B40342impl_uses*
 //#UC END# *4AC9E7B40342impl_uses*
;

procedure TPrimLegalMainMenuForm.UpdateMainMenuForm;
//#UC START# *4ACC7F16032D_4AC9E7B40342_var*
//#UC END# *4ACC7F16032D_4AC9E7B40342_var*
begin
//#UC START# *4ACC7F16032D_4AC9E7B40342_impl*
 if not VCMClosing then
  if Visible then
   TdmStdRes.OpenMainMenuIfNeeded(NativeMainForm);
//#UC END# *4ACC7F16032D_4AC9E7B40342_impl*
end;//TPrimLegalMainMenuForm.UpdateMainMenuForm

procedure TPrimLegalMainMenuForm.UpdateCaption;
//#UC START# *5450DAE20391_4AC9E7B40342_var*
//#UC END# *5450DAE20391_4AC9E7B40342_var*
begin
//#UC START# *5450DAE20391_4AC9E7B40342_impl*
 Self.CCaption := nsMakeMainMenuCaption;
//#UC END# *5450DAE20391_4AC9E7B40342_impl*
end;//TPrimLegalMainMenuForm.UpdateCaption

procedure TPrimLegalMainMenuForm.FinishDataUpdate;
//#UC START# *47EA4E9002C6_4AC9E7B40342_var*
//#UC END# *47EA4E9002C6_4AC9E7B40342_var*
begin
//#UC START# *47EA4E9002C6_4AC9E7B40342_impl*
 inherited;
 UpdateCaption;
//#UC END# *47EA4E9002C6_4AC9E7B40342_impl*
end;//TPrimLegalMainMenuForm.FinishDataUpdate

procedure TPrimLegalMainMenuForm.SettingsReplaceFinish;
//#UC START# *47EA8B9601FE_4AC9E7B40342_var*
//#UC END# *47EA8B9601FE_4AC9E7B40342_var*
begin
//#UC START# *47EA8B9601FE_4AC9E7B40342_impl*
 inherited;
 UpdateMainMenuForm;
//#UC END# *47EA8B9601FE_4AC9E7B40342_impl*
end;//TPrimLegalMainMenuForm.SettingsReplaceFinish

procedure TPrimLegalMainMenuForm.UserSettingsChanged;
 {* ���������� ��������� ������������ }
//#UC START# *4958BE910345_4AC9E7B40342_var*
//#UC END# *4958BE910345_4AC9E7B40342_var*
begin
//#UC START# *4958BE910345_4AC9E7B40342_impl*
 inherited;
 UpdateMainMenuForm;
//#UC END# *4958BE910345_4AC9E7B40342_impl*
end;//TPrimLegalMainMenuForm.UserSettingsChanged

{$If NOT Defined(NoVCM)}
procedure TPrimLegalMainMenuForm.DoInit(aFromHistory: Boolean);
 {* ������������� �����. ��� ���������� � �������� }
//#UC START# *49803F5503AA_4AC9E7B40342_var*
//#UC END# *49803F5503AA_4AC9E7B40342_var*
begin
//#UC START# *49803F5503AA_4AC9E7B40342_impl*
 inherited;
(* if not aFromHistory then
  if (f_BaseSearcher <> nil) then
   f_BaseSearcher.ActiveClass := nil;
 // http://mdp.garant.ru/pages/viewpage.action?pageId=269069309&focusedCommentId=296624258#comment-296624258*)
//#UC END# *49803F5503AA_4AC9E7B40342_impl*
end;//TPrimLegalMainMenuForm.DoInit
{$IfEnd} // NOT Defined(NoVCM)

procedure TPrimLegalMainMenuForm.LoadTrees;
//#UC START# *4AC9E9EC0064_4AC9E7B40342_var*
//#UC END# *4AC9E9EC0064_4AC9E7B40342_var*
begin
//#UC START# *4AC9E9EC0064_4AC9E7B40342_impl*
 inherited;
 tvReferences.TreeStruct := TsmNewSchoolReferencesTree.Make;
 tvLawNews.TreeStruct := TsmLawNewsTree.Make;
//#UC END# *4AC9E9EC0064_4AC9E7B40342_impl*
end;//TPrimLegalMainMenuForm.LoadTrees

{$If NOT Defined(NoVCM)}
procedure TPrimLegalMainMenuForm.MakeControls;
begin
 inherited;
 pnlMain.Parent := Self;
 f_hfReferences := TnscHideField.Create(Self);
 f_hfReferences.Name := 'hfReferences';
 f_hfReferences.Parent := pnlMain;
 f_hfReferences.Caption := '������-�������';
 f_tvReferences := TnscTreeViewHotTruck.Create(Self);
 f_tvReferences.Name := 'tvReferences';
 f_tvReferences.Parent := hfReferences;
 f_hfLawNews := TnscHideField.Create(Self);
 f_hfLawNews.Name := 'hfLawNews';
 f_hfLawNews.Parent := pnlMain;
 f_hfLawNews.Caption := '��������� � ����������������';
 f_tvLawNews := TnscTreeViewHotTruck.Create(Self);
 f_tvLawNews.Name := 'tvLawNews';
 f_tvLawNews.Parent := hfLawNews;
end;//TPrimLegalMainMenuForm.MakeControls
{$IfEnd} // NOT Defined(NoVCM)

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimLegalMainMenuForm);
 {* ����������� PrimLegalMainMenu }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
