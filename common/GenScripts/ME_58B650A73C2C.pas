unit LongProcessKeywordsPack;
 {* ����� ���� ������� ��� ������� � ����������� ��������� ����� LongProcess }

// ������: "w:\garant6x\implementation\Garant\GbaNemesis\View\PrimCommon\LongProcessKeywordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include nsDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , PrimCommon_Module
 , vtPanel
 , vtLabel
 , vtGradientWaitbar
 {$If NOT Defined(NoVCL)}
 , ExtCtrls
 {$IfEnd} // NOT Defined(NoVCL)
 , vtButton
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
 Tkw_Form_LongProcess = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� ����� LongProcess
----
*������ �������������*:
[code]
'aControl' �����::LongProcess TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
 end;//Tkw_Form_LongProcess

 Tkw_LongProcess_Control_ClientPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ClientPanel
----
*������ �������������*:
[code]
�������::ClientPanel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_LongProcess_Control_ClientPanel

 Tkw_LongProcess_Control_ClientPanel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� ClientPanel
----
*������ �������������*:
[code]
�������::ClientPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LongProcess_Control_ClientPanel_Push

 Tkw_LongProcess_Control_MessageLabel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� MessageLabel
----
*������ �������������*:
[code]
�������::MessageLabel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_LongProcess_Control_MessageLabel

 Tkw_LongProcess_Control_MessageLabel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� MessageLabel
----
*������ �������������*:
[code]
�������::MessageLabel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LongProcess_Control_MessageLabel_Push

 Tkw_LongProcess_Control_BottomPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� BottomPanel
----
*������ �������������*:
[code]
�������::BottomPanel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_LongProcess_Control_BottomPanel

 Tkw_LongProcess_Control_BottomPanel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� BottomPanel
----
*������ �������������*:
[code]
�������::BottomPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LongProcess_Control_BottomPanel_Push

 Tkw_LongProcess_Control_ProgressBar = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ProgressBar
----
*������ �������������*:
[code]
�������::ProgressBar TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_LongProcess_Control_ProgressBar

 Tkw_LongProcess_Control_ProgressBar_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� ProgressBar
----
*������ �������������*:
[code]
�������::ProgressBar:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LongProcess_Control_ProgressBar_Push

 Tkw_LongProcess_Control_LeftPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� LeftPanel
----
*������ �������������*:
[code]
�������::LeftPanel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_LongProcess_Control_LeftPanel

 Tkw_LongProcess_Control_LeftPanel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� LeftPanel
----
*������ �������������*:
[code]
�������::LeftPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LongProcess_Control_LeftPanel_Push

 Tkw_LongProcess_Control_Image = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� Image
----
*������ �������������*:
[code]
�������::Image TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_LongProcess_Control_Image

 Tkw_LongProcess_Control_Image_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� Image
----
*������ �������������*:
[code]
�������::Image:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LongProcess_Control_Image_Push

 Tkw_LongProcess_Control_ButtonPanel = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� ButtonPanel
----
*������ �������������*:
[code]
�������::ButtonPanel TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_LongProcess_Control_ButtonPanel

 Tkw_LongProcess_Control_ButtonPanel_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� ButtonPanel
----
*������ �������������*:
[code]
�������::ButtonPanel:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LongProcess_Control_ButtonPanel_Push

 Tkw_LongProcess_Control_btnExit = {final} class(TtfwControlString)
  {* ����� ������� ��� �������������� �������� btnExit
----
*������ �������������*:
[code]
�������::btnExit TryFocus ASSERT
[code] }
  protected
   class function GetWordNameForRegister: AnsiString; override;
   function GetString: AnsiString; override;
   class procedure RegisterInEngine; override;
 end;//Tkw_LongProcess_Control_btnExit

 Tkw_LongProcess_Control_btnExit_Push = {final} class(TkwBynameControlPush)
  {* ����� ������� ��� �������� btnExit
----
*������ �������������*:
[code]
�������::btnExit:push pop:control:SetFocus ASSERT
[code] }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
 end;//Tkw_LongProcess_Control_btnExit_Push

 TkwLongProcessFormClientPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLongProcessForm.ClientPanel
