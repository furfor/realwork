unit evTextParaTools;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Everest"
// ������: "w:/common/components/gui/Garant/Everest/evTextParaTools.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> Shared Delphi::Everest::ParaUtils::evTextParaTools
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Everest\evDefine.inc}

interface

{$If defined(k2ForEditor)}
uses
  l3Types,
  nevBase,
  l3InternalInterfaces,
  evdTypes,
  l3Base,
  nevTools,
  k2InterfacesEx,
  l3LineArray,
  l3Variant
  ;

function EvDir_InsertText(const aPara: InevTextPara;
  aSt: Tl3CustomString;
  aPos: Integer;
  UpdateSegments: Boolean;
  IncludeStart: Boolean = False;
  const Context: InevOp = nil): Boolean;
function EvDir_DeleteText(const aPara: InevTextPara;
  aPos: Integer;
  Count: Integer;
  Deleted: PAnsiChar = nil;
  const anOpPack: InevOp = nil): Boolean;
procedure EvTextParaAddSegment(const aPara: InevTextPara;
  aLayerHandle: TevSegmentHandle;
  Segment: Tl3Tag;
  const Container: InevOp = nil);
   {* ��������� ������� ���������. }
procedure EvTextParaIterateLines(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  Action: Tl3IteratorAction;
  I1: Tl3Index = l3MinIndex;
  I2: Tl3Index = l3MaxIndex);
function EvTextParaGetLine(const aMap: InevLines;
  const aText: Tl3PCharLen;
  var aIndex: Integer): Tl3PCharLen;
function EvTextParaGetLineByPos(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  aPos: Integer): Integer;
   {* ���������� ����� ������ �� �������� �� ������ ���������. }
function EvTextParaGetDeltaByPos(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  aPos: Integer;
  L: Integer): Integer;
   {* ���������� ������� � ������ �� �������� aPos �������� � ������ ������ L. }
function EvTextParaGetDeltaByLinePrim(aMap: TnevFormatInfoPrim;
  const aPara: InevTextPara;
  aLine: Integer): Integer;
function EvTextParaGetDeltaByLine(aMap: TnevFormatInfoPrim;
  const aPara: InevTextPara;
  aLine: Integer): Integer;
function EvTextParaGetPosByDelta(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  DX: Integer;
  L: Integer): Integer; overload; 
   {* ���������� ������� �� �������� D� � ������ ������ L. }
function EvTextParaGetPosByLine(const aMap: InevLines;
  const aText: Tl3PCharLen;
  var L: Integer): Integer;
   {* �������� ������ L c ������ ���������. }
procedure EvTextParaGetLineSegment(const aMap: InevLines;
  const aText: Tl3PCharLen;
  Li: Integer;
  Si: Integer;
  const L: Ik2TagList;
  S1: Tl3CustomString;
  S2: Tl3CustomString;
  S3: Tl3CustomString);
function EvTextParaGetLineSegments(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  Li: Integer): Ik2TagList;
   {* ���������� ������ ���������� � ��������� �������� ������ L
SS = -1 ���� �������� � ������ ���. }
procedure EvTextParaSetFontParam(const aPara: InevTextPara;
  anAtom: Integer;
  aValue: Tl3Variant;
  const Container: InevOp = nil);
function EvTextParaLineCount(aMap: TnevFormatInfoPrim): Integer;
function EvTextParaViewBounds(const aMap: InevMap;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  aPosInLine: Integer;
  aLine: Integer): TnevRect;
function EvTextParaGetPosByDelta(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  const IC: Il3InfoCanvas;
  DX: Integer;
  const PL: Tl3PCharLen;
  InLI: PevLineInfo;
  L: Integer): Integer; overload; 
function EvTextParaGetPosByDelta(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  DX: Integer;
  const PL: Tl3PCharLen;
  InLI: PevLineInfo;
  L: Integer): Integer; overload; 
function EvGetFirstParaHyperlink(const aPara: InevPara;
  aMap: TnevFormatInfoPrim): Tl3Variant;
{$IfEnd} //k2ForEditor

implementation

{$If defined(k2ForEditor)}
uses
  k2Tags,
  l3Utils,
  ObjectSegment_Const,
  k2Base,
  evSegLst,
  evParaTools,
  evSegOp,
  l3String,
  l3Chars,
  l3SingleLineInfo,
  evTypes,
  l3Interfaces,
  nevSegmentObject,
  TableCell_Const,
  evAlignBySeparatorUtils,
  nevStringCache,
  l3MinMax,
  k2InterfacedTagList,
  l3Units,
  nevFacade,
  evChangeCodePage
  ;

// unit methods

function GetD2S(var WC: Integer;
  var DW: Integer): Integer;
//#UC START# *529EFA5601C3_48D3AF8E024B_var*
//#UC END# *529EFA5601C3_48D3AF8E024B_var*
begin
//#UC START# *529EFA5601C3_48D3AF8E024B_impl*
 if (WC > 0) then
 begin
  if (WC = 1) then
   Result := DW
  else
   Result := DW div WC;
  Dec(WC);
  Dec(DW, Result);
 end//WC > 0
 else
  Result := 0;
//#UC END# *529EFA5601C3_48D3AF8E024B_impl*
end;//GetD2S

function EvTextParaGetLineWordCount(const aMap: InevLines;
  aIndex: Integer): Integer;
//#UC START# *529F07BE0069_48D3AF8E024B_var*
var
 l_O: TObject;
//#UC END# *529F07BE0069_48D3AF8E024B_var*
begin
//#UC START# *529F07BE0069_48D3AF8E024B_impl*
 if (aMap <> nil) then
 begin
  l_O := aMap.AsObject;
  if (l_O is TevLineArray) then
   Result := TevLineArray(l_O).LineWordCount[aIndex]
  else
   Result := 0;
 end//l_Map.IsValid
 else
  Result := 0;
//#UC END# *529F07BE0069_48D3AF8E024B_impl*
end;//EvTextParaGetLineWordCount

procedure EvTextParaSetFontParamPrim(const aPara: InevTextPara;
  P: Integer;
  aValue: Tl3Variant;
  const aContext: InevOp);
//#UC START# *529F149200A7_48D3AF8E024B_var*
var
 l_Segments: Tl3Variant;
 l_Layer: Tl3Variant;
 l_Index: Long;
 l_Prop: Tk2CustomPropertyPrim;
//#UC END# *529F149200A7_48D3AF8E024B_var*
begin
//#UC START# *529F149200A7_48D3AF8E024B_impl*
 with aPara do
 begin
  l_Prop := Tk2Type(AsObject.TagType).Prop[P];
  if (l_Prop <> nil) AND not l_Prop.ReadOnly then
  begin
   AsObject.AttrW[l_Prop.TagIndex, aContext] := aValue.AsObject;
   {$IFNDEF Nemesis}
   if (aContext <> nil) then
    aContext.MarkModified(aPara.AsObject);
   {$ENDIF Nemesis} 
   if (P = k2_tiStyle) OR
      ((P = k2_tiJustification) AND (aValue.AsLong = Ord(ev_itPreformatted))) then
   begin
    l_Segments := AsObject.Attr[k2_tiSegments];
    if l_Segments.IsValid then
    begin
     l_Layer := l_Segments.rAtomEx([k2_tiChildren, k2_tiHandle, Ord(ev_slView)], @l_Index);
     if l_Layer.IsValid then
     begin
      l_Segments.DeleteChild(l_Index, aContext);
      evSegments_ClearSuper(aPara, aContext);
      if (l_Segments.ChildrenCount <= 0) then
       aPara.AsObject.AttrW[k2_tiSegments, aContext] := nil;
      Exit;
      // - ����� �� ������� � Invalidate 
     end;//l_Layer.IsValid
    end;//l_Segments.IsValid
   end;//P = k2_tiStyle
   Invalidate([nev_spExtent]);
  end//l_Prop <> nil..
  else
  begin
   AsObject.cAtom(k2_tiFont, aContext).AttrW[P, aContext] := aValue.AsObject;
   if (aContext <> nil) then
    aContext.MarkModified(aPara.AsObject);
  end;//l_Prop <> nil..
 end;//with aPara
