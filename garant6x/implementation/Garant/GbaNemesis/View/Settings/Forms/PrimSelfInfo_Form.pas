unit PrimSelfInfo_Form;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Settings/Forms/PrimSelfInfo_Form.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMForm::Class>> F1 �������� ����������::Settings::View::Settings::PrimSelfInfo
//
// ��������������� ������
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
  {$If not defined(NoVCL)}
  ,
  Controls
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
  AdminDomainInterfaces,
  vtPanel,
  vtFocusLabel
  {$If defined(Nemesis)}
  ,
  nscComboBox
  {$IfEnd} //Nemesis
  ,
  vtLabel,
  l3StringIDEx,
  ElPopBtn,
  vcmExternalInterfaces {a},
  vcmInterfaces {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}
type
 TPrimSelfInfoForm = {form} class(TvcmEntityForm)
  {* ��������������� ������ }
 private
 // private fields
   f_PasswordChanged : Boolean;
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
   f_Info : InsUserProperty;
    {* ���� ��� �������� Info}
 protected
  procedure MakeControls; override;
 private
 // private methods
   procedure EdPasswordChange(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure EdConfirmChange(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure EdUserNameChange(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure RegisterButtonClick(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure HelpLabelClick(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure HelpPaintBoxPaint(Sender: TObject);
     {* TNotifyEvent is used for events that do not require parameters. }
   procedure CheckFields;
     {* ��������� ������ CheckFields }
   procedure InitUserFields;
     {* ��������� ������ InitUserFields }
   procedure Save;
     {* ��������� ������ Save }
   procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   {$If not defined(NoVCM)}
   procedure InitControls; override;
     {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} //not NoVCM
   procedure ClearFields; override;
     {* ��������� ������ ClearFields }
    {$If not defined(NoVCM)}
   procedure SetupFormLayout; override;
     {* ��� ����� ��������� ������� ��� ����� }
    {$IfEnd} //not NoVCM
 public
 // public properties
   property pnMainData: TvtPanel
     read f_pnMainData;
   property UserNameLabel: TvtLabel
     read f_UserNameLabel;
     {* ��� ������������: }
   property PasswordLabel: TvtLabel
     read f_PasswordLabel;
     {* ������: }
   property LoginLabel: TvtLabel
     read f_LoginLabel;
     {* ��������������� ���: }
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
   property BottomPanel: TvtPanel
     read f_BottomPanel;
   property RegisterButton: TElPopupButton
     read f_RegisterButton;
     {* ��������� }
   property HelpPanel: TvtPanel
     read f_HelpPanel;
   property HelpPaintBox: TPaintBox
     read f_HelpPaintBox;
   property HelpLabel: TvtFocusLabel
     read f_HelpLabel;
     {* ������ }
   property Info: InsUserProperty
     read f_Info;
 end;//TPrimSelfInfoForm

 TvcmEntityFormRef = TPrimSelfInfoForm;
{$IfEnd} //not Admin AND not Monitorings

implementation

{$If not defined(Admin) AND not defined(Monitorings)}
uses
  nsUserProperty,
  DataAdapter,
  SecurityUnit
  {$If not defined(NoVCL)}
  ,
  Forms
  {$IfEnd} //not NoVCL
  ,
  Graphics,
  SearchRes,
  nsConst,
  nsVerifyValue,
  l3Base,
  l3String,
  nsTypes
  {$If not defined(NoVCM)}
  ,
  vcmMessagesSupport
  {$IfEnd} //not NoVCM
  ,
  l3Chars,
  Windows,
  l3MessageID
  {$If not defined(NoScripts)}
  ,
  TtfwClassRef_Proxy
  {$IfEnd} //not NoScripts
  ,
  StdRes {a}
  ;
{$IfEnd} //not Admin AND not Monitorings

{$If not defined(Admin) AND not defined(Monitorings)}

var
   { ������������ ������ SelfInfo Hints }
  str_PrimSelfInfo_edPasswordHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrimSelfInfo_edPasswordHint'; rValue : '������� ������ ��� ����������� � �������');
   { '������� ������ ��� ����������� � �������' }
  str_PrimSelfInfo_edUserNameHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrimSelfInfo_edUserNameHint'; rValue : '������� ���� ���, ������� � ��������');
   { '������� ���� ���, ������� � ��������' }
  str_PrimSelfInfo_edLoginHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrimSelfInfo_edLoginHint'; rValue : '������� ��� ��� ������ � ������� ������');
   { '������� ��� ��� ������ � ������� ������' }
  str_PrimSelfInfo_edEmailHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrimSelfInfo_edEmailHint'; rValue : '����������� �����: �����, �� ������� ����� ������ ������� ���� ������');
   { '����������� �����: �����, �� ������� ����� ������ ������� ���� ������' }
  str_PrimSelfInfo_edConfirmHint : Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'PrimSelfInfo_edConfirmHint'; rValue : '����������� ������, ��������� � ���������� ������');
   { '����������� ������, ��������� � ���������� ������' }

// start class TPrimSelfInfoForm

procedure TPrimSelfInfoForm.EdPasswordChange(Sender: TObject);
//#UC START# *5261516401F6_4B5430390380_var*
//#UC END# *5261516401F6_4B5430390380_var*
begin
//#UC START# *5261516401F6_4B5430390380_impl*
 f_PasswordChanged := True;
 CheckFields;
//#UC END# *5261516401F6_4B5430390380_impl*
end;//TPrimSelfInfoForm.EdPasswordChange

procedure TPrimSelfInfoForm.EdConfirmChange(Sender: TObject);
//#UC START# *5261516C030F_4B5430390380_var*
//#UC END# *5261516C030F_4B5430390380_var*
begin
//#UC START# *5261516C030F_4B5430390380_impl*
 CheckFields;
//#UC END# *5261516C030F_4B5430390380_impl*
end;//TPrimSelfInfoForm.EdConfirmChange

procedure TPrimSelfInfoForm.EdUserNameChange(Sender: TObject);
//#UC START# *5261517401D4_4B5430390380_var*
//#UC END# *5261517401D4_4B5430390380_var*
begin
//#UC START# *5261517401D4_4B5430390380_impl*
 CheckFields;
//#UC END# *5261517401D4_4B5430390380_impl*
end;//TPrimSelfInfoForm.EdUserNameChange

procedure TPrimSelfInfoForm.RegisterButtonClick(Sender: TObject);
//#UC START# *5261517B03B9_4B5430390380_var*
//#UC END# *5261517B03B9_4B5430390380_var*
begin
//#UC START# *5261517B03B9_4B5430390380_impl*
 Save;
//#UC END# *5261517B03B9_4B5430390380_impl*
end;//TPrimSelfInfoForm.RegisterButtonClick

procedure TPrimSelfInfoForm.HelpLabelClick(Sender: TObject);
//#UC START# *5261518F02B3_4B5430390380_var*
//#UC END# *5261518F02B3_4B5430390380_var*
begin
//#UC START# *5261518F02B3_4B5430390380_impl*
 Application.HelpSystem.ShowHelp('ut_SelfInfo', '');
//#UC END# *5261518F02B3_4B5430390380_impl*
end;//TPrimSelfInfoForm.HelpLabelClick

procedure TPrimSelfInfoForm.HelpPaintBoxPaint(Sender: TObject);
//#UC START# *526151A2028E_4B5430390380_var*
//#UC END# *526151A2028E_4B5430390380_var*
begin
//#UC START# *526151A2028E_4B5430390380_impl*
 with Sender as TPaintBox do
  nsSearchRes.ImageList16x16.Draw(Canvas, width - c_SmallSizeIcon, (Height - c_SmallSizeIcon) div 2, c_srchHelp);
//#UC END# *526151A2028E_4B5430390380_impl*
end;//TPrimSelfInfoForm.HelpPaintBoxPaint

procedure TPrimSelfInfoForm.CheckFields;
//#UC START# *5261520B011E_4B5430390380_var*
var
 l_Result : Boolean;
//#UC END# *5261520B011E_4B5430390380_var*
begin
//#UC START# *5261520B011E_4B5430390380_impl*
 Info.IsChanged := True;

 l_Result := True;
 // ��������� �������
 edLogin.TextValid := nsLoginVerify.Verify(edLogin.Text);
 edPassword.TextValid := nsPasswordVerify.Verify(edPassword.Text);
 edEmail.TextValid := nsEmailVerify.Verify(edEmail.Text);
 edConfirm.TextValid := nsPasswordVerify.Verify(edConfirm.Text) and l3Same(edConfirm.Text, edPassword.Text);
 // �����
 if l3IsNil(edLogin.Text) then
  l_Result := False
 else
 // ��� ������������
 if l3IsNil(edUserName.Text) then
  l_Result := False;

 RegisterButton.Enabled := l_Result;
//#UC END# *5261520B011E_4B5430390380_impl*
end;//TPrimSelfInfoForm.CheckFields

procedure TPrimSelfInfoForm.InitUserFields;
//#UC START# *5261521202EE_4B5430390380_var*
//#UC END# *5261521202EE_4B5430390380_var*
begin
//#UC START# *5261521202EE_4B5430390380_impl*
 f_PasswordChanged := False;

 if Info = nil then
  Exit;
  
 edLogin.TextValid := True;
 edPassword.TextValid := True;
 edEmail.TextValid := True;
 edConfirm.TextValid := True;
 if Info.HasPassword then
 begin
  edPassword.Text := nsCStr(cHasPassword);
  edConfirm.Text := nsCStr(cHasPassword);
 end
 else
 begin
  edPassword.Text := nil;
  edConfirm.Text := nil;
 end;

 edLogin.Text := Info.Login;
 edLogin.Enabled := False;
 edUserName.Text := Info.Name;
 edEmail.Text := Info.Mail;
//#UC END# *5261521202EE_4B5430390380_impl*
end;//TPrimSelfInfoForm.InitUserFields

procedure TPrimSelfInfoForm.Save;
//#UC START# *5261521D0133_4B5430390380_var*
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
//#UC END# *5261521D0133_4B5430390380_var*
begin
//#UC START# *5261521D0133_4B5430390380_impl*
 if not l3Same(edPassword.Text, edConfirm.Text) then
 begin
  lpClearPassword;
  vcmAsk(err_PasswordAndConfirmNotSame);
  Exit;
 end
 else
 if not nsPasswordVerify.Verify(edPassword.Text) then
 begin
  lpClearPassword;
  vcmAsk(err_PasswordHasErrorSimbols);
  Exit;
 end
 else
 // ���� ���
 if l3IsNil(edUserName.Text) then
 begin
  lpSetFocus(edUserName);
  vcmAsk(err_SurnameNotDefined);
  Exit;
 end
 else
 // Email
 if not l3IsNil(edEmail.Text) and not nsEmailVerify.Verify(edEmail.Text) then
 begin
  lpSetFocus(edEmail);
  vcmAsk(err_EmailNotValid);
  Exit;
 end;

 if l3Same(edPassword.Text, cHasPassword) then
 try
  Info.SaveUserInfo(l3PCharLen(edUserName.Text),
                    l3PCharLen(edEmail.Text),
                    cc_EmptyStr)
 except
  on ENoMoreProfiles do
   Say(err_UsersLicenceViolation);
  on ENoMorePrivilegedProfiles do
   Say(err_PrivilegedUsersLicenceViolation);
 end
 else
 try
  Info.SaveUserInfo(l3PCharLen(edUserName.Text),
                    l3PCharLen(edEmail.Text),
                    l3PCharLen(edPassword.Text),
                    f_PasswordChanged);
  if f_PasswordChanged then
   defDataAdapter.RegistryPassword := l3Str(edPassword.Text);
 except
  on ENoMoreProfiles do
   Say(err_UsersLicenceViolation);
  on ENoMorePrivilegedProfiles do
   Say(err_PrivilegedUsersLicenceViolation);
 end;
 ModalResult := mrOk;
//#UC END# *5261521D0133_4B5430390380_impl*
end;//TPrimSelfInfoForm.Save

procedure TPrimSelfInfoForm.CMDialogKey(var Message: TCMDialogKey);
//#UC START# *526152250198_4B5430390380_var*
//#UC END# *526152250198_4B5430390380_var*
begin
//#UC START# *526152250198_4B5430390380_impl*
 if (Message.CharCode = VK_ESCAPE) and (fsModal in FormState) then
 begin
  ModalResult := mrCancel;
  Message.Result := 1;
 end else
  inherited;
//#UC END# *526152250198_4B5430390380_impl*
end;//TPrimSelfInfoForm.CMDialogKey

procedure TPrimSelfInfoForm.Cleanup;
//#UC START# *479731C50290_4B5430390380_var*
//#UC END# *479731C50290_4B5430390380_var*
begin
//#UC START# *479731C50290_4B5430390380_impl*
 f_Info := nil;
 inherited Cleanup;
//#UC END# *479731C50290_4B5430390380_impl*
end;//TPrimSelfInfoForm.Cleanup

{$If not defined(NoVCM)}
procedure TPrimSelfInfoForm.InitControls;
//#UC START# *4A8E8F2E0195_4B5430390380_var*
var
 l_Profile: IUserProfile;
//#UC END# *4A8E8F2E0195_4B5430390380_var*
begin
//#UC START# *4A8E8F2E0195_4B5430390380_impl*
 if (ZoneType <> vcm_ztForToolbarsInfo) then
 begin
  defDataAdapter.NativeAdapter.MakeUserManager.GetSelfProfile(l_Profile);
  f_Info := TnsUserProperty.Make(l_Profile);
 end; 
 inherited;

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
   Top := 84;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
   BiDiMode := bdLeftToRight;
  end;
  with PasswordLabel do
  begin
   AutoSize := False;
   Left := 0;
   Top := 36;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
   BiDiMode := bdLeftToRight;
  end;
  with LoginLabel do
  begin
   AutoSize := False;
   Left := 0;
   Top := 12;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
   BiDiMode := bdLeftToRight;
  end;
  with InfoLabel do
  begin
   Left := 222;
   Top := 131;
   Width := 235;
   Height := 16;
  end;
  with EMailLabel do
  begin
   AutoSize := False;
   Left := 0;
   Top := 108;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
   BiDiMode := bdLeftToRight;
  end;
  with ConfirmPasswordLabel do
  begin
   AutoSize := False;
   Left := 0;
   Top := 60;
   Width := 207;
   Height := 17;
   Alignment := taRightJustify;
   BiDiMode := bdLeftToRight;
  end;
  with vtAsteriskLabelLogin do
  begin
   Left := 207;
   Top := 12;
   Width := 9;
   Height := 16;
   Alignment := taRightJustify;
   BiDiMode := bdLeftToRight;
  end;
  with vtAsteriskLabelFIO do
  begin
   Left := 207;
   Top := 84;
   Width := 9;
   Height := 16;
   Alignment := taRightJustify;
   BiDiMode := bdLeftToRight;
  end;
  with edLogin do
  begin
    Left := 222;
    Top := 10;
    Width := 249;
    Height := 21;
    Hint := str_PrimSelfInfo_edLoginHint.AsStr;
    TabOrder := 0;
    MaxLength := 31;
  end;
  with edPassword do
  begin
   Left := 222;
   Top := 34;
   Width := 249;
   Height := 21;
   Hint := str_PrimSelfInfo_edPasswordHint.AsStr;
   OnChange := edPasswordChange;
   TabOrder := 1;
   MaxLength := 255;
   PasswordChar := '*';
  end;
  with edConfirm do
  begin
   Left := 222;
   Top := 58;
   Width := 249;
   Height := 21;
   Hint := str_PrimSelfInfo_edConfirmHint.AsStr;
   OnChange := edConfirmChange;
   TabOrder := 2;
   MaxLength := 255;
   PasswordChar := '*';
  end;
  with edUserName do
  begin
   Left := 222;
   Top := 82;
   Width := 249;
   Height := 21;
   Hint := str_PrimSelfInfo_edUserNameHint.AsStr;
   OnChange := edUserNameChange;
   TabOrder := 3;
  end;
  with edEmail do
  begin
   Left := 222;
   Top := 106;
   Width := 249;
   Height := 21;
   Hint := str_PrimSelfInfo_edEmailHint.AsStr;
   OnChange := edUserNameChange;
   TabOrder := 4;
  end;
 with BottomPanel do
 begin
  Left := 0;
  Top := 155;
  Width := 476;
  Height := 33;
  Align := alBottom;
  BevelOuter := bvNone;
  TabOrder := 1;
 end;
  with RegisterButton do
  begin
   Left := 364;
   Top := 0;
   Width := 105;
   Height := 25;
   DrawDefaultFrame := False;
   Default := True;
   //ModalResult := mrOk;
   NumGlyphs := 1;
   Enabled := False;
   TabOrder := 0;
   OnClick := RegisterButtonClick;
   DockOrientation := doNoOrient;
  end;
  with HelpPanel do
  begin
   Left := 9;
   Top := 7;
   Width := 85;
   Height := 19;
   BevelOuter := bvNone;
   TabOrder := 1;
  end;
   with HelpPaintBox do
   begin
    Left := 0;
    Top := 0;
    Width := 16;
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
    HighlightColor := clBlue;
    Hyperlink := True;
    OnClick := HelpLabelClick;
   end;
//#UC END# *4A8E8F2E0195_4B5430390380_impl*
end;//TPrimSelfInfoForm.InitControls
{$IfEnd} //not NoVCM

procedure TPrimSelfInfoForm.ClearFields;
 {-}
begin
 {$If not defined(Admin) AND not defined(Monitorings)}
 f_Info := nil;
 {$IfEnd} //not Admin AND not Monitorings
 inherited;
end;//TPrimSelfInfoForm.ClearFields

{$If not defined(NoVCM)}
procedure TPrimSelfInfoForm.SetupFormLayout;
//#UC START# *529332B40230_4B5430390380_var*
//#UC END# *529332B40230_4B5430390380_var*
begin
//#UC START# *529332B40230_4B5430390380_impl*
 inherited;
 BorderIcons := [biSystemMenu];
 BorderStyle := bsSingle;
 ClientHeight := 188;
 ClientWidth := 476;
 Position := poScreenCenter;
 ActiveControl := edPassword;
 InitUserFields;
//#UC END# *529332B40230_4B5430390380_impl*
end;//TPrimSelfInfoForm.SetupFormLayout
{$IfEnd} //not NoVCM

procedure TPrimSelfInfoForm.MakeControls;
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
 f_PasswordLabel.Caption := '������:';
 f_LoginLabel := TvtLabel.Create(Self);
 f_LoginLabel.Name := 'LoginLabel';
 f_LoginLabel.Parent := pnMainData;
 f_LoginLabel.Caption := '��������������� ���:';
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
 f_BottomPanel := TvtPanel.Create(Self);
 f_BottomPanel.Name := 'BottomPanel';
 f_BottomPanel.Parent := Self;
 f_RegisterButton := TElPopupButton.Create(Self);
 f_RegisterButton.Name := 'RegisterButton';
 f_RegisterButton.Parent := BottomPanel;
 f_RegisterButton.Caption := '���������';
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
// ������������� str_PrimSelfInfo_edPasswordHint
 str_PrimSelfInfo_edPasswordHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_PrimSelfInfo_edUserNameHint
 str_PrimSelfInfo_edUserNameHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_PrimSelfInfo_edLoginHint
 str_PrimSelfInfo_edLoginHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_PrimSelfInfo_edEmailHint
 str_PrimSelfInfo_edEmailHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings)}
// ������������� str_PrimSelfInfo_edConfirmHint
 str_PrimSelfInfo_edConfirmHint.Init;
{$IfEnd} //not Admin AND not Monitorings
{$If not defined(Admin) AND not defined(Monitorings) AND not defined(NoScripts)}
// ����������� PrimSelfInfo
 TtfwClassRef.Register(TPrimSelfInfoForm);
{$IfEnd} //not Admin AND not Monitorings AND not NoScripts

end.