[panel]������� ClientPanel ����� TLongProcessForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aLongProcessForm .TLongProcessForm.ClientPanel >>> l_TvtPanel
[code]  }
  private
   function ClientPanel(const aCtx: TtfwContext;
    aLongProcessForm: TLongProcessForm): TvtPanel;
    {* ���������� ����� ������� .TLongProcessForm.ClientPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwLongProcessFormClientPanel

 TkwLongProcessFormMessageLabel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLongProcessForm.MessageLabel
[panel]������� MessageLabel ����� TLongProcessForm[panel]
*��� ����������:* TvtLabel
*������:*
[code]
OBJECT VAR l_TvtLabel
 aLongProcessForm .TLongProcessForm.MessageLabel >>> l_TvtLabel
[code]  }
  private
   function MessageLabel(const aCtx: TtfwContext;
    aLongProcessForm: TLongProcessForm): TvtLabel;
    {* ���������� ����� ������� .TLongProcessForm.MessageLabel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwLongProcessFormMessageLabel

 TkwLongProcessFormBottomPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLongProcessForm.BottomPanel
[panel]������� BottomPanel ����� TLongProcessForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aLongProcessForm .TLongProcessForm.BottomPanel >>> l_TvtPanel
[code]  }
  private
   function BottomPanel(const aCtx: TtfwContext;
    aLongProcessForm: TLongProcessForm): TvtPanel;
    {* ���������� ����� ������� .TLongProcessForm.BottomPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwLongProcessFormBottomPanel

 TkwLongProcessFormProgressBar = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLongProcessForm.ProgressBar
[panel]������� ProgressBar ����� TLongProcessForm[panel]
*��� ����������:* TvtGradientWaitbar
*������:*
[code]
OBJECT VAR l_TvtGradientWaitbar
 aLongProcessForm .TLongProcessForm.ProgressBar >>> l_TvtGradientWaitbar
[code]  }
  private
   function ProgressBar(const aCtx: TtfwContext;
    aLongProcessForm: TLongProcessForm): TvtGradientWaitbar;
    {* ���������� ����� ������� .TLongProcessForm.ProgressBar }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwLongProcessFormProgressBar

 TkwLongProcessFormLeftPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLongProcessForm.LeftPanel
[panel]������� LeftPanel ����� TLongProcessForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aLongProcessForm .TLongProcessForm.LeftPanel >>> l_TvtPanel
[code]  }
  private
   function LeftPanel(const aCtx: TtfwContext;
    aLongProcessForm: TLongProcessForm): TvtPanel;
    {* ���������� ����� ������� .TLongProcessForm.LeftPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwLongProcessFormLeftPanel

 TkwLongProcessFormImage = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLongProcessForm.Image
[panel]������� Image ����� TLongProcessForm[panel]
*��� ����������:* TImage
*������:*
[code]
OBJECT VAR l_TImage
 aLongProcessForm .TLongProcessForm.Image >>> l_TImage
[code]  }
  private
   function Image(const aCtx: TtfwContext;
    aLongProcessForm: TLongProcessForm): TImage;
    {* ���������� ����� ������� .TLongProcessForm.Image }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwLongProcessFormImage

 TkwLongProcessFormButtonPanel = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLongProcessForm.ButtonPanel
[panel]������� ButtonPanel ����� TLongProcessForm[panel]
*��� ����������:* TvtPanel
*������:*
[code]
OBJECT VAR l_TvtPanel
 aLongProcessForm .TLongProcessForm.ButtonPanel >>> l_TvtPanel
[code]  }
  private
   function ButtonPanel(const aCtx: TtfwContext;
    aLongProcessForm: TLongProcessForm): TvtPanel;
    {* ���������� ����� ������� .TLongProcessForm.ButtonPanel }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwLongProcessFormButtonPanel

 TkwLongProcessFormBtnExit = {final} class(TtfwPropertyLike)
  {* ����� ������� .TLongProcessForm.btnExit
[panel]������� btnExit ����� TLongProcessForm[panel]
*��� ����������:* TvtButton
*������:*
[code]
OBJECT VAR l_TvtButton
 aLongProcessForm .TLongProcessForm.btnExit >>> l_TvtButton
[code]  }
  private
   function btnExit(const aCtx: TtfwContext;
    aLongProcessForm: TLongProcessForm): TvtButton;
    {* ���������� ����� ������� .TLongProcessForm.btnExit }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwLongProcessFormBtnExit

