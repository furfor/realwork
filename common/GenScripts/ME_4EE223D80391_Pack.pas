unit SynchroView_WarningBaloonKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� SynchroView_WarningBaloon }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Document\Forms\SynchroView_WarningBaloonKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "SynchroView_WarningBaloonKeywordsPack" MUID: (4EE223D80391_Pack)

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3IntfUses
;
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)

implementation

{$If NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)}
uses
 l3ImplUses
 , SynchroView_WarningBaloon_Form
 , tfwPropertyLike
 {$If Defined(Nemesis)}
 , nscEditor
 {$IfEnd} // Defined(Nemesis)
 , tfwScriptingInterfaces
 , TypInfo
 , tfwTypeInfo
 , tfwControlString
 , kwBynameControlPush
 , TtfwClassRef_Proxy
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
;

type
 TkwSynchroViewWarningBaloonFormViewer = {final} class(TtfwPropertyLike)
  {* ����� ������� .TSynchroView_WarningBaloonForm.Viewer }
  private
   function Viewer(const aCtx: TtfwContext;
    aSynchroView_WarningBaloonForm: TSynchroView_WarningBaloonForm): TnscEditor;
    {* ���������� ����� ������� .TSynchroView_WarningBaloonForm.Viewer }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwSynchroViewWarningBaloonFormViewer

 Tkw_Form_SynchroView_WarningBaloon = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� SynchroView_WarningBaloon
----
*������ �������������*:
[code]�����::SynchroView_WarningBaloon TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Form_SynchroView_WarningBaloon

 Tkw_SynchroView_WarningBaloon_Control_Viewer = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� Viewer
----
*������ �������������*:
[code]�������::Viewer TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_SynchroView_WarningBaloon_Control_Viewer

 Tkw_SynchroView_WarningBaloon_Control_Viewer_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� Viewer
----
*������ �������������*:
[code]�������::Viewer:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_SynchroView_WarningBaloon_Control_Viewer_Push

function TkwSynchroViewWarningBaloonFormViewer.Viewer(const aCtx: TtfwContext;
 aSynchroView_WarningBaloonForm: TSynchroView_WarningBaloonForm): TnscEditor;
 {* ���������� ����� ������� .TSynchroView_WarningBaloonForm.Viewer }
begin
 Result := aSynchroView_WarningBaloonForm.Viewer;
end;//TkwSynchroViewWarningBaloonFormViewer.Viewer

class function TkwSynchroViewWarningBaloonFormViewer.GetWordNameForRegister: AnsiString;
begin
 Result := '.TSynchroView_WarningBaloonForm.Viewer';
end;//TkwSynchroViewWarningBaloonFormViewer.GetWordNameForRegister

function TkwSynchroViewWarningBaloonFormViewer.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TnscEditor);
end;//TkwSynchroViewWarningBaloonFormViewer.GetResultTypeInfo

function TkwSynchroViewWarningBaloonFormViewer.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwSynchroViewWarningBaloonFormViewer.GetAllParamsCount

function TkwSynchroViewWarningBaloonFormViewer.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TSynchroView_WarningBaloonForm)]);
end;//TkwSynchroViewWarningBaloonFormViewer.ParamsTypes

procedure TkwSynchroViewWarningBaloonFormViewer.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Viewer', aCtx);
end;//TkwSynchroViewWarningBaloonFormViewer.SetValuePrim

procedure TkwSynchroViewWarningBaloonFormViewer.DoDoIt(const aCtx: TtfwContext);
var l_aSynchroView_WarningBaloonForm: TSynchroView_WarningBaloonForm;
begin
 try
  l_aSynchroView_WarningBaloonForm := TSynchroView_WarningBaloonForm(aCtx.rEngine.PopObjAs(TSynchroView_WarningBaloonForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aSynchroView_WarningBaloonForm: TSynchroView_WarningBaloonForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(Viewer(aCtx, l_aSynchroView_WarningBaloonForm));
end;//TkwSynchroViewWarningBaloonFormViewer.DoDoIt

function Tkw_Form_SynchroView_WarningBaloon.GetString: AnsiString;
begin
 Result := 'SynchroView_WarningBaloonForm';
end;//Tkw_Form_SynchroView_WarningBaloon.GetString

class procedure Tkw_Form_SynchroView_WarningBaloon.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TSynchroView_WarningBaloonForm);
end;//Tkw_Form_SynchroView_WarningBaloon.RegisterInEngine

class function Tkw_Form_SynchroView_WarningBaloon.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::SynchroView_WarningBaloon';
end;//Tkw_Form_SynchroView_WarningBaloon.GetWordNameForRegister

function Tkw_SynchroView_WarningBaloon_Control_Viewer.GetString: AnsiString;
begin
 Result := 'Viewer';
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer.GetString

class procedure Tkw_SynchroView_WarningBaloon_Control_Viewer.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TnscEditor);
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer.RegisterInEngine

class function Tkw_SynchroView_WarningBaloon_Control_Viewer.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer';
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer.GetWordNameForRegister

procedure Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('Viewer');
 inherited;
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.DoDoIt

class function Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Viewer:push';
end;//Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.GetWordNameForRegister

initialization
 TkwSynchroViewWarningBaloonFormViewer.RegisterInEngine;
 {* ����������� SynchroView_WarningBaloonForm_Viewer }
 Tkw_Form_SynchroView_WarningBaloon.RegisterInEngine;
 {* ����������� Tkw_Form_SynchroView_WarningBaloon }
 Tkw_SynchroView_WarningBaloon_Control_Viewer.RegisterInEngine;
 {* ����������� Tkw_SynchroView_WarningBaloon_Control_Viewer }
 Tkw_SynchroView_WarningBaloon_Control_Viewer_Push.RegisterInEngine;
 {* ����������� Tkw_SynchroView_WarningBaloon_Control_Viewer_Push }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TSynchroView_WarningBaloonForm));
 {* ����������� ���� TSynchroView_WarningBaloonForm }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TnscEditor));
 {* ����������� ���� TnscEditor }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
