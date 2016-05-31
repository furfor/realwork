unit PrimSaveLoadUserTypes_slqtAttribute_UserType;
 {* �����: �� ���������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimSaveLoadUserTypes_slqtAttribute_UserType.pas"
// ���������: "UserType"
// ������� ������: "slqtAttribute" MUID: (4BD5BB7D038A)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
 , l3StringIDEx
;

const
 {* ������������ ������ slqtAttributeLocalConstants }
 str_slqtAttributeCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'slqtAttributeCaption'; rValue : '�����: �� ����������');
  {* ��������� ����������������� ���� "�����: �� ����������" }
 {* ��������� ��� ���� ����� slqtAttribute }
 slqtAttributeName = 'slqtAttribute';
  {* ��������� ������������� ����������������� ���� "�����: �� ����������" }
 slqtAttribute = TvcmUserType(0);
  {* �����: �� ���������� }
{$IfEnd} // NOT Defined(Admin)

implementation

{$If NOT Defined(Admin)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , tfwInteger
 {$IfEnd} // NOT Defined(NoScripts)
;

{$If NOT Defined(NoScripts)}
type
 Tkw_FormUserType_slqtAttribute = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� slqtAttribute }
  protected
   function GetInteger: Integer; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_FormUserType_slqtAttribute
{$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
function Tkw_FormUserType_slqtAttribute.GetInteger: Integer;
begin
 Result := slqtAttribute;
end;//Tkw_FormUserType_slqtAttribute.GetInteger

class function Tkw_FormUserType_slqtAttribute.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::slqtAttribute';
end;//Tkw_FormUserType_slqtAttribute.GetWordNameForRegister
{$IfEnd} // NOT Defined(NoScripts)

initialization
 str_slqtAttributeCaption.Init;
 {* ������������� str_slqtAttributeCaption }
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_slqtAttribute.RegisterInEngine;
 {* ����������� Tkw_FormUserType_slqtAttribute }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin)

end.
