unit k2DictionaryPrim;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "K2"
// ������: "w:/common/components/rtl/Garant/K2/k2DictionaryPrim.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::K2::k2CoreObjects::Tk2DictionaryPrim
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\K2\k2Define.inc}

interface

uses
  l3ProtoDataContainer,
  l3Variant,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;

 {$Define l3Items_NeedsAssignItem}

 {$Define l3Items_CaseUnsensitive}

 {$Define l3Items_NeedsBeforeFreeItem}

 {$Undef l3Items_NoSort}

type
 _l3VariantListPrim_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3VariantListPrim.imp.pas}
 Tk2DictionaryPrim = class(_l3VariantListPrim_)
 end;//Tk2DictionaryPrim

implementation

uses
  k2BaseTypes,
  k2Tags,
  l3String,
  k2NonOptimizeContext,
  SysUtils,
  l3Base,
  l3MinMax,
  RTLConsts
  ;

// start class Tk2DictionaryPrim

function CompareExistingItems(const CI: CompareItemsRec): Integer; forward;

{$If defined(l3Items_NeedsAssignItem) AND not defined(l3Items_NoSort)}
procedure AssignItem(const aTo: _ItemType_;
  const aFrom: _ItemType_);
//#UC START# *47B2C42A0163_5304C94F0101_var*
//#UC END# *47B2C42A0163_5304C94F0101_var*
begin
//#UC START# *47B2C42A0163_5304C94F0101_impl*
 aTo.AsObject.AssignTag(aFrom.AsObject, k2_amAll {- [k2_amNull]}, Tk2NonOptimizeContext.Instance);
//#UC END# *47B2C42A0163_5304C94F0101_impl*
end;//AssignItem
{$IfEnd} //l3Items_NeedsAssignItem AND not l3Items_NoSort

function CompareExistingItems(const CI: CompareItemsRec): Integer;
//#UC START# *47B99D4503A2_5304C94F0101_var*
//#UC END# *47B99D4503A2_5304C94F0101_var*
begin
//#UC START# *47B99D4503A2_5304C94F0101_impl*
//#UC START# *47B99D4503A2_4B88F8D6025A_impl*
 {$IfDef l3Items_HasCustomSort}
 Assert((CI.rSortIndex = l3_siNative) OR
        (CI.rSortIndex = l3_siCaseUnsensitive) {OR
        (CI.rSortIndex = l3_siByID)}
        );
 {$EndIf l3Items_HasCustomSort}
  Result := l3Compare(CI.rA.PCharLenA[k2_tiName], CI.rB.PCharLenA[k2_tiName],
                      {$IfDef l3Items_HasCustomSort}
                      CI.rSortIndex
                      {$Else  l3Items_HasCustomSort}
                      {$IfDef l3Items_CaseUnsensitive}
                      l3_siCaseUnsensitive
                      {$Else  l3Items_CaseUnsensitive}
                      l3_siNative
                      {$EndIf l3Items_CaseUnsensitive}
                      {$EndIf l3Items_HasCustomSort}
                      );
//#UC END# *47B99D4503A2_5304C94F0101_impl*
end;//CompareExistingItems

type _Instance_R_ = Tk2DictionaryPrim;

{$Include w:\common\components\rtl\Garant\L3\l3VariantListPrim.imp.pas}

end.