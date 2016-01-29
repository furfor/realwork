unit atCompareSavedListOperation;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "AdapterTest"
// ������: "w:/quality/test/garant6x/AdapterTest/Operations/atCompareSavedListOperation.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> garant6x_test::AdapterTest::Operations::TatCompareSavedListOperation
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

interface

uses
  atOperationBase
  ;

type
 TatCompareSavedListOperation = class(TatOperationBase)
 protected
 // realized methods
   procedure ExecuteSelf; override;
 protected
 // overridden protected methods
   procedure InitParamList; override;
 end;//TatCompareSavedListOperation

implementation

uses
  atComparableList,
  SysUtils,
  atLogger,
  atLockFile
  ;

// start class TatCompareSavedListOperation

procedure TatCompareSavedListOperation.ExecuteSelf;
//#UC START# *48089F460352_5397319401E6_var*
  var
    l_EtalonListFileName, l_UnequalListFileName, l_ReportFileName : String;
    l_ReportFile : Text;
    l_CurrCList, l_EtalonCList : TatComparableList;
    l_IsReportUnequalitiesOnly, l_IsEqual : Boolean;
    f_LockFile : TatLockFile;
//#UC END# *48089F460352_5397319401E6_var*
begin
//#UC START# *48089F460352_5397319401E6_impl*
  l_EtalonListFileName := ExpandFileName(Parameters['etalon_list_file_name'].AsStr);
  l_UnequalListFileName := ExpandFileName(Parameters['unequal_list_file_name'].AsStr);
  l_ReportFileName := ExpandFileName(Parameters['report_file_name'].AsStr);
  l_IsReportUnequalitiesOnly := Parameters['is_report_unequalities_only'].AsBool;
  //
  l_CurrCList := TatComparableList.Create(ExecutionContext.UserWorkContext.CurrList);
  try
    l_EtalonCList := TatComparableList.Create(l_EtalonListFileName);
    try
      l_IsEqual := l_CurrCList.IsEqual(l_EtalonCList);

      f_LockFile := TatLockFile.Create(l_ReportFileName + '.lock');
      if f_LockFile.Acquire then
      try
        AssignFile(l_ReportFile, l_ReportFileName);
        try
          if FileExists(l_ReportFileName) then
            Append(l_ReportFile)
          else
            Rewrite(l_ReportFile);

          if l_IsEqual then
          begin
            Logger.Info('������� ������ ��������� �� ������� � ����� %s', [l_EtalonListFileName]);
            if NOT l_IsReportUnequalitiesOnly then
              WriteLn(l_ReportFile, Format('��: ������ � ����� %s ��������� � �������', [l_EtalonListFileName]));
          end
          else
          begin
            Logger.Info('������� ������ �� ��������� �� ������� � ����� %s', [l_EtalonListFileName]);
            Write(l_ReportFile, Format('ERROR: ������ � ����� %s �� ��������� � �������', [l_EtalonListFileName]));
            if l_UnequalListFileName <> '' then
            begin
              l_CurrCList.SaveToFile(l_UnequalListFileName);
              Write(l_ReportFile, Format('. ������� ������ �������� � ���� %s', [l_UnequalListFileName]));
            end;
            WriteLn(l_ReportFile);
          end;
        finally
          CloseFile(l_ReportFile);
        end;
      finally
        f_LockFile.Release;
      end;
    finally
      FreeAndNil(l_EtalonCList);
    end;
  finally
    FreeAndNil(l_CurrCList);
  end;


//#UC END# *48089F460352_5397319401E6_impl*
end;//TatCompareSavedListOperation.ExecuteSelf

procedure TatCompareSavedListOperation.InitParamList;
//#UC START# *48089F3701B4_5397319401E6_var*
//#UC END# *48089F3701B4_5397319401E6_var*
begin
//#UC START# *48089F3701B4_5397319401E6_impl*
  inherited;
  with f_ParamList do
  begin
    Add( ParamType.Create('etalon_list_file_name', '���� � ����������� ������� � ������� ������������ ���������') );
    Add( ParamType.Create('unequal_list_file_name', '���� � ������� ����� ������� ������� ������ ���� �� �� ��������� � ���������') );
    Add( ParamType.Create('report_file_name', '���� � ������� ����� �������� ����� �����') );
    Add( ParamType.Create('is_report_unequalities_only', '�������� � ����� ������ ��������� � �������������', 'true') );    
  end;
//#UC END# *48089F3701B4_5397319401E6_impl*
end;//TatCompareSavedListOperation.InitParamList

end.