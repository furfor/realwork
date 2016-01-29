unit kwEntityOperation;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "VCM$Scripting"
// �����: ����� �.�.
// ������: "w:/common/components/gui/Garant/VCM/implementation/Scripting/kwEntityOperation.pas"
// �����: 24.05.2011 18:15
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi::VCM$Scripting::Operations::TkwEntityOperation
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\common\components\gui\Garant\VCM\vcmDefine.inc}

interface

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  vcmBaseOperationsCollectionItem,
  vcmBaseEntitiesCollectionItem,
  kwEntityOperationPrim,
  vcmExternalInterfaces,
  tfwScriptingInterfaces
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}
type
 TkwEntityOperation = class(TkwEntityOperationPrim)
 protected
 // realized methods
   procedure DoOp(const aCtx: TtfwContext;
     const anOp: TvcmOPID); override;
 public
 // public methods
   class procedure Register(anEn: TvcmBaseEntitiesCollectionItem;
     anOp: TvcmBaseOperationsCollectionItem);
 end;//TkwEntityOperation
{$IfEnd} //not NoScripts AND not NoVCM

implementation

{$If not defined(NoScripts) AND not defined(NoVCM)}
uses
  SysUtils,
  StrUtils,
  l3Except,
  vcmBase,
  vcmRepOperationsCollectionItem,
  vcmInterfaces,
  kwEntityOperationTest,
  kwString,
  kwOperationsRegistrar
  ;
{$IfEnd} //not NoScripts AND not NoVCM

{$If not defined(NoScripts) AND not defined(NoVCM)}

// start class TkwEntityOperation

class procedure TkwEntityOperation.Register(anEn: TvcmBaseEntitiesCollectionItem;
  anOp: TvcmBaseOperationsCollectionItem);
//#UC START# *4DDBBF790154_4DDBBDB00019_var*
var
 l_Op : TkwEntityOperation;
 l_TOp : TkwEntityOperationTest;
 l_EC : String;
 l_OC : String;
 l_ToolbarControl : TkwString;
 l_ToolbarControlName : String;
//#UC END# *4DDBBF790154_4DDBBDB00019_var*
begin
//#UC START# *4DDBBF790154_4DDBBDB00019_impl*
 if (anOp.OperationType = vcm_otInternal) then
(*  if ((anOp As TvcmRepOperationsCollectionItem).FormActivate = nil) OR
     ((anOp As TvcmRepOperationsCollectionItem).FormActivate.Name = '') then*)
  Exit;
 l_Op := Create(anEn, anOp);
 try
  l_EC := anEn.Caption;
  if (l_EC = '') then
   l_EC := anEn.Name;
  l_OC := anOp.Caption;
  if (l_OC = '') then
   l_OC := anOp.Name;
  l_EC := ANSIReplaceStr(l_EC, #32, '_');
  l_OC := ANSIReplaceStr(l_OC, #32, '_');
  try
   l_Op.RegisterInstance('��::' + l_EC + '_' + l_OC);
  except
   on El3DuplicateItem do
    try
     l_Op.RegisterInstance('��::' + anEn.Name + '::' + l_EC + '_' + l_OC);
    except
     on El3DuplicateItem do
      ;
    end;//try..except
  end;//try..except
  l_TOp := TkwEntityOperationTest.Create(anEn, anOp);
  try
   try
    l_TOp.RegisterInstance('��::����::' + l_EC + '_' + l_OC);
   except
    on El3DuplicateItem do
     try
      l_TOp.RegisterInstance('��::����::' + anEn.Name + '::' + l_EC + '_' + l_OC);
     except
      on El3DuplicateItem do
       ;
     end;//try..except
   end;//try..except
  finally
   FreeAndNil(l_TOp);
  end;//try..finally
 finally
  FreeAndNil(l_Op);
 end;//try..finally
 l_ToolbarControlName := 'bt_' + anEn.Name + '_' + anOp.Name;
 l_ToolbarControl := TkwString.Create(TtfwCStringFactory.C(l_ToolbarControlName));
 try
  try
   l_ToolbarControl.RegisterInstance('�������::' + l_ToolbarControlName);
  except
   on El3DuplicateItem do
    ;
  end;//try..except
 finally
  FreeAndNil(l_ToolbarControl);
 end;//try..finally
//#UC END# *4DDBBF790154_4DDBBDB00019_impl*
end;//TkwEntityOperation.Register

procedure TkwEntityOperation.DoOp(const aCtx: TtfwContext;
  const anOp: TvcmOPID);
//#UC START# *523008BC0096_4DDBBDB00019_var*
var
 l_Res : Boolean;
 l_E   : IvcmEntity;
 l_S   : String;
//#UC END# *523008BC0096_4DDBBDB00019_var*
begin
//#UC START# *523008BC0096_4DDBBDB00019_impl*
 l_Res := vcmDispatcher.EntityOperation(anOp, vcmParams);
 if not l_Res then
 begin
  l_E := vcmDispatcher.ActiveEntity;
  l_S := '<no active form>';
  if (l_E <> nil) then
   l_S := l_E.AsForm.VCLWinControl.ClassName;
  aCtx.rCaller.Check(false,
                     Format('�������� %s.%s - %s.%s �� �����������. �������� ����� %s',
                            [f_En.Name, f_Op.Name,
                             f_En.Caption, f_Op.Caption,
                             l_S]));
 end;//not l_Res
//#UC END# *523008BC0096_4DDBBDB00019_impl*
end;//TkwEntityOperation.DoOp

{$IfEnd} //not NoScripts AND not NoVCM

initialization
{$If not defined(NoScripts) AND not defined(NoVCM)}
// ����������� TkwEntityOperation
 TkwEntityOperation.RegisterClass;
{$IfEnd} //not NoScripts AND not NoVCM

end.