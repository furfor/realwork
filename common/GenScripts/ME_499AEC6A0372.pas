unit F1Test;
 {* ������� ������ ��� �������� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\F1Test.pas"
// ���������: "TestLibrary"
// ������� ������: "F1Test" MUID: (499AEC6A0372)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

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
 , EverestTest
 , VTTest
 {$If NOT Defined(NoVCM)}
 , VCMTest
 {$IfEnd} // NOT Defined(NoVCM)
 {$If Defined(Nemesis)}
 , NemesisTest
 {$IfEnd} // Defined(Nemesis)
 , AFWTest
 {$If NOT Defined(NoVGScene)}
 , VGSceneTest
 {$IfEnd} // NOT Defined(NoVGScene)
 , nsDocumentsList_p
 , tc5OpenApp
 , tc6OpenApp
;
{$IfEnd} // NOT Defined(XE)

end.
