unit NOT_COMPLETED_alcuHavanskyExportTask;

// ������: "w:\archi\source\projects\PipeInAuto\Tasks\NOT_COMPLETED_alcuHavanskyExportTask.pas"
// ���������: "SimpleClass"
// ������� ������: "TalcuHavanskyExportTask" MUID: (530355CF0057)

{$Include w:\archi\source\projects\PipeInAuto\alcuDefine.inc}

interface

{$If Defined(ServerTasks)}
uses
 l3IntfUses
 {$If Defined(HavanskyExport)}
 , alcuHavanskyExportTaskPrim
 {$IfEnd} // Defined(HavanskyExport)
;

type
 TalcuHavanskyExportTask = class(TalcuHavanskyExportTaskPrim)
 end;//TalcuHavanskyExportTask
{$IfEnd} // Defined(ServerTasks)

implementation

{$If Defined(ServerTasks)}
uses
 l3ImplUses
;

{$If Defined(HavanskyExport)}
{$IfEnd} // Defined(HavanskyExport)
{$IfEnd} // Defined(ServerTasks)
end.