class function Tkw_Form_LongProcess.GetWordNameForRegister: AnsiString;
begin
 Result := '�����::LongProcess';
end;//Tkw_Form_LongProcess.GetWordNameForRegister

function Tkw_Form_LongProcess.GetString: AnsiString;
begin
 Result := 'LongProcessForm';
end;//Tkw_Form_LongProcess.GetString

class function Tkw_LongProcess_Control_ClientPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ClientPanel';
end;//Tkw_LongProcess_Control_ClientPanel.GetWordNameForRegister

function Tkw_LongProcess_Control_ClientPanel.GetString: AnsiString;
begin
 Result := 'ClientPanel';
end;//Tkw_LongProcess_Control_ClientPanel.GetString

class procedure Tkw_LongProcess_Control_ClientPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_LongProcess_Control_ClientPanel.RegisterInEngine

procedure Tkw_LongProcess_Control_ClientPanel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_8A095E715C45_var*
//#UC END# *4DAEEDE10285_8A095E715C45_var*
begin
//#UC START# *4DAEEDE10285_8A095E715C45_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_8A095E715C45_impl*
end;//Tkw_LongProcess_Control_ClientPanel_Push.DoDoIt

class function Tkw_LongProcess_Control_ClientPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ClientPanel:push';
end;//Tkw_LongProcess_Control_ClientPanel_Push.GetWordNameForRegister

class function Tkw_LongProcess_Control_MessageLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::MessageLabel';
end;//Tkw_LongProcess_Control_MessageLabel.GetWordNameForRegister

function Tkw_LongProcess_Control_MessageLabel.GetString: AnsiString;
begin
 Result := 'MessageLabel';
end;//Tkw_LongProcess_Control_MessageLabel.GetString

class procedure Tkw_LongProcess_Control_MessageLabel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtLabel);
end;//Tkw_LongProcess_Control_MessageLabel.RegisterInEngine

procedure Tkw_LongProcess_Control_MessageLabel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_BB38FEFB196C_var*
//#UC END# *4DAEEDE10285_BB38FEFB196C_var*
begin
//#UC START# *4DAEEDE10285_BB38FEFB196C_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_BB38FEFB196C_impl*
end;//Tkw_LongProcess_Control_MessageLabel_Push.DoDoIt

class function Tkw_LongProcess_Control_MessageLabel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::MessageLabel:push';
end;//Tkw_LongProcess_Control_MessageLabel_Push.GetWordNameForRegister

class function Tkw_LongProcess_Control_BottomPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BottomPanel';
end;//Tkw_LongProcess_Control_BottomPanel.GetWordNameForRegister

function Tkw_LongProcess_Control_BottomPanel.GetString: AnsiString;
begin
 Result := 'BottomPanel';
end;//Tkw_LongProcess_Control_BottomPanel.GetString

class procedure Tkw_LongProcess_Control_BottomPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_LongProcess_Control_BottomPanel.RegisterInEngine

procedure Tkw_LongProcess_Control_BottomPanel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_73A2CC14762E_var*
//#UC END# *4DAEEDE10285_73A2CC14762E_var*
begin
//#UC START# *4DAEEDE10285_73A2CC14762E_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_73A2CC14762E_impl*
end;//Tkw_LongProcess_Control_BottomPanel_Push.DoDoIt

class function Tkw_LongProcess_Control_BottomPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::BottomPanel:push';
end;//Tkw_LongProcess_Control_BottomPanel_Push.GetWordNameForRegister

class function Tkw_LongProcess_Control_ProgressBar.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ProgressBar';
end;//Tkw_LongProcess_Control_ProgressBar.GetWordNameForRegister

