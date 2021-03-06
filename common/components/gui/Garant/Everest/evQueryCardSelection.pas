unit evQueryCardSelection;

// ������: "w:\common\components\gui\Garant\Everest\evQueryCardSelection.pas"
// ���������: "SimpleClass"
// ������� ������: "TevQueryCardSelection" MUID: (48E2466300B3)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
 l3IntfUses
 , nevSelection
 , nevTools
;

type
 TevQueryCardSelection = class(TnevSelection)
  protected
   function DoGetBlock(const aDocument: InevObject): InevRange; override;
 end;//TevQueryCardSelection

implementation

uses
 l3ImplUses
 , k2Tags
 , evOp
 , LeafPara_Const
 //#UC START# *48E2466300B3impl_uses*
 //#UC END# *48E2466300B3impl_uses*
;

function TevQueryCardSelection.DoGetBlock(const aDocument: InevObject): InevRange;
//#UC START# *48E252D40298_48E2466300B3_var*
{$IfNDef DesignTimeLibrary}
var
 l_TagS : PInevObject;
 l_TagF : PInevObject;
 l_B    : InevBasePoint;
{$EndIf DesignTimeLibrary}
//#UC END# *48E252D40298_48E2466300B3_var*
begin
//#UC START# *48E252D40298_48E2466300B3_impl*
 {$IfNDef DesignTimeLibrary}
 if (Start = nil) then
  Result := nil
 else
 begin
  l_TagS := Start.MostInner.Obj;
  if Finish <> nil then
   l_TagF := Finish.MostInner.Obj
  else
   l_TagF := nil;
  Assert(aDocument <> nil); 
  if not l_TagS.AsObject.IsKindOf(k2_typLeafPara) then
  begin
   l_B := Start.ClonePoint(View).ToBottomChild(View).PointToParent(aDocument);
   Result := aDocument.Range(l_B, l_B);
  end//not l_TagS.IsKindOf(k2_typLeafPara)
  else
  if (l_TagF <> nil) AND l_TagS.AsObject.IsSame(l_TagF^.AsObject) then
   Result := inherited DoGetBlock(aDocument)
  else
  begin
   if (StartMark.Compare(Start) = 0) then
   begin
    l_B := l_TagS.MakePoint;
    l_B.Move(View, ev_ocBottomRight);
    Result := aDocument.Range(Start, l_B.PointToParent(aDocument))
   end//StartMark.Compare(Start) = 0
   else
   begin
    if l_TagF <> nil then
    begin
     l_B := l_TagF.MakePoint;
     Result := aDocument.Range(l_B.PointToParent(aDocument), Finish);
    end // if l_TagF <> nil then
    else
     Result := inherited DoGetBlock(aDocument);
   end;//StartMark.Compare(Start) = 0
  end;//l_TagS.IsSame(l_TagF)
 end;//Start = nil
 {$Else   DesignTimeLibrary}
 Result := inherited DoGetBlock(aDocument);
 {$EndIf  DesignTimeLibrary}
//#UC END# *48E252D40298_48E2466300B3_impl*
end;//TevQueryCardSelection.DoGetBlock

end.