//#UC END# *529F149200A7_48D3AF8E024B_impl*
end;//EvTextParaSetFontParamPrim

function EvDir_InsertText(const aPara: InevTextPara;
  aSt: Tl3CustomString;
  aPos: Integer;
  UpdateSegments: Boolean;
  IncludeStart: Boolean = False;
  const Context: InevOp = nil): Boolean;
//#UC START# *5299C1960391_48D3AF8E024B_var*
 procedure UpdateInsertion(aPos, Len: Long);
   {-}

  var
   l_ClearSuper: Boolean;  

  function UpdateLayer(Layer: Tl3Variant; Index: Long): Boolean;

   function UpdateSegment(S: Tl3Variant; Index: Long): Boolean;
   var
    l_oS: Integer;
    l_nS: Integer;
    l_oF: Integer;
    l_nF: Integer;
   begin
    //if S.HasSubAtom(k2_tiStart) or S.IsKindOf(k2_typObjectSegment) then
    begin
     l_oS := S.IntA[k2_tiStart];
     l_nS := Succ(l3UpdateInsertion(Pred(l_oS), aPos, Len, IncludeStart));
     if (l_oS <> l_nS) then
     begin
      S.IntW[k2_tiStart, nil] := l_nS;
      l_ClearSuper := True;
     end;//l_oS <> l_nS
    end;//S.HasSubAtom(k2_tiStart)..
    if S.HasSubAtom(k2_tiFinish) then
    begin
     l_oF := S.IntA[k2_tiFinish];
     if (l_oF <> aPos) or not S.IsKindOf(k2_typObjectSegment) then
     begin
      l_nF := l3UpdateInsertion(l_oF, aPos, Len, False);
      if (l_oF <> l_nF) then
      begin
       S.IntW[k2_tiFinish, nil] := l_nF;
       l_ClearSuper := True;
      end;//l_oF <> l_nF
     end;//l_F <> aPos.. 
    end;//S.HasSubAtom(k2_tiFinish)
    Result := True;
   end;

  begin//UpdateSegment
   Layer.IterateChildrenF(L2Mk2ChildrenIterateChildrenFAction(@UpdateSegment));
   Result := True;
  end;//UpdateSegment

 begin//UpdateInsertion
  with aPara.AsObject.Attr[k2_tiSegments] do
   if IsValid then
   begin
    l_ClearSuper := False;
    IterateChildrenF(L2Mk2ChildrenIterateChildrenFAction(@UpdateLayer));
    if l_ClearSuper then
     evSegments_ClearSuper(aPara, Context);
   end;//IsValid
 end;//UpdateInsertion

var
 l_S: Tl3CustomString;
 l_WasEmpty: Boolean;
//#UC END# *5299C1960391_48D3AF8E024B_var*
begin
//#UC START# *5299C1960391_48D3AF8E024B_impl*
 Result := not aSt.Empty;
 if Result then
 begin
  l_S := (aPara.AsObject.cAtom(k2_tiText) as Tl3CustomString);
  l_WasEmpty := l_S.Empty;
  l_S.Insert(aSt, aPos);
  if UpdateSegments then
   UpdateInsertion(aPos, aSt.Len);
  if l_WasEmpty and
     (EvPrevOverallPara(aPara).IsLegalComment or
      EvNextOverallPara(aPara).IsLegalComment) then
  begin
   aPara.OwnerPara.Invalidate([nev_spExtent]);
   if not UpdateSegments then
    aPara.Invalidate([nev_spExtent]);
  end
  else
   aPara.Invalidate([nev_spExtent]);
 end;//Result
//#UC END# *5299C1960391_48D3AF8E024B_impl*
end;//EvDir_InsertText

function EvDir_DeleteText(const aPara: InevTextPara;
  aPos: Integer;
  Count: Integer;
  Deleted: PAnsiChar = nil;
  const anOpPack: InevOp = nil): Boolean;
//#UC START# *5299C235026F_48D3AF8E024B_var*
 procedure UpdateDeletion(aPos, Len: Long);

(* var
  l_ClearSuper: Boolean;*)
  var
   l_LayerCount: Integer;
 
  function UpdateLayer(aLayer: Tl3Variant; Index: Long): Boolean; 
  var
   i: Long;
   l_Seg: Tl3Variant;
   oStart: Long;
   oFinish: Long;
   nStart: Long;
   nFinish: Long;
  begin//UpdateLayer
   Inc(l_LayerCount);
   with aLayer do
   begin
    i := 0;
    while (i < ChildrenCount) do
    begin
     l_Seg := Child[i];
     if l_Seg.IsValid then
     begin
      with l_Seg do
      begin
       oStart := Pred(IntA[k2_tiStart]);
       oFinish := Pred(IntA[k2_tiFinish]);
      end;//with l_Seg
      nStart  := l3UpdateDeletion(oStart, aPos, Len, True);
      nFinish := l3UpdateDeletion(oFinish, aPos, Len, False);
      if (nStart > nFinish) then
      begin
       aLayer.DeleteChild(i, anOpPack);
       //l_ClearSuper := True;
      end
      else
      begin
       with l_Seg do
       begin
        if (anOpPack <> nil) and
           (aPos <= oStart) and (aPos + Len > oStart) and
           (nFinish <> oFinish) then
        begin
         {$IfDef k2ForEditor}
         OevSaveSegmentStart.ToUndo(anOpPack, l_Seg, Tk2Type(l_Seg.TagType).Prop[k2_tiStart].MakeTag(Succ(oStart)).AsObject);
         {$EndIf k2ForEditor}
         if (nStart <> oStart) then
          IntW[k2_tiStart, nil] := Succ(nStart);
         IntW[k2_tiFinish, nil] := Succ(nFinish);
        end
        else
        begin
         if (nStart <> oStart) then
          IntW[k2_tiStart, nil] := Succ(nStart);
         if (nFinish <> oFinish) then
          IntW[k2_tiFinish, nil] := Succ(nFinish);
        end;
       end;{with l_Seg}
       Inc(i);
      end;{nStart > nFinish}
     end//l_Seg.IsValid
     else
      aLayer.DeleteChild(i);
    end;//while (i < Count)..
   end;//with aLayer
   Result := True;
  end;//UpdateLayer

 var
  l_Seg: Tl3Variant; 
 begin//UpdateDeletion
  l_Seg := aPara.AsObject.Attr[k2_tiSegments];
  with l_Seg do
   if IsValid then
   begin
    //l_ClearSuper := False;
    l_LayerCount := 0;
    //if (anOpPack <> nil) then
    // �������� ������ ��������� http://mdp.garant.ru/pages/viewpage.action?pageId=220595279
     // ��� �� ����� ���� ������ (misfLockSegments in aFlags) � TevTextParaCursor.DoDeleteString,
     // � ����� �������� ���������� �����, ����� �� ����, �������� ��� ����������
     // ��������� �� ���
     l_Seg.IterateChildrenF(L2Mk2ChildrenIterateChildrenFAction(@UpdateLayer));
    //if l_ClearSuper {and (anOpPack <> nil)} then
    // - ��������� ������ �� ����, ��� ������������ ������ �� � ��������� �����
    // http://mdp.garant.ru/pages/viewpage.action?pageId=199591524