function Tkw_LongProcess_Control_ProgressBar.GetString: AnsiString;
begin
 Result := 'ProgressBar';
end;//Tkw_LongProcess_Control_ProgressBar.GetString

class procedure Tkw_LongProcess_Control_ProgressBar.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtGradientWaitbar);
end;//Tkw_LongProcess_Control_ProgressBar.RegisterInEngine

procedure Tkw_LongProcess_Control_ProgressBar_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_FECE38307A18_var*
//#UC END# *4DAEEDE10285_FECE38307A18_var*
begin
//#UC START# *4DAEEDE10285_FECE38307A18_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_FECE38307A18_impl*
end;//Tkw_LongProcess_Control_ProgressBar_Push.DoDoIt

class function Tkw_LongProcess_Control_ProgressBar_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ProgressBar:push';
end;//Tkw_LongProcess_Control_ProgressBar_Push.GetWordNameForRegister

class function Tkw_LongProcess_Control_LeftPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::LeftPanel';
end;//Tkw_LongProcess_Control_LeftPanel.GetWordNameForRegister

function Tkw_LongProcess_Control_LeftPanel.GetString: AnsiString;
begin
 Result := 'LeftPanel';
end;//Tkw_LongProcess_Control_LeftPanel.GetString

class procedure Tkw_LongProcess_Control_LeftPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_LongProcess_Control_LeftPanel.RegisterInEngine

procedure Tkw_LongProcess_Control_LeftPanel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_4FF3E57F14F3_var*
//#UC END# *4DAEEDE10285_4FF3E57F14F3_var*
begin
//#UC START# *4DAEEDE10285_4FF3E57F14F3_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_4FF3E57F14F3_impl*
end;//Tkw_LongProcess_Control_LeftPanel_Push.DoDoIt

class function Tkw_LongProcess_Control_LeftPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::LeftPanel:push';
end;//Tkw_LongProcess_Control_LeftPanel_Push.GetWordNameForRegister

class function Tkw_LongProcess_Control_Image.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Image';
end;//Tkw_LongProcess_Control_Image.GetWordNameForRegister

function Tkw_LongProcess_Control_Image.GetString: AnsiString;
begin
 Result := 'Image';
end;//Tkw_LongProcess_Control_Image.GetString

class procedure Tkw_LongProcess_Control_Image.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TImage);
end;//Tkw_LongProcess_Control_Image.RegisterInEngine

procedure Tkw_LongProcess_Control_Image_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_C215319A5871_var*
//#UC END# *4DAEEDE10285_C215319A5871_var*
begin
//#UC START# *4DAEEDE10285_C215319A5871_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_C215319A5871_impl*
end;//Tkw_LongProcess_Control_Image_Push.DoDoIt

class function Tkw_LongProcess_Control_Image_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::Image:push';
end;//Tkw_LongProcess_Control_Image_Push.GetWordNameForRegister

class function Tkw_LongProcess_Control_ButtonPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ButtonPanel';
end;//Tkw_LongProcess_Control_ButtonPanel.GetWordNameForRegister

function Tkw_LongProcess_Control_ButtonPanel.GetString: AnsiString;
begin
 Result := 'ButtonPanel';
end;//Tkw_LongProcess_Control_ButtonPanel.GetString

class procedure Tkw_LongProcess_Control_ButtonPanel.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtPanel);
end;//Tkw_LongProcess_Control_ButtonPanel.RegisterInEngine

procedure Tkw_LongProcess_Control_ButtonPanel_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_545230A3EEC9_var*
//#UC END# *4DAEEDE10285_545230A3EEC9_var*
begin
//#UC START# *4DAEEDE10285_545230A3EEC9_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_545230A3EEC9_impl*
end;//Tkw_LongProcess_Control_ButtonPanel_Push.DoDoIt

class function Tkw_LongProcess_Control_ButtonPanel_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::ButtonPanel:push';
end;//Tkw_LongProcess_Control_ButtonPanel_Push.GetWordNameForRegister

class function Tkw_LongProcess_Control_btnExit.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::btnExit';
end;//Tkw_LongProcess_Control_btnExit.GetWordNameForRegister

