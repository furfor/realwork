unit WarningBaloon_Form;
 {* ������ � ��������������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Document\Forms\WarningBaloon_Form.pas"
// ���������: "VCMFinalForm"
// ������� ������: "WarningBaloon" MUID: (4EA58A3903B4)
// ��� ����: "TWarningBaloonForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimWarningBaloonOptions_Form
 , Common_FormDefinitions_Controls
 {$If NOT Defined(NoVCM)}
 , vcmEntities
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TWarningBaloonForm = {final} class(TPrimWarningBaloonOptionsForm, WarningBaloonFormDef)
  {* ������ � ��������������� }
   Entities : TvcmEntities;
 end;//TWarningBaloonForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , WarningBaloonKeywordsPack
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
;

{$R *.DFM}

initialization
 fm_WarningBaloonForm.SetFactory(TWarningBaloonForm.Make);
 {* ����������� ������� ����� WarningBaloon }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TWarningBaloonForm);
 {* ����������� WarningBaloon }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