(*    if (l_LayerCount > 1) then*)
    // http://mdp.garant.ru/pages/viewpage.action?pageId=204112481
    // ������ ��� ��������������, ��� ���� ����� ����������:
    // if (l_Exclude = []) and (l_CC = 1) then
    // - � � ����������� ��� ��� l_Exclude <> [].
     evSegments_ClearSuper(aPara, anOpPack);
   end;//IsValid
 end;//UpdateDeletion

var
 l_Text: Tl3CustomString;

 procedure lp_Copy2Deleted;
 var
  l_CharSize : Integer;
  l_TextStart: PAnsiChar;
 begin
  if (Deleted <> nil) then
  begin
   if (l_Text.CodePage = CP_Unicode) then
    l_CharSize := SizeOf(WideChar)
   else
    l_CharSize := SizeOf(AnsiChar);
   l_TextStart := l_Text.St + aPos * l_CharSize;
   l3Move(l_TextStart^, Deleted^, Count * l_CharSize);
  end; 
 end;

//#UC END# *5299C235026F_48D3AF8E024B_var*
begin
//#UC START# *5299C235026F_48D3AF8E024B_impl*
 Result := False;
 with aPara.AsObject.Attr[k2_tiText] do
  if IsValid then
   l_Text := AsObject as Tl3CustomString
  else
   Exit;
 if not l_Text.Empty then
 begin
  if (aPos < l_Text.Len) then
  begin
   lp_Copy2Deleted;
   l_Text.Delete(aPos, Count);
   UpdateDeletion(aPos, Count);
   (*   if l_Text.Empty and
      (EvPrevOverallPara(aPara).IsLegalComment or
       EvNextOverallPara(aPara).IsLegalComment) then
    aPara.OwnerPara.Invalidate([nev_spExtent])
   else*)
   // ^ - ��������� � http://mdp.garant.ru/pages/viewpage.action?pageId=210436431
   // ���������������� � http://mdp.garant.ru/pages/viewpage.action?pageId=313754442
    aPara.Invalidate([nev_spExtent]);
   Result := True;
  end;//aPos < l_Text.Len
 end;//not l_Text.Empty
//#UC END# *5299C235026F_48D3AF8E024B_impl*
end;//EvDir_DeleteText

procedure EvTextParaAddSegment(const aPara: InevTextPara;
  aLayerHandle: TevSegmentHandle;
  Segment: Tl3Tag;
  const Container: InevOp = nil);
//#UC START# *5299C2A8012B_48D3AF8E024B_var*
var
 l_Text: Tl3PCharLen;
 l_Sg: Tl3Variant;
 WasPreformatted: Boolean;
//#UC END# *5299C2A8012B_48D3AF8E024B_var*
begin
//#UC START# *5299C2A8012B_48D3AF8E024B_impl*
 l_Text := aPara.Text;
 if not l3IsNil(l_Text) then
 begin
  if (Segment.IntA[k2_tiStart] <= Segment.IntA[k2_tiFinish]) then
  begin
   if (Segment.IntA[k2_tiStart] <= l_Text.SLen) then
   begin
    l_Sg := aPara.AsObject.cAtom(k2_tiSegments, Container);
    if (Segment.IntA[k2_tiFinish] > l_Text.SLen) then
     Segment.IntW[k2_tiFinish, nil] := l_Text.SLen;
    if (aLayerHandle = ev_slView) and
       // - ������ �� �������� (� ���������� ����������) �������� � "����������" �� �� ��������.
       Segment.BoolA[k2_tiApply2Para] and
       (Segment.IntA[k2_tiStart] = 1) and (Segment.IntA[k2_tiFinish] >= l_Text.SLen) then
    begin
     WasPreformatted := (aPara.AsObject.IntA[k2_tiJustification] = Ord(ev_itPreformatted));
     aPara.AsObject.AssignCloneParams(Segment);
     if WasPreformatted and (aPara.AsObject.IntA[k2_tiJustification] <> Ord(ev_itPreformatted)) then
      aPara.AsObject.IntW[k2_tiJustification, Container] := Ord(ev_itPreformatted);
    end//Segment.BoolA[k2_tiApply2Para]
    else
     evSegments_AddSegment(aPara, l_Sg, aLayerHandle, Segment, Container);
   end;//Segment.Long(k2_tiStart) <= l_Text.Len
   aPara.Invalidate([nev_spExtent]);
  end;//Segment.IntA[k2_tiStart] <= Segment.IntA[k2_tiFinish]
 end;//not l_Text.Empty
//#UC END# *5299C2A8012B_48D3AF8E024B_impl*
end;//EvTextParaAddSegment

procedure EvTextParaIterateLines(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  Action: Tl3IteratorAction;
  I1: Tl3Index = l3MinIndex;
  I2: Tl3Index = l3MaxIndex);
//#UC START# *5299C2F90260_48D3AF8E024B_var*
var
 l_PrevLineInfo: PevLineInfo;

 function CheckLine(LineInfo: PPevLineInfo; Index: Long): Boolean;
 var
  Start, Finish: Long;
  l_LineInfo: PevLineInfo;
  l_Line: Tl3PCharLen;
 begin
  l_LineInfo := LineInfo^;
  if (l_LineInfo^.WC < 0) then
  begin
   if l3IsNil(aText) then
    l_LineInfo^.WC := 0
   else
   begin
    if (l_PrevLineInfo = nil) then
     Start := 0
    else
     Start := l_PrevLineInfo^.B;
    Finish := l_LineInfo^.B;
    l_Line.InitPart(aText.S, Start, Finish, aText.SCodePage);
    LineInfo^.WC := l3CountOfChar(cc_HardSpace, l3RTrim(l_Line));
   end;//l3IsNil(aText)
  end;//LineInfo^^.WC < 0
  Result := Action(LineInfo, Index);
  l_PrevLineInfo := l_LineInfo;
 end;

var
 l_LineInfo: TevLineInfo;
 l_PLineInfo: PevLineInfo;
 l_O: TObject;
//#UC END# *5299C2F90260_48D3AF8E024B_var*
begin
//#UC START# *5299C2F90260_48D3AF8E024B_impl*
 if (aMap = nil) or (aMap.Lines = nil) then
 begin
  {-��� ����� ���������� ����� �������� ��� �� ���������������}
  Assert(aMap <> nil, '� ������ �� �����, ��� ��������� ������ � ���������� ��������������?');
  //Assert(aMap.Lines <> nil);
  // - ���� Assert ������� ������, �.�. ��� Preformatted ���������� Lines = nil
  with l_LineInfo do
  begin
   if (aMap = nil) then
   begin
    LE.P.X := 0;
    LE.P.Y := 0;
   end
   else
   begin
    LE.P.X := aMap.Width;
    LE.P.Y := aMap.Height;
   end;//aMap = nil
   B := aText.SLen;
   FI := [];
   WC := 0;
   AddHyphen := False;
  end;//with l_LineInfo
  l_PLineInfo := @l_LineInfo;
  Action(@l_PLineInfo, 0);
 end//not aMap.rMap.IsValid
 else
 begin
  l_O := aMap.Lines.AsObject;
  if (l_O is TevLineArray) then
  begin
   if not l3IsNil(aText) then
   begin
    l_PrevLineInfo := nil;
    TevLineArray(l_O).IterateF(I1, I2, l3L2IA(@CheckLine));
   end//not l3IsNil(aText)
   else
    TevLineArray(l_O).Iterate(I1, I2, Action);
  end//l_O is TevLineArray
  else
  begin
   with l_LineInfo do
   begin
    with (l_O as Tl3SingleLineInfo) do
    begin
     LE.P.X := Width;
     LE.P.Y := Height;
     FI := FontIndexes;
    end;//with (l_O as Tl3SingleLineInfo)
    B := aText.SLen;
    WC := 0;
    AddHyphen := False;
   end;//with l_LineInfo
   l_PLineInfo := @l_LineInfo;
   Action(@l_PLineInfo, 0);
  end;//l_O is TevLineArray
 end;//not aMap.rMap.IsValid