function Tkw_LongProcess_Control_btnExit.GetString: AnsiString;
begin
 Result := 'btnExit';
end;//Tkw_LongProcess_Control_btnExit.GetString

class procedure Tkw_LongProcess_Control_btnExit.RegisterInEngine;
begin
 inherited;
 TtfwClassRef.Register(TvtButton);
end;//Tkw_LongProcess_Control_btnExit.RegisterInEngine

procedure Tkw_LongProcess_Control_btnExit_Push.DoDoIt(const aCtx: TtfwContext);
//#UC START# *4DAEEDE10285_E7E0F6C9E87A_var*
//#UC END# *4DAEEDE10285_E7E0F6C9E87A_var*
begin
//#UC START# *4DAEEDE10285_E7E0F6C9E87A_impl*
 !!! Needs to be implemented !!!
//#UC END# *4DAEEDE10285_E7E0F6C9E87A_impl*
end;//Tkw_LongProcess_Control_btnExit_Push.DoDoIt

class function Tkw_LongProcess_Control_btnExit_Push.GetWordNameForRegister: AnsiString;
begin
 Result := '�������::btnExit:push';
end;//Tkw_LongProcess_Control_btnExit_Push.GetWordNameForRegister

function TkwLongProcessFormClientPanel.ClientPanel(const aCtx: TtfwContext;
 aLongProcessForm: TLongProcessForm): TvtPanel;
 {* ���������� ����� ������� .TLongProcessForm.ClientPanel }
begin
 Result := aLongProcessForm.ClientPanel;
end;//TkwLongProcessFormClientPanel.ClientPanel

procedure TkwLongProcessFormClientPanel.DoDoIt(const aCtx: TtfwContext);
var l_aLongProcessForm: TLongProcessForm;
begin
 try
  l_aLongProcessForm := TLongProcessForm(aCtx.rEngine.PopObjAs(TLongProcessForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLongProcessForm: TLongProcessForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ClientPanel(aCtx, l_aLongProcessForm));
end;//TkwLongProcessFormClientPanel.DoDoIt

class function TkwLongProcessFormClientPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLongProcessForm.ClientPanel';
end;//TkwLongProcessFormClientPanel.GetWordNameForRegister

procedure TkwLongProcessFormClientPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ClientPanel', aCtx);
end;//TkwLongProcessFormClientPanel.SetValuePrim

function TkwLongProcessFormClientPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwLongProcessFormClientPanel.GetResultTypeInfo

function TkwLongProcessFormClientPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLongProcessFormClientPanel.GetAllParamsCount

function TkwLongProcessFormClientPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLongProcessForm)]);
end;//TkwLongProcessFormClientPanel.ParamsTypes

function TkwLongProcessFormMessageLabel.MessageLabel(const aCtx: TtfwContext;
 aLongProcessForm: TLongProcessForm): TvtLabel;
 {* ���������� ����� ������� .TLongProcessForm.MessageLabel }
begin
 Result := aLongProcessForm.MessageLabel;
end;//TkwLongProcessFormMessageLabel.MessageLabel

procedure TkwLongProcessFormMessageLabel.DoDoIt(const aCtx: TtfwContext);
var l_aLongProcessForm: TLongProcessForm;
begin
 try
  l_aLongProcessForm := TLongProcessForm(aCtx.rEngine.PopObjAs(TLongProcessForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLongProcessForm: TLongProcessForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(MessageLabel(aCtx, l_aLongProcessForm));
end;//TkwLongProcessFormMessageLabel.DoDoIt

class function TkwLongProcessFormMessageLabel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLongProcessForm.MessageLabel';
end;//TkwLongProcessFormMessageLabel.GetWordNameForRegister

procedure TkwLongProcessFormMessageLabel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� MessageLabel', aCtx);
end;//TkwLongProcessFormMessageLabel.SetValuePrim

function TkwLongProcessFormMessageLabel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtLabel);
end;//TkwLongProcessFormMessageLabel.GetResultTypeInfo

function TkwLongProcessFormMessageLabel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLongProcessFormMessageLabel.GetAllParamsCount

function TkwLongProcessFormMessageLabel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLongProcessForm)]);
end;//TkwLongProcessFormMessageLabel.ParamsTypes

