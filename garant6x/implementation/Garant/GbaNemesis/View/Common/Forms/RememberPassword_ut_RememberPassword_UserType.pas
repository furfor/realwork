unit RememberPassword_ut_RememberPassword_UserType;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Common/Forms/RememberPassword_ut_RememberPassword_UserType.pas"
// �����: 24.08.2009 20:35
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<UserType::Class>> F1 Core::Common::View::Common::PrimF1Common::RememberPassword::ut_RememberPassword
//
// ������ ������?
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
  vcmUserControls
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoScripts)}
  ,
  tfwInteger
  {$IfEnd} //not NoScripts
  
  ;

const
    { ��������� ��� ���� ����� ut_RememberPassword }
   ut_RememberPasswordName = 'ut_RememberPassword';
    { ��������� ������������� ����������������� ���� "������ ������?" }
   ut_RememberPassword = TvcmUserType(0);
    { ������ ������? }
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
{$If not defined(Admin) AND not defined(Monitorings) AND not defined(NoScripts)}
type
   Tkw_FormUserType_ut_RememberPassword = {final scriptword} class(TtfwInteger)
    {* ����� ������� ��� ���� ����� ut_RememberPassword }
   protected
   // overridden protected methods
   class function GetWordNameForRegister: AnsiString; override;
   function GetInteger: Integer; override;
   end;//Tkw_FormUserType_ut_RememberPassword
{$IfEnd} //not Admin AND not Monitorings AND not NoScripts

{$If not defined(Admin) AND not defined(Monitorings) AND not defined(NoScripts)}

// start class Tkw_FormUserType_ut_RememberPassword

class function Tkw_FormUserType_ut_RememberPassword.GetWordNameForRegister: AnsiString;
 {-}
begin
 Result := '���_�����::ut_RememberPassword';
end;//Tkw_FormUserType_ut_RememberPassword.GetWordNameForRegister

function Tkw_FormUserType_ut_RememberPassword.GetInteger: Integer;
 {-}
begin
 Result := ut_RememberPassword;
end;//Tkw_FormUserType_ut_RememberPassword.GetInteger

{$IfEnd} //not Admin AND not Monitorings AND not NoScripts
{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings) AND not defined(NoScripts)}
// ����������� Tkw_FormUserType_ut_RememberPassword
 Tkw_FormUserType_ut_RememberPassword.RegisterInEngine;
{$IfEnd} //not Admin AND not Monitorings AND not NoScripts

end.