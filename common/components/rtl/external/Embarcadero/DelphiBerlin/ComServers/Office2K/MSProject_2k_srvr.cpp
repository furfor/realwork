// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// $Rev: 48729 $
// File generated on 30/04/2012 12:01:56 from Type Library described below.

// ************************************************************************  //
// Type Lib: 2000\MSPRJ9.olb (1)
// LIBID: {A7107640-94DF-1068-855E-00DD01075445}
// LCID: 0
// Helpfile: c:\OLB\2000\VBAPJ9.CHM 
// HelpString: Microsoft Project 9.0 Object Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.1 Office, (c:\tests\tlibimp\mso9.dll)
//   (3) v5.3 VBIDE, (c:\tests\OLB\2000\vbe6ext.olb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'Window' renamed to 'WINDOW'
//   Hint: Symbol 'Project' renamed to 'Project_'
//   Hint: Symbol 'Application' renamed to 'ProjectApplication'
//   Hint: Symbol 'Windows' renamed to 'Windoz'
//   Error creating palette bitmap of (TProject_) : No Server registered for this CoClass
//   Error creating palette bitmap of (TProjectApplication) : No Server registered for this CoClass
// Cmdline:
//   tlibimp  -C+ -Fe_2K -CE_2K_SRVR -Ha- -Hr+ -HpsOffice2K -Yp+ -D.\cpp2k -Cv-    2000\MSPRJ9.olb
// ************************************************************************ //

#include <vcl.h>
#pragma hdrstop

#include <oleserver.hpp>
#if defined(USING_ATL)
#include <atl\atlvcl.h>
#endif

#pragma option -w-8122
#include "MSProject_2K_SRVR.h"

#if !defined(__PRAGMA_PACKAGE_SMART_INIT)
#define      __PRAGMA_PACKAGE_SMART_INIT
#pragma package(smart_init)
#endif

