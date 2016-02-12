unit kwSubdescriptorGetBitmapIndex;
 {* �������� � ���� ������ ��� ����������� ������� �����
������:
[code]
aSubDescrObj subdescriptor:GetBitmapIndex
[code] }

// ������: "w:\common\components\rtl\Garant\ScriptEngine\kwSubdescriptorGetBitmapIndex.pas"
// ���������: "ScriptKeyword"

{$Include seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , kwSubDescriptorFromStackWord
 , evSubPn
 , tfwScriptingInterfaces
;

type
 TkwSubdescriptorGetBitmapIndex = {final} class(TkwSubDescriptorFromStackWord)
  {* �������� � ���� ������ ��� ����������� ������� �����
������:
[code]
aSubDescrObj subdescriptor:GetBitmapIndex
[code] }
  protected
   procedure DoWithSubDescriptor(aControl: TevSubDescriptor;
    const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//TkwSubdescriptorGetBitmapIndex
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
;

procedure TkwSubdescriptorGetBitmapIndex.DoWithSubDescriptor(aControl: TevSubDescriptor;
 const aCtx: TtfwContext);
//#UC START# *52D65E9502E1_52D6601F031E_var*
//#UC END# *52D65E9502E1_52D6601F031E_var*
begin
//#UC START# *52D65E9502E1_52D6601F031E_impl*
 aCtx.rEngine.PushInt(aControl.BitmapIndex);
//#UC END# *52D65E9502E1_52D6601F031E_impl*
end;//TkwSubdescriptorGetBitmapIndex.DoWithSubDescriptor

class function TkwSubdescriptorGetBitmapIndex.GetWordNameForRegister: AnsiString;
begin
 Result := 'subdescriptor:GetBitmapIndex';
end;//TkwSubdescriptorGetBitmapIndex.GetWordNameForRegister

initialization
 TkwSubdescriptorGetBitmapIndex.RegisterInEngine;
 {* ����������� subdescriptor_GetBitmapIndex }
{$IfEnd} // NOT Defined(NoScripts)

end.
