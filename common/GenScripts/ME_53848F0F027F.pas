unit ddTaskRecordList;

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , ddTaskRecord
;

type
 TddTaskRecordList = class(_l3UncomparabeObjectRefList_)
  procedure AssignItem(const aTo: _ItemType_;
   const aFrom: _ItemType_);
  function CompareExistingItems(const CI: CompareItemsRec): Integer;
   {* ���������� ��� ������������ ��������. }
 end;//TddTaskRecordList
 
implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

end.
