unit nscCustomChatMemoDocumentPartGenerator;

// ������: "w:\common\components\gui\Garant\Nemesis\nscCustomChatMemoDocumentPartGenerator.pas"
// ���������: "SimpleClass"
// ������� ������: "TnscCustomChatMemoDocumentPartGenerator" MUID: (4A8BB357000F)

{$Include w:\common\components\gui\Garant\Nemesis\nscDefine.inc}

interface

{$If Defined(Nemesis)}
uses
 l3IntfUses
 , evDocumentPartGenerator
 , l3Variant
 , k2DocumentGenerator
;

type
 TnscCustomChatMemoDocumentPartGenerator = class(TevDocumentPartGenerator)
  private
   f_WasHandle: Boolean;
   f_WasInheritedParaAdd: Boolean;
    {* ���� �������������� ���������� ��������� }
   f_Doc: Tl3Variant;
   f_ExternalHandle: Integer;
   f_NumberedPara: Tl3Variant;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure DoAddAtom(const Atom: Tk2StackAtom;
    Prop: Integer;
    aSource: Tl3Variant); override;
   function AddChild(var aChild: Tk2StackAtom): Integer; override;
   procedure FinishInsertion; override;
 end;//TnscCustomChatMemoDocumentPartGenerator
{$IfEnd} // Defined(Nemesis)

implementation

{$If Defined(Nemesis)}
uses
 l3ImplUses
 , l3StringIDEx
 , k2Tags
 , Document_Const
 , Para_Const
 {$If Defined(k2ForEditor)}
 , evCursorTools
 {$IfEnd} // Defined(k2ForEditor)
 , evOp
 {$If Defined(k2ForEditor)}
 , evParaTools
 {$IfEnd} // Defined(k2ForEditor)
 , TextPara_Const
 , l3Defaults
 , k2Base
 , HyperLink_Const
 , evdTypes
 , LeafPara_Const
 , l3Types
 , SysUtils
 , nevBase
;

const
 {* ������������ ������ Local }
 str_ChatPastePrefix: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'ChatPastePrefix'; rValue : '�� ��������� ������:');
  {* '�� ��������� ������:' }

procedure TnscCustomChatMemoDocumentPartGenerator.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_4A8BB357000F_var*
//#UC END# *479731C50290_4A8BB357000F_var*
begin
//#UC START# *479731C50290_4A8BB357000F_impl*
 FreeAndNil(f_Doc);
 FreeAndNil(f_NumberedPara);
 inherited;
//#UC END# *479731C50290_4A8BB357000F_impl*
end;//TnscCustomChatMemoDocumentPartGenerator.Cleanup

procedure TnscCustomChatMemoDocumentPartGenerator.DoAddAtom(const Atom: Tk2StackAtom;
 Prop: Integer;
 aSource: Tl3Variant);
//#UC START# *4836B3DB01C9_4A8BB357000F_var*
//#UC END# *4836B3DB01C9_4A8BB357000F_var*
begin
//#UC START# *4836B3DB01C9_4A8BB357000F_impl*
 if not (ev_lfInternal in Flags) then
  if not f_WasHandle then
  begin
   if (Prop = k2_tiExternalHandle) then
    if Atom.IsKindOf(k2_typDocument) then
    begin
     Atom.Box.SetRef(f_Doc);
     f_WasHandle := true;
     f_ExternalHandle := aSource.AsLong;