function TkwLongProcessFormBottomPanel.BottomPanel(const aCtx: TtfwContext;
 aLongProcessForm: TLongProcessForm): TvtPanel;
 {* ���������� ����� ������� .TLongProcessForm.BottomPanel }
begin
 Result := aLongProcessForm.BottomPanel;
end;//TkwLongProcessFormBottomPanel.BottomPanel

procedure TkwLongProcessFormBottomPanel.DoDoIt(const aCtx: TtfwContext);
var l_aLongProcessForm: TLongProcessForm;
begin
 try
  l_aLongProcessForm := TLongProcessForm(aCtx.rEngine.PopObjAs(TLongProcessForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLongProcessForm: TLongProcessForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(BottomPanel(aCtx, l_aLongProcessForm));
end;//TkwLongProcessFormBottomPanel.DoDoIt

class function TkwLongProcessFormBottomPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLongProcessForm.BottomPanel';
end;//TkwLongProcessFormBottomPanel.GetWordNameForRegister

procedure TkwLongProcessFormBottomPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� BottomPanel', aCtx);
end;//TkwLongProcessFormBottomPanel.SetValuePrim

function TkwLongProcessFormBottomPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwLongProcessFormBottomPanel.GetResultTypeInfo

function TkwLongProcessFormBottomPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLongProcessFormBottomPanel.GetAllParamsCount

function TkwLongProcessFormBottomPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLongProcessForm)]);
end;//TkwLongProcessFormBottomPanel.ParamsTypes

function TkwLongProcessFormProgressBar.ProgressBar(const aCtx: TtfwContext;
 aLongProcessForm: TLongProcessForm): TvtGradientWaitbar;
 {* ���������� ����� ������� .TLongProcessForm.ProgressBar }
begin
 Result := aLongProcessForm.ProgressBar;
end;//TkwLongProcessFormProgressBar.ProgressBar

procedure TkwLongProcessFormProgressBar.DoDoIt(const aCtx: TtfwContext);
var l_aLongProcessForm: TLongProcessForm;
begin
 try
  l_aLongProcessForm := TLongProcessForm(aCtx.rEngine.PopObjAs(TLongProcessForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLongProcessForm: TLongProcessForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ProgressBar(aCtx, l_aLongProcessForm));
end;//TkwLongProcessFormProgressBar.DoDoIt

class function TkwLongProcessFormProgressBar.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLongProcessForm.ProgressBar';
end;//TkwLongProcessFormProgressBar.GetWordNameForRegister

procedure TkwLongProcessFormProgressBar.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ProgressBar', aCtx);
end;//TkwLongProcessFormProgressBar.SetValuePrim

function TkwLongProcessFormProgressBar.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtGradientWaitbar);
end;//TkwLongProcessFormProgressBar.GetResultTypeInfo

function TkwLongProcessFormProgressBar.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLongProcessFormProgressBar.GetAllParamsCount

function TkwLongProcessFormProgressBar.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLongProcessForm)]);
end;//TkwLongProcessFormProgressBar.ParamsTypes

function TkwLongProcessFormLeftPanel.LeftPanel(const aCtx: TtfwContext;
 aLongProcessForm: TLongProcessForm): TvtPanel;
 {* ���������� ����� ������� .TLongProcessForm.LeftPanel }
begin
 Result := aLongProcessForm.LeftPanel;
end;//TkwLongProcessFormLeftPanel.LeftPanel

