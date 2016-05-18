unit TurnOnTimeMachineKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� TurnOnTimeMachine }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\Document\Forms\TurnOnTimeMachineKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"
// ������� ������: "TurnOnTimeMachineKeywordsPack" MUID: (4AB135BD01C2_Pack)

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
 , TurnOnTimeMachine_Form
 , tfwPropertyLike
 , vtRadioButton
 , tfwScriptingInterfaces
 , TypInfo
 , tfwTypeInfo
 , vtDblClickDateEdit
 , ExtCtrls
 , vtLabel
 , vtButton
 , tfwControlString
 , kwBynameControlPush
 , TtfwClassRef_Proxy
 , SysUtils
 , TtfwTypeRegistrator_Proxy
 , tfwScriptingTypes
;

type
 TkwEnTurnOnTimeMachineRbTotmOnDate = {final} class(TtfwPropertyLike)
  {* ����� ������� .Ten_TurnOnTimeMachine.rb_totmOnDate }
  private
   function rb_totmOnDate(const aCtx: TtfwContext;
    aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtRadioButton;
    {* ���������� ����� ������� .Ten_TurnOnTimeMachine.rb_totmOnDate }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwEnTurnOnTimeMachineRbTotmOnDate

 TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation = {final} class(TtfwPropertyLike)
  {* ����� ������� .Ten_TurnOnTimeMachine.rb_totmOnCurrentRedation }
  private
   function rb_totmOnCurrentRedation(const aCtx: TtfwContext;
    aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtRadioButton;
    {* ���������� ����� ������� .Ten_TurnOnTimeMachine.rb_totmOnCurrentRedation }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation

 TkwEnTurnOnTimeMachineDeDate = {final} class(TtfwPropertyLike)
  {* ����� ������� .Ten_TurnOnTimeMachine.deDate }
  private
   function deDate(const aCtx: TtfwContext;
    aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtDblClickDateEdit;
    {* ���������� ����� ������� .Ten_TurnOnTimeMachine.deDate }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwEnTurnOnTimeMachineDeDate

 TkwEnTurnOnTimeMachinePbDialogIcon = {final} class(TtfwPropertyLike)
  {* ����� ������� .Ten_TurnOnTimeMachine.pbDialogIcon }
  private
   function pbDialogIcon(const aCtx: TtfwContext;
    aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TPaintBox;
    {* ���������� ����� ������� .Ten_TurnOnTimeMachine.pbDialogIcon }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwEnTurnOnTimeMachinePbDialogIcon

 TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo = {final} class(TtfwPropertyLike)
  {* ����� ������� .Ten_TurnOnTimeMachine.lblTurnOnTimeMachineInfo }
  private
   function lblTurnOnTimeMachineInfo(const aCtx: TtfwContext;
    aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtLabel;
    {* ���������� ����� ������� .Ten_TurnOnTimeMachine.lblTurnOnTimeMachineInfo }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo

 TkwEnTurnOnTimeMachineBtnOk = {final} class(TtfwPropertyLike)
  {* ����� ������� .Ten_TurnOnTimeMachine.btnOk }
  private
   function btnOk(const aCtx: TtfwContext;
    aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtButton;
    {* ���������� ����� ������� .Ten_TurnOnTimeMachine.btnOk }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwEnTurnOnTimeMachineBtnOk

 TkwEnTurnOnTimeMachineBtnCancel = {final} class(TtfwPropertyLike)
  {* ����� ������� .Ten_TurnOnTimeMachine.btnCancel }
  private
   function btnCancel(const aCtx: TtfwContext;
    aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtButton;
    {* ���������� ����� ������� .Ten_TurnOnTimeMachine.btnCancel }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   procedure DoDoIt(const aCtx: TtfwContext); override;
  public
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
 end;//TkwEnTurnOnTimeMachineBtnCancel

 Tkw_Form_TurnOnTimeMachine = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� TurnOnTimeMachine
----
*������ �������������*:
[code]�����::TurnOnTimeMachine TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_Form_TurnOnTimeMachine

 Tkw_TurnOnTimeMachine_Control_rb_totmOnDate = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� rb_totmOnDate
----
*������ �������������*:
[code]�������::rb_totmOnDate TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnDate

 Tkw_TurnOnTimeMachine_Control_rb_totmOnDate_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� rb_totmOnDate
----
*������ �������������*:
[code]�������::rb_totmOnDate:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnDate_Push

 Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� rb_totmOnCurrentRedation
----
*������ �������������*:
[code]�������::rb_totmOnCurrentRedation TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation

 Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� rb_totmOnCurrentRedation
----
*������ �������������*:
[code]�������::rb_totmOnCurrentRedation:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation_Push

 Tkw_TurnOnTimeMachine_Control_deDate = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� deDate
----
*������ �������������*:
[code]�������::deDate TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_deDate

 Tkw_TurnOnTimeMachine_Control_deDate_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� deDate
----
*������ �������������*:
[code]�������::deDate:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_deDate_Push

 Tkw_TurnOnTimeMachine_Control_pbDialogIcon = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� pbDialogIcon
----
*������ �������������*:
[code]�������::pbDialogIcon TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_pbDialogIcon

 Tkw_TurnOnTimeMachine_Control_pbDialogIcon_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� pbDialogIcon
----
*������ �������������*:
[code]�������::pbDialogIcon:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_pbDialogIcon_Push

 Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� lblTurnOnTimeMachineInfo
----
*������ �������������*:
[code]�������::lblTurnOnTimeMachineInfo TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo

 Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� lblTurnOnTimeMachineInfo
----
*������ �������������*:
[code]�������::lblTurnOnTimeMachineInfo:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo_Push

 Tkw_TurnOnTimeMachine_Control_btnOk = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� btnOk
----
*������ �������������*:
[code]�������::btnOk TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_btnOk

 Tkw_TurnOnTimeMachine_Control_btnOk_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� btnOk
----
*������ �������������*:
[code]�������::btnOk:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_btnOk_Push

 Tkw_TurnOnTimeMachine_Control_btnCancel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� btnCancel
----
*������ �������������*:
[code]�������::btnCancel TryFocus ASSERT[code] }
  protected
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_btnCancel

 Tkw_TurnOnTimeMachine_Control_btnCancel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� btnCancel
----
*������ �������������*:
[code]�������::btnCancel:push pop:control:SetFocus ASSERT[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_TurnOnTimeMachine_Control_btnCancel_Push

function TkwEnTurnOnTimeMachineRbTotmOnDate.rb_totmOnDate(const aCtx: TtfwContext;
 aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtRadioButton;
 {* ���������� ����� ������� .Ten_TurnOnTimeMachine.rb_totmOnDate }
begin
 Result := aen_TurnOnTimeMachine.rb_totmOnDate;
end;//TkwEnTurnOnTimeMachineRbTotmOnDate.rb_totmOnDate

class function TkwEnTurnOnTimeMachineRbTotmOnDate.GetWordNameForRegister: AnsiString;
begin
 Result := '.Ten_TurnOnTimeMachine.rb_totmOnDate';
end;//TkwEnTurnOnTimeMachineRbTotmOnDate.GetWordNameForRegister

function TkwEnTurnOnTimeMachineRbTotmOnDate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtRadioButton);
end;//TkwEnTurnOnTimeMachineRbTotmOnDate.GetResultTypeInfo

function TkwEnTurnOnTimeMachineRbTotmOnDate.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEnTurnOnTimeMachineRbTotmOnDate.GetAllParamsCount

function TkwEnTurnOnTimeMachineRbTotmOnDate.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Ten_TurnOnTimeMachine)]);
end;//TkwEnTurnOnTimeMachineRbTotmOnDate.ParamsTypes

procedure TkwEnTurnOnTimeMachineRbTotmOnDate.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� rb_totmOnDate', aCtx);
end;//TkwEnTurnOnTimeMachineRbTotmOnDate.SetValuePrim

procedure TkwEnTurnOnTimeMachineRbTotmOnDate.DoDoIt(const aCtx: TtfwContext);
var l_aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine;
begin
 try
  l_aen_TurnOnTimeMachine := Ten_TurnOnTimeMachine(aCtx.rEngine.PopObjAs(Ten_TurnOnTimeMachine));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(rb_totmOnDate(aCtx, l_aen_TurnOnTimeMachine));
end;//TkwEnTurnOnTimeMachineRbTotmOnDate.DoDoIt

function TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.rb_totmOnCurrentRedation(const aCtx: TtfwContext;
 aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtRadioButton;
 {* ���������� ����� ������� .Ten_TurnOnTimeMachine.rb_totmOnCurrentRedation }
begin
 Result := aen_TurnOnTimeMachine.rb_totmOnCurrentRedation;
end;//TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.rb_totmOnCurrentRedation

class function TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.GetWordNameForRegister: AnsiString;
begin
 Result := '.Ten_TurnOnTimeMachine.rb_totmOnCurrentRedation';
end;//TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.GetWordNameForRegister

function TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtRadioButton);
end;//TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.GetResultTypeInfo

function TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.GetAllParamsCount

function TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Ten_TurnOnTimeMachine)]);
end;//TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.ParamsTypes

procedure TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� rb_totmOnCurrentRedation', aCtx);
end;//TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.SetValuePrim

procedure TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.DoDoIt(const aCtx: TtfwContext);
var l_aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine;
begin
 try
  l_aen_TurnOnTimeMachine := Ten_TurnOnTimeMachine(aCtx.rEngine.PopObjAs(Ten_TurnOnTimeMachine));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(rb_totmOnCurrentRedation(aCtx, l_aen_TurnOnTimeMachine));
end;//TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.DoDoIt

function TkwEnTurnOnTimeMachineDeDate.deDate(const aCtx: TtfwContext;
 aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtDblClickDateEdit;
 {* ���������� ����� ������� .Ten_TurnOnTimeMachine.deDate }
begin
 Result := aen_TurnOnTimeMachine.deDate;
end;//TkwEnTurnOnTimeMachineDeDate.deDate

class function TkwEnTurnOnTimeMachineDeDate.GetWordNameForRegister: AnsiString;
begin
 Result := '.Ten_TurnOnTimeMachine.deDate';
end;//TkwEnTurnOnTimeMachineDeDate.GetWordNameForRegister

function TkwEnTurnOnTimeMachineDeDate.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtDblClickDateEdit);
end;//TkwEnTurnOnTimeMachineDeDate.GetResultTypeInfo

function TkwEnTurnOnTimeMachineDeDate.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEnTurnOnTimeMachineDeDate.GetAllParamsCount

function TkwEnTurnOnTimeMachineDeDate.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Ten_TurnOnTimeMachine)]);
end;//TkwEnTurnOnTimeMachineDeDate.ParamsTypes

