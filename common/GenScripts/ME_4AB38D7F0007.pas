unit m4DictTypes;

// ������: "w:\common\components\rtl\Garant\m4\m4DictTypes.pas"
// ���������: "UtilityPack"

{$Include w:\common\components\rtl\Garant\m4\m4Define.inc}

interface

uses
 l3IntfUses
;

type
 Tm4DictItemID = Integer;
  {* ������������� �������� ������� }

 Tm4WordID = Integer;
  {* ����� � ������ }

 Tm4DictItemAddr = record
  rID: Tm4DictItemID;
  rDictionaryID: Integer;
 end;//Tm4DictItemAddr

function Tm4DictItemAddr_C(anID: Tm4DictItemID;
 aDictionaryID: Integer): Tm4DictItemAddr;

implementation

uses
 l3ImplUses
;

function Tm4DictItemAddr_C(anID: Tm4DictItemID;
 aDictionaryID: Integer): Tm4DictItemAddr;
//#UC START# *4ABA24E701F2_4ABA246700B4_var*
//#UC END# *4ABA24E701F2_4ABA246700B4_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *4ABA24E701F2_4ABA246700B4_impl*
 Result.rID := anID;
 Result.rDictionaryID := aDictionaryID;
//#UC END# *4ABA24E701F2_4ABA246700B4_impl*
end;//Tm4DictItemAddr_C

end.
