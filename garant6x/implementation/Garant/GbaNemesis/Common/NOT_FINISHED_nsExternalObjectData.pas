unit NOT_FINISHED_nsExternalObjectData;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\Common\NOT_FINISHED_nsExternalObjectData.pas"
// ���������: "SimpleClass"
// ������� ������: "TnsExternalObjectData" MUID: (51B060B60170)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
;

type
 TnsExternalObjectData = class
 end;//TnsExternalObjectData
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 //#UC START# *51B060B60170impl_uses*
 //#UC END# *51B060B60170impl_uses*
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
