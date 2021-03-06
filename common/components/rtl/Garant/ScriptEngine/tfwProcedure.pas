unit tfwProcedure;

// ������: "w:\common\components\rtl\Garant\ScriptEngine\tfwProcedure.pas"
// ���������: "SimpleClass"
// ������� ������: "TtfwProcedure" MUID: (4F37B27502EE)

{$Include w:\common\components\rtl\Garant\ScriptEngine\seDefine.inc}

interface

{$If NOT Defined(NoScripts)}
uses
 l3IntfUses
 , tfwNewWord
 , l3Interfaces
 , tfwScriptingInterfaces
 , kwCompiledWordPrim
;

type
 TtfwProcedure = {abstract} class(TtfwNewWord)
  protected
   function AddedParameters: Tl3CStringArray; virtual;
   function EndBracket(const aContext: TtfwContext;
    aSilent: Boolean): RtfwWord; override;
   function CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim; override;
   procedure FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
    aCompiled: TkwCompiledWordPrim;
    const aContext: TtfwContext); override;
    {* ��������� ����������� ����� ���������� ����� }
   procedure FillCompiledWord(aCompiled: TtfwWord;
    const aCtx: TtfwContext); override;
 end;//TtfwProcedure
{$IfEnd} // NOT Defined(NoScripts)

implementation

{$If NOT Defined(NoScripts)}
uses
 l3ImplUses
 , kwStandardProcedureCloseBracket
 , kwCompiledWordWorkerWord
 , SysUtils
 , kwCompiledProcedure
 , kwCompiledFunction
 , kwCompiledProcedureWithStackChecking
 , kwInlinedWord
 //#UC START# *4F37B27502EEimpl_uses*
 //#UC END# *4F37B27502EEimpl_uses*
;

const
 cCaller = 'Caller';

function TtfwProcedure.AddedParameters: Tl3CStringArray;
//#UC START# *4F3FF55403AB_4F37B27502EE_var*
//#UC END# *4F3FF55403AB_4F37B27502EE_var*
begin
//#UC START# *4F3FF55403AB_4F37B27502EE_impl*
 Result := nil;
//#UC END# *4F3FF55403AB_4F37B27502EE_impl*
end;//TtfwProcedure.AddedParameters

function TtfwProcedure.EndBracket(const aContext: TtfwContext;
 aSilent: Boolean): RtfwWord;
//#UC START# *4DB6C99F026E_4F37B27502EE_var*
//#UC END# *4DB6C99F026E_4F37B27502EE_var*
begin
//#UC START# *4DB6C99F026E_4F37B27502EE_impl*
 Result := TkwStandardProcedureCloseBracket;
//#UC END# *4DB6C99F026E_4F37B27502EE_impl*
end;//TtfwProcedure.EndBracket

function TtfwProcedure.CompiledWordClass(const aCtx: TtfwContext): RkwCompiledWordPrim;
//#UC START# *4DBAEE0D028D_4F37B27502EE_var*
//#UC END# *4DBAEE0D028D_4F37B27502EE_var*
begin
//#UC START# *4DBAEE0D028D_4F37B27502EE_impl*
 if (aCtx.rTypeInfo.EQwm([tfw_wmInline])) then
  Result := TkwInlinedWord
 else
 if not aCtx.rTypeInfo.ValueTypes.Empty{ OR aCtx.rTypeInfo.Has(tfw_wmLeftWordRef)} then
 begin
  if aCtx.rTypeInfo.Has(tfw_vtVoid) then
   Result := TkwCompiledProcedureWithStackChecking
  else
   Result := TkwCompiledFunction;
 end//not aCtx.rTypeInfo.. OR (tfw_wmLeftWordRef in l_M)
 else
  Result := TkwCompiledProcedure;
//#UC END# *4DBAEE0D028D_4F37B27502EE_impl*
end;//TtfwProcedure.CompiledWordClass

procedure TtfwProcedure.FinishDefinitionOfNewWord(aWordToFinish: TtfwKeyWord;
 aCompiled: TkwCompiledWordPrim;
 const aContext: TtfwContext);
 {* ��������� ����������� ����� ���������� ����� }
//#UC START# *4F219629036A_4F37B27502EE_var*
var
 l_Worker : TkwCompiledWordWorkerWord;
 l_S : Tl3CStringArray;
 l_Index : Integer;
 l_NeedCaller : Boolean;
//#UC END# *4F219629036A_4F37B27502EE_var*
begin
//#UC START# *4F219629036A_4F37B27502EE_impl*
 l_NeedCaller := false;
 if aCompiled.ResultTypeInfo[aContext].Has(tfw_wmCaller) then
 begin
  l_NeedCaller := true;
  aCompiled.CompileInParameterPopCodeFromString(aContext, TtfwCStringFactory.C(cCaller));
 end;//aCompiled.ResultTypeInfo[aContext].HasModifier(tfw_wmCaller)

 l_S := AddedParameters;
 for l_Index := Low(l_S) to High(l_S) do
  aCompiled.CompileInParameterPopCodeFromString(aContext, l_S[l_Index]);

 if l_NeedCaller OR
    (aCompiled.LeftWordRefParamsCount(aContext) > 0) OR
    (aCompiled.RightParamsCount(aContext) > 0) {OR
    aCompiled.ResultTypeInfo[aContext].HasModifier(tfw_wmImmediate)}
    then
 begin
  aCompiled.Key := aWordToFinish;
  l_Worker := TkwCompiledWordWorkerWord.Create(aCompiled);
  try
   aWordToFinish.SetWord(aContext, l_Worker);
  finally
   FreeAndNil(l_Worker);
  end;//try..finally
 end//l_NeedCaller..
 else
  aWordToFinish.SetWord(aContext, aCompiled);
  
 //inherited;
 // - �� ���� ��� �����
//#UC END# *4F219629036A_4F37B27502EE_impl*
end;//TtfwProcedure.FinishDefinitionOfNewWord

procedure TtfwProcedure.FillCompiledWord(aCompiled: TtfwWord;
 const aCtx: TtfwContext);
//#UC START# *4F21A4F60049_4F37B27502EE_var*
var
 l_S : Tl3CStringArray;
 l_Index : Integer;
//#UC END# *4F21A4F60049_4F37B27502EE_var*
begin
//#UC START# *4F21A4F60049_4F37B27502EE_impl*
 inherited;
 l_S := AddedParameters;
 for l_Index := Low(l_S) to High(l_S) do
  aCompiled.DefineInParameter(aCtx, l_S[l_Index], nil, TtfwWordInfo.Make(nil, [tfw_wmRightWordRef], tfw_atNone, tfw_ltNone));

 if aCompiled.ResultTypeInfo[aCtx].Has(tfw_wmCaller) then
  aCompiled.DefineInParameter(aCtx, TtfwCStringFactory.C(cCaller), nil, TtfwWordInfo.Make(TypeInfo(TtfwWord)));

//#UC END# *4F21A4F60049_4F37B27502EE_impl*
end;//TtfwProcedure.FillCompiledWord

initialization
 TtfwProcedure.RegisterClass;
 {* ����������� TtfwProcedure }
{$IfEnd} // NOT Defined(NoScripts)

end.
