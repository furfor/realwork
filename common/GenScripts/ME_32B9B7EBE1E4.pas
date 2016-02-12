unit WarningBaloonKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� WarningBaloon }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Document\WarningBaloonKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 , Document_Module
 {$If Defined(Nemesis)}
 , nscEditor
 {$IfEnd} // Defined(Nemesis)
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
 Tkw_Form_WarningBaloon = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� WarningBaloon
----
*������ �������������*:
[code]
'aControl' �����::WarningBaloon TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
 end;//Tkw_Form_WarningBaloon

 Tkw_WarningBaloon_Control_Viewer = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� Viewer
----
*������ �������������*:
[code]
�������::Viewer TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_WarningBaloon_Control_Viewer

 Tkw_WarningBaloon_Control_Viewer_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� Viewer
----
*������ �������������*:
[code]
�������::Viewer:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_WarningBaloon_Control_Viewer_Push

 TkwWarningBaloonFormViewer = {final} class(TtfwPropertyLike)
  {* ����� ������� .TWarningBaloonForm.Viewer
[panel]������� Viewer ����� TWarningBaloonForm[panel]
*��� ����������:* TnscEditor
*������:*
[code]
OBJECT VAR l_TnscEditor
 aWarningBaloonForm .TWarningBaloonForm.Viewer >>> l_TnscEditor
[code]  }
  private
   function Viewer(const aCtx: TtfwContext;
    aWarningBaloonForm: TWarningBaloonForm): TnscEditor;
    {* ���������� ����� ������� .TWarningBaloonForm.Viewer }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwWarningBaloonFormViewer

class function Tkw_Form_WarningBaloon.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::WarningBaloon';
end;//Tkw_Form_WarningBaloon.GetWordNameForRegister

function Tkw_Form_WarningBaloon.GetString: AnsiString;
begin
 Result := 'WarningBaloonForm';
end;//Tkw_Form_WarningBaloon.GetString

class function Tkw_WarningBaloon_Control_Viewer.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer';
end;//Tkw_WarningBaloon_Control_Viewer.GetWordNameForRegister

function Tkw_WarningBaloon_Control_Viewer.GetString: AnsiString;
begin
 Result := 'Viewer';
end;//Tkw_WarningBaloon_Control_Viewer.GetString

class procedure Tkw_WarningBaloon_Control_Viewer.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEditor);
end;//Tkw_WarningBaloon_Control_Viewer.RegisterInEngine

procedure Tkw_WarningBaloon_Control_Viewer_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_7E6C9BCC2E13_var*
//#UC END# *4DAEEDE10285_7E6C9BCC2E13_var*
begin
//#UC START# *4DAEEDE10285_7E6C9BCC2E13_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_7E6C9BCC2E13_impl*
end;//Tkw_WarningBaloon_Control_Viewer_Push.DoDoIt

class function Tkw_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer:push';
end;//Tkw_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister

function TkwWarningBaloonFormViewer.Viewer(const aCtx: TtfwContext;
 aWarningBaloonForm: TWarningBaloonForm): TnscEditor;
 {* ���������� ����� ������� .TWarningBaloonForm.Viewer }
begin
 Result := aWarningBaloonForm.Viewer;
end;//TkwWarningBaloonFormViewer.Viewer

procedure TkwWarningBaloonFormViewer.DoDoIt(const aCtx: TtfwContext);
var l_aWarningBaloonForm: TWarningBaloonForm;
begin
 try
  l_aWarningBaloonForm := TWarningBaloonForm(aCtx.rEngine.PopObjAs(TWarningBaloonForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aWarningBaloonForm: TWarningBaloonForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(Viewer(aCtx, l_aWarningBaloonForm));
end;//TkwWarningBaloonFormViewer.DoDoIt

class function TkwWarningBaloonFormViewer.GetWordNameForRegister: AnsiString;
begin
 Result := '.TWarningBaloonForm.Viewer';
end;//TkwWarningBaloonFormViewer.GetWordNameForRegister

procedure TkwWarningBaloonFormViewer.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Viewer', aCtx);
end;//TkwWarningBaloonFormViewer.SetValuePrim

function TkwWarningBaloonFormViewer.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEditor);
end;//TkwWarningBaloonFormViewer.GetResultTypeInfo

function TkwWarningBaloonFormViewer.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwWarningBaloonFormViewer.GetAllParamsCount

function TkwWarningBaloonFormViewer.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TWarningBaloonForm)]);
end;//TkwWarningBaloonFormViewer.ParamsTypes

initialization
 Tkw_Form_WarningBaloon.RegisterInEngine;
 {* ����������� Tkw_Form_WarningBaloon }
 Tkw_WarningBaloon_Control_Viewer.RegisterInEngine;
 {* ����������� Tkw_WarningBaloon_Control_Viewer }
 Tkw_WarningBaloon_Control_Viewer_Push.RegisterInEngine;
 {* ����������� Tkw_WarningBaloon_Control_Viewer_Push }
 TkwWarningBaloonFormViewer.RegisterInEngine;
 {* ����������� WarningBaloonForm_Viewer }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TWarningBaloonForm));
 {* ����������� ���� WarningBaloon }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscEditor));
 {* ����������� ���� TnscEditor }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
