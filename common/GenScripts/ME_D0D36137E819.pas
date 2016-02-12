unit AttributeSelectKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� AttributeSelect }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\LiteSearch\AttributeSelectKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include nsDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , LiteSearch_Module
 , vtProportionalPanel
 , vtSizeablePanel
 , vtPanel
 , tfwControlString
 {$If NOT Defined(NoVCL)}
 , kwBynameControlPush
 {$IfEnd} // NOT Defined(NoVCL)
 , tfwScriptingInterfaces
 , tfwPropertyLike
 , tfwTypeInfo
 , TypInfo
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , TtfwClassRef_Proxy
 , SysUtils
;

type
 Tkw_Form_AttributeSelect = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� AttributeSelect
----
*������ �������������*:
[code]
'aControl' �����::AttributeSelect TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
 end;//Tkw_Form_AttributeSelect

 Tkw_AttributeSelect_Control_BackgroundPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� BackgroundPanel
----
*������ �������������*:
[code]
�������::BackgroundPanel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_AttributeSelect_Control_BackgroundPanel

 Tkw_AttributeSelect_Control_BackgroundPanel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� BackgroundPanel
----
*������ �������������*:
[code]
�������::BackgroundPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_AttributeSelect_Control_BackgroundPanel_Push

 Tkw_AttributeSelect_Control_SelectedZone = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� SelectedZone
----
*������ �������������*:
[code]
�������::SelectedZone TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_AttributeSelect_Control_SelectedZone

 Tkw_AttributeSelect_Control_SelectedZone_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� SelectedZone
----
*������ �������������*:
[code]
�������::SelectedZone:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_AttributeSelect_Control_SelectedZone_Push

 Tkw_AttributeSelect_Control_ValuesZone = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ValuesZone
----
*������ �������������*:
[code]
�������::ValuesZone TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_AttributeSelect_Control_ValuesZone

 Tkw_AttributeSelect_Control_ValuesZone_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� ValuesZone
----
*������ �������������*:
[code]
�������::ValuesZone:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_AttributeSelect_Control_ValuesZone_Push

 TkwCfAttributeSelectBackgroundPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TcfAttributeSelect.BackgroundPanel
[panel]������� BackgroundPanel ����� TcfAttributeSelect[panel]
*��� ����������:* TvtProportionalPanel
*������:*
[code]
OBJECT VAR l_TvtProportionalPanel
 acfAttributeSelect .TcfAttributeSelect.BackgroundPanel >>> l_TvtProportionalPanel
[code]  }
  private
   function BackgroundPanel(const aCtx: TtfwContext;
    acfAttributeSelect: TcfAttributeSelect): TvtProportionalPanel;
    {* ���������� ����� ������� .TcfAttributeSelect.BackgroundPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwCfAttributeSelectBackgroundPanel

 TkwCfAttributeSelectSelectedZone = {final} class(TtfwPropertyLike)
  {* ����� ������� .TcfAttributeSelect.SelectedZone
[panel]������� SelectedZone ����� TcfAttributeSelect[panel]
*��� ����������:* TvtSizeablePanel
*������:*
[code]
OBJECT VAR l_TvtSizeablePanel
 acfAttributeSelect .TcfAttributeSelect.SelectedZone >>> l_TvtSizeablePanel
[code]  }
  private
   function SelectedZone(const aCtx: TtfwContext;
    acfAttributeSelect: TcfAttributeSelect): TvtSizeablePanel;
    {* ���������� ����� ������� .TcfAttributeSelect.SelectedZone }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwCfAttributeSelectSelectedZone

 TkwCfAttributeSelectValuesZone = {final} class(TtfwPropertyLike)
  {* ����� ������� .TcfAttributeSelect.ValuesZone
[panel]������� ValuesZone ����� TcfAttributeSelect[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 acfAttributeSelect .TcfAttributeSelect.ValuesZone >>> l_TvtPanel
[code]  }
  private
   function ValuesZone(const aCtx: TtfwContext;
    acfAttributeSelect: TcfAttributeSelect): TvtPanel;
    {* ���������� ����� ������� .TcfAttributeSelect.ValuesZone }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwCfAttributeSelectValuesZone

class function Tkw_Form_AttributeSelect.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::AttributeSelect';
end;//Tkw_Form_AttributeSelect.GetWordNameForRegister

function Tkw_Form_AttributeSelect.GetString: AnsiString;
begin
 Result := 'cfAttributeSelect';
end;//Tkw_Form_AttributeSelect.GetString

class function Tkw_AttributeSelect_Control_BackgroundPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BackgroundPanel';
end;//Tkw_AttributeSelect_Control_BackgroundPanel.GetWordNameForRegister

function Tkw_AttributeSelect_Control_BackgroundPanel.GetString: AnsiString;
begin
 Result := 'BackgroundPanel';
end;//Tkw_AttributeSelect_Control_BackgroundPanel.GetString

class procedure Tkw_AttributeSelect_Control_BackgroundPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtProportionalPanel);
end;//Tkw_AttributeSelect_Control_BackgroundPanel.RegisterInEngine

procedure Tkw_AttributeSelect_Control_BackgroundPanel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_3153A90F966C_var*
//#UC END# *4DAEEDE10285_3153A90F966C_var*
begin
//#UC START# *4DAEEDE10285_3153A90F966C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_3153A90F966C_impl*
end;//Tkw_AttributeSelect_Control_BackgroundPanel_Push.DoDoIt

class function Tkw_AttributeSelect_Control_BackgroundPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BackgroundPanel:push';
end;//Tkw_AttributeSelect_Control_BackgroundPanel_Push.GetWordNameForRegister

class function Tkw_AttributeSelect_Control_SelectedZone.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::SelectedZone';
end;//Tkw_AttributeSelect_Control_SelectedZone.GetWordNameForRegister

function Tkw_AttributeSelect_Control_SelectedZone.GetString: AnsiString;
begin
 Result := 'SelectedZone';
end;//Tkw_AttributeSelect_Control_SelectedZone.GetString

class procedure Tkw_AttributeSelect_Control_SelectedZone.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtSizeablePanel);
end;//Tkw_AttributeSelect_Control_SelectedZone.RegisterInEngine

