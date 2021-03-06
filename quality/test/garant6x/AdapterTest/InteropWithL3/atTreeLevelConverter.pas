unit atTreeLevelConverter;

// ������: "w:\quality\test\garant6x\AdapterTest\InteropWithL3\atTreeLevelConverter.pas"
// ���������: "SimpleClass"
// ������� ������: "TatTreeLevelConverter" MUID: (503E65E30321)

interface

uses
 l3IntfUses
 , l3Interfaces
 , DynamicTreeUnit
 , SysUtils
;

type
 _FirstType_ = Tl3TreeLevelDist;
 _SecondType_ = TSearchArea;
 {$Include w:\quality\test\garant6x\AdapterTest\CoreObjects\atEnumToEnumConverter.imp.pas}
 TatTreeLevelConverter = class(_atEnumToEnumConverter_)
  protected
   procedure InitConvertMap; override;
  public
   class function Instance: TatTreeLevelConverter;
    {* ����� ��������� ���������� ���������� TatTreeLevelConverter }
   class function Exists: Boolean;
    {* ��������� ������ ��������� ���������� ��� ��� }
 end;//TatTreeLevelConverter

implementation

uses
 l3ImplUses
 , TypInfo
 , l3Base
 //#UC START# *503E65E30321impl_uses*
 //#UC END# *503E65E30321impl_uses*
;

var g_TatTreeLevelConverter: TatTreeLevelConverter = nil;
 {* ��������� ���������� TatTreeLevelConverter }

procedure TatTreeLevelConverterFree;
 {* ����� ������������ ���������� ���������� TatTreeLevelConverter }
begin
 l3Free(g_TatTreeLevelConverter);
end;//TatTreeLevelConverterFree

{$Include w:\quality\test\garant6x\AdapterTest\CoreObjects\atEnumToEnumConverter.imp.pas}

procedure TatTreeLevelConverter.InitConvertMap;
//#UC START# *503E3A040395_503E65E30321_var*
  const
    CONVERT_MAP : array [Tl3TreeLevelDist] of Synonyms = (
      (First: tldAllLevels; Second: SA_ALL_LEVEL),
      (First: tldOneLevel; Second: SA_ONE_LEVEL)
    );
//#UC END# *503E3A040395_503E65E30321_var*
begin
//#UC START# *503E3A040395_503E65E30321_impl*
  InitConvertMap(CONVERT_MAP);
//#UC END# *503E3A040395_503E65E30321_impl*
end;//TatTreeLevelConverter.InitConvertMap

class function TatTreeLevelConverter.Instance: TatTreeLevelConverter;
 {* ����� ��������� ���������� ���������� TatTreeLevelConverter }
begin
 if (g_TatTreeLevelConverter = nil) then
 begin
  l3System.AddExitProc(TatTreeLevelConverterFree);
  g_TatTreeLevelConverter := Create;
 end;
 Result := g_TatTreeLevelConverter;
end;//TatTreeLevelConverter.Instance

class function TatTreeLevelConverter.Exists: Boolean;
 {* ��������� ������ ��������� ���������� ��� ��� }
begin
 Result := g_TatTreeLevelConverter <> nil;
end;//TatTreeLevelConverter.Exists

initialization
{$Include w:\quality\test\garant6x\AdapterTest\CoreObjects\atEnumToEnumConverter.imp.pas}


end.
