unit ItsLAW;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ������: "w:/common/components/TFWTest/ItsLAW.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<TestResults::Class>> Shared Delphi Tests::TFW::ItsLAW
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

interface

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  Classes
  {$If defined(nsTest) AND not defined(NotTunedDUnit)}
  ,
  KTestRunner
  {$IfEnd} //nsTest AND not NotTunedDUnit
  
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}
type
 TItsLAW = class(TTestResultsPlace)
 public
 // realized methods
   {$If defined(nsTest) AND not defined(NotTunedDUnit)}
   class function CommandLineKey: AnsiString; override;
     {* ���� ��������� ������ ��� �������� �������� ����� ������� ������ ����� ������������ ����������� }
   {$IfEnd} //nsTest AND not NotTunedDUnit
   {$If defined(nsTest) AND not defined(NotTunedDUnit)}
   class function TimesPage: Integer; override;
     {* �������� ��� ������ ������� ������� }
   {$IfEnd} //nsTest AND not NotTunedDUnit
   {$If defined(nsTest) AND not defined(NotTunedDUnit)}
   class function ResultsPage: Integer; override;
     {* �������� ��� ������ ����������� ������ }
   {$IfEnd} //nsTest AND not NotTunedDUnit
 protected
 // overridden protected methods
   {$If defined(nsTest) AND not defined(NotTunedDUnit)}
   class function IsLAW: Boolean; override;
   {$IfEnd} //nsTest AND not NotTunedDUnit
 end;//TItsLAW
{$IfEnd} //nsTest AND not NoScripts

implementation

{$If defined(nsTest) AND not defined(NoScripts)}

// start class TItsLAW

{$If defined(nsTest) AND not defined(NotTunedDUnit)}
class function TItsLAW.CommandLineKey: AnsiString;
 {-}
begin
 Result := '-ItsLAW';
end;//TItsLAW.CommandLineKey
{$IfEnd} //nsTest AND not NotTunedDUnit

{$If defined(nsTest) AND not defined(NotTunedDUnit)}
class function TItsLAW.TimesPage: Integer;
//#UC START# *4B7C0B43005B_4CA0B4860072_var*
//#UC END# *4B7C0B43005B_4CA0B4860072_var*
begin
//#UC START# *4B7C0B43005B_4CA0B4860072_impl*
 Result := 235059738;
//#UC END# *4B7C0B43005B_4CA0B4860072_impl*
end;//TItsLAW.TimesPage
{$IfEnd} //nsTest AND not NotTunedDUnit

{$If defined(nsTest) AND not defined(NotTunedDUnit)}
class function TItsLAW.ResultsPage: Integer;
//#UC START# *4B7C0B670215_4CA0B4860072_var*
//#UC END# *4B7C0B670215_4CA0B4860072_var*
begin
//#UC START# *4B7C0B670215_4CA0B4860072_impl*
 Result := 235059736;
//#UC END# *4B7C0B670215_4CA0B4860072_impl*
end;//TItsLAW.ResultsPage
{$IfEnd} //nsTest AND not NotTunedDUnit

{$If defined(nsTest) AND not defined(NotTunedDUnit)}
class function TItsLAW.IsLAW: Boolean;
//#UC START# *4C35A6DA02E9_4CA0B4860072_var*
//#UC END# *4C35A6DA02E9_4CA0B4860072_var*
begin
//#UC START# *4C35A6DA02E9_4CA0B4860072_impl*
 Result := true;
//#UC END# *4C35A6DA02E9_4CA0B4860072_impl*
end;//TItsLAW.IsLAW
{$IfEnd} //nsTest AND not NotTunedDUnit

{$IfEnd} //nsTest AND not NoScripts

end.