//#UC END# *5299C2F90260_48D3AF8E024B_impl*
end;//EvTextParaIterateLines

function EvTextParaGetLine(const aMap: InevLines;
  const aText: Tl3PCharLen;
  var aIndex: Integer): Tl3PCharLen;
//#UC START# *5299C3AD0239_48D3AF8E024B_var*
var
 l_O: TObject;                           
//#UC END# *5299C3AD0239_48D3AF8E024B_var*
begin
//#UC START# *5299C3AD0239_48D3AF8E024B_impl*
 if l3IsNil(aText) then
  l3AssignNil(Result)
 else
 begin
  if (aMap <> nil) then
  begin
   l_O := aMap.AsObject;
   if (l_O is TevLineArray) then
   begin
    with TevLineArray(l_O) do
    begin
     if (aIndex > Count) then
      aIndex := Count;
     Result := GetLine(aText, aIndex);
    end;//with TevLineArray(l_O)
   end//l_O is TevLineArray
   else
    Result := aText;
  end//aMap <> nil
  else
   Result := aText;
 end;//l_Text.Empty
//#UC END# *5299C3AD0239_48D3AF8E024B_impl*
end;//EvTextParaGetLine

function EvTextParaGetLineByPos(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  aPos: Integer): Integer;
//#UC START# *5299C3E90278_48D3AF8E024B_var*
var
 LID: Long;
 PL: Tl3PCharLen;
 LOfs: Long;
 l_LineCount: Long;
//#UC END# *5299C3E90278_48D3AF8E024B_var*
begin
//#UC START# *5299C3E90278_48D3AF8E024B_impl*
 if (aPos <= 0) then
  Result := 1
 else
 begin
  l_LineCount := evTextParaLineCount(aMap);
  if (aMap <> nil) and (l_LineCount > 0) then
  begin
   LID := 1;
   while (LID <= l_LineCount) do
   begin
    PL := evTextParaGetLine(aMap.Lines, aText, LID);
    if (PL.S = nil) then
    begin
     Result := 1;
     Exit;
    end//PL.S = nil
    else
    begin
     if l3IsNil(aText) then
      LOfs := 0
     else
      LOfs := PL.Diff(aText);
     if (aPos >= LOfs) and (aPos < LOfs + PL.SLen) then
     begin
      Result := LID;
      Exit;
     end;//aPos >= LOfs..
    end;//PL.S = nil..
    Inc(LID);
   end;//while (LID <= l_LineCount)
  end;//l_LineCount > 0
  Result := l_LineCount;
  if (Result < 1) then Result := 1;
 end//aPos <= 0
//#UC END# *5299C3E90278_48D3AF8E024B_impl*
end;//EvTextParaGetLineByPos

function EvTextParaGetDeltaByPos(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  aPos: Integer;
  L: Integer): Integer;
//#UC START# *5299C4EF03B7_48D3AF8E024B_var*
var
 CN: Il3InfoCanvas;
 WC: Long;
 DW: TevPixel;
 IT: TevIndentType;
 Cont: Boolean;

  function TextLen(aStr: Tl3CustomString; const Font: Il3Font): TevPixel;
  var
   l_NS: Tl3CustomString;
   pxD2S: TevPixel;
   l_S: Tl3CustomString;
   l_HasWS: Boolean;
   l_IsWS: Boolean;
   l_aStr_AsPCharLen: Tl3PCharLen;
   l_S_AsPCharLen: Tl3PCharLen;
   l_CharForSearch: AnsiChar;
  begin
   if aStr.Empty then
   begin
    Result := 0;
    Cont   := True;
   end
   else
   begin
    CN.Font := Font;
    l_aStr_AsPCharLen := aStr.AsPCharLen;
    l_HasWS := l3HasWhiteSpace(l_aStr_AsPCharLen); //��������� �����, �.�. ������ ������ ����� ���� �������������
    if (aMap.Metrics <> nil) and aMap.Metrics.ShowSpecial then
     l_S := Tl3String.Make(CN.CheckConvertString(l_aStr_AsPCharLen))
    else
     l_S := aStr.Use;
    try
     l_S_AsPCharLen := l_S.AsPCharLen;
     if (IT <> ev_itWidth) or not l_HasWS then
     begin
      if (aPos >= l_S_AsPCharLen.SLen) then
      begin
       Result := CN.TextExtent(l_S_AsPCharLen).X;
       Dec(aPos, l_S_AsPCharLen.SLen);
       Cont := True;
      end
      else
      begin
       Result := CN.TextExtent(l3PCharLen(l_S_AsPCharLen.S, aPos, l_S_AsPCharLen.SCodePage)).X;
       aPos := 0;
       Cont := False;
      end;//aPos >= l_S_AsPCharLen.SLen
     end
     else
     begin
      Result  := 0;
      l_NS := l_S.Clone;
      try
       if aMap.Metrics.ShowSpecial then
        l_CharForSearch := cc_HardSpaceSymbol
       else
        l_CharForSearch := cc_HardSpace;
       while not l_S.Empty do
       begin
        l_S.FindCharEx(l_CharForSearch, l_NS);
        l_S_AsPCharLen := l_S.AsPCharLen;
        if (aPos >= l_S_AsPCharLen.SLen) then
        begin
         Inc(Result, CN.TextExtent(l_S_AsPCharLen).X);
         Dec(aPos, l_S_AsPCharLen.SLen);
         Cont   := True;
        end//aPos >= l_S_AsPCharLen.SLen
        else
        begin
         Inc(Result, CN.TextExtent(l3PCharLen(l_S_AsPCharLen.S, aPos, l_S_AsPCharLen.SCodePage)).X);
         aPos := 0;
         Cont := False;
        end;//aPos >= l_S_AsPCharLen.SLen
        if aMap.Metrics.ShowSpecial then
         l_IsWS := l3IsHiddenWhiteSpace(l_S.Last)
        else
         l_IsWS := l3IsWhiteSpace(l_S.Last);
        if l_IsWS then
        begin
         pxD2S := GetD2S(WC, DW);
         if Cont then Inc(Result, pxD2S);
        end;//l3IsWhiteSpace(l_S.Last)
        if not Cont then Break;
        l_S.Assign(l_NS);
       end;//while not l_S.Empty
      finally
       l3Free(l_NS);
      end;//try..finally
     end;//IT <> ev_itWidth
    finally
     l3Free(l_S);
    end;//try..finally
   end;//F = nil..
  end;//TextLen

