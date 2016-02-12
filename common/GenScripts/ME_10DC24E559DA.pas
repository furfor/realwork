unit RegistrationFormKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� RegistrationForm }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Common\RegistrationFormKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , PrimF1Common_Module
 , vtPanel
 , vtLabel
 {$If Defined(Nemesis)}
 , nscComboBox
 {$IfEnd} // Defined(Nemesis)
 , vtCheckBox
 , vtGroupBox
 {$If NOT Defined(NoVCL)}
 , ExtCtrls
 {$IfEnd} // NOT Defined(NoVCL)
 , ElPopBtn
 , vtFocusLabel
 , tfwControlString
 {$If NOT Defined(NoVCL)}
 , kwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwScriptingInterfaces
 , tfwPropertyLike
 , tfwTypeInfo
 , TypInfo
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , TtfwClassRef_Proxy
 , SysUtils
;

type
 Tkw_Form_RegistrationForm = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� RegistrationForm
----
*������ �������������*:
[code]
'aControl' �����::RegistrationForm TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
 end;//Tkw_Form_RegistrationForm

 Tkw_RegistrationForm_Control_pnMainData = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� pnMainData
----
*������ �������������*:
[code]
�������::pnMainData TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_pnMainData

 Tkw_RegistrationForm_Control_pnMainData_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� pnMainData
----
*������ �������������*:
[code]
�������::pnMainData:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_pnMainData_Push

 Tkw_RegistrationForm_Control_UserNameLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� UserNameLabel
----
*������ �������������*:
[code]
�������::UserNameLabel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_UserNameLabel

 Tkw_RegistrationForm_Control_UserNameLabel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� UserNameLabel
----
*������ �������������*:
[code]
�������::UserNameLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_UserNameLabel_Push

 Tkw_RegistrationForm_Control_PasswordLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� PasswordLabel
----
*������ �������������*:
[code]
�������::PasswordLabel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_PasswordLabel

 Tkw_RegistrationForm_Control_PasswordLabel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� PasswordLabel
----
*������ �������������*:
[code]
�������::PasswordLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_PasswordLabel_Push

 Tkw_RegistrationForm_Control_LoginLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� LoginLabel
----
*������ �������������*:
[code]
�������::LoginLabel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_LoginLabel

 Tkw_RegistrationForm_Control_LoginLabel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� LoginLabel
----
*������ �������������*:
[code]
�������::LoginLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_LoginLabel_Push

 Tkw_RegistrationForm_Control_InfoLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� InfoLabel
----
*������ �������������*:
[code]
�������::InfoLabel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_InfoLabel

 Tkw_RegistrationForm_Control_InfoLabel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� InfoLabel
----
*������ �������������*:
[code]
�������::InfoLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_InfoLabel_Push

 Tkw_RegistrationForm_Control_EMailLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� EMailLabel
----
*������ �������������*:
[code]
�������::EMailLabel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_EMailLabel

 Tkw_RegistrationForm_Control_EMailLabel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� EMailLabel
----
*������ �������������*:
[code]
�������::EMailLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_EMailLabel_Push

 Tkw_RegistrationForm_Control_ConfirmPasswordLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ConfirmPasswordLabel
----
*������ �������������*:
[code]
�������::ConfirmPasswordLabel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_ConfirmPasswordLabel

 Tkw_RegistrationForm_Control_ConfirmPasswordLabel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� ConfirmPasswordLabel
----
*������ �������������*:
[code]
�������::ConfirmPasswordLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_ConfirmPasswordLabel_Push

 Tkw_RegistrationForm_Control_vtAsteriskLabelLogin = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� vtAsteriskLabelLogin
----
*������ �������������*:
[code]
�������::vtAsteriskLabelLogin TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_vtAsteriskLabelLogin

 Tkw_RegistrationForm_Control_vtAsteriskLabelLogin_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� vtAsteriskLabelLogin
----
*������ �������������*:
[code]
�������::vtAsteriskLabelLogin:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_vtAsteriskLabelLogin_Push

 Tkw_RegistrationForm_Control_vtAsteriskLabelFIO = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� vtAsteriskLabelFIO
----
*������ �������������*:
[code]
�������::vtAsteriskLabelFIO TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_vtAsteriskLabelFIO

 Tkw_RegistrationForm_Control_vtAsteriskLabelFIO_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� vtAsteriskLabelFIO
----
*������ �������������*:
[code]
�������::vtAsteriskLabelFIO:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_vtAsteriskLabelFIO_Push

 Tkw_RegistrationForm_Control_edPassword = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� edPassword
----
*������ �������������*:
[code]
�������::edPassword TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_edPassword

 Tkw_RegistrationForm_Control_edPassword_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� edPassword
----
*������ �������������*:
[code]
�������::edPassword:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_edPassword_Push

 Tkw_RegistrationForm_Control_edUserName = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� edUserName
----
*������ �������������*:
[code]
�������::edUserName TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_edUserName

 Tkw_RegistrationForm_Control_edUserName_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� edUserName
----
*������ �������������*:
[code]
�������::edUserName:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_edUserName_Push

 Tkw_RegistrationForm_Control_edLogin = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� edLogin
----
*������ �������������*:
[code]
�������::edLogin TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_edLogin

 Tkw_RegistrationForm_Control_edLogin_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� edLogin
----
*������ �������������*:
[code]
�������::edLogin:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_edLogin_Push

 Tkw_RegistrationForm_Control_edEmail = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� edEmail
----
*������ �������������*:
[code]
�������::edEmail TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_edEmail

 Tkw_RegistrationForm_Control_edEmail_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� edEmail
----
*������ �������������*:
[code]
�������::edEmail:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_edEmail_Push

 Tkw_RegistrationForm_Control_edConfirm = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� edConfirm
----
*������ �������������*:
[code]
�������::edConfirm TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_edConfirm

 Tkw_RegistrationForm_Control_edConfirm_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� edConfirm
----
*������ �������������*:
[code]
�������::edConfirm:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_edConfirm_Push

 Tkw_RegistrationForm_Control_cbAutoLogin = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� cbAutoLogin
----
*������ �������������*:
[code]
�������::cbAutoLogin TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_cbAutoLogin

 Tkw_RegistrationForm_Control_cbAutoLogin_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� cbAutoLogin
----
*������ �������������*:
[code]
�������::cbAutoLogin:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_cbAutoLogin_Push

 Tkw_RegistrationForm_Control_NewUserGroupBox = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� NewUserGroupBox
----
*������ �������������*:
[code]
�������::NewUserGroupBox TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_NewUserGroupBox

 Tkw_RegistrationForm_Control_NewUserGroupBox_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� NewUserGroupBox
----
*������ �������������*:
[code]
�������::NewUserGroupBox:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_NewUserGroupBox_Push

 Tkw_RegistrationForm_Control_NewUserLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� NewUserLabel
----
*������ �������������*:
[code]
�������::NewUserLabel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_NewUserLabel

 Tkw_RegistrationForm_Control_NewUserLabel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� NewUserLabel
----
*������ �������������*:
[code]
�������::NewUserLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_NewUserLabel_Push

 Tkw_RegistrationForm_Control_NewUserPaintBox = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� NewUserPaintBox
----
*������ �������������*:
[code]
�������::NewUserPaintBox TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_NewUserPaintBox

 Tkw_RegistrationForm_Control_NewUserPaintBox_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� NewUserPaintBox
----
*������ �������������*:
[code]
�������::NewUserPaintBox:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_NewUserPaintBox_Push

 Tkw_RegistrationForm_Control_BottomPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� BottomPanel
----
*������ �������������*:
[code]
�������::BottomPanel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_BottomPanel

 Tkw_RegistrationForm_Control_BottomPanel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� BottomPanel
----
*������ �������������*:
[code]
�������::BottomPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_BottomPanel_Push

 Tkw_RegistrationForm_Control_RegisterButton = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� RegisterButton
----
*������ �������������*:
[code]
�������::RegisterButton TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_RegisterButton

 Tkw_RegistrationForm_Control_RegisterButton_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� RegisterButton
----
*������ �������������*:
[code]
�������::RegisterButton:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_RegisterButton_Push

 Tkw_RegistrationForm_Control_HelpPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� HelpPanel
----
*������ �������������*:
[code]
�������::HelpPanel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_HelpPanel

 Tkw_RegistrationForm_Control_HelpPanel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� HelpPanel
----
*������ �������������*:
[code]
�������::HelpPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_HelpPanel_Push

 Tkw_RegistrationForm_Control_HelpPaintBox = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� HelpPaintBox
----
*������ �������������*:
[code]
�������::HelpPaintBox TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_HelpPaintBox

 Tkw_RegistrationForm_Control_HelpPaintBox_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� HelpPaintBox
----
*������ �������������*:
[code]
�������::HelpPaintBox:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_HelpPaintBox_Push

 Tkw_RegistrationForm_Control_HelpLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� HelpLabel
----
*������ �������������*:
[code]
�������::HelpLabel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_RegistrationForm_Control_HelpLabel

 Tkw_RegistrationForm_Control_HelpLabel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� HelpLabel
----
*������ �������������*:
[code]
�������::HelpLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_RegistrationForm_Control_HelpLabel_Push

 TkwRegistrationFormPnMainData = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.pnMainData