namespace Msproject_2k
{

_IProjectDocPtr& TProject_::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TProject_::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TProject_::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TProject_::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TProject_::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TProject_::ConnectTo(_IProjectDocPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TProject_::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_Project_;
  sd.IntfIID = __uuidof(_IProjectDoc);
  sd.EventIID= __uuidof(_EProjectDoc);
  ServerData = &sd;
}

void __fastcall TProject_::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1: {
      if (OnOpen) {
        (OnOpen)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2: {
      if (OnBeforeClose) {
        (OnBeforeClose)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 3: {
      if (OnBeforeSave) {
        (OnBeforeSave)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 4: {
      if (OnBeforePrint) {
        (OnBeforePrint)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 5: {
      if (OnCalculate) {
        (OnCalculate)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 6: {
      if (OnChange) {
        (OnChange)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 7: {
      if (OnActivate) {
        (OnActivate)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 8: {
      if (OnDeactivate) {
        (OnDeactivate)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TProject_::SaveAs(VARIANT Name/*[opt]*/, 
                                  Msproject_2k::PjFileFormat Format/*[def,opt]*/, 
                                  VARIANT Backup/*[opt]*/, VARIANT ReadOnly/*[opt]*/, 
                                  VARIANT TaskInformation/*[opt]*/, VARIANT Filtered/*[opt]*/, 
                                  VARIANT Table/*[opt]*/, VARIANT UserID/*[opt]*/, 
                                  VARIANT DatabasePassWord/*[opt]*/, VARIANT FormatID/*[opt]*/, 
                                  VARIANT Map/*[opt]*/, VARIANT ClearBaseline/*[opt]*/, 
                                  VARIANT ClearActuals/*[opt]*/, VARIANT ClearResourceRates/*[opt]*/, 
                                  VARIANT ClearFixedCosts/*[opt]*/)
{
  GetDefaultInterface()->SaveAs(Name/*[opt]*/, Format/*[def,opt]*/, Backup/*[opt]*/, 
                                ReadOnly/*[opt]*/, TaskInformation/*[opt]*/, Filtered/*[opt]*/, 
                                Table/*[opt]*/, UserID/*[opt]*/, DatabasePassWord/*[opt]*/, 
                                FormatID/*[opt]*/, Map/*[opt]*/, ClearBaseline/*[opt]*/, 
                                ClearActuals/*[opt]*/, ClearResourceRates/*[opt]*/, 
                                ClearFixedCosts/*[opt]*/);
}

void __fastcall TProject_::Activate(void)
{
  GetDefaultInterface()->Activate();
}

void __fastcall TProject_::LevelClearDates(void)
{
  GetDefaultInterface()->LevelClearDates();
}

void __fastcall TProject_::AppendNotes(BSTR Value)
{
  GetDefaultInterface()->AppendNotes(Value);
}

VARIANT __fastcall TProject_::get_Manager()
{
  return GetDefaultInterface()->get_Manager();
}

void __fastcall TProject_::set_Manager(VARIANT param)
{
  GetDefaultInterface()->set_Manager(param);
}

VARIANT __fastcall TProject_::get_Company()
{
  return GetDefaultInterface()->get_Company();
}

void __fastcall TProject_::set_Company(VARIANT param)
{
  GetDefaultInterface()->set_Company(param);
}

VARIANT __fastcall TProject_::get_Author()
{
  return GetDefaultInterface()->get_Author();
}

void __fastcall TProject_::set_Author(VARIANT param)
{
  GetDefaultInterface()->set_Author(param);
}

VARIANT __fastcall TProject_::get_Keywords()
{
  return GetDefaultInterface()->get_Keywords();
}

void __fastcall TProject_::set_Keywords(VARIANT param)
{
  GetDefaultInterface()->set_Keywords(param);
}

BSTR __fastcall TProject_::get_ProjectNotes()
{
  return GetDefaultInterface()->get_ProjectNotes();
}

void __fastcall TProject_::set_ProjectNotes(BSTR param)
{
  GetDefaultInterface()->set_ProjectNotes(param);
}

VARIANT __fastcall TProject_::get_ProjectStart()
{
  return GetDefaultInterface()->get_ProjectStart();
}

void __fastcall TProject_::set_ProjectStart(VARIANT param)
{
  GetDefaultInterface()->set_ProjectStart(param);
}

VARIANT __fastcall TProject_::get_ProjectFinish()
{
  return GetDefaultInterface()->get_ProjectFinish();
}

void __fastcall TProject_::set_ProjectFinish(VARIANT param)
{
  GetDefaultInterface()->set_ProjectFinish(param);
}

VARIANT __fastcall TProject_::get_CurrentDate()
{
  return GetDefaultInterface()->get_CurrentDate();
}

void __fastcall TProject_::set_CurrentDate(VARIANT param)
{
  GetDefaultInterface()->set_CurrentDate(param);
}

VARIANT __fastcall TProject_::get_StatusDate()
{
  return GetDefaultInterface()->get_StatusDate();
}

void __fastcall TProject_::set_StatusDate(VARIANT param)
{
  GetDefaultInterface()->set_StatusDate(param);
}

VARIANT_BOOL __fastcall TProject_::get_ScheduleFromStart()
{
  return GetDefaultInterface()->get_ScheduleFromStart();
}

void __fastcall TProject_::set_ScheduleFromStart(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ScheduleFromStart(param);
}

VARIANT __fastcall TProject_::get_Comments()
{
  return GetDefaultInterface()->get_Comments();
}

void __fastcall TProject_::set_Comments(VARIANT param)
{
  GetDefaultInterface()->set_Comments(param);
}

VARIANT __fastcall TProject_::get_Title()
{
  return GetDefaultInterface()->get_Title();
}

void __fastcall TProject_::set_Title(VARIANT param)
{
  GetDefaultInterface()->set_Title(param);
}

VARIANT __fastcall TProject_::get_Subject()
{
  return GetDefaultInterface()->get_Subject();
}

void __fastcall TProject_::set_Subject(VARIANT param)
{
  GetDefaultInterface()->set_Subject(param);
}

Msproject_2k::WindowsPtr __fastcall TProject_::get_Windoz()
{
  return GetDefaultInterface()->get_Windoz();
}

void __fastcall TProject_::set_Windoz(Msproject_2k::WindowsPtr param)
{
  GetDefaultInterface()->set_Windoz(param);
}

short __fastcall TProject_::get_MinuteLabelDisplay()
{
  return GetDefaultInterface()->get_MinuteLabelDisplay();
}

void __fastcall TProject_::set_MinuteLabelDisplay(short param)
{
  GetDefaultInterface()->set_MinuteLabelDisplay(param);
}

short __fastcall TProject_::get_HourLabelDisplay()
{
  return GetDefaultInterface()->get_HourLabelDisplay();
}

void __fastcall TProject_::set_HourLabelDisplay(short param)
{
  GetDefaultInterface()->set_HourLabelDisplay(param);
}

short __fastcall TProject_::get_DayLabelDisplay()
{
  return GetDefaultInterface()->get_DayLabelDisplay();
}

void __fastcall TProject_::set_DayLabelDisplay(short param)
{
  GetDefaultInterface()->set_DayLabelDisplay(param);
}

short __fastcall TProject_::get_WeekLabelDisplay()
{
  return GetDefaultInterface()->get_WeekLabelDisplay();
}

void __fastcall TProject_::set_WeekLabelDisplay(short param)
{
  GetDefaultInterface()->set_WeekLabelDisplay(param);
}

short __fastcall TProject_::get_YearLabelDisplay()
{
  return GetDefaultInterface()->get_YearLabelDisplay();
}

void __fastcall TProject_::set_YearLabelDisplay(short param)
{
  GetDefaultInterface()->set_YearLabelDisplay(param);
}

short __fastcall TProject_::get_MonthLabelDisplay()
{
  return GetDefaultInterface()->get_MonthLabelDisplay();
}

void __fastcall TProject_::set_MonthLabelDisplay(short param)
{
  GetDefaultInterface()->set_MonthLabelDisplay(param);
}

VARIANT_BOOL __fastcall TProject_::get_SpaceBeforeTimeLabels()
{
  return GetDefaultInterface()->get_SpaceBeforeTimeLabels();
}

void __fastcall TProject_::set_SpaceBeforeTimeLabels(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_SpaceBeforeTimeLabels(param);
}

Msproject_2k::PjTaskFixedType __fastcall TProject_::get_DefaultTaskType()
{
  return GetDefaultInterface()->get_DefaultTaskType();
}

void __fastcall TProject_::set_DefaultTaskType(Msproject_2k::PjTaskFixedType param)
{
  GetDefaultInterface()->set_DefaultTaskType(param);
}

VARIANT_BOOL __fastcall TProject_::get_DefaultEffortDriven()
{
  return GetDefaultInterface()->get_DefaultEffortDriven();
}

void __fastcall TProject_::set_DefaultEffortDriven(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DefaultEffortDriven(param);
}

VARIANT_BOOL __fastcall TProject_::get_UseFYStartYear()
{
  return GetDefaultInterface()->get_UseFYStartYear();
}

void __fastcall TProject_::set_UseFYStartYear(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_UseFYStartYear(param);
}

VARIANT_BOOL __fastcall TProject_::get_AutoFilter()
{
  return GetDefaultInterface()->get_AutoFilter();
}

void __fastcall TProject_::set_AutoFilter(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AutoFilter(param);
}

VARIANT_BOOL __fastcall TProject_::get_HonorConstraints()
{
  return GetDefaultInterface()->get_HonorConstraints();
}

void __fastcall TProject_::set_HonorConstraints(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_HonorConstraints(param);
}

VARIANT_BOOL __fastcall TProject_::get_MultipleCriticalPaths()
{
  return GetDefaultInterface()->get_MultipleCriticalPaths();
}

void __fastcall TProject_::set_MultipleCriticalPaths(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_MultipleCriticalPaths(param);
}

VARIANT __fastcall TProject_::get_LevelFromDate()
{
  return GetDefaultInterface()->get_LevelFromDate();
}

void __fastcall TProject_::set_LevelFromDate(VARIANT param)
{
  GetDefaultInterface()->set_LevelFromDate(param);
}

VARIANT __fastcall TProject_::get_LevelToDate()
{
  return GetDefaultInterface()->get_LevelToDate();
}

void __fastcall TProject_::set_LevelToDate(VARIANT param)
{
  GetDefaultInterface()->set_LevelToDate(param);
}

VARIANT_BOOL __fastcall TProject_::get_LevelEntireProject()
{
  return GetDefaultInterface()->get_LevelEntireProject();
}

void __fastcall TProject_::set_LevelEntireProject(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_LevelEntireProject(param);
}

Msproject_2k::PjAccrueAt __fastcall TProject_::get_DefaultFixedCostAccrual()
{
  return GetDefaultInterface()->get_DefaultFixedCostAccrual();
}

void __fastcall TProject_::set_DefaultFixedCostAccrual(Msproject_2k::PjAccrueAt param)
{
  GetDefaultInterface()->set_DefaultFixedCostAccrual(param);
}

VARIANT_BOOL __fastcall TProject_::get_SpreadCostsToStatusDate()
{
  return GetDefaultInterface()->get_SpreadCostsToStatusDate();
}

void __fastcall TProject_::set_SpreadCostsToStatusDate(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_SpreadCostsToStatusDate(param);
}

VARIANT_BOOL __fastcall TProject_::get_SpreadPercentCompleteToStatusDate()
{
  return GetDefaultInterface()->get_SpreadPercentCompleteToStatusDate();
}

void __fastcall TProject_::set_SpreadPercentCompleteToStatusDate(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_SpreadPercentCompleteToStatusDate(param);
}

VARIANT_BOOL __fastcall TProject_::get_AutoCalcCosts()
{
  return GetDefaultInterface()->get_AutoCalcCosts();
}

void __fastcall TProject_::set_AutoCalcCosts(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AutoCalcCosts(param);
}

VARIANT_BOOL __fastcall TProject_::get_ShowExternalSuccessors()
{
  return GetDefaultInterface()->get_ShowExternalSuccessors();
}

void __fastcall TProject_::set_ShowExternalSuccessors(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ShowExternalSuccessors(param);
}

VARIANT_BOOL __fastcall TProject_::get_ShowExternalPredecessors()
{
  return GetDefaultInterface()->get_ShowExternalPredecessors();
}

void __fastcall TProject_::set_ShowExternalPredecessors(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ShowExternalPredecessors(param);
}

VARIANT_BOOL __fastcall TProject_::get_ShowCrossProjectLinksInfo()
{
  return GetDefaultInterface()->get_ShowCrossProjectLinksInfo();
}

void __fastcall TProject_::set_ShowCrossProjectLinksInfo(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ShowCrossProjectLinksInfo(param);
}

VARIANT_BOOL __fastcall TProject_::get_AcceptNewExternalData()
{
  return GetDefaultInterface()->get_AcceptNewExternalData();
}

void __fastcall TProject_::set_AcceptNewExternalData(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AcceptNewExternalData(param);
}

Msproject_2k::PjPhoneticType __fastcall TProject_::get_PhoneticType()
{
  return GetDefaultInterface()->get_PhoneticType();
}

void __fastcall TProject_::set_PhoneticType(Msproject_2k::PjPhoneticType param)
{
  GetDefaultInterface()->set_PhoneticType(param);
}

Msproject_2k::PjWorkgroupMessages __fastcall TProject_::get_WorkgroupMessages()
{
  return GetDefaultInterface()->get_WorkgroupMessages();
}

void __fastcall TProject_::set_WorkgroupMessages(Msproject_2k::PjWorkgroupMessages param)
{
  GetDefaultInterface()->set_WorkgroupMessages(param);
}

BSTR __fastcall TProject_::get_ServerURL()
{
  return GetDefaultInterface()->get_ServerURL();
}

void __fastcall TProject_::set_ServerURL(BSTR param)
{
  GetDefaultInterface()->set_ServerURL(param);
}

BSTR __fastcall TProject_::get_ServerPath()
{
  return GetDefaultInterface()->get_ServerPath();
}

void __fastcall TProject_::set_ServerPath(BSTR param)
{
  GetDefaultInterface()->set_ServerPath(param);
}

VARIANT_BOOL __fastcall TProject_::get_ReceiveNotifications()
{
  return GetDefaultInterface()->get_ReceiveNotifications();
}

void __fastcall TProject_::set_ReceiveNotifications(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ReceiveNotifications(param);
}

VARIANT_BOOL __fastcall TProject_::get_SendHyperlinkNote()
{
  return GetDefaultInterface()->get_SendHyperlinkNote();
}

void __fastcall TProject_::set_SendHyperlinkNote(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_SendHyperlinkNote(param);
}

Msproject_2k::PjColor __fastcall TProject_::get_HyperlinkColor()
{
  return GetDefaultInterface()->get_HyperlinkColor();
}

void __fastcall TProject_::set_HyperlinkColor(Msproject_2k::PjColor param)
{
  GetDefaultInterface()->set_HyperlinkColor(param);
}

Msproject_2k::PjColor __fastcall TProject_::get_FollowedHyperlinkColor()
{
  return GetDefaultInterface()->get_FollowedHyperlinkColor();
}

void __fastcall TProject_::set_FollowedHyperlinkColor(Msproject_2k::PjColor param)
{
  GetDefaultInterface()->set_FollowedHyperlinkColor(param);
}

VARIANT_BOOL __fastcall TProject_::get_UnderlineHyperlinks()
{
  return GetDefaultInterface()->get_UnderlineHyperlinks();
}

void __fastcall TProject_::set_UnderlineHyperlinks(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_UnderlineHyperlinks(param);
}

Msproject_2k::PjTeamStatusCompletedWork __fastcall TProject_::get_AskForCompletedWork()
{
  return GetDefaultInterface()->get_AskForCompletedWork();
}

void __fastcall TProject_::set_AskForCompletedWork(Msproject_2k::PjTeamStatusCompletedWork param)
{
  GetDefaultInterface()->set_AskForCompletedWork(param);
}

VARIANT_BOOL __fastcall TProject_::get_TrackOvertimeWork()
{
  return GetDefaultInterface()->get_TrackOvertimeWork();
}

void __fastcall TProject_::set_TrackOvertimeWork(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_TrackOvertimeWork(param);
}

VARIANT_BOOL __fastcall TProject_::get_TeamMembersCanDeclineTasks()
{
  return GetDefaultInterface()->get_TeamMembersCanDeclineTasks();
}

void __fastcall TProject_::set_TeamMembersCanDeclineTasks(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_TeamMembersCanDeclineTasks(param);
}

VARIANT_BOOL __fastcall TProject_::get_ShowEstimatedDuration()
{
  return GetDefaultInterface()->get_ShowEstimatedDuration();
}

void __fastcall TProject_::set_ShowEstimatedDuration(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ShowEstimatedDuration(param);
}

VARIANT_BOOL __fastcall TProject_::get_NewTasksEstimated()
{
  return GetDefaultInterface()->get_NewTasksEstimated();
}

void __fastcall TProject_::set_NewTasksEstimated(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_NewTasksEstimated(param);
}

VARIANT_BOOL __fastcall TProject_::get_WBSCodeGenerate()
{
  return GetDefaultInterface()->get_WBSCodeGenerate();
}

void __fastcall TProject_::set_WBSCodeGenerate(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_WBSCodeGenerate(param);
}

VARIANT_BOOL __fastcall TProject_::get_WBSVerifyUniqueness()
{
  return GetDefaultInterface()->get_WBSVerifyUniqueness();
}

void __fastcall TProject_::set_WBSVerifyUniqueness(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_WBSVerifyUniqueness(param);
}

VARIANT_BOOL __fastcall TProject_::get_UpdateProjOnSave()
{
  return GetDefaultInterface()->get_UpdateProjOnSave();
}

void __fastcall TProject_::set_UpdateProjOnSave(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_UpdateProjOnSave(param);
}

Msproject_2k::PjAuthentication __fastcall TProject_::get_ServerIdentification()
{
  return GetDefaultInterface()->get_ServerIdentification();
}

void __fastcall TProject_::set_ServerIdentification(Msproject_2k::PjAuthentication param)
{
  GetDefaultInterface()->set_ServerIdentification(param);
}

VARIANT_BOOL __fastcall TProject_::get_VBASigned()
{
  return GetDefaultInterface()->get_VBASigned();
}

void __fastcall TProject_::set_VBASigned(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_VBASigned(param);
}

VARIANT_BOOL __fastcall TProject_::get_ExpandDatabaseTimephasedData()
{
  return GetDefaultInterface()->get_ExpandDatabaseTimephasedData();
}

void __fastcall TProject_::set_ExpandDatabaseTimephasedData(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ExpandDatabaseTimephasedData(param);
}

VARIANT __fastcall TProject_::get_DatabaseProjectUniqueID()
{
  return GetDefaultInterface()->get_DatabaseProjectUniqueID();
}

void __fastcall TProject_::set_DatabaseProjectUniqueID(VARIANT param)
{
  GetDefaultInterface()->set_DatabaseProjectUniqueID(param);
}

VARIANT __fastcall TProject_::get_ActualWork()
{
  return GetDefaultInterface()->get_ActualWork();
}

void __fastcall TProject_::set_ActualWork(VARIANT param)
{
  GetDefaultInterface()->set_ActualWork(param);
}

VARIANT __fastcall TProject_::get_Cost1()
{
  return GetDefaultInterface()->get_Cost1();
}

void __fastcall TProject_::set_Cost1(VARIANT param)
{
  GetDefaultInterface()->set_Cost1(param);
}

VARIANT __fastcall TProject_::get_Cost2()
{
  return GetDefaultInterface()->get_Cost2();
}

void __fastcall TProject_::set_Cost2(VARIANT param)
{
  GetDefaultInterface()->set_Cost2(param);
}

VARIANT __fastcall TProject_::get_Cost3()
{
  return GetDefaultInterface()->get_Cost3();
}

void __fastcall TProject_::set_Cost3(VARIANT param)
{
  GetDefaultInterface()->set_Cost3(param);
}

VARIANT __fastcall TProject_::get_BaselineWork()
{
  return GetDefaultInterface()->get_BaselineWork();
}

void __fastcall TProject_::set_BaselineWork(VARIANT param)
{
  GetDefaultInterface()->set_BaselineWork(param);
}

VARIANT __fastcall TProject_::get_BaselineCost()
{
  return GetDefaultInterface()->get_BaselineCost();
}

void __fastcall TProject_::set_BaselineCost(VARIANT param)
{
  GetDefaultInterface()->set_BaselineCost(param);
}

VARIANT __fastcall TProject_::get_FixedCost()
{
  return GetDefaultInterface()->get_FixedCost();
}

void __fastcall TProject_::set_FixedCost(VARIANT param)
{
  GetDefaultInterface()->set_FixedCost(param);
}

BSTR __fastcall TProject_::get_WBS()
{
  return GetDefaultInterface()->get_WBS();
}

void __fastcall TProject_::set_WBS(BSTR param)
{
  GetDefaultInterface()->set_WBS(param);
}

VARIANT __fastcall TProject_::get_Delay()
{
  return GetDefaultInterface()->get_Delay();
}

void __fastcall TProject_::set_Delay(VARIANT param)
{
  GetDefaultInterface()->set_Delay(param);
}

VARIANT __fastcall TProject_::get_Priority()
{
  return GetDefaultInterface()->get_Priority();
}

void __fastcall TProject_::set_Priority(VARIANT param)
{
  GetDefaultInterface()->set_Priority(param);
}

VARIANT __fastcall TProject_::get_Duration1()
{
  return GetDefaultInterface()->get_Duration1();
}

void __fastcall TProject_::set_Duration1(VARIANT param)
{
  GetDefaultInterface()->set_Duration1(param);
}

VARIANT __fastcall TProject_::get_Duration2()
{
  return GetDefaultInterface()->get_Duration2();
}

void __fastcall TProject_::set_Duration2(VARIANT param)
{
  GetDefaultInterface()->set_Duration2(param);
}

VARIANT __fastcall TProject_::get_Duration3()
{
  return GetDefaultInterface()->get_Duration3();
}

void __fastcall TProject_::set_Duration3(VARIANT param)
{
  GetDefaultInterface()->set_Duration3(param);
}

VARIANT __fastcall TProject_::get_PercentWorkComplete()
{
  return GetDefaultInterface()->get_PercentWorkComplete();
}

void __fastcall TProject_::set_PercentWorkComplete(VARIANT param)
{
  GetDefaultInterface()->set_PercentWorkComplete(param);
}

VARIANT __fastcall TProject_::get_FixedDuration()
{
  return GetDefaultInterface()->get_FixedDuration();
}

void __fastcall TProject_::set_FixedDuration(VARIANT param)
{
  GetDefaultInterface()->set_FixedDuration(param);
}

VARIANT __fastcall TProject_::get_BaselineStart()
{
  return GetDefaultInterface()->get_BaselineStart();
}

void __fastcall TProject_::set_BaselineStart(VARIANT param)
{
  GetDefaultInterface()->set_BaselineStart(param);
}

VARIANT __fastcall TProject_::get_BaselineFinish()
{
  return GetDefaultInterface()->get_BaselineFinish();
}

void __fastcall TProject_::set_BaselineFinish(VARIANT param)
{
  GetDefaultInterface()->set_BaselineFinish(param);
}

BSTR __fastcall TProject_::get_Text1()
{
  return GetDefaultInterface()->get_Text1();
}

void __fastcall TProject_::set_Text1(BSTR param)
{
  GetDefaultInterface()->set_Text1(param);
}

VARIANT __fastcall TProject_::get_Start1()
{
  return GetDefaultInterface()->get_Start1();
}

void __fastcall TProject_::set_Start1(VARIANT param)
{
  GetDefaultInterface()->set_Start1(param);
}

VARIANT __fastcall TProject_::get_Finish1()
{
  return GetDefaultInterface()->get_Finish1();
}

void __fastcall TProject_::set_Finish1(VARIANT param)
{
  GetDefaultInterface()->set_Finish1(param);
}

BSTR __fastcall TProject_::get_Text2()
{
  return GetDefaultInterface()->get_Text2();
}

void __fastcall TProject_::set_Text2(BSTR param)
{
  GetDefaultInterface()->set_Text2(param);
}

VARIANT __fastcall TProject_::get_Start2()
{
  return GetDefaultInterface()->get_Start2();
}

void __fastcall TProject_::set_Start2(VARIANT param)
{
  GetDefaultInterface()->set_Start2(param);
}

VARIANT __fastcall TProject_::get_Finish2()
{
  return GetDefaultInterface()->get_Finish2();
}

void __fastcall TProject_::set_Finish2(VARIANT param)
{
  GetDefaultInterface()->set_Finish2(param);
}

BSTR __fastcall TProject_::get_Text3()
{
  return GetDefaultInterface()->get_Text3();
}

void __fastcall TProject_::set_Text3(BSTR param)
{
  GetDefaultInterface()->set_Text3(param);
}

VARIANT __fastcall TProject_::get_Start3()
{
  return GetDefaultInterface()->get_Start3();
}

void __fastcall TProject_::set_Start3(VARIANT param)
{
  GetDefaultInterface()->set_Start3(param);
}

VARIANT __fastcall TProject_::get_Finish3()
{
  return GetDefaultInterface()->get_Finish3();
}

void __fastcall TProject_::set_Finish3(VARIANT param)
{
  GetDefaultInterface()->set_Finish3(param);
}

BSTR __fastcall TProject_::get_Text4()
{
  return GetDefaultInterface()->get_Text4();
}

void __fastcall TProject_::set_Text4(BSTR param)
{
  GetDefaultInterface()->set_Text4(param);
}

VARIANT __fastcall TProject_::get_Start4()
{
  return GetDefaultInterface()->get_Start4();
}

void __fastcall TProject_::set_Start4(VARIANT param)
{
  GetDefaultInterface()->set_Start4(param);
}

VARIANT __fastcall TProject_::get_Finish4()
{
  return GetDefaultInterface()->get_Finish4();
}

void __fastcall TProject_::set_Finish4(VARIANT param)
{
  GetDefaultInterface()->set_Finish4(param);
}

BSTR __fastcall TProject_::get_Text5()
{
  return GetDefaultInterface()->get_Text5();
}

void __fastcall TProject_::set_Text5(BSTR param)
{
  GetDefaultInterface()->set_Text5(param);
}

VARIANT __fastcall TProject_::get_Start5()
{
  return GetDefaultInterface()->get_Start5();
}

void __fastcall TProject_::set_Start5(VARIANT param)
{
  GetDefaultInterface()->set_Start5(param);
}

VARIANT __fastcall TProject_::get_Finish5()
{
  return GetDefaultInterface()->get_Finish5();
}

void __fastcall TProject_::set_Finish5(VARIANT param)
{
  GetDefaultInterface()->set_Finish5(param);
}

BSTR __fastcall TProject_::get_Text6()
{
  return GetDefaultInterface()->get_Text6();
}

void __fastcall TProject_::set_Text6(BSTR param)
{
  GetDefaultInterface()->set_Text6(param);
}

BSTR __fastcall TProject_::get_Text7()
{
  return GetDefaultInterface()->get_Text7();
}

void __fastcall TProject_::set_Text7(BSTR param)
{
  GetDefaultInterface()->set_Text7(param);
}

BSTR __fastcall TProject_::get_Text8()
{
  return GetDefaultInterface()->get_Text8();
}

void __fastcall TProject_::set_Text8(BSTR param)
{
  GetDefaultInterface()->set_Text8(param);
}

BSTR __fastcall TProject_::get_Text9()
{
  return GetDefaultInterface()->get_Text9();
}

void __fastcall TProject_::set_Text9(BSTR param)
{
  GetDefaultInterface()->set_Text9(param);
}

BSTR __fastcall TProject_::get_Text10()
{
  return GetDefaultInterface()->get_Text10();
}

void __fastcall TProject_::set_Text10(BSTR param)
{
  GetDefaultInterface()->set_Text10(param);
}

VARIANT __fastcall TProject_::get_Marked()
{
  return GetDefaultInterface()->get_Marked();
}

void __fastcall TProject_::set_Marked(VARIANT param)
{
  GetDefaultInterface()->set_Marked(param);
}

VARIANT __fastcall TProject_::get_Flag1()
{
  return GetDefaultInterface()->get_Flag1();
}

void __fastcall TProject_::set_Flag1(VARIANT param)
{
  GetDefaultInterface()->set_Flag1(param);
}

VARIANT __fastcall TProject_::get_Flag2()
{
  return GetDefaultInterface()->get_Flag2();
}

void __fastcall TProject_::set_Flag2(VARIANT param)
{
  GetDefaultInterface()->set_Flag2(param);
}

VARIANT __fastcall TProject_::get_Flag3()
{
  return GetDefaultInterface()->get_Flag3();
}

void __fastcall TProject_::set_Flag3(VARIANT param)
{
  GetDefaultInterface()->set_Flag3(param);
}

VARIANT __fastcall TProject_::get_Flag4()
{
  return GetDefaultInterface()->get_Flag4();
}

void __fastcall TProject_::set_Flag4(VARIANT param)
{
  GetDefaultInterface()->set_Flag4(param);
}

VARIANT __fastcall TProject_::get_Flag5()
{
  return GetDefaultInterface()->get_Flag5();
}

void __fastcall TProject_::set_Flag5(VARIANT param)
{
  GetDefaultInterface()->set_Flag5(param);
}

VARIANT __fastcall TProject_::get_Flag6()
{
  return GetDefaultInterface()->get_Flag6();
}

void __fastcall TProject_::set_Flag6(VARIANT param)
{
  GetDefaultInterface()->set_Flag6(param);
}

VARIANT __fastcall TProject_::get_Flag7()
{
  return GetDefaultInterface()->get_Flag7();
}

void __fastcall TProject_::set_Flag7(VARIANT param)
{
  GetDefaultInterface()->set_Flag7(param);
}

VARIANT __fastcall TProject_::get_Flag8()
{
  return GetDefaultInterface()->get_Flag8();
}

void __fastcall TProject_::set_Flag8(VARIANT param)
{
  GetDefaultInterface()->set_Flag8(param);
}

VARIANT __fastcall TProject_::get_Flag9()
{
  return GetDefaultInterface()->get_Flag9();
}

void __fastcall TProject_::set_Flag9(VARIANT param)
{
  GetDefaultInterface()->set_Flag9(param);
}

VARIANT __fastcall TProject_::get_Flag10()
{
  return GetDefaultInterface()->get_Flag10();
}

void __fastcall TProject_::set_Flag10(VARIANT param)
{
  GetDefaultInterface()->set_Flag10(param);
}

VARIANT __fastcall TProject_::get_Rollup()
{
  return GetDefaultInterface()->get_Rollup();
}

void __fastcall TProject_::set_Rollup(VARIANT param)
{
  GetDefaultInterface()->set_Rollup(param);
}

double __fastcall TProject_::get_Number1()
{
  return GetDefaultInterface()->get_Number1();
}

void __fastcall TProject_::set_Number1(double param)
{
  GetDefaultInterface()->set_Number1(param);
}

double __fastcall TProject_::get_Number2()
{
  return GetDefaultInterface()->get_Number2();
}

void __fastcall TProject_::set_Number2(double param)
{
  GetDefaultInterface()->set_Number2(param);
}

double __fastcall TProject_::get_Number3()
{
  return GetDefaultInterface()->get_Number3();
}

void __fastcall TProject_::set_Number3(double param)
{
  GetDefaultInterface()->set_Number3(param);
}

double __fastcall TProject_::get_Number4()
{
  return GetDefaultInterface()->get_Number4();
}

void __fastcall TProject_::set_Number4(double param)
{
  GetDefaultInterface()->set_Number4(param);
}

double __fastcall TProject_::get_Number5()
{
  return GetDefaultInterface()->get_Number5();
}

void __fastcall TProject_::set_Number5(double param)
{
  GetDefaultInterface()->set_Number5(param);
}

BSTR __fastcall TProject_::get_Notes()
{
  return GetDefaultInterface()->get_Notes();
}

void __fastcall TProject_::set_Notes(BSTR param)
{
  GetDefaultInterface()->set_Notes(param);
}

BSTR __fastcall TProject_::get_Contact()
{
  return GetDefaultInterface()->get_Contact();
}

void __fastcall TProject_::set_Contact(BSTR param)
{
  GetDefaultInterface()->set_Contact(param);
}

VARIANT __fastcall TProject_::get_HideBar()
{
  return GetDefaultInterface()->get_HideBar();
}

void __fastcall TProject_::set_HideBar(VARIANT param)
{
  GetDefaultInterface()->set_HideBar(param);
}

BSTR __fastcall TProject_::get_CurrencySymbol()
{
  return GetDefaultInterface()->get_CurrencySymbol();
}

void __fastcall TProject_::set_CurrencySymbol(BSTR param)
{
  GetDefaultInterface()->set_CurrencySymbol(param);
}

Msproject_2k::PjPlacement __fastcall TProject_::get_CurrencySymbolPosition()
{
  return GetDefaultInterface()->get_CurrencySymbolPosition();
}

void __fastcall TProject_::set_CurrencySymbolPosition(Msproject_2k::PjPlacement param)
{
  GetDefaultInterface()->set_CurrencySymbolPosition(param);
}

short __fastcall TProject_::get_CurrencyDigits()
{
  return GetDefaultInterface()->get_CurrencyDigits();
}

void __fastcall TProject_::set_CurrencyDigits(short param)
{
  GetDefaultInterface()->set_CurrencyDigits(param);
}

long __fastcall TProject_::get_ShowCriticalSlack()
{
  return GetDefaultInterface()->get_ShowCriticalSlack();
}

void __fastcall TProject_::set_ShowCriticalSlack(long param)
{
  GetDefaultInterface()->set_ShowCriticalSlack(param);
}

Msproject_2k::PjUnit __fastcall TProject_::get_DefaultDurationUnits()
{
  return GetDefaultInterface()->get_DefaultDurationUnits();
}

void __fastcall TProject_::set_DefaultDurationUnits(Msproject_2k::PjUnit param)
{
  GetDefaultInterface()->set_DefaultDurationUnits(param);
}

Msproject_2k::PjUnit __fastcall TProject_::get_DefaultWorkUnits()
{
  return GetDefaultInterface()->get_DefaultWorkUnits();
}

void __fastcall TProject_::set_DefaultWorkUnits(Msproject_2k::PjUnit param)
{
  GetDefaultInterface()->set_DefaultWorkUnits(param);
}

VARIANT_BOOL __fastcall TProject_::get_StartOnCurrentDate()
{
  return GetDefaultInterface()->get_StartOnCurrentDate();
}

void __fastcall TProject_::set_StartOnCurrentDate(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_StartOnCurrentDate(param);
}

VARIANT_BOOL __fastcall TProject_::get_AutoTrack()
{
  return GetDefaultInterface()->get_AutoTrack();
}

void __fastcall TProject_::set_AutoTrack(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AutoTrack(param);
}

VARIANT_BOOL __fastcall TProject_::get_AutoSplitTasks()
{
  return GetDefaultInterface()->get_AutoSplitTasks();
}

void __fastcall TProject_::set_AutoSplitTasks(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AutoSplitTasks(param);
}

VARIANT_BOOL __fastcall TProject_::get_AutoLinkTasks()
{
  return GetDefaultInterface()->get_AutoLinkTasks();
}

void __fastcall TProject_::set_AutoLinkTasks(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AutoLinkTasks(param);
}

VARIANT __fastcall TProject_::get_DefaultStartTime()
{
  return GetDefaultInterface()->get_DefaultStartTime();
}

void __fastcall TProject_::set_DefaultStartTime(VARIANT param)
{
  GetDefaultInterface()->set_DefaultStartTime(param);
}

VARIANT __fastcall TProject_::get_DefaultFinishTime()
{
  return GetDefaultInterface()->get_DefaultFinishTime();
}

void __fastcall TProject_::set_DefaultFinishTime(VARIANT param)
{
  GetDefaultInterface()->set_DefaultFinishTime(param);
}

double __fastcall TProject_::get_HoursPerDay()
{
  return GetDefaultInterface()->get_HoursPerDay();
}

void __fastcall TProject_::set_HoursPerDay(double param)
{
  GetDefaultInterface()->set_HoursPerDay(param);
}

double __fastcall TProject_::get_HoursPerWeek()
{
  return GetDefaultInterface()->get_HoursPerWeek();
}

void __fastcall TProject_::set_HoursPerWeek(double param)
{
  GetDefaultInterface()->set_HoursPerWeek(param);
}

double __fastcall TProject_::get_DaysPerMonth()
{
  return GetDefaultInterface()->get_DaysPerMonth();
}

void __fastcall TProject_::set_DaysPerMonth(double param)
{
  GetDefaultInterface()->set_DaysPerMonth(param);
}

VARIANT __fastcall TProject_::get_DefaultResourceStandardRate()
{
  return GetDefaultInterface()->get_DefaultResourceStandardRate();
}

void __fastcall TProject_::set_DefaultResourceStandardRate(VARIANT param)
{
  GetDefaultInterface()->set_DefaultResourceStandardRate(param);
}

VARIANT __fastcall TProject_::get_DefaultResourceOvertimeRate()
{
  return GetDefaultInterface()->get_DefaultResourceOvertimeRate();
}

void __fastcall TProject_::set_DefaultResourceOvertimeRate(VARIANT param)
{
  GetDefaultInterface()->set_DefaultResourceOvertimeRate(param);
}

VARIANT_BOOL __fastcall TProject_::get_DisplayProjectSummaryTask()
{
  return GetDefaultInterface()->get_DisplayProjectSummaryTask();
}

void __fastcall TProject_::set_DisplayProjectSummaryTask(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayProjectSummaryTask(param);
}

VARIANT_BOOL __fastcall TProject_::get_AutoAddResources()
{
  return GetDefaultInterface()->get_AutoAddResources();
}

void __fastcall TProject_::set_AutoAddResources(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AutoAddResources(param);
}

Msproject_2k::PjWeekday __fastcall TProject_::get_StartWeekOn()
{
  return GetDefaultInterface()->get_StartWeekOn();
}

void __fastcall TProject_::set_StartWeekOn(Msproject_2k::PjWeekday param)
{
  GetDefaultInterface()->set_StartWeekOn(param);
}

Msproject_2k::PjMonth __fastcall TProject_::get_StartYearIn()
{
  return GetDefaultInterface()->get_StartYearIn();
}

void __fastcall TProject_::set_StartYearIn(Msproject_2k::PjMonth param)
{
  GetDefaultInterface()->set_StartYearIn(param);
}

VARIANT_BOOL __fastcall TProject_::get_AllowTaskDelegation()
{
  return GetDefaultInterface()->get_AllowTaskDelegation();
}

void __fastcall TProject_::set_AllowTaskDelegation(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AllowTaskDelegation(param);
}

BSTR __fastcall TProject_::get_Name()
{
  return GetDefaultInterface()->get_Name();
}

void __fastcall TProject_::set_Name(BSTR param)
{
  GetDefaultInterface()->set_Name(param);
}

BSTR __fastcall TProject_::get__CodeName(void)
{
  return  GetDefaultInterface()->get__CodeName();
}

void __fastcall TProject_::set__CodeName(BSTR Param1)
{
  GetDefaultInterface()->set__CodeName(Param1);
}

BSTR __fastcall TProject_::get_CodeName(void)
{
  return  GetDefaultInterface()->get_CodeName();
}

Msproject_2k::TasksPtr __fastcall TProject_::get_OutlineChildren(void)
{
  return  GetDefaultInterface()->get_OutlineChildren();
}

VARIANT __fastcall TProject_::get_CostVariance(void)
{
  return  GetDefaultInterface()->get_CostVariance();
}

Msproject_2k::TaskPtr __fastcall TProject_::get_ProjectSummaryTask(void)
{
  return  GetDefaultInterface()->get_ProjectSummaryTask();
}

VARIANT __fastcall TProject_::get_RemainingCost(void)
{
  return  GetDefaultInterface()->get_RemainingCost();
}

VARIANT __fastcall TProject_::get_BCWP(void)
{
  return  GetDefaultInterface()->get_BCWP();
}

VARIANT __fastcall TProject_::get_BCWS(void)
{
  return  GetDefaultInterface()->get_BCWS();
}

VARIANT __fastcall TProject_::get_SV(void)
{
  return  GetDefaultInterface()->get_SV();
}

VARIANT __fastcall TProject_::get_CV(void)
{
  return  GetDefaultInterface()->get_CV();
}

BSTR __fastcall TProject_::get_OutlineNumber(void)
{
  return  GetDefaultInterface()->get_OutlineNumber();
}

VARIANT __fastcall TProject_::get_Critical(void)
{
  return  GetDefaultInterface()->get_Critical();
}

VARIANT __fastcall TProject_::get_FreeSlack(void)
{
  return  GetDefaultInterface()->get_FreeSlack();
}

VARIANT __fastcall TProject_::get_TotalSlack(void)
{
  return  GetDefaultInterface()->get_TotalSlack();
}

long __fastcall TProject_::get_UniqueID(void)
{
  return  GetDefaultInterface()->get_UniqueID();
}

int __fastcall TProject_::get_OutlineLevel(void)
{
  return  GetDefaultInterface()->get_OutlineLevel();
}

VARIANT __fastcall TProject_::get_BaselineDuration(void)
{
  return  GetDefaultInterface()->get_BaselineDuration();
}

VARIANT __fastcall TProject_::get_DurationVariance(void)
{
  return  GetDefaultInterface()->get_DurationVariance();
}

VARIANT __fastcall TProject_::get_EarlyStart(void)
{
  return  GetDefaultInterface()->get_EarlyStart();
}

VARIANT __fastcall TProject_::get_EarlyFinish(void)
{
  return  GetDefaultInterface()->get_EarlyFinish();
}

VARIANT __fastcall TProject_::get_LateStart(void)
{
  return  GetDefaultInterface()->get_LateStart();
}

VARIANT __fastcall TProject_::get_StartVariance(void)
{
  return  GetDefaultInterface()->get_StartVariance();
}

VARIANT __fastcall TProject_::get_FinishVariance(void)
{
  return  GetDefaultInterface()->get_FinishVariance();
}

VARIANT __fastcall TProject_::get_Project(void)
{
  return  GetDefaultInterface()->get_Project();
}

VARIANT __fastcall TProject_::get_Milestone(void)
{
  return  GetDefaultInterface()->get_Milestone();
}

VARIANT __fastcall TProject_::get_RemainingDuration(void)
{
  return  GetDefaultInterface()->get_RemainingDuration();
}

VARIANT __fastcall TProject_::get_PercentComplete(void)
{
  return  GetDefaultInterface()->get_PercentComplete();
}

VARIANT __fastcall TProject_::get_Start(void)
{
  return  GetDefaultInterface()->get_Start();
}

VARIANT __fastcall TProject_::get_Finish(void)
{
  return  GetDefaultInterface()->get_Finish();
}

VARIANT __fastcall TProject_::get_ResourceNames(void)
{
  return  GetDefaultInterface()->get_ResourceNames();
}

VARIANT __fastcall TProject_::get_ResourceInitials(void)
{
  return  GetDefaultInterface()->get_ResourceInitials();
}

VARIANT __fastcall TProject_::get_Resume(void)
{
  return  GetDefaultInterface()->get_Resume();
}

VARIANT __fastcall TProject_::get_Stop(void)
{
  return  GetDefaultInterface()->get_Stop();
}

VARIANT __fastcall TProject_::get_ResumeNoEarlierThan(void)
{
  return  GetDefaultInterface()->get_ResumeNoEarlierThan();
}

VARIANT __fastcall TProject_::get_ConstraintType(void)
{
  return  GetDefaultInterface()->get_ConstraintType();
}

VARIANT __fastcall TProject_::get_ConstraintDate(void)
{
  return  GetDefaultInterface()->get_ConstraintDate();
}

VARIANT __fastcall TProject_::get_ActualCost(void)
{
  return  GetDefaultInterface()->get_ActualCost();
}

VARIANT __fastcall TProject_::get_Cost(void)
{
  return  GetDefaultInterface()->get_Cost();
}

VARIANT __fastcall TProject_::get_Created(void)
{
  return  GetDefaultInterface()->get_Created();
}

VARIANT __fastcall TProject_::get_ActualDuration(void)
{
  return  GetDefaultInterface()->get_ActualDuration();
}

VARIANT __fastcall TProject_::get_Duration(void)
{
  return  GetDefaultInterface()->get_Duration();
}

VARIANT __fastcall TProject_::get_LateFinish(void)
{
  return  GetDefaultInterface()->get_LateFinish();
}

VARIANT __fastcall TProject_::get_ActualFinish(void)
{
  return  GetDefaultInterface()->get_ActualFinish();
}

long __fastcall TProject_::get_Objects(void)
{
  return  GetDefaultInterface()->get_Objects();
}

VARIANT __fastcall TProject_::get_RemainingWork(void)
{
  return  GetDefaultInterface()->get_RemainingWork();
}

VARIANT __fastcall TProject_::get_ResourceGroup(void)
{
  return  GetDefaultInterface()->get_ResourceGroup();
}

VARIANT __fastcall TProject_::get_ActualStart(void)
{
  return  GetDefaultInterface()->get_ActualStart();
}

VARIANT __fastcall TProject_::get_Summary(void)
{
  return  GetDefaultInterface()->get_Summary();
}

BSTR __fastcall TProject_::get_Template(void)
{
  return  GetDefaultInterface()->get_Template();
}

VARIANT __fastcall TProject_::get_UpdateNeeded(void)
{
  return  GetDefaultInterface()->get_UpdateNeeded();
}

VARIANT __fastcall TProject_::get_Work(void)
{
  return  GetDefaultInterface()->get_Work();
}

VARIANT __fastcall TProject_::get_WorkVariance(void)
{
  return  GetDefaultInterface()->get_WorkVariance();
}

VARIANT __fastcall TProject_::get_LinkedFields(void)
{
  return  GetDefaultInterface()->get_LinkedFields();
}

VARIANT __fastcall TProject_::get_Confirmed(void)
{
  return  GetDefaultInterface()->get_Confirmed();
}

VARIANT_BOOL __fastcall TProject_::get_ReadOnly(void)
{
  return  GetDefaultInterface()->get_ReadOnly();
}

VARIANT_BOOL __fastcall TProject_::get_HasPassword(void)
{
  return  GetDefaultInterface()->get_HasPassword();
}

VARIANT_BOOL __fastcall TProject_::get_WriteReserved(void)
{
  return  GetDefaultInterface()->get_WriteReserved();
}

Msproject_2k::ProjectApplicationPtr __fastcall TProject_::get_Application(void)
{
  return  GetDefaultInterface()->get_Application();
}

LPDISPATCH __fastcall TProject_::get_Parent(void)
{
  return  GetDefaultInterface()->get_Parent();
}

VARIANT __fastcall TProject_::get_Index(void)
{
  return  GetDefaultInterface()->get_Index();
}

Msproject_2k::ListPtr __fastcall TProject_::get_MapList(void)
{
  return  GetDefaultInterface()->get_MapList();
}

Msproject_2k::TasksPtr __fastcall TProject_::get_Tasks(void)
{
  return  GetDefaultInterface()->get_Tasks();
}

Msproject_2k::ResourcesPtr __fastcall TProject_::get_Resources(void)
{
  return  GetDefaultInterface()->get_Resources();
}

Msproject_2k::CalendarsPtr __fastcall TProject_::get_BaseCalendars(void)
{
  return  GetDefaultInterface()->get_BaseCalendars();
}

LPDISPATCH __fastcall TProject_::get_BuiltinDocumentProperties(void)
{
  return  GetDefaultInterface()->get_BuiltinDocumentProperties();
}

LPDISPATCH __fastcall TProject_::get_CustomDocumentProperties(void)
{
  return  GetDefaultInterface()->get_CustomDocumentProperties();
}

LPDISPATCH __fastcall TProject_::get_Container(void)
{
  return  GetDefaultInterface()->get_Container();
}

Msproject_2k::CalendarPtr __fastcall TProject_::get_Calendar(void)
{
  return  GetDefaultInterface()->get_Calendar();
}

long __fastcall TProject_::get_NumberOfTasks(void)
{
  return  GetDefaultInterface()->get_NumberOfTasks();
}

long __fastcall TProject_::get_NumberOfResources(void)
{
  return  GetDefaultInterface()->get_NumberOfResources();
}

BSTR __fastcall TProject_::get_FullName(void)
{
  return  GetDefaultInterface()->get_FullName();
}

BSTR __fastcall TProject_::get_Path(void)
{
  return  GetDefaultInterface()->get_Path();
}

BSTR __fastcall TProject_::get_ResourcePoolName(void)
{
  return  GetDefaultInterface()->get_ResourcePoolName();
}

VARIANT_BOOL __fastcall TProject_::get_Saved(void)
{
  return  GetDefaultInterface()->get_Saved();
}

VARIANT __fastcall TProject_::get_CreationDate(void)
{
  return  GetDefaultInterface()->get_CreationDate();
}

VARIANT __fastcall TProject_::get_LastPrintedDate(void)
{
  return  GetDefaultInterface()->get_LastPrintedDate();
}

VARIANT __fastcall TProject_::get_LastSaveDate(void)
{
  return  GetDefaultInterface()->get_LastSaveDate();
}

BSTR __fastcall TProject_::get_LastSavedBy(void)
{
  return  GetDefaultInterface()->get_LastSavedBy();
}

BSTR __fastcall TProject_::get_RevisionNumber(void)
{
  return  GetDefaultInterface()->get_RevisionNumber();
}

Msproject_2k::ListPtr __fastcall TProject_::get_ViewList(void)
{
  return  GetDefaultInterface()->get_ViewList();
}

Msproject_2k::ListPtr __fastcall TProject_::get_TaskViewList(void)
{
  return  GetDefaultInterface()->get_TaskViewList();
}

Msproject_2k::ListPtr __fastcall TProject_::get_ResourceViewList(void)
{
  return  GetDefaultInterface()->get_ResourceViewList();
}

VARIANT_BOOL __fastcall TProject_::get_ReadOnlyRecommended(void)
{
  return  GetDefaultInterface()->get_ReadOnlyRecommended();
}

Msproject_2k::ListPtr __fastcall TProject_::get_ReportList(void)
{
  return  GetDefaultInterface()->get_ReportList();
}

Msproject_2k::ListPtr __fastcall TProject_::get_TaskFilterList(void)
{
  return  GetDefaultInterface()->get_TaskFilterList();
}

Msproject_2k::ListPtr __fastcall TProject_::get_ResourceFilterList(void)
{
  return  GetDefaultInterface()->get_ResourceFilterList();
}

Msproject_2k::ListPtr __fastcall TProject_::get_TaskTableList(void)
{
  return  GetDefaultInterface()->get_TaskTableList();
}

Msproject_2k::ListPtr __fastcall TProject_::get_ResourceTableList(void)
{
  return  GetDefaultInterface()->get_ResourceTableList();
}

BSTR __fastcall TProject_::get_CurrentView(void)
{
  return  GetDefaultInterface()->get_CurrentView();
}

BSTR __fastcall TProject_::get_CurrentTable(void)
{
  return  GetDefaultInterface()->get_CurrentTable();
}

BSTR __fastcall TProject_::get_CurrentFilter(void)
{
  return  GetDefaultInterface()->get_CurrentFilter();
}

long __fastcall TProject_::get_ID(void)
{
  return  GetDefaultInterface()->get_ID();
}

Office_2k::CommandBarsPtr __fastcall TProject_::get_CommandBars(void)
{
  return  GetDefaultInterface()->get_CommandBars();
}

VARIANT_BOOL __fastcall TProject_::get_UserControl(void)
{
  return  GetDefaultInterface()->get_UserControl();
}

Vbide_2k::VBProjectPtr __fastcall TProject_::get_VBProject(void)
{
  return  GetDefaultInterface()->get_VBProject();
}

Msproject_2k::SubprojectsPtr __fastcall TProject_::get_Subprojects(void)
{
  return  GetDefaultInterface()->get_Subprojects();
}

BSTR __fastcall TProject_::get_CurrentGroup(void)
{
  return  GetDefaultInterface()->get_CurrentGroup();
}

Msproject_2k::ListPtr __fastcall TProject_::get_TaskGroupList(void)
{
  return  GetDefaultInterface()->get_TaskGroupList();
}

Msproject_2k::ListPtr __fastcall TProject_::get_ResourceGroupList(void)
{
  return  GetDefaultInterface()->get_ResourceGroupList();
}

Msproject_2k::TaskGroupsPtr __fastcall TProject_::get_TaskGroups(void)
{
  return  GetDefaultInterface()->get_TaskGroups();
}

Msproject_2k::ResourceGroupsPtr __fastcall TProject_::get_ResourceGroups(void)
{
  return  GetDefaultInterface()->get_ResourceGroups();
}

_MSProjectPtr& TProjectApplication::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TProjectApplication::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TProjectApplication::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TProjectApplication::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TProjectApplication::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TProjectApplication::ConnectTo(_MSProjectPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TProjectApplication::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_ProjectApplication;
  sd.IntfIID = __uuidof(_MSProject);
  sd.EventIID= __uuidof(_EProjectApp);
  ServerData = &sd;
}

void __fastcall TProjectApplication::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1: {
      if (OnNewProject) {
        (OnNewProject)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 6: {
      if (OnProjectBeforeTaskDelete) {
        (OnProjectBeforeTaskDelete)(this, (Msproject_2k::TaskPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 7: {
      if (OnProjectBeforeResourceDelete) {
        (OnProjectBeforeResourceDelete)(this, (Msproject_2k::ResourcePtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 8: {
      if (OnProjectBeforeAssignmentDelete) {
        (OnProjectBeforeAssignmentDelete)(this, (Msproject_2k::AssignmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 9: {
      if (OnProjectBeforeTaskChange) {
        (OnProjectBeforeTaskChange)(this, (Msproject_2k::TaskPtr)(LPDISPATCH)(params[0].pdispVal), (Msproject_2k::PjField)(int)params[1], params[2], params[3].pboolVal);
      }
      break;
      }
    case 10: {
      if (OnProjectBeforeResourceChange) {
        (OnProjectBeforeResourceChange)(this, (Msproject_2k::ResourcePtr)(LPDISPATCH)(params[0].pdispVal), (Msproject_2k::PjField)(int)params[1], params[2], params[3].pboolVal);
      }
      break;
      }
    case 11: {
      if (OnProjectBeforeAssignmentChange) {
        (OnProjectBeforeAssignmentChange)(this, (Msproject_2k::AssignmentPtr)(LPDISPATCH)(params[0].pdispVal), (Msproject_2k::PjAssignmentField)(int)params[1], params[2], params[3].pboolVal);
      }
      break;
      }
    case 12: {
      if (OnProjectBeforeTaskNew) {
        (OnProjectBeforeTaskNew)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 13: {
      if (OnProjectBeforeResourceNew) {
        (OnProjectBeforeResourceNew)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 14: {
      if (OnProjectBeforeAssignmentNew) {
        (OnProjectBeforeAssignmentNew)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 2: {
      if (OnProjectBeforeClose) {
        (OnProjectBeforeClose)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 4: {
      if (OnProjectBeforePrint) {
        (OnProjectBeforePrint)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 3: {
      if (OnProjectBeforeSave) {
        (OnProjectBeforeSave)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal), params[1], params[2].pboolVal);
      }
      break;
      }
    case 5: {
      if (OnProjectCalculate) {
        (OnProjectCalculate)(this, (Msproject_2k::Project_Ptr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TProjectApplication::Quit(Msproject_2k::PjSaveType SaveChanges/*[def,opt]*/)
{
  GetDefaultInterface()->Quit(SaveChanges/*[def,opt]*/);
}

VARIANT __fastcall TProjectApplication::DateAdd(VARIANT StartDate, VARIANT Duration, 
                                                VARIANT Calendar/*[opt]*/)
{
  return  GetDefaultInterface()->DateAdd(StartDate, Duration, Calendar/*[opt]*/);
}

VARIANT __fastcall TProjectApplication::DateSubtract(VARIANT FinishDate, VARIANT Duration, 
                                                     VARIANT Calendar/*[opt]*/)
{
  return  GetDefaultInterface()->DateSubtract(FinishDate, Duration, Calendar/*[opt]*/);
}

VARIANT __fastcall TProjectApplication::DateDifference(VARIANT StartDate, VARIANT FinishDate, 
                                                       VARIANT Calendar/*[opt]*/)
{
  return  GetDefaultInterface()->DateDifference(StartDate, FinishDate, Calendar/*[opt]*/);
}

BSTR __fastcall TProjectApplication::DurationFormat(VARIANT Duration, VARIANT Units/*[opt]*/)
{
  return  GetDefaultInterface()->DurationFormat(Duration, Units/*[opt]*/);
}

VARIANT __fastcall TProjectApplication::DurationValue(BSTR Duration)
{
  return  GetDefaultInterface()->DurationValue(Duration);
}

VARIANT __fastcall TProjectApplication::DateFormat(VARIANT Date, VARIANT Format/*[opt]*/)
{
  return  GetDefaultInterface()->DateFormat(Date, Format/*[opt]*/);
}

void __fastcall TProjectApplication::MailLogon(VARIANT Name/*[opt]*/, VARIANT Password/*[opt]*/, 
                                               VARIANT DownloadNewMail/*[opt]*/)
{
  GetDefaultInterface()->MailLogon(Name/*[opt]*/, Password/*[opt]*/, DownloadNewMail/*[opt]*/);
}

void __fastcall TProjectApplication::MailLogoff(void)
{
  GetDefaultInterface()->MailLogoff();
}

BSTR __fastcall TProjectApplication::MailSession(void)
{
  return  GetDefaultInterface()->MailSession();
}

Msproject_2k::PjMailSystem __fastcall TProjectApplication::MailSystem(void)
{
  return  GetDefaultInterface()->MailSystem();
}

VARIANT __fastcall TProjectApplication::TimescaledData(long TaskID, long ResourceID, 
                                                       VARIANT StartDate, VARIANT EndDate, 
                                                       Msproject_2k::PjTimescaledData Type/*[def,opt]*/, 
                                                       Msproject_2k::PjTimescaleUnit TimeScaleUnit/*[def,opt]*/, 
                                                       VARIANT Count/*[opt]*/)
{
  return  GetDefaultInterface()->TimescaledData(TaskID, ResourceID, StartDate, EndDate, 
                                                Type/*[def,opt]*/, TimeScaleUnit/*[def,opt]*/, 
                                                Count/*[opt]*/);
}

BSTR __fastcall TProjectApplication::CustomFieldGetName(Msproject_2k::PjCustomField FieldID)
{
  return  GetDefaultInterface()->CustomFieldGetName(FieldID);
}

void __fastcall TProjectApplication::Run(BSTR Name, VARIANT Arg1/*[opt]*/, VARIANT Arg2/*[opt]*/, 
                                         VARIANT Arg3/*[opt]*/, VARIANT Arg4/*[opt]*/, 
                                         VARIANT Arg5/*[opt]*/, VARIANT Arg6/*[opt]*/, 
                                         VARIANT Arg7/*[opt]*/, VARIANT Arg8/*[opt]*/, 
                                         VARIANT Arg9/*[opt]*/, VARIANT Arg10/*[opt]*/, 
                                         VARIANT Arg11/*[opt]*/, VARIANT Arg12/*[opt]*/, 
                                         VARIANT Arg13/*[opt]*/, VARIANT Arg14/*[opt]*/, 
                                         VARIANT Arg15/*[opt]*/, VARIANT Arg16/*[opt]*/, 
                                         VARIANT Arg17/*[opt]*/, VARIANT Arg18/*[opt]*/, 
                                         VARIANT Arg19/*[opt]*/, VARIANT Arg20/*[opt]*/, 
                                         VARIANT Arg21/*[opt]*/, VARIANT Arg22/*[opt]*/, 
                                         VARIANT Arg23/*[opt]*/, VARIANT Arg24/*[opt]*/, 
                                         VARIANT Arg25/*[opt]*/, VARIANT Arg26/*[opt]*/, 
                                         VARIANT Arg27/*[opt]*/, VARIANT Arg28/*[opt]*/, 
                                         VARIANT Arg29/*[opt]*/, VARIANT Arg30/*[opt]*/)
{
  GetDefaultInterface()->Run(Name, Arg1/*[opt]*/, Arg2/*[opt]*/, Arg3/*[opt]*/, Arg4/*[opt]*/, 
                             Arg5/*[opt]*/, Arg6/*[opt]*/, Arg7/*[opt]*/, Arg8/*[opt]*/, 
                             Arg9/*[opt]*/, Arg10/*[opt]*/, Arg11/*[opt]*/, Arg12/*[opt]*/, 
                             Arg13/*[opt]*/, Arg14/*[opt]*/, Arg15/*[opt]*/, Arg16/*[opt]*/, 
                             Arg17/*[opt]*/, Arg18/*[opt]*/, Arg19/*[opt]*/, Arg20/*[opt]*/, 
                             Arg21/*[opt]*/, Arg22/*[opt]*/, Arg23/*[opt]*/, Arg24/*[opt]*/, 
                             Arg25/*[opt]*/, Arg26/*[opt]*/, Arg27/*[opt]*/, Arg28/*[opt]*/, 
                             Arg29/*[opt]*/, Arg30/*[opt]*/);
}

void __fastcall TProjectApplication::ActivateMicrosoftApp(Msproject_2k::PjMSApplication Index)
{
  GetDefaultInterface()->ActivateMicrosoftApp(Index);
}

long __fastcall TProjectApplication::BoxGetXPosition(long TaskID, VARIANT ProjectName/*[opt]*/)
{
  return  GetDefaultInterface()->BoxGetXPosition(TaskID, ProjectName/*[opt]*/);
}

long __fastcall TProjectApplication::BoxGetYPosition(long TaskID, VARIANT ProjectName/*[opt]*/)
{
  return  GetDefaultInterface()->BoxGetYPosition(TaskID, ProjectName/*[opt]*/);
}

BSTR __fastcall TProjectApplication::CustomFieldGetFormula(Msproject_2k::PjCustomField FieldID)
{
  return  GetDefaultInterface()->CustomFieldGetFormula(FieldID);
}

BSTR __fastcall TProjectApplication::CustomFieldValueListGetItem(Msproject_2k::PjCustomField FieldID, 
                                                                 Msproject_2k::PjValueListItem Item, 
                                                                 long Index)
{
  return  GetDefaultInterface()->CustomFieldValueListGetItem(FieldID, Item, Index);
}

VARIANT_BOOL __fastcall TProjectApplication::Message(BSTR Message, 
                                                     Msproject_2k::PjMessageType Type/*[def,opt]*/, 
                                                     VARIANT YesText/*[opt]*/, 
                                                     VARIANT NoText/*[opt]*/)
{
  return  GetDefaultInterface()->Message(Message, Type/*[def,opt]*/, YesText/*[opt]*/, 
                                         NoText/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Alerts(VARIANT Show/*[opt]*/)
{
  return  GetDefaultInterface()->Alerts(Show/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FileNew(VARIANT SummaryInfo/*[opt]*/, 
                                                     VARIANT Template/*[opt]*/, 
                                                     VARIANT FileNewDialog/*[opt]*/)
{
  return  GetDefaultInterface()->FileNew(SummaryInfo/*[opt]*/, Template/*[opt]*/, 
                                         FileNewDialog/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FileProperties(void)
{
  return  GetDefaultInterface()->FileProperties();
}

VARIANT_BOOL __fastcall TProjectApplication::FileOpen(VARIANT Name/*[opt]*/, 
                                                      VARIANT ReadOnly/*[opt]*/, 
                                                      VARIANT Merge/*[opt]*/, 
                                                      VARIANT TaskInformation/*[opt]*/, 
                                                      VARIANT Table/*[opt]*/, VARIANT Sheet/*[opt]*/, 
                                                      VARIANT NoAuto/*[opt]*/, 
                                                      VARIANT UserID/*[opt]*/, 
                                                      VARIANT DatabasePassWord/*[opt]*/, 
                                                      VARIANT FormatID/*[opt]*/, 
                                                      VARIANT Map/*[opt]*/, 
                                                      Msproject_2k::PjPoolOpen openPool/*[def,opt]*/, 
                                                      VARIANT Password/*[opt]*/, 
                                                      VARIANT WriteResPassword/*[opt]*/, 
                                                      VARIANT IgnoreReadOnlyRecommended/*[opt]*/)
{
  return  GetDefaultInterface()->FileOpen(Name/*[opt]*/, ReadOnly/*[opt]*/, Merge/*[opt]*/, 
                                          TaskInformation/*[opt]*/, Table/*[opt]*/, Sheet/*[opt]*/, 
                                          NoAuto/*[opt]*/, UserID/*[opt]*/, 
                                          DatabasePassWord/*[opt]*/, FormatID/*[opt]*/, Map/*[opt]*/, 
                                          openPool/*[def,opt]*/, Password/*[opt]*/, 
                                          WriteResPassword/*[opt]*/, 
                                          IgnoreReadOnlyRecommended/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Zoom(void)
{
  return  GetDefaultInterface()->Zoom();
}

VARIANT_BOOL __fastcall TProjectApplication::ZoomTimescale(VARIANT Duration/*[opt]*/, 
                                                           VARIANT Entire/*[opt]*/, 
                                                           VARIANT Selection/*[opt]*/, 
                                                           VARIANT Reset/*[opt]*/)
{
  return  GetDefaultInterface()->ZoomTimescale(Duration/*[opt]*/, Entire/*[opt]*/, 
                                               Selection/*[opt]*/, Reset/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxZoom(VARIANT Percent/*[opt]*/, 
                                                     VARIANT Entire/*[opt]*/)
{
  return  GetDefaultInterface()->BoxZoom(Percent/*[opt]*/, Entire/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FileClose(Msproject_2k::PjSaveType Save/*[def,opt]*/, 
                                                       VARIANT NoAuto/*[opt]*/)
{
  return  GetDefaultInterface()->FileClose(Save/*[def,opt]*/, NoAuto/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FileCloseAll(Msproject_2k::PjSaveType Save/*[def,opt]*/)
{
  return  GetDefaultInterface()->FileCloseAll(Save/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceSharing(VARIANT Share/*[opt]*/, 
                                                             VARIANT Name/*[opt]*/, 
                                                             VARIANT Pool/*[opt]*/)
{
  return  GetDefaultInterface()->ResourceSharing(Share/*[opt]*/, Name/*[opt]*/, Pool/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FileSave(void)
{
  return  GetDefaultInterface()->FileSave();
}

VARIANT_BOOL __fastcall TProjectApplication::FileSaveAs(VARIANT Name/*[opt]*/, 
                                                        Msproject_2k::PjFileFormat Format/*[def,opt]*/, 
                                                        VARIANT Backup/*[opt]*/, 
                                                        VARIANT ReadOnly/*[opt]*/, 
                                                        VARIANT TaskInformation/*[opt]*/, 
                                                        VARIANT Filtered/*[opt]*/, 
                                                        VARIANT Table/*[opt]*/, 
                                                        VARIANT UserID/*[opt]*/, 
                                                        VARIANT DatabasePassWord/*[opt]*/, 
                                                        VARIANT FormatID/*[opt]*/, 
                                                        VARIANT Map/*[opt]*/, 
                                                        VARIANT Password/*[opt]*/, 
                                                        VARIANT WriteResPassword/*[opt]*/, 
                                                        VARIANT ClearBaseline/*[opt]*/, 
                                                        VARIANT ClearActuals/*[opt]*/, 
                                                        VARIANT ClearResourceRates/*[opt]*/, 
                                                        VARIANT ClearFixedCosts/*[opt]*/)
{
  return  GetDefaultInterface()->FileSaveAs(Name/*[opt]*/, Format/*[def,opt]*/, Backup/*[opt]*/, 
                                            ReadOnly/*[opt]*/, TaskInformation/*[opt]*/, 
                                            Filtered/*[opt]*/, Table/*[opt]*/, UserID/*[opt]*/, 
                                            DatabasePassWord/*[opt]*/, FormatID/*[opt]*/, 
                                            Map/*[opt]*/, Password/*[opt]*/, 
                                            WriteResPassword/*[opt]*/, ClearBaseline/*[opt]*/, 
                                            ClearActuals/*[opt]*/, ClearResourceRates/*[opt]*/, 
                                            ClearFixedCosts/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FileSaveWorkspace(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->FileSaveWorkspace(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePrint(VARIANT FromPage/*[opt]*/, 
                                                       VARIANT ToPage/*[opt]*/, 
                                                       VARIANT PageBreaks/*[opt]*/, 
                                                       VARIANT Draft/*[opt]*/, 
                                                       VARIANT Copies/*[opt]*/, 
                                                       VARIANT FromDate/*[opt]*/, 
                                                       VARIANT ToDate/*[opt]*/, 
                                                       VARIANT OnePageWide/*[opt]*/, 
                                                       VARIANT Preview/*[opt]*/, 
                                                       VARIANT Color/*[opt]*/)
{
  return  GetDefaultInterface()->FilePrint(FromPage/*[opt]*/, ToPage/*[opt]*/, PageBreaks/*[opt]*/, 
                                           Draft/*[opt]*/, Copies/*[opt]*/, FromDate/*[opt]*/, 
                                           ToDate/*[opt]*/, OnePageWide/*[opt]*/, Preview/*[opt]*/, 
                                           Color/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ReportPrint(VARIANT Name/*[opt]*/, 
                                                         VARIANT FromPage/*[opt]*/, 
                                                         VARIANT ToPage/*[opt]*/, 
                                                         VARIANT PageBreaks/*[opt]*/, 
                                                         VARIANT Draft/*[opt]*/, 
                                                         VARIANT Copies/*[opt]*/, 
                                                         VARIANT FromDate/*[opt]*/, 
                                                         VARIANT ToDate/*[opt]*/, 
                                                         VARIANT Preview/*[opt]*/, 
                                                         VARIANT Color/*[opt]*/)
{
  return  GetDefaultInterface()->ReportPrint(Name/*[opt]*/, FromPage/*[opt]*/, ToPage/*[opt]*/, 
                                             PageBreaks/*[opt]*/, Draft/*[opt]*/, Copies/*[opt]*/, 
                                             FromDate/*[opt]*/, ToDate/*[opt]*/, Preview/*[opt]*/, 
                                             Color/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePrintPreview(void)
{
  return  GetDefaultInterface()->FilePrintPreview();
}

VARIANT_BOOL __fastcall TProjectApplication::ReportPrintPreview(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->ReportPrintPreview(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePrintSetup(VARIANT Printer/*[opt]*/)
{
  return  GetDefaultInterface()->FilePrintSetup(Printer/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePageSetup(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->FilePageSetup(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePageSetupPage(VARIANT Name/*[opt]*/, 
                                                               VARIANT Portrait/*[opt]*/, 
                                                               VARIANT PercentScale/*[opt]*/, 
                                                               VARIANT PagesTall/*[opt]*/, 
                                                               VARIANT PagesWide/*[opt]*/, 
                                                               Msproject_2k::PjPaperSize PaperSize/*[def,opt]*/, 
                                                               VARIANT FirstPageNumber/*[opt]*/)
{
  return  GetDefaultInterface()->FilePageSetupPage(Name/*[opt]*/, Portrait/*[opt]*/, 
                                                   PercentScale/*[opt]*/, PagesTall/*[opt]*/, 
                                                   PagesWide/*[opt]*/, PaperSize/*[def,opt]*/, 
                                                   FirstPageNumber/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePageSetupMargins(VARIANT Name/*[opt]*/, 
                                                                  VARIANT Top/*[opt]*/, 
                                                                  VARIANT Bottom/*[opt]*/, 
                                                                  VARIANT Left/*[opt]*/, 
                                                                  VARIANT Right/*[opt]*/, 
                                                                  VARIANT Borders/*[opt]*/)
{
  return  GetDefaultInterface()->FilePageSetupMargins(Name/*[opt]*/, Top/*[opt]*/, Bottom/*[opt]*/, 
                                                      Left/*[opt]*/, Right/*[opt]*/, 
                                                      Borders/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePageSetupHeader(VARIANT Name/*[opt]*/, 
                                                                 Msproject_2k::PjAlignment Alignment/*[def,opt]*/, 
                                                                 VARIANT Text/*[opt]*/)
{
  return  GetDefaultInterface()->FilePageSetupHeader(Name/*[opt]*/, Alignment/*[def,opt]*/, 
                                                     Text/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePageSetupFooter(VARIANT Name/*[opt]*/, 
                                                                 Msproject_2k::PjAlignment Alignment/*[def,opt]*/, 
                                                                 VARIANT Text/*[opt]*/)
{
  return  GetDefaultInterface()->FilePageSetupFooter(Name/*[opt]*/, Alignment/*[def,opt]*/, 
                                                     Text/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePageSetupLegend(VARIANT Name/*[opt]*/, 
                                                                 VARIANT TextWidth/*[opt]*/, 
                                                                 VARIANT LegendOn/*[opt]*/, 
                                                                 Msproject_2k::PjAlignment Alignment/*[def,opt]*/, 
                                                                 VARIANT Text/*[opt]*/, 
                                                                 VARIANT LabelFontName/*[opt]*/, 
                                                                 VARIANT LabelFontSize/*[opt]*/, 
                                                                 VARIANT LabelFontBold/*[opt]*/, 
                                                                 VARIANT LabelFontItalic/*[opt]*/, 
                                                                 VARIANT LabelFontUnderline/*[opt]*/, 
                                                                 Msproject_2k::PjColor LabelFontColor/*[def,opt]*/)
{
  return  GetDefaultInterface()->FilePageSetupLegend(Name/*[opt]*/, TextWidth/*[opt]*/, 
                                                     LegendOn/*[opt]*/, Alignment/*[def,opt]*/, 
                                                     Text/*[opt]*/, LabelFontName/*[opt]*/, 
                                                     LabelFontSize/*[opt]*/, LabelFontBold/*[opt]*/, 
                                                     LabelFontItalic/*[opt]*/, 
                                                     LabelFontUnderline/*[opt]*/, 
                                                     LabelFontColor/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePageSetupView(VARIANT Name/*[opt]*/, 
                                                               VARIANT AllSheetColumns/*[opt]*/, 
                                                               VARIANT RepeatColumns/*[opt]*/, 
                                                               VARIANT PrintNotes/*[opt]*/, 
                                                               VARIANT PrintBlankPages/*[opt]*/, 
                                                               VARIANT BestPageFitTimescale/*[opt]*/)
{
  return  GetDefaultInterface()->FilePageSetupView(Name/*[opt]*/, AllSheetColumns/*[opt]*/, 
                                                   RepeatColumns/*[opt]*/, PrintNotes/*[opt]*/, 
                                                   PrintBlankPages/*[opt]*/, 
                                                   BestPageFitTimescale/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePageSetupCalendar(VARIANT Name/*[opt]*/, 
                                                                   VARIANT MonthsPerPage/*[opt]*/, 
                                                                   VARIANT WeeksPerPage/*[opt]*/, 
                                                                   VARIANT ScreenWeekHeight/*[opt]*/, 
                                                                   VARIANT OnlyDaysInMonth/*[opt]*/, 
                                                                   VARIANT OnlyWeeksInMonth/*[opt]*/, 
                                                                   VARIANT MonthPreviews/*[opt]*/, 
                                                                   VARIANT MonthTitle/*[opt]*/, 
                                                                   VARIANT AdditionalTasks/*[opt]*/, 
                                                                   VARIANT GroupAdditionalTasks/*[opt]*/, 
                                                                   VARIANT PrintNotes/*[opt]*/)
{
  return  GetDefaultInterface()->FilePageSetupCalendar(Name/*[opt]*/, MonthsPerPage/*[opt]*/, 
                                                       WeeksPerPage/*[opt]*/, 
                                                       ScreenWeekHeight/*[opt]*/, 
                                                       OnlyDaysInMonth/*[opt]*/, 
                                                       OnlyWeeksInMonth/*[opt]*/, 
                                                       MonthPreviews/*[opt]*/, MonthTitle/*[opt]*/, 
                                                       AdditionalTasks/*[opt]*/, 
                                                       GroupAdditionalTasks/*[opt]*/, 
                                                       PrintNotes/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilePageSetupCalendarText(VARIANT Name/*[opt]*/, 
                                                                       VARIANT Item/*[opt]*/, 
                                                                       VARIANT Font/*[opt]*/, 
                                                                       VARIANT Size/*[opt]*/, 
                                                                       VARIANT Bold/*[opt]*/, 
                                                                       VARIANT Italic/*[opt]*/, 
                                                                       VARIANT Underline/*[opt]*/, 
                                                                       VARIANT Color/*[opt]*/)
{
  return  GetDefaultInterface()->FilePageSetupCalendarText(Name/*[opt]*/, Item/*[opt]*/, 
                                                           Font/*[opt]*/, Size/*[opt]*/, 
                                                           Bold/*[opt]*/, Italic/*[opt]*/, 
                                                           Underline/*[opt]*/, Color/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::MailOpen(VARIANT Any/*[opt]*/)
{
  return  GetDefaultInterface()->MailOpen(Any/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::MailSend(VARIANT To/*[opt]*/, VARIANT Cc/*[opt]*/, 
                                                      VARIANT Subject/*[opt]*/, 
                                                      VARIANT Body/*[opt]*/, 
                                                      VARIANT Enclosures/*[opt]*/, 
                                                      VARIANT IncludeDocument/*[opt]*/, 
                                                      VARIANT ReturnReceipt/*[opt]*/, 
                                                      VARIANT Bcc/*[opt]*/, VARIANT Urgent/*[opt]*/, 
                                                      VARIANT SaveCopy/*[opt]*/, 
                                                      VARIANT AddRecipient/*[opt]*/)
{
  return  GetDefaultInterface()->MailSend(To/*[opt]*/, Cc/*[opt]*/, Subject/*[opt]*/, Body/*[opt]*/, 
                                          Enclosures/*[opt]*/, IncludeDocument/*[opt]*/, 
                                          ReturnReceipt/*[opt]*/, Bcc/*[opt]*/, Urgent/*[opt]*/, 
                                          SaveCopy/*[opt]*/, AddRecipient/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::MailSendScheduleNote(VARIANT Manager/*[opt]*/, 
                                                                  VARIANT Resources/*[opt]*/, 
                                                                  VARIANT TaskContacts/*[opt]*/, 
                                                                  VARIANT Selection/*[opt]*/, 
                                                                  VARIANT IncludeDocument/*[opt]*/, 
                                                                  VARIANT IncludePicture/*[opt]*/, 
                                                                  VARIANT Body/*[opt]*/, 
                                                                  VARIANT Subject/*[opt]*/)
{
  return  GetDefaultInterface()->MailSendScheduleNote(Manager/*[opt]*/, Resources/*[opt]*/, 
                                                      TaskContacts/*[opt]*/, Selection/*[opt]*/, 
                                                      IncludeDocument/*[opt]*/, 
                                                      IncludePicture/*[opt]*/, Body/*[opt]*/, 
                                                      Subject/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::MailPostDocument(void)
{
  return  GetDefaultInterface()->MailPostDocument();
}

VARIANT_BOOL __fastcall TProjectApplication::ODBCManageDataSources(void)
{
  return  GetDefaultInterface()->ODBCManageDataSources();
}

VARIANT_BOOL __fastcall TProjectApplication::ODBCCreateDataSource(void)
{
  return  GetDefaultInterface()->ODBCCreateDataSource();
}

VARIANT_BOOL __fastcall TProjectApplication::MailRoutingSlip(VARIANT To/*[opt]*/, 
                                                             VARIANT Subject/*[opt]*/, 
                                                             VARIANT Body/*[opt]*/, 
                                                             VARIANT AllAtOnce/*[opt]*/, 
                                                             VARIANT ReturnWhenDone/*[opt]*/, 
                                                             VARIANT TrackStatus/*[opt]*/, 
                                                             VARIANT Clear/*[opt]*/, 
                                                             VARIANT SendNow/*[opt]*/)
{
  return  GetDefaultInterface()->MailRoutingSlip(To/*[opt]*/, Subject/*[opt]*/, Body/*[opt]*/, 
                                                 AllAtOnce/*[opt]*/, ReturnWhenDone/*[opt]*/, 
                                                 TrackStatus/*[opt]*/, Clear/*[opt]*/, 
                                                 SendNow/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FileLoadLast(VARIANT Number/*[opt]*/)
{
  return  GetDefaultInterface()->FileLoadLast(Number/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FileExit(Msproject_2k::PjSaveType Save/*[def,opt]*/)
{
  return  GetDefaultInterface()->FileExit(Save/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::MenuBars(void)
{
  return  GetDefaultInterface()->MenuBars();
}

VARIANT_BOOL __fastcall TProjectApplication::MenuBarEdit(VARIANT Copy/*[opt]*/, 
                                                         VARIANT Create/*[opt]*/, 
                                                         VARIANT Name/*[opt]*/, 
                                                         VARIANT NewName/*[opt]*/)
{
  return  GetDefaultInterface()->MenuBarEdit(Copy/*[opt]*/, Create/*[opt]*/, Name/*[opt]*/, 
                                             NewName/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::MenuBarApply(BSTR Name, VARIANT Default/*[opt]*/, 
                                                          VARIANT NoFiles/*[opt]*/)
{
  return  GetDefaultInterface()->MenuBarApply(Name, Default/*[opt]*/, NoFiles/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::EditCut(void)
{
  return  GetDefaultInterface()->EditCut();
}

VARIANT_BOOL __fastcall TProjectApplication::EditCopy(void)
{
  return  GetDefaultInterface()->EditCopy();
}

VARIANT_BOOL __fastcall TProjectApplication::EditCopyPicture(VARIANT Object/*[opt]*/, 
                                                             VARIANT ForPrinter/*[opt]*/, 
                                                             VARIANT SelectedRows/*[opt]*/, 
                                                             VARIANT FromDate/*[opt]*/, 
                                                             VARIANT ToDate/*[opt]*/, 
                                                             VARIANT FileName/*[opt]*/, 
                                                             Msproject_2k::PjCopyPictureScaleOption ScaleOption/*[def,opt]*/)
{
  return  GetDefaultInterface()->EditCopyPicture(Object/*[opt]*/, ForPrinter/*[opt]*/, 
                                                 SelectedRows/*[opt]*/, FromDate/*[opt]*/, 
                                                 ToDate/*[opt]*/, FileName/*[opt]*/, 
                                                 ScaleOption/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::EditPaste(void)
{
  return  GetDefaultInterface()->EditPaste();
}

VARIANT_BOOL __fastcall TProjectApplication::EditPasteSpecial(VARIANT Link/*[opt]*/, 
                                                              VARIANT Type/*[opt]*/, 
                                                              VARIANT DisplayAsIcon/*[opt]*/)
{
  return  GetDefaultInterface()->EditPasteSpecial(Link/*[opt]*/, Type/*[opt]*/, 
                                                  DisplayAsIcon/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::EditClearFormats(void)
{
  return  GetDefaultInterface()->EditClearFormats();
}

VARIANT_BOOL __fastcall TProjectApplication::EditClear(VARIANT Contents/*[opt]*/, 
                                                       VARIANT Formats/*[opt]*/, 
                                                       VARIANT Notes/*[opt]*/, 
                                                       VARIANT Hyperlinks/*[opt]*/)
{
  return  GetDefaultInterface()->EditClear(Contents/*[opt]*/, Formats/*[opt]*/, Notes/*[opt]*/, 
                                           Hyperlinks/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::RowClear(void)
{
  return  GetDefaultInterface()->RowClear();
}

VARIANT_BOOL __fastcall TProjectApplication::DDEPasteLink(void)
{
  return  GetDefaultInterface()->DDEPasteLink();
}

VARIANT_BOOL __fastcall TProjectApplication::EditDelete(void)
{
  return  GetDefaultInterface()->EditDelete();
}

VARIANT_BOOL __fastcall TProjectApplication::ColumnDelete(void)
{
  return  GetDefaultInterface()->ColumnDelete();
}

VARIANT_BOOL __fastcall TProjectApplication::RowDelete(void)
{
  return  GetDefaultInterface()->RowDelete();
}

VARIANT_BOOL __fastcall TProjectApplication::ObjectVerb(VARIANT Verb/*[opt]*/)
{
  return  GetDefaultInterface()->ObjectVerb(Verb/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ObjectLinks(void)
{
  return  GetDefaultInterface()->ObjectLinks();
}

VARIANT_BOOL __fastcall TProjectApplication::ObjectChangeIcon(void)
{
  return  GetDefaultInterface()->ObjectChangeIcon();
}

VARIANT_BOOL __fastcall TProjectApplication::ObjectConvert(void)
{
  return  GetDefaultInterface()->ObjectConvert();
}

VARIANT_BOOL __fastcall TProjectApplication::EditInsert(void)
{
  return  GetDefaultInterface()->EditInsert();
}

VARIANT_BOOL __fastcall TProjectApplication::ColumnInsert(void)
{
  return  GetDefaultInterface()->ColumnInsert();
}

VARIANT_BOOL __fastcall TProjectApplication::RowInsert(void)
{
  return  GetDefaultInterface()->RowInsert();
}

VARIANT_BOOL __fastcall TProjectApplication::LinkTasks(void)
{
  return  GetDefaultInterface()->LinkTasks();
}

VARIANT_BOOL __fastcall TProjectApplication::LinkTasksEdit(long From, long To, 
                                                           VARIANT Delete/*[opt]*/, 
                                                           VARIANT Type/*[opt]*/, 
                                                           VARIANT Lag/*[opt]*/, 
                                                           VARIANT PredecessorProjectName/*[opt]*/, 
                                                           VARIANT SuccessorProjectName/*[opt]*/)
{
  return  GetDefaultInterface()->LinkTasksEdit(From, To, Delete/*[opt]*/, Type/*[opt]*/, 
                                               Lag/*[opt]*/, PredecessorProjectName/*[opt]*/, 
                                               SuccessorProjectName/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::UnlinkTasks(void)
{
  return  GetDefaultInterface()->UnlinkTasks();
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceAssignment(VARIANT Resources/*[opt]*/, 
                                                                Msproject_2k::PjResAssignOperation Operation/*[def,opt]*/, 
                                                                VARIANT With/*[opt]*/)
{
  return  GetDefaultInterface()->ResourceAssignment(Resources/*[opt]*/, Operation/*[def,opt]*/, 
                                                    With/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::EditGoTo(VARIANT ID/*[opt]*/, VARIANT Date/*[opt]*/)
{
  return  GetDefaultInterface()->EditGoTo(ID/*[opt]*/, Date/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::GotoNextOverAllocation(void)
{
  return  GetDefaultInterface()->GotoNextOverAllocation();
}

VARIANT_BOOL __fastcall TProjectApplication::InsertNotes(void)
{
  return  GetDefaultInterface()->InsertNotes();
}

VARIANT_BOOL __fastcall TProjectApplication::Find(VARIANT Field/*[opt]*/, VARIANT Test/*[opt]*/, 
                                                  VARIANT Value/*[opt]*/, VARIANT Next/*[opt]*/, 
                                                  VARIANT MatchCase/*[opt]*/)
{
  return  GetDefaultInterface()->Find(Field/*[opt]*/, Test/*[opt]*/, Value/*[opt]*/, Next/*[opt]*/, 
                                      MatchCase/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Replace(VARIANT Field/*[opt]*/, VARIANT Test/*[opt]*/, 
                                                     VARIANT Value/*[opt]*/, 
                                                     VARIANT Replacement/*[opt]*/, 
                                                     VARIANT ReplaceAll/*[opt]*/, 
                                                     VARIANT Next/*[opt]*/, 
                                                     VARIANT MatchCase/*[opt]*/)
{
  return  GetDefaultInterface()->Replace(Field/*[opt]*/, Test/*[opt]*/, Value/*[opt]*/, 
                                         Replacement/*[opt]*/, ReplaceAll/*[opt]*/, Next/*[opt]*/, 
                                         MatchCase/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectAll(void)
{
  return  GetDefaultInterface()->SelectAll();
}

VARIANT_BOOL __fastcall TProjectApplication::ObjectInsert(void)
{
  return  GetDefaultInterface()->ObjectInsert();
}

VARIANT_BOOL __fastcall TProjectApplication::SubscribeTo(VARIANT Edition/*[opt]*/, 
                                                         Msproject_2k::PjSubscribeFormat Format/*[def,opt]*/)
{
  return  GetDefaultInterface()->SubscribeTo(Edition/*[opt]*/, Format/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SubscriberOptions(VARIANT Name/*[opt]*/, 
                                                               VARIANT IsTask/*[opt]*/, 
                                                               VARIANT UniqueID/*[opt]*/, 
                                                               VARIANT Field/*[opt]*/, 
                                                               VARIANT Automatically/*[opt]*/, 
                                                               VARIANT Action/*[opt]*/)
{
  return  GetDefaultInterface()->SubscriberOptions(Name/*[opt]*/, IsTask/*[opt]*/, UniqueID/*[opt]*/, 
                                                   Field/*[opt]*/, Automatically/*[opt]*/, 
                                                   Action/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CreatePublisher(VARIANT Edition/*[opt]*/, 
                                                             VARIANT Contains/*[opt]*/)
{
  return  GetDefaultInterface()->CreatePublisher(Edition/*[opt]*/, Contains/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::PublisherOptions(VARIANT Name/*[opt]*/, 
                                                              VARIANT View/*[opt]*/, 
                                                              VARIANT IsTask/*[opt]*/, 
                                                              VARIANT UniqueID/*[opt]*/, 
                                                              VARIANT Field/*[opt]*/, 
                                                              VARIANT OnSave/*[opt]*/, 
                                                              VARIANT Action/*[opt]*/)
{
  return  GetDefaultInterface()->PublisherOptions(Name/*[opt]*/, View/*[opt]*/, IsTask/*[opt]*/, 
                                                  UniqueID/*[opt]*/, Field/*[opt]*/, OnSave/*[opt]*/, 
                                                  Action/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::EditionStopAll(VARIANT Stop/*[opt]*/)
{
  return  GetDefaultInterface()->EditionStopAll(Stop/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ClipboardShow(void)
{
  return  GetDefaultInterface()->ClipboardShow();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewApply(VARIANT Name/*[opt]*/, 
                                                       VARIANT SinglePane/*[opt]*/, 
                                                       VARIANT Toggle/*[opt]*/)
{
  return  GetDefaultInterface()->ViewApply(Name/*[opt]*/, SinglePane/*[opt]*/, Toggle/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ViewEditSingle(VARIANT Name/*[opt]*/, 
                                                            VARIANT Create/*[opt]*/, 
                                                            VARIANT NewName/*[opt]*/, 
                                                            VARIANT Screen/*[opt]*/, 
                                                            VARIANT ShowInMenu/*[opt]*/, 
                                                            VARIANT HighlightFilter/*[opt]*/, 
                                                            VARIANT Table/*[opt]*/, 
                                                            VARIANT Filter/*[opt]*/, 
                                                            VARIANT Group/*[opt]*/)
{
  return  GetDefaultInterface()->ViewEditSingle(Name/*[opt]*/, Create/*[opt]*/, NewName/*[opt]*/, 
                                                Screen/*[opt]*/, ShowInMenu/*[opt]*/, 
                                                HighlightFilter/*[opt]*/, Table/*[opt]*/, 
                                                Filter/*[opt]*/, Group/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ViewEditCombination(VARIANT Name/*[opt]*/, 
                                                                 VARIANT Create/*[opt]*/, 
                                                                 VARIANT NewName/*[opt]*/, 
                                                                 VARIANT TopView/*[opt]*/, 
                                                                 VARIANT BottomView/*[opt]*/, 
                                                                 VARIANT ShowInMenu/*[opt]*/)
{
  return  GetDefaultInterface()->ViewEditCombination(Name/*[opt]*/, Create/*[opt]*/, 
                                                     NewName/*[opt]*/, TopView/*[opt]*/, 
                                                     BottomView/*[opt]*/, ShowInMenu/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::TableApply(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->TableApply(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::TableEdit(BSTR Name, VARIANT_BOOL TaskTable, 
                                                       VARIANT Create/*[opt]*/, 
                                                       VARIANT OverwriteExisting/*[opt]*/, 
                                                       VARIANT NewName/*[opt]*/, 
                                                       VARIANT FieldName/*[opt]*/, 
                                                       VARIANT NewFieldName/*[opt]*/, 
                                                       VARIANT Title/*[opt]*/, 
                                                       VARIANT Width/*[opt]*/, 
                                                       VARIANT Align/*[opt]*/, 
                                                       VARIANT ShowInMenu/*[opt]*/, 
                                                       VARIANT LockFirstColumn/*[opt]*/, 
                                                       VARIANT DateFormat/*[opt]*/, 
                                                       VARIANT RowHeight/*[opt]*/, 
                                                       VARIANT ColumnPosition/*[opt]*/, 
                                                       VARIANT AlignTitle/*[opt]*/)
{
  return  GetDefaultInterface()->TableEdit(Name, TaskTable, Create/*[opt]*/, 
                                           OverwriteExisting/*[opt]*/, NewName/*[opt]*/, 
                                           FieldName/*[opt]*/, NewFieldName/*[opt]*/, Title/*[opt]*/, 
                                           Width/*[opt]*/, Align/*[opt]*/, ShowInMenu/*[opt]*/, 
                                           LockFirstColumn/*[opt]*/, DateFormat/*[opt]*/, 
                                           RowHeight/*[opt]*/, ColumnPosition/*[opt]*/, 
                                           AlignTitle/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilterApply(VARIANT Name/*[opt]*/, 
                                                         VARIANT Highlight/*[opt]*/, 
                                                         VARIANT Value1/*[opt]*/, 
                                                         VARIANT Value2/*[opt]*/)
{
  return  GetDefaultInterface()->FilterApply(Name/*[opt]*/, Highlight/*[opt]*/, Value1/*[opt]*/, 
                                             Value2/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FilterEdit(BSTR Name, VARIANT_BOOL TaskFilter, 
                                                        VARIANT Create/*[opt]*/, 
                                                        VARIANT OverwriteExisting/*[opt]*/, 
                                                        VARIANT Parenthesis/*[opt]*/, 
                                                        VARIANT NewName/*[opt]*/, 
                                                        VARIANT FieldName/*[opt]*/, 
                                                        VARIANT NewFieldName/*[opt]*/, 
                                                        VARIANT Test/*[opt]*/, 
                                                        VARIANT Value/*[opt]*/, 
                                                        VARIANT Operation/*[opt]*/, 
                                                        VARIANT ShowInMenu/*[opt]*/, 
                                                        VARIANT ShowSummaryTasks/*[opt]*/)
{
  return  GetDefaultInterface()->FilterEdit(Name, TaskFilter, Create/*[opt]*/, 
                                            OverwriteExisting/*[opt]*/, Parenthesis/*[opt]*/, 
                                            NewName/*[opt]*/, FieldName/*[opt]*/, 
                                            NewFieldName/*[opt]*/, Test/*[opt]*/, Value/*[opt]*/, 
                                            Operation/*[opt]*/, ShowInMenu/*[opt]*/, 
                                            ShowSummaryTasks/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ProjectSummaryInfo(VARIANT Project/*[opt]*/, 
                                                                VARIANT Title/*[opt]*/, 
                                                                VARIANT Subject/*[opt]*/, 
                                                                VARIANT Author/*[opt]*/, 
                                                                VARIANT Company/*[opt]*/, 
                                                                VARIANT Manager/*[opt]*/, 
                                                                VARIANT Keywords/*[opt]*/, 
                                                                VARIANT Comments/*[opt]*/, 
                                                                VARIANT Start/*[opt]*/, 
                                                                VARIANT Finish/*[opt]*/, 
                                                                VARIANT ScheduleFrom/*[opt]*/, 
                                                                VARIANT CurrentDate/*[opt]*/, 
                                                                VARIANT Calendar/*[opt]*/, 
                                                                VARIANT StatusDate/*[opt]*/, 
                                                                VARIANT Priority/*[opt]*/)
{
  return  GetDefaultInterface()->ProjectSummaryInfo(Project/*[opt]*/, Title/*[opt]*/, 
                                                    Subject/*[opt]*/, Author/*[opt]*/, 
                                                    Company/*[opt]*/, Manager/*[opt]*/, 
                                                    Keywords/*[opt]*/, Comments/*[opt]*/, 
                                                    Start/*[opt]*/, Finish/*[opt]*/, 
                                                    ScheduleFrom/*[opt]*/, CurrentDate/*[opt]*/, 
                                                    Calendar/*[opt]*/, StatusDate/*[opt]*/, 
                                                    Priority/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ProjectStatistics(VARIANT Project/*[opt]*/)
{
  return  GetDefaultInterface()->ProjectStatistics(Project/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsCalendar(VARIANT StartWeekOnMonday/*[opt]*/, 
                                                             VARIANT StartYearIn/*[opt]*/, 
                                                             VARIANT StartTime/*[opt]*/, 
                                                             VARIANT FinishTime/*[opt]*/, 
                                                             VARIANT HoursPerDay/*[opt]*/, 
                                                             VARIANT HoursPerWeek/*[opt]*/, 
                                                             VARIANT SetDefaults/*[opt]*/, 
                                                             VARIANT StartWeekOn/*[opt]*/, 
                                                             VARIANT UseFYStartYear/*[opt]*/, 
                                                             VARIANT DaysPerMonth/*[opt]*/)
{
  return  GetDefaultInterface()->OptionsCalendar(StartWeekOnMonday/*[opt]*/, StartYearIn/*[opt]*/, 
                                                 StartTime/*[opt]*/, FinishTime/*[opt]*/, 
                                                 HoursPerDay/*[opt]*/, HoursPerWeek/*[opt]*/, 
                                                 SetDefaults/*[opt]*/, StartWeekOn/*[opt]*/, 
                                                 UseFYStartYear/*[opt]*/, DaysPerMonth/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsEdit(VARIANT MoveAfterReturn/*[opt]*/, 
                                                         VARIANT DragAndDrop/*[opt]*/, 
                                                         VARIANT UpdateLinks/*[opt]*/, 
                                                         VARIANT CopyResourceUsageHeader/*[opt]*/, 
                                                         VARIANT PhoneticInfo/*[opt]*/, 
                                                         VARIANT PhoneticType/*[opt]*/, 
                                                         VARIANT MinuteLabelDisplay/*[opt]*/, 
                                                         VARIANT HourLabelDisplay/*[opt]*/, 
                                                         VARIANT DayLabelDisplay/*[opt]*/, 
                                                         VARIANT WeekLabelDisplay/*[opt]*/, 
                                                         VARIANT YearLabelDisplay/*[opt]*/, 
                                                         VARIANT SpaceBeforeTimeLabel/*[opt]*/, 
                                                         VARIANT SetDefaults/*[opt]*/, 
                                                         VARIANT MonthLabelDisplay/*[opt]*/, 
                                                         VARIANT SetDefaultsTimeUnits/*[opt]*/, 
                                                         VARIANT HyperlinkColor/*[opt]*/, 
                                                         VARIANT FollowedHyperlinkColor/*[opt]*/, 
                                                         VARIANT UnderlineHyperlinks/*[opt]*/, 
                                                         VARIANT SetDefaultsHyperlink/*[opt]*/, 
                                                         VARIANT InCellEditing/*[opt]*/)
{
  return  GetDefaultInterface()->OptionsEdit(MoveAfterReturn/*[opt]*/, DragAndDrop/*[opt]*/, 
                                             UpdateLinks/*[opt]*/, CopyResourceUsageHeader/*[opt]*/, 
                                             PhoneticInfo/*[opt]*/, PhoneticType/*[opt]*/, 
                                             MinuteLabelDisplay/*[opt]*/, HourLabelDisplay/*[opt]*/, 
                                             DayLabelDisplay/*[opt]*/, WeekLabelDisplay/*[opt]*/, 
                                             YearLabelDisplay/*[opt]*/, 
                                             SpaceBeforeTimeLabel/*[opt]*/, SetDefaults/*[opt]*/, 
                                             MonthLabelDisplay/*[opt]*/, 
                                             SetDefaultsTimeUnits/*[opt]*/, HyperlinkColor/*[opt]*/, 
                                             FollowedHyperlinkColor/*[opt]*/, 
                                             UnderlineHyperlinks/*[opt]*/, 
                                             SetDefaultsHyperlink/*[opt]*/, InCellEditing/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsGeneral(VARIANT PlanningWizard/*[opt]*/, 
                                                            VARIANT WizardUsage/*[opt]*/, 
                                                            VARIANT WizardErrors/*[opt]*/, 
                                                            VARIANT WizardScheduling/*[opt]*/, 
                                                            VARIANT ShowTipOfDay/*[opt]*/, 
                                                            VARIANT AutoAddResources/*[opt]*/, 
                                                            VARIANT StandardRate/*[opt]*/, 
                                                            VARIANT OvertimeRate/*[opt]*/, 
                                                            VARIANT LastFile/*[opt]*/, 
                                                            VARIANT SummaryInfo/*[opt]*/, 
                                                            VARIANT UserName/*[opt]*/, 
                                                            VARIANT SetDefaults/*[opt]*/, 
                                                            VARIANT ShowWelcome/*[opt]*/, 
                                                            VARIANT AutoFilter/*[opt]*/, 
                                                            VARIANT MacroVirusProtection/*[opt]*/, 
                                                            VARIANT DisplayRecentFiles/*[opt]*/, 
                                                            VARIANT RecentFilesMaximum/*[opt]*/, 
                                                            VARIANT FontConversion/*[opt]*/)
{
  return  GetDefaultInterface()->OptionsGeneral(PlanningWizard/*[opt]*/, WizardUsage/*[opt]*/, 
                                                WizardErrors/*[opt]*/, WizardScheduling/*[opt]*/, 
                                                ShowTipOfDay/*[opt]*/, AutoAddResources/*[opt]*/, 
                                                StandardRate/*[opt]*/, OvertimeRate/*[opt]*/, 
                                                LastFile/*[opt]*/, SummaryInfo/*[opt]*/, 
                                                UserName/*[opt]*/, SetDefaults/*[opt]*/, 
                                                ShowWelcome/*[opt]*/, AutoFilter/*[opt]*/, 
                                                MacroVirusProtection/*[opt]*/, 
                                                DisplayRecentFiles/*[opt]*/, 
                                                RecentFilesMaximum/*[opt]*/, FontConversion/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsSchedule(VARIANT ScheduleMessages/*[opt]*/, 
                                                             VARIANT StartOnCurrentDate/*[opt]*/, 
                                                             VARIANT AutoLink/*[opt]*/, 
                                                             VARIANT AutoSplit/*[opt]*/, 
                                                             VARIANT CriticalSlack/*[opt]*/, 
                                                             VARIANT TaskType/*[opt]*/, 
                                                             VARIANT DurationUnits/*[opt]*/, 
                                                             VARIANT WorkUnits/*[opt]*/, 
                                                             VARIANT AutoTrack/*[opt]*/, 
                                                             VARIANT SetDefaults/*[opt]*/, 
                                                             VARIANT AssignmentUnits/*[opt]*/, 
                                                             VARIANT EffortDriven/*[opt]*/, 
                                                             VARIANT HonorConstraints/*[opt]*/, 
                                                             VARIANT ShowEstimated/*[opt]*/, 
                                                             VARIANT NewTasksEstimated/*[opt]*/)
{
  return  GetDefaultInterface()->OptionsSchedule(ScheduleMessages/*[opt]*/, 
                                                 StartOnCurrentDate/*[opt]*/, AutoLink/*[opt]*/, 
                                                 AutoSplit/*[opt]*/, CriticalSlack/*[opt]*/, 
                                                 TaskType/*[opt]*/, DurationUnits/*[opt]*/, 
                                                 WorkUnits/*[opt]*/, AutoTrack/*[opt]*/, 
                                                 SetDefaults/*[opt]*/, AssignmentUnits/*[opt]*/, 
                                                 EffortDriven/*[opt]*/, HonorConstraints/*[opt]*/, 
                                                 ShowEstimated/*[opt]*/, NewTasksEstimated/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsView(VARIANT DefaultView/*[opt]*/, 
                                                         VARIANT DateFormat/*[opt]*/, 
                                                         VARIANT ProjectSummary/*[opt]*/, 
                                                         VARIANT DisplayStatusBar/*[opt]*/, 
                                                         VARIANT DisplayEntryBar/*[opt]*/, 
                                                         VARIANT DisplayScrollBars/*[opt]*/, 
                                                         VARIANT CurrencySymbol/*[opt]*/, 
                                                         VARIANT SymbolPlacement/*[opt]*/, 
                                                         VARIANT CurrencyDigits/*[opt]*/, 
                                                         VARIANT DisplayOutlineNumber/*[opt]*/, 
                                                         VARIANT DisplayOutlineSymbols/*[opt]*/, 
                                                         VARIANT DisplayNameIndent/*[opt]*/, 
                                                         VARIANT DisplaySummaryTasks/*[opt]*/, 
                                                         VARIANT DisplayOLEIndicator/*[opt]*/, 
                                                         VARIANT DisplayExternalSuccessors/*[opt]*/, 
                                                         VARIANT DisplayExternalPredecessors/*[opt]*/, 
                                                         VARIANT CrossProjectLinksInfo/*[opt]*/, 
                                                         VARIANT AcceptNewExternalData/*[opt]*/, 
                                                         VARIANT DisplayWindowsInTaskbar/*[opt]*/, 
                                                         VARIANT DisplayScreentips/*[opt]*/)
{
  return  GetDefaultInterface()->OptionsView(DefaultView/*[opt]*/, DateFormat/*[opt]*/, 
                                             ProjectSummary/*[opt]*/, DisplayStatusBar/*[opt]*/, 
                                             DisplayEntryBar/*[opt]*/, DisplayScrollBars/*[opt]*/, 
                                             CurrencySymbol/*[opt]*/, SymbolPlacement/*[opt]*/, 
                                             CurrencyDigits/*[opt]*/, DisplayOutlineNumber/*[opt]*/, 
                                             DisplayOutlineSymbols/*[opt]*/, 
                                             DisplayNameIndent/*[opt]*/, 
                                             DisplaySummaryTasks/*[opt]*/, 
                                             DisplayOLEIndicator/*[opt]*/, 
                                             DisplayExternalSuccessors/*[opt]*/, 
                                             DisplayExternalPredecessors/*[opt]*/, 
                                             CrossProjectLinksInfo/*[opt]*/, 
                                             AcceptNewExternalData/*[opt]*/, 
                                             DisplayWindowsInTaskbar/*[opt]*/, 
                                             DisplayScreentips/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsWorkgroup(VARIANT WorkgroupMessages/*[opt]*/, 
                                                              VARIANT ServerURL/*[opt]*/, 
                                                              VARIANT ServerPath/*[opt]*/, 
                                                              VARIANT ReceiveNotifications/*[opt]*/, 
                                                              VARIANT SendHyperlinkNote/*[opt]*/, 
                                                              VARIANT HyperlinkColor/*[opt]*/, 
                                                              VARIANT FollowedHyperlinkColor/*[opt]*/, 
                                                              VARIANT UnderlineHyperlinks/*[opt]*/, 
                                                              VARIANT SetDefaults/*[opt]*/, 
                                                              VARIANT ServerIdentification/*[opt]*/, 
                                                              VARIANT AllowTaskDelegation/*[opt]*/, 
                                                              VARIANT UpdateProjectToWeb/*[opt]*/, 
                                                              VARIANT SetDefaultsMessaging/*[opt]*/, 
                                                              VARIANT SetDefaultsWebServer/*[opt]*/)
{
  return  GetDefaultInterface()->OptionsWorkgroup(WorkgroupMessages/*[opt]*/, ServerURL/*[opt]*/, 
                                                  ServerPath/*[opt]*/, ReceiveNotifications/*[opt]*/, 
                                                  SendHyperlinkNote/*[opt]*/, 
                                                  HyperlinkColor/*[opt]*/, 
                                                  FollowedHyperlinkColor/*[opt]*/, 
                                                  UnderlineHyperlinks/*[opt]*/, SetDefaults/*[opt]*/, 
                                                  ServerIdentification/*[opt]*/, 
                                                  AllowTaskDelegation/*[opt]*/, 
                                                  UpdateProjectToWeb/*[opt]*/, 
                                                  SetDefaultsMessaging/*[opt]*/, 
                                                  SetDefaultsWebServer/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsCalculation(VARIANT Automatic/*[opt]*/, 
                                                                VARIANT AutoTrack/*[opt]*/, 
                                                                VARIANT SpreadPercentToStatusDate/*[opt]*/, 
                                                                VARIANT SpreadCostsToStatusDate/*[opt]*/, 
                                                                VARIANT AutoCalcCosts/*[opt]*/, 
                                                                VARIANT FixedCostAccrual/*[opt]*/, 
                                                                VARIANT CalcMultipleCriticalPaths/*[opt]*/, 
                                                                VARIANT CriticalSlack/*[opt]*/, 
                                                                VARIANT SetDefaults/*[opt]*/, 
                                                                VARIANT CalcInsProjLikeSummTask/*[opt]*/)
{
  return  GetDefaultInterface()->OptionsCalculation(Automatic/*[opt]*/, AutoTrack/*[opt]*/, 
                                                    SpreadPercentToStatusDate/*[opt]*/, 
                                                    SpreadCostsToStatusDate/*[opt]*/, 
                                                    AutoCalcCosts/*[opt]*/, 
                                                    FixedCostAccrual/*[opt]*/, 
                                                    CalcMultipleCriticalPaths/*[opt]*/, 
                                                    CriticalSlack/*[opt]*/, SetDefaults/*[opt]*/, 
                                                    CalcInsProjLikeSummTask/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalculateAll(void)
{
  return  GetDefaultInterface()->CalculateAll();
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsPreferences(void)
{
  return  GetDefaultInterface()->OptionsPreferences();
}

VARIANT_BOOL __fastcall TProjectApplication::ChangeWorkingTime(void)
{
  return  GetDefaultInterface()->ChangeWorkingTime();
}

VARIANT_BOOL __fastcall TProjectApplication::BaseCalendars(void)
{
  return  GetDefaultInterface()->BaseCalendars();
}

VARIANT_BOOL __fastcall TProjectApplication::BaseCalendarCreate(BSTR Name, VARIANT FromName/*[opt]*/)
{
  return  GetDefaultInterface()->BaseCalendarCreate(Name, FromName/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BaseCalendarRename(BSTR FromName, BSTR ToName)
{
  return  GetDefaultInterface()->BaseCalendarRename(FromName, ToName);
}

VARIANT_BOOL __fastcall TProjectApplication::BaseCalendarDelete(BSTR Name)
{
  return  GetDefaultInterface()->BaseCalendarDelete(Name);
}

VARIANT_BOOL __fastcall TProjectApplication::BaseCalendarEditDays(BSTR Name, 
                                                                  VARIANT StartDate/*[opt]*/, 
                                                                  VARIANT EndDate/*[opt]*/, 
                                                                  VARIANT WeekDay/*[opt]*/, 
                                                                  VARIANT Working/*[opt]*/, 
                                                                  VARIANT From1/*[opt]*/, 
                                                                  VARIANT To1/*[opt]*/, 
                                                                  VARIANT From2/*[opt]*/, 
                                                                  VARIANT To2/*[opt]*/, 
                                                                  VARIANT From3/*[opt]*/, 
                                                                  VARIANT To3/*[opt]*/, 
                                                                  VARIANT Default/*[opt]*/, 
                                                                  VARIANT From4/*[opt]*/, 
                                                                  VARIANT To4/*[opt]*/, 
                                                                  VARIANT From5/*[opt]*/, 
                                                                  VARIANT To5/*[opt]*/)
{
  return  GetDefaultInterface()->BaseCalendarEditDays(Name, StartDate/*[opt]*/, EndDate/*[opt]*/, 
                                                      WeekDay/*[opt]*/, Working/*[opt]*/, 
                                                      From1/*[opt]*/, To1/*[opt]*/, From2/*[opt]*/, 
                                                      To2/*[opt]*/, From3/*[opt]*/, To3/*[opt]*/, 
                                                      Default/*[opt]*/, From4/*[opt]*/, To4/*[opt]*/, 
                                                      From5/*[opt]*/, To5/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceCalendarEditDays(BSTR ProjectName, 
                                                                      BSTR ResourceName, 
                                                                      VARIANT StartDate/*[opt]*/, 
                                                                      VARIANT EndDate/*[opt]*/, 
                                                                      VARIANT WeekDay/*[opt]*/, 
                                                                      VARIANT Working/*[opt]*/, 
                                                                      VARIANT Default/*[opt]*/, 
                                                                      VARIANT From1/*[opt]*/, 
                                                                      VARIANT To1/*[opt]*/, 
                                                                      VARIANT From2/*[opt]*/, 
                                                                      VARIANT To2/*[opt]*/, 
                                                                      VARIANT From3/*[opt]*/, 
                                                                      VARIANT To3/*[opt]*/, 
                                                                      VARIANT From4/*[opt]*/, 
                                                                      VARIANT To4/*[opt]*/, 
                                                                      VARIANT From5/*[opt]*/, 
                                                                      VARIANT To5/*[opt]*/)
{
  return  GetDefaultInterface()->ResourceCalendarEditDays(ProjectName, ResourceName, 
                                                          StartDate/*[opt]*/, EndDate/*[opt]*/, 
                                                          WeekDay/*[opt]*/, Working/*[opt]*/, 
                                                          Default/*[opt]*/, From1/*[opt]*/, 
                                                          To1/*[opt]*/, From2/*[opt]*/, To2/*[opt]*/, 
                                                          From3/*[opt]*/, To3/*[opt]*/, 
                                                          From4/*[opt]*/, To4/*[opt]*/, 
                                                          From5/*[opt]*/, To5/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BaseCalendarReset(BSTR Name)
{
  return  GetDefaultInterface()->BaseCalendarReset(Name);
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceCalendarReset(BSTR ProjectName, 
                                                                   BSTR ResourceName, 
                                                                   VARIANT BaseCalendar/*[opt]*/)
{
  return  GetDefaultInterface()->ResourceCalendarReset(ProjectName, ResourceName, 
                                                       BaseCalendar/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceCalendars(void)
{
  return  GetDefaultInterface()->ResourceCalendars();
}

VARIANT_BOOL __fastcall TProjectApplication::LevelingOptions(VARIANT Automatic/*[opt]*/, 
                                                             VARIANT DelayInSlack/*[opt]*/, 
                                                             VARIANT AutoClearLeveling/*[opt]*/, 
                                                             VARIANT Order/*[opt]*/, 
                                                             VARIANT LevelEntireProject/*[opt]*/, 
                                                             VARIANT FromDate/*[opt]*/, 
                                                             VARIANT ToDate/*[opt]*/, 
                                                             VARIANT PeriodBasis/*[opt]*/, 
                                                             VARIANT LevelIndividualAssignments/*[opt]*/, 
                                                             VARIANT LevelingCanSplit/*[opt]*/)
{
  return  GetDefaultInterface()->LevelingOptions(Automatic/*[opt]*/, DelayInSlack/*[opt]*/, 
                                                 AutoClearLeveling/*[opt]*/, Order/*[opt]*/, 
                                                 LevelEntireProject/*[opt]*/, FromDate/*[opt]*/, 
                                                 ToDate/*[opt]*/, PeriodBasis/*[opt]*/, 
                                                 LevelIndividualAssignments/*[opt]*/, 
                                                 LevelingCanSplit/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::LevelNow(VARIANT All/*[opt]*/)
{
  return  GetDefaultInterface()->LevelNow(All/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BaselineSave(VARIANT All/*[opt]*/, 
                                                          VARIANT Copy/*[opt]*/, 
                                                          VARIANT Into/*[opt]*/)
{
  return  GetDefaultInterface()->BaselineSave(All/*[opt]*/, Copy/*[opt]*/, Into/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::UpdateProject(VARIANT All/*[opt]*/, 
                                                           VARIANT UpdateDate/*[opt]*/, 
                                                           VARIANT Action/*[opt]*/)
{
  return  GetDefaultInterface()->UpdateProject(All/*[opt]*/, UpdateDate/*[opt]*/, Action/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::UpdateTasks(VARIANT PercentComplete/*[opt]*/, 
                                                         VARIANT ActualDuration/*[opt]*/, 
                                                         VARIANT RemainingDuration/*[opt]*/, 
                                                         VARIANT ActualStart/*[opt]*/, 
                                                         VARIANT ActualFinish/*[opt]*/, 
                                                         VARIANT Notes/*[opt]*/)
{
  return  GetDefaultInterface()->UpdateTasks(PercentComplete/*[opt]*/, ActualDuration/*[opt]*/, 
                                             RemainingDuration/*[opt]*/, ActualStart/*[opt]*/, 
                                             ActualFinish/*[opt]*/, Notes/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WindowNewWindow(VARIANT Projects/*[opt]*/, 
                                                             VARIANT View/*[opt]*/, 
                                                             VARIANT AllProjects/*[opt]*/, 
                                                             VARIANT ShowDialog/*[opt]*/)
{
  return  GetDefaultInterface()->WindowNewWindow(Projects/*[opt]*/, View/*[opt]*/, 
                                                 AllProjects/*[opt]*/, ShowDialog/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WindowArrangeAll(void)
{
  return  GetDefaultInterface()->WindowArrangeAll();
}

VARIANT_BOOL __fastcall TProjectApplication::WindowHide(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->WindowHide(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WindowUnhide(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->WindowUnhide(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WindowActivate(VARIANT WindowName/*[opt]*/, 
                                                            VARIANT DialogID/*[opt]*/, 
                                                            VARIANT TopPane/*[opt]*/)
{
  return  GetDefaultInterface()->WindowActivate(WindowName/*[opt]*/, DialogID/*[opt]*/, 
                                                TopPane/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::PageBreakSet(void)
{
  return  GetDefaultInterface()->PageBreakSet();
}

VARIANT_BOOL __fastcall TProjectApplication::PageBreakRemove(void)
{
  return  GetDefaultInterface()->PageBreakRemove();
}

VARIANT_BOOL __fastcall TProjectApplication::PageBreaksRemoveAll(void)
{
  return  GetDefaultInterface()->PageBreaksRemoveAll();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowResourcesPredecessors(void)
{
  return  GetDefaultInterface()->ViewShowResourcesPredecessors();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowResourcesSuccessors(void)
{
  return  GetDefaultInterface()->ViewShowResourcesSuccessors();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowPredecessorsSuccessors(void)
{
  return  GetDefaultInterface()->ViewShowPredecessorsSuccessors();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowNotes(void)
{
  return  GetDefaultInterface()->ViewShowNotes();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowObjects(void)
{
  return  GetDefaultInterface()->ViewShowObjects();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowOverallocation(void)
{
  return  GetDefaultInterface()->ViewShowOverallocation();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowPercentAllocation(void)
{
  return  GetDefaultInterface()->ViewShowPercentAllocation();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowWork(void)
{
  return  GetDefaultInterface()->ViewShowWork();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowCost(void)
{
  return  GetDefaultInterface()->ViewShowCost();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowSchedule(void)
{
  return  GetDefaultInterface()->ViewShowSchedule();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowPeakUnits(void)
{
  return  GetDefaultInterface()->ViewShowPeakUnits();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowAvailability(void)
{
  return  GetDefaultInterface()->ViewShowAvailability();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowRemainingAvailability(void)
{
  return  GetDefaultInterface()->ViewShowRemainingAvailability();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowCumulativeWork(void)
{
  return  GetDefaultInterface()->ViewShowCumulativeWork();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowCumulativeCost(void)
{
  return  GetDefaultInterface()->ViewShowCumulativeCost();
}

VARIANT_BOOL __fastcall TProjectApplication::PaneNext(void)
{
  return  GetDefaultInterface()->PaneNext();
}

VARIANT_BOOL __fastcall TProjectApplication::PaneCreate(void)
{
  return  GetDefaultInterface()->PaneCreate();
}

VARIANT_BOOL __fastcall TProjectApplication::FormViewShow(void)
{
  return  GetDefaultInterface()->FormViewShow();
}

VARIANT_BOOL __fastcall TProjectApplication::PaneClose(void)
{
  return  GetDefaultInterface()->PaneClose();
}

VARIANT_BOOL __fastcall TProjectApplication::WindowSplit(void)
{
  return  GetDefaultInterface()->WindowSplit();
}

VARIANT_BOOL __fastcall TProjectApplication::WindowNext(VARIANT NoWrap/*[opt]*/)
{
  return  GetDefaultInterface()->WindowNext(NoWrap/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WindowPrev(VARIANT NoWrap/*[opt]*/)
{
  return  GetDefaultInterface()->WindowPrev(NoWrap/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DocClose(void)
{
  return  GetDefaultInterface()->DocClose();
}

VARIANT_BOOL __fastcall TProjectApplication::AppMaximize(void)
{
  return  GetDefaultInterface()->AppMaximize();
}

VARIANT_BOOL __fastcall TProjectApplication::AppMinimize(void)
{
  return  GetDefaultInterface()->AppMinimize();
}

VARIANT_BOOL __fastcall TProjectApplication::AppMove(VARIANT XPosition/*[opt]*/, 
                                                     VARIANT YPosition/*[opt]*/, 
                                                     VARIANT Points/*[opt]*/)
{
  return  GetDefaultInterface()->AppMove(XPosition/*[opt]*/, YPosition/*[opt]*/, Points/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::AppRestore(void)
{
  return  GetDefaultInterface()->AppRestore();
}

VARIANT_BOOL __fastcall TProjectApplication::AppSize(VARIANT Width/*[opt]*/, VARIANT Height/*[opt]*/, 
                                                     VARIANT Points/*[opt]*/)
{
  return  GetDefaultInterface()->AppSize(Width/*[opt]*/, Height/*[opt]*/, Points/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DocMaximize(void)
{
  return  GetDefaultInterface()->DocMaximize();
}

VARIANT_BOOL __fastcall TProjectApplication::DocMove(VARIANT XPosition/*[opt]*/, 
                                                     VARIANT YPosition/*[opt]*/, 
                                                     VARIANT Points/*[opt]*/)
{
  return  GetDefaultInterface()->DocMove(XPosition/*[opt]*/, YPosition/*[opt]*/, Points/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DocRestore(void)
{
  return  GetDefaultInterface()->DocRestore();
}

VARIANT_BOOL __fastcall TProjectApplication::DocSize(VARIANT Width/*[opt]*/, VARIANT Height/*[opt]*/, 
                                                     VARIANT Points/*[opt]*/)
{
  return  GetDefaultInterface()->DocSize(Width/*[opt]*/, Height/*[opt]*/, Points/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OutlineOutdent(VARIANT Levels/*[opt]*/)
{
  return  GetDefaultInterface()->OutlineOutdent(Levels/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OutlineShowTasks(Msproject_2k::PJTaskOutlineShowLevel OutlineNumber/*[def,opt]*/, 
                                                              VARIANT ExpandInsertedProjects/*[opt]*/)
{
  return  GetDefaultInterface()->OutlineShowTasks(OutlineNumber/*[def,opt]*/, 
                                                  ExpandInsertedProjects/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OutlineIndent(VARIANT Levels/*[opt]*/)
{
  return  GetDefaultInterface()->OutlineIndent(Levels/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OutlineHideSubTasks(void)
{
  return  GetDefaultInterface()->OutlineHideSubTasks();
}

VARIANT_BOOL __fastcall TProjectApplication::OutlineShowSubTasks(void)
{
  return  GetDefaultInterface()->OutlineShowSubTasks();
}

VARIANT_BOOL __fastcall TProjectApplication::OutlineShowAllTasks(void)
{
  return  GetDefaultInterface()->OutlineShowAllTasks();
}

VARIANT_BOOL __fastcall TProjectApplication::SelectBeginning(VARIANT Extend/*[opt]*/)
{
  return  GetDefaultInterface()->SelectBeginning(Extend/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectEnd(VARIANT Extend/*[opt]*/)
{
  return  GetDefaultInterface()->SelectEnd(Extend/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectRowStart(VARIANT Extend/*[opt]*/)
{
  return  GetDefaultInterface()->SelectRowStart(Extend/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectRowEnd(VARIANT Extend/*[opt]*/)
{
  return  GetDefaultInterface()->SelectRowEnd(Extend/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectCellLeft(VARIANT NumCells/*[opt]*/, 
                                                            VARIANT Extend/*[opt]*/)
{
  return  GetDefaultInterface()->SelectCellLeft(NumCells/*[opt]*/, Extend/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectCellRight(VARIANT NumCells/*[opt]*/, 
                                                             VARIANT Extend/*[opt]*/)
{
  return  GetDefaultInterface()->SelectCellRight(NumCells/*[opt]*/, Extend/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectCellUp(VARIANT NumCells/*[opt]*/, 
                                                          VARIANT Extend/*[opt]*/)
{
  return  GetDefaultInterface()->SelectCellUp(NumCells/*[opt]*/, Extend/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectCellDown(VARIANT NumCells/*[opt]*/, 
                                                            VARIANT Extend/*[opt]*/)
{
  return  GetDefaultInterface()->SelectCellDown(NumCells/*[opt]*/, Extend/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectionExtend(VARIANT Extend/*[opt]*/, 
                                                             VARIANT Add/*[opt]*/)
{
  return  GetDefaultInterface()->SelectionExtend(Extend/*[opt]*/, Add/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ColumnBestFit(VARIANT Column/*[opt]*/)
{
  return  GetDefaultInterface()->ColumnBestFit(Column/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ColumnEdit(VARIANT Column/*[opt]*/)
{
  return  GetDefaultInterface()->ColumnEdit(Column/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectRange(long Row, short Column, 
                                                         VARIANT RowRelative/*[opt]*/, 
                                                         VARIANT Width/*[opt]*/, 
                                                         VARIANT Height/*[opt]*/, 
                                                         VARIANT Extend/*[opt]*/, 
                                                         VARIANT Add/*[opt]*/)
{
  return  GetDefaultInterface()->SelectRange(Row, Column, RowRelative/*[opt]*/, Width/*[opt]*/, 
                                             Height/*[opt]*/, Extend/*[opt]*/, Add/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectTimescaleRange(long Row, BSTR StartTime, 
                                                                  short Width, long Height)
{
  return  GetDefaultInterface()->SelectTimescaleRange(Row, StartTime, Width, Height);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectTaskField(long Row, BSTR Column, 
                                                             VARIANT RowRelative/*[opt]*/, 
                                                             VARIANT Width/*[opt]*/, 
                                                             VARIANT Height/*[opt]*/, 
                                                             VARIANT Extend/*[opt]*/, 
                                                             VARIANT Add/*[opt]*/)
{
  return  GetDefaultInterface()->SelectTaskField(Row, Column, RowRelative/*[opt]*/, Width/*[opt]*/, 
                                                 Height/*[opt]*/, Extend/*[opt]*/, Add/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectResourceField(long Row, BSTR Column, 
                                                                 VARIANT RowRelative/*[opt]*/, 
                                                                 VARIANT Width/*[opt]*/, 
                                                                 VARIANT Height/*[opt]*/, 
                                                                 VARIANT Extend/*[opt]*/, 
                                                                 VARIANT Add/*[opt]*/)
{
  return  GetDefaultInterface()->SelectResourceField(Row, Column, RowRelative/*[opt]*/, 
                                                     Width/*[opt]*/, Height/*[opt]*/, 
                                                     Extend/*[opt]*/, Add/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectRow(VARIANT Row/*[opt]*/, 
                                                       VARIANT RowRelative/*[opt]*/, 
                                                       VARIANT Height/*[opt]*/, 
                                                       VARIANT Extend/*[opt]*/, VARIANT Add/*[opt]*/)
{
  return  GetDefaultInterface()->SelectRow(Row/*[opt]*/, RowRelative/*[opt]*/, Height/*[opt]*/, 
                                           Extend/*[opt]*/, Add/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectColumn(VARIANT Column/*[opt]*/, 
                                                          VARIANT Additional/*[opt]*/, 
                                                          VARIANT Extend/*[opt]*/, 
                                                          VARIANT Add/*[opt]*/)
{
  return  GetDefaultInterface()->SelectColumn(Column/*[opt]*/, Additional/*[opt]*/, Extend/*[opt]*/, 
                                              Add/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectTaskColumn(VARIANT Column/*[opt]*/, 
                                                              VARIANT Additional/*[opt]*/, 
                                                              VARIANT Extend/*[opt]*/, 
                                                              VARIANT Add/*[opt]*/)
{
  return  GetDefaultInterface()->SelectTaskColumn(Column/*[opt]*/, Additional/*[opt]*/, 
                                                  Extend/*[opt]*/, Add/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectResourceColumn(VARIANT Column/*[opt]*/, 
                                                                  VARIANT Additional/*[opt]*/, 
                                                                  VARIANT Extend/*[opt]*/, 
                                                                  VARIANT Add/*[opt]*/)
{
  return  GetDefaultInterface()->SelectResourceColumn(Column/*[opt]*/, Additional/*[opt]*/, 
                                                      Extend/*[opt]*/, Add/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectTaskCell(VARIANT Row/*[opt]*/, 
                                                            VARIANT Column/*[opt]*/, 
                                                            VARIANT RowRelative/*[opt]*/)
{
  return  GetDefaultInterface()->SelectTaskCell(Row/*[opt]*/, Column/*[opt]*/, RowRelative/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectResourceCell(VARIANT Row/*[opt]*/, 
                                                                VARIANT Column/*[opt]*/, 
                                                                VARIANT RowRelative/*[opt]*/)
{
  return  GetDefaultInterface()->SelectResourceCell(Row/*[opt]*/, Column/*[opt]*/, 
                                                    RowRelative/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectCell(VARIANT Row/*[opt]*/, 
                                                        VARIANT Column/*[opt]*/, 
                                                        VARIANT RowRelative/*[opt]*/)
{
  return  GetDefaultInterface()->SelectCell(Row/*[opt]*/, Column/*[opt]*/, RowRelative/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SelectSheet(void)
{
  return  GetDefaultInterface()->SelectSheet();
}

VARIANT_BOOL __fastcall TProjectApplication::DDEInitiate(BSTR App, BSTR Topic)
{
  return  GetDefaultInterface()->DDEInitiate(App, Topic);
}

VARIANT_BOOL __fastcall TProjectApplication::DDEExecute(BSTR Command, VARIANT TimeOut/*[opt]*/)
{
  return  GetDefaultInterface()->DDEExecute(Command, TimeOut/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DDETerminate(void)
{
  return  GetDefaultInterface()->DDETerminate();
}

VARIANT_BOOL __fastcall TProjectApplication::InformationDialog(VARIANT Tab/*[opt]*/)
{
  return  GetDefaultInterface()->InformationDialog(Tab/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Form(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->Form(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomForms(void)
{
  return  GetDefaultInterface()->CustomForms();
}

VARIANT_BOOL __fastcall TProjectApplication::Tables(void)
{
  return  GetDefaultInterface()->Tables();
}

VARIANT_BOOL __fastcall TProjectApplication::Filters(void)
{
  return  GetDefaultInterface()->Filters();
}

VARIANT_BOOL __fastcall TProjectApplication::Macro(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->Macro(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FillDown(VARIANT Down/*[opt]*/)
{
  return  GetDefaultInterface()->FillDown(Down/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Views(void)
{
  return  GetDefaultInterface()->Views();
}

VARIANT_BOOL __fastcall TProjectApplication::CalculateProject(void)
{
  return  GetDefaultInterface()->CalculateProject();
}

VARIANT_BOOL __fastcall TProjectApplication::LevelingClear(VARIANT All/*[opt]*/)
{
  return  GetDefaultInterface()->LevelingClear(All/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SpellingCheck(void)
{
  return  GetDefaultInterface()->SpellingCheck();
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsSpelling(VARIANT TaskName/*[opt]*/, 
                                                             VARIANT TaskNotes/*[opt]*/, 
                                                             VARIANT TaskText1/*[opt]*/, 
                                                             VARIANT TaskText2/*[opt]*/, 
                                                             VARIANT TaskText3/*[opt]*/, 
                                                             VARIANT TaskText4/*[opt]*/, 
                                                             VARIANT TaskText5/*[opt]*/, 
                                                             VARIANT TaskText6/*[opt]*/, 
                                                             VARIANT TaskText7/*[opt]*/, 
                                                             VARIANT TaskText8/*[opt]*/, 
                                                             VARIANT TaskText9/*[opt]*/, 
                                                             VARIANT TaskText10/*[opt]*/, 
                                                             VARIANT ResourceCode/*[opt]*/, 
                                                             VARIANT ResourceName/*[opt]*/, 
                                                             VARIANT ResourceNotes/*[opt]*/, 
                                                             VARIANT ResourceGroup/*[opt]*/, 
                                                             VARIANT ResourceText1/*[opt]*/, 
                                                             VARIANT ResourceText2/*[opt]*/, 
                                                             VARIANT ResourceText3/*[opt]*/, 
                                                             VARIANT ResourceText4/*[opt]*/, 
                                                             VARIANT ResourceText5/*[opt]*/, 
                                                             VARIANT AssignNotes/*[opt]*/, 
                                                             VARIANT IgnoreUppercase/*[opt]*/, 
                                                             VARIANT IgnoreNumberWords/*[opt]*/, 
                                                             VARIANT AlwaysSuggest/*[opt]*/, 
                                                             VARIANT UseCustomDictionary/*[opt]*/)
{
  return  GetDefaultInterface()->OptionsSpelling(TaskName/*[opt]*/, TaskNotes/*[opt]*/, 
                                                 TaskText1/*[opt]*/, TaskText2/*[opt]*/, 
                                                 TaskText3/*[opt]*/, TaskText4/*[opt]*/, 
                                                 TaskText5/*[opt]*/, TaskText6/*[opt]*/, 
                                                 TaskText7/*[opt]*/, TaskText8/*[opt]*/, 
                                                 TaskText9/*[opt]*/, TaskText10/*[opt]*/, 
                                                 ResourceCode/*[opt]*/, ResourceName/*[opt]*/, 
                                                 ResourceNotes/*[opt]*/, ResourceGroup/*[opt]*/, 
                                                 ResourceText1/*[opt]*/, ResourceText2/*[opt]*/, 
                                                 ResourceText3/*[opt]*/, ResourceText4/*[opt]*/, 
                                                 ResourceText5/*[opt]*/, AssignNotes/*[opt]*/, 
                                                 IgnoreUppercase/*[opt]*/, 
                                                 IgnoreNumberWords/*[opt]*/, AlwaysSuggest/*[opt]*/, 
                                                 UseCustomDictionary/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WindowMoreWindows(void)
{
  return  GetDefaultInterface()->WindowMoreWindows();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpContents(void)
{
  return  GetDefaultInterface()->HelpContents();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpSearch(void)
{
  return  GetDefaultInterface()->HelpSearch();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpOnlineIndex(void)
{
  return  GetDefaultInterface()->HelpOnlineIndex();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpAbout(void)
{
  return  GetDefaultInterface()->HelpAbout();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpLaunch(VARIANT FileName/*[opt]*/, 
                                                        VARIANT ContextNumber/*[opt]*/, 
                                                        VARIANT Search/*[opt]*/, 
                                                        VARIANT SearchKey/*[opt]*/)
{
  return  GetDefaultInterface()->HelpLaunch(FileName/*[opt]*/, ContextNumber/*[opt]*/, 
                                            Search/*[opt]*/, SearchKey/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::HelpCueCards(VARIANT FileName/*[opt]*/, 
                                                          VARIANT ContextNumber/*[opt]*/)
{
  return  GetDefaultInterface()->HelpCueCards(FileName/*[opt]*/, ContextNumber/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::HelpTopics(void)
{
  return  GetDefaultInterface()->HelpTopics();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpAnswerWizard(void)
{
  return  GetDefaultInterface()->HelpAnswerWizard();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpMSProjectFundamentals(void)
{
  return  GetDefaultInterface()->HelpMSProjectFundamentals();
}

VARIANT_BOOL __fastcall TProjectApplication::AutoCorrect(void)
{
  return  GetDefaultInterface()->AutoCorrect();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpQuickPreview(void)
{
  return  GetDefaultInterface()->HelpQuickPreview();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpTechnicalSupport(void)
{
  return  GetDefaultInterface()->HelpTechnicalSupport();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpCreateYourProject(void)
{
  return  GetDefaultInterface()->HelpCreateYourProject();
}

VARIANT_BOOL __fastcall TProjectApplication::HelpContextHelp(void)
{
  return  GetDefaultInterface()->HelpContextHelp();
}

VARIANT_BOOL __fastcall TProjectApplication::TextStyles(VARIANT Item/*[opt]*/, VARIANT Font/*[opt]*/, 
                                                        VARIANT Size/*[opt]*/, VARIANT Bold/*[opt]*/, 
                                                        VARIANT Italic/*[opt]*/, 
                                                        VARIANT Underline/*[opt]*/, 
                                                        VARIANT Color/*[opt]*/)
{
  return  GetDefaultInterface()->TextStyles(Item/*[opt]*/, Font/*[opt]*/, Size/*[opt]*/, 
                                            Bold/*[opt]*/, Italic/*[opt]*/, Underline/*[opt]*/, 
                                            Color/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DetailStylesFormat(VARIANT Item/*[opt]*/, 
                                                                VARIANT Font/*[opt]*/, 
                                                                VARIANT Size/*[opt]*/, 
                                                                VARIANT Bold/*[opt]*/, 
                                                                VARIANT Italic/*[opt]*/, 
                                                                VARIANT Underline/*[opt]*/, 
                                                                VARIANT Color/*[opt]*/, 
                                                                VARIANT CellColor/*[opt]*/, 
                                                                VARIANT Pattern/*[opt]*/, 
                                                                VARIANT ShowInMenu/*[opt]*/)
{
  return  GetDefaultInterface()->DetailStylesFormat(Item/*[opt]*/, Font/*[opt]*/, Size/*[opt]*/, 
                                                    Bold/*[opt]*/, Italic/*[opt]*/, 
                                                    Underline/*[opt]*/, Color/*[opt]*/, 
                                                    CellColor/*[opt]*/, Pattern/*[opt]*/, 
                                                    ShowInMenu/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DetailStylesAdd(Msproject_2k::PjTimescaledData Item/*[def,opt]*/, 
                                                             VARIANT Position/*[opt]*/)
{
  return  GetDefaultInterface()->DetailStylesAdd(Item/*[def,opt]*/, Position/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DetailStylesRemove(Msproject_2k::PjTimescaledData Item/*[def,opt]*/)
{
  return  GetDefaultInterface()->DetailStylesRemove(Item/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DetailStylesRemoveAll(void)
{
  return  GetDefaultInterface()->DetailStylesRemoveAll();
}

VARIANT_BOOL __fastcall TProjectApplication::Font(VARIANT Name/*[opt]*/, VARIANT Size/*[opt]*/, 
                                                  VARIANT Bold/*[opt]*/, VARIANT Italic/*[opt]*/, 
                                                  VARIANT Underline/*[opt]*/, VARIANT Color/*[opt]*/, 
                                                  VARIANT Reset/*[opt]*/)
{
  return  GetDefaultInterface()->Font(Name/*[opt]*/, Size/*[opt]*/, Bold/*[opt]*/, Italic/*[opt]*/, 
                                      Underline/*[opt]*/, Color/*[opt]*/, Reset/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Timescale(void)
{
  return  GetDefaultInterface()->Timescale();
}

VARIANT_BOOL __fastcall TProjectApplication::TimescaleEdit(VARIANT MajorUnits/*[opt]*/, 
                                                           VARIANT MinorUnits/*[opt]*/, 
                                                           VARIANT MajorLabel/*[opt]*/, 
                                                           VARIANT MinorLabel/*[opt]*/, 
                                                           VARIANT MajorAlign/*[opt]*/, 
                                                           VARIANT MinorAlign/*[opt]*/, 
                                                           VARIANT MajorCount/*[opt]*/, 
                                                           VARIANT MinorCount/*[opt]*/, 
                                                           VARIANT MajorTicks/*[opt]*/, 
                                                           VARIANT MinorTicks/*[opt]*/, 
                                                           VARIANT Enlarge/*[opt]*/, 
                                                           VARIANT Separator/*[opt]*/, 
                                                           VARIANT MajorUseFY/*[opt]*/, 
                                                           VARIANT MinorUseFY/*[opt]*/)
{
  return  GetDefaultInterface()->TimescaleEdit(MajorUnits/*[opt]*/, MinorUnits/*[opt]*/, 
                                               MajorLabel/*[opt]*/, MinorLabel/*[opt]*/, 
                                               MajorAlign/*[opt]*/, MinorAlign/*[opt]*/, 
                                               MajorCount/*[opt]*/, MinorCount/*[opt]*/, 
                                               MajorTicks/*[opt]*/, MinorTicks/*[opt]*/, 
                                               Enlarge/*[opt]*/, Separator/*[opt]*/, 
                                               MajorUseFY/*[opt]*/, MinorUseFY/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Sort(VARIANT Key1/*[opt]*/, VARIANT Ascending1/*[opt]*/, 
                                                  VARIANT Key2/*[opt]*/, VARIANT Ascending2/*[opt]*/, 
                                                  VARIANT Key3/*[opt]*/, VARIANT Ascending3/*[opt]*/, 
                                                  VARIANT Renumber/*[opt]*/, 
                                                  VARIANT Outline/*[opt]*/)
{
  return  GetDefaultInterface()->Sort(Key1/*[opt]*/, Ascending1/*[opt]*/, Key2/*[opt]*/, 
                                      Ascending2/*[opt]*/, Key3/*[opt]*/, Ascending3/*[opt]*/, 
                                      Renumber/*[opt]*/, Outline/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BarBoxStyles(void)
{
  return  GetDefaultInterface()->BarBoxStyles();
}

VARIANT_BOOL __fastcall TProjectApplication::GanttBarFormat(VARIANT TaskID/*[opt]*/, 
                                                            VARIANT GanttStyle/*[opt]*/, 
                                                            VARIANT StartShape/*[opt]*/, 
                                                            VARIANT StartType/*[opt]*/, 
                                                            VARIANT StartColor/*[opt]*/, 
                                                            VARIANT MiddleShape/*[opt]*/, 
                                                            VARIANT MiddlePattern/*[opt]*/, 
                                                            VARIANT MiddleColor/*[opt]*/, 
                                                            VARIANT EndShape/*[opt]*/, 
                                                            VARIANT EndType/*[opt]*/, 
                                                            VARIANT EndColor/*[opt]*/, 
                                                            VARIANT LeftText/*[opt]*/, 
                                                            VARIANT RightText/*[opt]*/, 
                                                            VARIANT TopText/*[opt]*/, 
                                                            VARIANT BottomText/*[opt]*/, 
                                                            VARIANT InsideText/*[opt]*/, 
                                                            VARIANT Reset/*[opt]*/, 
                                                            VARIANT ProjectName/*[opt]*/)
{
  return  GetDefaultInterface()->GanttBarFormat(TaskID/*[opt]*/, GanttStyle/*[opt]*/, 
                                                StartShape/*[opt]*/, StartType/*[opt]*/, 
                                                StartColor/*[opt]*/, MiddleShape/*[opt]*/, 
                                                MiddlePattern/*[opt]*/, MiddleColor/*[opt]*/, 
                                                EndShape/*[opt]*/, EndType/*[opt]*/, 
                                                EndColor/*[opt]*/, LeftText/*[opt]*/, 
                                                RightText/*[opt]*/, TopText/*[opt]*/, 
                                                BottomText/*[opt]*/, InsideText/*[opt]*/, 
                                                Reset/*[opt]*/, ProjectName/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::TimescaleNonWorking(VARIANT Draw/*[opt]*/, 
                                                                 VARIANT Calendar/*[opt]*/, 
                                                                 VARIANT Color/*[opt]*/, 
                                                                 VARIANT Pattern/*[opt]*/)
{
  return  GetDefaultInterface()->TimescaleNonWorking(Draw/*[opt]*/, Calendar/*[opt]*/, 
                                                     Color/*[opt]*/, Pattern/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxShowHideFields(VARIANT Show/*[opt]*/)
{
  return  GetDefaultInterface()->BoxShowHideFields(Show/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Layout(void)
{
  return  GetDefaultInterface()->Layout();
}

VARIANT_BOOL __fastcall TProjectApplication::PERTLayout(VARIANT Straight/*[opt]*/, 
                                                        VARIANT DisplayArrows/*[opt]*/, 
                                                        VARIANT AdjustForPageBreaks/*[opt]*/, 
                                                        VARIANT DisplayPageBreaks/*[opt]*/)
{
  return  GetDefaultInterface()->PERTLayout(Straight/*[opt]*/, DisplayArrows/*[opt]*/, 
                                            AdjustForPageBreaks/*[opt]*/, DisplayPageBreaks/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::LayoutNow(void)
{
  return  GetDefaultInterface()->LayoutNow();
}

VARIANT_BOOL __fastcall TProjectApplication::PERTBorders(VARIANT CriticalStyle/*[opt]*/, 
                                                         VARIANT CriticalColor/*[opt]*/, 
                                                         VARIANT NoncriticalStyle/*[opt]*/, 
                                                         VARIANT NoncriticalColor/*[opt]*/, 
                                                         VARIANT CriticalMilestoneStyle/*[opt]*/, 
                                                         VARIANT CriticalMilestoneColor/*[opt]*/, 
                                                         VARIANT NoncriticalMilestoneStyle/*[opt]*/, 
                                                         VARIANT NoncriticalMilestoneColor/*[opt]*/, 
                                                         VARIANT CriticalSummaryStyle/*[opt]*/, 
                                                         VARIANT CriticalSummaryColor/*[opt]*/, 
                                                         VARIANT NoncriticalSummaryStyle/*[opt]*/, 
                                                         VARIANT NoncriticalSummaryColor/*[opt]*/, 
                                                         VARIANT CriticalSubprojectStyle/*[opt]*/, 
                                                         VARIANT CriticalSubprojectColor/*[opt]*/, 
                                                         VARIANT NoncriticalSubprojectStyle/*[opt]*/, 
                                                         VARIANT NoncriticalSubprojectColor/*[opt]*/, 
                                                         VARIANT CriticalMarkedStyle/*[opt]*/, 
                                                         VARIANT CriticalMarkedColor/*[opt]*/, 
                                                         VARIANT NoncriticalMarkedStyle/*[opt]*/, 
                                                         VARIANT NoncriticalMarkedColor/*[opt]*/, 
                                                         VARIANT CriticalExternalTaskStyle/*[opt]*/, 
                                                         VARIANT CriticalExternalTaskColor/*[opt]*/, 
                                                         VARIANT NoncriticalExternalTaskStyle/*[opt]*/, 
                                                         VARIANT NoncriticalExternalTaskColor/*[opt]*/)
{
  return  GetDefaultInterface()->PERTBorders(CriticalStyle/*[opt]*/, CriticalColor/*[opt]*/, 
                                             NoncriticalStyle/*[opt]*/, NoncriticalColor/*[opt]*/, 
                                             CriticalMilestoneStyle/*[opt]*/, 
                                             CriticalMilestoneColor/*[opt]*/, 
                                             NoncriticalMilestoneStyle/*[opt]*/, 
                                             NoncriticalMilestoneColor/*[opt]*/, 
                                             CriticalSummaryStyle/*[opt]*/, 
                                             CriticalSummaryColor/*[opt]*/, 
                                             NoncriticalSummaryStyle/*[opt]*/, 
                                             NoncriticalSummaryColor/*[opt]*/, 
                                             CriticalSubprojectStyle/*[opt]*/, 
                                             CriticalSubprojectColor/*[opt]*/, 
                                             NoncriticalSubprojectStyle/*[opt]*/, 
                                             NoncriticalSubprojectColor/*[opt]*/, 
                                             CriticalMarkedStyle/*[opt]*/, 
                                             CriticalMarkedColor/*[opt]*/, 
                                             NoncriticalMarkedStyle/*[opt]*/, 
                                             NoncriticalMarkedColor/*[opt]*/, 
                                             CriticalExternalTaskStyle/*[opt]*/, 
                                             CriticalExternalTaskColor/*[opt]*/, 
                                             NoncriticalExternalTaskStyle/*[opt]*/, 
                                             NoncriticalExternalTaskColor/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Gridlines(void)
{
  return  GetDefaultInterface()->Gridlines();
}

VARIANT_BOOL __fastcall TProjectApplication::GridlinesEdit(Msproject_2k::PjGridline Item, 
                                                           VARIANT NormalType/*[opt]*/, 
                                                           VARIANT NormalColor/*[opt]*/, 
                                                           VARIANT Interval/*[opt]*/, 
                                                           VARIANT IntervalType/*[opt]*/, 
                                                           VARIANT IntervalColor/*[opt]*/)
{
  return  GetDefaultInterface()->GridlinesEdit(Item, NormalType/*[opt]*/, NormalColor/*[opt]*/, 
                                               Interval/*[opt]*/, IntervalType/*[opt]*/, 
                                               IntervalColor/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowSelectedTasks(VARIANT Show/*[opt]*/)
{
  return  GetDefaultInterface()->ViewShowSelectedTasks(Show/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::PageBreaksShow(VARIANT Show/*[opt]*/)
{
  return  GetDefaultInterface()->PageBreaksShow(Show/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FindNext(void)
{
  return  GetDefaultInterface()->FindNext();
}

VARIANT_BOOL __fastcall TProjectApplication::FindPrevious(void)
{
  return  GetDefaultInterface()->FindPrevious();
}

VARIANT_BOOL __fastcall TProjectApplication::ZoomOut(void)
{
  return  GetDefaultInterface()->ZoomOut();
}

VARIANT_BOOL __fastcall TProjectApplication::ZoomIn(void)
{
  return  GetDefaultInterface()->ZoomIn();
}

VARIANT_BOOL __fastcall TProjectApplication::SetField(BSTR Field, BSTR Value, 
                                                      VARIANT Create/*[opt]*/)
{
  return  GetDefaultInterface()->SetField(Field, Value, Create/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SetTaskField(BSTR Field, BSTR Value, 
                                                          VARIANT AllSelectedTasks/*[opt]*/, 
                                                          VARIANT Create/*[opt]*/, 
                                                          VARIANT TaskID/*[opt]*/, 
                                                          VARIANT ProjectName/*[opt]*/)
{
  return  GetDefaultInterface()->SetTaskField(Field, Value, AllSelectedTasks/*[opt]*/, 
                                              Create/*[opt]*/, TaskID/*[opt]*/, ProjectName/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SetResourceField(BSTR Field, BSTR Value, 
                                                              VARIANT AllSelectedResources/*[opt]*/, 
                                                              VARIANT Create/*[opt]*/, 
                                                              VARIANT ResourceID/*[opt]*/, 
                                                              VARIANT ProjectName/*[opt]*/)
{
  return  GetDefaultInterface()->SetResourceField(Field, Value, AllSelectedResources/*[opt]*/, 
                                                  Create/*[opt]*/, ResourceID/*[opt]*/, 
                                                  ProjectName/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SetActiveCell(BSTR Value, VARIANT Create/*[opt]*/)
{
  return  GetDefaultInterface()->SetActiveCell(Value, Create/*[opt]*/);
}

VARIANT __fastcall TProjectApplication::CheckField(BSTR Field, BSTR Value, VARIANT Test/*[opt]*/, 
                                                   VARIANT Op/*[opt]*/, VARIANT Field2/*[opt]*/, 
                                                   VARIANT Value2/*[opt]*/, VARIANT Test2/*[opt]*/)
{
  return  GetDefaultInterface()->CheckField(Field, Value, Test/*[opt]*/, Op/*[opt]*/, 
                                            Field2/*[opt]*/, Value2/*[opt]*/, Test2/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SetMatchingField(BSTR Field, BSTR Value, 
                                                              BSTR CheckField, BSTR CheckValue, 
                                                              VARIANT CheckTest/*[opt]*/, 
                                                              VARIANT CheckOperation/*[opt]*/, 
                                                              VARIANT CheckField2/*[opt]*/, 
                                                              VARIANT CheckValue2/*[opt]*/, 
                                                              VARIANT CheckTest2/*[opt]*/)
{
  return  GetDefaultInterface()->SetMatchingField(Field, Value, CheckField, CheckValue, 
                                                  CheckTest/*[opt]*/, CheckOperation/*[opt]*/, 
                                                  CheckField2/*[opt]*/, CheckValue2/*[opt]*/, 
                                                  CheckTest2/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::AppExecute(VARIANT Window/*[opt]*/, 
                                                        VARIANT Command/*[opt]*/, 
                                                        VARIANT Minimize/*[opt]*/, 
                                                        VARIANT Activate/*[opt]*/)
{
  return  GetDefaultInterface()->AppExecute(Window/*[opt]*/, Command/*[opt]*/, Minimize/*[opt]*/, 
                                            Activate/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::AppLaunch(BSTR Application, VARIANT Document/*[opt]*/, 
                                                       VARIANT Activate/*[opt]*/)
{
  return  GetDefaultInterface()->AppLaunch(Application, Document/*[opt]*/, Activate/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DDELinksUpdate(void)
{
  return  GetDefaultInterface()->DDELinksUpdate();
}

VARIANT_BOOL __fastcall TProjectApplication::GotoTaskDates(void)
{
  return  GetDefaultInterface()->GotoTaskDates();
}

VARIANT_BOOL __fastcall TProjectApplication::GanttBarLinks(Msproject_2k::PjGanttBarLink Display/*[def,opt]*/)
{
  return  GetDefaultInterface()->GanttBarLinks(Display/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::GanttShowDrawings(VARIANT Display/*[opt]*/)
{
  return  GetDefaultInterface()->GanttShowDrawings(Display/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BarRounding(VARIANT On/*[opt]*/)
{
  return  GetDefaultInterface()->BarRounding(On/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::GanttRollup(VARIANT AlwaysRollup/*[opt]*/, 
                                                         VARIANT HideWhenSummaryExpanded/*[opt]*/)
{
  return  GetDefaultInterface()->GanttRollup(AlwaysRollup/*[opt]*/, HideWhenSummaryExpanded/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::GanttBarTextDateFormat(Msproject_2k::PjDateFormat DateFormat)
{
  return  GetDefaultInterface()->GanttBarTextDateFormat(DateFormat);
}

VARIANT_BOOL __fastcall TProjectApplication::GanttBarSize(Msproject_2k::PjBarSize Size)
{
  return  GetDefaultInterface()->GanttBarSize(Size);
}

VARIANT_BOOL __fastcall TProjectApplication::GanttBarStyleDelete(BSTR Item)
{
  return  GetDefaultInterface()->GanttBarStyleDelete(Item);
}

VARIANT_BOOL __fastcall TProjectApplication::GanttBarStyleEdit(BSTR Item, VARIANT Create/*[opt]*/, 
                                                               VARIANT Name/*[opt]*/, 
                                                               VARIANT StartShape/*[opt]*/, 
                                                               VARIANT StartType/*[opt]*/, 
                                                               VARIANT StartColor/*[opt]*/, 
                                                               VARIANT MiddleShape/*[opt]*/, 
                                                               VARIANT MiddleColor/*[opt]*/, 
                                                               VARIANT MiddlePattern/*[opt]*/, 
                                                               VARIANT EndShape/*[opt]*/, 
                                                               VARIANT EndType/*[opt]*/, 
                                                               VARIANT EndColor/*[opt]*/, 
                                                               VARIANT ShowFor/*[opt]*/, 
                                                               VARIANT Row/*[opt]*/, 
                                                               VARIANT From/*[opt]*/, 
                                                               VARIANT To/*[opt]*/, 
                                                               VARIANT BottomText/*[opt]*/, 
                                                               VARIANT TopText/*[opt]*/, 
                                                               VARIANT LeftText/*[opt]*/, 
                                                               VARIANT RightText/*[opt]*/, 
                                                               VARIANT InsideText/*[opt]*/)
{
  return  GetDefaultInterface()->GanttBarStyleEdit(Item, Create/*[opt]*/, Name/*[opt]*/, 
                                                   StartShape/*[opt]*/, StartType/*[opt]*/, 
                                                   StartColor/*[opt]*/, MiddleShape/*[opt]*/, 
                                                   MiddleColor/*[opt]*/, MiddlePattern/*[opt]*/, 
                                                   EndShape/*[opt]*/, EndType/*[opt]*/, 
                                                   EndColor/*[opt]*/, ShowFor/*[opt]*/, Row/*[opt]*/, 
                                                   From/*[opt]*/, To/*[opt]*/, BottomText/*[opt]*/, 
                                                   TopText/*[opt]*/, LeftText/*[opt]*/, 
                                                   RightText/*[opt]*/, InsideText/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::PERTBoxStyles(VARIANT Size/*[opt]*/, 
                                                           VARIANT DateFormat/*[opt]*/, 
                                                           VARIANT Gridlines/*[opt]*/, 
                                                           VARIANT CrossMarks/*[opt]*/, 
                                                           VARIANT Field1/*[opt]*/, 
                                                           VARIANT Field2/*[opt]*/, 
                                                           VARIANT Field3/*[opt]*/, 
                                                           VARIANT Field4/*[opt]*/, 
                                                           VARIANT Field5/*[opt]*/)
{
  return  GetDefaultInterface()->PERTBoxStyles(Size/*[opt]*/, DateFormat/*[opt]*/, 
                                               Gridlines/*[opt]*/, CrossMarks/*[opt]*/, 
                                               Field1/*[opt]*/, Field2/*[opt]*/, Field3/*[opt]*/, 
                                               Field4/*[opt]*/, Field5/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::PERTSetTask(VARIANT Create/*[opt]*/, 
                                                         VARIANT Move/*[opt]*/, 
                                                         VARIANT TaskID/*[opt]*/, 
                                                         VARIANT XPosition/*[opt]*/, 
                                                         VARIANT YPosition/*[opt]*/)
{
  return  GetDefaultInterface()->PERTSetTask(Create/*[opt]*/, Move/*[opt]*/, TaskID/*[opt]*/, 
                                             XPosition/*[opt]*/, YPosition/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceGraphBarStyles(VARIANT TopLeftShowAs/*[opt]*/, 
                                                                    VARIANT TopLeftColor/*[opt]*/, 
                                                                    VARIANT TopLeftPattern/*[opt]*/, 
                                                                    VARIANT BottomLeftShowAs/*[opt]*/, 
                                                                    VARIANT BottomLeftColor/*[opt]*/, 
                                                                    VARIANT BottomLeftPattern/*[opt]*/, 
                                                                    VARIANT TopRightShowAs/*[opt]*/, 
                                                                    VARIANT TopRightColor/*[opt]*/, 
                                                                    VARIANT TopRightPattern/*[opt]*/, 
                                                                    VARIANT BottomRightShowAs/*[opt]*/, 
                                                                    VARIANT BottomRightColor/*[opt]*/, 
                                                                    VARIANT BottomRightPattern/*[opt]*/, 
                                                                    VARIANT ShowValues/*[opt]*/, 
                                                                    VARIANT ShowAvailabilityLine/*[opt]*/, 
                                                                    VARIANT PercentBarOverlap/*[opt]*/)
{
  return  GetDefaultInterface()->ResourceGraphBarStyles(TopLeftShowAs/*[opt]*/, 
                                                        TopLeftColor/*[opt]*/, 
                                                        TopLeftPattern/*[opt]*/, 
                                                        BottomLeftShowAs/*[opt]*/, 
                                                        BottomLeftColor/*[opt]*/, 
                                                        BottomLeftPattern/*[opt]*/, 
                                                        TopRightShowAs/*[opt]*/, 
                                                        TopRightColor/*[opt]*/, 
                                                        TopRightPattern/*[opt]*/, 
                                                        BottomRightShowAs/*[opt]*/, 
                                                        BottomRightColor/*[opt]*/, 
                                                        BottomRightPattern/*[opt]*/, 
                                                        ShowValues/*[opt]*/, 
                                                        ShowAvailabilityLine/*[opt]*/, 
                                                        PercentBarOverlap/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ConsolidateProjects(VARIANT Filenames/*[opt]*/, 
                                                                 VARIANT NewWindow/*[opt]*/, 
                                                                 VARIANT AttachToSources/*[opt]*/, 
                                                                 VARIANT PoolResources/*[opt]*/, 
                                                                 VARIANT HideSubtasks/*[opt]*/, 
                                                                 Msproject_2k::PjPoolOpen openPool/*[def,opt]*/, 
                                                                 VARIANT UserID/*[opt]*/, 
                                                                 VARIANT Password/*[opt]*/)
{
  return  GetDefaultInterface()->ConsolidateProjects(Filenames/*[opt]*/, NewWindow/*[opt]*/, 
                                                     AttachToSources/*[opt]*/, 
                                                     PoolResources/*[opt]*/, HideSubtasks/*[opt]*/, 
                                                     openPool/*[def,opt]*/, UserID/*[opt]*/, 
                                                     Password/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Organizer(Msproject_2k::PjOrganizer Type/*[def,opt]*/, 
                                                       VARIANT Task/*[opt]*/)
{
  return  GetDefaultInterface()->Organizer(Type/*[def,opt]*/, Task/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OrganizerMoveItem(VARIANT Type/*[opt]*/, 
                                                               VARIANT FileName/*[opt]*/, 
                                                               VARIANT ToFileName/*[opt]*/, 
                                                               VARIANT Name/*[opt]*/, 
                                                               VARIANT Task/*[opt]*/)
{
  return  GetDefaultInterface()->OrganizerMoveItem(Type/*[opt]*/, FileName/*[opt]*/, 
                                                   ToFileName/*[opt]*/, Name/*[opt]*/, Task/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OrganizerDeleteItem(VARIANT Type/*[opt]*/, 
                                                                 VARIANT FileName/*[opt]*/, 
                                                                 VARIANT Name/*[opt]*/, 
                                                                 VARIANT Task/*[opt]*/)
{
  return  GetDefaultInterface()->OrganizerDeleteItem(Type/*[opt]*/, FileName/*[opt]*/, Name/*[opt]*/, 
                                                     Task/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OrganizerRenameItem(VARIANT Type/*[opt]*/, 
                                                                 VARIANT FileName/*[opt]*/, 
                                                                 VARIANT Name/*[opt]*/, 
                                                                 VARIANT NewName/*[opt]*/, 
                                                                 VARIANT Task/*[opt]*/)
{
  return  GetDefaultInterface()->OrganizerRenameItem(Type/*[opt]*/, FileName/*[opt]*/, Name/*[opt]*/, 
                                                     NewName/*[opt]*/, Task/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::RecurringTaskInsert(void)
{
  return  GetDefaultInterface()->RecurringTaskInsert();
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarTimescale(void)
{
  return  GetDefaultInterface()->CalendarTimescale();
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarDateBoxes(VARIANT TopLeft/*[opt]*/, 
                                                               VARIANT TopRight/*[opt]*/, 
                                                               VARIANT BottomLeft/*[opt]*/, 
                                                               VARIANT BottomRight/*[opt]*/, 
                                                               VARIANT TopColor/*[opt]*/, 
                                                               VARIANT BottomColor/*[opt]*/, 
                                                               VARIANT TopPattern/*[opt]*/, 
                                                               VARIANT BottomPattern/*[opt]*/)
{
  return  GetDefaultInterface()->CalendarDateBoxes(TopLeft/*[opt]*/, TopRight/*[opt]*/, 
                                                   BottomLeft/*[opt]*/, BottomRight/*[opt]*/, 
                                                   TopColor/*[opt]*/, BottomColor/*[opt]*/, 
                                                   TopPattern/*[opt]*/, BottomPattern/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarWeekHeadings(VARIANT MonthTitle/*[opt]*/, 
                                                                  VARIANT WeekTitle/*[opt]*/, 
                                                                  VARIANT DayTitle/*[opt]*/, 
                                                                  VARIANT ShowPreview/*[opt]*/, 
                                                                  VARIANT DaysPerWeek/*[opt]*/)
{
  return  GetDefaultInterface()->CalendarWeekHeadings(MonthTitle/*[opt]*/, WeekTitle/*[opt]*/, 
                                                      DayTitle/*[opt]*/, ShowPreview/*[opt]*/, 
                                                      DaysPerWeek/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarDateShadingEdit(Msproject_2k::PjCalendarShading Item, 
                                                                     VARIANT Pattern/*[opt]*/, 
                                                                     VARIANT Color/*[opt]*/)
{
  return  GetDefaultInterface()->CalendarDateShadingEdit(Item, Pattern/*[opt]*/, Color/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarDateShading(VARIANT BaseCalendarName/*[opt]*/, 
                                                                 VARIANT ResourceUniqueID/*[opt]*/, 
                                                                 VARIANT ProjectIndex/*[opt]*/)
{
  return  GetDefaultInterface()->CalendarDateShading(BaseCalendarName/*[opt]*/, 
                                                     ResourceUniqueID/*[opt]*/, 
                                                     ProjectIndex/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ZoomCalendar(VARIANT NumWeeks/*[opt]*/, 
                                                          VARIANT StartDate/*[opt]*/, 
                                                          VARIANT EndDate/*[opt]*/)
{
  return  GetDefaultInterface()->ZoomCalendar(NumWeeks/*[opt]*/, StartDate/*[opt]*/, 
                                              EndDate/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarLayout(VARIANT SortOrder/*[opt]*/, 
                                                            VARIANT AutoLayout/*[opt]*/)
{
  return  GetDefaultInterface()->CalendarLayout(SortOrder/*[opt]*/, AutoLayout/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarBarStyles(VARIANT BarRounding/*[opt]*/)
{
  return  GetDefaultInterface()->CalendarBarStyles(BarRounding/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarBarStylesEdit(Msproject_2k::PjBarItem Item, 
                                                                   VARIANT Bar/*[opt]*/, 
                                                                   VARIANT Pattern/*[opt]*/, 
                                                                   VARIANT Color/*[opt]*/, 
                                                                   VARIANT Align/*[opt]*/, 
                                                                   VARIANT Wrap/*[opt]*/, 
                                                                   VARIANT Shadow/*[opt]*/, 
                                                                   VARIANT Field1/*[opt]*/, 
                                                                   VARIANT Field2/*[opt]*/, 
                                                                   VARIANT Field3/*[opt]*/, 
                                                                   VARIANT Field4/*[opt]*/, 
                                                                   VARIANT Field5/*[opt]*/, 
                                                                   VARIANT SplitPattern/*[opt]*/)
{
  return  GetDefaultInterface()->CalendarBarStylesEdit(Item, Bar/*[opt]*/, Pattern/*[opt]*/, 
                                                       Color/*[opt]*/, Align/*[opt]*/, Wrap/*[opt]*/, 
                                                       Shadow/*[opt]*/, Field1/*[opt]*/, 
                                                       Field2/*[opt]*/, Field3/*[opt]*/, 
                                                       Field4/*[opt]*/, Field5/*[opt]*/, 
                                                       SplitPattern/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarBestFitWeekHeight(void)
{
  return  GetDefaultInterface()->CalendarBestFitWeekHeight();
}

VARIANT_BOOL __fastcall TProjectApplication::DrawingCreate(Msproject_2k::PjShape Type, 
                                                           VARIANT Behind/*[opt]*/)
{
  return  GetDefaultInterface()->DrawingCreate(Type, Behind/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DrawingMove(VARIANT Forward/*[opt]*/, 
                                                         VARIANT Full/*[opt]*/)
{
  return  GetDefaultInterface()->DrawingMove(Forward/*[opt]*/, Full/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DrawingReshape(void)
{
  return  GetDefaultInterface()->DrawingReshape();
}

VARIANT_BOOL __fastcall TProjectApplication::DrawingProperties(VARIANT SizePositionTab/*[opt]*/)
{
  return  GetDefaultInterface()->DrawingProperties(SizePositionTab/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DrawingCycleColor(void)
{
  return  GetDefaultInterface()->DrawingCycleColor();
}

VARIANT_BOOL __fastcall TProjectApplication::FormatCopy(void)
{
  return  GetDefaultInterface()->FormatCopy();
}

VARIANT_BOOL __fastcall TProjectApplication::FormatPaste(void)
{
  return  GetDefaultInterface()->FormatPaste();
}

VARIANT_BOOL __fastcall TProjectApplication::FormatPainter(void)
{
  return  GetDefaultInterface()->FormatPainter();
}

VARIANT_BOOL __fastcall TProjectApplication::Toolbars(VARIANT Action/*[opt]*/, 
                                                      VARIANT ToolbarName/*[opt]*/, 
                                                      VARIANT NewToolbarName/*[opt]*/)
{
  return  GetDefaultInterface()->Toolbars(Action/*[opt]*/, ToolbarName/*[opt]*/, 
                                          NewToolbarName/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ToolbarInsertTool(BSTR ToolbarName, short ButtonIndex, 
                                                               VARIANT Command/*[opt]*/, 
                                                               VARIANT FaceIndex/*[opt]*/, 
                                                               VARIANT Description/*[opt]*/, 
                                                               VARIANT ToolTip/*[opt]*/)
{
  return  GetDefaultInterface()->ToolbarInsertTool(ToolbarName, ButtonIndex, Command/*[opt]*/, 
                                                   FaceIndex/*[opt]*/, Description/*[opt]*/, 
                                                   ToolTip/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ToolbarDeleteTool(BSTR ToolbarName, short ButtonIndex)
{
  return  GetDefaultInterface()->ToolbarDeleteTool(ToolbarName, ButtonIndex);
}

VARIANT_BOOL __fastcall TProjectApplication::ToolbarsCustomize(void)
{
  return  GetDefaultInterface()->ToolbarsCustomize();
}

VARIANT_BOOL __fastcall TProjectApplication::ToolbarCustomizeTool(VARIANT ToolbarName/*[opt]*/, 
                                                                  VARIANT ButtonIndex/*[opt]*/, 
                                                                  VARIANT Command/*[opt]*/, 
                                                                  VARIANT FaceIndex/*[opt]*/, 
                                                                  VARIANT Description/*[opt]*/, 
                                                                  VARIANT ToolTip/*[opt]*/)
{
  return  GetDefaultInterface()->ToolbarCustomizeTool(ToolbarName/*[opt]*/, ButtonIndex/*[opt]*/, 
                                                      Command/*[opt]*/, FaceIndex/*[opt]*/, 
                                                      Description/*[opt]*/, ToolTip/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ToolbarCopyToolFace(BSTR ToolbarName, short ButtonIndex)
{
  return  GetDefaultInterface()->ToolbarCopyToolFace(ToolbarName, ButtonIndex);
}

VARIANT_BOOL __fastcall TProjectApplication::ToolbarPasteToolFace(BSTR ToolbarName, 
                                                                  short ButtonIndex)
{
  return  GetDefaultInterface()->ToolbarPasteToolFace(ToolbarName, ButtonIndex);
}

VARIANT_BOOL __fastcall TProjectApplication::FontBold(VARIANT Set_/*[opt]*/)
{
  return  GetDefaultInterface()->FontBold(Set_/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FontItalic(VARIANT Set_/*[opt]*/)
{
  return  GetDefaultInterface()->FontItalic(Set_/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FontUnderLine(VARIANT Set_/*[opt]*/)
{
  return  GetDefaultInterface()->FontUnderLine(Set_/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ColumnAlignment(Msproject_2k::PjAlignment Align)
{
  return  GetDefaultInterface()->ColumnAlignment(Align);
}

VARIANT_BOOL __fastcall TProjectApplication::Reports(void)
{
  return  GetDefaultInterface()->Reports();
}

VARIANT_BOOL __fastcall TProjectApplication::TipOfTheDay(void)
{
  return  GetDefaultInterface()->TipOfTheDay();
}

VARIANT_BOOL __fastcall TProjectApplication::FindFile(void)
{
  return  GetDefaultInterface()->FindFile();
}

VARIANT_BOOL __fastcall TProjectApplication::MailUpdateProject(BSTR DataFile)
{
  return  GetDefaultInterface()->MailUpdateProject(DataFile);
}

VARIANT_BOOL __fastcall TProjectApplication::MailSendProjectMail(VARIANT MessageType/*[opt]*/, 
                                                                 VARIANT Subject/*[opt]*/, 
                                                                 VARIANT Body/*[opt]*/, 
                                                                 VARIANT Fields/*[opt]*/, 
                                                                 VARIANT UpdateAsOf/*[opt]*/, 
                                                                 VARIANT ShowDialog/*[opt]*/, 
                                                                 VARIANT InstallationMessage/*[opt]*/, 
                                                                 VARIANT UpdateFrom/*[opt]*/)
{
  return  GetDefaultInterface()->MailSendProjectMail(MessageType/*[opt]*/, Subject/*[opt]*/, 
                                                     Body/*[opt]*/, Fields/*[opt]*/, 
                                                     UpdateAsOf/*[opt]*/, ShowDialog/*[opt]*/, 
                                                     InstallationMessage/*[opt]*/, 
                                                     UpdateFrom/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WebInbox(void)
{
  return  GetDefaultInterface()->WebInbox();
}

VARIANT_BOOL __fastcall TProjectApplication::GanttChartWizard(void)
{
  return  GetDefaultInterface()->GanttChartWizard();
}

VARIANT_BOOL __fastcall TProjectApplication::DrawingToolbarShow(void)
{
  return  GetDefaultInterface()->DrawingToolbarShow();
}

VARIANT_BOOL __fastcall TProjectApplication::ReminderSet(VARIANT Start/*[opt]*/, 
                                                         VARIANT LeadTime/*[opt]*/)
{
  return  GetDefaultInterface()->ReminderSet(Start/*[opt]*/, LeadTime/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SchedulePlusReminderSet(VARIANT Start/*[opt]*/, 
                                                                     VARIANT LeadTime/*[opt]*/)
{
  return  GetDefaultInterface()->SchedulePlusReminderSet(Start/*[opt]*/, LeadTime/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarTaskList(VARIANT Date/*[opt]*/)
{
  return  GetDefaultInterface()->CalendarTaskList(Date/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OutlineSymbolsToggle(VARIANT Show/*[opt]*/)
{
  return  GetDefaultInterface()->OutlineSymbolsToggle(Show/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceSharingPoolAction(Msproject_2k::PjPoolAction Action, 
                                                                       VARIANT FileName/*[opt]*/, 
                                                                       VARIANT ReadOnly/*[opt]*/)
{
  return  GetDefaultInterface()->ResourceSharingPoolAction(Action, FileName/*[opt]*/, 
                                                           ReadOnly/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceAddressBook(void)
{
  return  GetDefaultInterface()->ResourceAddressBook();
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceDetails(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->ResourceDetails(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::MailProjectMailCustomize(VARIANT Action/*[opt]*/, 
                                                                      VARIANT Position/*[opt]*/, 
                                                                      VARIANT FieldID/*[opt]*/, 
                                                                      VARIANT Title/*[opt]*/, 
                                                                      VARIANT IncludeInTeamStatus/*[opt]*/, 
                                                                      VARIANT Editable/*[opt]*/)
{
  return  GetDefaultInterface()->MailProjectMailCustomize(Action/*[opt]*/, Position/*[opt]*/, 
                                                          FieldID/*[opt]*/, Title/*[opt]*/, 
                                                          IncludeInTeamStatus/*[opt]*/, 
                                                          Editable/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FileQuit(Msproject_2k::PjSaveType Save/*[def,opt]*/)
{
  return  GetDefaultInterface()->FileQuit(Save/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::About(void)
{
  return  GetDefaultInterface()->About();
}

VARIANT_BOOL __fastcall TProjectApplication::DetailStylesProperties(VARIANT AlignCellData/*[opt]*/, 
                                                                    VARIANT RepeatRowLabel/*[opt]*/, 
                                                                    VARIANT ShortLabels/*[opt]*/, 
                                                                    VARIANT DisplayDetailsColumn/*[opt]*/)
{
  return  GetDefaultInterface()->DetailStylesProperties(AlignCellData/*[opt]*/, 
                                                        RepeatRowLabel/*[opt]*/, 
                                                        ShortLabels/*[opt]*/, 
                                                        DisplayDetailsColumn/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DetailStylesToggleItem(Msproject_2k::PjTimescaledData Item/*[def,opt]*/)
{
  return  GetDefaultInterface()->DetailStylesToggleItem(Item/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::AutoFilter(void)
{
  return  GetDefaultInterface()->AutoFilter();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewBar(void)
{
  return  GetDefaultInterface()->ViewBar();
}

VARIANT_BOOL __fastcall TProjectApplication::MacroShowVba(void)
{
  return  GetDefaultInterface()->MacroShowVba();
}

VARIANT_BOOL __fastcall TProjectApplication::MacroShowCode(void)
{
  return  GetDefaultInterface()->MacroShowCode();
}

VARIANT_BOOL __fastcall TProjectApplication::WebGoBack(void)
{
  return  GetDefaultInterface()->WebGoBack();
}

VARIANT_BOOL __fastcall TProjectApplication::WebGoForward(void)
{
  return  GetDefaultInterface()->WebGoForward();
}

VARIANT_BOOL __fastcall TProjectApplication::WebStopLoading(void)
{
  return  GetDefaultInterface()->WebStopLoading();
}

VARIANT_BOOL __fastcall TProjectApplication::WebRefresh(void)
{
  return  GetDefaultInterface()->WebRefresh();
}

VARIANT_BOOL __fastcall TProjectApplication::WebOpenStartPage(void)
{
  return  GetDefaultInterface()->WebOpenStartPage();
}

VARIANT_BOOL __fastcall TProjectApplication::WebOpenSearchPage(void)
{
  return  GetDefaultInterface()->WebOpenSearchPage();
}

VARIANT_BOOL __fastcall TProjectApplication::WebHideToolbars(VARIANT Hide/*[opt]*/)
{
  return  GetDefaultInterface()->WebHideToolbars(Hide/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FollowHyperlink(VARIANT Address/*[opt]*/, 
                                                             VARIANT SubAddress/*[opt]*/, 
                                                             VARIANT AddHistory/*[opt]*/, 
                                                             VARIANT NewWindow/*[opt]*/)
{
  return  GetDefaultInterface()->FollowHyperlink(Address/*[opt]*/, SubAddress/*[opt]*/, 
                                                 AddHistory/*[opt]*/, NewWindow/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::EditPasteAsHyperlink(void)
{
  return  GetDefaultInterface()->EditPasteAsHyperlink();
}

VARIANT_BOOL __fastcall TProjectApplication::InsertHyperlink(VARIANT Name/*[opt]*/, 
                                                             VARIANT Address/*[opt]*/, 
                                                             VARIANT SubAddress/*[opt]*/, 
                                                             VARIANT ScreenTip/*[opt]*/)
{
  return  GetDefaultInterface()->InsertHyperlink(Name/*[opt]*/, Address/*[opt]*/, 
                                                 SubAddress/*[opt]*/, ScreenTip/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::EditHyperlink(VARIANT Name/*[opt]*/, 
                                                           VARIANT Address/*[opt]*/, 
                                                           VARIANT SubAddress/*[opt]*/, 
                                                           VARIANT ScreenTip/*[opt]*/)
{
  return  GetDefaultInterface()->EditHyperlink(Name/*[opt]*/, Address/*[opt]*/, SubAddress/*[opt]*/, 
                                               ScreenTip/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WebOpenHyperlink(VARIANT Address/*[opt]*/, 
                                                              VARIANT SubAddress/*[opt]*/, 
                                                              VARIANT AddHistory/*[opt]*/, 
                                                              VARIANT NewWindow/*[opt]*/)
{
  return  GetDefaultInterface()->WebOpenHyperlink(Address/*[opt]*/, SubAddress/*[opt]*/, 
                                                  AddHistory/*[opt]*/, NewWindow/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WebCopyHyperlink(void)
{
  return  GetDefaultInterface()->WebCopyHyperlink();
}

VARIANT_BOOL __fastcall TProjectApplication::WebAddToFavorites(VARIANT CurrentLink/*[opt]*/)
{
  return  GetDefaultInterface()->WebAddToFavorites(CurrentLink/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::EditClearHyperlink(void)
{
  return  GetDefaultInterface()->EditClearHyperlink();
}

VARIANT_BOOL __fastcall TProjectApplication::WebSetStartPage(VARIANT Address/*[opt]*/)
{
  return  GetDefaultInterface()->WebSetStartPage(Address/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WebSetSearchPage(VARIANT Address/*[opt]*/)
{
  return  GetDefaultInterface()->WebSetSearchPage(Address/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WebOpenFavorites(void)
{
  return  GetDefaultInterface()->WebOpenFavorites();
}

VARIANT_BOOL __fastcall TProjectApplication::WebToolbar(VARIANT Show/*[opt]*/)
{
  return  GetDefaultInterface()->WebToolbar(Show/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SplitTask(VARIANT Lock/*[opt]*/)
{
  return  GetDefaultInterface()->SplitTask(Lock/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomFieldRename(Msproject_2k::PjCustomField FieldID, 
                                                               BSTR NewName, 
                                                               VARIANT Phonetic/*[opt]*/)
{
  return  GetDefaultInterface()->CustomFieldRename(FieldID, NewName, Phonetic/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomizeField(void)
{
  return  GetDefaultInterface()->CustomizeField();
}

VARIANT_BOOL __fastcall TProjectApplication::GanttShowBarSplits(VARIANT Display/*[opt]*/)
{
  return  GetDefaultInterface()->GanttShowBarSplits(Display/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CalendarShowBarSplits(VARIANT Display/*[opt]*/)
{
  return  GetDefaultInterface()->CalendarShowBarSplits(Display/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::MapEdit(VARIANT Name/*[opt]*/, VARIANT Create/*[opt]*/, 
                                                     VARIANT OverwriteExisting/*[opt]*/, 
                                                     VARIANT NewName/*[opt]*/, 
                                                     VARIANT DataCategory/*[opt]*/, 
                                                     VARIANT CategoryEnabled/*[opt]*/, 
                                                     VARIANT TableName/*[opt]*/, 
                                                     VARIANT FieldName/*[opt]*/, 
                                                     VARIANT ExternalFieldName/*[opt]*/, 
                                                     VARIANT ExportFilter/*[opt]*/, 
                                                     VARIANT ImportMethod/*[opt]*/, 
                                                     VARIANT MergeKey/*[opt]*/, 
                                                     VARIANT HeaderRow/*[opt]*/, 
                                                     VARIANT AssignmentData/*[opt]*/, 
                                                     VARIANT TextDelimiter/*[opt]*/, 
                                                     VARIANT TextFileOrigin/*[opt]*/, 
                                                     VARIANT UseHtmlTemplate/*[opt]*/, 
                                                     VARIANT TemplateFile/*[opt]*/, 
                                                     VARIANT IncludeImage/*[opt]*/, 
                                                     VARIANT ImageFile/*[opt]*/)
{
  return  GetDefaultInterface()->MapEdit(Name/*[opt]*/, Create/*[opt]*/, OverwriteExisting/*[opt]*/, 
                                         NewName/*[opt]*/, DataCategory/*[opt]*/, 
                                         CategoryEnabled/*[opt]*/, TableName/*[opt]*/, 
                                         FieldName/*[opt]*/, ExternalFieldName/*[opt]*/, 
                                         ExportFilter/*[opt]*/, ImportMethod/*[opt]*/, 
                                         MergeKey/*[opt]*/, HeaderRow/*[opt]*/, 
                                         AssignmentData/*[opt]*/, TextDelimiter/*[opt]*/, 
                                         TextFileOrigin/*[opt]*/, UseHtmlTemplate/*[opt]*/, 
                                         TemplateFile/*[opt]*/, IncludeImage/*[opt]*/, 
                                         ImageFile/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::FillAcross(VARIANT Right/*[opt]*/)
{
  return  GetDefaultInterface()->FillAcross(Right/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::LinksBetweenProjects(VARIANT AcceptAll/*[opt]*/)
{
  return  GetDefaultInterface()->LinksBetweenProjects(AcceptAll/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ToggleAssignments(void)
{
  return  GetDefaultInterface()->ToggleAssignments();
}

VARIANT_BOOL __fastcall TProjectApplication::ProgressLines(void)
{
  return  GetDefaultInterface()->ProgressLines();
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceSharingPoolUpdate(VARIANT allSharers/*[opt]*/)
{
  return  GetDefaultInterface()->ResourceSharingPoolUpdate(allSharers/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceSharingPoolRefresh(void)
{
  return  GetDefaultInterface()->ResourceSharingPoolRefresh();
}

VARIANT_BOOL __fastcall TProjectApplication::WebHelp(VARIANT Type/*[opt]*/)
{
  return  GetDefaultInterface()->WebHelp(Type/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::AddProgressLine(void)
{
  return  GetDefaultInterface()->AddProgressLine();
}

VARIANT_BOOL __fastcall TProjectApplication::CustomizeIMEMode(Msproject_2k::PjField FieldID/*[def,opt]*/, 
                                                              Msproject_2k::PjIMEMode IMEMode/*[def,opt]*/)
{
  return  GetDefaultInterface()->CustomizeIMEMode(FieldID/*[def,opt]*/, IMEMode/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::DeleteFromDatabase(VARIANT Name/*[opt]*/, 
                                                                VARIANT UserID/*[opt]*/, 
                                                                VARIANT DatabasePassWord/*[opt]*/, 
                                                                VARIANT FormatID/*[opt]*/)
{
  return  GetDefaultInterface()->DeleteFromDatabase(Name/*[opt]*/, UserID/*[opt]*/, 
                                                    DatabasePassWord/*[opt]*/, FormatID/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WBSCodeRenumber(VARIANT All/*[opt]*/)
{
  return  GetDefaultInterface()->WBSCodeRenumber(All/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::WBSCodeMaskEdit(VARIANT CodePrefix/*[opt]*/, 
                                                             VARIANT Level/*[opt]*/, 
                                                             Msproject_2k::PjWBSSequence Sequence/*[def,opt]*/, 
                                                             VARIANT Length/*[opt]*/, 
                                                             VARIANT Separator/*[opt]*/, 
                                                             VARIANT CodeGenerate/*[opt]*/, 
                                                             VARIANT VerifyUniqueness/*[opt]*/)
{
  return  GetDefaultInterface()->WBSCodeMaskEdit(CodePrefix/*[opt]*/, Level/*[opt]*/, 
                                                 Sequence/*[def,opt]*/, Length/*[opt]*/, 
                                                 Separator/*[opt]*/, CodeGenerate/*[opt]*/, 
                                                 VerifyUniqueness/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomOutlineCodeEdit(Msproject_2k::PjCustomField FieldID, 
                                                                   VARIANT Level/*[opt]*/, 
                                                                   Msproject_2k::PjCustomOutlineCodeSequence Sequence/*[def,opt]*/, 
                                                                   VARIANT Length/*[opt]*/, 
                                                                   VARIANT Separator/*[opt]*/, 
                                                                   VARIANT OnlyLookUpTableCodes/*[opt]*/, 
                                                                   VARIANT OnlyCompleteCodes/*[opt]*/)
{
  return  GetDefaultInterface()->CustomOutlineCodeEdit(FieldID, Level/*[opt]*/, 
                                                       Sequence/*[def,opt]*/, Length/*[opt]*/, 
                                                       Separator/*[opt]*/, 
                                                       OnlyLookUpTableCodes/*[opt]*/, 
                                                       OnlyCompleteCodes/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OptionsSave(VARIANT DefaultSaveFormat/*[opt]*/, 
                                                         VARIANT DefaultProjectsPath/*[opt]*/, 
                                                         VARIANT DefaultUserTemplatesPath/*[opt]*/, 
                                                         VARIANT DefaultWorkgroupTemplatesPath/*[opt]*/, 
                                                         VARIANT ExpandDatabaseTimephasedData/*[opt]*/, 
                                                         VARIANT AutomaticSave/*[opt]*/, 
                                                         VARIANT AutomaticSaveInterval/*[opt]*/, 
                                                         VARIANT AutomaticSaveOptions/*[opt]*/, 
                                                         VARIANT AutomaticSavePrompt/*[opt]*/, 
                                                         VARIANT SetDefaultsDatabase/*[opt]*/)
{
  return  GetDefaultInterface()->OptionsSave(DefaultSaveFormat/*[opt]*/, 
                                             DefaultProjectsPath/*[opt]*/, 
                                             DefaultUserTemplatesPath/*[opt]*/, 
                                             DefaultWorkgroupTemplatesPath/*[opt]*/, 
                                             ExpandDatabaseTimephasedData/*[opt]*/, 
                                             AutomaticSave/*[opt]*/, AutomaticSaveInterval/*[opt]*/, 
                                             AutomaticSaveOptions/*[opt]*/, 
                                             AutomaticSavePrompt/*[opt]*/, 
                                             SetDefaultsDatabase/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::OfficeOnTheWeb(void)
{
  return  GetDefaultInterface()->OfficeOnTheWeb();
}

VARIANT_BOOL __fastcall TProjectApplication::FixMe(void)
{
  return  GetDefaultInterface()->FixMe();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowWorkAvailability(void)
{
  return  GetDefaultInterface()->ViewShowWorkAvailability();
}

VARIANT_BOOL __fastcall TProjectApplication::ViewShowUnitAvailability(void)
{
  return  GetDefaultInterface()->ViewShowUnitAvailability();
}

VARIANT_BOOL __fastcall TProjectApplication::BaselineClear(VARIANT All/*[opt]*/, 
                                                           VARIANT From/*[opt]*/)
{
  return  GetDefaultInterface()->BaselineClear(All/*[opt]*/, From/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::Groups(void)
{
  return  GetDefaultInterface()->Groups();
}

VARIANT_BOOL __fastcall TProjectApplication::GroupApply(VARIANT Name/*[opt]*/)
{
  return  GetDefaultInterface()->GroupApply(Name/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::GroupBy(void)
{
  return  GetDefaultInterface()->GroupBy();
}

VARIANT_BOOL __fastcall TProjectApplication::LookUpTableAdd(Msproject_2k::PjCustomField FieldID, 
                                                            VARIANT Level/*[opt]*/, 
                                                            VARIANT Code/*[opt]*/, 
                                                            VARIANT Description/*[opt]*/)
{
  return  GetDefaultInterface()->LookUpTableAdd(FieldID, Level/*[opt]*/, Code/*[opt]*/, 
                                                Description/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxStylesEdit(Msproject_2k::PjBoxStyle Style, 
                                                           VARIANT DataTemplate/*[opt]*/, 
                                                           VARIANT HorizontalGridlines/*[opt]*/, 
                                                           VARIANT VerticalGridlines/*[opt]*/, 
                                                           Msproject_2k::PjBoxShape BorderShape/*[def,opt]*/, 
                                                           Msproject_2k::PjColor BorderColor/*[def,opt]*/, 
                                                           VARIANT BorderWidth/*[opt]*/, 
                                                           Msproject_2k::PjColor BackgroundColor/*[def,opt]*/, 
                                                           Msproject_2k::PjBackgroundPattern BackgroundPattern/*[def,opt]*/)
{
  return  GetDefaultInterface()->BoxStylesEdit(Style, DataTemplate/*[opt]*/, 
                                               HorizontalGridlines/*[opt]*/, 
                                               VerticalGridlines/*[opt]*/, BorderShape/*[def,opt]*/, 
                                               BorderColor/*[def,opt]*/, BorderWidth/*[opt]*/, 
                                               BackgroundColor/*[def,opt]*/, 
                                               BackgroundPattern/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxFormat(VARIANT ProjectName/*[opt]*/, 
                                                       VARIANT TaskID/*[opt]*/, 
                                                       VARIANT DataTemplate/*[opt]*/, 
                                                       VARIANT HorizontalGridlines/*[opt]*/, 
                                                       VARIANT VerticalGridlines/*[opt]*/, 
                                                       Msproject_2k::PjBoxShape BorderShape/*[def,opt]*/, 
                                                       Msproject_2k::PjColor BorderColor/*[def,opt]*/, 
                                                       VARIANT BorderWidth/*[opt]*/, 
                                                       Msproject_2k::PjColor BackgroundColor/*[def,opt]*/, 
                                                       Msproject_2k::PjBackgroundPattern BackgroundPattern/*[def,opt]*/, 
                                                       VARIANT Reset/*[opt]*/)
{
  return  GetDefaultInterface()->BoxFormat(ProjectName/*[opt]*/, TaskID/*[opt]*/, 
                                           DataTemplate/*[opt]*/, HorizontalGridlines/*[opt]*/, 
                                           VerticalGridlines/*[opt]*/, BorderShape/*[def,opt]*/, 
                                           BorderColor/*[def,opt]*/, BorderWidth/*[opt]*/, 
                                           BackgroundColor/*[def,opt]*/, 
                                           BackgroundPattern/*[def,opt]*/, Reset/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BarBoxFormat(void)
{
  return  GetDefaultInterface()->BarBoxFormat();
}

VARIANT_BOOL __fastcall TProjectApplication::CreateWebAccount(VARIANT ServerURL/*[opt]*/, 
                                                              VARIANT Name/*[opt]*/, 
                                                              Msproject_2k::PjAuthentication AuthenticationType/*[def,opt]*/, 
                                                              Msproject_2k::PjAccountType AccountType/*[def,opt]*/, 
                                                              VARIANT ShowDialog/*[opt]*/)
{
  return  GetDefaultInterface()->CreateWebAccount(ServerURL/*[opt]*/, Name/*[opt]*/, 
                                                  AuthenticationType/*[def,opt]*/, 
                                                  AccountType/*[def,opt]*/, ShowDialog/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxDataTemplate(BSTR Name, 
                                                             Msproject_2k::PjDataTemplate Action, 
                                                             VARIANT NewName/*[opt]*/, 
                                                             VARIANT Overwrite/*[opt]*/)
{
  return  GetDefaultInterface()->BoxDataTemplate(Name, Action, NewName/*[opt]*/, Overwrite/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxCellLayout(BSTR Name, VARIANT CellRows/*[opt]*/, 
                                                           VARIANT CellColumns/*[opt]*/, 
                                                           VARIANT CellWidth/*[opt]*/, 
                                                           VARIANT MergeCells/*[opt]*/)
{
  return  GetDefaultInterface()->BoxCellLayout(Name, CellRows/*[opt]*/, CellColumns/*[opt]*/, 
                                               CellWidth/*[opt]*/, MergeCells/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxCellEdit(BSTR Name, Msproject_2k::PjCell Cell, 
                                                         Msproject_2k::PjField FieldName/*[def,opt]*/, 
                                                         VARIANT Font/*[opt]*/, 
                                                         VARIANT FontSize/*[opt]*/, 
                                                         Msproject_2k::PjColor FontColor/*[def,opt]*/, 
                                                         VARIANT Bold/*[opt]*/, 
                                                         VARIANT Italic/*[opt]*/, 
                                                         VARIANT Underline/*[opt]*/, 
                                                         Msproject_2k::PjAlignment HorizontalAlignment/*[def,opt]*/, 
                                                         Msproject_2k::PjVerticalAlignment VerticalAlignment/*[def,opt]*/, 
                                                         VARIANT TextLineLimit/*[opt]*/, 
                                                         VARIANT ShowLabel/*[opt]*/, 
                                                         VARIANT Label/*[opt]*/, 
                                                         Msproject_2k::PjDateFormat DateFormat/*[def,opt]*/)
{
  return  GetDefaultInterface()->BoxCellEdit(Name, Cell, FieldName/*[def,opt]*/, Font/*[opt]*/, 
                                             FontSize/*[opt]*/, FontColor/*[def,opt]*/, 
                                             Bold/*[opt]*/, Italic/*[opt]*/, Underline/*[opt]*/, 
                                             HorizontalAlignment/*[def,opt]*/, 
                                             VerticalAlignment/*[def,opt]*/, TextLineLimit/*[opt]*/, 
                                             ShowLabel/*[opt]*/, Label/*[opt]*/, 
                                             DateFormat/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ResourceWindowsAccount(VARIANT Name/*[opt]*/, 
                                                                    VARIANT ShowDialog/*[opt]*/)
{
  return  GetDefaultInterface()->ResourceWindowsAccount(Name/*[opt]*/, ShowDialog/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SetRowHeight(VARIANT Unit/*[opt]*/, 
                                                          VARIANT Rows/*[opt]*/, 
                                                          VARIANT UseUniqueID/*[opt]*/)
{
  return  GetDefaultInterface()->SetRowHeight(Unit/*[opt]*/, Rows/*[opt]*/, UseUniqueID/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ComAddInsDialog(void)
{
  return  GetDefaultInterface()->ComAddInsDialog();
}

VARIANT_BOOL __fastcall TProjectApplication::MacroSecurity(void)
{
  return  GetDefaultInterface()->MacroSecurity();
}

VARIANT_BOOL __fastcall TProjectApplication::LayoutSelectionNow(void)
{
  return  GetDefaultInterface()->LayoutSelectionNow();
}

VARIANT_BOOL __fastcall TProjectApplication::BoxAlign(Msproject_2k::PjAlign Alignment/*[def,opt]*/)
{
  return  GetDefaultInterface()->BoxAlign(Alignment/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::ConvertHangulToHanja(void)
{
  return  GetDefaultInterface()->ConvertHangulToHanja();
}

VARIANT_BOOL __fastcall TProjectApplication::UpdateProjectToWeb(VARIANT ServerURL/*[opt]*/)
{
  return  GetDefaultInterface()->UpdateProjectToWeb(ServerURL/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomFieldProperties(Msproject_2k::PjCustomField FieldID, 
                                                                   Msproject_2k::PjCustomFieldAttribute Attribute/*[def,opt]*/, 
                                                                   Msproject_2k::PjSummaryCalc SummaryCalc/*[def,opt]*/, 
                                                                   VARIANT GraphicalIndicators/*[opt]*/)
{
  return  GetDefaultInterface()->CustomFieldProperties(FieldID, Attribute/*[def,opt]*/, 
                                                       SummaryCalc/*[def,opt]*/, 
                                                       GraphicalIndicators/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomFieldSetFormula(Msproject_2k::PjCustomField FieldID, 
                                                                   VARIANT Formula/*[opt]*/)
{
  return  GetDefaultInterface()->CustomFieldSetFormula(FieldID, Formula/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomFieldIndicatorAdd(Msproject_2k::PjCustomField FieldID, 
                                                                     Msproject_2k::PjComparison Test, 
                                                                     BSTR Value, 
                                                                     Msproject_2k::PjIndicator IndicatorID, 
                                                                     Msproject_2k::PjCriteriaList CriteriaList/*[def,opt]*/, 
                                                                     VARIANT Index/*[opt]*/)
{
  return  GetDefaultInterface()->CustomFieldIndicatorAdd(FieldID, Test, Value, IndicatorID, 
                                                         CriteriaList/*[def,opt]*/, Index/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomFieldIndicators(Msproject_2k::PjCustomField FieldID, 
                                                                   VARIANT SummaryInheritsNonsummary/*[opt]*/, 
                                                                   VARIANT ProjectInheritsSummary/*[opt]*/, 
                                                                   VARIANT ShowToolTips/*[opt]*/)
{
  return  GetDefaultInterface()->CustomFieldIndicators(FieldID, SummaryInheritsNonsummary/*[opt]*/, 
                                                       ProjectInheritsSummary/*[opt]*/, 
                                                       ShowToolTips/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomFieldIndicatorDelete(Msproject_2k::PjCustomField FieldID, 
                                                                        short Index, 
                                                                        Msproject_2k::PjCriteriaList CriteriaList/*[def,opt]*/)
{
  return  GetDefaultInterface()->CustomFieldIndicatorDelete(FieldID, Index, 
                                                            CriteriaList/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomFieldValueList(Msproject_2k::PjCustomField FieldID, 
                                                                  VARIANT ListDefault/*[opt]*/, 
                                                                  VARIANT DefaultValue/*[opt]*/, 
                                                                  VARIANT RestrictToList/*[opt]*/, 
                                                                  VARIANT AppendNew/*[opt]*/, 
                                                                  VARIANT PromptOnNew/*[opt]*/, 
                                                                  Msproject_2k::PjListOrder DisplayOrder/*[def,opt]*/)
{
  return  GetDefaultInterface()->CustomFieldValueList(FieldID, ListDefault/*[opt]*/, 
                                                      DefaultValue/*[opt]*/, RestrictToList/*[opt]*/, 
                                                      AppendNew/*[opt]*/, PromptOnNew/*[opt]*/, 
                                                      DisplayOrder/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomFieldValueListAdd(Msproject_2k::PjCustomField FieldID, 
                                                                     VARIANT Value/*[opt]*/, 
                                                                     VARIANT Description/*[opt]*/, 
                                                                     VARIANT Phonetic/*[opt]*/, 
                                                                     VARIANT Index/*[opt]*/, 
                                                                     VARIANT FieldDefault/*[opt]*/)
{
  return  GetDefaultInterface()->CustomFieldValueListAdd(FieldID, Value/*[opt]*/, 
                                                         Description/*[opt]*/, Phonetic/*[opt]*/, 
                                                         Index/*[opt]*/, FieldDefault/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::CustomFieldValueListDelete(Msproject_2k::PjCustomField FieldID, 
                                                                        short Index)
{
  return  GetDefaultInterface()->CustomFieldValueListDelete(FieldID, Index);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxLayout(Msproject_2k::PjLayoutMode LayoutMode/*[def,opt]*/, 
                                                       Msproject_2k::PjLayoutScheme LayoutScheme/*[def,opt]*/, 
                                                       VARIANT SummaryPrecedence/*[opt]*/, 
                                                       Msproject_2k::PjVerticalAlignment RowAlignment/*[def,opt]*/, 
                                                       Msproject_2k::PjAlignment ColumnAlignment/*[def,opt]*/, 
                                                       VARIANT RowSpacing/*[opt]*/, 
                                                       VARIANT ColumnSpacing/*[opt]*/, 
                                                       Msproject_2k::PjRowColSize RowHeight/*[def,opt]*/, 
                                                       Msproject_2k::PjRowColSize ColumnWidth/*[def,opt]*/, 
                                                       VARIANT AdjustForPageBreaks/*[opt]*/, 
                                                       VARIANT ShowSummaryTasks/*[opt]*/, 
                                                       Msproject_2k::PjColor ViewBackgroundColor/*[def,opt]*/, 
                                                       Msproject_2k::PjBackgroundPattern ViewBackgroundPattern/*[def,opt]*/, 
                                                       VARIANT ShowProgressMarks/*[opt]*/, 
                                                       VARIANT ShowPageBreaks/*[opt]*/, 
                                                       VARIANT ShowIDOnly/*[opt]*/)
{
  return  GetDefaultInterface()->BoxLayout(LayoutMode/*[def,opt]*/, LayoutScheme/*[def,opt]*/, 
                                           SummaryPrecedence/*[opt]*/, RowAlignment/*[def,opt]*/, 
                                           ColumnAlignment/*[def,opt]*/, RowSpacing/*[opt]*/, 
                                           ColumnSpacing/*[opt]*/, RowHeight/*[def,opt]*/, 
                                           ColumnWidth/*[def,opt]*/, AdjustForPageBreaks/*[opt]*/, 
                                           ShowSummaryTasks/*[opt]*/, 
                                           ViewBackgroundColor/*[def,opt]*/, 
                                           ViewBackgroundPattern/*[def,opt]*/, 
                                           ShowProgressMarks/*[opt]*/, ShowPageBreaks/*[opt]*/, 
                                           ShowIDOnly/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxLinks(Msproject_2k::PjLinkStyle Style/*[def,opt]*/, 
                                                      VARIANT ShowArrows/*[opt]*/, 
                                                      VARIANT ShowLabels/*[opt]*/, 
                                                      Msproject_2k::PjLinkColorMode ColorMode/*[def,opt]*/, 
                                                      Msproject_2k::PjColor CriticalColor/*[def,opt]*/, 
                                                      Msproject_2k::PjColor NoncriticalColor/*[def,opt]*/)
{
  return  GetDefaultInterface()->BoxLinks(Style/*[def,opt]*/, ShowArrows/*[opt]*/, 
                                          ShowLabels/*[opt]*/, ColorMode/*[def,opt]*/, 
                                          CriticalColor/*[def,opt]*/, NoncriticalColor/*[def,opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SummaryTasksShow(VARIANT Show/*[opt]*/)
{
  return  GetDefaultInterface()->SummaryTasksShow(Show/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxProgressMarksShow(VARIANT Show/*[opt]*/)
{
  return  GetDefaultInterface()->BoxProgressMarksShow(Show/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxLinkLabelsShow(VARIANT Show/*[opt]*/)
{
  return  GetDefaultInterface()->BoxLinkLabelsShow(Show/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::BoxLinkStyleToggle(VARIANT StraightLinks/*[opt]*/)
{
  return  GetDefaultInterface()->BoxLinkStyleToggle(StraightLinks/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::LayoutRelatedNow(void)
{
  return  GetDefaultInterface()->LayoutRelatedNow();
}

VARIANT_BOOL __fastcall TProjectApplication::BoxSet(Msproject_2k::PjBoxSet Action/*[def,opt]*/, 
                                                    VARIANT TaskID/*[opt]*/, 
                                                    VARIANT XPosition/*[opt]*/, 
                                                    VARIANT YPosition/*[opt]*/, 
                                                    VARIANT ProjectName/*[opt]*/)
{
  return  GetDefaultInterface()->BoxSet(Action/*[def,opt]*/, TaskID/*[opt]*/, XPosition/*[opt]*/, 
                                        YPosition/*[opt]*/, ProjectName/*[opt]*/);
}

VARIANT_BOOL __fastcall TProjectApplication::SetSplitBar(VARIANT ShowColumns/*[opt]*/)
{
  return  GetDefaultInterface()->SetSplitBar(ShowColumns/*[opt]*/);
}

Msproject_2k::ProjectApplicationPtr __fastcall TProjectApplication::get_Application()
{
  return GetDefaultInterface()->get_Application();
}

void __fastcall TProjectApplication::set_Application(Msproject_2k::ProjectApplicationPtr param)
{
  GetDefaultInterface()->set_Application(param);
}

Msproject_2k::ProjectApplicationPtr __fastcall TProjectApplication::get_Parent()
{
  return GetDefaultInterface()->get_Parent();
}

void __fastcall TProjectApplication::set_Parent(Msproject_2k::ProjectApplicationPtr param)
{
  GetDefaultInterface()->set_Parent(param);
}

Msproject_2k::ProjectsPtr __fastcall TProjectApplication::get_Projects()
{
  return GetDefaultInterface()->get_Projects();
}

void __fastcall TProjectApplication::set_Projects(Msproject_2k::ProjectsPtr param)
{
  GetDefaultInterface()->set_Projects(param);
}

Msproject_2k::SelectionPtr __fastcall TProjectApplication::get_ActiveSelection()
{
  return GetDefaultInterface()->get_ActiveSelection();
}

void __fastcall TProjectApplication::set_ActiveSelection(Msproject_2k::SelectionPtr param)
{
  GetDefaultInterface()->set_ActiveSelection(param);
}

Msproject_2k::CellPtr __fastcall TProjectApplication::get_ActiveCell()
{
  return GetDefaultInterface()->get_ActiveCell();
}

void __fastcall TProjectApplication::set_ActiveCell(Msproject_2k::CellPtr param)
{
  GetDefaultInterface()->set_ActiveCell(param);
}

Msproject_2k::Project_Ptr __fastcall TProjectApplication::get_ActiveProject()
{
  return GetDefaultInterface()->get_ActiveProject();
}

void __fastcall TProjectApplication::set_ActiveProject(Msproject_2k::Project_Ptr param)
{
  GetDefaultInterface()->set_ActiveProject(param);
}

Msproject_2k::WINDOWPtr __fastcall TProjectApplication::get_ActiveWindow()
{
  return GetDefaultInterface()->get_ActiveWindow();
}

void __fastcall TProjectApplication::set_ActiveWindow(Msproject_2k::WINDOWPtr param)
{
  GetDefaultInterface()->set_ActiveWindow(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_SupportsMultipleDocuments()
{
  return GetDefaultInterface()->get_SupportsMultipleDocuments();
}

void __fastcall TProjectApplication::set_SupportsMultipleDocuments(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_SupportsMultipleDocuments(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_SupportsMultipleWindows()
{
  return GetDefaultInterface()->get_SupportsMultipleWindows();
}

void __fastcall TProjectApplication::set_SupportsMultipleWindows(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_SupportsMultipleWindows(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_Visible()
{
  return GetDefaultInterface()->get_Visible();
}

void __fastcall TProjectApplication::set_Visible(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_Visible(param);
}

BSTR __fastcall TProjectApplication::get_PathSeparator()
{
  return GetDefaultInterface()->get_PathSeparator();
}

void __fastcall TProjectApplication::set_PathSeparator(BSTR param)
{
  GetDefaultInterface()->set_PathSeparator(param);
}

BSTR __fastcall TProjectApplication::get_Caption()
{
  return GetDefaultInterface()->get_Caption();
}

void __fastcall TProjectApplication::set_Caption(BSTR param)
{
  GetDefaultInterface()->set_Caption(param);
}

BSTR __fastcall TProjectApplication::get_Name()
{
  return GetDefaultInterface()->get_Name();
}

void __fastcall TProjectApplication::set_Name(BSTR param)
{
  GetDefaultInterface()->set_Name(param);
}

BSTR __fastcall TProjectApplication::get_Path()
{
  return GetDefaultInterface()->get_Path();
}

void __fastcall TProjectApplication::set_Path(BSTR param)
{
  GetDefaultInterface()->set_Path(param);
}

BSTR __fastcall TProjectApplication::get_Version()
{
  return GetDefaultInterface()->get_Version();
}

void __fastcall TProjectApplication::set_Version(BSTR param)
{
  GetDefaultInterface()->set_Version(param);
}

Msproject_2k::PjWindowState __fastcall TProjectApplication::get_WindowState()
{
  return GetDefaultInterface()->get_WindowState();
}

void __fastcall TProjectApplication::set_WindowState(Msproject_2k::PjWindowState param)
{
  GetDefaultInterface()->set_WindowState(param);
}

long __fastcall TProjectApplication::get_Left()
{
  return GetDefaultInterface()->get_Left();
}

void __fastcall TProjectApplication::set_Left(long param)
{
  GetDefaultInterface()->set_Left(param);
}

long __fastcall TProjectApplication::get_Top()
{
  return GetDefaultInterface()->get_Top();
}

void __fastcall TProjectApplication::set_Top(long param)
{
  GetDefaultInterface()->set_Top(param);
}

long __fastcall TProjectApplication::get_Width()
{
  return GetDefaultInterface()->get_Width();
}

void __fastcall TProjectApplication::set_Width(long param)
{
  GetDefaultInterface()->set_Width(param);
}

long __fastcall TProjectApplication::get_Height()
{
  return GetDefaultInterface()->get_Height();
}

void __fastcall TProjectApplication::set_Height(long param)
{
  GetDefaultInterface()->set_Height(param);
}

Msproject_2k::PjDateOrder __fastcall TProjectApplication::get_DateOrder()
{
  return GetDefaultInterface()->get_DateOrder();
}

void __fastcall TProjectApplication::set_DateOrder(Msproject_2k::PjDateOrder param)
{
  GetDefaultInterface()->set_DateOrder(param);
}

BSTR __fastcall TProjectApplication::get_DateSeparator()
{
  return GetDefaultInterface()->get_DateSeparator();
}

void __fastcall TProjectApplication::set_DateSeparator(BSTR param)
{
  GetDefaultInterface()->set_DateSeparator(param);
}

BSTR __fastcall TProjectApplication::get_ThousandSeparator()
{
  return GetDefaultInterface()->get_ThousandSeparator();
}

void __fastcall TProjectApplication::set_ThousandSeparator(BSTR param)
{
  GetDefaultInterface()->set_ThousandSeparator(param);
}

BSTR __fastcall TProjectApplication::get_DecimalSeparator()
{
  return GetDefaultInterface()->get_DecimalSeparator();
}

void __fastcall TProjectApplication::set_DecimalSeparator(BSTR param)
{
  GetDefaultInterface()->set_DecimalSeparator(param);
}

BSTR __fastcall TProjectApplication::get_ListSeparator()
{
  return GetDefaultInterface()->get_ListSeparator();
}

void __fastcall TProjectApplication::set_ListSeparator(BSTR param)
{
  GetDefaultInterface()->set_ListSeparator(param);
}

BSTR __fastcall TProjectApplication::get_TimeSeparator()
{
  return GetDefaultInterface()->get_TimeSeparator();
}

void __fastcall TProjectApplication::set_TimeSeparator(BSTR param)
{
  GetDefaultInterface()->set_TimeSeparator(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_TwelveHourTimeFormat()
{
  return GetDefaultInterface()->get_TwelveHourTimeFormat();
}

void __fastcall TProjectApplication::set_TwelveHourTimeFormat(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_TwelveHourTimeFormat(param);
}

BSTR __fastcall TProjectApplication::get_AMText()
{
  return GetDefaultInterface()->get_AMText();
}

void __fastcall TProjectApplication::set_AMText(BSTR param)
{
  GetDefaultInterface()->set_AMText(param);
}

BSTR __fastcall TProjectApplication::get_PMText()
{
  return GetDefaultInterface()->get_PMText();
}

void __fastcall TProjectApplication::set_PMText(BSTR param)
{
  GetDefaultInterface()->set_PMText(param);
}

BSTR __fastcall TProjectApplication::get_DefaultView()
{
  return GetDefaultInterface()->get_DefaultView();
}

void __fastcall TProjectApplication::set_DefaultView(BSTR param)
{
  GetDefaultInterface()->set_DefaultView(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayStatusBar()
{
  return GetDefaultInterface()->get_DisplayStatusBar();
}

void __fastcall TProjectApplication::set_DisplayStatusBar(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayStatusBar(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayAlerts()
{
  return GetDefaultInterface()->get_DisplayAlerts();
}

void __fastcall TProjectApplication::set_DisplayAlerts(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayAlerts(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayEntryBar()
{
  return GetDefaultInterface()->get_DisplayEntryBar();
}

void __fastcall TProjectApplication::set_DisplayEntryBar(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayEntryBar(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayScrollBars()
{
  return GetDefaultInterface()->get_DisplayScrollBars();
}

void __fastcall TProjectApplication::set_DisplayScrollBars(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayScrollBars(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayWindowsInTaskbar()
{
  return GetDefaultInterface()->get_DisplayWindowsInTaskbar();
}

void __fastcall TProjectApplication::set_DisplayWindowsInTaskbar(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayWindowsInTaskbar(param);
}

Msproject_2k::PjCalculation __fastcall TProjectApplication::get_Calculation()
{
  return GetDefaultInterface()->get_Calculation();
}

void __fastcall TProjectApplication::set_Calculation(Msproject_2k::PjCalculation param)
{
  GetDefaultInterface()->set_Calculation(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_AutoLevel()
{
  return GetDefaultInterface()->get_AutoLevel();
}

void __fastcall TProjectApplication::set_AutoLevel(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AutoLevel(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_AutoClearLeveling()
{
  return GetDefaultInterface()->get_AutoClearLeveling();
}

void __fastcall TProjectApplication::set_AutoClearLeveling(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AutoClearLeveling(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_LevelWithinSlack()
{
  return GetDefaultInterface()->get_LevelWithinSlack();
}

void __fastcall TProjectApplication::set_LevelWithinSlack(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_LevelWithinSlack(param);
}

Msproject_2k::PjLevelOrder __fastcall TProjectApplication::get_LevelOrder()
{
  return GetDefaultInterface()->get_LevelOrder();
}

void __fastcall TProjectApplication::set_LevelOrder(Msproject_2k::PjLevelOrder param)
{
  GetDefaultInterface()->set_LevelOrder(param);
}

Msproject_2k::PjLevelPeriodBasis __fastcall TProjectApplication::get_LevelPeriodBasis()
{
  return GetDefaultInterface()->get_LevelPeriodBasis();
}

void __fastcall TProjectApplication::set_LevelPeriodBasis(Msproject_2k::PjLevelPeriodBasis param)
{
  GetDefaultInterface()->set_LevelPeriodBasis(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_LevelIndividualAssignments()
{
  return GetDefaultInterface()->get_LevelIndividualAssignments();
}

void __fastcall TProjectApplication::set_LevelIndividualAssignments(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_LevelIndividualAssignments(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_LevelingCanSplit()
{
  return GetDefaultInterface()->get_LevelingCanSplit();
}

void __fastcall TProjectApplication::set_LevelingCanSplit(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_LevelingCanSplit(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_MoveAfterReturn()
{
  return GetDefaultInterface()->get_MoveAfterReturn();
}

void __fastcall TProjectApplication::set_MoveAfterReturn(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_MoveAfterReturn(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayScheduleMessages()
{
  return GetDefaultInterface()->get_DisplayScheduleMessages();
}

void __fastcall TProjectApplication::set_DisplayScheduleMessages(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayScheduleMessages(param);
}

Msproject_2k::PjWeekday __fastcall TProjectApplication::get_StartWeekOn()
{
  return GetDefaultInterface()->get_StartWeekOn();
}

void __fastcall TProjectApplication::set_StartWeekOn(Msproject_2k::PjWeekday param)
{
  GetDefaultInterface()->set_StartWeekOn(param);
}

Msproject_2k::PjMonth __fastcall TProjectApplication::get_StartYearIn()
{
  return GetDefaultInterface()->get_StartYearIn();
}

void __fastcall TProjectApplication::set_StartYearIn(Msproject_2k::PjMonth param)
{
  GetDefaultInterface()->set_StartYearIn(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_CellDragAndDrop()
{
  return GetDefaultInterface()->get_CellDragAndDrop();
}

void __fastcall TProjectApplication::set_CellDragAndDrop(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_CellDragAndDrop(param);
}

BSTR __fastcall TProjectApplication::get_UserName()
{
  return GetDefaultInterface()->get_UserName();
}

void __fastcall TProjectApplication::set_UserName(BSTR param)
{
  GetDefaultInterface()->set_UserName(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayNotesIndicator()
{
  return GetDefaultInterface()->get_DisplayNotesIndicator();
}

void __fastcall TProjectApplication::set_DisplayNotesIndicator(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayNotesIndicator(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_AskToUpdateLinks()
{
  return GetDefaultInterface()->get_AskToUpdateLinks();
}

void __fastcall TProjectApplication::set_AskToUpdateLinks(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AskToUpdateLinks(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayPlanningWizard()
{
  return GetDefaultInterface()->get_DisplayPlanningWizard();
}

void __fastcall TProjectApplication::set_DisplayPlanningWizard(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayPlanningWizard(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayWizardUsage()
{
  return GetDefaultInterface()->get_DisplayWizardUsage();
}

void __fastcall TProjectApplication::set_DisplayWizardUsage(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayWizardUsage(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayWizardErrors()
{
  return GetDefaultInterface()->get_DisplayWizardErrors();
}

void __fastcall TProjectApplication::set_DisplayWizardErrors(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayWizardErrors(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayWizardScheduling()
{
  return GetDefaultInterface()->get_DisplayWizardScheduling();
}

void __fastcall TProjectApplication::set_DisplayWizardScheduling(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayWizardScheduling(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_ShowTipOfDay()
{
  return GetDefaultInterface()->get_ShowTipOfDay();
}

void __fastcall TProjectApplication::set_ShowTipOfDay(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ShowTipOfDay(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_ShowToolTips()
{
  return GetDefaultInterface()->get_ShowToolTips();
}

void __fastcall TProjectApplication::set_ShowToolTips(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ShowToolTips(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_ShowWelcome()
{
  return GetDefaultInterface()->get_ShowWelcome();
}

void __fastcall TProjectApplication::set_ShowWelcome(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ShowWelcome(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_LoadLastFile()
{
  return GetDefaultInterface()->get_LoadLastFile();
}

void __fastcall TProjectApplication::set_LoadLastFile(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_LoadLastFile(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_PromptForSummaryInfo()
{
  return GetDefaultInterface()->get_PromptForSummaryInfo();
}

void __fastcall TProjectApplication::set_PromptForSummaryInfo(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_PromptForSummaryInfo(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayOLEIndicator()
{
  return GetDefaultInterface()->get_DisplayOLEIndicator();
}

void __fastcall TProjectApplication::set_DisplayOLEIndicator(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayOLEIndicator(param);
}

Msproject_2k::PjDateFormat __fastcall TProjectApplication::get_DefaultDateFormat()
{
  return GetDefaultInterface()->get_DefaultDateFormat();
}

void __fastcall TProjectApplication::set_DefaultDateFormat(Msproject_2k::PjDateFormat param)
{
  GetDefaultInterface()->set_DefaultDateFormat(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DayLeadingZero()
{
  return GetDefaultInterface()->get_DayLeadingZero();
}

void __fastcall TProjectApplication::set_DayLeadingZero(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DayLeadingZero(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_MonthLeadingZero()
{
  return GetDefaultInterface()->get_MonthLeadingZero();
}

void __fastcall TProjectApplication::set_MonthLeadingZero(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_MonthLeadingZero(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_TimeLeadingZero()
{
  return GetDefaultInterface()->get_TimeLeadingZero();
}

void __fastcall TProjectApplication::set_TimeLeadingZero(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_TimeLeadingZero(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_CopyResourceUsageHeader()
{
  return GetDefaultInterface()->get_CopyResourceUsageHeader();
}

void __fastcall TProjectApplication::set_CopyResourceUsageHeader(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_CopyResourceUsageHeader(param);
}

long __fastcall TProjectApplication::get_RecentFilesMaximum()
{
  return GetDefaultInterface()->get_RecentFilesMaximum();
}

void __fastcall TProjectApplication::set_RecentFilesMaximum(long param)
{
  GetDefaultInterface()->set_RecentFilesMaximum(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayRecentFiles()
{
  return GetDefaultInterface()->get_DisplayRecentFiles();
}

void __fastcall TProjectApplication::set_DisplayRecentFiles(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayRecentFiles(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_MacroVirusProtection()
{
  return GetDefaultInterface()->get_MacroVirusProtection();
}

void __fastcall TProjectApplication::set_MacroVirusProtection(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_MacroVirusProtection(param);
}

Msproject_2k::PjAssignmentUnits __fastcall TProjectApplication::get_ShowAssignmentUnitsAs()
{
  return GetDefaultInterface()->get_ShowAssignmentUnitsAs();
}

void __fastcall TProjectApplication::set_ShowAssignmentUnitsAs(Msproject_2k::PjAssignmentUnits param)
{
  GetDefaultInterface()->set_ShowAssignmentUnitsAs(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_AutomaticallyFillPhoneticFields()
{
  return GetDefaultInterface()->get_AutomaticallyFillPhoneticFields();
}

void __fastcall TProjectApplication::set_AutomaticallyFillPhoneticFields(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_AutomaticallyFillPhoneticFields(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DefaultAutoFilter()
{
  return GetDefaultInterface()->get_DefaultAutoFilter();
}

void __fastcall TProjectApplication::set_DefaultAutoFilter(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DefaultAutoFilter(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_ShowEstimatedDuration()
{
  return GetDefaultInterface()->get_ShowEstimatedDuration();
}

void __fastcall TProjectApplication::set_ShowEstimatedDuration(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_ShowEstimatedDuration(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_NewTasksEstimated()
{
  return GetDefaultInterface()->get_NewTasksEstimated();
}

void __fastcall TProjectApplication::set_NewTasksEstimated(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_NewTasksEstimated(param);
}

Office_2k::AssistantPtr __fastcall TProjectApplication::get_Assistant()
{
  return GetDefaultInterface()->get_Assistant();
}

void __fastcall TProjectApplication::set_Assistant(Office_2k::AssistantPtr param)
{
  GetDefaultInterface()->set_Assistant(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_DisplayViewBar()
{
  return GetDefaultInterface()->get_DisplayViewBar();
}

void __fastcall TProjectApplication::set_DisplayViewBar(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_DisplayViewBar(param);
}

Vbide_2k::VBEPtr __fastcall TProjectApplication::get_VBE()
{
  return GetDefaultInterface()->get_VBE();
}

void __fastcall TProjectApplication::set_VBE(Vbide_2k::VBEPtr param)
{
  GetDefaultInterface()->set_VBE(param);
}

Msproject_2k::PjEnableCancelKey __fastcall TProjectApplication::get_EnableCancelKey()
{
  return GetDefaultInterface()->get_EnableCancelKey();
}

void __fastcall TProjectApplication::set_EnableCancelKey(Msproject_2k::PjEnableCancelKey param)
{
  GetDefaultInterface()->set_EnableCancelKey(param);
}

VARIANT_BOOL __fastcall TProjectApplication::get_UserControl()
{
  return GetDefaultInterface()->get_UserControl();
}

void __fastcall TProjectApplication::set_UserControl(VARIANT_BOOL param)
{
  GetDefaultInterface()->set_UserControl(param);
}

double __fastcall TProjectApplication::get_UsableWidth()
{
  return GetDefaultInterface()->get_UsableWidth();
}

void __fastcall TProjectApplication::set_UsableWidth(double param)
{
  GetDefaultInterface()->set_UsableWidth(param);
}

double __fastcall TProjectApplication::get_UsableHeight()
{
  return GetDefaultInterface()->get_UsableHeight();
}

void __fastcall TProjectApplication::set_UsableHeight(double param)
{
  GetDefaultInterface()->set_UsableHeight(param);
}

VARIANT __fastcall TProjectApplication::get_StatusBar()
{
  return GetDefaultInterface()->get_StatusBar();
}

void __fastcall TProjectApplication::set_StatusBar(VARIANT param)
{
  GetDefaultInterface()->set_StatusBar(param);
}

Office_2k::FileSearchPtr __fastcall TProjectApplication::get_FileSearch()
{
  return GetDefaultInterface()->get_FileSearch();
}

void __fastcall TProjectApplication::set_FileSearch(Office_2k::FileSearchPtr param)
{
  GetDefaultInterface()->set_FileSearch(param);
}

Msproject_2k::WindowsPtr __fastcall TProjectApplication::get_Windoz(void)
{
  return  GetDefaultInterface()->get_Windoz();
}

Office_2k::CommandBarsPtr __fastcall TProjectApplication::get_CommandBars(void)
{
  return  GetDefaultInterface()->get_CommandBars();
}

Office_2k::AnswerWizardPtr __fastcall TProjectApplication::get_AnswerWizard(void)
{
  return  GetDefaultInterface()->get_AnswerWizard();
}

BSTR __fastcall TProjectApplication::get_OperatingSystem(void)
{
  return  GetDefaultInterface()->get_OperatingSystem();
}

BSTR __fastcall TProjectApplication::get_FileFormatID(BSTR Name, VARIANT UserID/*[opt]*/, 
                                                      VARIANT DatabasePassWord/*[opt]*/)
{
  return  GetDefaultInterface()->get_FileFormatID(Name, UserID/*[opt]*/, DatabasePassWord/*[opt]*/);
}

BSTR __fastcall TProjectApplication::get_FileBuildID(BSTR Name, VARIANT UserID/*[opt]*/, 
                                                     VARIANT DatabasePassWord/*[opt]*/)
{
  return  GetDefaultInterface()->get_FileBuildID(Name, UserID/*[opt]*/, DatabasePassWord/*[opt]*/);
}

Office_2k::COMAddInsPtr __fastcall TProjectApplication::get_COMAddIns(void)
{
  return  GetDefaultInterface()->get_COMAddIns();
}


};     // namespace Msproject_2k


// *********************************************************************//
// The Register function is invoked by the IDE when this module is 
// installed in a Package. It provides the list of Components (including
// OCXes) implemented by this module. The following implementation
// informs the IDE of the OCX proxy classes implemented here.
// *********************************************************************//
namespace Msproject_2k_srvr
{

void __fastcall PACKAGE Register()
{
  // [2]
  System::Classes::TComponentClass cls_svr[] = {
                              __classid(Msproject_2k::TProject_), 
                              __classid(Msproject_2k::TProjectApplication)
                           };
  System::Classes::RegisterComponents("Office2K", cls_svr,
                     sizeof(cls_svr)/sizeof(cls_svr[0])-1);
}

};     // namespace Msproject_2k_srvr