procedure Tkw_AttributeSelect_Control_SelectedZone_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_2AB8F1A7EDFE_var*
//#UC END# *4DAEEDE10285_2AB8F1A7EDFE_var*
begin
//#UC START# *4DAEEDE10285_2AB8F1A7EDFE_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_2AB8F1A7EDFE_impl*
end;//Tkw_AttributeSelect_Control_SelectedZone_Push.DoDoIt

class function Tkw_AttributeSelect_Control_SelectedZone_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::SelectedZone:push';
end;//Tkw_AttributeSelect_Control_SelectedZone_Push.GetWordNameForRegister

class function Tkw_AttributeSelect_Control_ValuesZone.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ValuesZone';
end;//Tkw_AttributeSelect_Control_ValuesZone.GetWordNameForRegister

function Tkw_AttributeSelect_Control_ValuesZone.GetString: AnsiString;
begin
 Result := 'ValuesZone';
end;//Tkw_AttributeSelect_Control_ValuesZone.GetString

class procedure Tkw_AttributeSelect_Control_ValuesZone.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_AttributeSelect_Control_ValuesZone.RegisterInEngine

procedure Tkw_AttributeSelect_Control_ValuesZone_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_433C953F27DF_var*
//#UC END# *4DAEEDE10285_433C953F27DF_var*
begin
//#UC START# *4DAEEDE10285_433C953F27DF_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_433C953F27DF_impl*
end;//Tkw_AttributeSelect_Control_ValuesZone_Push.DoDoIt

class function Tkw_AttributeSelect_Control_ValuesZone_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ValuesZone:push';
end;//Tkw_AttributeSelect_Control_ValuesZone_Push.GetWordNameForRegister

function TkwCfAttributeSelectBackgroundPanel.BackgroundPanel(const aCtx: TtfwContext;
 acfAttributeSelect: TcfAttributeSelect): TvtProportionalPanel;
 {* ���������� ����� ������� .TcfAttributeSelect.BackgroundPanel }
begin
 Result := acfAttributeSelect.BackgroundPanel;
end;//TkwCfAttributeSelectBackgroundPanel.BackgroundPanel

procedure TkwCfAttributeSelectBackgroundPanel.DoDoIt(const aCtx: TtfwContext);
var l_acfAttributeSelect: TcfAttributeSelect;
begin
 try
  l_acfAttributeSelect := TcfAttributeSelect(aCtx.rEngine.PopObjAs(TcfAttributeSelect));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� acfAttributeSelect: TcfAttributeSelect : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(BackgroundPanel(aCtx, l_acfAttributeSelect));
end;//TkwCfAttributeSelectBackgroundPanel.DoDoIt

class function TkwCfAttributeSelectBackgroundPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TcfAttributeSelect.BackgroundPanel';
end;//TkwCfAttributeSelectBackgroundPanel.GetWordNameForRegister

procedure TkwCfAttributeSelectBackgroundPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� BackgroundPanel', aCtx);
end;//TkwCfAttributeSelectBackgroundPanel.SetValuePrim

function TkwCfAttributeSelectBackgroundPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtProportionalPanel);
end;//TkwCfAttributeSelectBackgroundPanel.GetResultTypeInfo

function TkwCfAttributeSelectBackgroundPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwCfAttributeSelectBackgroundPanel.GetAllParamsCount

function TkwCfAttributeSelectBackgroundPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TcfAttributeSelect)]);
end;//TkwCfAttributeSelectBackgroundPanel.ParamsTypes

function TkwCfAttributeSelectSelectedZone.SelectedZone(const aCtx: TtfwContext;
 acfAttributeSelect: TcfAttributeSelect): TvtSizeablePanel;
 {* ���������� ����� ������� .TcfAttributeSelect.SelectedZone }
begin
 Result := acfAttributeSelect.SelectedZone;
end;//TkwCfAttributeSelectSelectedZone.SelectedZone

