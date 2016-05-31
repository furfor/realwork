unit PrimNewsLineOptions_Form;
 {* �����. ��� ��������� ����� }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Search\Forms\PrimNewsLineOptions_Form.pas"
// ���������: "VCMForm"
// ������� ������: "PrimNewsLineOptions" MUID: (4C87BB9C0143)
// ��� ����: "TPrimNewsLineOptionsForm"

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3IntfUses
 , PrimNewsLine_Form
 {$If NOT Defined(NoVCM)}
 , OfficeLike_Tree_Controls
 {$IfEnd} // NOT Defined(NoVCM)
 , Autoreferat_InternalOperations_Controls
 {$If NOT Defined(NoVCM)}
 , vcmInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
 {$If NOT Defined(NoVCM)}
 , vcmExternalInterfaces
 {$IfEnd} // NOT Defined(NoVCM)
;

type
 TPrimNewsLineOptionsForm = class(TPrimNewsLineForm)
  {* �����. ��� ��������� ����� }
  protected
   {$If NOT Defined(NoVCM)}
   procedure InitEntities; override;
    {* �������������� �������� �� �� dfm.
             ����� ��� ���������� ��������� ��� �������� VCM �� ������ }
   {$IfEnd} // NOT Defined(NoVCM)
  public
   procedure NewsThemes_SelectCurrent_Test(const aParams: IvcmTestParamsPrim);
   procedure NewsThemes_SelectCurrent_Execute(const aParams: IvcmExecuteParamsPrim);
   procedure DateInterval_Open_Test(const aParams: IvcmTestParamsPrim);
   procedure DateInterval_Open_Execute(const aParams: IvcmExecuteParamsPrim);
 end;//TPrimNewsLineOptionsForm
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings)}
uses
 l3ImplUses
 , PrimNewsLine_nltMain_UserType
 , l3String
 , nsNewsLine
 , Windows
 {$If NOT Defined(NoVCL)}
 , Controls
 {$IfEnd} // NOT Defined(NoVCL)
 {$If NOT Defined(NoScripts)}
 , TtfwClassRef_Proxy
 {$IfEnd} // NOT Defined(NoScripts)
 {$If NOT Defined(NoVCM)}
 , StdRes
 {$IfEnd} // NOT Defined(NoVCM)
 //#UC START# *4C87BB9C0143impl_uses*
 //#UC END# *4C87BB9C0143impl_uses*
;

procedure TPrimNewsLineOptionsForm.NewsThemes_SelectCurrent_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C87BBFF0313_4C87BB9C0143test_var*
var
 l_Strings: IvcmStrings;
 l_NeedUpdateCaption: Boolean;
//#UC END# *4C87BBFF0313_4C87BB9C0143test_var*
begin
//#UC START# *4C87BBFF0313_4C87BB9C0143test_impl*
 l_Strings := aParams.Op.SubItems;
 try
  l_NeedUpdateCaption := (aParams.Op.SubItems.Count = 0) OR f_UpdateFlag;
  if f_UpdateFlag then
  begin
   if (l_Strings <> nil) then
    l_Strings.Clear;
   f_UpdateFlag := false;
  end;//f_UpdateFlag
  if (TnsNewsLine.Make.ThemeList.Count > 0) then
  begin
   aParams.Op.Flag[vcm_ofEnabled] := TnsNewsLine.Make.ThemeList.Count > 1;
   if (TnsNewsLine.Make.ThemeList.Count = 1) and l3IsNil(TnsNewsLine.Make.ThemeList[0]) then
   begin
    l_Strings.Clear;
    aParams.Op.SelectedString := aParams.Op.Caption;
    Exit;
   end;
   if (l_Strings <> nil) then
   begin
    if (l_Strings.Count = 0) then
    begin
     l_Strings.Clear;
     l_Strings.Assign(TnsNewsLine.Make.ThemeList);
    end;//l_Strings.Count = 0
    aParams.Op.SelectedString := TnsNewsLine.Make.CurrentTheme;
   end;//l_Strings <> nil
  end//TnsNewsLine.Make.ThemeList.Count > 0
  else
  begin
   aParams.Op.SelectedString := aParams.Op.Caption;
   aParams.Op.Flag[vcm_ofEnabled] := false;
  end;
 finally
  l_Strings := nil;
 end;//try..finally
 if l_NeedUpdateCaption then
 begin
  UpdateTabCaption(TnsNewsLine.Make.CurrentTheme);
 end;
