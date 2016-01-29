{$IfNDef atProcessNamedFoldersObjectOperation_imp}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "AdapterTest"
// ������: "w:/quality/test/garant6x/AdapterTest/Operations/atProcessNamedFoldersObjectOperation.imp.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Impurity::Class>> garant6x_test::AdapterTest::Operations::atProcessNamedFoldersObjectOperation
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

{$Define atProcessNamedFoldersObjectOperation_imp}
 {$Include ..\Operations\atProcessFoldersObjectOperation.imp.pas}
 _atProcessNamedFoldersObjectOperation_ = {abstract mixin} class(_atProcessFoldersObjectOperation_)
 protected
 // overridden protected methods
   procedure InitParamList; override;
   procedure InitMatcher; override;
 end;//_atProcessNamedFoldersObjectOperation_

{$Else atProcessNamedFoldersObjectOperation_imp}

{$Include ..\Operations\atProcessFoldersObjectOperation.imp.pas}

// start class _atProcessNamedFoldersObjectOperation_

procedure _atProcessNamedFoldersObjectOperation_.InitParamList;
//#UC START# *48089F3701B4_484FA0FD0223_var*
//#UC END# *48089F3701B4_484FA0FD0223_var*
begin
//#UC START# *48089F3701B4_484FA0FD0223_impl*
  inherited;
  with f_ParamList do
  begin
    Add( ParamType.Create('object_name', '��� ���������� �������', '') );
    Add( ParamType.Create('is_regexp', '������ �� ���������� ����� � ���� ����������� ���������', 'false') );
  end;
//#UC END# *48089F3701B4_484FA0FD0223_impl*
end;//_atProcessNamedFoldersObjectOperation_.InitParamList

procedure _atProcessNamedFoldersObjectOperation_.InitMatcher;
//#UC START# *484FDD22003E_484FA0FD0223_var*
  var
    l_Name : String;
    l_IsRegExp : Boolean;
//#UC END# *484FDD22003E_484FA0FD0223_var*
begin
//#UC START# *484FDD22003E_484FA0FD0223_impl*
  inherited;
  // � ����� ������������� ��� � �.�.
  l_Name := Parameters['object_name'].AsStr;
  l_IsRegExp := Parameters['is_regexp'].AsBool;
  //
  with (f_Matcher as IatNameMatcher) do
  begin
    // ����������, �� ����� ��������, ����� �� ������� �������������� ����
    if l_Name = '' then
      MatchMethod := MM_ALL
    else if l_IsRegExp then
      MatchMethod := MM_REGEXP
    else
      MatchMethod := MM_COMPARE;
    // ������ ���
    Name := l_Name;
  end;
//#UC END# *484FDD22003E_484FA0FD0223_impl*
end;//_atProcessNamedFoldersObjectOperation_.InitMatcher

{$EndIf atProcessNamedFoldersObjectOperation_imp}
