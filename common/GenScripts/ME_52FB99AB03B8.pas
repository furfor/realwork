unit csNotifyObjList;

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , csNotifyObj
;

type
 TcsNotifyObjList = class(_l3UncomparabeObjectRefList_)
  procedure AssignItem(const aTo: _ItemType_;
   const aFrom: _ItemType_);
  function CompareExistingItems(const CI: CompareItemsRec): Integer;
   {* ���������� ��� ������������ ��������. }
 end;//TcsNotifyObjList
 
implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

end.
