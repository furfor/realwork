unit l3InterfacedString;
 {* ���������� ���������� ������ }

// ������: "w:\common\components\rtl\Garant\L3\l3InterfacedString.pas"
// ���������: "SimpleClass"

{$Include l3Define.inc}

interface

uses
 l3IntfUses
 , l3NCString
 , l3Interfaces
;

type
 Tl3InterfacedString = class(Tl3NCString, Il3CString)
  {* ���������� ���������� ������ }
  protected
   {$If NOT Defined(DesignTimeLibrary)}
   class function IsCacheable: Boolean; override;
    {* ������� ������, ������������ ����� �� ������� ������� ������ �������� � ��� ���������� �������������. }
   {$IfEnd} // NOT Defined(DesignTimeLibrary)
 end;//Tl3InterfacedString

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , tfwIl3CStringPack
 {$IfEnd} // NOT Defined(NoScripts)
;

{$If NOT Defined(DesignTimeLibrary)}
class function Tl3InterfacedString.IsCacheable: Boolean;
 {* ������� ������, ������������ ����� �� ������� ������� ������ �������� � ��� ���������� �������������. }
//#UC START# *47A6FEE600FC_47CC4CCC02FA_var*
//#UC END# *47A6FEE600FC_47CC4CCC02FA_var*
begin
//#UC START# *47A6FEE600FC_47CC4CCC02FA_impl*
 Result := true;
//#UC END# *47A6FEE600FC_47CC4CCC02FA_impl*
end;//Tl3InterfacedString.IsCacheable
{$IfEnd} // NOT Defined(DesignTimeLibrary)

end.