[panel]������� pnMainData ����� TnsRegistrationForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aRegistrationForm .TnsRegistrationForm.pnMainData >>> l_TvtPanel
[code]  }
  private
   function pnMainData(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtPanel;
    {* ���������� ����� ������� .TnsRegistrationForm.pnMainData }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormPnMainData

 TkwRegistrationFormUserNameLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.UserNameLabel
[panel]������� UserNameLabel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aRegistrationForm .TnsRegistrationForm.UserNameLabel >>> l_TvtLabel
[code]  }
  private
   function UserNameLabel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.UserNameLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormUserNameLabel

 TkwRegistrationFormPasswordLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.PasswordLabel
[panel]������� PasswordLabel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aRegistrationForm .TnsRegistrationForm.PasswordLabel >>> l_TvtLabel
[code]  }
  private
   function PasswordLabel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.PasswordLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormPasswordLabel

 TkwRegistrationFormLoginLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.LoginLabel
[panel]������� LoginLabel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aRegistrationForm .TnsRegistrationForm.LoginLabel >>> l_TvtLabel
[code]  }
  private
   function LoginLabel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.LoginLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormLoginLabel

 TkwRegistrationFormInfoLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.InfoLabel
[panel]������� InfoLabel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aRegistrationForm .TnsRegistrationForm.InfoLabel >>> l_TvtLabel
[code]  }
  private
   function InfoLabel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.InfoLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormInfoLabel

 TkwRegistrationFormEMailLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.EMailLabel
[panel]������� EMailLabel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aRegistrationForm .TnsRegistrationForm.EMailLabel >>> l_TvtLabel
[code]  }
  private
   function EMailLabel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.EMailLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormEMailLabel

 TkwRegistrationFormConfirmPasswordLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.ConfirmPasswordLabel
[panel]������� ConfirmPasswordLabel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aRegistrationForm .TnsRegistrationForm.ConfirmPasswordLabel >>> l_TvtLabel
[code]  }
  private
   function ConfirmPasswordLabel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.ConfirmPasswordLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormConfirmPasswordLabel

 TkwRegistrationFormVtAsteriskLabelLogin = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.vtAsteriskLabelLogin
[panel]������� vtAsteriskLabelLogin ����� TnsRegistrationForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aRegistrationForm .TnsRegistrationForm.vtAsteriskLabelLogin >>> l_TvtLabel
[code]  }
  private
   function vtAsteriskLabelLogin(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.vtAsteriskLabelLogin }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormVtAsteriskLabelLogin

 TkwRegistrationFormVtAsteriskLabelFIO = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.vtAsteriskLabelFIO
[panel]������� vtAsteriskLabelFIO ����� TnsRegistrationForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aRegistrationForm .TnsRegistrationForm.vtAsteriskLabelFIO >>> l_TvtLabel
[code]  }
  private
   function vtAsteriskLabelFIO(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.vtAsteriskLabelFIO }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormVtAsteriskLabelFIO

 TkwRegistrationFormEdPassword = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.edPassword
[panel]������� edPassword ����� TnsRegistrationForm[panel]
*��� ����������:* TnscComboBoxWithPwdChar
*������:*
[code]
OBJECT VAR l_TnscComboBoxWithPwdChar
 aRegistrationForm .TnsRegistrationForm.edPassword >>> l_TnscComboBoxWithPwdChar
[code]  }
  private
   function edPassword(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TnscComboBoxWithPwdChar;
    {* ���������� ����� ������� .TnsRegistrationForm.edPassword }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormEdPassword

 TkwRegistrationFormEdUserName = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.edUserName
[panel]������� edUserName ����� TnsRegistrationForm[panel]
*��� ����������:* TnscEdit
*������:*
[code]
OBJECT VAR l_TnscEdit
 aRegistrationForm .TnsRegistrationForm.edUserName >>> l_TnscEdit
[code]  }
  private
   function edUserName(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TnscEdit;
    {* ���������� ����� ������� .TnsRegistrationForm.edUserName }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormEdUserName

 TkwRegistrationFormEdLogin = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.edLogin
[panel]������� edLogin ����� TnsRegistrationForm[panel]
*��� ����������:* TnscEdit
*������:*
[code]
OBJECT VAR l_TnscEdit
 aRegistrationForm .TnsRegistrationForm.edLogin >>> l_TnscEdit
[code]  }
  private
   function edLogin(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TnscEdit;
    {* ���������� ����� ������� .TnsRegistrationForm.edLogin }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormEdLogin

 TkwRegistrationFormEdEmail = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.edEmail
[panel]������� edEmail ����� TnsRegistrationForm[panel]
*��� ����������:* TnscEdit
*������:*
[code]
OBJECT VAR l_TnscEdit
 aRegistrationForm .TnsRegistrationForm.edEmail >>> l_TnscEdit
[code]  }
  private
   function edEmail(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TnscEdit;
    {* ���������� ����� ������� .TnsRegistrationForm.edEmail }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormEdEmail

 TkwRegistrationFormEdConfirm = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.edConfirm
[panel]������� edConfirm ����� TnsRegistrationForm[panel]
*��� ����������:* TnscComboBoxWithPwdChar
*������:*
[code]
OBJECT VAR l_TnscComboBoxWithPwdChar
 aRegistrationForm .TnsRegistrationForm.edConfirm >>> l_TnscComboBoxWithPwdChar
[code]  }
  private
   function edConfirm(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TnscComboBoxWithPwdChar;
    {* ���������� ����� ������� .TnsRegistrationForm.edConfirm }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormEdConfirm

 TkwRegistrationFormCbAutoLogin = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.cbAutoLogin
[panel]������� cbAutoLogin ����� TnsRegistrationForm[panel]
*��� ����������:* TvtCheckBox
*������:*
[code]
OBJECT VAR l_TvtCheckBox
 aRegistrationForm .TnsRegistrationForm.cbAutoLogin >>> l_TvtCheckBox
[code]  }
  private
   function cbAutoLogin(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtCheckBox;
    {* ���������� ����� ������� .TnsRegistrationForm.cbAutoLogin }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormCbAutoLogin

 TkwRegistrationFormNewUserGroupBox = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.NewUserGroupBox
[panel]������� NewUserGroupBox ����� TnsRegistrationForm[panel]
*��� ����������:* TvtGroupBox
*������:*
[code]
OBJECT VAR l_TvtGroupBox
 aRegistrationForm .TnsRegistrationForm.NewUserGroupBox >>> l_TvtGroupBox
[code]  }
  private
   function NewUserGroupBox(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtGroupBox;
    {* ���������� ����� ������� .TnsRegistrationForm.NewUserGroupBox }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormNewUserGroupBox

 TkwRegistrationFormNewUserLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.NewUserLabel
[panel]������� NewUserLabel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aRegistrationForm .TnsRegistrationForm.NewUserLabel >>> l_TvtLabel
[code]  }
  private
   function NewUserLabel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.NewUserLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormNewUserLabel

 TkwRegistrationFormNewUserPaintBox = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.NewUserPaintBox
[panel]������� NewUserPaintBox ����� TnsRegistrationForm[panel]
*��� ����������:* TPaintBox
*������:*
[code]
OBJECT VAR l_TPaintBox
 aRegistrationForm .TnsRegistrationForm.NewUserPaintBox >>> l_TPaintBox
