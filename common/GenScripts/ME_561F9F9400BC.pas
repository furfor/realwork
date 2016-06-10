unit TtfwClassRef_Proxy;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\TtfwClassRef_Proxy.pas"
// ���������: "ClassProxy"
// ������� ������: "TtfwClassRef" MUID: (561F9F9400BC)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 //#UC START# *561F9F9400BCintf_uses*
 {$IfNDef NoScripts}
 //, tfwClassRef
 {$EndIf  NoScripts}
 //#UC END# *561F9F9400BCintf_uses*
;

//#UC START# *561F9F9400BCintf_code*

{$IfNDef NoScripts}
type
 TtfwClassRef = class
  public
   class procedure Register(aClass: TClass);
 end;//TtfwClassRef
 //TtfwClassRef = tfwClassRef.TtfwClassRef;
{$EndIf  NoScripts}

//#UC END# *561F9F9400BCintf_code*
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 //#UC START# *561F9F9400BCimpl_uses*
 , tfwClassesForRegister
 //#UC END# *561F9F9400BCimpl_uses*
;

//#UC START# *561F9F9400BCimpl_code*
class procedure TtfwClassRef.Register(aClass: TClass);
begin
 TtfwClassesForRegister.RegisterClass(aClass);
end;
//#UC END# *561F9F9400BCimpl_code*
{$IfEnd} // NOT Defined(NoScripts)

end.
