unit evReqRowPainter;

// ������: "w:\common\components\gui\Garant\Everest\evReqRowPainter.pas"
// ���������: "SimpleClass"
// ������� ������: "TevReqRowPainter" MUID: (50D3F54E00A8)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

{$If Defined(evNeedPainters)}
uses
 l3IntfUses
 , evTableRowPainter
;

type
 TevReqRowPainter = class(TevTableRowPainter)
 end;//TevReqRowPainter
{$IfEnd} // Defined(evNeedPainters)

implementation

{$If Defined(evNeedPainters)}
uses
 l3ImplUses
;
{$IfEnd} // Defined(evNeedPainters)

end.