[code]  }
  private
   function NewUserPaintBox(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TPaintBox;
    {* ���������� ����� ������� .TnsRegistrationForm.NewUserPaintBox }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormNewUserPaintBox

 TkwRegistrationFormBottomPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.BottomPanel
[panel]������� BottomPanel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aRegistrationForm .TnsRegistrationForm.BottomPanel >>> l_TvtPanel
[code]  }
  private
   function BottomPanel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtPanel;
    {* ���������� ����� ������� .TnsRegistrationForm.BottomPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormBottomPanel

 TkwRegistrationFormRegisterButton = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.RegisterButton
[panel]������� RegisterButton ����� TnsRegistrationForm[panel]
*��� ����������:* TElPopupButton
*������:*
[code]
OBJECT VAR l_TElPopupButton
 aRegistrationForm .TnsRegistrationForm.RegisterButton >>> l_TElPopupButton
[code]  }
  private
   function RegisterButton(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TElPopupButton;
    {* ���������� ����� ������� .TnsRegistrationForm.RegisterButton }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormRegisterButton

 TkwRegistrationFormHelpPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.HelpPanel
[panel]������� HelpPanel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aRegistrationForm .TnsRegistrationForm.HelpPanel >>> l_TvtPanel
[code]  }
  private
   function HelpPanel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtPanel;
    {* ���������� ����� ������� .TnsRegistrationForm.HelpPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormHelpPanel

 TkwRegistrationFormHelpPaintBox = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.HelpPaintBox
[panel]������� HelpPaintBox ����� TnsRegistrationForm[panel]
*��� ����������:* TPaintBox
*������:*
[code]
OBJECT VAR l_TPaintBox
 aRegistrationForm .TnsRegistrationForm.HelpPaintBox >>> l_TPaintBox
[code]  }
  private
   function HelpPaintBox(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TPaintBox;
    {* ���������� ����� ������� .TnsRegistrationForm.HelpPaintBox }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormHelpPaintBox

 TkwRegistrationFormHelpLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TnsRegistrationForm.HelpLabel
[panel]������� HelpLabel ����� TnsRegistrationForm[panel]
*��� ����������:* TvtFocusLabel
*������:*
[code]
OBJECT VAR l_TvtFocusLabel
 aRegistrationForm .TnsRegistrationForm.HelpLabel >>> l_TvtFocusLabel
[code]  }
  private
   function HelpLabel(const aCtx: TtfwContext;
    aRegistrationForm: TnsRegistrationForm): TvtFocusLabel;
    {* ���������� ����� ������� .TnsRegistrationForm.HelpLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwRegistrationFormHelpLabel

class function Tkw_Form_RegistrationForm.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::RegistrationForm';
end;//Tkw_Form_RegistrationForm.GetWordNameForRegister

function Tkw_Form_RegistrationForm.GetString: AnsiString;
begin
 Result := 'nsRegistrationForm';
end;//Tkw_Form_RegistrationForm.GetString

class function Tkw_RegistrationForm_Control_pnMainData.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pnMainData';
end;//Tkw_RegistrationForm_Control_pnMainData.GetWordNameForRegister

function Tkw_RegistrationForm_Control_pnMainData.GetString: AnsiString;
begin
 Result := 'pnMainData';
end;//Tkw_RegistrationForm_Control_pnMainData.GetString

class procedure Tkw_RegistrationForm_Control_pnMainData.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_RegistrationForm_Control_pnMainData.RegisterInEngine

procedure Tkw_RegistrationForm_Control_pnMainData_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_BF93ABA40AE4_var*
//#UC END# *4DAEEDE10285_BF93ABA40AE4_var*
begin
//#UC START# *4DAEEDE10285_BF93ABA40AE4_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_BF93ABA40AE4_impl*
end;//Tkw_RegistrationForm_Control_pnMainData_Push.DoDoIt

class function Tkw_RegistrationForm_Control_pnMainData_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pnMainData:push';
end;//Tkw_RegistrationForm_Control_pnMainData_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_UserNameLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::UserNameLabel';
end;//Tkw_RegistrationForm_Control_UserNameLabel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_UserNameLabel.GetString: AnsiString;
begin
 Result := 'UserNameLabel';
end;//Tkw_RegistrationForm_Control_UserNameLabel.GetString

class procedure Tkw_RegistrationForm_Control_UserNameLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_RegistrationForm_Control_UserNameLabel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_UserNameLabel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_307861420D0E_var*
//#UC END# *4DAEEDE10285_307861420D0E_var*
begin
//#UC START# *4DAEEDE10285_307861420D0E_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_307861420D0E_impl*
end;//Tkw_RegistrationForm_Control_UserNameLabel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_UserNameLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::UserNameLabel:push';
end;//Tkw_RegistrationForm_Control_UserNameLabel_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_PasswordLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::PasswordLabel';
end;//Tkw_RegistrationForm_Control_PasswordLabel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_PasswordLabel.GetString: AnsiString;
begin
 Result := 'PasswordLabel';
end;//Tkw_RegistrationForm_Control_PasswordLabel.GetString

class procedure Tkw_RegistrationForm_Control_PasswordLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_RegistrationForm_Control_PasswordLabel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_PasswordLabel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_EF294F04D4E3_var*
//#UC END# *4DAEEDE10285_EF294F04D4E3_var*
begin
//#UC START# *4DAEEDE10285_EF294F04D4E3_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_EF294F04D4E3_impl*
end;//Tkw_RegistrationForm_Control_PasswordLabel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_PasswordLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::PasswordLabel:push';
end;//Tkw_RegistrationForm_Control_PasswordLabel_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_LoginLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::LoginLabel';
end;//Tkw_RegistrationForm_Control_LoginLabel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_LoginLabel.GetString: AnsiString;
begin
 Result := 'LoginLabel';
end;//Tkw_RegistrationForm_Control_LoginLabel.GetString

class procedure Tkw_RegistrationForm_Control_LoginLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_RegistrationForm_Control_LoginLabel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_LoginLabel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_BBA4CB46A12E_var*
//#UC END# *4DAEEDE10285_BBA4CB46A12E_var*
begin
//#UC START# *4DAEEDE10285_BBA4CB46A12E_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_BBA4CB46A12E_impl*
end;//Tkw_RegistrationForm_Control_LoginLabel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_LoginLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::LoginLabel:push';
end;//Tkw_RegistrationForm_Control_LoginLabel_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_InfoLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::InfoLabel';
end;//Tkw_RegistrationForm_Control_InfoLabel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_InfoLabel.GetString: AnsiString;
begin
 Result := 'InfoLabel';
end;//Tkw_RegistrationForm_Control_InfoLabel.GetString

class procedure Tkw_RegistrationForm_Control_InfoLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_RegistrationForm_Control_InfoLabel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_InfoLabel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_5F1B5B610219_var*
//#UC END# *4DAEEDE10285_5F1B5B610219_var*
begin
//#UC START# *4DAEEDE10285_5F1B5B610219_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_5F1B5B610219_impl*
end;//Tkw_RegistrationForm_Control_InfoLabel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_InfoLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::InfoLabel:push';
end;//Tkw_RegistrationForm_Control_InfoLabel_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_EMailLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::EMailLabel';
end;//Tkw_RegistrationForm_Control_EMailLabel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_EMailLabel.GetString: AnsiString;
begin
 Result := 'EMailLabel';
end;//Tkw_RegistrationForm_Control_EMailLabel.GetString

class procedure Tkw_RegistrationForm_Control_EMailLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_RegistrationForm_Control_EMailLabel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_EMailLabel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_89EDBF147427_var*
//#UC END# *4DAEEDE10285_89EDBF147427_var*
begin
//#UC START# *4DAEEDE10285_89EDBF147427_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_89EDBF147427_impl*
end;//Tkw_RegistrationForm_Control_EMailLabel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_EMailLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::EMailLabel:push';
end;//Tkw_RegistrationForm_Control_EMailLabel_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_ConfirmPasswordLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ConfirmPasswordLabel';
end;//Tkw_RegistrationForm_Control_ConfirmPasswordLabel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_ConfirmPasswordLabel.GetString: AnsiString;
begin
 Result := 'ConfirmPasswordLabel';
end;//Tkw_RegistrationForm_Control_ConfirmPasswordLabel.GetString

class procedure Tkw_RegistrationForm_Control_ConfirmPasswordLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_RegistrationForm_Control_ConfirmPasswordLabel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_ConfirmPasswordLabel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_28C6F3B14CE3_var*
//#UC END# *4DAEEDE10285_28C6F3B14CE3_var*
begin
//#UC START# *4DAEEDE10285_28C6F3B14CE3_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_28C6F3B14CE3_impl*
end;//Tkw_RegistrationForm_Control_ConfirmPasswordLabel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_ConfirmPasswordLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ConfirmPasswordLabel:push';
end;//Tkw_RegistrationForm_Control_ConfirmPasswordLabel_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_vtAsteriskLabelLogin.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::vtAsteriskLabelLogin';
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelLogin.GetWordNameForRegister

function Tkw_RegistrationForm_Control_vtAsteriskLabelLogin.GetString: AnsiString;
begin
 Result := 'vtAsteriskLabelLogin';
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelLogin.GetString

class procedure Tkw_RegistrationForm_Control_vtAsteriskLabelLogin.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelLogin.RegisterInEngine

procedure Tkw_RegistrationForm_Control_vtAsteriskLabelLogin_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_839511C06B40_var*
//#UC END# *4DAEEDE10285_839511C06B40_var*
begin
//#UC START# *4DAEEDE10285_839511C06B40_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_839511C06B40_impl*
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelLogin_Push.DoDoIt

class function Tkw_RegistrationForm_Control_vtAsteriskLabelLogin_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::vtAsteriskLabelLogin:push';
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelLogin_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_vtAsteriskLabelFIO.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::vtAsteriskLabelFIO';
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelFIO.GetWordNameForRegister

function Tkw_RegistrationForm_Control_vtAsteriskLabelFIO.GetString: AnsiString;
begin
 Result := 'vtAsteriskLabelFIO';
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelFIO.GetString

class procedure Tkw_RegistrationForm_Control_vtAsteriskLabelFIO.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelFIO.RegisterInEngine

procedure Tkw_RegistrationForm_Control_vtAsteriskLabelFIO_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_BD4D84553E4F_var*
//#UC END# *4DAEEDE10285_BD4D84553E4F_var*
begin
//#UC START# *4DAEEDE10285_BD4D84553E4F_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_BD4D84553E4F_impl*
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelFIO_Push.DoDoIt

class function Tkw_RegistrationForm_Control_vtAsteriskLabelFIO_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::vtAsteriskLabelFIO:push';
end;//Tkw_RegistrationForm_Control_vtAsteriskLabelFIO_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_edPassword.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edPassword';
end;//Tkw_RegistrationForm_Control_edPassword.GetWordNameForRegister

function Tkw_RegistrationForm_Control_edPassword.GetString: AnsiString;
begin
 Result := 'edPassword';
end;//Tkw_RegistrationForm_Control_edPassword.GetString

class procedure Tkw_RegistrationForm_Control_edPassword.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscComboBoxWithPwdChar);
end;//Tkw_RegistrationForm_Control_edPassword.RegisterInEngine

