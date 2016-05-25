unit PrimGroupProperty_Form;
 {* �������� ������ }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Admin\Forms\PrimGroupProperty_Form.pas"
// ���������: "VCMForm"
// ������� ������: "PrimGroupProperty" MUID: (4AC4ED6801F3)
// ��� ����: "TPrimGroupPropertyForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If Defined(Admin)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCM)}
 , vcmEntityForm
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Result_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 , AdminInterfaces
 {$If Defined(Nemesis)}
 , nscComboBox
 {$IfEnd} // Defined(Nemesis)
 , vtLabel
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TPrimGroupPropertyForm = class({$If NOT Defined(NoVCM)}
 TvcmEntityForm
 {$IfEnd} // NOT Defined(NoVCM)
 )
  {* �������� ������ }
  private
   f_edName: TnscEdit;
    {* ���� ��� �������� edName }
   f_Label1: TvtLabel;
    {* ���� ��� �������� Label1 }
  protected
   f_Data: IbsEditGroupName;
  protected
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   {$If NOT Defined(NoVCM)}
   procedure InitControls; override;
    {* ��������� ������������� ���������. ��� ���������� � �������� }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure InitEntities; override;
    {* �������������� �������� �� �� dfm.
             ����� ��� ���������� ��������� ��� �������� VCM �� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure MakeControls; override;
   {$IfEnd} // NOT Defined(NoVCM)
  public
   class function Make(const aData: IbsEditGroupName): BadFactoryType; reintroduce;
   {$If NOT Defined(NoVCM)}
   procedure Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
    {* ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
    {* ������ }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_Test(const aParams: IvcmTestParamsPrim);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
   {$If NOT Defined(NoVCM)}
   procedure Result_Ok_GetState(var State: TvcmOperationStateIndex);
    {* OK }
   {$IfEnd} // NOT Defined(NoVCM)
  public
   property edName: TnscEdit
    read f_edName;
   property Label1: TvtLabel
    read f_Label1;
    {* ��� ������ }
 end;//TPrimGroupPropertyForm
{$IfEnd} // Defined(Admin)

implementation

{$If Defined(Admin)}
uses
 l3ImplUses
 , l3StringIDEx
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 , l3String
 {$If NOT Defined(NoVCL)}
 , Forms
 {$IfEnd} // NOT Defined(NoVCL)
 , l3MessageID
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 , PrimGroupProperty_admCreateGroup_UserType
 , PrimGroupProperty_admRenameGroup_UserType
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
;

{$If NOT Defined(NoVCM)}
const
 {* ������������ ������ admCreateGroupLocalConstants }
 str_admCreateGroupCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'admCreateGroupCaption'; rValue : '����� ������');
  {* ��������� ����������������� ���� "����� ������" }
 {* ������������ ������ admRenameGroupLocalConstants }
 str_admRenameGroupCaption: Tl3StringIDEx = (rS : -1; rLocalized : false; rKey : 'admRenameGroupCaption'; rValue : '������������� ������');
  {* ��������� ����������������� ���� "������������� ������" }

class function TPrimGroupPropertyForm.Make(const aData: IbsEditGroupName): BadFactoryType;
var
 l_Inst : TPrimGroupPropertyForm;
begin
 l_Inst := Create(aData);
 try
  Result := l_Inst;
 finally
  l_Inst.Free;
 end;//try..finally
end;//TPrimGroupPropertyForm.Make

procedure TPrimGroupPropertyForm.Result_Cancel_Test(const aParams: IvcmTestParamsPrim);
 {* ������ }
//#UC START# *4A8AD46D0226_4AC4ED6801F3test_var*
//#UC END# *4A8AD46D0226_4AC4ED6801F3test_var*
begin
//#UC START# *4A8AD46D0226_4AC4ED6801F3test_impl*
 // - ������ �� ������
//#UC END# *4A8AD46D0226_4AC4ED6801F3test_impl*
end;//TPrimGroupPropertyForm.Result_Cancel_Test

procedure TPrimGroupPropertyForm.Result_Cancel_Execute(const aParams: IvcmExecuteParamsPrim);
 {* ������ }
//#UC START# *4A8AD46D0226_4AC4ED6801F3exec_var*
//#UC END# *4A8AD46D0226_4AC4ED6801F3exec_var*
begin
//#UC START# *4A8AD46D0226_4AC4ED6801F3exec_impl*
 ModalResult := mrCancel;
//#UC END# *4A8AD46D0226_4AC4ED6801F3exec_impl*
end;//TPrimGroupPropertyForm.Result_Cancel_Execute

procedure TPrimGroupPropertyForm.Result_Ok_Test(const aParams: IvcmTestParamsPrim);
 {* OK }
//#UC START# *4A97EBE702F8_4AC4ED6801F3test_var*
//#UC END# *4A97EBE702F8_4AC4ED6801F3test_var*
begin
//#UC START# *4A97EBE702F8_4AC4ED6801F3test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := not l3IsNil(edName.CText);
//#UC END# *4A97EBE702F8_4AC4ED6801F3test_impl*
end;//TPrimGroupPropertyForm.Result_Ok_Test

procedure TPrimGroupPropertyForm.Result_Ok_Execute(const aParams: IvcmExecuteParamsPrim);
 {* OK }
//#UC START# *4A97EBE702F8_4AC4ED6801F3exec_var*
//#UC END# *4A97EBE702F8_4AC4ED6801F3exec_var*
begin
//#UC START# *4A97EBE702F8_4AC4ED6801F3exec_impl*
 f_Data.Name := edName.CText;
 ModalResult := mrOk;
//#UC END# *4A97EBE702F8_4AC4ED6801F3exec_impl*
end;//TPrimGroupPropertyForm.Result_Ok_Execute

procedure TPrimGroupPropertyForm.Result_Ok_GetState(var State: TvcmOperationStateIndex);
 {* OK }
//#UC START# *4A97EBE702F8_4AC4ED6801F3getstate_var*
//#UC END# *4A97EBE702F8_4AC4ED6801F3getstate_var*
begin
//#UC START# *4A97EBE702F8_4AC4ED6801F3getstate_impl*
 // - ������ �� ������
//#UC END# *4A97EBE702F8_4AC4ED6801F3getstate_impl*
end;//TPrimGroupPropertyForm.Result_Ok_GetState

procedure TPrimGroupPropertyForm.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_4AC4ED6801F3_var*
//#UC END# *479731C50290_4AC4ED6801F3_var*
begin
//#UC START# *479731C50290_4AC4ED6801F3_impl*
 f_Data := nil;
 inherited;
//#UC END# *479731C50290_4AC4ED6801F3_impl*
end;//TPrimGroupPropertyForm.Cleanup

procedure TPrimGroupPropertyForm.InitControls;
 {* ��������� ������������� ���������. ��� ���������� � �������� }
//#UC START# *4A8E8F2E0195_4AC4ED6801F3_var*
//#UC END# *4A8E8F2E0195_4AC4ED6801F3_var*
begin
//#UC START# *4A8E8F2E0195_4AC4ED6801F3_impl*
 BorderIcons := [biSystemMenu];
 BorderStyle := bsDialog;
 ClientHeight := 39;
 ClientWidth := 279;
 ShowHint := True;

 with Label1 do
 begin
  Left := 8;
  Top := 12;
  AutoSize := False;
  Width := 105;
  Height := 16;
 end;

 with edName do
 begin
  Left := 120;
  Top := 8;
  Width := 153;
  Height := 21;
  TabOrder := 0;
  ParentShowHint := False;
  ShowHint := True;
 end;
//#UC END# *4A8E8F2E0195_4AC4ED6801F3_impl*
end;//TPrimGroupPropertyForm.InitControls

procedure TPrimGroupPropertyForm.InitEntities;
 {* �������������� �������� �� �� dfm.
             ����� ��� ���������� ��������� ��� �������� VCM �� ������ }
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Result, nil);
  PublishOp(en_Result, op_Cancel, Result_Cancel_Execute, Result_Cancel_Test, nil);
  PublishOp(en_Result, op_Ok, Result_Ok_Execute, Result_Ok_Test, Result_Ok_GetState);
  PublishOp(en_Result, op_Ok, Result_Ok_Execute, Result_Ok_Test, Result_Ok_GetState);
  PublishOp(en_Result, op_Cancel, Result_Cancel_Execute, Result_Cancel_Test, Result_Cancel_GetState);
 end;//with Entities.Entities
