unit AFWTest;
 {* ����� ��� AFW � ����������� ��������� }

// ������: "w:\common\components\gui\Garant\AFW\AFWTest.pas"
// ���������: "TestLibrary"
// ������� ������: "AFWTest" MUID: (499AF0880116)

{$Include w:\common\components\l3Define.inc}

interface

{$If NOT Defined(XE)}
uses
 l3IntfUses
;
{$IfEnd} // NOT Defined(XE)

implementation

{$If NOT Defined(XE)}
uses
 l3ImplUses
 , AFWTest_VCL_TestUnit
 , AFWTest_Rtl_TestUnit
 , tc5OpenApp
 , tc6OpenApp
;
{$IfEnd} // NOT Defined(XE)

end.
