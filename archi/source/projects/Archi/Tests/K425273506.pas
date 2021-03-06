unit K425273506;
 {* [Requestlink:425273506] }

// ������: "w:\archi\source\projects\Archi\Tests\K425273506.pas"
// ���������: "TestCase"
// ������� ������: "K425273506" MUID: (510A5A730083)
// ��� ����: "TK425273506"

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
 TK425273506 = class({$If NOT Defined(NoScripts)}
 TArchiInsiderTest
 {$IfEnd} // NOT Defined(NoScripts)
 )
  {* [Requestlink:425273506] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK425273506
{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)

implementation

{$If Defined(nsTest) AND Defined(InsiderTest)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *510A5A730083impl_uses*
 //#UC END# *510A5A730083impl_uses*
;

{$If NOT Defined(NoScripts)}
function TK425273506.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := 'InnerTable';
end;//TK425273506.GetFolder

function TK425273506.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '510A5A730083';
end;//TK425273506.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK425273506.Suite);
{$IfEnd} // NOT Defined(NoScripts)

{$IfEnd} // Defined(nsTest) AND Defined(InsiderTest)
end.
