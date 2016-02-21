unit RadioButtonWordsPack;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\RadioButtonWordsPack.pas"
// ���������: "ScriptKeywordsPack"

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 {$If NOT Defined(NoVCL)}
 , StdCtrls
 {$IfEnd} // NOT Defined(NoVCL)
;
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , tfwPropertyLike
 , tfwScriptingInterfaces
 , tfwTypeInfo
 , TypInfo
 , tfwScriptingTypes
 , tfwTypeRegistrator
 , SysUtils
;

type
 TkwPopRadioButtonChecked = {final} class(TtfwPropertyLike)
  {* ����� ������� pop:RadioButton:Checked
*��� ����������:* Boolean
*������:*
[code]
BOOLEAN VAR l_Boolean
 aRadioButton pop:RadioButton:Checked >>> l_Boolean
[code]  }
  private
   function Checked(const aCtx: TtfwContext;
    aRadioButton: TRadioButton): Boolean;
    {* ���������� ����� ������� pop:RadioButton:Checked }
  protected
   procedure DoDoIt(const aCtx: TtfwContext); override;
   class function GetWordNameForRegister: AnsiString; override;
  public
   procedure SetValuePrim(const aValue: TtfwStackValue;
    const aCtx: TtfwContext); override;
   function GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo; override;
   function GetAllParamsCount(const aCtx: TtfwContext): Integer; override;
   function ParamsTypes: PTypeInfoArray; override;
 end;//TkwPopRadioButtonChecked

function TkwPopRadioButtonChecked.Checked(const aCtx: TtfwContext;
 aRadioButton: TRadioButton): Boolean;
 {* ���������� ����� ������� pop:RadioButton:Checked }
begin
 Result := aRadioButton.Checked;
end;//TkwPopRadioButtonChecked.Checked

procedure TkwPopRadioButtonChecked.DoDoIt(const aCtx: TtfwContext);
var l_aRadioButton: TRadioButton;
begin
 try
  l_aRadioButton := TRadioButton(aCtx.rEngine.PopObjAs(TRadioButton));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� aRadioButton: TRadioButton : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 aCtx.rEngine.PushBool(Checked(aCtx, l_aRadioButton));
end;//TkwPopRadioButtonChecked.DoDoIt

class function TkwPopRadioButtonChecked.GetWordNameForRegister: AnsiString;
begin
 Result := 'pop:RadioButton:Checked';
end;//TkwPopRadioButtonChecked.GetWordNameForRegister

procedure TkwPopRadioButtonChecked.SetValuePrim(const aValue: TtfwStackValue;
 const aCtx: TtfwContext);
var l_RadioButton: TRadioButton;
begin
 try
  l_RadioButton := TRadioButton(aCtx.rEngine.PopObjAs(TRadioButton));
 except
  on E: Exception do
  begin
   RunnerError('������ ��� ��������� ��������� RadioButton: TRadioButton : ' + E.Message, aCtx);
   Exit;
  end;//on E: Exception
 end;//try..except
 l_RadioButton.Checked := aValue.AsBoolean;
end;//TkwPopRadioButtonChecked.SetValuePrim

function TkwPopRadioButtonChecked.GetResultTypeInfo(const aCtx: TtfwContext): PTypeInfo;
begin
 Result := TypeInfo(Boolean);
end;//TkwPopRadioButtonChecked.GetResultTypeInfo

function TkwPopRadioButtonChecked.GetAllParamsCount(const aCtx: TtfwContext): Integer;
begin
 Result := 1;
end;//TkwPopRadioButtonChecked.GetAllParamsCount

function TkwPopRadioButtonChecked.ParamsTypes: PTypeInfoArray;
begin
 Result := OpenTypesToTypes([TypeInfo(TRadioButton)]);
end;//TkwPopRadioButtonChecked.ParamsTypes

initialization
 TkwPopRadioButtonChecked.RegisterInEngine;
 {* ����������� pop_RadioButton_Checked }
 TtfwTypeRegistrator.RegisterType(@tfw_tiStruct);
 {* ����������� ���� TtfwContext }
 TtfwTypeRegistrator.RegisterType(TypeInfo(TRadioButton));
 {* ����������� ���� TRadioButton }
 TtfwTypeRegistrator.RegisterType(TypeInfo(Boolean));
 {* ����������� ���� Boolean }
{$IfEnd} // NOT Defined(NoScripts)

end.
