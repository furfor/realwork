unit NOT_FINISHED_l3_String;
 {* ����� ����������� ������ � ����������� ������� �������� ������. }

// ������: "w:\common\components\rtl\Garant\L3\NOT_FINISHED_l3_String.pas"
// ���������: "SimpleClass"

{$Include l3Define.inc}

interface

uses
 l3IntfUses
 , l3CustomString
 , l3Interfaces
;

type
 Tl3_String = class(Tl3CustomString)
  {* ����� ����������� ������ � ����������� ������� �������� ������. }
  private
   f_String: Tl3WStrCast;
  public
   procedure NotifyDeletion(aPos: Integer;
    aLen: Integer); virtual;
 end;//Tl3_String

implementation

uses
 l3ImplUses
;

procedure Tl3_String.NotifyDeletion(aPos: Integer;
 aLen: Integer);
//#UC START# *4FB10B1D016B_4773DED9004C_var*
//#UC END# *4FB10B1D016B_4773DED9004C_var*
begin
//#UC START# *4FB10B1D016B_4773DED9004C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4FB10B1D016B_4773DED9004C_impl*
end;//Tl3_String.NotifyDeletion

end.
