unit K585129079_NSRC_EAST_EUROPE;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "DailyTest"
// ������: "w:/common/components/rtl/Garant/Daily/K585129079_NSRC_EAST_EUROPE.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<TestCase::Class>> Shared Delphi Tests::DailyTest::7.11::K585129079_NSRC_EAST_EUROPE
//
// {RequestLink:585129079}
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\Daily\TestDefine.inc.pas}

interface

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  EVDtoBothNSRCWriterTest
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}
type
 TK585129079_NSRC_EAST_EUROPE = class(TEVDtoBothNSRCWriterTest)
  {* [RequestLink:585129079] }
 protected
 // overridden protected methods
   function NSRCCodePage: Integer; override;
     {* ��������� ��� ������� � NSRC }
   function GetFolder: AnsiString; override;
     {* ����� � ������� ������ ���� }
   function GetModelElementGUID: AnsiString; override;
     {* ������������� �������� ������, ������� ��������� ���� }
   function PainterCodePage: Integer; override;
 end;//TK585129079_NSRC_EAST_EUROPE
{$IfEnd} //nsTest AND not NoScripts

implementation

{$If defined(nsTest) AND not defined(NoScripts)}
uses
  l3Chars,
  TestFrameWork
  ;
{$IfEnd} //nsTest AND not NoScripts

{$If defined(nsTest) AND not defined(NoScripts)}

// start class TK585129079_NSRC_EAST_EUROPE

function TK585129079_NSRC_EAST_EUROPE.NSRCCodePage: Integer;
//#UC START# *4BEBCEA00177_5491B03300A0_var*
//#UC END# *4BEBCEA00177_5491B03300A0_var*
begin
//#UC START# *4BEBCEA00177_5491B03300A0_impl*
 Result := CP_EastEurope;
//#UC END# *4BEBCEA00177_5491B03300A0_impl*
end;//TK585129079_NSRC_EAST_EUROPE.NSRCCodePage

function TK585129079_NSRC_EAST_EUROPE.GetFolder: AnsiString;
 {-}
begin
 Result := '7.11';
end;//TK585129079_NSRC_EAST_EUROPE.GetFolder

function TK585129079_NSRC_EAST_EUROPE.GetModelElementGUID: AnsiString;
 {-}
begin
 Result := '5491B03300A0';
end;//TK585129079_NSRC_EAST_EUROPE.GetModelElementGUID

function TK585129079_NSRC_EAST_EUROPE.PainterCodePage: Integer;
//#UC START# *5491B011031B_5491B03300A0_var*
//#UC END# *5491B011031B_5491B03300A0_var*
begin
//#UC START# *5491B011031B_5491B03300A0_impl*
 Result := NSRCCodePage;
//#UC END# *5491B011031B_5491B03300A0_impl*
end;//TK585129079_NSRC_EAST_EUROPE.PainterCodePage

{$IfEnd} //nsTest AND not NoScripts

initialization
 TestFramework.RegisterTest(TK585129079_NSRC_EAST_EUROPE.Suite);

end.