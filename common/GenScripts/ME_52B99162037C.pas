unit NOT_FINISHED_vtCustomCommonPanel;

// ������: "w:\common\components\gui\Garant\VT\NOT_FINISHED_vtCustomCommonPanel.pas"
// ���������: "GuiControl"

{$Include w:\common\components\gui\Garant\VT\vtDefine.inc}

interface

uses
 l3IntfUses
 , vtPanel
;

type
 TvtCustomCommonPanel = class(TvtPanel)
 end;//TvtCustomCommonPanel

implementation

uses
 l3ImplUses
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
;

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TvtCustomCommonPanel);
 {* ����������� TvtCustomCommonPanel }
{$IfEnd} // NOT Defined(NoScripts)

end.
