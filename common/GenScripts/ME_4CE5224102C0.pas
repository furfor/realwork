unit l3ProtoObjectPtrList;
 {* ������ ���������� �� Tl3ProtoObject }

// ������: "w:\common\components\rtl\Garant\L3\l3ProtoObjectPtrList.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\L3\l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , l3ProtoObject
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = Tl3ProtoObject;
 _l3ObjectPtrList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3ObjectPtrList.imp.pas}
 Tl3ProtoObjectPtrList = class(_l3ObjectPtrList_)
  {* ������ ���������� �� Tl3ProtoObject }
 end;//Tl3ProtoObjectPtrList

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

type _Instance_R_ = Tl3ProtoObjectPtrList;

{$Include w:\common\components\rtl\Garant\L3\l3ObjectPtrList.imp.pas}

end.
