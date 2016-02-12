unit evTableImplementation;

// ������: "w:\common\components\gui\Garant\Everest\evTableImplementation.pas"
// ���������: "SimpleClass"

{$Include evDefine.inc}

interface

{$If Defined(k2ForEditor)}
uses
 l3IntfUses
 , k2ProcTagTool
 , nevBase
 , nevTools
;

type
 _DeletingRowCorrector_Parent_ = Tk2ProcTagTool;
 {$Include w:\common\components\gui\Garant\Everest\DeletingRowCorrector.imp.pas}
 _CheckWidthInDeletingColumn_Parent_ = _DeletingRowCorrector_;
 {$Include w:\common\components\gui\Garant\Everest\CheckWidthInDeletingColumn.imp.pas}
 TevTableImplementation = class(_CheckWidthInDeletingColumn_, IevTable)
  private
   f_Loc: InevBasePoint;
   f_View: InevView;
    {* ���� ��� �������� View }
  protected
   procedure DoCloneSegments(const aOldRow: Tl3Variant;
    const aNewRow: Tl3Variant;
    const anOp: InevOp); virtual;
   function GetClearMode4Clone: TevClearMode; virtual;
   procedure InsertRows(NumRows: Integer;
    aAtEnd: Boolean);
    {* ��������� NumRows ����� � ������� ����� �������. }
   procedure InsertColumns(NumColumns: Integer);
    {* ��������� NumColumns �������� � ������� ����� �������. }
   procedure DeleteRow;
    {* ������� ������� ������ �������. }
   procedure DeleteColumn;
    {* ������� ������� �������. }
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure ClearFields; override;
  public
   constructor Create(const aView: InevView;
    const aLoc: InevBasePoint;
    const aProcessor: InevProcessor); reintroduce;
   class function Make(const aView: InevView;
    const aLoc: InevBasePoint;
    const aProcessor: InevProcessor): IevTable;
  protected
   property View: InevView
    read f_View;
 end;//TevTableImplementation
{$IfEnd} // Defined(k2ForEditor)

implementation

{$If Defined(k2ForEditor)}
uses
 l3ImplUses
 , evOp
 , evParaTools
 , evCursorTools
 , l3MinMax
 , l3Base
 , Table_Const
 , TableRow_Const
 , TableCell_Const
 , k2Tags
 , k2Base
 , evdTypes
 , l3Variant
 , evTableCellUtils
;

{$Include w:\common\components\gui\Garant\Everest\DeletingRowCorrector.imp.pas}

{$Include w:\common\components\gui\Garant\Everest\CheckWidthInDeletingColumn.imp.pas}

procedure TevTableImplementation.DoCloneSegments(const aOldRow: Tl3Variant;
 const aNewRow: Tl3Variant;
 const anOp: InevOp);
//#UC START# *5612461701A2_48D3D038036A_var*
//#UC END# *5612461701A2_48D3D038036A_var*
begin
//#UC START# *5612461701A2_48D3D038036A_impl*

//#UC END# *5612461701A2_48D3D038036A_impl*
end;//TevTableImplementation.DoCloneSegments

function TevTableImplementation.GetClearMode4Clone: TevClearMode;
//#UC START# *5612464E01AC_48D3D038036A_var*
//#UC END# *5612464E01AC_48D3D038036A_var*
begin
//#UC START# *5612464E01AC_48D3D038036A_impl*
 Result := ev_cmKeepOne;
//#UC END# *5612464E01AC_48D3D038036A_impl*
end;//TevTableImplementation.GetClearMode4Clone

constructor TevTableImplementation.Create(const aView: InevView;
 const aLoc: InevBasePoint;
 const aProcessor: InevProcessor);
//#UC START# *48D3D6CA01F0_48D3D038036A_var*
//#UC END# *48D3D6CA01F0_48D3D038036A_var*
begin
//#UC START# *48D3D6CA01F0_48D3D038036A_impl*
 inherited Create(aLoc.Obj^.AsObject, aProcessor);
 f_Loc := aLoc;
 f_View := aView;
//#UC END# *48D3D6CA01F0_48D3D038036A_impl*
end;//TevTableImplementation.Create

class function TevTableImplementation.Make(const aView: InevView;
 const aLoc: InevBasePoint;
 const aProcessor: InevProcessor): IevTable;
//#UC START# *48D3D6E60111_48D3D038036A_var*
var
 l_Range : TevTableImplementation;
 l_C     : InevBasePoint;
//#UC END# *48D3D6E60111_48D3D038036A_var*
begin
//#UC START# *48D3D6E60111_48D3D038036A_impl*
 l_C := aLoc;
 while (l_C <> nil) do
 begin
  if l_C.Obj.AsObject.IsKindOf(k2_typTable) then
   break
  else
   l_C := l_C.Inner; 
 end;//l_C <> nil
 if (l_C = nil) then
  Result := nil
 else
 begin
  l_Range := Create(aView, aLoc, aProcessor);
  try
   Result := l_Range;
  finally
   l3Free(l_Range);
  end;//try..finally
 end;//l_C = nil
