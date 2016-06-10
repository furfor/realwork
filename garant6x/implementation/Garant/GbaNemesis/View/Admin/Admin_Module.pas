unit Admin_Module;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "View"
// �����: ����� �.�.
// ������: "w:/garant6x/implementation/Garant/GbaNemesis/View/Admin/Admin_Module.pas"
// �����: 07.09.2009 18:00
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<VCMFormsPack::Class>> F1 �������������::Admin::View::Admin::Admin
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If defined(Admin)}
uses
  Classes
  {$If not defined(NoVCM)}
  ,
  vcmInterfaces
  {$IfEnd} //not NoVCM
  
  {$If not defined(NoVCM)}
  ,
  vcmFormSetFactory
  {$IfEnd} //not NoVCM
  ,
  AdminInterfaces
  {$If not defined(NoVCM)}
  ,
  vcmUserControls
  {$IfEnd} //not NoVCM
  ,
  GroupProperty_Form,
  ForbidAutoregistration_Form,
  l3StringIDEx,
  PrimUserProperty_admUseProperties_UserType,
  PrimGroupList_admGroupList_UserType,
  PrimUserList_admUserList_UserType,
  PrimUserListOptions_Form,
  PrimAdminOptions_Form,
  PrimAdmin_utAdmin_UserType,
  PrimForbidAutoregistrationOptions_Form,
  PrimGroupListOptions_Form,
  PrimGroupPropertyOptions_Form,
  PrimUserPropertyOptions_Form,
  Admin_FormDefinitions_Controls
  {$If not defined(NoVCM)}
  ,
  vcmFormSetFormsCollectionItemPrim
  {$IfEnd} //not NoVCM
  ,
  fsAdmin,
  UserList_Form,
  UserProperty_Form,
  GroupList_Form,
  Admin_Form,
  vcmExternalInterfaces {a},
  vcmModule {a},
  vcmBase {a}
  ;
{$IfEnd} //Admin

{$If defined(Admin)}
type
 TAdminModule = {formspack} class(TvcmModule)
 protected
  class procedure GetEntityForms(aList : TvcmClassList); override;
 public
 // public methods
   class procedure OpenUserList(const aContainer: IvcmContainer);
   class function ShowRenameGroupDialog(const aData: IbsEditGroupName): Integer;
 end;//TAdminModule
{$IfEnd} //Admin

implementation

{$If defined(Admin)}
uses
  l3Base {a},
  l3MessageID,
  SysUtils,
  deAdmin,
  sdsAdmin,
  DataAdapter,
  deNode,
  l3String,
  PrimGroupProperty_admCreateGroup_UserType,
  PrimGroupProperty_admRenameGroup_UserType,
  StdRes {a}
  ;
{$IfEnd} //Admin

{$If defined(Admin)}

// start class TAdminModule

class procedure TAdminModule.OpenUserList(const aContainer: IvcmContainer);
var
 __WasEnter : Boolean;
//#UC START# *4AA512AA00C5_4AA5120303E5_var*
//#UC END# *4AA512AA00C5_4AA5120303E5_var*
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AA512AA00C5_4AA5120303E5_impl*
 // ������ ��� ������������� ������ �������������
 if DefDataAdapter.AdministratorLogin then
  Tfs_Admin.Make(TsdsAdmin.Make(
                  TdeAdmin.Make(
                   TdeNode.Make(defDataAdapter.GetGroupsTree),
                   TdeNode.Make(defDataAdapter.GetUsersTree)
                  )
                 ), aContainer);
//#UC END# *4AA512AA00C5_4AA5120303E5_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TAdminModule.OpenUserList

class function TAdminModule.ShowRenameGroupDialog(const aData: IbsEditGroupName): Integer;
var
 __WasEnter : Boolean;
//#UC START# *4AA8E2C60357_4AA5120303E5_var*
const
 cUserType: array [Boolean] of TvcmUserType = (Ord(admCreateGroup), Ord(admRenameGroup));
//#UC END# *4AA8E2C60357_4AA5120303E5_var*
var
 l_Form : IvcmEntityForm;
begin
 __WasEnter := vcmEnterFactory;
 try
//#UC START# *4AA8E2C60357_4AA5120303E5_impl*
 l_Form := TefGroupProperty.Make(aData,
                                   nil,
                                   vcm_ztManualModal,
                                   cUserType[not l3IsNil(aData.Name)]);
 Result := l_Form.ShowModal;
//#UC END# *4AA8E2C60357_4AA5120303E5_impl*
 finally
  if __WasEnter then
   vcmLeaveFactory;
 end;//try..finally
end;//TAdminModule.ShowRenameGroupDialog

class procedure TAdminModule.GetEntityForms(aList : TvcmClassList);
begin
 inherited;
 aList.Add(TefGroupProperty);
 aList.Add(TefForbidAutoregistration);
 aList.Add(TefUserList);
 aList.Add(TefUserProperty);
 aList.Add(TefGroupList);
 aList.Add(TcfAdminForm);
end;

{$IfEnd} //Admin

end.