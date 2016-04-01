unit NOT_COMPLETED_dtCustomDictItem;
 {* ������� ������� �������. }

// ������: "w:\common\components\rtl\Garant\DT\NOT_COMPLETED_dtCustomDictItem.pas"
// ���������: "SimpleClass"
// ������� ������: "TdtCustomDictItem" MUID: (47BC507501AB)

{$Include w:\common\components\rtl\Garant\DT\DtDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , l3NCString
 , dt_Types
;

type
 TdtCustomDictItem = class(Tl3NCString)
  {* ������� ������� �������. }
  protected
   function Get_Handle: TDictID; virtual;
   procedure Set_Handle(aValue: TDictID); virtual;
   function pm_GetStringID: Integer; override;
   procedure pm_SetStringID(aValue: Integer); override;
  public
   property Handle: TDictID
    read Get_Handle
    write Set_Handle;
 end;//TdtCustomDictItem
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
;

function TdtCustomDictItem.Get_Handle: TDictID;
//#UC START# *47BC528601A2_47BC507501ABget_var*
//#UC END# *47BC528601A2_47BC507501ABget_var*
begin
//#UC START# *47BC528601A2_47BC507501ABget_impl*
 Result := 0;
//#UC END# *47BC528601A2_47BC507501ABget_impl*
end;//TdtCustomDictItem.Get_Handle

procedure TdtCustomDictItem.Set_Handle(aValue: TDictID);
//#UC START# *47BC528601A2_47BC507501ABset_var*
//#UC END# *47BC528601A2_47BC507501ABset_var*
begin
//#UC START# *47BC528601A2_47BC507501ABset_impl*
//#UC END# *47BC528601A2_47BC507501ABset_impl*
end;//TdtCustomDictItem.Set_Handle

function TdtCustomDictItem.pm_GetStringID: Integer;
//#UC START# *47BC3BFD017F_47BC507501ABget_var*
//#UC END# *47BC3BFD017F_47BC507501ABget_var*
begin
//#UC START# *47BC3BFD017F_47BC507501ABget_impl*
 Result := Get_Handle;
//#UC END# *47BC3BFD017F_47BC507501ABget_impl*
end;//TdtCustomDictItem.pm_GetStringID

procedure TdtCustomDictItem.pm_SetStringID(aValue: Integer);
//#UC START# *47BC3BFD017F_47BC507501ABset_var*
//#UC END# *47BC3BFD017F_47BC507501ABset_var*
begin
//#UC START# *47BC3BFD017F_47BC507501ABset_impl*
 Set_Handle(aValue);
//#UC END# *47BC3BFD017F_47BC507501ABset_impl*
end;//TdtCustomDictItem.pm_SetStringID
{$IfEnd} // NOT Defined(Nemesis)

end.