procedure TkwEnTurnOnTimeMachineDeDate.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� deDate', aCtx);
end;//TkwEnTurnOnTimeMachineDeDate.SetValuePrim

procedure TkwEnTurnOnTimeMachineDeDate.DoDoIt(const aCtx: TtfwContext);
var l_aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine;
begin
 try
  l_aen_TurnOnTimeMachine := Ten_TurnOnTimeMachine(aCtx.rEngine.PopObjAs(Ten_TurnOnTimeMachine));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(deDate(aCtx, l_aen_TurnOnTimeMachine));
end;//TkwEnTurnOnTimeMachineDeDate.DoDoIt

function TkwEnTurnOnTimeMachinePbDialogIcon.pbDialogIcon(const aCtx: TtfwContext;
 aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TPaintBox;
 {* ���������� ����� ������� .Ten_TurnOnTimeMachine.pbDialogIcon }
begin
 Result := aen_TurnOnTimeMachine.pbDialogIcon;
end;//TkwEnTurnOnTimeMachinePbDialogIcon.pbDialogIcon

class function TkwEnTurnOnTimeMachinePbDialogIcon.GetWordNameForRegister: AnsiString;
begin
 Result := '.Ten_TurnOnTimeMachine.pbDialogIcon';
end;//TkwEnTurnOnTimeMachinePbDialogIcon.GetWordNameForRegister

function TkwEnTurnOnTimeMachinePbDialogIcon.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TPaintBox);
end;//TkwEnTurnOnTimeMachinePbDialogIcon.GetResultTypeInfo

