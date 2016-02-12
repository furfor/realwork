{$IfNDef l3ObjectPtrList_imp}

// ������: "w:\common\components\rtl\Garant\L3\l3ObjectPtrList.imp.pas"
// ���������: "Impurity"

{$Define l3ObjectPtrList_imp}

 _l3PtrList_Parent_ = _l3ObjectPtrList_Parent_;
 {$Include w:\common\components\rtl\Garant\L3\l3PtrList.imp.pas}
 _l3ObjectPtrList_ = class(_l3PtrList_)
  {* ������ ���������� �� �������. }
 end;//_l3ObjectPtrList_

{$Else l3ObjectPtrList_imp}

{$IfNDef l3ObjectPtrList_imp_impl}

{$Define l3ObjectPtrList_imp_impl}

{$If not Declared(_DataType_)}type _DataType_ = Tl3Ptr;{$IfEnd}

{$If not Declared(_FindDataType_)}type _FindDataType_ = _ItemType_;{$IfEnd}

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_); forward;
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)
function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If NOT Defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
 const B: _ItemType_): Boolean;
 {* ���������� �������� ������ }
//#UC START# *47B07CF403D0_47B57B7800A7_var*
//#UC END# *47B07CF403D0_47B57B7800A7_var*
begin
//#UC START# *47B07CF403D0_47B57B7800A7_impl*
 Result := (A = B);
//#UC END# *47B07CF403D0_47B57B7800A7_impl*
end;//IsSameItems
{$IfEnd} // NOT Defined(l3Items_IsAtomic)

{$If Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
 const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_47B57B7800A7_var*
//#UC END# *47B2C42A0163_47B57B7800A7_var*
begin
//#UC START# *47B2C42A0163_47B57B7800A7_impl*
 Assert(false);
//#UC END# *47B2C42A0163_47B57B7800A7_impl*
end;//AssignItem
{$IfEnd} // Defined(l3Items_NeedsAssignItem) AND NOT Defined(l3Items_NoSort)

function CompareExistingItems(const CI: CompareItemsRec): Integer;
 {* ���������� ��� ������������ ��������. }
//#UC START# *47B99D4503A2_47B57B7800A7_var*
//#UC END# *47B99D4503A2_47B57B7800A7_var*
begin
//#UC START# *47B99D4503A2_47B57B7800A7_impl*
 Assert(false, '�������� ��������� ���� ���������������� �������� �� ����� ���� ���������');
 {$IfDef l3Items_HasCustomSort}
 Assert(CI.rSortIndex = l3_siNative);
 {$EndIf l3Items_HasCustomSort}
 Result := Integer(CI.rA^) - Integer(CI.rB^);
//#UC END# *47B99D4503A2_47B57B7800A7_impl*
end;//CompareExistingItems

{$Include w:\common\components\rtl\Garant\L3\l3PtrList.imp.pas}

{$EndIf l3ObjectPtrList_imp_impl}

{$EndIf l3ObjectPtrList_imp}