procedure TkwLongProcessFormLeftPanel.DoDoIt(const aCtx: TtfwContext);
var l_aLongProcessForm: TLongProcessForm;
begin
 try
  l_aLongProcessForm := TLongProcessForm(aCtx.rEngine.PopObjAs(TLongProcessForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLongProcessForm: TLongProcessForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(LeftPanel(aCtx, l_aLongProcessForm));
end;//TkwLongProcessFormLeftPanel.DoDoIt

class function TkwLongProcessFormLeftPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLongProcessForm.LeftPanel';
end;//TkwLongProcessFormLeftPanel.GetWordNameForRegister

procedure TkwLongProcessFormLeftPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� LeftPanel', aCtx);
end;//TkwLongProcessFormLeftPanel.SetValuePrim

function TkwLongProcessFormLeftPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwLongProcessFormLeftPanel.GetResultTypeInfo

function TkwLongProcessFormLeftPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLongProcessFormLeftPanel.GetAllParamsCount

function TkwLongProcessFormLeftPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLongProcessForm)]);
end;//TkwLongProcessFormLeftPanel.ParamsTypes

function TkwLongProcessFormImage.Image(const aCtx: TtfwContext;
 aLongProcessForm: TLongProcessForm): TImage;
 {* ���������� ����� ������� .TLongProcessForm.Image }
begin
 Result := aLongProcessForm.Image;
end;//TkwLongProcessFormImage.Image

procedure TkwLongProcessFormImage.DoDoIt(const aCtx: TtfwContext);
var l_aLongProcessForm: TLongProcessForm;
begin
 try
  l_aLongProcessForm := TLongProcessForm(aCtx.rEngine.PopObjAs(TLongProcessForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLongProcessForm: TLongProcessForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(Image(aCtx, l_aLongProcessForm));
end;//TkwLongProcessFormImage.DoDoIt

class function TkwLongProcessFormImage.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLongProcessForm.Image';
end;//TkwLongProcessFormImage.GetWordNameForRegister

procedure TkwLongProcessFormImage.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� Image', aCtx);
end;//TkwLongProcessFormImage.SetValuePrim

function TkwLongProcessFormImage.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TImage);
end;//TkwLongProcessFormImage.GetResultTypeInfo

function TkwLongProcessFormImage.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLongProcessFormImage.GetAllParamsCount

function TkwLongProcessFormImage.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLongProcessForm)]);
end;//TkwLongProcessFormImage.ParamsTypes

function TkwLongProcessFormButtonPanel.ButtonPanel(const aCtx: TtfwContext;
 aLongProcessForm: TLongProcessForm): TvtPanel;
 {* ���������� ����� ������� .TLongProcessForm.ButtonPanel }
begin
 Result := aLongProcessForm.ButtonPanel;
end;//TkwLongProcessFormButtonPanel.ButtonPanel

procedure TkwLongProcessFormButtonPanel.DoDoIt(const aCtx: TtfwContext);
var l_aLongProcessForm: TLongProcessForm;
begin
 try
  l_aLongProcessForm := TLongProcessForm(aCtx.rEngine.PopObjAs(TLongProcessForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLongProcessForm: TLongProcessForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(ButtonPanel(aCtx, l_aLongProcessForm));
end;//TkwLongProcessFormButtonPanel.DoDoIt

class function TkwLongProcessFormButtonPanel.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLongProcessForm.ButtonPanel';
end;//TkwLongProcessFormButtonPanel.GetWordNameForRegister

procedure TkwLongProcessFormButtonPanel.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� ButtonPanel', aCtx);
end;//TkwLongProcessFormButtonPanel.SetValuePrim

function TkwLongProcessFormButtonPanel.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtPanel);
end;//TkwLongProcessFormButtonPanel.GetResultTypeInfo

function TkwLongProcessFormButtonPanel.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLongProcessFormButtonPanel.GetAllParamsCount

function TkwLongProcessFormButtonPanel.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLongProcessForm)]);
end;//TkwLongProcessFormButtonPanel.ParamsTypes

function TkwLongProcessFormBtnExit.btnExit(const aCtx: TtfwContext;
 aLongProcessForm: TLongProcessForm): TvtButton;
 {* ���������� ����� ������� .TLongProcessForm.btnExit }
begin
 Result := aLongProcessForm.btnExit;
end;//TkwLongProcessFormBtnExit.btnExit

procedure TkwLongProcessFormBtnExit.DoDoIt(const aCtx: TtfwContext);
var l_aLongProcessForm: TLongProcessForm;
begin
 try
  l_aLongProcessForm := TLongProcessForm(aCtx.rEngine.PopObjAs(TLongProcessForm));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aLongProcessForm: TLongProcessForm : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushObj(btnExit(aCtx, l_aLongProcessForm));
