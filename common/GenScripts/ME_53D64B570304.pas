unit NOT_FINISHED_evTextCursorPair;

// ������: "w:\common\components\gui\Garant\Everest\NOT_FINISHED_evTextCursorPair.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

{$If Defined(evUseVisibleCursors)}
uses
 l3IntfUses
 , evLeafParaCursorPair
;

type
 TevTextCursorPair = class(TevLeafParaCursorPair)
 end;//TevTextCursorPair
{$IfEnd} // Defined(evUseVisibleCursors)

implementation

{$If Defined(evUseVisibleCursors)}
uses
 l3ImplUses
;
{$IfEnd} // Defined(evUseVisibleCursors)

end.
