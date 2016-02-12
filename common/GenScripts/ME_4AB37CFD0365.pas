unit m4WordIDStrListPrim;
 {* ������ ������� ��������������� ���� }

// ������: "w:\common\components\rtl\Garant\m4\m4WordIDStrListPrim.pas"
// ���������: "SimpleClass"

{$Include m4Define.inc}

interface

uses
 l3IntfUses
 , l3ProtoDataContainer
 , m4WordIDStr
 , l3Memory
 , l3Types
 , l3Interfaces
 , l3Core
 , l3Except
 , Classes
;

type
 _ItemType_ = Tm4WordIDStr;
 _l3ObjectRefListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3ObjectRefListPrim.imp.pas}
 Tm4WordIDStrListPrim = class(_l3ObjectRefListPrim_)
  {* ������ ������� ��������������� ���� }
 end;//Tm4WordIDStrListPrim

implementation

uses
 l3ImplUses
 , l3Base
 , l3MinMax
 , RTLConsts
 , SysUtils
;

procedure FillItem(var aPlace: _ItemType_;
 const anItem: _ItemType_
{$If Defined(l3Items_FillItem_NeedsList)}
;
 anItems: _l3Items_
{$IfEnd} // Defined(l3Items_FillItem_NeedsList)
); forward;

procedure FreeItem(var aPlace: _ItemType_
{$If Defined(l3Items_FreeItem_NeedsList)}
;
 aList: _l3Items_
{$IfEnd} // Defined(l3Items_FreeItem_NeedsList)
); forward;

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_4AB37CFD0365_var*
//#UC END# *47B2C42A0163_4AB37CFD0365_var*
begin
//#UC START# *47B2C42A0163_4AB37CFD0365_impl*
 Assert(false);
//#UC END# *47B2C42A0163_4AB37CFD0365_impl*
end;//AssignItem
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)

procedure FillItem(var aPlace: _ItemType_;
 const anItem: _ItemType_
{$If Defined(l3Items_FillItem_NeedsList)};
 anItems: _l3Items_
{$IfEnd} // Defined(l3Items_FillItem_NeedsList)
);
 {* ��������� ������� ������. }
//#UC START# *47B935AF0066_4AB37CFD0365_var*
//#UC END# *47B935AF0066_4AB37CFD0365_var*
begin
//#UC START# *47B935AF0066_4AB37CFD0365_impl*
 aPlace := anItem.Use;
//#UC END# *47B935AF0066_4AB37CFD0365_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_
{$If Defined(l3Items_FreeItem_NeedsList)};
 aList: _l3Items_
{$IfEnd} // Defined(l3Items_FreeItem_NeedsList)
);
 {* ������� ������� ������ }
//#UC START# *47B94A5C006E_4AB37CFD0365_var*
//#UC END# *47B94A5C006E_4AB37CFD0365_var*
begin
//#UC START# *47B94A5C006E_4AB37CFD0365_impl*
 FreeAndNil(aPlace);
//#UC END# *47B94A5C006E_4AB37CFD0365_impl*
end;//FreeItem

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* ���������� ��� ������������ ��������. }
//#UC START# *47B99D4503A2_4AB37CFD0365_var*
//#UC END# *47B99D4503A2_4AB37CFD0365_var*
begin
//#UC START# *47B99D4503A2_4AB37CFD0365_impl*
  Result := CI.rA.Compare(CI.rB^);
//#UC END# *47B99D4503A2_4AB37CFD0365_impl*
end;//CompareExistingItems

type _Instance_R_ = Tm4WordIDStrListPrim;

{$Include w:\common\components\rtl\Garant\L3\l3ObjectRefListPrim.imp.pas}

end.
