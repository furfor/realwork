unit K309168151;
 {* [Requestlink:309168151] }

// ������: "w:\archi\source\projects\Archi\Tests\K309168151.pas"
// ���������: "TestCase"
// ������� ������: "K309168151" MUID: (4ED758D70321)
// ��� ����: "TK309168151"

{$Include w:\archi\source\projects\Archi\arDefine.inc}

interface

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3IntfUses
 {$If NOT Defined(NoScripts)}
 , ArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
;

type
 TK309168151 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:309168151] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK309168151
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *4ED758D70321impl_uses*
 //#UC END# *4ED758D70321impl_uses*
;

{$If NOT Defined(NoScripts)}
function TK309168151.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'SBSTests';
end;//TK309168151.GetFolder

function TK309168151.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '4ED758D70321';
end;//TK309168151.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK309168151.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
