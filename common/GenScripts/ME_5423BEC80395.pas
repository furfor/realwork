unit l3RevertedInt64List;

// ������: "w:\common\components\rtl\Garant\L3\l3RevertedInt64List.pas"
// ���������: "SimpleClass"

{$Include l3Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = Int64;
 _l3RevertedAtomicList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3RevertedAtomicList.imp.pas}
 Tl3RevertedInt64List = class(_l3RevertedAtomicList_)
 end;//Tl3RevertedInt64List

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

{$If not Declared(_DataType_)}type _DataType_ = Tl3Ptr;{$IfEnd}

{$If not Declared(_FindDataType_)}type _FindDataType_ = _ItemType_;{$IfEnd}

type _Instance_R_ = Tl3RevertedInt64List;

{$Include w:\common\components\rtl\Garant\L3\l3RevertedAtomicList.imp.pas}

end.
