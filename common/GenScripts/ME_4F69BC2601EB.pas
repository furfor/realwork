unit kwVcmDispatcherEndOp;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmDispatcherEndOp.pas"
// ���������: "ScriptKeyword"

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3IntfUses
 , tfwRegisterableWord
 , tfwScriptingInterfaces
;

type
 _VCMWord_Parent_ = TtfwRegisterableWord;
 {$Include w:\common\components\gui\Garant\VCM\implementation\Scripting\VCMWord.imp.pas}
 TkwVcmDispatcherEndOp = {final} class(_VCMWord_)
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmDispatcherEndOp
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

implementation

{$If NOT Defined(NoScripts) AND NOT Defined(NoVCM)}
uses
 l3ImplUses
 , vcmForm
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , StdRes
 , vcmBase
 , afwAnswer
;

{$Include w:\common\components\gui\Garant\VCM\implementation\Scripting\VCMWord.imp.pas}

procedure TkwVcmDispatcherEndOp.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F69BC2601EB_var*
//#UC END# *4DAEEDE10285_4F69BC2601EB_var*
begin
//#UC START# *4DAEEDE10285_4F69BC2601EB_impl*
 vcmDispatcher.EndOp;
//#UC END# *4DAEEDE10285_4F69BC2601EB_impl*
end;//TkwVcmDispatcherEndOp.DoDoIt

class function TkwVcmDispatcherEndOp.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:Dispatcher:EndOp';
end;//TkwVcmDispatcherEndOp.GetWordNameForRegister

initialization
 TkwVcmDispatcherEndOp.RegisterInEngine;
 {* ����������� vcm_Dispatcher_EndOp }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

end.
