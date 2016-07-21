unit F1LikeRes;

// ������: "w:\common\components\gui\Garant\VCM\View\F1LikeRes.pas"
// ���������: "VCMApplication"
// ������� ������: "F1Like" MUID: (4F6B607F027E)
// ��� ����: "TF1LikeRes"

{$Include w:\common\components\gui\f1LikeAppDefine.inc}

interface

uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , OfficeLikeRes
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TF1LikeRes = {abstract} class({$If NOT Defined(NoVCM)}
 TOfficeLikeRes
 {$IfEnd} // NOT Defined(NoVCM)
 )
  protected
   {$If NOT Defined(NoVCM)}
   class procedure MakeResources; override;
   {$IfEnd} // NOT Defined(NoVCM)
  public
   class function mod_opcode_TasksPanelMenu_Customize: TvcmMOPID;
 end;//TF1LikeRes

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoVCM)}
 , moTasksPanelMenu
 {$IfEnd} // NOT Defined(NoVCM)
 , moParentAndChild
 , vtStdRes
 {$If NOT Defined(NoVCM)}
 , PrimTasksPanelMenu_Module
 {$IfEnd} // NOT Defined(NoVCM)
 , ParentAndChildPrim_Module
 , MainPrim_Form
 , evExtFormat
 //#UC START# *4F6B607F027Eimpl_uses*
 , Forms
 //#UC END# *4F6B607F027Eimpl_uses*
;

{$If NOT Defined(NoVCM)}
class function TF1LikeRes.mod_opcode_TasksPanelMenu_Customize: TvcmMOPID;
begin
 Result := g_module_opcode_TasksPanelMenu_Customize;
 Assert((Result.rMoID > 0) AND (Result.rOpID > 0));
end;//TF1LikeRes.mod_opcode_TasksPanelMenu_Customize

class procedure TF1LikeRes.MakeResources;
//#UC START# *4F6AF5F00058_4F6B607F027E_var*
//#UC END# *4F6AF5F00058_4F6B607F027E_var*
begin
//#UC START# *4F6AF5F00058_4F6B607F027E_impl*
 Application.CreateForm(TvtStdResources, vtStdResources);
//#UC END# *4F6AF5F00058_4F6B607F027E_impl*
end;//TF1LikeRes.MakeResources
{$IfEnd} // NOT Defined(NoVCM)

end.