function TkwEnTurnOnTimeMachinePbDialogIcon.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEnTurnOnTimeMachinePbDialogIcon.GetAllParamsCount

function TkwEnTurnOnTimeMachinePbDialogIcon.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Ten_TurnOnTimeMachine)]);
end;//TkwEnTurnOnTimeMachinePbDialogIcon.ParamsTypes

procedure TkwEnTurnOnTimeMachinePbDialogIcon.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� pbDialogIcon', aCtx);
end;//TkwEnTurnOnTimeMachinePbDialogIcon.SetValuePrim

procedure TkwEnTurnOnTimeMachinePbDialogIcon.DoDoIt(const aCtx: TtfwContext);
var l_aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine;
begin
 try
  l_aen_TurnOnTimeMachine := Ten_TurnOnTimeMachine(aCtx.rEngine.PopObjAs(Ten_TurnOnTimeMachine));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(pbDialogIcon(aCtx, l_aen_TurnOnTimeMachine));
end;//TkwEnTurnOnTimeMachinePbDialogIcon.DoDoIt

function TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.lblTurnOnTimeMachineInfo(const aCtx: TtfwContext;
 aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtLabel;
 {* ���������� ����� ������� .Ten_TurnOnTimeMachine.lblTurnOnTimeMachineInfo }
begin
 Result := aen_TurnOnTimeMachine.lblTurnOnTimeMachineInfo;
end;//TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.lblTurnOnTimeMachineInfo

class function TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.GetWordNameForRegister: AnsiString;
begin
 Result := '.Ten_TurnOnTimeMachine.lblTurnOnTimeMachineInfo';
end;//TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.GetWordNameForRegister

function TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.GetResultTypeInfo

function TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.GetAllParamsCount

function TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Ten_TurnOnTimeMachine)]);
end;//TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.ParamsTypes

