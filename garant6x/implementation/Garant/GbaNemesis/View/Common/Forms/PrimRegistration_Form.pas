unit PrimRegistration_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Common/Forms/PrimRegistration_Form.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 Core::Common::View::Common::PrimRegistration
//
// �����������
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
  l3Interfaces,
  Classes
  {$If not defined(NoVCL)}
  ,
  Controls
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoVCL)}
  ,
  ExtCtrls
  {$IfEnd} //not NoVCL
  
  {$If not defined(NoVCM)}
  ,
  vcmEntityForm
  {$IfEnd} //not NoVCM
  ,
  vtPanel,
  vtFocusLabel,
  vtGroupBox
  {$If defined(Nemesis)}
  ,
  nscComboBox
  {$IfEnd} //Nemesis
  ,
  vtLabel,
  l3StringIDEx,
  vtCheckBox,
  ElPopBtn,
  vcmExternalInterfaces {a},
  vcmInterfaces {a},
  vcmBase {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TnsRegisterAction = function (aSender: TCustomForm): TModalResult of object;

 TPrimRegistrationForm = {form} class(TvcmEntityForm)
  {* ����������� }
 private
 // private fields
   f_pnMainData : TvtPanel;
    {* ���� ��� �������� pnMainData}
   f_UserNameLabel : TvtLabel;
    {* ���� ��� �������� UserNameLabel}
   f_PasswordLabel : TvtLabel;
    {* ���� ��� �������� PasswordLabel}
   f_LoginLabel : TvtLabel;
    {* ���� ��� �������� LoginLabel}
   f_InfoLabel : TvtLabel;
    {* ���� ��� �������� InfoLabel}
   f_EMailLabel : TvtLabel;
    {* ���� ��� �������� EMailLabel}
   f_ConfirmPasswordLabel : TvtLabel;
    {* ���� ��� �������� ConfirmPasswordLabel}
   f_vtAsteriskLabelLogin : TvtLabel;
    {* ���� ��� �������� vtAsteriskLabelLogin}
   f_vtAsteriskLabelFIO : TvtLabel;
    {* ���� ��� �������� vtAsteriskLabelFIO}
   f_edPassword : TnscComboBoxWithPwdChar;
    {* ���� ��� �������� edPassword}
   f_edUserName : TnscEdit;
    {* ���� ��� �������� edUserName}
   f_edLogin : TnscEdit;
    {* ���� ��� �������� edLogin}
   f_edEmail : TnscEdit;
    {* ���� ��� �������� edEmail}
   f_edConfirm : TnscComboBoxWithPwdChar;
    {* ���� ��� �������� edConfirm}
   f_cbAutoLogin : TvtCheckBox;
    {* ���� ��� �������� cbAutoLogin}
   f_NewUserGroupBox : TvtGroupBox;
    {* ���� ��� �������� NewUserGroupBox}
   f_NewUserLabel : TvtLabel;
    {* ���� ��� �������� NewUserLabel}
   f_NewUserPaintBox : TPaintBox;
    {* ���� ��� �������� NewUserPaintBox}
   f_BottomPanel : TvtPanel;
    {* ���� ��� �������� BottomPanel}
   f_RegisterButton : TElPopupButton;
    {* ���� ��� �������� RegisterButton}
   f_HelpPanel : TvtPanel;
    {* ���� ��� �������� HelpPanel}
   f_HelpPaintBox : TPaintBox;
    {* ���� ��� �������� HelpPaintBox}
   f_HelpLabel : TvtFocusLabel;
    {* ���� ��� �������� HelpLabel}
   f_CanRelogin : Boolean;
    {* ���� ��� �������� CanRelogin}
   f_RegisterAction : TnsRegisterAction;
    {* ���� ��� �������� RegisterAction}
 protected
  procedure MakeControls; override;
 private
 // private methods
   procedure EdPasswordChange(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure EdUserNameChange(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure EdLoginChange(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure EdConfirmChange(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure NewUserPaintBoxPaint(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure RegisterButtonClick(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure HelpPaintBoxPaint(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure HelpLabelClick(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure RepositionControls;
     {* ��������� ������ RepositionControls }
   procedure Save;
     {* ��������� ������ Save }
   procedure CheckForm;
     {* ��������� ������ CheckForm }
   procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
 protected
 // property methods
   function pm_GetLogin: Il3CString;
   procedure pm_SetLogin(const aValue: Il3CString);
   function pm_GetPassword: Il3CString;
   procedure pm_SetPassword(const aValue: Il3CString);
   function pm_GetUserName: Il3CString;
   function pm_GetEMail: Il3CString;
   function pm_GetIsAutoLogin: Boolean;
 protected
 // overridden protected methods
   {$If not defined(NoVCL)}
   procedure CreateParams(var Params: TCreateParams); override;
   {$IfEnd} //not NoVCL
   {$If not defined(NoVCM)}
   procedure InitControls; override;
     {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
 public
 // overridden public methods
   {$If not defined(NoVCL)}
   function IsRealInstance: Boolean; override;
   {$IfEnd} //not NoVCL
 public
 // public methods
   procedure IncreaseLogin;
     {* ��������� ������ IncreaseLogin }
   class function Make(aIsAutoLogin: Boolean;
    aCanRelogin: Boolean;
    const aParams : IvcmMakeParams = nil;
    aZoneType     : TvcmZoneType = vcm_ztAny;
    aUserType     : TvcmEffectiveUserType = 0;
    aDataSource   : IvcmFormDataSource = nil): IvcmEntityForm; reintroduce;
 public
 // public properties
   property pnMainData: TvtPanel
     read f_pnMainData;
   property UserNameLabel: TvtLabel
     read f_UserNameLabel;
     {* ��� ������������: }
   property PasswordLabel: TvtLabel
     read f_PasswordLabel;
     {* ����� ������: }
   property LoginLabel: TvtLabel
     read f_LoginLabel;
     {* ����� ��������������� ���: }
   property InfoLabel: TvtLabel
     read f_InfoLabel;
     {* * - ����, ������������ ��� ���������� }
   property EMailLabel: TvtLabel
     read f_EMailLabel;
     {* ����������� �����: }
   property ConfirmPasswordLabel: TvtLabel
     read f_ConfirmPasswordLabel;
     {* ������������� ������: }
   property vtAsteriskLabelLogin: TvtLabel
     read f_vtAsteriskLabelLogin;
     {* * }
   property vtAsteriskLabelFIO: TvtLabel
     read f_vtAsteriskLabelFIO;
     {* * }
   property edPassword: TnscComboBoxWithPwdChar
     read f_edPassword;
   property edUserName: TnscEdit
     read f_edUserName;
   property edLogin: TnscEdit
     read f_edLogin;
   property edEmail: TnscEdit
     read f_edEmail;
   property edConfirm: TnscComboBoxWithPwdChar
     read f_edConfirm;
   property cbAutoLogin: TvtCheckBox
     read f_cbAutoLogin;
     {* ��������� ������ }
   property NewUserGroupBox: TvtGroupBox
     read f_NewUserGroupBox;
     {* ����� ������������ }
   property NewUserLabel: TvtLabel
     read f_NewUserLabel;
     {* ����� ������ ������ � �������� ������ ���������� ������������������ � �������, ������ ���� ������� ������. }
   property NewUserPaintBox: TPaintBox
     read f_NewUserPaintBox;
   property BottomPanel: TvtPanel
     read f_BottomPanel;
   property RegisterButton: TElPopupButton
     read f_RegisterButton;
     {* ������������������ }
   property HelpPanel: TvtPanel
     read f_HelpPanel;
   property HelpPaintBox: TPaintBox
     read f_HelpPaintBox;
   property HelpLabel: TvtFocusLabel
     read f_HelpLabel;
     {* ������ }
   property Login: Il3CString
     read pm_GetLogin
     write pm_SetLogin;
   property Password: Il3CString
     read pm_GetPassword
     write pm_SetPassword;
   property UserName: Il3CString
     read pm_GetUserName;
   property EMail: Il3CString
     read pm_GetEMail;
   property IsAutoLogin: Boolean
     read pm_GetIsAutoLogin;
   property CanRelogin: Boolean
     read f_CanRelogin;
   property RegisterAction: TnsRegisterAction
     read f_RegisterAction
     write f_RegisterAction;
 end;//TPrimRegistrationForm

 TvcmEntityFormRef = TPrimRegistrationForm;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  SysUtils
  {$If not defined(NoVCM)}
  ,
  StdRes
  {$IfEnd} //not NoVCM
  ,
  l3String,
  l3Base,
  l3MinMax,
  nsTypes,
  nsVerifyValue,
  nsLoginUtils,
  nsUtils,
  nsConst,
  SearchRes
  {$If not defined(NoVCL)}
  ,
  StdCtrls
  {$IfEnd} //not NoVCL
  ,
  Windows,
  Graphics
  {$If not defined(NoVCM)}
  ,
  vcmMessagesSupport
  {$IfEnd} //not NoVCM
  ,
  l3MessageID
  {$If not defined(NoScripts)}
  ,
  TtfwClassRef_Proxy
  {$IfEnd} //not NoScripts
  
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

var
   { ������������ ������ Registration Form Controls' Hints }
  str_edPasswordHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'edPasswordHint'; rValue : '������� ������ ��� ����������� � �������');
   { '������� ������ ��� ����������� � �������' }
  str_edUserNameHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'edUserNameHint'; rValue : '������� ���� ���, ������� � ��������');
   { '������� ���� ���, ������� � ��������' }
  str_edLoginHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'edLoginHint'; rValue : '������� ��� ��� ������ � ������� ������');
   { '������� ��� ��� ������ � ������� ������' }
  str_edEmailHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'edEmailHint'; rValue : '����������� �����: �����, �� ������� ����� ������ ������� ���� ������');
   { '����������� �����: �����, �� ������� ����� ������ ������� ���� ������' }
  str_edConfirmHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'edConfirmHint'; rValue : '����������� ������, ��������� � ���������� ������');
   { '����������� ������, ��������� � ���������� ������' }
  str_errLoginIsTooLong : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'errLoginIsTooLong'; rValue : '��������������� ��� ����� ��������� �� ����� 31 �������!');
   { '��������������� ��� ����� ��������� �� ����� 31 �������!' }

// start class TPrimRegistrationForm

procedure TPrimRegistrationForm.EdPasswordChange(Sender: TObject);
//#UC START# *525AE9C902D1_525AE04E0326_var*
//#UC END# *525AE9C902D1_525AE04E0326_var*
begin
//#UC START# *525AE9C902D1_525AE04E0326_impl*
 CheckForm;
//#UC END# *525AE9C902D1_525AE04E0326_impl*
end;//TPrimRegistrationForm.EdPasswordChange

procedure TPrimRegistrationForm.EdUserNameChange(Sender: TObject);
//#UC START# *525AE9D5033E_525AE04E0326_var*
//#UC END# *525AE9D5033E_525AE04E0326_var*
begin
//#UC START# *525AE9D5033E_525AE04E0326_impl*
 CheckForm;
//#UC END# *525AE9D5033E_525AE04E0326_impl*
end;//TPrimRegistrationForm.EdUserNameChange

procedure TPrimRegistrationForm.EdLoginChange(Sender: TObject);
//#UC START# *525AE9F100C2_525AE04E0326_var*
//#UC END# *525AE9F100C2_525AE04E0326_var*
begin
//#UC START# *525AE9F100C2_525AE04E0326_impl*
 CheckForm;
//#UC END# *525AE9F100C2_525AE04E0326_impl*
end;//TPrimRegistrationForm.EdLoginChange

procedure TPrimRegistrationForm.EdConfirmChange(Sender: TObject);
//#UC START# *525AE9FB00ED_525AE04E0326_var*
//#UC END# *525AE9FB00ED_525AE04E0326_var*
begin
//#UC START# *525AE9FB00ED_525AE04E0326_impl*
 CheckForm;
//#UC END# *525AE9FB00ED_525AE04E0326_impl*
end;//TPrimRegistrationForm.EdConfirmChange

procedure TPrimRegistrationForm.NewUserPaintBoxPaint(Sender: TObject);
//#UC START# *525AEA140367_525AE04E0326_var*
//#UC END# *525AEA140367_525AE04E0326_var*
begin
//#UC START# *525AEA140367_525AE04E0326_impl*
 with Sender as TPaintBox do
  dmStdRes.LargeImageList.Draw(Canvas, width - c_LargeSizeIcon, (Height - c_LargeSizeIcon) div 2, cNewUser);
//#UC END# *525AEA140367_525AE04E0326_impl*
end;//TPrimRegistrationForm.NewUserPaintBoxPaint

procedure TPrimRegistrationForm.RegisterButtonClick(Sender: TObject);
//#UC START# *525AEA3E0143_525AE04E0326_var*
//#UC END# *525AEA3E0143_525AE04E0326_var*
begin
//#UC START# *525AEA3E0143_525AE04E0326_impl*
 Save;
//#UC END# *525AEA3E0143_525AE04E0326_impl*
end;//TPrimRegistrationForm.RegisterButtonClick

procedure TPrimRegistrationForm.HelpPaintBoxPaint(Sender: TObject);
//#UC START# *525AEA4B0070_525AE04E0326_var*
//#UC END# *525AEA4B0070_525AE04E0326_var*
begin
//#UC START# *525AEA4B0070_525AE04E0326_impl*
 with Sender as TPaintBox do
  nsSearchRes.ImageList16x16.Draw(Canvas, width - c_SmallSizeIcon, (Height - c_SmallSizeIcon) div 2, c_srchHelp);
//#UC END# *525AEA4B0070_525AE04E0326_impl*
end;//TPrimRegistrationForm.HelpPaintBoxPaint

procedure TPrimRegistrationForm.HelpLabelClick(Sender: TObject);
//#UC START# *525AEA560331_525AE04E0326_var*
//#UC END# *525AEA560331_525AE04E0326_var*
begin
//#UC START# *525AEA560331_525AE04E0326_impl*
 Application.HelpSystem.ShowHelp('ut_RegistrationForm', '');
//#UC END# *525AEA560331_525AE04E0326_impl*
end;//TPrimRegistrationForm.HelpLabelClick

procedure TPrimRegistrationForm.RepositionControls;
//#UC START# *525AEF6D0366_525AE04E0326_var*
var
 l_WidthDelta: Integer;
 l_HeightDelta: Integer;

 procedure lp_CorrectLabelWidth(aLabel: TvtLabel);
 begin
  with aLabel do
   SetBounds(Left, Top + l_HeightDelta, Width - l_WidthDelta, Height);
 end;

 procedure lp_CorrectControlWidth(anEdit: TWinControl);
 begin
  with anEdit do
   SetBounds(Left - l_WidthDelta, Top + l_HeightDelta, Width + l_WidthDelta, Height);
 end;
//#UC END# *525AEF6D0366_525AE04E0326_var*
begin
//#UC START# *525AEF6D0366_525AE04E0326_impl*
 HelpPanel.Width := HelpLabel.Left + HelpLabel.Width + c_ControlBorder;
 l_HeightDelta := Max(NewUserLabel.Top + NewUserLabel.Height - NewUserGroupBox.Height + 8, 0);
 l_WidthDelta := Max(InfoLabel.Width - edEMail.Width, 0);
 if (l_HeightDelta > 0) or (l_WidthDelta > 0) then
 begin
  SetBounds(Left, Top, Width + l_WidthDelta, Height + l_HeightDelta);
  NewUserGroupBox.Height := NewUserGroupBox.Height + l_HeightDelta;
  lp_CorrectLabelWidth(LoginLabel);
  lp_CorrectLabelWidth(PasswordLabel);
  lp_CorrectLabelWidth(ConfirmPasswordLabel);
  lp_CorrectLabelWidth(UserNameLabel);
  lp_CorrectLabelWidth(EMailLabel);
  lp_CorrectControlWidth(edLogin);
  lp_CorrectControlWidth(edPassword);
  lp_CorrectControlWidth(edConfirm);
  lp_CorrectControlWidth(edUserName);
  lp_CorrectControlWidth(edEmail);
  lp_CorrectControlWidth(cbAutoLogin);
  with RegisterButton do
   SetBounds(pnMainData.Left + edEmail.Left, Top + l_HeightDelta, edEmail.Width, Height);
  InfoLabel.Left := InfoLabel.Left - l_WidthDelta;
 end;
 with vtAsteriskLabelLogin do
  SetBounds(LoginLabel.Left + LoginLabel.Width, LoginLabel.Top, Width, Height);
 with vtAsteriskLabelFIO do
  SetBounds(UserNameLabel.Left + UserNameLabel.Width, UserNameLabel.Top, Width, Height);
//#UC END# *525AEF6D0366_525AE04E0326_impl*
end;//TPrimRegistrationForm.RepositionControls

procedure TPrimRegistrationForm.Save;
//#UC START# *525AEF7702EB_525AE04E0326_var*
  procedure lpSetFocus(aEdit : TnscComboBox);
  begin
   with aEdit do
   begin
    SelectAll;
    SetFocus;
   end;
  end;

  procedure lpClearPassword;
  begin
   edPassword.Text := nil;
   edConfirm.Text  := nil;
   lpSetFocus(edPassword);
  end;

var
 l_LoginVerifyResult: TnsVerifyValueResult;
//#UC END# *525AEF7702EB_525AE04E0326_var*
begin
//#UC START# *525AEF7702EB_525AE04E0326_impl*
 edUserName.Text := l3Trim(edUserName.Text);
 // �����
 if not nsLoginVerify.Verify(edLogin.Text) then
 begin
  lpSetFocus(edLogin);
  //http://mdp.garant.ru/pages/viewpage.action?pageId=284165424
  l_LoginVerifyResult := nsLoginVerify.VerifyResult;
  if (l_LoginVerifyResult = vvrInvalidTooLong) then
   vcmSay(str_errLoginIsTooLong, [])
  else if (l_LoginVerifyResult <> vvrNormal) then
   Say(err_LoginHasNotValidChars);
  Exit;
 end
 else
 // ������, �������������
 if not l3Same(edPassword.Text, edConfirm.Text) then
 begin
  lpClearPassword;
  Say(err_PasswordAndConfirmNotSame);
  Exit;
 end
 else
 if not nsPasswordVerify.Verify(edPassword.Text) then
 begin
  lpClearPassword;
  Say(err_PasswordHasErrorSimbols);
  Exit;
 end
 else
 // ���� ���
 if l3IsNil(edUserName.Text) then
 begin
  lpSetFocus(edUserName);
  Say(err_SurnameNotDefined);
  Exit;
 end
 else
 // Email
 if not l3IsNil(edEmail.Text) and not nsEmailVerify.Verify(edEmail.Text) then
 begin
  lpSetFocus(edEmail);
  Say(err_EmailNotValid);
  Exit;
 end;

 if ((l3IsNil(edPassword.Text)) and
    not Ask(qr_PasswordIsEmpty)) then
 begin
  edPassword.SetFocus;
  Exit;
 end;

 if Assigned(RegisterAction) then
  ModalResult := RegisterAction(self);
//#UC END# *525AEF7702EB_525AE04E0326_impl*
end;//TPrimRegistrationForm.Save

procedure TPrimRegistrationForm.CheckForm;
//#UC START# *525AEF8102B9_525AE04E0326_var*
var
 l_Result : Boolean;
//#UC END# *525AEF8102B9_525AE04E0326_var*
begin
//#UC START# *525AEF8102B9_525AE04E0326_impl*
 l_Result := True;
 // ��������� �������
 edLogin.TextValid := nsLoginVerify.Verify(edLogin.Text);
 edPassword.TextValid := nsPasswordVerify.Verify(edPassword.Text);
 edEmail.TextValid := nsEmailVerify.Verify(edEmail.Text);
 edConfirm.TextValid := nsPasswordVerify.Verify(edConfirm.Text) and
                        l3Same(edConfirm.Text, edPassword.Text);
 // �����
 if l3IsNil(edLogin.Text) then
  l_Result := False
 else
 // ��� ������������
 if l3IsNil(edUserName.Text) then
  l_Result := False;

 RegisterButton.Enabled := l_Result;
 cbAutoLogin.Enabled := l_Result;
//#UC END# *525AEF8102B9_525AE04E0326_impl*
end;//TPrimRegistrationForm.CheckForm

procedure TPrimRegistrationForm.IncreaseLogin;
//#UC START# *525AEF5B01E9_525AE04E0326_var*
var
 l_Char   : AnsiChar;
 l_String : Il3CString;
 l_Len    : Integer;
//#UC END# *525AEF5B01E9_525AE04E0326_var*
begin
//#UC START# *525AEF5B01E9_525AE04E0326_impl*
 edLogin.SetFocus;
 l_String := Login;
 if l3IsNil(l_String) then
  exit;
 l_Len := l3Len(l_String);
 l_Char := l3Char(l_String, l_Len - 1);

 if (l_Char in ['0'..'8']) then
 begin
  l3SetLen(l_String, l_Len - 1);
  l_Char := Succ(l_Char)
 end//l_Char in ['0'..'8']
 else
 if (l_Char in ['9']) then
 begin
  l3SetLen(l_String, l_Len - 1);
  l_Char := '0';
 end//l_Char in ['9']
 else
  l_Char := '1';
 l_String := l3Cat(l_String, l_Char);

 Login := l_String;
//#UC END# *525AEF5B01E9_525AE04E0326_impl*
end;//TPrimRegistrationForm.IncreaseLogin

function TPrimRegistrationForm.pm_GetLogin: Il3CString;
//#UC START# *525AED3900D1_525AE04E0326get_var*
//#UC END# *525AED3900D1_525AE04E0326get_var*
begin
//#UC START# *525AED3900D1_525AE04E0326get_impl*
 Result := edLogin.Text;
//#UC END# *525AED3900D1_525AE04E0326get_impl*
end;//TPrimRegistrationForm.pm_GetLogin

procedure TPrimRegistrationForm.pm_SetLogin(const aValue: Il3CString);
//#UC START# *525AED3900D1_525AE04E0326set_var*
//#UC END# *525AED3900D1_525AE04E0326set_var*
begin
//#UC START# *525AED3900D1_525AE04E0326set_impl*
 edLogin.Text := aValue;
 //����� ���������� ������ ����� ��������� ���������� ����� ���������� �������
 //���� �������� ������ 
 //http://mdp.garant.ru/pages/viewpage.action?pageId=284165335
 CheckForm;
//#UC END# *525AED3900D1_525AE04E0326set_impl*
end;//TPrimRegistrationForm.pm_SetLogin

function TPrimRegistrationForm.pm_GetPassword: Il3CString;
//#UC START# *525AED530277_525AE04E0326get_var*
//#UC END# *525AED530277_525AE04E0326get_var*
begin
//#UC START# *525AED530277_525AE04E0326get_impl*
 Result := edPassword.Text;
//#UC END# *525AED530277_525AE04E0326get_impl*
end;//TPrimRegistrationForm.pm_GetPassword

procedure TPrimRegistrationForm.pm_SetPassword(const aValue: Il3CString);
//#UC START# *525AED530277_525AE04E0326set_var*
//#UC END# *525AED530277_525AE04E0326set_var*
begin
//#UC START# *525AED530277_525AE04E0326set_impl*
 edPassword.Text := aValue;
 edConfirm.Text := aValue;
//#UC END# *525AED530277_525AE04E0326set_impl*
end;//TPrimRegistrationForm.pm_SetPassword

function TPrimRegistrationForm.pm_GetUserName: Il3CString;
//#UC START# *525AED640191_525AE04E0326get_var*
//#UC END# *525AED640191_525AE04E0326get_var*
begin
//#UC START# *525AED640191_525AE04E0326get_impl*
 Result := edUserName.Text;
//#UC END# *525AED640191_525AE04E0326get_impl*
end;//TPrimRegistrationForm.pm_GetUserName

function TPrimRegistrationForm.pm_GetEMail: Il3CString;
//#UC START# *525AEDAA0332_525AE04E0326get_var*
//#UC END# *525AEDAA0332_525AE04E0326get_var*
begin
//#UC START# *525AEDAA0332_525AE04E0326get_impl*
 Result := edEmail.Text;
//#UC END# *525AEDAA0332_525AE04E0326get_impl*
end;//TPrimRegistrationForm.pm_GetEMail

function TPrimRegistrationForm.pm_GetIsAutoLogin: Boolean;
//#UC START# *525AEDBE00D1_525AE04E0326get_var*
//#UC END# *525AEDBE00D1_525AE04E0326get_var*
begin
//#UC START# *525AEDBE00D1_525AE04E0326get_impl*
 Result := cbAutoLogin.Checked;
//#UC END# *525AEDBE00D1_525AE04E0326get_impl*
end;//TPrimRegistrationForm.pm_GetIsAutoLogin

procedure TPrimRegistrationForm.CMDialogKey(var Message: TCMDialogKey);
//#UC START# *525AF00601EC_525AE04E0326_var*
//#UC END# *525AF00601EC_525AE04E0326_var*
begin
//#UC START# *525AF00601EC_525AE04E0326_impl*
 if (Message.CharCode = VK_ESCAPE) and (fsModal in FormState) then
 begin
  ModalResult := mrCancel;
  Message.Result := 1;
 end
 else
  inherited;
//#UC END# *525AF00601EC_525AE04E0326_impl*
end;//TPrimRegistrationForm.CMDialogKey

class function TPrimRegistrationForm.Make(aIsAutoLogin: Boolean;
  aCanRelogin: Boolean;
  const aParams : IvcmMakeParams = nil;
  aZoneType     : TvcmZoneType = vcm_ztAny;
  aUserType     : TvcmEffectiveUserType = 0;
  aDataSource   : IvcmFormDataSource = nil): IvcmEntityForm;

 procedure AfterCreate(aForm : TPrimRegistrationForm);
 begin
  with aForm do
  begin
//#UC START# *525BCC29025A_525AE04E0326_impl*
   cbAutoLogin.Checked := aIsAutoLogin;
   f_CanRelogin := aCanRelogin;
   Position := poScreenCenter;
//#UC END# *525BCC29025A_525AE04E0326_impl*
  end;//with aForm
 end;

var
 l_AC : TvcmInitProc;
 l_ACHack : Pointer absolute l_AC;
begin
 l_AC := l3LocalStub(@AfterCreate);
 try
  Result := inherited Make(aParams, aZoneType, aUserType, nil, aDataSource, vcm_utAny, l_AC);
 finally
  l3FreeLocalStub(l_ACHack);
 end;//try..finally
end;

{$If not defined(NoVCL)}
procedure TPrimRegistrationForm.CreateParams(var Params: TCreateParams);
//#UC START# *48C7925A02E5_525AE04E0326_var*
//#UC END# *48C7925A02E5_525AE04E0326_var*
begin
//#UC START# *48C7925A02E5_525AE04E0326_impl*
 inherited;
 with Params do
 begin
  ExStyle := ExStyle or WS_EX_APPWINDOW and not(WS_EX_TOOLWINDOW);
  WndParent := GetDesktopWindow;
 end;
//#UC END# *48C7925A02E5_525AE04E0326_impl*
end;//TPrimRegistrationForm.CreateParams
{$IfEnd} //not NoVCL

{$If not defined(NoVCM)}
procedure TPrimRegistrationForm.InitControls;
//#UC START# *4A8E8F2E0195_525AE04E0326_var*
//#UC END# *4A8E8F2E0195_525AE04E0326_var*
begin
//#UC START# *4A8E8F2E0195_525AE04E0326_impl*
 inherited;
 ActiveControl := edLogin;

 BorderIcons := [biSystemMenu];
 BorderStyle := bsSingle;
 ClientHeight := 262;
 ClientWidth := 476;
 Font.Height := -13;

 with pnMainData do
 begin
  Align := alClient;
  BevelOuter := bvNone;
  TabOrder := 0;
 end;
  with UserNameLabel do
  begin
   AutoSize := False;
   Left := 0;
   Top := 150;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
  end;
  with PasswordLabel do
  begin
   AutoSize := False;
   Left := 0;
   Top := 102;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
  end;
  with LoginLabel do
  begin
   AutoSize := False;
   Left := 0;
   Top := 78;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
  end;
  with InfoLabel do
  begin
   Left := 222;
   Top := 214;
   Width := 249;
   Height := 17;
  end;
  with EMailLabel do
  begin
   AutoSize := False;
   Left := 0;
   Top := 174;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
  end;
  with ConfirmPasswordLabel do
  begin
   AutoSize := False;
   Left := 0;
   Top := 126;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
  end;
  with vtAsteriskLabelLogin do
  begin
   Left := 207;
   Top := 78;
   Width := 9;
   Height := 17;
   Alignment := taRightJustify;
  end;
  with vtAsteriskLabelFIO do
  begin
   Left := 207;
   Top := 150;
   Width := 9;
   Height := 17;
   Alignment := taRightJustify;
  end;
  with edPassword do
  begin
   Left := 222;
   Top := 100;
   Width := 249;
   Height := 21;
   Hint := str_edPasswordHint.AsStr;
   OnChange := edPasswordChange;
   TabOrder := 1;
   ShowHint := True;
   MaxLength := 255;
   PasswordChar := '*';
  end;
  with edUserName do
  begin
   Left := 222;
   Top := 148;
   Width := 249;
   Height := 21;
   Hint := str_edUserNameHint.AsStr;
   OnChange := edUserNameChange;
   TabOrder := 3;
   ShowHint := True;
  end;
  with edLogin do
  begin
   Left := 222;
   Top := 76;
   Width := 249;
   Height := 21;
   Hint := str_edLoginHint.AsStr;
   OnChange := edLoginChange;
   TabOrder := 0;
   ShowHint := True;
   MaxLength := 31;
  end;
  with edEmail do
  begin
   Left := 222;
   Top := 172;
   Width := 249;
   Height := 21;
   Hint := str_edEmailHint.AsStr;
   OnChange := edUserNameChange;
   TabOrder := 4;
   ShowHint := True;
  end;
  with edConfirm do
  begin
   Left := 222;
   Top := 124;
   Width := 249;
   Height := 21;
   Hint := str_edConfirmHint.AsStr;
   OnChange := edConfirmChange;
   TabOrder := 2;
   ShowHint := True;
   MaxLength := 255;
   PasswordChar := '*';
  end;
  with cbAutoLogin do
  begin
   Left := 222;
   Top := 194;
   Width := 250;
   Height := 17;
   Enabled := False;
   TabOrder := 5;
  end;
  with NewUserGroupBox do
  begin
   Left := 6;
   Top := 7;
   Width := 462;
   Height := 64;
   TabOrder := 6;
   Font.Height := -13;
  end;
   with NewUserLabel do
   begin
    WordWrap := True;
    Autosize := False;
    Left := 69;
    Top := 17;
    Width := 312;
    Height := 45;
    Layout := tlCenter;
    Font.Height := -12;
   end;
   with NewUserPaintBox do
   begin
    Left := 15;
    Top := 20;
    Width := 32;
    Height := 32;
    OnPaint := NewUserPaintBoxPaint;
   end;
 with BottomPanel do
 begin
  Align := alBottom;
  Height := 33;
  BevelOuter := bvNone;
  TabOrder := 1;
 end;
  with RegisterButton do
  begin
   Left := 265;
   Top := 0;
   Width := 205;
   Height := 25;
   DrawDefaultFrame := False;
   Default := True;
   NumGlyphs := 1;
   Enabled := False;
   TabOrder := 0;
   OnClick := RegisterButtonClick;
   DockOrientation := doNoOrient;
   DoubleBuffered := False;
  end;
  with HelpPanel do
  begin
   Left := 9;
   Top := 7;
   Width := 85;
   Height := 19;
   BevelOuter := bvNone;
   ParentColor := True;
   TabOrder := 1;
  end;
   with HelpPaintBox do
   begin
    Left := 0;
    Top := 0;
    Width :=  16;
    Height := 19;
    OnPaint := HelpPaintBoxPaint;
   end;
   with HelpLabel do
   begin
    Left := 20;
    Top := 0;
    Width := 56;
    Height := 19;
    Cursor := crHandPoint;
    TabOrder := 0;
    Font.Color := clBlue;
    Font.Height := -13;
    HighlightColor := clBlue;
    Hyperlink := True;
    OnClick := HelpLabelClick;
   end;
 RepositionControls;
//#UC END# *4A8E8F2E0195_525AE04E0326_impl*
end;//TPrimRegistrationForm.InitControls
{$IfEnd} //not NoVCM

{$If not defined(NoVCL)}
function TPrimRegistrationForm.IsRealInstance: Boolean;
//#UC START# *4B0E846D022B_525AE04E0326_var*
//#UC END# *4B0E846D022B_525AE04E0326_var*
begin
//#UC START# *4B0E846D022B_525AE04E0326_impl*
 Result := True;
//#UC END# *4B0E846D022B_525AE04E0326_impl*
end;//TPrimRegistrationForm.IsRealInstance
{$IfEnd} //not NoVCL

procedure TPrimRegistrationForm.MakeControls;
begin
 inherited;
 f_pnMainData := TvtPanel.Create(Self);
 f_pnMainData.Name := 'pnMainData';
 f_pnMainData.Parent := Self;
 f_UserNameLabel := TvtLabel.Create(Self);
 f_UserNameLabel.Name := 'UserNameLabel';
 f_UserNameLabel.Parent := pnMainData;
 f_UserNameLabel.Caption := '��� ������������:';
 f_PasswordLabel := TvtLabel.Create(Self);
 f_PasswordLabel.Name := 'PasswordLabel';
 f_PasswordLabel.Parent := pnMainData;
 f_PasswordLabel.Caption := '����� ������:';
 f_LoginLabel := TvtLabel.Create(Self);
 f_LoginLabel.Name := 'LoginLabel';
 f_LoginLabel.Parent := pnMainData;
 f_LoginLabel.Caption := '����� ��������������� ���:';
 f_InfoLabel := TvtLabel.Create(Self);
 f_InfoLabel.Name := 'InfoLabel';
 f_InfoLabel.Parent := pnMainData;
 f_InfoLabel.Caption := '* - ����, ������������ ��� ����������';
 f_EMailLabel := TvtLabel.Create(Self);
 f_EMailLabel.Name := 'EMailLabel';
 f_EMailLabel.Parent := pnMainData;
 f_EMailLabel.Caption := '����������� �����:';
 f_ConfirmPasswordLabel := TvtLabel.Create(Self);
 f_ConfirmPasswordLabel.Name := 'ConfirmPasswordLabel';
 f_ConfirmPasswordLabel.Parent := pnMainData;
 f_ConfirmPasswordLabel.Caption := '������������� ������:';
 f_vtAsteriskLabelLogin := TvtLabel.Create(Self);
 f_vtAsteriskLabelLogin.Name := 'vtAsteriskLabelLogin';
 f_vtAsteriskLabelLogin.Parent := pnMainData;
 f_vtAsteriskLabelLogin.Caption := '*';
 f_vtAsteriskLabelFIO := TvtLabel.Create(Self);
 f_vtAsteriskLabelFIO.Name := 'vtAsteriskLabelFIO';
 f_vtAsteriskLabelFIO.Parent := pnMainData;
 f_vtAsteriskLabelFIO.Caption := '*';
 f_edPassword := TnscComboBoxWithPwdChar.Create(Self);
 f_edPassword.Name := 'edPassword';
 f_edPassword.Parent := pnMainData;
 f_edUserName := TnscEdit.Create(Self);
 f_edUserName.Name := 'edUserName';
 f_edUserName.Parent := pnMainData;
 f_edLogin := TnscEdit.Create(Self);
 f_edLogin.Name := 'edLogin';
 f_edLogin.Parent := pnMainData;
 f_edEmail := TnscEdit.Create(Self);
 f_edEmail.Name := 'edEmail';
 f_edEmail.Parent := pnMainData;
 f_edConfirm := TnscComboBoxWithPwdChar.Create(Self);
 f_edConfirm.Name := 'edConfirm';
 f_edConfirm.Parent := pnMainData;
 f_cbAutoLogin := TvtCheckBox.Create(Self);
 f_cbAutoLogin.Name := 'cbAutoLogin';
 f_cbAutoLogin.Parent := pnMainData;
 f_cbAutoLogin.Caption := '��������� ������';
 f_NewUserGroupBox := TvtGroupBox.Create(Self);
 f_NewUserGroupBox.Name := 'NewUserGroupBox';
 f_NewUserGroupBox.Parent := pnMainData;
 f_NewUserGroupBox.Caption := '����� ������������';
 f_NewUserLabel := TvtLabel.Create(Self);
 f_NewUserLabel.Name := 'NewUserLabel';
 f_NewUserLabel.Parent := NewUserGroupBox;
 f_NewUserLabel.Caption := '����� ������ ������ � �������� ������ ���������� ������������������ � �������, ������ ���� ������� ������.';
 f_NewUserPaintBox := TPaintBox.Create(Self);
 f_NewUserPaintBox.Name := 'NewUserPaintBox';
 f_NewUserPaintBox.Parent := NewUserGroupBox;
 f_BottomPanel := TvtPanel.Create(Self);
 f_BottomPanel.Name := 'BottomPanel';
 f_BottomPanel.Parent := Self;
 f_RegisterButton := TElPopupButton.Create(Self);
 f_RegisterButton.Name := 'RegisterButton';
 f_RegisterButton.Parent := BottomPanel;
 f_RegisterButton.Caption := '������������������';
 f_HelpPanel := TvtPanel.Create(Self);
 f_HelpPanel.Name := 'HelpPanel';
 f_HelpPanel.Parent := BottomPanel;
 f_HelpPaintBox := TPaintBox.Create(Self);
 f_HelpPaintBox.Name := 'HelpPaintBox';
 f_HelpPaintBox.Parent := HelpPanel;
 f_HelpLabel := TvtFocusLabel.Create(Self);
 f_HelpLabel.Name := 'HelpLabel';
 f_HelpLabel.Parent := HelpPanel;
 f_HelpLabel.Caption := '������';
end;

{$IfEnd} //not Admin AND not Monitorings

initialization
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_edPasswordHint
 str_edPasswordHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_edUserNameHint
 str_edUserNameHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_edLoginHint
 str_edLoginHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_edEmailHint
 str_edEmailHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_edConfirmHint
 str_edConfirmHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_errLoginIsTooLong
 str_errLoginIsTooLong.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings) AND not defined(NoScripts)}
// ����������� PrimRegistration
 TtfwClassRef.Register(TPrimRegistrationForm);
{$IfEnd} //not Admin AND not Monitorings AND not NoScripts

end.