//#UC END# *48D3D6E60111_48D3D038036A_impl*
end;//TevTableImplementation.Make

procedure TevTableImplementation.InsertRows(NumRows: Integer;
 aAtEnd: Boolean);
 {* ��������� NumRows ����� � ������� ����� �������. }
//#UC START# *4770E4A40232_48D3D038036A_var*
var
 l_Row  : InevObject;
 l_Pack : InevOp;        {-����� ��������     }
 l_Point: InevBasePoint;
//#UC END# *4770E4A40232_48D3D038036A_var*
begin
//#UC START# *4770E4A40232_48D3D038036A_impl*
 l_Point := f_Loc;
 if l_Point.Inner = nil then Exit; // http://mdp.garant.ru/pages/viewpage.action?pageId=586687659
 l_Pack := Processor.StartOp(ev_ocInsertRow);
 {-��������� ����� ��������}
 try
  l_Row := l_Point.Inner.Obj.CloneObj;
  try
   evClearPara(View, l_Row, l_Pack, GetClearMode4Clone);                
   while (NumRows > 0) do
   begin
    evInsertPara(l_Pack, l_Point, l_Row.AsObject, AtEndFromBool[aAtEnd]);
    DoCloneSegments(l_Point.Inner.Obj.AsObject, l_Row.AsObject, l_Pack);
    if aAtEnd then
     l_Point.SetEntryPoint(Succ(l_Point.Position), l_Pack)
    else
     l_Point.SetEntryPoint(l_Point.Position, l_Pack);
    Dec(NumRows);
    if (NumRows > 0) then
     l_Row := l_Row.CloneObj;
   end;//NumRows > 0
   with l_Point.Inner do
   begin
    SetEntryPoint(1, l_Pack);
    Inner.Move(View, ev_ocTopLeft, l_Pack);
   end;//with l_Point.Inner
 finally
   l_Row := nil;
  end;//try..finally
 finally
  l_Pack := nil; {-��������� ����� ��������}
 end;//try..finally
//#UC END# *4770E4A40232_48D3D038036A_impl*
end;//TevTableImplementation.InsertRows

procedure TevTableImplementation.InsertColumns(NumColumns: Integer);
 {* ��������� NumColumns �������� � ������� ����� �������. }
//#UC START# *4770E4B9039F_48D3D038036A_var*
var
 l_Pack    : InevOp;        {-����� ��������     }
 CC        : InevBasePoint;
 CID       : Integer;
 RID       : Integer;
 TC        : InevPara;
 TR        : InevParaList;
 T         : InevParaList;
 RowCursor : InevBasePoint;
 NC        : Integer;
//#UC END# *4770E4B9039F_48D3D038036A_var*
begin
//#UC START# *4770E4B9039F_48D3D038036A_impl*
 CC := f_Loc;
 if CC.Inner = nil then Exit; // http://mdp.garant.ru/pages/viewpage.action?pageId=586687659
 l_Pack := Processor.StartOp(ev_ocInsertColumn);
 {-��������� ����� ��������}
 try
  CID := CC.Inner.Position;
  T := CC.Obj.AsPara.AsList;
  for RID := 0 to Pred(T.ParaCount) do
  begin
   TR := T[RID].AsList;
   if (CID <= TR.ParaCount) and (CID > 0) then  // http://mdp.garant.ru/pages/viewpage.action?pageId=586680536
   begin
    TC := TR[Pred(CID)].CloneObj.AsPara;
    try
     evClearPara(View, TC, l_Pack);
     RowCursor := TR.MakePoint;
     try
      RowCursor.SetEntryPoint(CID);
      NC := NumColumns;
      while (NC > 0) do
      begin
       evInsertPara(l_Pack, RowCursor, TC.AsObject, []);
       Dec(NC);
       if (NC > 0) then
        TC := TC.CloneObj.AsPara;
      end;//while NC > 0
     finally
      RowCursor := nil;
     end;//try..finally
    finally
     TC := nil;
    end;//try.finally
   end;//CID <= TR.ParaCount
  end;//for RID <= ..
 finally
  l_Pack := nil; {-��������� ����� ��������}
 end;//try..finally
//#UC END# *4770E4B9039F_48D3D038036A_impl*
end;//TevTableImplementation.InsertColumns

procedure TevTableImplementation.DeleteRow;
 {* ������� ������� ������ �������. }
//#UC START# *4770E4C80145_48D3D038036A_var*
var
 l_Pack     : InevOp;
 l_Point    : InevBasePoint;
 l_Row      : InevPara;
 l_NextRow  : InevPara;
 l_ParaList : Tl3Tag;