//#UC END# *4C87BBFF0313_4C87BB9C0143test_impl*
end;//TPrimNewsLineOptionsForm.NewsThemes_SelectCurrent_Test

procedure TPrimNewsLineOptionsForm.NewsThemes_SelectCurrent_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C87BBFF0313_4C87BB9C0143exec_var*
//#UC END# *4C87BBFF0313_4C87BB9C0143exec_var*
begin
//#UC START# *4C87BBFF0313_4C87BB9C0143exec_impl*
 TnsNewsLine.Make.CurrentTheme := aParams.SelectedString;
 UpdateNewsLineTree;
 OpenAutoreferat(DateList.GetCurrentNode);
//#UC END# *4C87BBFF0313_4C87BB9C0143exec_impl*
end;//TPrimNewsLineOptionsForm.NewsThemes_SelectCurrent_Execute

procedure TPrimNewsLineOptionsForm.DateInterval_Open_Test(const aParams: IvcmTestParamsPrim);
//#UC START# *4C87BC6502B9_4C87BB9C0143test_var*
//#UC END# *4C87BC6502B9_4C87BB9C0143test_var*
begin
//#UC START# *4C87BC6502B9_4C87BB9C0143test_impl*
 aParams.Op.Flag[vcm_ofEnabled] := DateList.Current >= 0;
//#UC END# *4C87BC6502B9_4C87BB9C0143test_impl*
end;//TPrimNewsLineOptionsForm.DateInterval_Open_Test

procedure TPrimNewsLineOptionsForm.DateInterval_Open_Execute(const aParams: IvcmExecuteParamsPrim);
//#UC START# *4C87BC6502B9_4C87BB9C0143exec_var*
//#UC END# *4C87BC6502B9_4C87BB9C0143exec_var*
begin
//#UC START# *4C87BC6502B9_4C87BB9C0143exec_impl*
 OpenAutoreferat(DateList.GetCurrentNode);
//#UC END# *4C87BC6502B9_4C87BB9C0143exec_impl*
end;//TPrimNewsLineOptionsForm.DateInterval_Open_Execute

{$If NOT Defined(NoVCM)}
procedure TPrimNewsLineOptionsForm.InitEntities;
 {* �������������� �������� �� �� dfm.
             ����� ��� ���������� ��������� ��� �������� VCM �� ������ }
begin
 inherited;
 with Entities.Entities do
 begin
  PublishFormEntity(en_Tree, nil);
  PublishFormEntity(en_NewsThemes, nil);
  PublishFormEntity(en_DateInterval, nil);
  ContextMenuWeight(en_DateInterval, 1);
  ContextMenuWeight(en_Tree, 10);
  PublishOp(en_Tree, op_ExpandAll, nil, nil, nil);
  PublishOp(en_Tree, op_CollapseAll, nil, nil, nil);
  PublishOp(en_NewsThemes, op_SelectCurrent, NewsThemes_SelectCurrent_Execute, NewsThemes_SelectCurrent_Test, nil);
  ShowInContextMenu(en_NewsThemes, op_SelectCurrent, False);
  ShowInToolbar(en_NewsThemes, op_SelectCurrent, True);
  PublishOp(en_DateInterval, op_Open, DateInterval_Open_Execute, DateInterval_Open_Test, nil);
  ShowInContextMenu(en_DateInterval, op_Open, True);
  ShowInToolbar(en_DateInterval, op_Open, False);
  ContextMenuWeight(en_DateInterval, op_Open, 1);
 end;//with Entities.Entities
 AddUserTypeExclude(nltMainName, en_Tree, op_ExpandAll, False);
 AddUserTypeExclude(nltMainName, en_Tree, op_CollapseAll, False);
end;//TPrimNewsLineOptionsForm.InitEntities
{$IfEnd} // NOT Defined(NoVCM)

initialization
{$If NOT Defined(NoScripts)}
 TtfwClassRef.Register(TPrimNewsLineOptionsForm);
 {* ����������� PrimNewsLineOptions }
{$IfEnd} // NOT Defined(NoScripts)
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings)

end.