end;//TPrimGroupPropertyForm.InitEntities

procedure TPrimGroupPropertyForm.MakeControls;
begin
 inherited;
 with AddUsertype(admCreateGroupName,
  str_admCreateGroupCaption,
  str_admCreateGroupCaption,
  False,
  -1,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(admCreateGroupName
 with AddUsertype(admRenameGroupName,
  str_admRenameGroupCaption,
  str_admRenameGroupCaption,
  False,
  -1,
  -1,
  '',
  nil,
  nil,
  nil,
  vcm_ccNone) do
 begin
 end;//with AddUsertype(admRenameGroupName
 f_edName := TnscEdit.Create(Self);
 f_edName.Name := 'edName';
 f_edName.Parent := Self;
 f_Label1 := TvtLabel.Create(Self);
 f_Label1.Name := 'Label1';
 f_Label1.Parent := Self;
 f_Label1.Caption := '��� ������';
end;//TPrimGroupPropertyForm.MakeControls

initialization
 str_admCreateGroupCaption.Init;
 {* ������������� str_admCreateGroupCaption }
 str_admRenameGroupCaption.Init;
 {* ������������� str_admRenameGroupCaption }
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimGroupPropertyForm);
 {* ����������� PrimGroupProperty }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(NoVCM)

{$IfEnd} // Defined(Admin)
end.