procedure Tkw_RegistrationForm_Control_edPassword_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_2E546688D6C6_var*
//#UC END# *4DAEEDE10285_2E546688D6C6_var*
begin
//#UC START# *4DAEEDE10285_2E546688D6C6_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_2E546688D6C6_impl*
end;//Tkw_RegistrationForm_Control_edPassword_Push.DoDoIt

class function Tkw_RegistrationForm_Control_edPassword_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edPassword:push';
end;//Tkw_RegistrationForm_Control_edPassword_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_edUserName.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edUserName';
end;//Tkw_RegistrationForm_Control_edUserName.GetWordNameForRegister

function Tkw_RegistrationForm_Control_edUserName.GetString: AnsiString;
begin
 Result := 'edUserName';
end;//Tkw_RegistrationForm_Control_edUserName.GetString

class procedure Tkw_RegistrationForm_Control_edUserName.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEdit);
end;//Tkw_RegistrationForm_Control_edUserName.RegisterInEngine

procedure Tkw_RegistrationForm_Control_edUserName_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_54803F2922F1_var*
//#UC END# *4DAEEDE10285_54803F2922F1_var*
begin
//#UC START# *4DAEEDE10285_54803F2922F1_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_54803F2922F1_impl*
end;//Tkw_RegistrationForm_Control_edUserName_Push.DoDoIt

class function Tkw_RegistrationForm_Control_edUserName_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edUserName:push';
end;//Tkw_RegistrationForm_Control_edUserName_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_edLogin.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edLogin';
end;//Tkw_RegistrationForm_Control_edLogin.GetWordNameForRegister

function Tkw_RegistrationForm_Control_edLogin.GetString: AnsiString;
begin
 Result := 'edLogin';
end;//Tkw_RegistrationForm_Control_edLogin.GetString

class procedure Tkw_RegistrationForm_Control_edLogin.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEdit);
end;//Tkw_RegistrationForm_Control_edLogin.RegisterInEngine

procedure Tkw_RegistrationForm_Control_edLogin_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_04EFB5F58EE8_var*
//#UC END# *4DAEEDE10285_04EFB5F58EE8_var*
begin
//#UC START# *4DAEEDE10285_04EFB5F58EE8_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_04EFB5F58EE8_impl*
end;//Tkw_RegistrationForm_Control_edLogin_Push.DoDoIt

class function Tkw_RegistrationForm_Control_edLogin_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edLogin:push';
end;//Tkw_RegistrationForm_Control_edLogin_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_edEmail.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edEmail';
end;//Tkw_RegistrationForm_Control_edEmail.GetWordNameForRegister

function Tkw_RegistrationForm_Control_edEmail.GetString: AnsiString;
begin
 Result := 'edEmail';
end;//Tkw_RegistrationForm_Control_edEmail.GetString

class procedure Tkw_RegistrationForm_Control_edEmail.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEdit);
end;//Tkw_RegistrationForm_Control_edEmail.RegisterInEngine

procedure Tkw_RegistrationForm_Control_edEmail_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_EFF996524787_var*
//#UC END# *4DAEEDE10285_EFF996524787_var*
begin
//#UC START# *4DAEEDE10285_EFF996524787_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_EFF996524787_impl*
end;//Tkw_RegistrationForm_Control_edEmail_Push.DoDoIt

class function Tkw_RegistrationForm_Control_edEmail_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edEmail:push';
end;//Tkw_RegistrationForm_Control_edEmail_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_edConfirm.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edConfirm';
end;//Tkw_RegistrationForm_Control_edConfirm.GetWordNameForRegister

function Tkw_RegistrationForm_Control_edConfirm.GetString: AnsiString;
begin
 Result := 'edConfirm';
end;//Tkw_RegistrationForm_Control_edConfirm.GetString

class procedure Tkw_RegistrationForm_Control_edConfirm.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscComboBoxWithPwdChar);
end;//Tkw_RegistrationForm_Control_edConfirm.RegisterInEngine

procedure Tkw_RegistrationForm_Control_edConfirm_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_C7A4A80BB453_var*
//#UC END# *4DAEEDE10285_C7A4A80BB453_var*
begin
//#UC START# *4DAEEDE10285_C7A4A80BB453_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_C7A4A80BB453_impl*
end;//Tkw_RegistrationForm_Control_edConfirm_Push.DoDoIt

class function Tkw_RegistrationForm_Control_edConfirm_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::edConfirm:push';
end;//Tkw_RegistrationForm_Control_edConfirm_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_cbAutoLogin.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::cbAutoLogin';
end;//Tkw_RegistrationForm_Control_cbAutoLogin.GetWordNameForRegister

function Tkw_RegistrationForm_Control_cbAutoLogin.GetString: AnsiString;
begin
 Result := 'cbAutoLogin';
end;//Tkw_RegistrationForm_Control_cbAutoLogin.GetString

class procedure Tkw_RegistrationForm_Control_cbAutoLogin.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtCheckBox);
end;//Tkw_RegistrationForm_Control_cbAutoLogin.RegisterInEngine

procedure Tkw_RegistrationForm_Control_cbAutoLogin_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_53E8F7BA852C_var*
//#UC END# *4DAEEDE10285_53E8F7BA852C_var*
begin
//#UC START# *4DAEEDE10285_53E8F7BA852C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_53E8F7BA852C_impl*
end;//Tkw_RegistrationForm_Control_cbAutoLogin_Push.DoDoIt

class function Tkw_RegistrationForm_Control_cbAutoLogin_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::cbAutoLogin:push';
end;//Tkw_RegistrationForm_Control_cbAutoLogin_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_NewUserGroupBox.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::NewUserGroupBox';
end;//Tkw_RegistrationForm_Control_NewUserGroupBox.GetWordNameForRegister

function Tkw_RegistrationForm_Control_NewUserGroupBox.GetString: AnsiString;
begin
 Result := 'NewUserGroupBox';
end;//Tkw_RegistrationForm_Control_NewUserGroupBox.GetString

class procedure Tkw_RegistrationForm_Control_NewUserGroupBox.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtGroupBox);
end;//Tkw_RegistrationForm_Control_NewUserGroupBox.RegisterInEngine

procedure Tkw_RegistrationForm_Control_NewUserGroupBox_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4F8AF2CD9D8C_var*
//#UC END# *4DAEEDE10285_4F8AF2CD9D8C_var*
begin
//#UC START# *4DAEEDE10285_4F8AF2CD9D8C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_4F8AF2CD9D8C_impl*
end;//Tkw_RegistrationForm_Control_NewUserGroupBox_Push.DoDoIt

class function Tkw_RegistrationForm_Control_NewUserGroupBox_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::NewUserGroupBox:push';
end;//Tkw_RegistrationForm_Control_NewUserGroupBox_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_NewUserLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::NewUserLabel';
end;//Tkw_RegistrationForm_Control_NewUserLabel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_NewUserLabel.GetString: AnsiString;
begin
 Result := 'NewUserLabel';
end;//Tkw_RegistrationForm_Control_NewUserLabel.GetString

class procedure Tkw_RegistrationForm_Control_NewUserLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_RegistrationForm_Control_NewUserLabel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_NewUserLabel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_97C9ABF3EE22_var*
//#UC END# *4DAEEDE10285_97C9ABF3EE22_var*
begin
//#UC START# *4DAEEDE10285_97C9ABF3EE22_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_97C9ABF3EE22_impl*
end;//Tkw_RegistrationForm_Control_NewUserLabel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_NewUserLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::NewUserLabel:push';
end;//Tkw_RegistrationForm_Control_NewUserLabel_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_NewUserPaintBox.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::NewUserPaintBox';
end;//Tkw_RegistrationForm_Control_NewUserPaintBox.GetWordNameForRegister

function Tkw_RegistrationForm_Control_NewUserPaintBox.GetString: AnsiString;
begin
 Result := 'NewUserPaintBox';
end;//Tkw_RegistrationForm_Control_NewUserPaintBox.GetString

class procedure Tkw_RegistrationForm_Control_NewUserPaintBox.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TPaintBox);
end;//Tkw_RegistrationForm_Control_NewUserPaintBox.RegisterInEngine

procedure Tkw_RegistrationForm_Control_NewUserPaintBox_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_65DEB29F42FC_var*
//#UC END# *4DAEEDE10285_65DEB29F42FC_var*
begin
//#UC START# *4DAEEDE10285_65DEB29F42FC_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_65DEB29F42FC_impl*
end;//Tkw_RegistrationForm_Control_NewUserPaintBox_Push.DoDoIt

class function Tkw_RegistrationForm_Control_NewUserPaintBox_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::NewUserPaintBox:push';
end;//Tkw_RegistrationForm_Control_NewUserPaintBox_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_BottomPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BottomPanel';
end;//Tkw_RegistrationForm_Control_BottomPanel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_BottomPanel.GetString: AnsiString;
begin
 Result := 'BottomPanel';
end;//Tkw_RegistrationForm_Control_BottomPanel.GetString