(*     Case TK of
      k2_tkInteger:
       f_ExternalHandle := Integer(Source);
      else
       Assert(false);
     end;//Case TK*)
    end;//Atom.IsKindOf(k2_typDocument)
  end;//not f_WasHandle
  if (Prop = k2_tiHandle) then
   if (f_NumberedPara = nil) then
    if Atom.IsKindOf(k2_typLeafPara) then
     Atom.Box.SetRef(f_NumberedPara);
 inherited;
//#UC END# *4836B3DB01C9_4A8BB357000F_impl*
end;//TnscCustomChatMemoDocumentPartGenerator.DoAddAtom

function TnscCustomChatMemoDocumentPartGenerator.AddChild(var aChild: Tk2StackAtom): Integer;
//#UC START# *4836B3FC032A_4A8BB357000F_var*
//#UC END# *4836B3FC032A_4A8BB357000F_var*
begin
//#UC START# *4836B3FC032A_4A8BB357000F_impl*
 Result := -1;
 if not (ev_lfInternal in Flags) then
 begin
  if f_WasHandle then
  begin
   if aChild.IsKindOf(k2_typDocument) AND
      ((aChild.Parent = nil) OR not aChild.Parent.IsKindOf(k2_typPara)) then
    // - ������� ����� ��������������� ��������
   begin
(*    f_WasHandle := false;
    f_WasInheritedParaAdd := false;*)
    Result := inherited AddChild(aChild);
    Exit;
   end;//aChild.IsKindOf(k2_typDocument)
  end;//f_WasHandle
  if aChild.IsKindOf(k2_typHyperlink) then
  begin
   if (aChild.Box.ChildrenCount <= 0) then
    // - ������� ������ ��� �������
    Exit;
   if (aChild.Box.Child[0].IntA[k2_tiType] = CI_ExternalOperation) then
    // - ������� ������, ������� �� ����� �� ����� ����������
    Exit;
  end;//aChild.IsKindOf(k2_typHyperlink)
  if f_WasHandle then
  begin
   Assert(not f_WasInheritedParaAdd);
   aChild.Parent.Box.AddChild(aChild.Box, Context);
   Exit;
  end;//f_WasHandle
 end;//not (ev_lfInternal in Flags)
 Result := inherited AddChild(aChild);
 if not f_WasInheritedParaAdd then
  if aChild.IsKindOf(k2_typPara) then
   f_WasInheritedParaAdd := true;
//#UC END# *4836B3FC032A_4A8BB357000F_impl*
end;//TnscCustomChatMemoDocumentPartGenerator.AddChild

procedure TnscCustomChatMemoDocumentPartGenerator.FinishInsertion;
//#UC START# *48E4B7F403D6_4A8BB357000F_var*
var
 l_Para : Tl3Variant;
 l_Link : Tl3Variant;
 l_Addr : Tl3Variant;
 l_HeaderParaType : Tk2Type;
//#UC END# *48E4B7F403D6_4A8BB357000F_var*
begin
//#UC START# *48E4B7F403D6_4A8BB357000F_impl*
 if f_WasHandle AND (f_Doc <> nil) then
 begin
  EnableUndo;
  try
   f_Doc.IntA[k2_tiBackColor] := $C0F0C0;
   f_Doc.IntA[k2_tiLeftIndent] := 0;
   with f_Doc.cAtom(k2_tiFrame) do
   begin
    with cAtom(k2_tiFrameDown) do
    begin
     IntA[k2_tiSpaceBefore] := def_FrameWidth * 3;
     IntA[k2_tiWidth] := def_FrameWidth * 2;
     IntA[k2_tiSpaceAfter] := def_FrameWidth * 3;
    end;//cAtom(k2_tiFrameDown)
   end;//with f_Doc.cAtom(k2_tiFrame)
   with InsCursor.MostInner do
    if Obj.AsObject.IsKindOf(k2_typTextPara) AND not evHasText(Obj^.AsObject) then
     evDeletePara(Context, ParentPoint, []);
   if (f_ExternalHandle > 0) then
   begin
    // http://mdp.garant.ru/pages/viewpage.action?pageId=429695918
    l_HeaderParaType := Tk2Type(f_Doc.TagType).ArrayProp[k2_tiChildren].DefaultChildType;
    if not l_HeaderParaType.IsKindOf(k2_typTextPara) then
     l_HeaderParaType := k2_typTextPara;
    l_Para := l_HeaderParaType.MakeTag.AsObject;
    try
     l_Para.IntA[k2_tiFirstIndent] := 0;
     l_Para.IntA[k2_tiLeftIndent] := 0;
     l_Para.PCharLenA[k2_tiText] := Tl3PCharLen(str_ChatPastePrefix.AsCStr.AsWStr);
     with l_Para.cAtom(k2_tiFrame) do
     begin
      with cAtom(k2_tiFrameDown) do
      begin
       IntA[k2_tiSpaceBefore] := def_FrameWidth * 4;
       IntA[k2_tiWidth] := def_FrameWidth * 2;
       IntA[k2_tiSpaceAfter] := def_FrameWidth * 3;
      end;//cAtom(k2_tiFrameDown)
      l_Link := k2_typHyperlink.MakeTag.AsObject;
      try
       l_Addr := Tk2Type(l_Link.TagType).ArrayProp[k2_tiChildren].DefaultChildType.MakeTag.AsObject;
       try
        l_Addr.IntA[k2_tiDocID] := f_ExternalHandle;
        if (f_NumberedPara <> nil) then
         l_Addr.IntA[k2_tiSubID] := Integer(Longword(f_NumberedPara.IntA[k2_tiHandle]) or POSITION_TYPE_PARA_ID);
        l_Link.AddChild(l_Addr.AsObject);
       finally
        l_Addr := nil;
       end;//try..finally
       l_Para.AddChild(l_Link.AsObject);
      finally
       l_Link := nil;
      end;//try..finally
      f_Doc.InsertChildTag(0, l_Para.AsObject);
     end;//l_Para
    finally
     l_Para := nil;
    end;//try..finally
   end;//f_ExternalHandle > 0
   evInsertPara(Context, InsCursor, f_Doc{, true});
   InsCursor.Move(View, ev_ocParaDown, Context);
   f_InsPara := InsCursor.Position;
   pm_SetNeedJoin(false);
  finally
   DisableUndo;
  end;//try..finally
  f_WasInheritedParaAdd := false;
  f_WasHandle := false;
 end;//f_WasHandle
 FreeAndNil(f_Doc);
 FreeAndNil(f_NumberedPara);
 inherited;
//#UC END# *48E4B7F403D6_4A8BB357000F_impl*
end;//TnscCustomChatMemoDocumentPartGenerator.FinishInsertion

initialization
 str_ChatPastePrefix.Init;
 {* ������������� str_ChatPastePrefix }
{$IfEnd} // Defined(Nemesis)

end.
