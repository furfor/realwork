unit NOT_FINISHED_jclDebug;

// ������: "w:\common\components\rtl\external\JEDI\source\windows\NOT_FINISHED_jclDebug.pas"
// ���������: "UtilityPack"
// ������� ������: "jclDebug" MUID: (4B72BED1017B)

{$Include w:\common\components\l3Define.inc}

interface

{$If NOT Defined(notDebugStackTrace)}
uses
 l3IntfUses
;

type
 TJclStackInfoList = class
 end;//TJclStackInfoList

procedure JclLastExceptStackList;
{$IfEnd} // NOT Defined(notDebugStackTrace)

implementation

{$If NOT Defined(notDebugStackTrace)}
uses
 l3ImplUses
 //#UC START# *4B72BED1017Bimpl_uses*
 //#UC END# *4B72BED1017Bimpl_uses*
;

procedure JclLastExceptStackList;
//#UC START# *4B72BEEB00CA_4B72BED1017B_var*
//#UC END# *4B72BEEB00CA_4B72BED1017B_var*
begin
//#UC START# *4B72BEEB00CA_4B72BED1017B_impl*
 !!! Needs to be implemented !!!
//#UC END# *4B72BEEB00CA_4B72BED1017B_impl*
end;//JclLastExceptStackList
{$IfEnd} // NOT Defined(notDebugStackTrace)

end.
