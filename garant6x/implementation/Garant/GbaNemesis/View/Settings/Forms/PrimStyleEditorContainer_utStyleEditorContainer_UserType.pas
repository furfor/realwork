unit PrimStyleEditorContainer_utStyleEditorContainer_UserType;
 {* �������� ������ }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Settings\Forms\PrimStyleEditorContainer_utStyleEditorContainer_UserType.pas"
// ���������: "UserType"
// ������� ������: "utStyleEditorContainer" MUID: (4C93455D0178)

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
 {* ������������ ������ utStyleEditorContainerLocalConstants }
 str_utStyleEditorContainerCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'utStyleEditorContainerCaption'; rValue : '�������� ������');
  {* ��������� ����������������� ���� "�������� ������" }
 {* ��������� ��� ���� ����� utStyleEditorContainer }
 utStyleEditorContainerName = 'utStyleEditorContainer';
  {* ��������� ������������� ����������������� ���� "�������� ������" }
 utStyleEditorContainer = TvcmUserType(0);
  {* �������� ������ }
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
 Tkw_FormUserType_utStyleEditorContainer = {final} class(TtfwInteger)
  {* ����� ������� ��� ���� ����� utStyleEditorContainer }
  protected
   function GetInteger: Integer; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_FormUserType_utStyleEditorContainer
{$IfEnd} // NOT Defined(NoScripts)

{$If NOT Defined(NoScripts)}
function Tkw_FormUserType_utStyleEditorContainer.GetInteger: Integer;
begin
 Result := utStyleEditorContainer;
end;//Tkw_FormUserType_utStyleEditorContainer.GetInteger

class function Tkw_FormUserType_utStyleEditorContainer.GetWordNameForRegister: AnsiString;
begin
 Result := '���_�����::utStyleEditorContainer';
end;//Tkw_FormUserType_utStyleEditorContainer.GetWordNameForRegister
{$IfEnd} // NOT Defined(NoScripts)

initialization
 str_utStyleEditorContainerCaption.Init;
 {* ������������� str_utStyleEditorContainerCaption }
{$If NOT Defined(NoScripts)}
 Tkw_FormUserType_utStyleEditorContainer.RegisterInEngine;
 {* ����������� Tkw_FormUserType_utStyleEditorContainer }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
