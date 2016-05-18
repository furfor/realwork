unit Registration_Form;
 {* ����������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Common\Forms\Registration_Form.pas"
// ���������: "VCMFinalForm"
// ������� ������: "RegistrationForm" MUID: (4ABB7ACB00E7)
// ��� ����: "TnsRegistrationForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimRegistration_Form
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

const
 fm_nsRegistrationForm: TvcmFormDescriptor = (rFormID : (rName : 'nsRegistrationForm'; rID : 0); rFactory : nil);
  {* ������������� ����� TnsRegistrationForm }

type
 TnsRegistrationForm = class;

 RegistrationFormFormDef = interface
  {* ������������� ����� RegistrationForm }
  ['{1C7CFA67-8415-4312-BA10-BF18AAF522CF}']
 end;//RegistrationFormFormDef

 TnsRegistrationForm = {final} class(TPrimRegistrationForm, RegistrationFormFormDef)
  {* ����������� }
 end;//TnsRegistrationForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , l3StringIDEx
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 , l3MessageID
 , RegistrationForm_ut_RegistrationForm_UserType
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , RegistrationFormKeywordsPack
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
;

const
 {* ������������ ������ ut_RegistrationFormLocalConstants }
 str_ut_RegistrationFormCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ut_RegistrationFormCaption'; rValue : '�����������');
  {* ��������� ����������������� ���� "�����������" }

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TnsRegistrationForm);
 {* ����������� RegistrationForm }
{$IfEnd} // NOT Defined(NoScripts)
 str_ut_RegistrationFormCaption.Init;
 {* ������������� str_ut_RegistrationFormCaption }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
