unit atNonATQueryLogicOperationConverter;

// ������: "w:\quality\test\garant6x\AdapterTest\AdapterHelpers\atNonATQueryLogicOperationConverter.pas"
// ���������: "SimpleClass"
// ������� ������: "TatNonATQueryLogicOperationConverter" MUID: (503E51C002D7)

interface

uses
 l3IntfUses
 , SearchUnit
 , SysUtils
;

type
 _SecondType_ = TQueryLogicOperation;
 {$Include w:\quality\test\garant6x\AdapterTest\CoreObjects\atStringConverter.imp.pas}
 TatNonATQueryLogicOperationConverter = class(_atStringConverter_)
  protected
   procedure InitConvertMap; override;
  public
   class function Instance: TatNonATQueryLogicOperationConverter;
    {* ����� ��������� ���������� ���������� TatNonATQueryLogicOperationConverter }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TatNonATQueryLogicOperationConverter

implementation

uses
 l3ImplUses
 , TypInfo
 , l3Base
;

var g_TatNonATQueryLogicOperationConverter: TatNonATQueryLogicOperationConverter = nil;
 {* ��������� ���������� TatNonATQueryLogicOperationConverter }

procedure TatNonATQueryLogicOperationConverterFree;
 {* ����� ������������ ���������� ���������� TatNonATQueryLogicOperationConverter }
begin
 l3Free(g_TatNonATQueryLogicOperationConverter);
end;//TatNonATQueryLogicOperationConverterFree

{$Include w:\quality\test\garant6x\AdapterTest\CoreObjects\atStringConverter.imp.pas}

procedure TatNonATQueryLogicOperationConverter.InitConvertMap;
//#UC START# *503E3A040395_503E51C002D7_var*
  const
    CONVERT_MAP : array [_SecondType_] of Synonyms = (
      (First : 'LO_OR'; Second : QLO_OR),
      (First : 'LO_AND'; Second : QLO_AND),
      (First : 'LO_NOT'; Second : QLO_AND_NOT)
    );
//#UC END# *503E3A040395_503E51C002D7_var*
begin
//#UC START# *503E3A040395_503E51C002D7_impl*
  InitConvertMap(CONVERT_MAP);
//#UC END# *503E3A040395_503E51C002D7_impl*
end;//TatNonATQueryLogicOperationConverter.InitConvertMap

class function TatNonATQueryLogicOperationConverter.Instance: TatNonATQueryLogicOperationConverter;
 {* ����� ��������� ���������� ���������� TatNonATQueryLogicOperationConverter }
begin
 if (g_TatNonATQueryLogicOperationConverter = nil) then
 begin
  l3System.AddExitProc(TatNonATQueryLogicOperationConverterFree);
  g_TatNonATQueryLogicOperationConverter := Create;
 end;
 Result := g_TatNonATQueryLogicOperationConverter;
end;//TatNonATQueryLogicOperationConverter.Instance

class function TatNonATQueryLogicOperationConverter.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TatNonATQueryLogicOperationConverter <> nil;
end;//TatNonATQueryLogicOperationConverter.Exists

initialization
{$Include w:\quality\test\garant6x\AdapterTest\CoreObjects\atStringConverter.imp.pas}


end.
