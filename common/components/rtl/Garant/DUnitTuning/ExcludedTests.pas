unit ExcludedTests;
 {* �����, ������� �� ���� ��������� - [$227477825]. }

// ������: "w:\common\components\rtl\Garant\DUnitTuning\ExcludedTests.pas"
// ���������: "SimpleClass"
// ������� ������: "TExcludedTests" MUID: (4C44675A0269)

{$Include w:\common\components\rtl\Garant\DUnitTuning\tfwDefine.inc}

interface

{$If Defined(nsTest) AND NOT Defined(NotTunedDUnit)}
uses
 l3IntfUses
 , l3StringList
;

type
 TExcludedTests = class(Tl3StringList)
  {* �����, ������� �� ���� ��������� - [$227477825]. }
  public
   class function Exists: Boolean;
    {* ���������� ������ �� ��������� ���������� }
   class function Instance: TExcludedTests;
    {* ����� ��������� ���������� ���������� TExcludedTests }
 end;//TExcludedTests
{$IfEnd} // Defined(nsTest) AND NOT Defined(NotTunedDUnit)

implementation

{$If Defined(nsTest) AND NOT Defined(NotTunedDUnit)}
uses
 l3ImplUses
 , SysUtils
 , l3Base
 //#UC START# *4C44675A0269impl_uses*
 //#UC END# *4C44675A0269impl_uses*
;

var g_TExcludedTests: TExcludedTests = nil;
 {* ��������� ���������� TExcludedTests }

procedure TExcludedTestsFree;
 {* ����� ������������ ���������� ���������� TExcludedTests }
begin
 l3Free(g_TExcludedTests);
end;//TExcludedTestsFree

class function TExcludedTests.Exists: Boolean;
 {* ���������� ������ �� ��������� ���������� }
begin
 Result := g_TExcludedTests <> nil;
end;//TExcludedTests.Exists

class function TExcludedTests.Instance: TExcludedTests;
 {* ����� ��������� ���������� ���������� TExcludedTests }
begin
 if (g_TExcludedTests = nil) then
 begin
  l3System.AddExitProc(TExcludedTestsFree);
  g_TExcludedTests := Create;
 end;
 Result := g_TExcludedTests;
end;//TExcludedTests.Instance
{$IfEnd} // Defined(nsTest) AND NOT Defined(NotTunedDUnit)

end.