procedure TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� lblTurnOnTimeMachineInfo', aCtx);
end;//TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.SetValuePrim

procedure TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.DoDoIt(const aCtx: TtfwContext);
var l_aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine;
begin
 try
  l_aen_TurnOnTimeMachine := Ten_TurnOnTimeMachine(aCtx.rEngine.PopObjAs(Ten_TurnOnTimeMachine));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(lblTurnOnTimeMachineInfo(aCtx, l_aen_TurnOnTimeMachine));
end;//TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.DoDoIt

function TkwEnTurnOnTimeMachineBtnOk.btnOk(const aCtx: TtfwContext;
 aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtButton;
 {* ���������� ����� ������� .Ten_TurnOnTimeMachine.btnOk }
begin
 Result := aen_TurnOnTimeMachine.btnOk;
end;//TkwEnTurnOnTimeMachineBtnOk.btnOk

class function TkwEnTurnOnTimeMachineBtnOk.GetWordNameForRegister: AnsiString;
begin
 Result := '.Ten_TurnOnTimeMachine.btnOk';
end;//TkwEnTurnOnTimeMachineBtnOk.GetWordNameForRegister

function TkwEnTurnOnTimeMachineBtnOk.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtButton);
end;//TkwEnTurnOnTimeMachineBtnOk.GetResultTypeInfo

function TkwEnTurnOnTimeMachineBtnOk.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEnTurnOnTimeMachineBtnOk.GetAllParamsCount

function TkwEnTurnOnTimeMachineBtnOk.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Ten_TurnOnTimeMachine)]);
end;//TkwEnTurnOnTimeMachineBtnOk.ParamsTypes

procedure TkwEnTurnOnTimeMachineBtnOk.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� btnOk', aCtx);
end;//TkwEnTurnOnTimeMachineBtnOk.SetValuePrim

