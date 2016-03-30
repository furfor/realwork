unit evDocumentPartCursorPair;
 {* ��������� ��� ����� }

// ������: "w:\common\components\gui\Garant\Everest\evDocumentPartCursorPair.pas"
// ���������: "SimpleClass"
// ������� ������: "TevDocumentPartCursorPair" MUID: (4A2D2D8002FF)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

{$If Defined(evUseVisibleCursors)}
uses
 l3IntfUses
 , evParaListCursorPair
 , nevTools
 , k2Interfaces
 , nevBase
;

type
 TevDocumentPartCursorPair = class(TevParaListCursorPair)
  {* ��������� ��� ����� }
  protected
   procedure DoStore(const aView: InevView;
    const G: Ik2TagGenerator;
    aFlags: TevStoreFlags); override;
   function IsCollapsed(const aView: InevView): Boolean; override;
 end;//TevDocumentPartCursorPair
{$IfEnd} // Defined(evUseVisibleCursors)

implementation

{$If Defined(evUseVisibleCursors)}
uses
 l3ImplUses
 , LeafPara_Const
 , ContentsElement_Const
 {$If Defined(k2ForEditor)}
 , evParaTools
 {$IfEnd} // Defined(k2ForEditor)
 , k2Tags
 , evdStyles
 , evdInterfaces
 , Block_Const
;

procedure TevDocumentPartCursorPair.DoStore(const aView: InevView;
 const G: Ik2TagGenerator;
 aFlags: TevStoreFlags);
//#UC START# *5108D5CB0048_4A2D2D8002FF_var*
 {$IfDef Nemesis}
 var
  l_NeedSaveStyle: Boolean;
  
 function AfterComment: Boolean;
 var
  l_List  : InevParaList;
  l_PID   : Integer;
  l_Para  : InevPara;
  l_Index : Integer;
 begin
  Result := false;
  if not f_Start.HasInner OR f_Start.Inner.AtStart then
  begin
   Result := true;
   l_List := ParaX;
   l_PID := f_Start.Position - 2;
   for l_Index := l_PID downto 0 do
   begin
    l_Para := l_List.Para[l_Index];
    if l_Para.AsObject.IsKindOf(k2_typLeafPara) then
    begin
     if EvHasText(l_Para.AsObject) then
      if not (-l_Para.AsObject.IntA[k2_tiStyle] in [-ev_saTxtComment, -ev_saVersionInfo, -ev_saTechComment]) then
      begin
       Result := false;
       break;
      end;//-l_Para.IntA[k2_tiStyle] in
    end//l_Para.IsKindOf(k2_typLeafPara)
    else
    begin
     Result := false;
     break;
    end;//l_Para.IsKindOf(k2_typLeafPara)
   end;//for l_Index
  end;//not f_Start.HasInner
 end;
 {$EndIf Nemesis}
var
 l_Inner: InevBasePoint;
//#UC END# *5108D5CB0048_4A2D2D8002FF_var*
begin
//#UC START# *5108D5CB0048_4A2D2D8002FF_impl*
 if Solid(aView) then
  inherited DoStore(aView, G, aFlags - [evd_sfStoreParaEnd])
 else
 begin
  {$IfDef Nemesis}
  l_NeedSaveStyle := evHasOwnStyle(ParaX);
  if l_NeedSaveStyle and EvExpandedText(ParaX.AsObject) then  // http://mdp.garant.ru/pages/viewpage.action?pageId=606436730
  // ���� �� �� ������������ ���������, �� ����� �������, ��� ������������ ������� ����� � ������� �����.
   if (f_Start <> nil) and f_Start.HasInner then
   begin
    l_Inner := f_Start.Inner;
    if (l_Inner.AsLeaf <> nil) and (l_Inner.Obj.AsPara.PID > 0) then
     l_NeedSaveStyle := False;
   end; // if (f_Start <> nil) and (f_Start.Inner <> nil) then
  if l_NeedSaveStyle then
   G.StartChild(k2_typBlock)
  else
   G.StartChild(k2_typContentsElement);
  with ParaX do
  begin
   if HasSubAtom(k2_tiInContents) then
    G.AddBoolAtom(k2_tiInContents, BoolA[k2_tiInContents]);
   if HasSubAtom(k2_tiHandle) then
    G.AddIntegerAtom(k2_tiHandle, IntA[k2_tiHandle]);
   if (f_Start <> nil) AND not f_Start.AtStart AND not AfterComment then
   begin
    if HasSubAtom(k2_tiName) then
     G.AddStringAtom(k2_tiName, PCharLenA[k2_tiName]);
    if HasSubAtom(k2_tiShortName) then
     G.AddStringAtom(k2_tiShortName, PCharLenA[k2_tiShortName]);
   end;//(f_Start <> nil) AND not f_Start.AtStart
   if l_NeedSaveStyle then
    G.AddIntegerAtom(k2_tiStyle, IntA[k2_tiStyle]);
  end;//with ParaX
  {$EndIf Nemesis}
  inherited DoStore(aView, G, aFlags + [evd_sfChildrenOnly]);
  {$IfDef Nemesis}
  G.Finish;
  {$EndIf Nemesis}
 end;//Solid(aView)
//#UC END# *5108D5CB0048_4A2D2D8002FF_impl*
end;//TevDocumentPartCursorPair.DoStore

function TevDocumentPartCursorPair.IsCollapsed(const aView: InevView): Boolean;
//#UC START# *52D79FB703C9_4A2D2D8002FF_var*
//#UC END# *52D79FB703C9_4A2D2D8002FF_var*
begin
//#UC START# *52D79FB703C9_4A2D2D8002FF_impl*
 Result := inherited IsCollapsed(aView);
 if not Result then
  if GetRedirect.BoolA[k2_tiCollapsed] then
   with Borders do
    if (rStart = rFinish) then
     Result := true;
//#UC END# *52D79FB703C9_4A2D2D8002FF_impl*
end;//TevDocumentPartCursorPair.IsCollapsed
{$IfEnd} // Defined(evUseVisibleCursors)

end.
