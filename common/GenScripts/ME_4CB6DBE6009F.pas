unit CreateFilter_Form;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Filters\Forms\CreateFilter_Form.pas"
// ���������: "VCMFinalForm"
// ������� ������: "CreateFilter" MUID: (4CB6DBE6009F)
// ��� ����: "TCreateFilterForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimCreateFilter_Form
;

type
 TCreateFilterForm = {final} class(TPrimCreateFilterForm)
 end;//TCreateFilterForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , CreateFilterKeywordsPack
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
;

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TCreateFilterForm);
 {* ����������� CreateFilter$Form }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