procedure TkwEnTurnOnTimeMachineBtnOk.DoDoIt(const aCtx: TtfwContext);
var l_aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine;
begin
 try
  l_aen_TurnOnTimeMachine := Ten_TurnOnTimeMachine(aCtx.rEngine.PopObjAs(Ten_TurnOnTimeMachine));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(btnOk(aCtx, l_aen_TurnOnTimeMachine));
end;//TkwEnTurnOnTimeMachineBtnOk.DoDoIt

function TkwEnTurnOnTimeMachineBtnCancel.btnCancel(const aCtx: TtfwContext;
 aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine): TvtButton;
 {* ���������� ����� ������� .Ten_TurnOnTimeMachine.btnCancel }
begin
 Result := aen_TurnOnTimeMachine.btnCancel;
end;//TkwEnTurnOnTimeMachineBtnCancel.btnCancel

class function TkwEnTurnOnTimeMachineBtnCancel.GetWordNameForRegister: AnsiString;
begin
 Result := '.Ten_TurnOnTimeMachine.btnCancel';
end;//TkwEnTurnOnTimeMachineBtnCancel.GetWordNameForRegister

function TkwEnTurnOnTimeMachineBtnCancel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtButton);
end;//TkwEnTurnOnTimeMachineBtnCancel.GetResultTypeInfo

function TkwEnTurnOnTimeMachineBtnCancel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwEnTurnOnTimeMachineBtnCancel.GetAllParamsCount

function TkwEnTurnOnTimeMachineBtnCancel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(Ten_TurnOnTimeMachine)]);
end;//TkwEnTurnOnTimeMachineBtnCancel.ParamsTypes

procedure TkwEnTurnOnTimeMachineBtnCancel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� btnCancel', aCtx);
end;//TkwEnTurnOnTimeMachineBtnCancel.SetValuePrim

procedure TkwEnTurnOnTimeMachineBtnCancel.DoDoIt(const aCtx: TtfwContext);
var l_aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine;
begin
 try
  l_aen_TurnOnTimeMachine := Ten_TurnOnTimeMachine(aCtx.rEngine.PopObjAs(Ten_TurnOnTimeMachine));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aen_TurnOnTimeMachine: Ten_TurnOnTimeMachine : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(btnCancel(aCtx, l_aen_TurnOnTimeMachine));
end;//TkwEnTurnOnTimeMachineBtnCancel.DoDoIt

function Tkw_Form_TurnOnTimeMachine.GetString: AnsiString;
begin
 Result := 'en_TurnOnTimeMachine';
end;//Tkw_Form_TurnOnTimeMachine.GetString

class procedure Tkw_Form_TurnOnTimeMachine.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(Ten_TurnOnTimeMachine);
end;//Tkw_Form_TurnOnTimeMachine.RegisterInEngine

class function Tkw_Form_TurnOnTimeMachine.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::TurnOnTimeMachine';
end;//Tkw_Form_TurnOnTimeMachine.GetWordNameForRegister

function Tkw_TurnOnTimeMachine_Control_rb_totmOnDate.GetString: AnsiString;
begin
 Result := 'rb_totmOnDate';
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnDate.GetString

class procedure Tkw_TurnOnTimeMachine_Control_rb_totmOnDate.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtRadioButton);
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnDate.RegisterInEngine

class function Tkw_TurnOnTimeMachine_Control_rb_totmOnDate.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::rb_totmOnDate';
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnDate.GetWordNameForRegister

procedure Tkw_TurnOnTimeMachine_Control_rb_totmOnDate_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('rb_totmOnDate');
 inherited;
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnDate_Push.DoDoIt

class function Tkw_TurnOnTimeMachine_Control_rb_totmOnDate_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::rb_totmOnDate:push';
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnDate_Push.GetWordNameForRegister

function Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation.GetString: AnsiString;
begin
 Result := 'rb_totmOnCurrentRedation';
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation.GetString

class procedure Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtRadioButton);
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation.RegisterInEngine

class function Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::rb_totmOnCurrentRedation';
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation.GetWordNameForRegister

procedure Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('rb_totmOnCurrentRedation');
 inherited;
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation_Push.DoDoIt