//#UC END# *4770E4C80145_48D3D038036A_var*
begin
//#UC START# *4770E4C80145_48D3D038036A_impl*
 l_Pack := Processor.StartOp(ev_ocDeleteRow);
 try
  l_Point := f_Loc.MostInner;
  if f_Loc.Obj.ChildrenCount = 1 then
   f_Loc.Obj.Edit.Delete(True, l_Pack)
  else
  while (l_Point <> nil) do
  begin
   if l_Point.Obj.AsObject.IsKindOf(k2_typTableRow) then
   begin
    if (l_Point.ParentPoint <> nil) then
    begin
     l_Row := l_Point.Obj^.AsPara;
     l_Point := l_Point.ParentPoint;
     repeat
      l_ParaList := l_Point.Obj^.AsObject;
      l_NextRow := l_Row.Next;
      l_Row := l_Row.Prev;
      if (l_NextRow <> nil) and l_NextRow.AsObject.IsValid then
       CheckRow(l_NextRow, l_Pack);
      evDeletePara(l_Pack, l_Point, []);
      if (l_Row <> nil) and l_Row.AsObject.IsValid then
       l_Row.Invalidate([nev_spCellExtent]);
      if (l_ParaList.ChildrenCount > 0) then
      begin
       l_Point.SetEntryPoint(l_Point.Position, l_Pack);
       if l_Point.HasInner then
        l_Point.Inner.Move(View, ev_ocTopLeft, l_Pack);
      end;
      if (l_Point.ParentPoint <> nil) then
       l_Point := l_Point.ParentPoint
      else
       Break;
     until (l_ParaList.ChildrenCount > 0);
    end;{CC.Parent Is _TevParaCursor}
    Break;
   end//l_Point.Obj.IsKindOf(k2_typTableRow)
   else
    l_Point := l_Point.ParentPoint;
  end;//while l_Point <> nil
 finally
  l_Pack := nil;
 end;//try..finally
//#UC END# *4770E4C80145_48D3D038036A_impl*
end;//TevTableImplementation.DeleteRow

procedure TevTableImplementation.DeleteColumn;
 {* ������� ������� �������. }
//#UC START# *4770E4EB0338_48D3D038036A_var*

 function lp_DeleteTable: Boolean;
 var
  i      : Integer;
  l_Count: Integer;
 begin
  Result := True;
  l_Count := f_Loc.Obj.ChildrenCount - 1;
  for i := 0 to l_Count do
   if f_Loc.Obj.Child[i].ChildrenCount > 1 then
   begin
    Result := False;
    Break;
   end; // if f_Loc.Obj.Child[i].ChildrenCount > 1 then
 end;

var
 l_Row    : InevTableRow;
 l_Pack   : InevOp;
 l_Para   : InevPara;
 l_Block  : InevRange;
 l_ColID  : Integer;
 l_Point  : InevBasePoint;
 l_MIPoint: InevBasePoint;
//#UC END# *4770E4EB0338_48D3D038036A_var*
begin
//#UC START# *4770E4EB0338_48D3D038036A_impl*
 l_Pack := Processor.StartOp(ev_ocDeleteColumn);
 try
  l_MIPoint := f_Loc;
  l_Point := f_Loc.MostInner;
  l_ColID := -1;
  while (l_Point <> nil) do
  begin
   if l_Point.Obj.AsObject.IsKindOf(k2_typTableCell) then
    Break
   else
    l_Point := l_Point.ParentPoint;
  end; // while (l_Point <> nil) do
  if l_Point <> nil then
  begin
   if l_Point.Obj.OwnerObj.PID = 0 then
    l_ColID := l_Point.Obj.PID
   else
   begin
    l_Para := l_Point.Obj^.AsPara;
    l_Para := l_Para.OwnerPara.OwnerPara.Para[0];
    l_Row := (l_Para as InevTableRow);
    l_ColID := l_Row.FindCell(l_Point.Obj.OffsetX, l_Point.Obj.AsObject.IntA[k2_tiWidth]);
   end;
   if l_ColID > -1 then
   begin
    if lp_DeleteTable then
     f_Loc.Obj.Edit.Delete(True, l_Pack)
    else
    begin
     l_Block := evGetColumnBlock(View, f_Loc.Obj.AsPara.AsList, l_ColID);
     if l_Block <> nil then
      l_Block.Modify.Delete(View, l_Pack);
    end;
   end; // if l_ColID > -1 then
  end;
 finally
  l_Pack := nil;
 end;//try..finally
//#UC END# *4770E4EB0338_48D3D038036A_impl*
end;//TevTableImplementation.DeleteColumn

procedure TevTableImplementation.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_48D3D038036A_var*
//#UC END# *479731C50290_48D3D038036A_var*
begin
//#UC START# *479731C50290_48D3D038036A_impl*
 f_View := nil;
 f_Loc := nil;
 inherited;
//#UC END# *479731C50290_48D3D038036A_impl*
end;//TevTableImplementation.Cleanup

procedure TevTableImplementation.ClearFields;
begin
 f_View := nil;
 inherited;
end;//TevTableImplementation.ClearFields
{$IfEnd} // Defined(k2ForEditor)

end.
