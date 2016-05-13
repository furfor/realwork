unit Translation_WarningBaloonKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� Translation_WarningBaloon }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Document\Translation_WarningBaloonKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "Translation_WarningBaloonKeywordsPack" MUID: (DE0052063257)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If Defined(Nemesis)}
 , nscEditor
 {$IfEnd} // Defined(Nemesis)
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)}
uses
 l3ImplUses
 , Translation_WarningBaloon_Form
 , tfwControlString
 {$If NOT Defined(NoVCL)}
 , kwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwScriptingInterfaces
 , tfwPropertyLike
 , TypInfo
 , tfwTypeInfo
 , TtfwClassRef_Proxy
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
;

type
 Tkw_Form_Translation_WarningBaloon = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� Translation_WarningBaloon
----
*������ �������������*:
[code]
'aControl' �����::Translation_WarningBaloon TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Form_Translation_WarningBaloon

 Tkw_Translation_WarningBaloon_Control_Viewer = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� Viewer
----
*������ �������������*:
[code]
�������::Viewer TryFocus ASSERT
[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Translation_WarningBaloon_Control_Viewer

 Tkw_Translation_WarningBaloon_Control_Viewer_Push = {final} class({$If NOT Defined(NoVCL)}
 TkwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 )
  {* ����� ������� ��� �������� Viewer
----
*������ �������������*:
[code]
�������::Viewer:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Translation_WarningBaloon_Control_Viewer_Push

 TkwTranslationWarningBaloonFormViewer = {final} class(TtfwPropertyLike)
  {* ����� ������� .TTranslation_WarningBaloonForm.Viewer }
  private
   function Viewer(const aCtx: TtfwContext;
    aTranslation_WarningBaloonForm: TTranslation_WarningBaloonForm): TnscEditor;
    {* ���������� ����� ������� .TTranslation_WarningBaloonForm.Viewer }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwTranslationWarningBaloonFormViewer

function Tkw_Form_Translation_WarningBaloon.GetString: AnsiString;
begin
 Result := 'Translation_WarningBaloonForm';
end;//Tkw_Form_Translation_WarningBaloon.GetString

class function Tkw_Form_Translation_WarningBaloon.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::Translation_WarningBaloon';
end;//Tkw_Form_Translation_WarningBaloon.GetWordNameForRegister

function Tkw_Translation_WarningBaloon_Control_Viewer.GetString: AnsiString;
begin
 Result := 'Viewer';
end;//Tkw_Translation_WarningBaloon_Control_Viewer.GetString

class procedure Tkw_Translation_WarningBaloon_Control_Viewer.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEditor);
end;//Tkw_Translation_WarningBaloon_Control_Viewer.RegisterInEngine

class function Tkw_Translation_WarningBaloon_Control_Viewer.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer';
end;//Tkw_Translation_WarningBaloon_Control_Viewer.GetWordNameForRegister

procedure Tkw_Translation_WarningBaloon_Control_Viewer_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('Viewer');
 inherited;
end;//Tkw_Translation_WarningBaloon_Control_Viewer_Push.DoDoIt

class function Tkw_Translation_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer:push';
end;//Tkw_Translation_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister

function TkwTranslationWarningBaloonFormViewer.Viewer(const aCtx: TtfwContext;
 aTranslation_WarningBaloonForm: TTranslation_WarningBaloonForm): TnscEditor;
 {* ���������� ����� ������� .TTranslation_WarningBaloonForm.Viewer }
begin
 Result := aTranslation_WarningBaloonForm.Viewer;
end;//TkwTranslationWarningBaloonFormViewer.Viewer

class function TkwTranslationWarningBaloonFormViewer.GetWordNameForRegister: AnsiString;
begin
 Result := '.TTranslation_WarningBaloonForm.Viewer';
end;//TkwTranslationWarningBaloonFormViewer.GetWordNameForRegister

function TkwTranslationWarningBaloonFormViewer.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEditor);
end;//TkwTranslationWarningBaloonFormViewer.GetResultTypeInfo

function TkwTranslationWarningBaloonFormViewer.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwTranslationWarningBaloonFormViewer.GetAllParamsCount

function TkwTranslationWarningBaloonFormViewer.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TTranslation_WarningBaloonForm)]);
end;//TkwTranslationWarningBaloonFormViewer.ParamsTypes

procedure TkwTranslationWarningBaloonFormViewer.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Viewer', aCtx);
end;//TkwTranslationWarningBaloonFormViewer.SetValuePrim

procedure TkwTranslationWarningBaloonFormViewer.DoDoIt(const aCtx: TtfwContext);
var l_aTranslation_WarningBaloonForm: TTranslation_WarningBaloonForm;
begin
 try
  l_aTranslation_WarningBaloonForm := TTranslation_WarningBaloonForm(aCtx.rEngine.PopObjAs(TTranslation_WarningBaloonForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aTranslation_WarningBaloonForm: TTranslation_WarningBaloonForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(Viewer(aCtx, l_aTranslation_WarningBaloonForm));
end;//TkwTranslationWarningBaloonFormViewer.DoDoIt

initialization
 Tkw_Form_Translation_WarningBaloon.RegisterInEngine;
 {* ����������� Tkw_Form_Translation_WarningBaloon }
 Tkw_Translation_WarningBaloon_Control_Viewer.RegisterInEngine;
 {* ����������� Tkw_Translation_WarningBaloon_Control_Viewer }
 Tkw_Translation_WarningBaloon_Control_Viewer_Push.RegisterInEngine;
 {* ����������� Tkw_Translation_WarningBaloon_Control_Viewer_Push }
 TkwTranslationWarningBaloonFormViewer.RegisterInEngine;
 {* ����������� Translation_WarningBaloonForm_Viewer }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TTranslation_WarningBaloonForm));
 {* ����������� ���� TTranslation_WarningBaloonForm }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscEditor));
 {* ����������� ���� TnscEditor }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts)

end.