class function Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::rb_totmOnCurrentRedation:push';
end;//Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation_Push.GetWordNameForRegister

function Tkw_TurnOnTimeMachine_Control_deDate.GetString: AnsiString;
begin
 Result := 'deDate';
end;//Tkw_TurnOnTimeMachine_Control_deDate.GetString

class procedure Tkw_TurnOnTimeMachine_Control_deDate.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtDblClickDateEdit);
end;//Tkw_TurnOnTimeMachine_Control_deDate.RegisterInEngine

class function Tkw_TurnOnTimeMachine_Control_deDate.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::deDate';
end;//Tkw_TurnOnTimeMachine_Control_deDate.GetWordNameForRegister

procedure Tkw_TurnOnTimeMachine_Control_deDate_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('deDate');
 inherited;
end;//Tkw_TurnOnTimeMachine_Control_deDate_Push.DoDoIt

class function Tkw_TurnOnTimeMachine_Control_deDate_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::deDate:push';
end;//Tkw_TurnOnTimeMachine_Control_deDate_Push.GetWordNameForRegister

function Tkw_TurnOnTimeMachine_Control_pbDialogIcon.GetString: AnsiString;
begin
 Result := 'pbDialogIcon';
end;//Tkw_TurnOnTimeMachine_Control_pbDialogIcon.GetString

class procedure Tkw_TurnOnTimeMachine_Control_pbDialogIcon.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TPaintBox);
end;//Tkw_TurnOnTimeMachine_Control_pbDialogIcon.RegisterInEngine

class function Tkw_TurnOnTimeMachine_Control_pbDialogIcon.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pbDialogIcon';
end;//Tkw_TurnOnTimeMachine_Control_pbDialogIcon.GetWordNameForRegister

procedure Tkw_TurnOnTimeMachine_Control_pbDialogIcon_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('pbDialogIcon');
 inherited;
end;//Tkw_TurnOnTimeMachine_Control_pbDialogIcon_Push.DoDoIt

class function Tkw_TurnOnTimeMachine_Control_pbDialogIcon_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::pbDialogIcon:push';
end;//Tkw_TurnOnTimeMachine_Control_pbDialogIcon_Push.GetWordNameForRegister

function Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo.GetString: AnsiString;
begin
 Result := 'lblTurnOnTimeMachineInfo';
end;//Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo.GetString

class procedure Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo.RegisterInEngine

class function Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::lblTurnOnTimeMachineInfo';
end;//Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo.GetWordNameForRegister

procedure Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('lblTurnOnTimeMachineInfo');
 inherited;
end;//Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo_Push.DoDoIt

class function Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::lblTurnOnTimeMachineInfo:push';
end;//Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo_Push.GetWordNameForRegister

function Tkw_TurnOnTimeMachine_Control_btnOk.GetString: AnsiString;
begin
 Result := 'btnOk';
end;//Tkw_TurnOnTimeMachine_Control_btnOk.GetString

class procedure Tkw_TurnOnTimeMachine_Control_btnOk.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtButton);
end;//Tkw_TurnOnTimeMachine_Control_btnOk.RegisterInEngine

class function Tkw_TurnOnTimeMachine_Control_btnOk.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::btnOk';
end;//Tkw_TurnOnTimeMachine_Control_btnOk.GetWordNameForRegister

procedure Tkw_TurnOnTimeMachine_Control_btnOk_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('btnOk');
 inherited;
end;//Tkw_TurnOnTimeMachine_Control_btnOk_Push.DoDoIt

class function Tkw_TurnOnTimeMachine_Control_btnOk_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::btnOk:push';
end;//Tkw_TurnOnTimeMachine_Control_btnOk_Push.GetWordNameForRegister

function Tkw_TurnOnTimeMachine_Control_btnCancel.GetString: AnsiString;
begin
 Result := 'btnCancel';
end;//Tkw_TurnOnTimeMachine_Control_btnCancel.GetString

class procedure Tkw_TurnOnTimeMachine_Control_btnCancel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtButton);
end;//Tkw_TurnOnTimeMachine_Control_btnCancel.RegisterInEngine

