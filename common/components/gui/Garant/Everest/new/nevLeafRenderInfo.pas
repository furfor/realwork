unit nevLeafRenderInfo;

// ������: "w:\common\components\gui\Garant\Everest\new\nevLeafRenderInfo.pas"
// ���������: "SimpleClass"
// ������� ������: "TnevLeafRenderInfo" MUID: (481F0442026B)

{$Include w:\common\components\gui\Garant\Everest\evDefine.inc}

interface

uses
 l3IntfUses
 , nevParaFormatInfo
 , nevTools
 , nevBase
;

type
 TnevLeafRenderInfo = class(TnevParaFormatInfo)
  protected
   function GetMaxLinesCount: Integer; override;
   function pm_GetlocSpacing: TnevRect; override;
  public
   procedure DoInvalidateShape(const aShape: InevObject;
    aParts: TnevShapeParts); override;
 end;//TnevLeafRenderInfo

implementation

uses
 l3ImplUses
 , nevFacade
 , l3String
 {$If Defined(k2ForEditor)}
 , evParaTools
 {$IfEnd} // Defined(k2ForEditor)
 , k2Tags
 , TableCell_Const
 , Block_Const
 , nevFormatInfo
;

procedure TnevLeafRenderInfo.DoInvalidateShape(const aShape: InevObject;
 aParts: TnevShapeParts);
//#UC START# *48172A690313_481F0442026B_var*
const
 cForce = [nev_ripHeight, nev_ripLines];
var
 l_H : Integer;
 l_Prepared : TnevRenderingInfoParts;
//#UC END# *48172A690313_481F0442026B_var*
begin
//#UC START# *48172A690313_481F0442026B_impl*
 Assert(aShape.AsObject.IsSame(Obj.AsObject));
 if (nev_spExtent in aParts) then
 begin
  l_Prepared := Prepared;
  // ^http://mdp.garant.ru/pages/editpage.action?pageId=93259698 - ���������� ��,
  //  ��� ���� ��� ���������.
  wForce(cForce);
  // - ��� ���� - ����� ����������� ��-�����, ����� - �������� �� �����������������
  //   ��. �������� - http://mdp.garant.ru/pages/viewpage.action?pageId=90440717
  if (nev_ripHeight in l_Prepared) then
  // - ���� �� ���� ���������, �� ������ � ��������
  begin
   l_H := f_FI.rHeight;
   if Prepare([nev_ripHeight]) then
   begin
    //ShapesPainted.Clear;
    // - ��� ������ ����� �����, �.�. ��� ����� ������� ������ ����� ���������
    //   ������? - ���� �����������, �� � ��� ����� ������� ������ ���������
    //   ����������������.
    if ((f_FI.rHeight - l_H) <> 0) then
    begin
     ForceParent;
     ViewArea.InvalidateShape(aShape, [nev_spExtent]);
    end//(l_FI.rHeight - l_H) <> 0
    else
     ViewArea.InvalidateShape(aShape, []);
   end//Prepare
   else
   begin
    ForceParent;
    ViewArea.Invalidate;
    Assert(false);
    // - ����� - ����� ������ ����
   end;//Prepare
  end//nev_ripHeight in l_Prepared
  else
  begin
   ForceParent;
   ViewArea.InvalidateShape(aShape, [nev_spExtent]);
  end;//nev_ripHeight in l_Prepared
 end;//nev_spExtent in aParts
//#UC END# *48172A690313_481F0442026B_impl*
end;//TnevLeafRenderInfo.DoInvalidateShape

function TnevLeafRenderInfo.GetMaxLinesCount: Integer;
//#UC START# *4BC45843011E_481F0442026B_var*
//#UC END# *4BC45843011E_481F0442026B_var*
begin
//#UC START# *4BC45843011E_481F0442026B_impl*
 Result := Height div nev.LineScrollDelta.Y;
//#UC END# *4BC45843011E_481F0442026B_impl*
end;//TnevLeafRenderInfo.GetMaxLinesCount