procedure TkwCfAttributeSelectSelectedZone.DoDoIt(const aCtx: TtfwContext);
var l_acfAttributeSelect: TcfAttributeSelect;
begin
 try
  l_acfAttributeSelect := TcfAttributeSelect(aCtx.rEngine.PopObjAs(TcfAttributeSelect));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� acfAttributeSelect: TcfAttributeSelect : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(SelectedZone(aCtx, l_acfAttributeSelect));
end;//TkwCfAttributeSelectSelectedZone.DoDoIt

class function TkwCfAttributeSelectSelectedZone.GetWordNameForRegister: AnsiString;
begin
 Result := '.TcfAttributeSelect.SelectedZone';
end;//TkwCfAttributeSelectSelectedZone.GetWordNameForRegister

procedure TkwCfAttributeSelectSelectedZone.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� SelectedZone', aCtx);
end;//TkwCfAttributeSelectSelectedZone.SetValuePrim

function TkwCfAttributeSelectSelectedZone.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtSizeablePanel);
end;//TkwCfAttributeSelectSelectedZone.GetResultTypeInfo

function TkwCfAttributeSelectSelectedZone.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwCfAttributeSelectSelectedZone.GetAllParamsCount

function TkwCfAttributeSelectSelectedZone.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TcfAttributeSelect)]);
end;//TkwCfAttributeSelectSelectedZone.ParamsTypes

function TkwCfAttributeSelectValuesZone.ValuesZone(const aCtx: TtfwContext;
 acfAttributeSelect: TcfAttributeSelect): TvtPanel;
 {* ���������� ����� ������� .TcfAttributeSelect.ValuesZone }
begin
 Result := acfAttributeSelect.ValuesZone;
end;//TkwCfAttributeSelectValuesZone.ValuesZone

procedure TkwCfAttributeSelectValuesZone.DoDoIt(const aCtx: TtfwContext);
var l_acfAttributeSelect: TcfAttributeSelect;
begin
 try
  l_acfAttributeSelect := TcfAttributeSelect(aCtx.rEngine.PopObjAs(TcfAttributeSelect));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� acfAttributeSelect: TcfAttributeSelect : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ValuesZone(aCtx, l_acfAttributeSelect));
end;//TkwCfAttributeSelectValuesZone.DoDoIt

class function TkwCfAttributeSelectValuesZone.GetWordNameForRegister: AnsiString;
begin
 Result := '.TcfAttributeSelect.ValuesZone';
end;//TkwCfAttributeSelectValuesZone.GetWordNameForRegister

procedure TkwCfAttributeSelectValuesZone.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ValuesZone', aCtx);
end;//TkwCfAttributeSelectValuesZone.SetValuePrim

function TkwCfAttributeSelectValuesZone.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwCfAttributeSelectValuesZone.GetResultTypeInfo

function TkwCfAttributeSelectValuesZone.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwCfAttributeSelectValuesZone.GetAllParamsCount

function TkwCfAttributeSelectValuesZone.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TcfAttributeSelect)]);
end;//TkwCfAttributeSelectValuesZone.ParamsTypes

initialization
 Tkw_Form_AttributeSelect.RegisterInEngine;
 {* ����������� Tkw_Form_AttributeSelect }
 Tkw_AttributeSelect_Control_BackgroundPanel.RegisterInEngine;
 {* ����������� Tkw_AttributeSelect_Control_BackgroundPanel }
 Tkw_AttributeSelect_Control_BackgroundPanel_Push.RegisterInEngine;
 {* ����������� Tkw_AttributeSelect_Control_BackgroundPanel_Push }
 Tkw_AttributeSelect_Control_SelectedZone.RegisterInEngine;
 {* ����������� Tkw_AttributeSelect_Control_SelectedZone }
 Tkw_AttributeSelect_Control_SelectedZone_Push.RegisterInEngine;
 {* ����������� Tkw_AttributeSelect_Control_SelectedZone_Push }
 Tkw_AttributeSelect_Control_ValuesZone.RegisterInEngine;
 {* ����������� Tkw_AttributeSelect_Control_ValuesZone }
 Tkw_AttributeSelect_Control_ValuesZone_Push.RegisterInEngine;
 {* ����������� Tkw_AttributeSelect_Control_ValuesZone_Push }
 TkwCfAttributeSelectBackgroundPanel.RegisterInEngine;
 {* ����������� cfAttributeSelect_BackgroundPanel }
 TkwCfAttributeSelectSelectedZone.RegisterInEngine;
 {* ����������� cfAttributeSelect_SelectedZone }
 TkwCfAttributeSelectValuesZone.RegisterInEngine;
 {* ����������� cfAttributeSelect_ValuesZone }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TcfAttributeSelect));
 {* ����������� ���� AttributeSelect }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtProportionalPanel));
 {* ����������� ���� TvtProportionalPanel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtSizeablePanel));
 {* ����������� ���� TvtSizeablePanel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtPanel));
 {* ����������� ���� TvtPanel }
{$IfEnd} // NOT Defined(NoScripts)

end.