end;//TkwLongProcessFormBtnExit.DoDoIt

class function TkwLongProcessFormBtnExit.GetWordNameForRegister: AnsiString;
begin
 Result := '.TLongProcessForm.btnExit';
end;//TkwLongProcessFormBtnExit.GetWordNameForRegister

procedure TkwLongProcessFormBtnExit.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
begin
 RunnerError('������ ����������� �������� readonly �������� btnExit', aCtx);
end;//TkwLongProcessFormBtnExit.SetValuePrim

function TkwLongProcessFormBtnExit.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(TvtButton);
end;//TkwLongProcessFormBtnExit.GetResultTypeInfo

function TkwLongProcessFormBtnExit.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwLongProcessFormBtnExit.GetAllParamsCount

function TkwLongProcessFormBtnExit.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TLongProcessForm)]);
end;//TkwLongProcessFormBtnExit.ParamsTypes

initialization
 Tkw_Form_LongProcess.RegisterInEngine;
 {* ����������� Tkw_Form_LongProcess }
 Tkw_LongProcess_Control_ClientPanel.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_ClientPanel }
 Tkw_LongProcess_Control_ClientPanel_Push.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_ClientPanel_Push }
 Tkw_LongProcess_Control_MessageLabel.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_MessageLabel }
 Tkw_LongProcess_Control_MessageLabel_Push.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_MessageLabel_Push }
 Tkw_LongProcess_Control_BottomPanel.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_BottomPanel }
 Tkw_LongProcess_Control_BottomPanel_Push.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_BottomPanel_Push }
 Tkw_LongProcess_Control_ProgressBar.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_ProgressBar }
 Tkw_LongProcess_Control_ProgressBar_Push.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_ProgressBar_Push }
 Tkw_LongProcess_Control_LeftPanel.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_LeftPanel }
 Tkw_LongProcess_Control_LeftPanel_Push.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_LeftPanel_Push }
 Tkw_LongProcess_Control_Image.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_Image }
 Tkw_LongProcess_Control_Image_Push.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_Image_Push }
 Tkw_LongProcess_Control_ButtonPanel.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_ButtonPanel }
 Tkw_LongProcess_Control_ButtonPanel_Push.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_ButtonPanel_Push }
 Tkw_LongProcess_Control_btnExit.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_btnExit }
 Tkw_LongProcess_Control_btnExit_Push.RegisterInEngine;
 {* ����������� Tkw_LongProcess_Control_btnExit_Push }
 TkwLongProcessFormClientPanel.RegisterInEngine;
 {* ����������� LongProcessForm_ClientPanel }
 TkwLongProcessFormMessageLabel.RegisterInEngine;
 {* ����������� LongProcessForm_MessageLabel }
 TkwLongProcessFormBottomPanel.RegisterInEngine;
 {* ����������� LongProcessForm_BottomPanel }
 TkwLongProcessFormProgressBar.RegisterInEngine;
 {* ����������� LongProcessForm_ProgressBar }
 TkwLongProcessFormLeftPanel.RegisterInEngine;
 {* ����������� LongProcessForm_LeftPanel }
 TkwLongProcessFormImage.RegisterInEngine;
 {* ����������� LongProcessForm_Image }
 TkwLongProcessFormButtonPanel.RegisterInEngine;
 {* ����������� LongProcessForm_ButtonPanel }
 TkwLongProcessFormBtnExit.RegisterInEngine;
 {* ����������� LongProcessForm_btnExit }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TLongProcessForm));
 {* ����������� ���� LongProcess }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtPanel));
 {* ����������� ���� TvtPanel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtLabel));
 {* ����������� ���� TvtLabel }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtGradientWaitbar));
 {* ����������� ���� TvtGradientWaitbar }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TImage));
 {* ����������� ���� TImage }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TvtButton));
 {* ����������� ���� TvtButton }
{$IfEnd} // NOT Defined(NoScripts)

end.