class procedure Tkw_RegistrationForm_Control_BottomPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_RegistrationForm_Control_BottomPanel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_BottomPanel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_0EC1AD8D0844_var*
//#UC END# *4DAEEDE10285_0EC1AD8D0844_var*
begin
//#UC START# *4DAEEDE10285_0EC1AD8D0844_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_0EC1AD8D0844_impl*
end;//Tkw_RegistrationForm_Control_BottomPanel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_BottomPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BottomPanel:push';
end;//Tkw_RegistrationForm_Control_BottomPanel_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_RegisterButton.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::RegisterButton';
end;//Tkw_RegistrationForm_Control_RegisterButton.GetWordNameForRegister

function Tkw_RegistrationForm_Control_RegisterButton.GetString: AnsiString;
begin
 Result := 'RegisterButton';
end;//Tkw_RegistrationForm_Control_RegisterButton.GetString

class procedure Tkw_RegistrationForm_Control_RegisterButton.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TElPopupButton);
end;//Tkw_RegistrationForm_Control_RegisterButton.RegisterInEngine

procedure Tkw_RegistrationForm_Control_RegisterButton_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4BF8A75C2105_var*
//#UC END# *4DAEEDE10285_4BF8A75C2105_var*
begin
//#UC START# *4DAEEDE10285_4BF8A75C2105_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_4BF8A75C2105_impl*
end;//Tkw_RegistrationForm_Control_RegisterButton_Push.DoDoIt

class function Tkw_RegistrationForm_Control_RegisterButton_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::RegisterButton:push';
end;//Tkw_RegistrationForm_Control_RegisterButton_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_HelpPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::HelpPanel';
end;//Tkw_RegistrationForm_Control_HelpPanel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_HelpPanel.GetString: AnsiString;
begin
 Result := 'HelpPanel';
end;//Tkw_RegistrationForm_Control_HelpPanel.GetString

class procedure Tkw_RegistrationForm_Control_HelpPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_RegistrationForm_Control_HelpPanel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_HelpPanel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_BB80E5DF6E5C_var*
//#UC END# *4DAEEDE10285_BB80E5DF6E5C_var*
begin
//#UC START# *4DAEEDE10285_BB80E5DF6E5C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_BB80E5DF6E5C_impl*
end;//Tkw_RegistrationForm_Control_HelpPanel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_HelpPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::HelpPanel:push';
end;//Tkw_RegistrationForm_Control_HelpPanel_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_HelpPaintBox.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::HelpPaintBox';
end;//Tkw_RegistrationForm_Control_HelpPaintBox.GetWordNameForRegister

function Tkw_RegistrationForm_Control_HelpPaintBox.GetString: AnsiString;
begin
 Result := 'HelpPaintBox';
end;//Tkw_RegistrationForm_Control_HelpPaintBox.GetString

class procedure Tkw_RegistrationForm_Control_HelpPaintBox.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TPaintBox);
end;//Tkw_RegistrationForm_Control_HelpPaintBox.RegisterInEngine

procedure Tkw_RegistrationForm_Control_HelpPaintBox_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_BF596BC91BE0_var*
//#UC END# *4DAEEDE10285_BF596BC91BE0_var*
begin
//#UC START# *4DAEEDE10285_BF596BC91BE0_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_BF596BC91BE0_impl*
end;//Tkw_RegistrationForm_Control_HelpPaintBox_Push.DoDoIt

class function Tkw_RegistrationForm_Control_HelpPaintBox_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::HelpPaintBox:push';
end;//Tkw_RegistrationForm_Control_HelpPaintBox_Push.GetWordNameForRegister

class function Tkw_RegistrationForm_Control_HelpLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::HelpLabel';
end;//Tkw_RegistrationForm_Control_HelpLabel.GetWordNameForRegister

function Tkw_RegistrationForm_Control_HelpLabel.GetString: AnsiString;
begin
 Result := 'HelpLabel';
end;//Tkw_RegistrationForm_Control_HelpLabel.GetString

class procedure Tkw_RegistrationForm_Control_HelpLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtFocusLabel);
end;//Tkw_RegistrationForm_Control_HelpLabel.RegisterInEngine

procedure Tkw_RegistrationForm_Control_HelpLabel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_A5A440773725_var*
//#UC END# *4DAEEDE10285_A5A440773725_var*
begin
//#UC START# *4DAEEDE10285_A5A440773725_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_A5A440773725_impl*
end;//Tkw_RegistrationForm_Control_HelpLabel_Push.DoDoIt

class function Tkw_RegistrationForm_Control_HelpLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::HelpLabel:push';
end;//Tkw_RegistrationForm_Control_HelpLabel_Push.GetWordNameForRegister

