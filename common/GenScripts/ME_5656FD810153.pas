unit evSCCollectFilter;

// ������: "w:\common\components\gui\Garant\Everest\evSCCollectFilter.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
 l3IntfUses
 , evdBufferedFilter
 , evSCSubList
 , evSubCompareInterfaces
 , l3Variant
 , k2TagGen
;

type
 TevSCCollectFilter = class(TevdBufferedFilter)
  private
   f_SubStack: TevSCSubList;
   f_Labels: TevSCSubList;
   f_SubList: TevSCSubList;
    {* ���� ��� �������� SubList }
  private
   procedure AddToSub(const aSub: IevSCSub;
    aAttrType: TevSCAttrType;
    aTag: Tl3Variant);
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure StartChild(TypeID: Tl3Type); override;
   procedure CloseStructure(NeedUndo: Boolean); override;
    {* ���������� �� ������������� "������". ��� ���������� � ��������. }
   procedure AddAtomEx(AtomIndex: Integer;
    const Value: Ik2Variant); override;
   function NeedStartBuffering(aID: Integer): Boolean; override;
   procedure DoFlushBuffer(aLeaf: Tl3Variant;
    aTagId: Integer;
    aNeedCloseBracket: Boolean); override;
  public
   constructor Create(anOwner: Tk2TagGeneratorOwner = nil); override;
  public
   property SubList: TevSCSubList
    read f_SubList;
 end;//TevSCCollectFilter

implementation

uses
 l3ImplUses
 , SysUtils
 , Block_Const
 , k2Tags
 , evSCSub
 , evSCSubAttr
 , evdTypes
 , Address_Const
 , Document_Const
;

procedure TevSCCollectFilter.AddToSub(const aSub: IevSCSub;
 aAttrType: TevSCAttrType;
 aTag: Tl3Variant);
//#UC START# *566548D70278_5656FD810153_var*
var
 I : Integer;
 l_Attr: IevSCAttrElement;
//#UC END# *566548D70278_5656FD810153_var*
begin
//#UC START# *566548D70278_5656FD810153_impl*
 for I := 0 to aTag.ChildrenCount - 1 do
 begin
  l_Attr := TevSCSubAttr.Make(aAttrType, aTag.Child[I].Attr[k2_tiHandle].AsLong);
  aSub.Add(l_Attr);
 end;
//#UC END# *566548D70278_5656FD810153_impl*
end;//TevSCCollectFilter.AddToSub

procedure TevSCCollectFilter.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_5656FD810153_var*
//#UC END# *479731C50290_5656FD810153_var*
begin
//#UC START# *479731C50290_5656FD810153_impl*
 FreeAndNil(f_SubList);
 FreeAndNil(f_SubStack);
 FreeAndNil(f_Labels);
 inherited;
//#UC END# *479731C50290_5656FD810153_impl*
end;//TevSCCollectFilter.Cleanup

procedure TevSCCollectFilter.StartChild(TypeID: Tl3Type);
//#UC START# *4836D4650177_5656FD810153_var*
var
 l_Sub: IevSCSub;
 I : Integer;
//#UC END# *4836D4650177_5656FD810153_var*
begin
//#UC START# *4836D4650177_5656FD810153_impl*
 if TypeID.IsSame(k2_typDocument) then
 begin
  f_SubList.Clear;
  f_SubStack.Clear;
  f_Labels.Clear;
 end;

 if TypeID.IsSame(k2_typBlock) then
 begin
  for I := 0 to f_Labels.Count - 1 do
   f_SubList.Add(f_Labels.Items[I]);
  f_Labels.Clear;
  l_Sub := TevSCSub.Make(sct_Block);
  f_SubStack.Add(l_Sub);
 end;
 inherited;
//#UC END# *4836D4650177_5656FD810153_impl*
end;//TevSCCollectFilter.StartChild

procedure TevSCCollectFilter.CloseStructure(NeedUndo: Boolean);
 {* ���������� �� ������������� "������". ��� ���������� � ��������. }
//#UC START# *4836D4C20059_5656FD810153_var*
var
 I: Integer;
 l_Sub: IevSCSub;
//#UC END# *4836D4C20059_5656FD810153_var*
begin
//#UC START# *4836D4C20059_5656FD810153_impl*
 if CurrentType.IsSame(k2_typBlock) then
 begin
  Assert(f_SubStack.Count > 0);
  l_Sub := f_SubStack.Last;
  Assert(l_Sub.Handle > 0);
  f_SubList.Add(l_Sub);
  f_SubStack.DeleteLast;
  for I := 0 to f_Labels.Count - 1 do
   f_SubList.Add(f_Labels.Items[I]);
  f_Labels.Clear;
 end;
 inherited;
//#UC END# *4836D4C20059_5656FD810153_impl*
end;//TevSCCollectFilter.CloseStructure

