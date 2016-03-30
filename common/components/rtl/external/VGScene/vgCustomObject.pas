unit vgCustomObject;

// ������: "w:\common\components\rtl\external\VGScene\vgCustomObject.pas"
// ���������: "SimpleClass"
// ������� ������: "TvgCustomObject" MUID: (4D542078016E)

{$Include w:\common\components\rtl\external\VGScene\vg_define.inc}

interface

{$If NOT Defined(NoVGScene)}
uses
 l3IntfUses
 , vgComponent
;

type
 TvgCustomObject = {abstract} class(TvgComponent)
  protected
   function pm_GetIsVisual: Boolean; virtual; abstract;
  public
   property IsVisual: Boolean
    read pm_GetIsVisual;
 end;//TvgCustomObject
{$IfEnd} // NOT Defined(NoVGScene)

implementation

{$If NOT Defined(NoVGScene)}
uses
 l3ImplUses
;
{$IfEnd} // NOT Defined(NoVGScene)

end.
