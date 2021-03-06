unit l3StringToStringMap;

// ������: "w:\common\components\rtl\Garant\L3\l3StringToStringMap.pas"
// ���������: "SimpleClass"
// ������� ������: "Tl3StringToStringMap" MUID: (56963C1702B0)

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3Interfaces
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Core
 , l3Except
 , Classes
;

type
 _KeyType_ = Il3CString;
 _ValueType_ = Il3CString;
 {$Include w:\common\components\rtl\Garant\L3\l3Map.imp.pas}
 Tl3StringToStringMap = class(_l3Map_)
 end;//Tl3StringToStringMap

implementation

uses
 l3ImplUses
 , l3String
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
 //#UC START# *56963C1702B0impl_uses*
 //#UC END# *56963C1702B0impl_uses*
;

function CompareKeys(const aA: _KeyType_;
 const aB: _KeyType_): Integer;
//#UC START# *5609091B00C0_56963C1702B0_var*
//#UC END# *5609091B00C0_56963C1702B0_var*
begin
//#UC START# *5609091B00C0_56963C1702B0_impl*
 Result := l3Compare(aA.AsWStr, aB.AsWStr, l3_siCaseUnsensitive);
// Result := l3Compare(aA, aB);
//#UC END# *5609091B00C0_56963C1702B0_impl*
end;//CompareKeys

type _Instance_R_ = Tl3StringToStringMap;

{$Include w:\common\components\rtl\Garant\L3\l3Map.imp.pas}

end.
