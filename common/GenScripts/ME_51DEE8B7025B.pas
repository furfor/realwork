unit Int64List;

// ������: "w:\common\components\SandBox\Int64List.pas"
// ���������: "SimpleClass"

{$Include sbDefine.inc}

interface

uses
 l3IntfUses
 , Refcounted
 , l3PtrLoc
 , Classes
;

type
 _ItemType_ = Int64;
 {$Include w:\common\components\SandBox\StandardAtomicList.imp.pas}
 TInt64List = class(_StandardAtomicList_)
 end;//TInt64List

implementation

uses
 l3ImplUses
 , RTLConsts
 , l3MemorySizeUtils
;

{$Include w:\common\components\SandBox\StandardAtomicList.imp.pas}

end.