class function Tkw_TurnOnTimeMachine_Control_btnCancel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::btnCancel';
end;//Tkw_TurnOnTimeMachine_Control_btnCancel.GetWordNameForRegister

procedure Tkw_TurnOnTimeMachine_Control_btnCancel_Push.DoDoIt(const aCtx: TtfwContext);
begin
 aCtx.rEngine.PushString('btnCancel');
 inherited;
end;//Tkw_TurnOnTimeMachine_Control_btnCancel_Push.DoDoIt

class function Tkw_TurnOnTimeMachine_Control_btnCancel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::btnCancel:push';
end;//Tkw_TurnOnTimeMachine_Control_btnCancel_Push.GetWordNameForRegister

initialization
 TkwEnTurnOnTimeMachineRbTotmOnDate.RegisterInEngine;
 {* ����������� en_TurnOnTimeMachine_rb_totmOnDate }
 TkwEnTurnOnTimeMachineRbTotmOnCurrentRedation.RegisterInEngine;
 {* ����������� en_TurnOnTimeMachine_rb_totmOnCurrentRedation }
 TkwEnTurnOnTimeMachineDeDate.RegisterInEngine;
 {* ����������� en_TurnOnTimeMachine_deDate }
 TkwEnTurnOnTimeMachinePbDialogIcon.RegisterInEngine;
 {* ����������� en_TurnOnTimeMachine_pbDialogIcon }
 TkwEnTurnOnTimeMachineLblTurnOnTimeMachineInfo.RegisterInEngine;
 {* ����������� en_TurnOnTimeMachine_lblTurnOnTimeMachineInfo }
 TkwEnTurnOnTimeMachineBtnOk.RegisterInEngine;
 {* ����������� en_TurnOnTimeMachine_btnOk }
 TkwEnTurnOnTimeMachineBtnCancel.RegisterInEngine;
 {* ����������� en_TurnOnTimeMachine_btnCancel }
 Tkw_Form_TurnOnTimeMachine.RegisterInEngine;
 {* ����������� Tkw_Form_TurnOnTimeMachine }
 Tkw_TurnOnTimeMachine_Control_rb_totmOnDate.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_rb_totmOnDate }
 Tkw_TurnOnTimeMachine_Control_rb_totmOnDate_Push.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_rb_totmOnDate_Push }
 Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation }
 Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation_Push.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_rb_totmOnCurrentRedation_Push }
 Tkw_TurnOnTimeMachine_Control_deDate.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_deDate }
 Tkw_TurnOnTimeMachine_Control_deDate_Push.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_deDate_Push }
 Tkw_TurnOnTimeMachine_Control_pbDialogIcon.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_pbDialogIcon }
 Tkw_TurnOnTimeMachine_Control_pbDialogIcon_Push.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_pbDialogIcon_Push }
 Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo }
 Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo_Push.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_lblTurnOnTimeMachineInfo_Push }
 Tkw_TurnOnTimeMachine_Control_btnOk.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_btnOk }
 Tkw_TurnOnTimeMachine_Control_btnOk_Push.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_btnOk_Push }
 Tkw_TurnOnTimeMachine_Control_btnCancel.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_btnCancel }
 Tkw_TurnOnTimeMachine_Control_btnCancel_Push.RegisterInEngine;
 {* ����������� Tkw_TurnOnTimeMachine_Control_btnCancel_Push }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Ten_TurnOnTimeMachine));
 {* ����������� ���� Ten_TurnOnTimeMachine }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtRadioButton));
 {* ����������� ���� TvtRadioButton }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtDblClickDateEdit));
 {* ����������� ���� TvtDblClickDateEdit }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TPaintBox));
 {* ����������� ���� TPaintBox }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtLabel));
 {* ����������� ���� TvtLabel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtButton));
 {* ����������� ���� TvtButton }
{$IfEnd} // NOT Defined(Admin) AND NOT Defined(Monitorings) AND NOT Defined(NoScripts) AND NOT Defined(NoVCL)

end.