function TnevLeafRenderInfo.pm_GetlocSpacing: TnevRect;
//#UC START# *4E5F3D1102B8_481F0442026Bget_var*

 procedure CheckCells(const aPara : InevPara; var aRes: InevPara);
 var
  l_C1 : Tl3Variant;
  l_C2 : Tl3Variant;
 begin//CheckCells
  if (aRes <> nil) AND aRes.AsObject.IsValid then
  begin
   if not evInPara(aPara.AsObject, k2_typTableCell, l_C1) then
   begin
    if not aPara.AsObject.Owner.IsValid then
    // - �������� �������� �������
    // http://mdp.garant.ru/pages/viewpage.action?pageId=264902374
    begin
     aRes := nil;
     Exit;
    end//not aPara.Owner.IsValid
    else
    if evInPara(aRes.AsObject, k2_typTableCell, l_C2) then
     aRes := nil;
   end//not evInPara(aPara, k2_idTableCell, l_C1)
   else
   begin
    if evInPara(aRes.AsObject, k2_typTableCell, l_C2) then
    begin
     if not l_C1.Box.IsSame(l_C2.Box) then
      aRes := nil;
    end//evInPara(aRes, k2_idTableCell, l_C2)
    else
     aRes := nil;
   end;//not evInPara(aPara, k2_idTableCell, l_C1)
  end;//(aRes <> nil) AND aRes.IsValid
 end;//CheckCells

 procedure CheckRes(const aPara : InevPara; var aRes: InevPara);
 var
  l_B1 : Tl3Variant;
  l_B2 : Tl3Variant;
 begin//CheckRes
  // http://mdp.garant.ru/pages/viewpage.action?pageId=255960842
  if (aRes <> nil) AND aRes.AsObject.IsValid then
  begin
   if not evInPara(aPara.AsObject, k2_typBlock, l_B1) then
    if not aPara.AsObject.Owner.IsValid then
    // - �������� �������� �������
    // http://mdp.garant.ru/pages/viewpage.action?pageId=264902374
    begin
     aRes := nil;
     Exit;
    end//not aPara.Owner.IsValid
    else
     Assert(false);
   if not evInPara(aRes.AsObject, k2_typBlock, l_B2) then
    Assert(false);
   if (l_B1.IntA[k2_tiHandle] <> l_B2.IntA[k2_tiHandle]) then
    aRes := nil;
  end;//(aRes <> nil) AND aRes.IsValid
 end;//CheckRes

 function l_Prev(const aPara : InevObjectPrim): InevPara;
 var
  l_Para : InevPara;
 begin//l_Prev
  if not aPara.AsObject.QT(InevPara, l_Para) then
   Assert(false);
  Result := evPrevOverallPara(l_Para);
  CheckRes(l_Para, Result);
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=255960842
  CheckCells(l_Para, Result);
 end;//l_Prev

 function l_Next(const aPara : InevObjectPrim): InevPara;
 var
  l_Para : InevPara;
 begin//l_Next
  if not aPara.AsObject.QT(InevPara, l_Para) then
   Assert(false);
  Result := evNextOverallPara(l_Para);
  //CheckRes(l_Para, Result);
  // - http://mdp.garant.ru/pages/viewpage.action?pageId=255960842
  CheckCells(l_Para, Result);
 end;//l_Next

 procedure IncTop;
 begin//IncTop
  Result.Top := Result.Top + Self.DecorHeight(nev_dtHeader);
 end;//IncTop

 procedure IncBottom;
 begin//IncBottom
  Result.Bottom := Result.Bottom + Self.DecorHeight(nev_dtFooter);
 end;//IncBottom

var
 l_N : InevPara;
 l_Style : Tl3Variant;
 l_IsHidden : Boolean;
 l_H : Integer;
//#UC END# *4E5F3D1102B8_481F0442026Bget_var*
begin
//#UC START# *4E5F3D1102B8_481F0442026Bget_impl*
 Result := inherited pm_GetLocSpacing;                            
 l_IsHidden := Self.IsHidden(false, false);
 l_Style := Obj.AsObject.Attr[k2_tiStyle];
 if l_Style.IsValid then
 begin
  if not l3IsNil(l_Style.PCharLenA[k2_tiShortName]) AND
     not l_IsHidden then
  // - ����� ����� ���������, ������� ���� ��������
  begin
   l_H := l_Style.IntA[k2_tiHandle];
   l_N := l_Prev(Obj);
   if (l_N = nil) OR not l_N.AsObject.IsValid OR
      (l_N.AsObject.IntA[k2_tiStyle] <> l_H) then
    // - ���� ���������� �������� - �� ����� �� ��� ��
    IncTop
   else
    Result.Top := 0;
   l_N := l_Next(Obj);
   if (l_N = nil) OR not l_N.AsObject.IsValid OR
      (l_N.AsObject.IntA[k2_tiStyle] <> l_H) then
    IncBottom;
   if (l_N <> nil) and l_N.AsObject.IsValid and (l_N.AsObject.IntA[k2_tiStyle] = l_H) then
   begin
    if evAACStyle(l_H) then
     Result.Bottom := 0;
    {$IFNDEF Nemesis} // ������ �������� �������� �� ����� - ��� ��� ����������� ����� ���������� ������� � ���������.
    l_N.Invalidate([nev_spExtent]);
    {$ENDIF Nemesis}
   end; // if (l_N <> nil) and l_N.IsValid and (l_N.IntA[k2_tiStyle] = l_H) then
   Exit;
  end;//not l3IsNil(l_Style.PCharLenA[k2_tiShortName])
 end;//l_Style.IsValid
 if l3IsNil(Obj.AsObject.PCharLenA[k2_tiText]) OR
    l_IsHidden then
  if (Result.Bottom > 0) then
  begin
   l_N := l_Next(Obj);
   if (l_N <> nil) AND l_N.AsObject.IsValid then
    if l_N.DecorObj(nev_dtHeader).IsValid then
     Result.Bottom := 0;
  end;//Result.Bottom > 0
//#UC END# *4E5F3D1102B8_481F0442026Bget_impl*
end;//TnevLeafRenderInfo.pm_GetlocSpacing

end.