function TkwRegistrationFormPnMainData.pnMainData(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtPanel;
 {* ���������� ����� ������� .TnsRegistrationForm.pnMainData }
begin
 Result := aRegistrationForm.pnMainData;
end;//TkwRegistrationFormPnMainData.pnMainData

procedure TkwRegistrationFormPnMainData.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(pnMainData(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormPnMainData.DoDoIt

class function TkwRegistrationFormPnMainData.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.pnMainData';
end;//TkwRegistrationFormPnMainData.GetWordNameForRegister

procedure TkwRegistrationFormPnMainData.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� pnMainData', aCtx);
end;//TkwRegistrationFormPnMainData.SetValuePrim

function TkwRegistrationFormPnMainData.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwRegistrationFormPnMainData.GetResultTypeInfo

function TkwRegistrationFormPnMainData.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormPnMainData.GetAllParamsCount

function TkwRegistrationFormPnMainData.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormPnMainData.ParamsTypes

function TkwRegistrationFormUserNameLabel.UserNameLabel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.UserNameLabel }
begin
 Result := aRegistrationForm.UserNameLabel;
end;//TkwRegistrationFormUserNameLabel.UserNameLabel

procedure TkwRegistrationFormUserNameLabel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(UserNameLabel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormUserNameLabel.DoDoIt

class function TkwRegistrationFormUserNameLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.UserNameLabel';
end;//TkwRegistrationFormUserNameLabel.GetWordNameForRegister

procedure TkwRegistrationFormUserNameLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� UserNameLabel', aCtx);
end;//TkwRegistrationFormUserNameLabel.SetValuePrim

function TkwRegistrationFormUserNameLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwRegistrationFormUserNameLabel.GetResultTypeInfo

function TkwRegistrationFormUserNameLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormUserNameLabel.GetAllParamsCount

function TkwRegistrationFormUserNameLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormUserNameLabel.ParamsTypes

function TkwRegistrationFormPasswordLabel.PasswordLabel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.PasswordLabel }
begin
 Result := aRegistrationForm.PasswordLabel;
end;//TkwRegistrationFormPasswordLabel.PasswordLabel

procedure TkwRegistrationFormPasswordLabel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(PasswordLabel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormPasswordLabel.DoDoIt

class function TkwRegistrationFormPasswordLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.PasswordLabel';
end;//TkwRegistrationFormPasswordLabel.GetWordNameForRegister

procedure TkwRegistrationFormPasswordLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� PasswordLabel', aCtx);
end;//TkwRegistrationFormPasswordLabel.SetValuePrim

function TkwRegistrationFormPasswordLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwRegistrationFormPasswordLabel.GetResultTypeInfo

function TkwRegistrationFormPasswordLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormPasswordLabel.GetAllParamsCount

function TkwRegistrationFormPasswordLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormPasswordLabel.ParamsTypes

function TkwRegistrationFormLoginLabel.LoginLabel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.LoginLabel }
begin
 Result := aRegistrationForm.LoginLabel;
end;//TkwRegistrationFormLoginLabel.LoginLabel

procedure TkwRegistrationFormLoginLabel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(LoginLabel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormLoginLabel.DoDoIt

class function TkwRegistrationFormLoginLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.LoginLabel';
end;//TkwRegistrationFormLoginLabel.GetWordNameForRegister

procedure TkwRegistrationFormLoginLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� LoginLabel', aCtx);
end;//TkwRegistrationFormLoginLabel.SetValuePrim

function TkwRegistrationFormLoginLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwRegistrationFormLoginLabel.GetResultTypeInfo

function TkwRegistrationFormLoginLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormLoginLabel.GetAllParamsCount

function TkwRegistrationFormLoginLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormLoginLabel.ParamsTypes

function TkwRegistrationFormInfoLabel.InfoLabel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.InfoLabel }
begin
 Result := aRegistrationForm.InfoLabel;
end;//TkwRegistrationFormInfoLabel.InfoLabel

procedure TkwRegistrationFormInfoLabel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(InfoLabel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormInfoLabel.DoDoIt

class function TkwRegistrationFormInfoLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.InfoLabel';
end;//TkwRegistrationFormInfoLabel.GetWordNameForRegister

procedure TkwRegistrationFormInfoLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� InfoLabel', aCtx);
end;//TkwRegistrationFormInfoLabel.SetValuePrim

function TkwRegistrationFormInfoLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwRegistrationFormInfoLabel.GetResultTypeInfo

function TkwRegistrationFormInfoLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormInfoLabel.GetAllParamsCount

function TkwRegistrationFormInfoLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormInfoLabel.ParamsTypes

function TkwRegistrationFormEMailLabel.EMailLabel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.EMailLabel }
begin
 Result := aRegistrationForm.EMailLabel;
end;//TkwRegistrationFormEMailLabel.EMailLabel

procedure TkwRegistrationFormEMailLabel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(EMailLabel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormEMailLabel.DoDoIt

class function TkwRegistrationFormEMailLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.EMailLabel';
end;//TkwRegistrationFormEMailLabel.GetWordNameForRegister

procedure TkwRegistrationFormEMailLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� EMailLabel', aCtx);
end;//TkwRegistrationFormEMailLabel.SetValuePrim

function TkwRegistrationFormEMailLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwRegistrationFormEMailLabel.GetResultTypeInfo

function TkwRegistrationFormEMailLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormEMailLabel.GetAllParamsCount

function TkwRegistrationFormEMailLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormEMailLabel.ParamsTypes

function TkwRegistrationFormConfirmPasswordLabel.ConfirmPasswordLabel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.ConfirmPasswordLabel }
begin
 Result := aRegistrationForm.ConfirmPasswordLabel;
end;//TkwRegistrationFormConfirmPasswordLabel.ConfirmPasswordLabel

procedure TkwRegistrationFormConfirmPasswordLabel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ConfirmPasswordLabel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormConfirmPasswordLabel.DoDoIt

class function TkwRegistrationFormConfirmPasswordLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.ConfirmPasswordLabel';
end;//TkwRegistrationFormConfirmPasswordLabel.GetWordNameForRegister

procedure TkwRegistrationFormConfirmPasswordLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ConfirmPasswordLabel', aCtx);
end;//TkwRegistrationFormConfirmPasswordLabel.SetValuePrim

function TkwRegistrationFormConfirmPasswordLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwRegistrationFormConfirmPasswordLabel.GetResultTypeInfo

function TkwRegistrationFormConfirmPasswordLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormConfirmPasswordLabel.GetAllParamsCount

function TkwRegistrationFormConfirmPasswordLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormConfirmPasswordLabel.ParamsTypes

function TkwRegistrationFormVtAsteriskLabelLogin.vtAsteriskLabelLogin(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.vtAsteriskLabelLogin }
begin
 Result := aRegistrationForm.vtAsteriskLabelLogin;
end;//TkwRegistrationFormVtAsteriskLabelLogin.vtAsteriskLabelLogin

procedure TkwRegistrationFormVtAsteriskLabelLogin.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(vtAsteriskLabelLogin(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormVtAsteriskLabelLogin.DoDoIt

class function TkwRegistrationFormVtAsteriskLabelLogin.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.vtAsteriskLabelLogin';
end;//TkwRegistrationFormVtAsteriskLabelLogin.GetWordNameForRegister

procedure TkwRegistrationFormVtAsteriskLabelLogin.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� vtAsteriskLabelLogin', aCtx);
end;//TkwRegistrationFormVtAsteriskLabelLogin.SetValuePrim

function TkwRegistrationFormVtAsteriskLabelLogin.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwRegistrationFormVtAsteriskLabelLogin.GetResultTypeInfo

function TkwRegistrationFormVtAsteriskLabelLogin.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormVtAsteriskLabelLogin.GetAllParamsCount

function TkwRegistrationFormVtAsteriskLabelLogin.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormVtAsteriskLabelLogin.ParamsTypes

function TkwRegistrationFormVtAsteriskLabelFIO.vtAsteriskLabelFIO(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.vtAsteriskLabelFIO }
begin
 Result := aRegistrationForm.vtAsteriskLabelFIO;
end;//TkwRegistrationFormVtAsteriskLabelFIO.vtAsteriskLabelFIO

procedure TkwRegistrationFormVtAsteriskLabelFIO.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(vtAsteriskLabelFIO(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormVtAsteriskLabelFIO.DoDoIt

class function TkwRegistrationFormVtAsteriskLabelFIO.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.vtAsteriskLabelFIO';
end;//TkwRegistrationFormVtAsteriskLabelFIO.GetWordNameForRegister

procedure TkwRegistrationFormVtAsteriskLabelFIO.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� vtAsteriskLabelFIO', aCtx);
end;//TkwRegistrationFormVtAsteriskLabelFIO.SetValuePrim

function TkwRegistrationFormVtAsteriskLabelFIO.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwRegistrationFormVtAsteriskLabelFIO.GetResultTypeInfo

function TkwRegistrationFormVtAsteriskLabelFIO.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormVtAsteriskLabelFIO.GetAllParamsCount

function TkwRegistrationFormVtAsteriskLabelFIO.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormVtAsteriskLabelFIO.ParamsTypes

function TkwRegistrationFormEdPassword.edPassword(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TnscComboBoxWithPwdChar;
 {* ���������� ����� ������� .TnsRegistrationForm.edPassword }
begin
 Result := aRegistrationForm.edPassword;
end;//TkwRegistrationFormEdPassword.edPassword

procedure TkwRegistrationFormEdPassword.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(edPassword(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormEdPassword.DoDoIt

class function TkwRegistrationFormEdPassword.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.edPassword';
end;//TkwRegistrationFormEdPassword.GetWordNameForRegister

procedure TkwRegistrationFormEdPassword.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� edPassword', aCtx);
end;//TkwRegistrationFormEdPassword.SetValuePrim

function TkwRegistrationFormEdPassword.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscComboBoxWithPwdChar);
end;//TkwRegistrationFormEdPassword.GetResultTypeInfo

function TkwRegistrationFormEdPassword.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormEdPassword.GetAllParamsCount

function TkwRegistrationFormEdPassword.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormEdPassword.ParamsTypes

function TkwRegistrationFormEdUserName.edUserName(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TnscEdit;
 {* ���������� ����� ������� .TnsRegistrationForm.edUserName }
begin
 Result := aRegistrationForm.edUserName;
end;//TkwRegistrationFormEdUserName.edUserName

procedure TkwRegistrationFormEdUserName.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(edUserName(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormEdUserName.DoDoIt

class function TkwRegistrationFormEdUserName.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.edUserName';
end;//TkwRegistrationFormEdUserName.GetWordNameForRegister

procedure TkwRegistrationFormEdUserName.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� edUserName', aCtx);
end;//TkwRegistrationFormEdUserName.SetValuePrim

function TkwRegistrationFormEdUserName.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEdit);
end;//TkwRegistrationFormEdUserName.GetResultTypeInfo

function TkwRegistrationFormEdUserName.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormEdUserName.GetAllParamsCount

function TkwRegistrationFormEdUserName.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormEdUserName.ParamsTypes

function TkwRegistrationFormEdLogin.edLogin(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TnscEdit;
 {* ���������� ����� ������� .TnsRegistrationForm.edLogin }
begin
 Result := aRegistrationForm.edLogin;
end;//TkwRegistrationFormEdLogin.edLogin

procedure TkwRegistrationFormEdLogin.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(edLogin(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormEdLogin.DoDoIt

class function TkwRegistrationFormEdLogin.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.edLogin';
end;//TkwRegistrationFormEdLogin.GetWordNameForRegister

procedure TkwRegistrationFormEdLogin.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� edLogin', aCtx);
end;//TkwRegistrationFormEdLogin.SetValuePrim

function TkwRegistrationFormEdLogin.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEdit);
end;//TkwRegistrationFormEdLogin.GetResultTypeInfo

function TkwRegistrationFormEdLogin.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormEdLogin.GetAllParamsCount

function TkwRegistrationFormEdLogin.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormEdLogin.ParamsTypes

function TkwRegistrationFormEdEmail.edEmail(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TnscEdit;
 {* ���������� ����� ������� .TnsRegistrationForm.edEmail }
begin
 Result := aRegistrationForm.edEmail;
end;//TkwRegistrationFormEdEmail.edEmail

procedure TkwRegistrationFormEdEmail.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(edEmail(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormEdEmail.DoDoIt

class function TkwRegistrationFormEdEmail.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.edEmail';
end;//TkwRegistrationFormEdEmail.GetWordNameForRegister

procedure TkwRegistrationFormEdEmail.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� edEmail', aCtx);
end;//TkwRegistrationFormEdEmail.SetValuePrim

function TkwRegistrationFormEdEmail.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEdit);
end;//TkwRegistrationFormEdEmail.GetResultTypeInfo

function TkwRegistrationFormEdEmail.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormEdEmail.GetAllParamsCount

function TkwRegistrationFormEdEmail.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormEdEmail.ParamsTypes

function TkwRegistrationFormEdConfirm.edConfirm(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TnscComboBoxWithPwdChar;
 {* ���������� ����� ������� .TnsRegistrationForm.edConfirm }
begin
 Result := aRegistrationForm.edConfirm;
end;//TkwRegistrationFormEdConfirm.edConfirm

procedure TkwRegistrationFormEdConfirm.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(edConfirm(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormEdConfirm.DoDoIt

class function TkwRegistrationFormEdConfirm.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.edConfirm';
end;//TkwRegistrationFormEdConfirm.GetWordNameForRegister

procedure TkwRegistrationFormEdConfirm.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� edConfirm', aCtx);
end;//TkwRegistrationFormEdConfirm.SetValuePrim

function TkwRegistrationFormEdConfirm.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscComboBoxWithPwdChar);
end;//TkwRegistrationFormEdConfirm.GetResultTypeInfo

function TkwRegistrationFormEdConfirm.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormEdConfirm.GetAllParamsCount

function TkwRegistrationFormEdConfirm.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormEdConfirm.ParamsTypes

function TkwRegistrationFormCbAutoLogin.cbAutoLogin(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtCheckBox;
 {* ���������� ����� ������� .TnsRegistrationForm.cbAutoLogin }
begin
 Result := aRegistrationForm.cbAutoLogin;
end;//TkwRegistrationFormCbAutoLogin.cbAutoLogin

procedure TkwRegistrationFormCbAutoLogin.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(cbAutoLogin(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormCbAutoLogin.DoDoIt

class function TkwRegistrationFormCbAutoLogin.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.cbAutoLogin';
end;//TkwRegistrationFormCbAutoLogin.GetWordNameForRegister

procedure TkwRegistrationFormCbAutoLogin.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� cbAutoLogin', aCtx);
end;//TkwRegistrationFormCbAutoLogin.SetValuePrim

function TkwRegistrationFormCbAutoLogin.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtCheckBox);
end;//TkwRegistrationFormCbAutoLogin.GetResultTypeInfo

function TkwRegistrationFormCbAutoLogin.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormCbAutoLogin.GetAllParamsCount

function TkwRegistrationFormCbAutoLogin.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormCbAutoLogin.ParamsTypes

function TkwRegistrationFormNewUserGroupBox.NewUserGroupBox(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtGroupBox;
 {* ���������� ����� ������� .TnsRegistrationForm.NewUserGroupBox }
begin
 Result := aRegistrationForm.NewUserGroupBox;
end;//TkwRegistrationFormNewUserGroupBox.NewUserGroupBox

procedure TkwRegistrationFormNewUserGroupBox.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(NewUserGroupBox(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormNewUserGroupBox.DoDoIt

class function TkwRegistrationFormNewUserGroupBox.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.NewUserGroupBox';
end;//TkwRegistrationFormNewUserGroupBox.GetWordNameForRegister

procedure TkwRegistrationFormNewUserGroupBox.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� NewUserGroupBox', aCtx);
end;//TkwRegistrationFormNewUserGroupBox.SetValuePrim

function TkwRegistrationFormNewUserGroupBox.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtGroupBox);
end;//TkwRegistrationFormNewUserGroupBox.GetResultTypeInfo

function TkwRegistrationFormNewUserGroupBox.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormNewUserGroupBox.GetAllParamsCount

function TkwRegistrationFormNewUserGroupBox.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormNewUserGroupBox.ParamsTypes

function TkwRegistrationFormNewUserLabel.NewUserLabel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.NewUserLabel }
begin
 Result := aRegistrationForm.NewUserLabel;
end;//TkwRegistrationFormNewUserLabel.NewUserLabel

procedure TkwRegistrationFormNewUserLabel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(NewUserLabel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormNewUserLabel.DoDoIt

class function TkwRegistrationFormNewUserLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.NewUserLabel';
end;//TkwRegistrationFormNewUserLabel.GetWordNameForRegister

procedure TkwRegistrationFormNewUserLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� NewUserLabel', aCtx);
end;//TkwRegistrationFormNewUserLabel.SetValuePrim

function TkwRegistrationFormNewUserLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwRegistrationFormNewUserLabel.GetResultTypeInfo

function TkwRegistrationFormNewUserLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormNewUserLabel.GetAllParamsCount

function TkwRegistrationFormNewUserLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormNewUserLabel.ParamsTypes

function TkwRegistrationFormNewUserPaintBox.NewUserPaintBox(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TPaintBox;
 {* ���������� ����� ������� .TnsRegistrationForm.NewUserPaintBox }
begin
 Result := aRegistrationForm.NewUserPaintBox;
end;//TkwRegistrationFormNewUserPaintBox.NewUserPaintBox

procedure TkwRegistrationFormNewUserPaintBox.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(NewUserPaintBox(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormNewUserPaintBox.DoDoIt

class function TkwRegistrationFormNewUserPaintBox.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.NewUserPaintBox';
end;//TkwRegistrationFormNewUserPaintBox.GetWordNameForRegister

procedure TkwRegistrationFormNewUserPaintBox.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� NewUserPaintBox', aCtx);
end;//TkwRegistrationFormNewUserPaintBox.SetValuePrim

function TkwRegistrationFormNewUserPaintBox.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TPaintBox);
end;//TkwRegistrationFormNewUserPaintBox.GetResultTypeInfo

function TkwRegistrationFormNewUserPaintBox.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormNewUserPaintBox.GetAllParamsCount

function TkwRegistrationFormNewUserPaintBox.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormNewUserPaintBox.ParamsTypes

function TkwRegistrationFormBottomPanel.BottomPanel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtPanel;
 {* ���������� ����� ������� .TnsRegistrationForm.BottomPanel }
begin
 Result := aRegistrationForm.BottomPanel;
end;//TkwRegistrationFormBottomPanel.BottomPanel

procedure TkwRegistrationFormBottomPanel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(BottomPanel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormBottomPanel.DoDoIt

class function TkwRegistrationFormBottomPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.BottomPanel';
end;//TkwRegistrationFormBottomPanel.GetWordNameForRegister

procedure TkwRegistrationFormBottomPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� BottomPanel', aCtx);
end;//TkwRegistrationFormBottomPanel.SetValuePrim

function TkwRegistrationFormBottomPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwRegistrationFormBottomPanel.GetResultTypeInfo

function TkwRegistrationFormBottomPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormBottomPanel.GetAllParamsCount

function TkwRegistrationFormBottomPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormBottomPanel.ParamsTypes

function TkwRegistrationFormRegisterButton.RegisterButton(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TElPopupButton;
 {* ���������� ����� ������� .TnsRegistrationForm.RegisterButton }
begin
 Result := aRegistrationForm.RegisterButton;
end;//TkwRegistrationFormRegisterButton.RegisterButton

procedure TkwRegistrationFormRegisterButton.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(RegisterButton(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormRegisterButton.DoDoIt

class function TkwRegistrationFormRegisterButton.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.RegisterButton';
end;//TkwRegistrationFormRegisterButton.GetWordNameForRegister

procedure TkwRegistrationFormRegisterButton.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� RegisterButton', aCtx);
end;//TkwRegistrationFormRegisterButton.SetValuePrim

function TkwRegistrationFormRegisterButton.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TElPopupButton);
end;//TkwRegistrationFormRegisterButton.GetResultTypeInfo

function TkwRegistrationFormRegisterButton.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormRegisterButton.GetAllParamsCount

function TkwRegistrationFormRegisterButton.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormRegisterButton.ParamsTypes

function TkwRegistrationFormHelpPanel.HelpPanel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtPanel;
 {* ���������� ����� ������� .TnsRegistrationForm.HelpPanel }
begin
 Result := aRegistrationForm.HelpPanel;
end;//TkwRegistrationFormHelpPanel.HelpPanel

procedure TkwRegistrationFormHelpPanel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(HelpPanel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormHelpPanel.DoDoIt

class function TkwRegistrationFormHelpPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.HelpPanel';
end;//TkwRegistrationFormHelpPanel.GetWordNameForRegister

procedure TkwRegistrationFormHelpPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� HelpPanel', aCtx);
end;//TkwRegistrationFormHelpPanel.SetValuePrim

function TkwRegistrationFormHelpPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwRegistrationFormHelpPanel.GetResultTypeInfo

function TkwRegistrationFormHelpPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormHelpPanel.GetAllParamsCount

function TkwRegistrationFormHelpPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormHelpPanel.ParamsTypes

function TkwRegistrationFormHelpPaintBox.HelpPaintBox(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TPaintBox;
 {* ���������� ����� ������� .TnsRegistrationForm.HelpPaintBox }
begin
 Result := aRegistrationForm.HelpPaintBox;
end;//TkwRegistrationFormHelpPaintBox.HelpPaintBox

procedure TkwRegistrationFormHelpPaintBox.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(HelpPaintBox(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormHelpPaintBox.DoDoIt

class function TkwRegistrationFormHelpPaintBox.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.HelpPaintBox';
end;//TkwRegistrationFormHelpPaintBox.GetWordNameForRegister

procedure TkwRegistrationFormHelpPaintBox.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� HelpPaintBox', aCtx);
end;//TkwRegistrationFormHelpPaintBox.SetValuePrim

function TkwRegistrationFormHelpPaintBox.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TPaintBox);
end;//TkwRegistrationFormHelpPaintBox.GetResultTypeInfo

function TkwRegistrationFormHelpPaintBox.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormHelpPaintBox.GetAllParamsCount

function TkwRegistrationFormHelpPaintBox.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormHelpPaintBox.ParamsTypes

function TkwRegistrationFormHelpLabel.HelpLabel(const aCtx: TtfwContext;
 aRegistrationForm: TnsRegistrationForm): TvtFocusLabel;
 {* ���������� ����� ������� .TnsRegistrationForm.HelpLabel }
begin
 Result := aRegistrationForm.HelpLabel;
end;//TkwRegistrationFormHelpLabel.HelpLabel

procedure TkwRegistrationFormHelpLabel.DoDoIt(const aCtx: TtfwContext);
var l_aRegistrationForm: TnsRegistrationForm;
begin
 try
  l_aRegistrationForm := TnsRegistrationForm(aCtx.rEngine.PopObjAs(TnsRegistrationForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRegistrationForm: TnsRegistrationForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(HelpLabel(aCtx, l_aRegistrationForm));
end;//TkwRegistrationFormHelpLabel.DoDoIt

class function TkwRegistrationFormHelpLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TnsRegistrationForm.HelpLabel';
end;//TkwRegistrationFormHelpLabel.GetWordNameForRegister

procedure TkwRegistrationFormHelpLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� HelpLabel', aCtx);
end;//TkwRegistrationFormHelpLabel.SetValuePrim

function TkwRegistrationFormHelpLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtFocusLabel);
end;//TkwRegistrationFormHelpLabel.GetResultTypeInfo

function TkwRegistrationFormHelpLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwRegistrationFormHelpLabel.GetAllParamsCount

function TkwRegistrationFormHelpLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TnsRegistrationForm)]);
end;//TkwRegistrationFormHelpLabel.ParamsTypes

initialization
 Tkw_Form_RegistrationForm.RegisterInEngine;
 {* ����������� Tkw_Form_RegistrationForm }
 Tkw_RegistrationForm_Control_pnMainData.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_pnMainData }
 Tkw_RegistrationForm_Control_pnMainData_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_pnMainData_Push }
 Tkw_RegistrationForm_Control_UserNameLabel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_UserNameLabel }
 Tkw_RegistrationForm_Control_UserNameLabel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_UserNameLabel_Push }
 Tkw_RegistrationForm_Control_PasswordLabel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_PasswordLabel }
 Tkw_RegistrationForm_Control_PasswordLabel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_PasswordLabel_Push }
 Tkw_RegistrationForm_Control_LoginLabel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_LoginLabel }
 Tkw_RegistrationForm_Control_LoginLabel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_LoginLabel_Push }
 Tkw_RegistrationForm_Control_InfoLabel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_InfoLabel }
 Tkw_RegistrationForm_Control_InfoLabel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_InfoLabel_Push }
 Tkw_RegistrationForm_Control_EMailLabel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_EMailLabel }
 Tkw_RegistrationForm_Control_EMailLabel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_EMailLabel_Push }
 Tkw_RegistrationForm_Control_ConfirmPasswordLabel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_ConfirmPasswordLabel }
 Tkw_RegistrationForm_Control_ConfirmPasswordLabel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_ConfirmPasswordLabel_Push }
 Tkw_RegistrationForm_Control_vtAsteriskLabelLogin.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_vtAsteriskLabelLogin }
 Tkw_RegistrationForm_Control_vtAsteriskLabelLogin_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_vtAsteriskLabelLogin_Push }
 Tkw_RegistrationForm_Control_vtAsteriskLabelFIO.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_vtAsteriskLabelFIO }
 Tkw_RegistrationForm_Control_vtAsteriskLabelFIO_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_vtAsteriskLabelFIO_Push }
 Tkw_RegistrationForm_Control_edPassword.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edPassword }
 Tkw_RegistrationForm_Control_edPassword_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edPassword_Push }
 Tkw_RegistrationForm_Control_edUserName.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edUserName }
 Tkw_RegistrationForm_Control_edUserName_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edUserName_Push }
 Tkw_RegistrationForm_Control_edLogin.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edLogin }
 Tkw_RegistrationForm_Control_edLogin_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edLogin_Push }
 Tkw_RegistrationForm_Control_edEmail.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edEmail }
 Tkw_RegistrationForm_Control_edEmail_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edEmail_Push }
 Tkw_RegistrationForm_Control_edConfirm.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edConfirm }
 Tkw_RegistrationForm_Control_edConfirm_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_edConfirm_Push }
 Tkw_RegistrationForm_Control_cbAutoLogin.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_cbAutoLogin }
 Tkw_RegistrationForm_Control_cbAutoLogin_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_cbAutoLogin_Push }
 Tkw_RegistrationForm_Control_NewUserGroupBox.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_NewUserGroupBox }
 Tkw_RegistrationForm_Control_NewUserGroupBox_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_NewUserGroupBox_Push }
 Tkw_RegistrationForm_Control_NewUserLabel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_NewUserLabel }
 Tkw_RegistrationForm_Control_NewUserLabel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_NewUserLabel_Push }
 Tkw_RegistrationForm_Control_NewUserPaintBox.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_NewUserPaintBox }
 Tkw_RegistrationForm_Control_NewUserPaintBox_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_NewUserPaintBox_Push }
 Tkw_RegistrationForm_Control_BottomPanel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_BottomPanel }
 Tkw_RegistrationForm_Control_BottomPanel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_BottomPanel_Push }
 Tkw_RegistrationForm_Control_RegisterButton.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_RegisterButton }
 Tkw_RegistrationForm_Control_RegisterButton_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_RegisterButton_Push }
 Tkw_RegistrationForm_Control_HelpPanel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_HelpPanel }
 Tkw_RegistrationForm_Control_HelpPanel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_HelpPanel_Push }
 Tkw_RegistrationForm_Control_HelpPaintBox.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_HelpPaintBox }
 Tkw_RegistrationForm_Control_HelpPaintBox_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_HelpPaintBox_Push }
 Tkw_RegistrationForm_Control_HelpLabel.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_HelpLabel }
 Tkw_RegistrationForm_Control_HelpLabel_Push.RegisterInEngine;
 {* ����������� Tkw_RegistrationForm_Control_HelpLabel_Push }
 TkwRegistrationFormPnMainData.RegisterInEngine;
 {* ����������� RegistrationForm_pnMainData }
 TkwRegistrationFormUserNameLabel.RegisterInEngine;
 {* ����������� RegistrationForm_UserNameLabel }
 TkwRegistrationFormPasswordLabel.RegisterInEngine;
 {* ����������� RegistrationForm_PasswordLabel }
 TkwRegistrationFormLoginLabel.RegisterInEngine;
 {* ����������� RegistrationForm_LoginLabel }
 TkwRegistrationFormInfoLabel.RegisterInEngine;
 {* ����������� RegistrationForm_InfoLabel }
 TkwRegistrationFormEMailLabel.RegisterInEngine;
 {* ����������� RegistrationForm_EMailLabel }
 TkwRegistrationFormConfirmPasswordLabel.RegisterInEngine;
 {* ����������� RegistrationForm_ConfirmPasswordLabel }
 TkwRegistrationFormVtAsteriskLabelLogin.RegisterInEngine;
 {* ����������� RegistrationForm_vtAsteriskLabelLogin }
 TkwRegistrationFormVtAsteriskLabelFIO.RegisterInEngine;
 {* ����������� RegistrationForm_vtAsteriskLabelFIO }
 TkwRegistrationFormEdPassword.RegisterInEngine;
 {* ����������� RegistrationForm_edPassword }
 TkwRegistrationFormEdUserName.RegisterInEngine;
 {* ����������� RegistrationForm_edUserName }
 TkwRegistrationFormEdLogin.RegisterInEngine;
 {* ����������� RegistrationForm_edLogin }
 TkwRegistrationFormEdEmail.RegisterInEngine;
 {* ����������� RegistrationForm_edEmail }
 TkwRegistrationFormEdConfirm.RegisterInEngine;
 {* ����������� RegistrationForm_edConfirm }
 TkwRegistrationFormCbAutoLogin.RegisterInEngine;
 {* ����������� RegistrationForm_cbAutoLogin }
 TkwRegistrationFormNewUserGroupBox.RegisterInEngine;
 {* ����������� RegistrationForm_NewUserGroupBox }
 TkwRegistrationFormNewUserLabel.RegisterInEngine;
 {* ����������� RegistrationForm_NewUserLabel }
 TkwRegistrationFormNewUserPaintBox.RegisterInEngine;
 {* ����������� RegistrationForm_NewUserPaintBox }
 TkwRegistrationFormBottomPanel.RegisterInEngine;
 {* ����������� RegistrationForm_BottomPanel }
 TkwRegistrationFormRegisterButton.RegisterInEngine;
 {* ����������� RegistrationForm_RegisterButton }
 TkwRegistrationFormHelpPanel.RegisterInEngine;
 {* ����������� RegistrationForm_HelpPanel }
 TkwRegistrationFormHelpPaintBox.RegisterInEngine;
 {* ����������� RegistrationForm_HelpPaintBox }
 TkwRegistrationFormHelpLabel.RegisterInEngine;
 {* ����������� RegistrationForm_HelpLabel }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnsRegistrationForm));
 {* ����������� ���� RegistrationForm }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtPanel));
 {* ����������� ���� TvtPanel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtLabel));
 {* ����������� ���� TvtLabel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscComboBoxWithPwdChar));
 {* ����������� ���� TnscComboBoxWithPwdChar }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscEdit));
 {* ����������� ���� TnscEdit }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtCheckBox));
 {* ����������� ���� TvtCheckBox }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtGroupBox));
 {* ����������� ���� TvtGroupBox }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TPaintBox));
 {* ����������� ���� TPaintBox }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TElPopupButton));
 {* ����������� ���� TElPopupButton }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtFocusLabel));
 {* ����������� ���� TvtFocusLabel }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
