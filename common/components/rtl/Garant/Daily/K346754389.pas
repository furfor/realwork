unit K346754389;
 {* [Requestlink:346754389] }

// ������: "w:\common\components\rtl\Garant\Daily\K346754389.pas"
// ���������: "TestCase"
// ������� ������: "K346754389" MUID: (51249C870157)
// ��� ����: "TK346754389"

{$Include w:\common\components\rtl\Garant\Daily\TestDefine.inc.pas}

interface

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , EVDtoBothNSRCWriterTest
;

type
 TK346754389 = class(TEVDtoBothNSRCWriterTest)
  {* [Requestlink:346754389] }
  protected
   function GetFolder: AnsiString; override;
    {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
    {* ������������� �������� ������, ������� ��������� ���� }
 end;//TK346754389
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

implementation

{$If Defined(nsTest) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , TestFrameWork
 //#UC START# *51249C870157impl_uses*
 //#UC END# *51249C870157impl_uses*
;

function TK346754389.GetFolder: AnsiString;
 {* ����� � ������� ������ ���� }
begin
 Result := '7.8';
end;//TK346754389.GetFolder

function TK346754389.GetModelElementGUID: AnsiString;
 {* ������������� �������� ������, ������� ��������� ���� }
begin
 Result := '51249C870157';
end;//TK346754389.GetModelElementGUID

initialization
 TestFramework.RegisterTest(TK346754389.Suite);
{$IfEnd} // Defined(nsTest) AND NOT Defined(NoScripts)

end.
