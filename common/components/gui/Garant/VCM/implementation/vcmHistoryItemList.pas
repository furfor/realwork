unit vcmHistoryItemList;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "VCM$Visual"
// ������: "w:/common/components/gui/Garant/VCM/implementation/vcmHistoryItemList.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::VCM$Visual::Implementation::TvcmHistoryItemList
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If not defined(NoVCM)}
uses
  vcmInterfaces,
  l3ProtoDataContainer,
  l3Types,
  l3Memory,
  l3Interfaces,
  l3Core,
  l3Except,
  Classes
  ;
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}
type
 _ItemType_ = IvcmHistoryItem;
 _l3InterfaceRefList_Parent_ = Tl3ProtoDataContainer;
 {$Define l3Items_IsProto}
 {$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}
 TvcmHistoryItemList = class(_l3InterfaceRefList_, IvcmHistoryItems)
 protected
 // realized methods
   function Get_HistoryItemCount: Integer;
   function Get_HistoryItems(Index: Integer): IvcmHistoryItem;
   function MakeClone: IvcmHistoryItems;
 public
 // public methods
   constructor Create(const aOtherList: IvcmHistoryItems); reintroduce; overload; 
   class function Make(const aOtherList: IvcmHistoryItems): IvcmHistoryItems; reintroduce; overload; 
     {* ��������� ������� TvcmHistoryItemList.Make }
   constructor Create; overload; 
     {* ��������� ������ Create$1 }
   class function Make: IvcmHistoryItems; reintroduce; overload; 
     {* ��������� ������� TvcmHistoryItemList.Make$1 }
   procedure Assign(const aOtherList: IvcmHistoryItems);
 end;//TvcmHistoryItemList
{$IfEnd} //not NoVCM

implementation

{$If not defined(NoVCM)}
uses
  l3Base,
  l3MinMax,
  RTLConsts,
  SysUtils
  ;
{$IfEnd} //not NoVCM

{$If not defined(NoVCM)}

type _Instance_R_ = TvcmHistoryItemList;

{$Include w:\common\components\rtl\Garant\L3\l3InterfaceRefList.imp.pas}

// start class TvcmHistoryItemList

constructor TvcmHistoryItemList.Create(const aOtherList: IvcmHistoryItems);
//#UC START# *558A37400258_558947020183_var*
//#UC END# *558A37400258_558947020183_var*
begin
//#UC START# *558A37400258_558947020183_impl*
 inherited Create;
 Assign(aOtherList);
//#UC END# *558A37400258_558947020183_impl*
end;//TvcmHistoryItemList.Create

class function TvcmHistoryItemList.Make(const aOtherList: IvcmHistoryItems): IvcmHistoryItems;
var
 l_Inst : TvcmHistoryItemList;
begin
 l_Inst := Create(aOtherList);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

constructor TvcmHistoryItemList.Create;
//#UC START# *558A3C5601E4_558947020183_var*
//#UC END# *558A3C5601E4_558947020183_var*
begin
//#UC START# *558A3C5601E4_558947020183_impl*
 inherited Create;
//#UC END# *558A3C5601E4_558947020183_impl*
end;//TvcmHistoryItemList.Create

class function TvcmHistoryItemList.Make: IvcmHistoryItems;
var
 l_Inst : TvcmHistoryItemList;
begin
 l_Inst := Create;
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;

procedure TvcmHistoryItemList.Assign(const aOtherList: IvcmHistoryItems);
//#UC START# *558A411B0177_558947020183_var*
var
 l_Index: Integer;
//#UC END# *558A411B0177_558947020183_var*
begin
//#UC START# *558A411B0177_558947020183_impl*
 Clear;
 for l_Index := 0 to Pred(aOtherList.HistoryItemCount) do
  Add(aOtherList.HistoryItems[l_Index]);
//#UC END# *558A411B0177_558947020183_impl*
end;//TvcmHistoryItemList.Assign

function TvcmHistoryItemList.Get_HistoryItemCount: Integer;
//#UC START# *55894A2A006B_558947020183get_var*
//#UC END# *55894A2A006B_558947020183get_var*
begin
//#UC START# *55894A2A006B_558947020183get_impl*
 Result := Count;
//#UC END# *55894A2A006B_558947020183get_impl*
end;//TvcmHistoryItemList.Get_HistoryItemCount

function TvcmHistoryItemList.Get_HistoryItems(Index: Integer): IvcmHistoryItem;
//#UC START# *55894A3F00A3_558947020183get_var*
//#UC END# *55894A3F00A3_558947020183get_var*
begin
//#UC START# *55894A3F00A3_558947020183get_impl*
 Result := Items[Index];
//#UC END# *55894A3F00A3_558947020183get_impl*
end;//TvcmHistoryItemList.Get_HistoryItems

function TvcmHistoryItemList.MakeClone: IvcmHistoryItems;
//#UC START# *55894A720144_558947020183_var*
//#UC END# *55894A720144_558947020183_var*
begin
//#UC START# *55894A720144_558947020183_impl*
 Result := TvcmHistoryItemList.Make(Self);
//#UC END# *55894A720144_558947020183_impl*
end;//TvcmHistoryItemList.MakeClone

{$IfEnd} //not NoVCM

end.