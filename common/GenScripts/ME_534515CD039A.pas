{$IfNDef l3VariantListPrim_imp}

// ������: "w:\common\components\rtl\Garant\L3\l3VariantListPrim.imp.pas"
// ���������: "Impurity"

{$Define l3VariantListPrim_imp}

 _ItemType_ = Tl3Variant;
 _l3RefList_Parent_ = _l3VariantListPrim_Parent_;
 {$Include l3RefList.imp.pas}
 _l3VariantListPrim_ = class(_l3RefList_)
 end;//_l3VariantListPrim_

{$Else l3VariantListPrim_imp}

{$IfNDef l3VariantListPrim_imp_impl}

{$Define l3VariantListPrim_imp_impl}

procedure FillItem(var aPlace: _ItemType_;
 const anItem: _ItemType_;
 anItems: _l3Items_); forward;

procedure FreeItem(var aPlace: _ItemType_;
 aList: _l3Items_); forward;

{$If NOT Defined(l3Items_IsAtomic)}
function IsSameItems(const A: _ItemType_;
 const B: _ItemType_): Boolean;
 {* ���������� �������� ������ }
//#UC START# *47B07CF403D0_534515CD039A_var*
//#UC END# *47B07CF403D0_534515CD039A_var*
begin
//#UC START# *47B07CF403D0_534515CD039A_impl*
 if (A = nil) then
  Result := (B = nil) OR B.IsNull
 else
  Result := A.Box.IsSame(B.Box);
//#UC END# *47B07CF403D0_534515CD039A_impl*
end;//IsSameItems
{$IfEnd} // NOT Defined(l3Items_IsAtomic)

procedure FillItem(var aPlace: _ItemType_;
 const anItem: _ItemType_;
 anItems: _l3Items_);
 {* ��������� ������� ������. }
//#UC START# *47B935AF0066_534515CD039A_var*
//#UC END# *47B935AF0066_534515CD039A_var*
begin
//#UC START# *47B935AF0066_534515CD039A_impl*
 aPlace := anItem.Use;
//#UC END# *47B935AF0066_534515CD039A_impl*
end;//FillItem

procedure FreeItem(var aPlace: _ItemType_;
 aList: _l3Items_);
 {* ������� ������� ������ }
//#UC START# *47B94A5C006E_534515CD039A_var*
//#UC END# *47B94A5C006E_534515CD039A_var*
begin
//#UC START# *47B94A5C006E_534515CD039A_impl*
 FreeAndNil(aPlace);
//#UC END# *47B94A5C006E_534515CD039A_impl*
end;//FreeItem

{$Include l3RefList.imp.pas}

{$EndIf l3VariantListPrim_imp_impl}

{$EndIf l3VariantListPrim_imp}

