unit csMessageRecepientList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "cs"
// ������: "w:/common/components/rtl/Garant/cs/csMessageRecepientList.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi For Archi::cs::Tasks::csMessageRecepientList
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\cs\CsDefine.inc}

interface

{$If not defined(Nemesis)}
uses
  l3ProtoObject,
  csMessageRecepient,
  csMessageRecepientListPrim,
  SyncObjs
  ;

type
  csMessageRecepientIterator_ForEachF_Action = function (anItem: TcsMessageRecepient): Boolean;
   {* ��� �������������� ������� ��� csMessageRecepientIterator.ForEachF }

(*
 csMessageRecepientIterator = PureMixIn
   {iterator} procedure ForEachF(anAction: csMessageRecepientIterator_ForEachF_Action);
 end;//csMessageRecepientIterator
*)

 _l3CriticalSectionHolder_Parent_ = Tl3ProtoObject;
 {$Include w:\common\components\rtl\Garant\L3\l3CriticalSectionHolder.imp.pas}
 TcsMessageRecepientList = class(_l3CriticalSectionHolder_)
 private
 // private fields
   f_Items : TcsMessageRecepientListPrim;
    {* ���� ��� �������� Items}
 protected
 // property methods
   function pm_GetCount: Integer;
 public
 // realized methods
   {iterator} procedure ForEachF(anAction: csMessageRecepientIterator_ForEachF_Action);
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure InitFields; override;
 public
 // public methods
   function Add(anItem: TcsMessageRecepient): TcsMessageRecepient;
   procedure Clear;
 protected
 // protected properties
   property Items: TcsMessageRecepientListPrim
     read f_Items;
 public
 // public properties
   property Count: Integer
     read pm_GetCount;
 end;//TcsMessageRecepientList
function L2CsMessageRecepientIteratorForEachFAction(anAction: pointer): csMessageRecepientIterator_ForEachF_Action;
   {* ������� ������������ �������� ��� ��������� �������������� ������� ��� csMessageRecepientIterator.ForEachF }
{$IfEnd} //not Nemesis

implementation

{$If not defined(Nemesis)}
uses
  l3Base,
  SysUtils
  ;

// start class csMessageRecepientIterator

function L2CsMessageRecepientIteratorForEachFAction(anAction: pointer): csMessageRecepientIterator_ForEachF_Action;
 {-}
asm
 jmp l3LocalStub
end;//L2CsMessageRecepientIteratorForEachFAction
{$Include w:\common\components\rtl\Garant\L3\l3CriticalSectionHolder.imp.pas}

// start class TcsMessageRecepientList

function TcsMessageRecepientList.Add(anItem: TcsMessageRecepient): TcsMessageRecepient;
//#UC START# *53A2DD470028_53A2D3BC030A_var*
//#UC END# *53A2DD470028_53A2D3BC030A_var*
begin
//#UC START# *53A2DD470028_53A2D3BC030A_impl*
 Lock;
 try
  Result := Items[Items.Add(anItem)];
 finally
  Unlock;
 end;//try..finally
//#UC END# *53A2DD470028_53A2D3BC030A_impl*
end;//TcsMessageRecepientList.Add

procedure TcsMessageRecepientList.Clear;
//#UC START# *53A2DDCF036D_53A2D3BC030A_var*
//#UC END# *53A2DDCF036D_53A2D3BC030A_var*
begin
//#UC START# *53A2DDCF036D_53A2D3BC030A_impl*
 Lock;
 try
  Items.Clear;
 finally
  Unlock;
 end;//try..finally
//#UC END# *53A2DDCF036D_53A2D3BC030A_impl*
end;//TcsMessageRecepientList.Clear

function TcsMessageRecepientList.pm_GetCount: Integer;
//#UC START# *53A2DE24004A_53A2D3BC030Aget_var*
//#UC END# *53A2DE24004A_53A2D3BC030Aget_var*
begin
//#UC START# *53A2DE24004A_53A2D3BC030Aget_impl*
 Result := Items.Count;
//#UC END# *53A2DE24004A_53A2D3BC030Aget_impl*
end;//TcsMessageRecepientList.pm_GetCount

{iterator} procedure TcsMessageRecepientList.ForEachF(anAction: csMessageRecepientIterator_ForEachF_Action);
//#UC START# *53A2DDAB0054_53A2D3BC030A_var*

type
 PObject = ^TObject;

 function DoIt(aData : PObject; anIndex : Integer) : Boolean;
 begin
  Result := anAction(TcsMessageRecepient(aData^));
 end;
 
var
 Hack : Pointer absolute anAction;
//#UC END# *53A2DDAB0054_53A2D3BC030A_var*
begin
//#UC START# *53A2DDAB0054_53A2D3BC030A_impl*
 try
  Lock;
  try
   f_Items.IterateAllF(l3L2IA(@DoIt));
  finally
   Unlock;
  end;//try..finally
 finally
  l3FreeLocalStub(Hack);
 end;//try..finally
//#UC END# *53A2DDAB0054_53A2D3BC030A_impl*
end;//TcsMessageRecepientList.ForEachF

procedure TcsMessageRecepientList.Cleanup;
//#UC START# *479731C50290_53A2D3BC030A_var*
//#UC END# *479731C50290_53A2D3BC030A_var*
begin
//#UC START# *479731C50290_53A2D3BC030A_impl*
 FreeAndNil(f_Items);
 inherited;
//#UC END# *479731C50290_53A2D3BC030A_impl*
end;//TcsMessageRecepientList.Cleanup

procedure TcsMessageRecepientList.InitFields;
//#UC START# *47A042E100E2_53A2D3BC030A_var*
//#UC END# *47A042E100E2_53A2D3BC030A_var*
begin
//#UC START# *47A042E100E2_53A2D3BC030A_impl*
 inherited;
 f_Items := TcsMessageRecepientListPrim.Create;
//#UC END# *47A042E100E2_53A2D3BC030A_impl*
end;//TcsMessageRecepientList.InitFields
{$IfEnd} //not Nemesis

end.