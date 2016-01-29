unit nsEditionsUtils;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Business"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/Business/Document/nsEditionsUtils.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UtilityPack::Class>> F1 Core::Common::Business::BaseDocument::nsEditionsUtils
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  l3TreeInterfaces
  {$If not defined(NoVCL)}
  ,
  ImgList
  {$IfEnd} //not NoVCL
  
  ;

function NsCalcEditionImageIndex(const anEdition: Il3SimpleNode;
  var theImages: TCustomImageList;
  aForEditionsTree: Boolean): Integer;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  DocumentRes,
  nsEditionNodes,
  DocumentUnit,
  SysUtils,
  SearchRes
  ;

// unit methods

function NsCalcEditionImageIndex(const anEdition: Il3SimpleNode;
  var theImages: TCustomImageList;
  aForEditionsTree: Boolean): Integer;
//#UC START# *4B2896B900F3_4B2895E80398_var*
var
 l_EditionNode : InsEditionNode;
//#UC END# *4B2896B900F3_4B2895E80398_var*
begin
//#UC START# *4B2896B900F3_4B2895E80398_impl*
 theImages := nsDocumentRes.DocumentItemsImageList;
 if Supports(anEdition, InsEditionNode, l_EditionNode) then
 begin
  if aForEditionsTree then
  begin
   theImages := nsSearchRes.SearchItemsImageList;
   case l_EditionNode.EditionType of
    RT_ACTUAL:
     Result := 12;
    RT_ACTUAL_ABOLISHED:
     Result := 12;
    RT_ACTUAL_PREACTIVE:
     Result := 14;
    RT_OLD:
     Result := 14;
    RT_NEW,
    RT_NEW_ABOLISHED,
    RT_NEW_PREACTIVE:
     Result := 10;
    else
    begin
     Assert(false);
     Result := 12;
    end;//else
   end;//case l_EditionNode.EditionType
   if (l_EditionNode.CheckType <> ns_enctUnchecked) then
    Inc(Result);
    // - ��������� � ��������
  end///aForEditionsTree
  else
  begin
   case l_EditionNode.EditionType of
    RT_ACTUAL:
     Result := diilActualRedaction;
    RT_ACTUAL_ABOLISHED:
     Result := diilActualNoActiveRedaction;
    RT_ACTUAL_PREACTIVE:
     Result := diilActualPreActiveRedaction;
    RT_OLD:
     Result := diilNoActiveRedaction;
    RT_NEW,
    RT_NEW_ABOLISHED,
    RT_NEW_PREACTIVE:
     Result := diilPreActiveRedaction;
    else
    begin
     Assert(false);
     Result := diilActualRedaction;
    end;//else
   end//case l_EditionNode.EditionType
  end;//aForEditionsTree
 end//Supports(anEdition, InsEditionNode, l_EditionNode)
 else
  Result := diilActualRedaction;
//#UC END# *4B2896B900F3_4B2895E80398_impl*
end;//NsCalcEditionImageIndex
{$IfEnd} //not Admin AND not Monitorings

end.