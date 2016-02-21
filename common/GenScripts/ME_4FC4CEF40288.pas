unit kwVcmHistoryGetForwardCount;

// ������: "w:\common\components\gui\Garant\VCM\implementation\Scripting\kwVcmHistoryGetForwardCount.pas"
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
 TkwVcmHistoryGetForwardCount = {final} class(_VCMWord_)
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwVcmHistoryGetForwardCount
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

procedure TkwVcmHistoryGetForwardCount.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FC4CEF40288_var*
//#UC END# *4DAEEDE10285_4FC4CEF40288_var*
begin
//#UC START# *4DAEEDE10285_4FC4CEF40288_impl*
 aCtx.rEngine.PushInt(vcmDispatcher.History.GetForwardCount);
//#UC END# *4DAEEDE10285_4FC4CEF40288_impl*
end;//TkwVcmHistoryGetForwardCount.DoDoIt

class function TkwVcmHistoryGetForwardCount.GetWordNameForRegister: AnsiString;
begin
 Result := 'vcm:History:GetForwardCount';
end;//TkwVcmHistoryGetForwardCount.GetWordNameForRegister

initialization
 TkwVcmHistoryGetForwardCount.RegisterInEngine;
 {* ����������� vcm_History_GetForwardCount }
{$IfEnd} // NOT Defined(NoScripts) AND NOT Defined(NoVCM)

end.