procedure TevSCCollectFilter.AddAtomEx(AtomIndex: Integer;
 const Value: Ik2Variant);
//#UC START# *4836D52400D9_5656FD810153_var*
//#UC END# *4836D52400D9_5656FD810153_var*
begin
//#UC START# *4836D52400D9_5656FD810153_impl*
 if CurrentType.IsSame(k2_typBlock) and (AtomIndex = k2_tiHandle) then
  f_SubStack.Last.Handle := Value.AsInteger;
 inherited;
//#UC END# *4836D52400D9_5656FD810153_impl*
end;//TevSCCollectFilter.AddAtomEx

function TevSCCollectFilter.NeedStartBuffering(aID: Integer): Boolean;
//#UC START# *4C56D54B002A_5656FD810153_var*
//#UC END# *4C56D54B002A_5656FD810153_var*
begin
//#UC START# *4C56D54B002A_5656FD810153_impl*
 Result :=  (aID = k2_tiSubs) or (aID = k2_tiTypes) or (aID = k2_tiClasses) or
            (aID = k2_tiKeywords) or (aID = -k2_idAddress);
//#UC END# *4C56D54B002A_5656FD810153_impl*
end;//TevSCCollectFilter.NeedStartBuffering

procedure TevSCCollectFilter.DoFlushBuffer(aLeaf: Tl3Variant;
 aTagId: Integer;
 aNeedCloseBracket: Boolean);
//#UC START# *4D53D8BF00D5_5656FD810153_var*
var
 I,J   : Integer;
 l_Tag, l_Layer: Tl3Variant;
 l_Sub: IevSCSub;
 l_Attr: IevSCAttrElement;
 l_DocID, l_SubID : Integer;
//#UC END# *4D53D8BF00D5_5656FD810153_var*
begin
//#UC START# *4D53D8BF00D5_5656FD810153_impl*
 if aTagId = k2_tiSubs then
 begin
  for I := 0 to aLeaf.ChildrenCount-1 do
  begin
   if aLeaf.Child[I].Attr[k2_tiHandle].AsLong = Ord(ev_sbtSub) then
   begin
    l_Layer := aLeaf.Child[I];
    for J := 0 to l_Layer.ChildrenCount-1 do
    begin
     l_Tag := l_Layer.Child[J];
     l_Sub := TevSCSub.Make(sct_Label);
     try
      l_Sub.Handle := l_Tag.Attr[k2_tiHandle].AsLong;
      if l_Sub.Handle > 0 then
      begin
       if l_Tag.Attr[k2_tiTypes].IsValid then
        AddToSub(l_Sub, sca_Type, l_Tag.Attr[k2_tiTypes]);
       if l_Tag.Attr[k2_tiClasses].IsValid then
        AddToSub(l_Sub, sca_Class, l_Tag.Attr[k2_tiClasses]);
       if l_Tag.Attr[k2_tiKeywords].IsValid then
        AddToSub(l_Sub, sca_Keyword, l_Tag.Attr[k2_tiKeywords]);
       f_Labels.Add(l_Sub);
      end;
     finally
      l_Sub := nil;
     end;
    end;
   end;
  end;
 end;

 if not f_SubStack.Empty then
 begin
  if (aTagId = k2_tiTypes) then
   AddToSub(f_SubStack.Last, sca_Type, aLeaf);

  if (aTagId = k2_tiClasses) then
   AddToSub(f_SubStack.Last, sca_Class, aLeaf);

  if (aTagId = k2_tiKeywords) then
   AddToSub(f_SubStack.Last, sca_Keyword, aLeaf);

  if (aTagId = -k2_idAddress) then
  begin
   l_DocID := aLeaf.Attr[k2_tiDocID].AsLong;
   if aLeaf.Attr[k2_tiSubID].IsValid then
    l_SubID := aLeaf.Attr[k2_tiSubID].AsLong
   else
    l_SubID := 0;
   l_Attr := TevSCSubAttr.Make(sca_Link, l_DocID, l_SubID);
   f_SubStack.Last.Add(l_Attr);
  end;
 end;

 inherited;
//#UC END# *4D53D8BF00D5_5656FD810153_impl*
end;//TevSCCollectFilter.DoFlushBuffer

constructor TevSCCollectFilter.Create(anOwner: Tk2TagGeneratorOwner = nil);
//#UC START# *538C1F9A00C7_5656FD810153_var*
//#UC END# *538C1F9A00C7_5656FD810153_var*
begin
//#UC START# *538C1F9A00C7_5656FD810153_impl*
 inherited;
 f_SubList := TevSCSubList.Make;
 f_SubStack := TevSCSubList.Make;
 f_Labels := TevSCSubList.Make;
//#UC END# *538C1F9A00C7_5656FD810153_impl*
end;//TevSCCollectFilter.Create

end.
