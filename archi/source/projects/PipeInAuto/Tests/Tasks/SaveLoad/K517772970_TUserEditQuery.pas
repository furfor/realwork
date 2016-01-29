unit K517772970_TUserEditQuery;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "Low Level Tests"
// ������: "w:/archi/source/projects/PipeInAuto/Tests/Tasks/SaveLoad/K517772970_TUserEditQuery.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<TestCase::Class>> archi$AutoPipeServer$Garant::Low Level Tests::TaskSaveLoad::K517772970_TUserEditQuery
//
// {RequestLink:517772970}
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\archi\source\projects\PipeInAuto\alcuDefine.inc}

interface

{$If defined(AppServerSide) AND defined(InsiderTest)}
uses
  K517772970_TddProcessTask
  {$If not defined(Nemesis)}
  ,
  ddServerTask
  {$IfEnd} //not Nemesis
  
  ;
{$IfEnd} //AppServerSide AND InsiderTest

{$If defined(AppServerSide) AND defined(InsiderTest)}
type
 TK517772970_TUserEditQuery = class(TK517772970_TddProcessTask)
  {* [RequestLink:517772970] }
 protected
 // overridden protected methods
   {$If defined(nsTest)}
   function GetFolder: AnsiString; override;
     {* ����� � ������� ������ ���� }
   {$IfEnd} //nsTest
   {$If defined(nsTest)}
   function GetModelElementGUID: AnsiString; override;
     {* ������������� �������� ������, ������� ��������� ���� }
   {$IfEnd} //nsTest
   function TaskClass: TddTaskClass; override;
   procedure InitTask(Task: TddTaskItem); override;
 end;//TK517772970_TUserEditQuery
{$IfEnd} //AppServerSide AND InsiderTest

implementation

{$If defined(AppServerSide) AND defined(InsiderTest)}
uses
  Classes
  {$If not defined(Nemesis)}
  ,
  csServerTaskTypes
  {$IfEnd} //not Nemesis
  
  {$If defined(nsTest)}
  ,
  TestFrameWork
  {$IfEnd} //nsTest
  
  ;
{$IfEnd} //AppServerSide AND InsiderTest

{$If defined(AppServerSide) AND defined(InsiderTest)}

// start class TK517772970_TUserEditQuery

{$If defined(nsTest)}
function TK517772970_TUserEditQuery.GetFolder: AnsiString;
 {-}
begin
 Result := 'TaskSaveLoad';
end;//TK517772970_TUserEditQuery.GetFolder
{$IfEnd} //nsTest

{$If defined(nsTest)}
function TK517772970_TUserEditQuery.GetModelElementGUID: AnsiString;
 {-}
begin
 Result := '53214EEB036D';
end;//TK517772970_TUserEditQuery.GetModelElementGUID
{$IfEnd} //nsTest

function TK517772970_TUserEditQuery.TaskClass: TddTaskClass;
//#UC START# *5320088202FB_53214EEB036D_var*
//#UC END# *5320088202FB_53214EEB036D_var*
begin
//#UC START# *5320088202FB_53214EEB036D_impl*
 result := TUserEditQuery;
//#UC END# *5320088202FB_53214EEB036D_impl*
end;//TK517772970_TUserEditQuery.TaskClass

procedure TK517772970_TUserEditQuery.InitTask(Task: TddTaskItem);
//#UC START# *532008D203BA_53214EEB036D_var*
const
 IntConst = 123;
//#UC END# *532008D203BA_53214EEB036D_var*
begin
//#UC START# *532008D203BA_53214EEB036D_impl*
 inherited InitTask(Task);
 with (Task as TUserEditQuery) do begin
  IsGroup := true;
  ID := IntConst;
 end;
//#UC END# *532008D203BA_53214EEB036D_impl*
end;//TK517772970_TUserEditQuery.InitTask

{$IfEnd} //AppServerSide AND InsiderTest

initialization
 TestFramework.RegisterTest(TK517772970_TUserEditQuery.Suite);

end.