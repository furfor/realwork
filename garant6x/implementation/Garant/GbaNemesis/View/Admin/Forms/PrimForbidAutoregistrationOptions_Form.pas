unit PrimForbidAutoregistrationOptions_Form;

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Admin\Forms\PrimForbidAutoregistrationOptions_Form.pas"
// ���������: "VCMForm"
// ������� ������: "PrimForbidAutoregistrationOptions" MUID: (4C88F1C30376)
// ��� ����: "TPrimForbidAutoregistrationOptionsForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If Defined(Admin)}
uses
 l3IntfUses
 , PrimForbidAutoregistration_Form
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Result_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 {$If Defined(Nemesis)}
 , nscComboBox
 {$IfEnd} // Defined(Nemesis)
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TPrimForbidAutoregistrationOptionsForm = class(TPrimForbidAutoregistrationForm)
  protected
   function SaveAdminInfo: Boolean;
   {$If NOT Defined(NoVCM)}
   procedure InitEntities; override;
    {* �������������� �������� �� �� dfm.
             ����� ��� ���������� ��������� ��� �������� VCM �� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
  public
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_Test(const aParams: IvcmTestParamsPrim);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ }
   {$IfEnd} // NOT Defined(NoVCM)
 end;//TPrimForbidAutoregistrationOptionsForm
{$IfEnd} // Defined(Admin)

implementation

{$If Defined(Admin)}
uses
 l3ImplUses
 , nsVerifyValue
 , l3String
 , AdminDomainInterfaces
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
 //#UC START# *4C88F1C30376impl_uses*
 //#UC END# *4C88F1C30376impl_uses*
;

function TPrimForbidAutoregistrationOptionsForm.SaveAdminInfo: Boolean;

 procedure lp_SelectComboBox(const aComboBox: TnscComboBox);
 //#UC START# *4C8A05EA005B__var*
 //#UC END# *4C8A05EA005B__var*
 begin
 //#UC START# *4C8A05EA005B__impl*
  with aComboBox do
  begin
   SetFocus;
   SelectAll;
  end;//with cbEmail do
 //#UC END# *4C8A05EA005B__impl*
 end;//lp_SelectComboBox

//#UC START# *4C89FF5C0352_4C88F1C30376_var*
//#UC END# *4C89FF5C0352_4C88F1C30376_var*
begin
//#UC START# *4C89FF5C0352_4C88F1C30376_impl*
 Result := False;
 with dsForbidAutoregistration do
 begin
  try
   Phone := cbPhone.Text;
  except
   on E: EdsMaxLengthExceed do
   begin
    Ask(err_MaxStringLength, [E.MaxLength]);
    lp_SelectComboBox(cbPhone);
    Exit;
   end;//on EdsMaxLengthExceed do
  end;//try..except
  try
   Email := cbEmail.Text;
  except
   on E: EdsMaxLengthExceed do
   begin
    Ask(err_MaxStringLength, [E.MaxLength]);
    lp_SelectComboBox(cbEmail);
    Exit;
   end;//on EdsMaxLengthExceed do
  end;//try..except
 end;//with dsForbidAutoregistration do
 Result := True;
//#UC END# *4C89FF5C0352_4C88F1C30376_impl*
end;//TPrimForbidAutoregistrationOptionsForm.SaveAdminInfo

{$If NOT Defined(NoVCM)}
procedure TPrimForbidAutoregistrationOptionsForm.Result_Ok_Test(const aParams: IvcmTestParamsPrim);
 {* OK }
//#UC START# *4C762A1501FC_4C88F1C30376test_var*
//#UC END# *4C762A1501FC_4C88F1C30376test_var*
begin
//#UC START# *4C762A1501FC_4C88F1C30376test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := not l3IsNil(cbPhone.Text) or
  (not l3IsNil(cbEmail.Text) and nsEmailVerify.Verify(cbEmail.Text));
//#UC END# *4C762A1501FC_4C88F1C30376test_impl*
end;//TPrimForbidAutoregistrationOptionsForm.Result_Ok_Test
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimForbidAutoregistrationOptionsForm.Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
 {* OK }
//#UC START# *4C762A1501FC_4C88F1C30376exec_var*
//#UC END# *4C762A1501FC_4C88F1C30376exec_var*
begin
//#UC START# *4C762A1501FC_4C88F1C30376exec_impl*
 if SaveAdminInfo then
 begin
  dsForbidAutoregistration.NeedForbid := True;
  SafeClose;
 end;//if SaveAdminInfo then
//#UC END# *4C762A1501FC_4C88F1C30376exec_impl*
end;//TPrimForbidAutoregistrationOptionsForm.Result_Ok_Execute
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimForbidAutoregistrationOptionsForm.Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ }
//#UC START# *4C762C910358_4C88F1C30376exec_var*
//#UC END# *4C762C910358_4C88F1C30376exec_var*
begin
//#UC START# *4C762C910358_4C88F1C30376exec_impl*
 dsForbidAutoregistration.NeedForbid := False;
 SafeClose;
//#UC END# *4C762C910358_4C88F1C30376exec_impl*
end;//TPrimForbidAutoregistrationOptionsForm.Result_Cancel_Execute
{$IfEnd} // NOT Defined(NoVCM)

{$If NOT Defined(NoVCM)}
procedure TPrimForbidAutoregistrationOptionsForm.InitEntities;
 {* �������������� �������� �� �� dfm.
             ����� ��� ���������� ��������� ��� �������� VCM �� ������ }
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Result, nil);
  ToolbarAtBottom(en_Result);
  PublishOp(en_Result, op_Ok, Result_Ok_Execute, Result_Ok_Test, nil);
  ShowInContextMenu(en_Result, op_Ok, False);
  ShowInToolbar(en_Result, op_Ok, True);
  PublishOp(en_Result, op_Cancel, Result_Cancel_Execute, nil, nil);
  ShowInContextMenu(en_Result, op_Cancel, False);
  ShowInToolbar(en_Result, op_Cancel, True);
 end;//with Entities.Entities
end;//TPrimForbidAutoregistrationOptionsForm.InitEntities
{$IfEnd} // NOT Defined(NoVCM)

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimForbidAutoregistrationOptionsForm);
 {* ����������� PrimForbidAutoregistrationOptions }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // Defined(Admin)

end.
