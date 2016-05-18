unit FoldersTree_Form;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Folders\Forms\FoldersTree_Form.pas"
// ���������: "VCMFinalForm"
// ������� ������: "FoldersTree" MUID: (4ABCD29401B2)
// ��� ����: "TenFoldersTree"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimFoldersTreeOptions_Form
 , Common_FormDefinitions_Controls
;

type
 TenFoldersTree = {final} class(TPrimFoldersTreeOptionsForm, FoldersTreeFormDef)
 end;//TenFoldersTree
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
 , FoldersTreeKeywordsPack
 {$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCL)
;

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TenFoldersTree);
 {* ����������� FoldersTree }
{$IfEnd} // NOT Defined(NoScripts)
 fm_enFoldersTree.SetFactory(TenFoldersTree.Make);
 {* ����������� ������� ����� FoldersTree }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
