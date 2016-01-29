unit kw_Search_BaseSearch;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Search/kw_Search_BaseSearch.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> F1 �������� ����������::Search::View::Search::Tkw_Search_BaseSearch
//
// ����� ������� ��� ������ �������� ������ Search.BaseSearch$Op (�����)
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
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmExternalInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoScripts)}
  ,
  tfwScriptingInterfaces
  {$IfEnd} //not NoScripts
  
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 {$Include w:\common\components\rtl\Garant\ScriptEngine\tfwModuleOperationWord.imp.pas}
 Tkw_Search_BaseSearch = class(_tfwModuleOperationWord_)
  {* ����� ������� ��� ������ �������� ������ Search.BaseSearch$Op (�����) }
 protected
 // overridden protected methods
   {$If not defined(NoScripts)}
   class function GetModuleOperationCode: TvcmMOPID; override;
   {$IfEnd} //not NoScripts
 public
 // overridden public methods
   {$If not defined(NoScripts)}
   class function GetWordNameForRegister: AnsiString; override;
   {$IfEnd} //not NoScripts
 end;//Tkw_Search_BaseSearch
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  SysUtils
  {$If not defined(NoVCM)}
  ,
  StdRes
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmBase
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoScripts)}
  ,
  tfwAutoregisteredDiction
  {$IfEnd} //not NoScripts
  
  {$If not defined(NoScripts)}
  ,
  tfwScriptEngine,
  kwString,
  vcmModulesCollectionItem,
  vcmBaseOperationsCollectionItem,
  l3Except,
  vcmBaseMenuManager
  {$IfEnd} //not NoScripts
  
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

type _Instance_R_ = Tkw_Search_BaseSearch;

{$Include w:\common\components\rtl\Garant\ScriptEngine\tfwModuleOperationWord.imp.pas}

// start class Tkw_Search_BaseSearch

{$If not defined(NoScripts)}
class function Tkw_Search_BaseSearch.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '���::�����_BaseSearch';
end;//Tkw_Search_BaseSearch.GetWordNameForRegister
{$IfEnd} //not NoScripts

{$If not defined(NoScripts)}
class function Tkw_Search_BaseSearch.GetModuleOperationCode: TvcmMOPID;
 {-}
begin
 Result := TdmStdRes.mod_opcode_Search_BaseSearch;
end;//Tkw_Search_BaseSearch.GetModuleOperationCode
{$IfEnd} //not NoScripts

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
 {$Include w:\common\components\rtl\Garant\ScriptEngine\tfwModuleOperationWord.imp.pas}
{$IfEnd} //not Admin AND not Monitorings

end.