var
 l_ParaFont: Il3Font;
 SegLst: Ik2TagList;
 S1, S2, S3: Tl3CustomString;
 Res: TevPixel;
 
 function SegmentLen(Seg: Tl3Variant; Index: Long): Boolean;
 var
  l_SegFont: Il3Font;
 begin
  Result := False;
  evTextParaGetLineSegment(aMap.Lines, aText, L, Index, SegLst, S1, S2, S3);
  Inc(Res, TextLen(S1, l_ParaFont));
  if Cont then
  begin
   l_SegFont := aMap.InfoForChild(TnevSegmentObject.Make(Seg)).Font[True];
   try
    Inc(Res, TextLen(S2, l_SegFont));
   finally
    l_SegFont := nil;
   end;//try..finally
   if Cont then
   begin
    Inc(Res, TextLen(S3, l_ParaFont));
    Result := True;
   end;
  end;
 end;

var
 PL: Tl3PCharLen;
 iPL: Long;
 iLW: Long;
 iDW: Long;
 ParaWidth: Long;
 l_LineCount: Long;
 l_SaveColor: Tl3Color;
 l_SegmentAndFontTool: InevStringCache;
//#UC END# *5299C4EF03B7_48D3AF8E024B_var*
begin
//#UC START# *5299C4EF03B7_48D3AF8E024B_impl*
 if (aMap = nil) then
  Result := 0
 else
  with aPara do
  begin
   if (aMap.Metrics = nil) then
   begin
    Result := 0;
    Exit;
   end;//aMap.Metrics = nil
   CN := aMap.Metrics.InfoCanvas;
   l_LineCount := evTextParaLineCount(aMap);
   l_SaveColor := CN.Font.ForeColor;
   try
    if (L <= 0) or (L > l_LineCount) then
     Result := 0
    else
    begin
     (*CN.StartTabs(l_TabInfo);
     try*)
      if (L > 1) then
       iPL := AsObject.IntA[k2_tiLeftIndent]
      else
       iPL := aMap.FirstIndent;
      // - http://mdp.garant.ru/pages/viewpage.action?pageId=278844809
      // - ����� ������������� ! ! !
      PL := evTextParaGetLine(aMap.Lines, aText, L);
      IT := TevIndentType(AsObject.IntA[k2_tiJustification]);
      case IT of
       ev_itWidth:
        if (L = l_LineCount) then
         IT := ev_itLeft;
       ev_itPreformatted:
        IT := ev_itLeft;
      end;//case IT
      if AsObject.Owner.IsKindOf(k2_typTableCell) then
       Inc(iPl, evCalcDecimalTabIndent(aPara, aText, IT, l_LineCount, CN));
      Result := iPL;
      ParaWidth := aMap.Width;
      if (aMap.Lines <> nil) then
      begin
       if (aMap.Lines.AsObject is TevLineArray) then
        iLW := TevLineArray(aMap.Lines.AsObject).LineWidth[L]
       else
        iLW := (aMap.Lines.AsObject as Tl3SingleLineInfo).Width;
      end//aMap.rMap.IsValid
      else
       iLW := ParaWidth;
      WC  := evTextParaGetLineWordCount(aMap.Lines, L);
      iDW := ParaWidth - iPL - iLW;
      //if (iDW < 0) then iDW := 0;
      DW := iDW;
      case IT of
       ev_itRight: Inc(Result, iDW);
       ev_itCenter: Inc(Result, iDW div 2);
      end;//case IT..
      if (aPos <= 0) then
      begin
       ;
      end
      else
      if (aPos > PL.SLen) then
      begin
       if (IT = ev_itWidth) then
        Result := ParaWidth
       else
        Inc(Result, iLW);
      end
      else
      begin //-������� ������ ������
       Res := 0;
       l_SegmentAndFontTool := TnevStringCache.Make;
       try
        SegLst := evTextParaGetLineSegments(aMap, aText, aPara, L);
        S1 := l_SegmentAndFontTool.CheckS(1);
        l_ParaFont := aMap.Font[True];
        try
         if SegLst.Empty then
         begin
          S1.AsPCharLen := PL;
          Res := TextLen(S1, l_ParaFont);
         end//SegLst.Empty
         else
         begin
          S2 := l_SegmentAndFontTool.CheckS(2);
          S3 := l_SegmentAndFontTool.CheckS(3);
          SegLst.ForEachF(L2Ik2TagListForEachAction(@SegmentLen));
         end;//SegLst.Empty
        finally
         l_ParaFont := nil;
        end;//try..finally
       finally
        l_SegmentAndFontTool := nil;
       end;//try..finally
       Inc(Result, Res);
      end;//-������� ������ ������
     (*finally
      CN.FinishTabs(l_TabInfo);
     end;//try..finally*)
    end;//(L <= 0) or (L > l_LineCoint)
   finally
    CN.Font.ForeColor := l_SaveColor;
   end;//try..finally
  end;//with aPara
//#UC END# *5299C4EF03B7_48D3AF8E024B_impl*
end;//EvTextParaGetDeltaByPos

function EvTextParaGetDeltaByLinePrim(aMap: TnevFormatInfoPrim;
  const aPara: InevTextPara;
  aLine: Integer): Integer;
//#UC START# *5299C52501E3_48D3AF8E024B_var*
var
 l_Result: Integer absolute Result;

 function AddLineDelta(ppLI: PPevLineInfo; Index: Integer): Boolean;
 begin//AddLineDelta
  Inc(l_Result, ppLI^^.LE.P.Y);
  Result := True;
 end;//AddLineDelta

var
 IA: Tl3IteratorAction;
//#UC END# *5299C52501E3_48D3AF8E024B_var*
begin
//#UC START# *5299C52501E3_48D3AF8E024B_impl*
 Result := 0;
 if (aLine > 0) then
 begin
  IA := l3L2IA(@AddLineDelta);
  try
   evTextParaIterateLines(aMap, aPara.Text, aPara, IA, 0, aLine - 1);
  finally
   l3FreeIA(IA);
  end;//try..finally
 end;//aLine > 0
//#UC END# *5299C52501E3_48D3AF8E024B_impl*
end;//EvTextParaGetDeltaByLinePrim

function EvTextParaGetDeltaByLine(aMap: TnevFormatInfoPrim;
  const aPara: InevTextPara;
  aLine: Integer): Integer;
//#UC START# *5299C54E02CD_48D3AF8E024B_var*
//#UC END# *5299C54E02CD_48D3AF8E024B_var*
begin
//#UC START# *5299C54E02CD_48D3AF8E024B_impl*
 if (aLine > 0) then
 begin
  Result := evTextParaGetDeltaByLinePrim(aMap, aPara, aLine);
  Inc(Result, aMap.Spacing.Top);
 end//aLine > 0
 else
  Result := 0;
//#UC END# *5299C54E02CD_48D3AF8E024B_impl*
end;//EvTextParaGetDeltaByLine

function EvTextParaGetPosByDelta(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  DX: Integer;
  L: Integer): Integer;
//#UC START# *5299C580016A_48D3AF8E024B_var*
var
 PL: Tl3PCharLen;
 PW: TevPixel;
 LW: TevPixel;
 iPL: Long;
 IT: TevIndentType;
 LI: TevLineInfo;
 l_LineCount: Long;
//#UC END# *5299C580016A_48D3AF8E024B_var*
begin
//#UC START# *5299C580016A_48D3AF8E024B_impl*
 Result := 0;
 if (aMap <> nil) then
  with aPara do
  begin
   l_LineCount := evTextParaLineCount(aMap);
   if (L > 0) and (L <= l_LineCount) then
   begin
    PL := evTextParaGetLine(aMap.Lines, aText, L);
    if not l3IsNil(PL) then
    begin
     if (L > 1) then
      iPL := AsObject.IntA[k2_tiLeftIndent]
     else
      iPL := aMap.FirstIndent;
     // - http://mdp.garant.ru/pages/viewpage.action?pageId=278844809
     // - ����� ������������� ! ! !
     IT := TevIndentType(AsObject.IntA[k2_tiJustification]);
     case IT of
      ev_itWidth:
       if (L = l_LineCount) then
        IT := ev_itLeft;                      
      ev_itPreformatted:
       IT := ev_itLeft;
     end;//case IT
     if AsObject.Owner.IsKindOf(k2_typTableCell) then
      Inc(iPl, evCalcDecimalTabIndent(aPara, aText, IT, l_LineCount, aMap.Metrics.InfoCanvas));
     PW := aMap.Width - iPL;
     LI.WC := evTextParaGetLineWordCount(aMap.Lines, L);
     if (aMap.Lines <> nil) then
     begin
      if (aMap.Lines.AsObject is TevLineArray) then
       LW := Min(TevLineArray(aMap.Lines.AsObject).LineWidth[L], PW)
      else
       LW := Min((aMap.Lines.AsObject as Tl3SingleLineInfo).Width, PW);
     end//aMap.rMap.IsValid
     else
      LW := PW;
     LI.LE.P.X := PW - LW;
     Dec(DX, iPL);
     case IT of
      ev_itRight: Dec(DX, LI.LE.P.X);
      ev_itCenter: Dec(DX, LI.LE.P.X div 2);
     end;//case IT..
     if (DX <= 0) then
      Exit
     else
     begin
      if (IT = ev_itWidth) then
      begin
       if (DX >= PW) then
       begin
        Result := PL.SLen;
        {$IfDef Nemesis}
        if (PL.SLen > 0) and PL.IsLast(cc_SoftEnter) then
         Dec(Result);
        {$EndIf Nemesis}
        Exit;
       end;//DX >= PW
      end//IT = ev_itWidth
      else
      if (DX >= LW) then
      begin
       Result := PL.SLen;
       {$IfDef Nemesis}
       if (PL.SLen > 0) and PL.IsLast(cc_SoftEnter) then
        Dec(Result);
       {$EndIf Nemesis}
       Exit;
      end;//DX >= LW
     end;//DX <= 0
     if (IT = ev_itWidth) then
      Result := evTextParaGetPosByDelta(aMap,
                                        aText,
                                        aPara,
                                        DX, PL,
                                        @LI, {-InLI}
                                        L)
     else
      Result := evTextParaGetPosByDelta(aMap,
                                        aText,
                                        aPara,
                                        DX, PL,
                                        nil, {-InLI}
                                        L);
    end;//not l3IsNil(PL)
   end;//L > 0..}
  end;//with aPara
//#UC END# *5299C580016A_48D3AF8E024B_impl*
end;//EvTextParaGetPosByDelta

function EvTextParaGetPosByLine(const aMap: InevLines;
  const aText: Tl3PCharLen;
  var L: Integer): Integer;
//#UC START# *5299C5F601CA_48D3AF8E024B_var*
var
 PL: Tl3PCharLen;
//#UC END# *5299C5F601CA_48D3AF8E024B_var*
begin
//#UC START# *5299C5F601CA_48D3AF8E024B_impl*
 if (L <= 1) then
  Result := 0
 else
 begin
  if l3IsNil(aText) then
   Result := 0
  else
  begin
   PL := evTextParaGetLine(aMap, aText, L);
   if (PL.S = nil) then
    Result := 0
   else
    Result := PL.Diff(aText);
  end;//l3IsNil(aText)
 end;//L <= 1
//#UC END# *5299C5F601CA_48D3AF8E024B_impl*
end;//EvTextParaGetPosByLine

procedure EvTextParaGetLineSegment(const aMap: InevLines;
  const aText: Tl3PCharLen;
  Li: Integer;
  Si: Integer;
  const L: Ik2TagList;
  S1: Tl3CustomString;
  S2: Tl3CustomString;
  S3: Tl3CustomString);
//#UC START# *5299C64702E6_48D3AF8E024B_var*
var
 B1, B2: Long;
 SB1,SB2: Long;
 TS: Tl3Variant;
 l_O: TObject;
//#UC END# *5299C64702E6_48D3AF8E024B_var*
begin
//#UC START# *5299C64702E6_48D3AF8E024B_impl*
 S1.Clear;
 S2.Clear;
 S3.Clear;
 if not L.Empty and not l3IsNil(aText) then
 begin
  if (aMap <> nil) then
  begin
   l_O := aMap.AsObject;
   if (l_O is TevLineArray) then
    TevLineArray(l_O).GetLineBorders(aText, Li, B1, B2)
   else
   begin
    B1 := 0;
    B2 := aText.SLen;
   end;//l_O is TevLineArray
  end//aMap.IsValid
  else
  begin
   B1 := 0;
   B2 := aText.SLen;
  end;//aMap.IsValid
  TS := L.Items[Si];
  SB1 := Max(B1, Pred(TS.IntA[k2_tiStart]));
  SB2 := Min(B2, TS.IntA[k2_tiFinish]);
  if (SB1 > B1) then
  begin
   if (Si = 0) then
    S1.AssignSt(aText.S, B1, SB1, aText.SCodePage)
   else
    S1.AssignSt(aText.S,
                L.Items[Pred(Si)].IntA[k2_tiFinish],
                SB1,
                aText.SCodePage);
  end;
  S2.AssignSt(aText.S, SB1, SB2, aText.SCodePage);
  if (Si = Pred(L.Count)) then
   S3.AssignSt(aText.S, SB2, B2, aText.SCodePage);
 end//not L.Empty
 else
  if not l3IsNil(aText) then
   with evTextParaGetLine(aMap, aText, Li)
    do S1.AssignSt(aText.S, 0, SLen, aText.SCodePage);
//#UC END# *5299C64702E6_48D3AF8E024B_impl*
end;//EvTextParaGetLineSegment

function EvTextParaGetLineSegments(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  Li: Integer): Ik2TagList;
//#UC START# *5299C6810392_48D3AF8E024B_var*
var
 l_List : Tk2InterfacedTagList;
 B1, B2: Long;
 Super: Tl3Variant;
 l_O: TObject;
 l_NewSeg: Tl3Variant;
//#UC END# *5299C6810392_48D3AF8E024B_var*
begin
//#UC START# *5299C6810392_48D3AF8E024B_impl*
 if (aMap = nil) then
  Result := Tk2InterfacedTagList.MakeI
 else
 begin
  Super := aMap.ViewSegments;
  if Super.IsValid then
  begin
   if (aMap.Lines = nil) then
   begin
    B1 := 0;
    B2 := High(Long);
   end//not aMap.IsValid
   else
   begin
    l_O := aMap.Lines.AsObject;
    if (l_O is TevLineArray) then
     TevLineArray(l_O).GetLineBorders(aText, Li, B1, B2)
    else
    begin
     B1 := 0;
     B2 := High(Long);
    end;//l_O is TevLineArray
   end;//not aMap.IsValid
   l_NewSeg := evGetFirstParaHyperlink(aPara, aMap);
   Result := evSegmentsLayer_GetSegments(aPara.AsObject, Super, B1, B2, l_NewSeg);
  end//Super.IsValid
  else
  begin
   l_NewSeg := evGetFirstParaHyperlink(aPara, aMap);
   if l_NewSeg = nil then
    Result := Tk2InterfacedTagList.MakeI
   else
   begin
    l_List := Tk2InterfacedTagList.Create;
    try
     Result := l_List;
     l_List.Add(l_NewSeg);
    finally
     l3FRee(l_List);
    end;
   end;
  end;
 end;//aMap = nil
//#UC END# *5299C6810392_48D3AF8E024B_impl*
end;//EvTextParaGetLineSegments

procedure EvTextParaSetFontParam(const aPara: InevTextPara;
  anAtom: Integer;
  aValue: Tl3Variant;
  const Container: InevOp = nil);
//#UC START# *5299C6B30321_48D3AF8E024B_var*
var
 l_S: Tl3PCharLen;
 l_Text: Tl3CustomString;
//#UC END# *5299C6B30321_48D3AF8E024B_var*
begin
//#UC START# *5299C6B30321_48D3AF8E024B_impl*
 l_S := aPara.Text;
 if l3IsNil(l_S) then
  evTextParaSetFontParamPrim(aPara, anAtom, aValue, Container)
 else
 begin
  evTextParaSetFontParamPrim(aPara, anAtom, aValue, Container);
  l_Text := aPara.AsObject.Attr[k2_tiText] as Tl3CustomString;
  OevChangeCodePage.ToUndo(Container, l_S.SCodePage, l_Text.CodePage, l_Text);
 end;//l_S.Empty
//#UC END# *5299C6B30321_48D3AF8E024B_impl*
end;//EvTextParaSetFontParam

function EvTextParaLineCount(aMap: TnevFormatInfoPrim): Integer;
//#UC START# *5299C6C9020D_48D3AF8E024B_var*
//#UC END# *5299C6C9020D_48D3AF8E024B_var*
begin
//#UC START# *5299C6C9020D_48D3AF8E024B_impl*
 if (aMap <> nil) and (aMap.Lines <> nil) then
  Result := aMap.Lines.Count
 else
  Result := 1;
//#UC END# *5299C6C9020D_48D3AF8E024B_impl*
end;//EvTextParaLineCount

function EvTextParaViewBounds(const aMap: InevMap;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  aPosInLine: Integer;
  aLine: Integer): TnevRect;
//#UC START# *5299C7050151_48D3AF8E024B_var*
var
 l_FI: TInevFormatInfoRet;
//#UC END# *5299C7050151_48D3AF8E024B_var*
begin
//#UC START# *5299C7050151_48D3AF8E024B_impl*
 if (aMap = nil) or (aLine < 1) then
  Result := nevRect0
 else
 begin
  l_FI := aMap.FI;
  Result.Top := aMap.Bounds.Top + evTextParaGetDeltaByLine(l_FI, aPara, aLine - 1);
  Result.Bottom := aMap.Bounds.Top + evTextParaGetDeltaByLine(l_FI, aPara, aLine);
  Result.Left := aMap.Bounds.Left + evTextParaGetDeltaByPos(l_FI, aText, aPara, aPosInLine, aLine);
  Result.Right := Result.Left;
 end; 
//#UC END# *5299C7050151_48D3AF8E024B_impl*
end;//EvTextParaViewBounds

function EvTextParaGetPosByDelta(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  const IC: Il3InfoCanvas;
  DX: Integer;
  const PL: Tl3PCharLen;
  InLI: PevLineInfo;
  L: Integer): Integer;
//#UC START# *529F090703D7_48D3AF8E024B_var*
var
 l_Continue: Bool;

  function _TextPos(S: Tl3CustomString): Long;
  var
   SW: Tl3Point;
   l_OTabInfo: Il3TabInfo;
   l_TabInfo: Il3TabInfo;
   l_RealStr: Tl3CustomString;
   l_RealStr_AsPCharLen: Tl3PCharLen;
  begin
   l_OTabInfo := IC.TabInfo;
   if aMap.Metrics.ShowSpecial then
    l_RealStr := Tl3String.Make(IC.CheckConvertString(S.AsPCharLen))
   else
    l_RealStr := S.Use;
   try
    l_RealStr_AsPCharLen := l_RealStr.AsPCharLen;
    SW := IC.TextExtent(l_RealStr_AsPCharLen);
    if (DX >= SW.P.X) then
    begin
     Dec(DX, SW.P.X);
     Result := l_RealStr_AsPCharLen.SLen;
     l_Continue := True;
    end
    else
    begin
     IC.StartTabs(l_TabInfo, l_OTabInfo);
     Result := IC.Pos2Index(DX, l_RealStr_AsPCharLen);
     IC.FinishTabs(l_TabInfo);
     IC.StartTabs(l_TabInfo, l_OTabInfo);
     Dec(DX, IC.TextExtent(l3PCharLen(l_RealStr_AsPCharLen.S, Result, l_RealStr_AsPCharLen.SCodePage)).P.X);
     IC.FinishTabs(l_TabInfo);
     l_Continue := False;
    end;//DX >= iLW
   finally
    l3Free(l_RealStr);
   end;//try..finally 
  end;//_TextPos

  function TextPos(S: Tl3CustomString; const Font: Il3Font): Long;
  begin
   if S.Empty then
   begin
    Result := 0;
    l_Continue := True;
   end
   else
   begin
    IC.Font := Font;
    Result := _TextPos(S)
   end;{S.Empty}
  end;{TextPos}
  
  function _TextPosW(S: Tl3CustomString): Long;
  var
   SW: Tl3Point;
   l_NS: Tl3CustomString;
   D2S: TevPixel;
   l_Pos: Long;
   l_OTabInfo: Il3TabInfo;
   l_TabInfo: Il3TabInfo;
   l_RealStr: Tl3CustomString;
   l_CharForSearch : AnsiChar;
   l_RealStr_AsPCharLen : Tl3PCharLen;
  begin
   Result  := 0;
   l_OTabInfo := IC.TabInfo;
   if aMap.Metrics.ShowSpecial then
    l_RealStr := Tl3String.Make(IC.CheckConvertString(S.AsPCharLen))
   else
    l_RealStr := S.Use;
   try
    l_NS := l_RealStr.Clone;
    try
     if aMap.Metrics.ShowSpecial then
      l_CharForSearch := cc_HardSpaceSymbol
     else
      l_CharForSearch := cc_HardSpace;
     while not l_RealStr.Empty do
     begin
      l_RealStr.FindCharEx(l_CharForSearch, l_NS);
      l_RealStr_AsPCharLen := l_RealStr.AsPCharLen;
      SW := IC.TextExtent(l_RealStr_AsPCharLen);
      if (DX >= SW.P.X) then
      begin
       l_Pos := l_RealStr_AsPCharLen.SLen;
       Inc(Result, l_Pos);
       Dec(DX, SW.P.X);
       l_Continue := True;
      end
      else
      begin
       IC.StartTabs(l_TabInfo, l_OTabInfo);
       l_Pos := IC.Pos2Index(DX, l_RealStr_AsPCharLen);
       IC.FinishTabs(l_TabInfo);
       Inc(Result, l_Pos);
       IC.StartTabs(l_TabInfo, l_OTabInfo);
       Dec(DX, IC.TextExtent(l3PCharLen(l_RealStr_AsPCharLen.S, l_Pos, l_RealStr_AsPCharLen.SCodePage)).P.X);
       IC.FinishTabs(l_TabInfo);
       l_Continue := False;
      end;{DX >= iLW}
      if (aMap.Metrics.ShowSpecial and l3IsHiddenWhiteSpace(l_RealStr.Last)) or
         l3IsWhiteSpace(l_RealStr.Last) then
      begin
       D2S := GetD2S(InLI^.WC, InLI^.LE.P.X);
       if l_Continue OR (l_Pos = l_RealStr_AsPCharLen.SLen) then Dec(DX, D2S);
      end;
      if not l_Continue then Break;
      l_RealStr.Assign(l_NS);
     end;//while not l_RealStr.Empty
    finally
     l3Free(l_NS);
    end;//try..finally
   finally
    l3Free(l_RealStr);
   end;//try..finally
  end;//_TextPosW

  function TextPosW(S: Tl3CustomString; const Font: Il3Font): Long;
  begin
   if S.Empty then
   begin
    Result := 0;
    l_Continue := True;
   end
   else
   begin
    IC.Font := Font;
    if not l3HasWhiteSpace(S.AsPCharLen) then
     Result := _TextPos(S)
    else
     Result := _TextPosW(S);
   end;{F = nil..}
  end;{TextPosW}

var
 S1, S2, S3: Tl3CustomString;
 l_Pos: Long;
 SegLst: Ik2TagList;
 l_ParaFont: Il3Font;

  function SegmentPos(Seg: Tl3Variant; Index: Long): Bool; 
  var
   l_SegFont: Il3Font;
  begin
   Result := False;
   evTextParaGetLineSegment(aMap.Lines, aText, L, Index, SegLst, S1, S2, S3);
   Inc(l_Pos, TextPos(S1, l_ParaFont));
   if l_Continue then
   begin
    l_SegFont := aMap.InfoForChild(TnevSegmentObject.Make(Seg)).Font[True];
    try
     Inc(l_Pos, TextPos(S2, l_SegFont));
    finally
     l_SegFont := nil;
    end;{try..finally}
    if l_Continue then
    begin
     Inc(l_Pos, TextPos(S3, l_ParaFont));
     Result := True;
    end;
   end;{DX1 > 0..}
  end;//SegmentPos

  function SegmentPosW(Seg: Tl3Variant; Index: Long): Bool;
  var
   l_SegFont: Il3Font;
  begin
   Result := False;
   evTextParaGetLineSegment(aMap.Lines, aText, L, Index, SegLst, S1, S2, S3);
   Inc(l_Pos, TextPosW(S1, l_ParaFont));
   if l_Continue then
   begin
    l_SegFont := aMap.InfoForChild(TnevSegmentObject.Make(Seg)).Font[True];
    try
     Inc(l_Pos, TextPosW(S2, l_SegFont));
    finally
     l_SegFont := nil;
    end;{try..finally}
    if l_Continue then
    begin
     Inc(l_Pos, TextPosW(S3, l_ParaFont));
     Result := True;
    end;
   end;{DX1 > 0..}
  end;//SegmentPosW

var
 l_TabInfo: Il3TabInfo;
 l_StringCache: InevStringCache;
//#UC END# *529F090703D7_48D3AF8E024B_var*
begin
//#UC START# *529F090703D7_48D3AF8E024B_impl*
 Result := 0;
 if (DX <= 0) then Exit;
 if not l3IsNil(PL) then
 begin
  if (IC <> nil) then
  begin
   IC.StartTabs(l_TabInfo, aMap.Obj.TabStops);
   try
    l_StringCache := TnevStringCache.Make;
    try
     S1 := l_StringCache.CheckS(1);
     l_ParaFont := aMap.Font[True];
     try
      SegLst := evTextParaGetLineSegments(aMap, aText, aPara, L);
      if (InLi <> nil) then
      begin
       if SegLst.Empty then
       begin
        S1.AsPCharLen := PL;
        l_Pos := TextPosW(S1, l_ParaFont);
       end//SegLst.Empty
       else
       begin
        S2 := l_StringCache.CheckS(2);
        S3 := l_StringCache.CheckS(3);
        l_Pos := 0;
        SegLst.ForEachF(L2Ik2TagListForEachAction(@SegmentPosW));
       end;//SegLst.Empty
      end//InLi <> nil
      else
      begin
       if SegLst.Empty then
       begin
        S1.AsPCharLen := PL;
        l_Pos := TextPos(S1, l_ParaFont);
       end//SegLst.Empty
       else
       begin
        S2 := l_StringCache.CheckS(2);
        S3 := l_StringCache.CheckS(3);
        l_Pos := 0;
        SegLst.ForEachF(L2Ik2TagListForEachAction(@SegmentPos));
       end;//SegLst.Empty
      end;//InLi <> nil
     finally
      l_ParaFont := nil;
     end;//try..finally
     Result := l_Pos;
    finally
     l_StringCache := nil;
    end;//try..finally
   finally
    IC.FinishTabs(l_TabInfo);
   end;//try..finally
  end;//IC <> nil
 end;//not l3IsNil(PL)
//#UC END# *529F090703D7_48D3AF8E024B_impl*
end;//EvTextParaGetPosByDelta

function EvTextParaGetPosByDelta(aMap: TnevFormatInfoPrim;
  const aText: Tl3PCharLen;
  const aPara: InevTextPara;
  DX: Integer;
  const PL: Tl3PCharLen;
  InLI: PevLineInfo;
  L: Integer): Integer;
//#UC START# *529F095900AD_48D3AF8E024B_var*
var
 l_CN: Il3InfoCanvas;
//#UC END# *529F095900AD_48D3AF8E024B_var*
begin
//#UC START# *529F095900AD_48D3AF8E024B_impl*
 l_CN := aMap.Metrics.InfoCanvas;
 try
  if not l_CN.EQ(nev.CrtIC) then
  begin
   Assert(False, '������ ����� ������ ���� �� ������');
   l_CN := nev.CrtIC;
  // - ��������� �����, �.�. ������ ���� ������ �� ����� ������, � �� �� ����� ��������������
  end;//not l_CN.EQ(nev.CrtIC)
  l_CN.Lock;
  try
   Result := evTextParaGetPosByDelta(aMap, aText, aPara, l_CN, DX, PL, InLI, L);
  finally
   l_CN.Unlock;
  end;//try..finally
 finally
  l_CN := nil;
 end;//try..finally
//#UC END# *529F095900AD_48D3AF8E024B_impl*
end;//EvTextParaGetPosByDelta

function EvGetFirstParaHyperlink(const aPara: InevPara;
  aMap: TnevFormatInfoPrim): Tl3Variant;
//#UC START# *552FA1440245_48D3AF8E024B_var*
var
 l_Text           : Tl3Variant;
 l_Decor          : Tl3Variant;
 l_TextLen        : Integer;
 l_HyperlinkLayer : Tl3Variant;
//#UC END# *552FA1440245_48D3AF8E024B_var*
begin
//#UC START# *552FA1440245_48D3AF8E024B_impl*
 Result := nil;
 if EvHeaderTextPara(aPara) then
 begin
  l_Text := aPara.Attr[k2_tiText];
  if l_Text.IsValid and not l_Text.Empty then
  begin
   l_TextLen := l_Text.AsWStr.SLen;
   l_Decor := aMap.ParentInfo.DecorObj(nev_dtHeader);
   Assert(l_Decor.IsValid);
   l_HyperlinkLayer := l_Decor.AsObject.rAtomEx([k2_tiSegments, k2_tiChildren, k2_tiHandle, Ord(ev_slHyperlinks)]);
   Result := l_HyperlinkLayer.Child[0].AsObject;
   Result.IntW[k2_tiFinish, nil] := aPara.PCharLenA[k2_tiText].SLen;
  end; // if l_Text.IsValid and not l_Text.Empty then
 end; // if (ParaX.PID = 0) and ParaX.OwnerPara.IsValid and EvExpandedText(ParaX.OwnerPara.AsObject) then
//#UC END# *552FA1440245_48D3AF8E024B_impl*
end;//EvGetFirstParaHyperlink
{$IfEnd} //k2ForEditor

end.