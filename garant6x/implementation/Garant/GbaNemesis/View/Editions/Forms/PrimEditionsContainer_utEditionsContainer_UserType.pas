unit PrimEditionsContainer_utEditionsContainer_UserType;
 {* ��������� �������� ��������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Editions\Forms\PrimEditionsContainer_utEditionsContainer_UserType.pas"
// ���������: "UserType"
// ������� ������: "utEditionsContainer" MUID: (4BD705C900FF)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmUserControls
 {$IfEnd} // NOT Defined(NoVCM)
 , l3StringIDEx
;

const
 {* ������������ ������ utEditionsContainerLocalConstants }
 str_utEditionsContainerCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'utEditionsContainerCaption'; rValue : '��������� �������� ���������');
  {* ��������� ����������������� ���� "��������� �������� ���������" }
 {* ��������� ��� ���� ����� utEditionsContainer }
 utEditionsContainerName = 'utEditionsContainer';
  {* ��������� ������������� ����������������� ���� "��������� �������� ���������" }
 utEditionsContainer = TvcmUserType(0);
  {* ��������� �������� ��������� }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , tfwInteger
 {$IfEnd} // NOT Defined(NoScripts)
;

{$If NOT Defined(NoScripts)}
type
 Tkw_FormUserType_utEditionsContainer = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� utEditionsContainer }
  protected
   function GetInteger: Integer; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_FormUserType_utEditionsContainer
{$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
function Tkw_FormUserType_utEditionsContainer.GetInteger: Integer;
begin
 Result := utEditionsContainer;
end;//Tkw_FormUserType_utEditionsContainer.GetInteger

class function Tkw_FormUserType_utEditionsContainer.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::utEditionsContainer';
end;//Tkw_FormUserType_utEditionsContainer.GetWordNameForRegister
{$IfEnd} // NOT Defined(NoScripts)

initialization
 str_utEditionsContainerCaption.Init;
 {* ������������� str_utEditionsContainerCaption }
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_utEditionsContainer.RegisterInEngine;
 {* ����������� Tkw_FormUserType_utEditionsContainer }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
