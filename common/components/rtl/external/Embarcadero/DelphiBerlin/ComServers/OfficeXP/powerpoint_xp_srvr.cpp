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

// $Rev: 48730 $
// File generated on 22/05/2012 10:26:37 from Type Library described below.

// ************************************************************************  //
// Type Lib: XP\MSPPT.olb (1)
// LIBID: {91493440-5A91-11CF-8700-00AA0060263B}
// LCID: 0
// Helpfile: C:\OLB\XP\VBAPP10.CHM 
// HelpString: Microsoft PowerPoint 10.0 Object Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.2 Office, (C:\Program Files (x86)\Common Files\Microsoft Shared\Office10\MSO.DLL)
//   (3) v5.3 VBIDE, (C:\Program Files (x86)\Common Files\Microsoft Shared\VBA\VBA6\VBE6EXT.OLB)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'Application' renamed to 'PowerPointApplication'
//   Hint: Symbol 'Global' renamed to 'PowerPointGlobal'
//   Hint: Symbol 'Presentation' renamed to 'PowerPointPresentation'
//   Hint: Symbol 'Slide' renamed to 'PowerPointSlide'
//   Hint: Symbol 'Windows' renamed to 'Windoz'
//   Hint: Symbol 'RGB' renamed to 'rgb'
//   Hint: Symbol 'Update' renamed to '_Update'
// Cmdline:
//   tlibimp  -C+ -Fe_XP -CE_XP_SRVR -Ha- -Hr+ -HpsOfficeXP -Yp+ -D.\cppXP -Cv-   -HpcPresentation -HpcSlide -HpcMaster XP\MSPPT.olb
// ************************************************************************ //

#include <vcl.h>
#pragma hdrstop

#include <oleserver.hpp>
#if defined(USING_ATL)
#include <atl\atlvcl.h>
#endif

#pragma option -w-8122
#include "PowerPoint_XP_SRVR.h"

#if !defined(__PRAGMA_PACKAGE_SMART_INIT)
#define      __PRAGMA_PACKAGE_SMART_INIT
#pragma package(smart_init)
#endif

namespace Powerpoint_xp
{

_ApplicationPtr& TPowerPointApplication::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TPowerPointApplication::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TPowerPointApplication::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TPowerPointApplication::Disconnect()
{
  if (m_DefaultIntf) {
    if (FAutoQuit)
      Quit();
    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TPowerPointApplication::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TPowerPointApplication::ConnectTo(_ApplicationPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TPowerPointApplication::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_PowerPointApplication;
  sd.IntfIID = __uuidof(_Application);
  sd.EventIID= __uuidof(EApplication);
  ServerData = &sd;
}

void __fastcall TPowerPointApplication::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 2001: {
      if (OnWindowSelectionChange) {
        (OnWindowSelectionChange)(this, (Powerpoint_xp::SelectionPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2002: {
      if (OnWindowBeforeRightClick) {
        (OnWindowBeforeRightClick)(this, (Powerpoint_xp::SelectionPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 2003: {
      if (OnWindowBeforeDoubleClick) {
        (OnWindowBeforeDoubleClick)(this, (Powerpoint_xp::SelectionPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 2004: {
      if (OnPresentationClose) {
        (OnPresentationClose)(this, (Powerpoint_xp::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2005: {
      if (OnPresentationSave) {
        (OnPresentationSave)(this, (Powerpoint_xp::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2006: {
      if (OnPresentationOpen) {
        (OnPresentationOpen)(this, (Powerpoint_xp::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2007: {
      if (OnNewPresentation) {
        (OnNewPresentation)(this, (Powerpoint_xp::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2008: {
      if (OnPresentationNewSlide) {
        (OnPresentationNewSlide)(this, (Powerpoint_xp::PowerPointSlidePtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2009: {
      if (OnWindowActivate) {
        (OnWindowActivate)(this, (Powerpoint_xp::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal), (Powerpoint_xp::DocumentWindowPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 2010: {
      if (OnWindowDeactivate) {
        (OnWindowDeactivate)(this, (Powerpoint_xp::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal), (Powerpoint_xp::DocumentWindowPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 2011: {
      if (OnSlideShowBegin) {
        (OnSlideShowBegin)(this, (Powerpoint_xp::SlideShowWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2012: {
      if (OnSlideShowNextBuild) {
        (OnSlideShowNextBuild)(this, (Powerpoint_xp::SlideShowWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2013: {
      if (OnSlideShowNextSlide) {
        (OnSlideShowNextSlide)(this, (Powerpoint_xp::SlideShowWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2014: {
      if (OnSlideShowEnd) {
        (OnSlideShowEnd)(this, (Powerpoint_xp::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2015: {
      if (OnPresentationPrint) {
        (OnPresentationPrint)(this, (Powerpoint_xp::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2016: {
      if (OnSlideSelectionChanged) {
        (OnSlideSelectionChanged)(this, (Powerpoint_xp::SlideRangePtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2017: {
      if (OnColorSchemeChanged) {
        (OnColorSchemeChanged)(this, (Powerpoint_xp::SlideRangePtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2018: {
      if (OnPresentationBeforeSave) {
        (OnPresentationBeforeSave)(this, (Powerpoint_xp::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 2019: {
      if (OnSlideShowNextClick) {
        (OnSlideShowNextClick)(this, (Powerpoint_xp::SlideShowWindowPtr)(LPDISPATCH)(params[0].pdispVal), (Powerpoint_xp::EffectPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TPowerPointApplication::Help(BSTR HelpFile/*[in,def,opt]*/, 
                                             int ContextID/*[in,def,opt]*/)
{
  GetDefaultInterface()->Help(HelpFile/*[in,def,opt]*/, ContextID/*[in,def,opt]*/);
}

void __fastcall TPowerPointApplication::Quit(void)
{
  GetDefaultInterface()->Quit();
}

VARIANT __fastcall TPowerPointApplication::Run(BSTR MacroName/*[in]*/, 
                                               LPSAFEARRAY* safeArrayOfParams/*[in]*/)
{
  VARIANT Run;
  OLECHECK(GetDefaultInterface()->Run(MacroName, safeArrayOfParams, (VARIANT*)&Run));
  return Run;
}

LPUNKNOWN __fastcall TPowerPointApplication::PPFileDialog(Powerpoint_xp::PpFileDialogType Type/*[in]*/)
{
  LPUNKNOWN PPFileDialog;
  OLECHECK(GetDefaultInterface()->PPFileDialog(Type, (LPUNKNOWN*)&PPFileDialog));
  return PPFileDialog;
}

void __fastcall TPowerPointApplication::Activate(void)
{
  GetDefaultInterface()->Activate();
}

VARIANT_BOOL __fastcall TPowerPointApplication::GetOptionFlag(long Option/*[in]*/, 
                                                              VARIANT_BOOL Persist/*[in,def,opt]*/)
{
  VARIANT_BOOL GetOptionFlag;
  OLECHECK(GetDefaultInterface()->GetOptionFlag(Option, Persist, (VARIANT_BOOL*)&GetOptionFlag));
  return GetOptionFlag;
}

void __fastcall TPowerPointApplication::SetOptionFlag(long Option/*[in]*/, 
                                                      VARIANT_BOOL State/*[in]*/, 
                                                      VARIANT_BOOL Persist/*[in,def,opt]*/)
{
  GetDefaultInterface()->SetOptionFlag(Option/*[in]*/, State/*[in]*/, Persist/*[in,def,opt]*/);
}

void __fastcall TPowerPointApplication::SetPerfMarker(int Marker/*[in]*/)
{
  GetDefaultInterface()->SetPerfMarker(Marker/*[in]*/);
}

Powerpoint_xp::PresentationsPtr __fastcall TPowerPointApplication::get_Presentations(void)
{
  Powerpoint_xp::PresentationsPtr Presentations;
  OLECHECK(GetDefaultInterface()->get_Presentations(&Presentations));
  return Presentations;
}

Powerpoint_xp::DocumentWindowsPtr __fastcall TPowerPointApplication::get_Windoz(void)
{
  Powerpoint_xp::DocumentWindowsPtr Windoz;
  OLECHECK(GetDefaultInterface()->get_Windoz(&Windoz));
  return Windoz;
}

LPUNKNOWN __fastcall TPowerPointApplication::get_Dialogs(void)
{
  LPUNKNOWN Dialogs;
  OLECHECK(GetDefaultInterface()->get_Dialogs((LPUNKNOWN*)&Dialogs));
  return Dialogs;
}

Powerpoint_xp::DocumentWindowPtr __fastcall TPowerPointApplication::get_ActiveWindow(void)
{
  Powerpoint_xp::DocumentWindowPtr ActiveWindow;
  OLECHECK(GetDefaultInterface()->get_ActiveWindow(&ActiveWindow));
  return ActiveWindow;
}

Powerpoint_xp::PowerPointPresentationPtr __fastcall TPowerPointApplication::get_ActivePresentation(void)
{
  Powerpoint_xp::PowerPointPresentationPtr ActivePresentation;
  OLECHECK(GetDefaultInterface()->get_ActivePresentation(&ActivePresentation));
  return ActivePresentation;
}

Powerpoint_xp::SlideShowWindowsPtr __fastcall TPowerPointApplication::get_SlideShowWindows(void)
{
  Powerpoint_xp::SlideShowWindowsPtr SlideShowWindows;
  OLECHECK(GetDefaultInterface()->get_SlideShowWindows(&SlideShowWindows));
  return SlideShowWindows;
}

Office_xp::CommandBarsPtr __fastcall TPowerPointApplication::get_CommandBars(void)
{
  Office_xp::CommandBarsPtr CommandBars;
  OLECHECK(GetDefaultInterface()->get_CommandBars(&CommandBars));
  return CommandBars;
}

BSTR __fastcall TPowerPointApplication::get_Path(void)
{
  BSTR Path = 0;
  OLECHECK(GetDefaultInterface()->get_Path((BSTR*)&Path));
  return Path;
}

BSTR __fastcall TPowerPointApplication::get_Name(void)
{
  BSTR Name = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&Name));
  return Name;
}

BSTR __fastcall TPowerPointApplication::get_Caption(void)
{
  BSTR Caption = 0;
  OLECHECK(GetDefaultInterface()->get_Caption((BSTR*)&Caption));
  return Caption;
}

void __fastcall TPowerPointApplication::set_Caption(BSTR Caption/*[in]*/)
{
  GetDefaultInterface()->set_Caption(Caption/*[in]*/);
}

Office_xp::AssistantPtr __fastcall TPowerPointApplication::get_Assistant(void)
{
  Office_xp::AssistantPtr Assistant;
  OLECHECK(GetDefaultInterface()->get_Assistant(&Assistant));
  return Assistant;
}

Office_xp::FileSearchPtr __fastcall TPowerPointApplication::get_FileSearch(void)
{
  Office_xp::FileSearchPtr FileSearch;
  OLECHECK(GetDefaultInterface()->get_FileSearch(&FileSearch));
  return FileSearch;
}

Office_xp::IFindPtr __fastcall TPowerPointApplication::get_FileFind(void)
{
  Office_xp::IFindPtr FileFind;
  OLECHECK(GetDefaultInterface()->get_FileFind(&FileFind));
  return FileFind;
}

BSTR __fastcall TPowerPointApplication::get_Build(void)
{
  BSTR Build = 0;
  OLECHECK(GetDefaultInterface()->get_Build((BSTR*)&Build));
  return Build;
}

BSTR __fastcall TPowerPointApplication::get_Version(void)
{
  BSTR Version = 0;
  OLECHECK(GetDefaultInterface()->get_Version((BSTR*)&Version));
  return Version;
}

BSTR __fastcall TPowerPointApplication::get_OperatingSystem(void)
{
  BSTR OperatingSystem = 0;
  OLECHECK(GetDefaultInterface()->get_OperatingSystem((BSTR*)&OperatingSystem));
  return OperatingSystem;
}

BSTR __fastcall TPowerPointApplication::get_ActivePrinter(void)
{
  BSTR ActivePrinter = 0;
  OLECHECK(GetDefaultInterface()->get_ActivePrinter((BSTR*)&ActivePrinter));
  return ActivePrinter;
}

long __fastcall TPowerPointApplication::get_Creator(void)
{
  long Creator;
  OLECHECK(GetDefaultInterface()->get_Creator((long*)&Creator));
  return Creator;
}

Powerpoint_xp::AddInsPtr __fastcall TPowerPointApplication::get_AddIns(void)
{
  Powerpoint_xp::AddInsPtr AddIns;
  OLECHECK(GetDefaultInterface()->get_AddIns(&AddIns));
  return AddIns;
}

Vbide_xp::VBEPtr __fastcall TPowerPointApplication::get_VBE(void)
{
  Vbide_xp::VBEPtr VBE;
  OLECHECK(GetDefaultInterface()->get_VBE(&VBE));
  return VBE;
}

float __fastcall TPowerPointApplication::get_Left(void)
{
  float Left;
  OLECHECK(GetDefaultInterface()->get_Left((float*)&Left));
  return Left;
}

void __fastcall TPowerPointApplication::set_Left(float Left/*[in]*/)
{
  GetDefaultInterface()->set_Left(Left/*[in]*/);
}

float __fastcall TPowerPointApplication::get_Top(void)
{
  float Top;
  OLECHECK(GetDefaultInterface()->get_Top((float*)&Top));
  return Top;
}

void __fastcall TPowerPointApplication::set_Top(float Top/*[in]*/)
{
  GetDefaultInterface()->set_Top(Top/*[in]*/);
}

float __fastcall TPowerPointApplication::get_Width(void)
{
  float Width;
  OLECHECK(GetDefaultInterface()->get_Width((float*)&Width));
  return Width;
}

void __fastcall TPowerPointApplication::set_Width(float Width/*[in]*/)
{
  GetDefaultInterface()->set_Width(Width/*[in]*/);
}

float __fastcall TPowerPointApplication::get_Height(void)
{
  float Height;
  OLECHECK(GetDefaultInterface()->get_Height((float*)&Height));
  return Height;
}

void __fastcall TPowerPointApplication::set_Height(float Height/*[in]*/)
{
  GetDefaultInterface()->set_Height(Height/*[in]*/);
}

Powerpoint_xp::PpWindowState __fastcall TPowerPointApplication::get_WindowState(void)
{
  Powerpoint_xp::PpWindowState WindowState;
  OLECHECK(GetDefaultInterface()->get_WindowState((Powerpoint_xp::PpWindowState*)&WindowState));
  return WindowState;
}

void __fastcall TPowerPointApplication::set_WindowState(Powerpoint_xp::PpWindowState WindowState/*[in]*/)
{
  GetDefaultInterface()->set_WindowState(WindowState/*[in]*/);
}

Office_xp::MsoTriState __fastcall TPowerPointApplication::get_Visible(void)
{
  Office_xp::MsoTriState Visible;
  OLECHECK(GetDefaultInterface()->get_Visible((Office_xp::MsoTriState*)&Visible));
  return Visible;
}

void __fastcall TPowerPointApplication::set_Visible(Office_xp::MsoTriState Visible/*[in]*/)
{
  GetDefaultInterface()->set_Visible(Visible/*[in]*/);
}

Office_xp::MsoTriState __fastcall TPowerPointApplication::get_Active(void)
{
  Office_xp::MsoTriState Active;
  OLECHECK(GetDefaultInterface()->get_Active((Office_xp::MsoTriState*)&Active));
  return Active;
}

Office_xp::AnswerWizardPtr __fastcall TPowerPointApplication::get_AnswerWizard(void)
{
  Office_xp::AnswerWizardPtr AnswerWizard;
  OLECHECK(GetDefaultInterface()->get_AnswerWizard(&AnswerWizard));
  return AnswerWizard;
}

Office_xp::COMAddInsPtr __fastcall TPowerPointApplication::get_COMAddIns(void)
{
  Office_xp::COMAddInsPtr COMAddIns;
  OLECHECK(GetDefaultInterface()->get_COMAddIns(&COMAddIns));
  return COMAddIns;
}

BSTR __fastcall TPowerPointApplication::get_ProductCode(void)
{
  BSTR ProductCode = 0;
  OLECHECK(GetDefaultInterface()->get_ProductCode((BSTR*)&ProductCode));
  return ProductCode;
}

Powerpoint_xp::DefaultWebOptionsPtr __fastcall TPowerPointApplication::get_DefaultWebOptions(void)
{
  Powerpoint_xp::DefaultWebOptionsPtr DefaultWebOptions;
  OLECHECK(GetDefaultInterface()->get_DefaultWebOptions(&DefaultWebOptions));
  return DefaultWebOptions;
}

Office_xp::LanguageSettingsPtr __fastcall TPowerPointApplication::get_LanguageSettings(void)
{
  Office_xp::LanguageSettingsPtr LanguageSettings;
  OLECHECK(GetDefaultInterface()->get_LanguageSettings(&LanguageSettings));
  return LanguageSettings;
}

Office_xp::MsoDebugOptionsPtr __fastcall TPowerPointApplication::get_MsoDebugOptions(void)
{
  Office_xp::MsoDebugOptionsPtr MsoDebugOptions;
  OLECHECK(GetDefaultInterface()->get_MsoDebugOptions(&MsoDebugOptions));
  return MsoDebugOptions;
}

Office_xp::MsoTriState __fastcall TPowerPointApplication::get_ShowWindowsInTaskbar(void)
{
  Office_xp::MsoTriState ShowWindowsInTaskbar;
  OLECHECK(GetDefaultInterface()->get_ShowWindowsInTaskbar((Office_xp::MsoTriState*)&ShowWindowsInTaskbar));
  return ShowWindowsInTaskbar;
}

void __fastcall TPowerPointApplication::set_ShowWindowsInTaskbar(Office_xp::MsoTriState ShowWindowsInTaskbar/*[in]*/)
{
  GetDefaultInterface()->set_ShowWindowsInTaskbar(ShowWindowsInTaskbar/*[in]*/);
}

LPUNKNOWN __fastcall TPowerPointApplication::get_Marker(void)
{
  LPUNKNOWN Marker;
  OLECHECK(GetDefaultInterface()->get_Marker((LPUNKNOWN*)&Marker));
  return Marker;
}

Office_xp::MsoFeatureInstall __fastcall TPowerPointApplication::get_FeatureInstall(void)
{
  Office_xp::MsoFeatureInstall FeatureInstall;
  OLECHECK(GetDefaultInterface()->get_FeatureInstall((Office_xp::MsoFeatureInstall*)&FeatureInstall));
  return FeatureInstall;
}

void __fastcall TPowerPointApplication::set_FeatureInstall(Office_xp::MsoFeatureInstall FeatureInstall/*[in]*/)
{
  GetDefaultInterface()->set_FeatureInstall(FeatureInstall/*[in]*/);
}

Office_xp::FileDialog* __fastcall TPowerPointApplication::get_FileDialog(Office_xp::MsoFileDialogType Type/*[in]*/)
{
  Office_xp::FileDialog* FileDialog = 0;
  OLECHECK(GetDefaultInterface()->get_FileDialog(Type, (Office_xp::FileDialog**)&FileDialog));
  return FileDialog;
}

Office_xp::MsoTriState __fastcall TPowerPointApplication::get_DisplayGridLines(void)
{
  Office_xp::MsoTriState DisplayGridLines;
  OLECHECK(GetDefaultInterface()->get_DisplayGridLines((Office_xp::MsoTriState*)&DisplayGridLines));
  return DisplayGridLines;
}

void __fastcall TPowerPointApplication::set_DisplayGridLines(Office_xp::MsoTriState DisplayGridLines/*[in]*/)
{
  GetDefaultInterface()->set_DisplayGridLines(DisplayGridLines/*[in]*/);
}

Office_xp::MsoAutomationSecurity __fastcall TPowerPointApplication::get_AutomationSecurity(void)
{
  Office_xp::MsoAutomationSecurity AutomationSecurity;
  OLECHECK(GetDefaultInterface()->get_AutomationSecurity((Office_xp::MsoAutomationSecurity*)&AutomationSecurity));
  return AutomationSecurity;
}

void __fastcall TPowerPointApplication::set_AutomationSecurity(Office_xp::MsoAutomationSecurity AutomationSecurity/*[in]*/)
{
  GetDefaultInterface()->set_AutomationSecurity(AutomationSecurity/*[in]*/);
}

Office_xp::NewFilePtr __fastcall TPowerPointApplication::get_NewPresentation(void)
{
  Office_xp::NewFilePtr NewPresentation;
  OLECHECK(GetDefaultInterface()->get_NewPresentation(&NewPresentation));
  return NewPresentation;
}

Powerpoint_xp::PpAlertLevel __fastcall TPowerPointApplication::get_DisplayAlerts(void)
{
  Powerpoint_xp::PpAlertLevel DisplayAlerts;
  OLECHECK(GetDefaultInterface()->get_DisplayAlerts((Powerpoint_xp::PpAlertLevel*)&DisplayAlerts));
  return DisplayAlerts;
}

void __fastcall TPowerPointApplication::set_DisplayAlerts(Powerpoint_xp::PpAlertLevel DisplayAlerts/*[in]*/)
{
  GetDefaultInterface()->set_DisplayAlerts(DisplayAlerts/*[in]*/);
}

Office_xp::MsoTriState __fastcall TPowerPointApplication::get_ShowStartupDialog(void)
{
  Office_xp::MsoTriState ShowStartupDialog;
  OLECHECK(GetDefaultInterface()->get_ShowStartupDialog((Office_xp::MsoTriState*)&ShowStartupDialog));
  return ShowStartupDialog;
}

void __fastcall TPowerPointApplication::set_ShowStartupDialog(Office_xp::MsoTriState ShowStartupDialog/*[in]*/)
{
  GetDefaultInterface()->set_ShowStartupDialog(ShowStartupDialog/*[in]*/);
}

Powerpoint_xp::AutoCorrectPtr __fastcall TPowerPointApplication::get_AutoCorrect(void)
{
  Powerpoint_xp::AutoCorrectPtr AutoCorrect;
  OLECHECK(GetDefaultInterface()->get_AutoCorrect(&AutoCorrect));
  return AutoCorrect;
}

Powerpoint_xp::OptionsPtr __fastcall TPowerPointApplication::get_Options(void)
{
  Powerpoint_xp::OptionsPtr Options;
  OLECHECK(GetDefaultInterface()->get_Options(&Options));
  return Options;
}

_PresentationPtr& TPowerPointPresentation::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TPowerPointPresentation::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TPowerPointPresentation::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TPowerPointPresentation::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TPowerPointPresentation::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TPowerPointPresentation::ConnectTo(_PresentationPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TPowerPointPresentation::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_PowerPointPresentation;
  sd.IntfIID = __uuidof(_Presentation);
  sd.EventIID= __uuidof(PresEvents);
  ServerData = &sd;
}

void __fastcall TPowerPointPresentation::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    default:
      break;
  }
}

Powerpoint_xp::_Master* __fastcall TPowerPointPresentation::AddTitleMaster(void)
{
  Powerpoint_xp::_Master* TitleMaster = 0;
  OLECHECK(GetDefaultInterface()->AddTitleMaster((Powerpoint_xp::_Master**)&TitleMaster));
  return TitleMaster;
}

void __fastcall TPowerPointPresentation::ApplyTemplate(BSTR FileName/*[in]*/)
{
  GetDefaultInterface()->ApplyTemplate(FileName/*[in]*/);
}

Powerpoint_xp::DocumentWindow* __fastcall TPowerPointPresentation::NewWindow(void)
{
  Powerpoint_xp::DocumentWindow* NewWindow = 0;
  OLECHECK(GetDefaultInterface()->NewWindow((Powerpoint_xp::DocumentWindow**)&NewWindow));
  return NewWindow;
}

void __fastcall TPowerPointPresentation::FollowHyperlink(BSTR Address/*[in]*/, 
                                                         BSTR SubAddress/*[in,def,opt]*/, 
                                                         VARIANT_BOOL NewWindow/*[in,def,opt]*/, 
                                                         VARIANT_BOOL AddHistory/*[in,def,opt]*/, 
                                                         BSTR ExtraInfo/*[in,def,opt]*/, 
                                                         Office_xp::MsoExtraInfoMethod Method/*[in,def,opt]*/, 
                                                         BSTR HeaderInfo/*[in,def,opt]*/)
{
  GetDefaultInterface()->FollowHyperlink(Address/*[in]*/, SubAddress/*[in,def,opt]*/, 
                                         NewWindow/*[in,def,opt]*/, AddHistory/*[in,def,opt]*/, 
                                         ExtraInfo/*[in,def,opt]*/, Method/*[in,def,opt]*/, 
                                         HeaderInfo/*[in,def,opt]*/);
}

void __fastcall TPowerPointPresentation::AddToFavorites(void)
{
  GetDefaultInterface()->AddToFavorites();
}

void __fastcall TPowerPointPresentation::PrintOut(int From/*[in,def,opt]*/, int To/*[in,def,opt]*/, 
                                                  BSTR PrintToFile/*[in,def,opt]*/, 
                                                  int Copies/*[in,def,opt]*/, 
                                                  Office_xp::MsoTriState Collate/*[in,def,opt]*/)
{
  GetDefaultInterface()->PrintOut(From/*[in,def,opt]*/, To/*[in,def,opt]*/, 
                                  PrintToFile/*[in,def,opt]*/, Copies/*[in,def,opt]*/, 
                                  Collate/*[in,def,opt]*/);
}

void __fastcall TPowerPointPresentation::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TPowerPointPresentation::SaveAs(BSTR FileName/*[in]*/, 
                                                Powerpoint_xp::PpSaveAsFileType FileFormat/*[in,def,opt]*/, 
                                                Office_xp::MsoTriState EmbedTrueTypeFonts/*[in,def,opt]*/)
{
  GetDefaultInterface()->SaveAs(FileName/*[in]*/, FileFormat/*[in,def,opt]*/, 
                                EmbedTrueTypeFonts/*[in,def,opt]*/);
}

void __fastcall TPowerPointPresentation::SaveCopyAs(BSTR FileName/*[in]*/, 
                                                    Powerpoint_xp::PpSaveAsFileType FileFormat/*[in,def,opt]*/, 
                                                    Office_xp::MsoTriState EmbedTrueTypeFonts/*[in,def,opt]*/)
{
  GetDefaultInterface()->SaveCopyAs(FileName/*[in]*/, FileFormat/*[in,def,opt]*/, 
                                    EmbedTrueTypeFonts/*[in,def,opt]*/);
}

void __fastcall TPowerPointPresentation::Export(BSTR Path/*[in]*/, BSTR FilterName/*[in]*/, 
                                                int ScaleWidth/*[in,def,opt]*/, 
                                                int ScaleHeight/*[in,def,opt]*/)
{
  GetDefaultInterface()->Export(Path/*[in]*/, FilterName/*[in]*/, ScaleWidth/*[in,def,opt]*/, 
                                ScaleHeight/*[in,def,opt]*/);
}

void __fastcall TPowerPointPresentation::Close(void)
{
  GetDefaultInterface()->Close();
}

void __fastcall TPowerPointPresentation::SetUndoText(BSTR Text/*[in]*/)
{
  GetDefaultInterface()->SetUndoText(Text/*[in]*/);
}

void __fastcall TPowerPointPresentation::UpdateLinks(void)
{
  GetDefaultInterface()->UpdateLinks();
}

void __fastcall TPowerPointPresentation::WebPagePreview(void)
{
  GetDefaultInterface()->WebPagePreview();
}

void __fastcall TPowerPointPresentation::ReloadAs(Office_xp::MsoEncoding cp/*[in]*/)
{
  GetDefaultInterface()->ReloadAs(cp/*[in]*/);
}

void __fastcall TPowerPointPresentation::MakeIntoTemplate(Office_xp::MsoTriState IsDesignTemplate/*[in]*/)
{
  GetDefaultInterface()->MakeIntoTemplate(IsDesignTemplate/*[in]*/);
}

void __fastcall TPowerPointPresentation::sblt(BSTR s/*[in]*/)
{
  GetDefaultInterface()->sblt(s/*[in]*/);
}

void __fastcall TPowerPointPresentation::Merge(BSTR Path/*[in]*/)
{
  GetDefaultInterface()->Merge(Path/*[in]*/);
}

void __fastcall TPowerPointPresentation::CheckIn(VARIANT_BOOL SaveChanges/*[in,def,opt]*/, 
                                                 VARIANT Comments/*[in,opt]*/, 
                                                 VARIANT MakePublic/*[in,opt]*/)
{
  GetDefaultInterface()->CheckIn(SaveChanges/*[in,def,opt]*/, Comments/*[in,opt]*/, 
                                 MakePublic/*[in,opt]*/);
}

VARIANT_BOOL __fastcall TPowerPointPresentation::CanCheckIn(void)
{
  VARIANT_BOOL CanCheckIn;
  OLECHECK(GetDefaultInterface()->CanCheckIn((VARIANT_BOOL*)&CanCheckIn));
  return CanCheckIn;
}

void __fastcall TPowerPointPresentation::SendForReview(BSTR Recipients/*[in,def,opt]*/, 
                                                       BSTR Subject/*[in,def,opt]*/, 
                                                       VARIANT_BOOL ShowMessage/*[in,def,opt]*/, 
                                                       VARIANT IncludeAttachment/*[in,opt]*/)
{
  GetDefaultInterface()->SendForReview(Recipients/*[in,def,opt]*/, Subject/*[in,def,opt]*/, 
                                       ShowMessage/*[in,def,opt]*/, IncludeAttachment/*[in,opt]*/);
}

void __fastcall TPowerPointPresentation::ReplyWithChanges(VARIANT_BOOL ShowMessage/*[in,def,opt]*/)
{
  GetDefaultInterface()->ReplyWithChanges(ShowMessage/*[in,def,opt]*/);
}

void __fastcall TPowerPointPresentation::EndReview(void)
{
  GetDefaultInterface()->EndReview();
}

void __fastcall TPowerPointPresentation::AddBaseline(BSTR FileName/*[in,def,opt]*/)
{
  GetDefaultInterface()->AddBaseline(FileName/*[in,def,opt]*/);
}

void __fastcall TPowerPointPresentation::RemoveBaseline(void)
{
  GetDefaultInterface()->RemoveBaseline();
}

void __fastcall TPowerPointPresentation::SetPasswordEncryptionOptions(BSTR PasswordEncryptionProvider/*[in]*/, 
                                                                      BSTR PasswordEncryptionAlgorithm/*[in]*/, 
                                                                      int PasswordEncryptionKeyLength/*[in]*/, 
                                                                      VARIANT_BOOL PasswordEncryptionFileProperties/*[in]*/)
{
  GetDefaultInterface()->SetPasswordEncryptionOptions(PasswordEncryptionProvider/*[in]*/, 
                                                      PasswordEncryptionAlgorithm/*[in]*/, 
                                                      PasswordEncryptionKeyLength/*[in]*/, 
                                                      PasswordEncryptionFileProperties/*[in]*/);
}

Powerpoint_xp::PowerPointApplicationPtr __fastcall TPowerPointPresentation::get_Application(void)
{
  Powerpoint_xp::PowerPointApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

LPDISPATCH __fastcall TPowerPointPresentation::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Powerpoint_xp::_MasterPtr __fastcall TPowerPointPresentation::get_SlideMaster(void)
{
  Powerpoint_xp::_MasterPtr SlideMaster;
  OLECHECK(GetDefaultInterface()->get_SlideMaster(&SlideMaster));
  return SlideMaster;
}

Powerpoint_xp::_MasterPtr __fastcall TPowerPointPresentation::get_TitleMaster(void)
{
  Powerpoint_xp::_MasterPtr TitleMaster;
  OLECHECK(GetDefaultInterface()->get_TitleMaster(&TitleMaster));
  return TitleMaster;
}

Office_xp::MsoTriState __fastcall TPowerPointPresentation::get_HasTitleMaster(void)
{
  Office_xp::MsoTriState HasTitleMaster;
  OLECHECK(GetDefaultInterface()->get_HasTitleMaster((Office_xp::MsoTriState*)&HasTitleMaster));
  return HasTitleMaster;
}

BSTR __fastcall TPowerPointPresentation::get_TemplateName(void)
{
  BSTR TemplateName = 0;
  OLECHECK(GetDefaultInterface()->get_TemplateName((BSTR*)&TemplateName));
  return TemplateName;
}

Powerpoint_xp::_MasterPtr __fastcall TPowerPointPresentation::get_NotesMaster(void)
{
  Powerpoint_xp::_MasterPtr NotesMaster;
  OLECHECK(GetDefaultInterface()->get_NotesMaster(&NotesMaster));
  return NotesMaster;
}

Powerpoint_xp::_MasterPtr __fastcall TPowerPointPresentation::get_HandoutMaster(void)
{
  Powerpoint_xp::_MasterPtr HandoutMaster;
  OLECHECK(GetDefaultInterface()->get_HandoutMaster(&HandoutMaster));
  return HandoutMaster;
}

Powerpoint_xp::SlidesPtr __fastcall TPowerPointPresentation::get_Slides(void)
{
  Powerpoint_xp::SlidesPtr Slides;
  OLECHECK(GetDefaultInterface()->get_Slides(&Slides));
  return Slides;
}

Powerpoint_xp::PageSetupPtr __fastcall TPowerPointPresentation::get_PageSetup(void)
{
  Powerpoint_xp::PageSetupPtr PageSetup;
  OLECHECK(GetDefaultInterface()->get_PageSetup(&PageSetup));
  return PageSetup;
}

Powerpoint_xp::ColorSchemesPtr __fastcall TPowerPointPresentation::get_ColorSchemes(void)
{
  Powerpoint_xp::ColorSchemesPtr ColorSchemes;
  OLECHECK(GetDefaultInterface()->get_ColorSchemes(&ColorSchemes));
  return ColorSchemes;
}

Powerpoint_xp::ExtraColorsPtr __fastcall TPowerPointPresentation::get_ExtraColors(void)
{
  Powerpoint_xp::ExtraColorsPtr ExtraColors;
  OLECHECK(GetDefaultInterface()->get_ExtraColors(&ExtraColors));
  return ExtraColors;
}

Powerpoint_xp::SlideShowSettingsPtr __fastcall TPowerPointPresentation::get_SlideShowSettings(void)
{
  Powerpoint_xp::SlideShowSettingsPtr SlideShowSettings;
  OLECHECK(GetDefaultInterface()->get_SlideShowSettings(&SlideShowSettings));
  return SlideShowSettings;
}

Powerpoint_xp::FontsPtr __fastcall TPowerPointPresentation::get_Fonts(void)
{
  Powerpoint_xp::FontsPtr Fonts;
  OLECHECK(GetDefaultInterface()->get_Fonts(&Fonts));
  return Fonts;
}

Powerpoint_xp::DocumentWindowsPtr __fastcall TPowerPointPresentation::get_Windoz(void)
{
  Powerpoint_xp::DocumentWindowsPtr Windoz;
  OLECHECK(GetDefaultInterface()->get_Windoz(&Windoz));
  return Windoz;
}

Powerpoint_xp::TagsPtr __fastcall TPowerPointPresentation::get_Tags(void)
{
  Powerpoint_xp::TagsPtr Tags;
  OLECHECK(GetDefaultInterface()->get_Tags(&Tags));
  return Tags;
}

Powerpoint_xp::ShapePtr __fastcall TPowerPointPresentation::get_DefaultShape(void)
{
  Powerpoint_xp::ShapePtr DefaultShape;
  OLECHECK(GetDefaultInterface()->get_DefaultShape(&DefaultShape));
  return DefaultShape;
}

LPDISPATCH __fastcall TPowerPointPresentation::get_BuiltInDocumentProperties(void)
{
  LPDISPATCH BuiltInDocumentProperties;
  OLECHECK(GetDefaultInterface()->get_BuiltInDocumentProperties((LPDISPATCH*)&BuiltInDocumentProperties));
  return BuiltInDocumentProperties;
}

LPDISPATCH __fastcall TPowerPointPresentation::get_CustomDocumentProperties(void)
{
  LPDISPATCH CustomDocumentProperties;
  OLECHECK(GetDefaultInterface()->get_CustomDocumentProperties((LPDISPATCH*)&CustomDocumentProperties));
  return CustomDocumentProperties;
}

Vbide_xp::VBProjectPtr __fastcall TPowerPointPresentation::get_VBProject(void)
{
  Vbide_xp::VBProjectPtr VBProject;
  OLECHECK(GetDefaultInterface()->get_VBProject(&VBProject));
  return VBProject;
}

Office_xp::MsoTriState __fastcall TPowerPointPresentation::get_ReadOnly(void)
{
  Office_xp::MsoTriState ReadOnly;
  OLECHECK(GetDefaultInterface()->get_ReadOnly((Office_xp::MsoTriState*)&ReadOnly));
  return ReadOnly;
}

BSTR __fastcall TPowerPointPresentation::get_FullName(void)
{
  BSTR FullName = 0;
  OLECHECK(GetDefaultInterface()->get_FullName((BSTR*)&FullName));
  return FullName;
}

BSTR __fastcall TPowerPointPresentation::get_Name(void)
{
  BSTR Name = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&Name));
  return Name;
}

BSTR __fastcall TPowerPointPresentation::get_Path(void)
{
  BSTR Path = 0;
  OLECHECK(GetDefaultInterface()->get_Path((BSTR*)&Path));
  return Path;
}

Office_xp::MsoTriState __fastcall TPowerPointPresentation::get_Saved(void)
{
  Office_xp::MsoTriState Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((Office_xp::MsoTriState*)&Saved));
  return Saved;
}

void __fastcall TPowerPointPresentation::set_Saved(Office_xp::MsoTriState Saved/*[in]*/)
{
  GetDefaultInterface()->set_Saved(Saved/*[in]*/);
}

Powerpoint_xp::PpDirection __fastcall TPowerPointPresentation::get_LayoutDirection(void)
{
  Powerpoint_xp::PpDirection LayoutDirection;
  OLECHECK(GetDefaultInterface()->get_LayoutDirection((Powerpoint_xp::PpDirection*)&LayoutDirection));
  return LayoutDirection;
}

void __fastcall TPowerPointPresentation::set_LayoutDirection(Powerpoint_xp::PpDirection LayoutDirection/*[in]*/)
{
  GetDefaultInterface()->set_LayoutDirection(LayoutDirection/*[in]*/);
}

Powerpoint_xp::PrintOptionsPtr __fastcall TPowerPointPresentation::get_PrintOptions(void)
{
  Powerpoint_xp::PrintOptionsPtr PrintOptions;
  OLECHECK(GetDefaultInterface()->get_PrintOptions(&PrintOptions));
  return PrintOptions;
}

LPDISPATCH __fastcall TPowerPointPresentation::get_Container(void)
{
  LPDISPATCH Container;
  OLECHECK(GetDefaultInterface()->get_Container((LPDISPATCH*)&Container));
  return Container;
}

Office_xp::MsoTriState __fastcall TPowerPointPresentation::get_DisplayComments(void)
{
  Office_xp::MsoTriState DisplayComments;
  OLECHECK(GetDefaultInterface()->get_DisplayComments((Office_xp::MsoTriState*)&DisplayComments));
  return DisplayComments;
}

void __fastcall TPowerPointPresentation::set_DisplayComments(Office_xp::MsoTriState DisplayComments/*[in]*/)
{
  GetDefaultInterface()->set_DisplayComments(DisplayComments/*[in]*/);
}

Powerpoint_xp::PpFarEastLineBreakLevel __fastcall TPowerPointPresentation::get_FarEastLineBreakLevel(void)
{
  Powerpoint_xp::PpFarEastLineBreakLevel FarEastLineBreakLevel;
  OLECHECK(GetDefaultInterface()->get_FarEastLineBreakLevel((Powerpoint_xp::PpFarEastLineBreakLevel*)&FarEastLineBreakLevel));
  return FarEastLineBreakLevel;
}

void __fastcall TPowerPointPresentation::set_FarEastLineBreakLevel(Powerpoint_xp::PpFarEastLineBreakLevel FarEastLineBreakLevel/*[in]*/)
{
  GetDefaultInterface()->set_FarEastLineBreakLevel(FarEastLineBreakLevel/*[in]*/);
}

BSTR __fastcall TPowerPointPresentation::get_NoLineBreakBefore(void)
{
  BSTR NoLineBreakBefore = 0;
  OLECHECK(GetDefaultInterface()->get_NoLineBreakBefore((BSTR*)&NoLineBreakBefore));
  return NoLineBreakBefore;
}

void __fastcall TPowerPointPresentation::set_NoLineBreakBefore(BSTR NoLineBreakBefore/*[in]*/)
{
  GetDefaultInterface()->set_NoLineBreakBefore(NoLineBreakBefore/*[in]*/);
}

BSTR __fastcall TPowerPointPresentation::get_NoLineBreakAfter(void)
{
  BSTR NoLineBreakAfter = 0;
  OLECHECK(GetDefaultInterface()->get_NoLineBreakAfter((BSTR*)&NoLineBreakAfter));
  return NoLineBreakAfter;
}

void __fastcall TPowerPointPresentation::set_NoLineBreakAfter(BSTR NoLineBreakAfter/*[in]*/)
{
  GetDefaultInterface()->set_NoLineBreakAfter(NoLineBreakAfter/*[in]*/);
}

Powerpoint_xp::SlideShowWindowPtr __fastcall TPowerPointPresentation::get_SlideShowWindow(void)
{
  Powerpoint_xp::SlideShowWindowPtr SlideShowWindow;
  OLECHECK(GetDefaultInterface()->get_SlideShowWindow(&SlideShowWindow));
  return SlideShowWindow;
}

Office_xp::MsoFarEastLineBreakLanguageID __fastcall TPowerPointPresentation::get_FarEastLineBreakLanguage(void)
{
  Office_xp::MsoFarEastLineBreakLanguageID FarEastLineBreakLanguage;
  OLECHECK(GetDefaultInterface()->get_FarEastLineBreakLanguage((Office_xp::MsoFarEastLineBreakLanguageID*)&FarEastLineBreakLanguage));
  return FarEastLineBreakLanguage;
}

void __fastcall TPowerPointPresentation::set_FarEastLineBreakLanguage(Office_xp::MsoFarEastLineBreakLanguageID FarEastLineBreakLanguage/*[in]*/)
{
  GetDefaultInterface()->set_FarEastLineBreakLanguage(FarEastLineBreakLanguage/*[in]*/);
}

Office_xp::MsoLanguageID __fastcall TPowerPointPresentation::get_DefaultLanguageID(void)
{
  Office_xp::MsoLanguageID DefaultLanguageID;
  OLECHECK(GetDefaultInterface()->get_DefaultLanguageID((Office_xp::MsoLanguageID*)&DefaultLanguageID));
  return DefaultLanguageID;
}

void __fastcall TPowerPointPresentation::set_DefaultLanguageID(Office_xp::MsoLanguageID DefaultLanguageID/*[in]*/)
{
  GetDefaultInterface()->set_DefaultLanguageID(DefaultLanguageID/*[in]*/);
}

Office_xp::CommandBarsPtr __fastcall TPowerPointPresentation::get_CommandBars(void)
{
  Office_xp::CommandBarsPtr CommandBars;
  OLECHECK(GetDefaultInterface()->get_CommandBars(&CommandBars));
  return CommandBars;
}

Powerpoint_xp::PublishObjectsPtr __fastcall TPowerPointPresentation::get_PublishObjects(void)
{
  Powerpoint_xp::PublishObjectsPtr PublishObjects;
  OLECHECK(GetDefaultInterface()->get_PublishObjects(&PublishObjects));
  return PublishObjects;
}

Powerpoint_xp::WebOptionsPtr __fastcall TPowerPointPresentation::get_WebOptions(void)
{
  Powerpoint_xp::WebOptionsPtr WebOptions;
  OLECHECK(GetDefaultInterface()->get_WebOptions(&WebOptions));
  return WebOptions;
}

Office_xp::HTMLProjectPtr __fastcall TPowerPointPresentation::get_HTMLProject(void)
{
  Office_xp::HTMLProjectPtr HTMLProject;
  OLECHECK(GetDefaultInterface()->get_HTMLProject(&HTMLProject));
  return HTMLProject;
}

Office_xp::MsoTriState __fastcall TPowerPointPresentation::get_EnvelopeVisible(void)
{
  Office_xp::MsoTriState EnvelopeVisible;
  OLECHECK(GetDefaultInterface()->get_EnvelopeVisible((Office_xp::MsoTriState*)&EnvelopeVisible));
  return EnvelopeVisible;
}

void __fastcall TPowerPointPresentation::set_EnvelopeVisible(Office_xp::MsoTriState EnvelopeVisible/*[in]*/)
{
  GetDefaultInterface()->set_EnvelopeVisible(EnvelopeVisible/*[in]*/);
}

Office_xp::MsoTriState __fastcall TPowerPointPresentation::get_VBASigned(void)
{
  Office_xp::MsoTriState VBASigned;
  OLECHECK(GetDefaultInterface()->get_VBASigned((Office_xp::MsoTriState*)&VBASigned));
  return VBASigned;
}

Office_xp::MsoTriState __fastcall TPowerPointPresentation::get_SnapToGrid(void)
{
  Office_xp::MsoTriState SnapToGrid;
  OLECHECK(GetDefaultInterface()->get_SnapToGrid((Office_xp::MsoTriState*)&SnapToGrid));
  return SnapToGrid;
}

void __fastcall TPowerPointPresentation::set_SnapToGrid(Office_xp::MsoTriState SnapToGrid/*[in]*/)
{
  GetDefaultInterface()->set_SnapToGrid(SnapToGrid/*[in]*/);
}

float __fastcall TPowerPointPresentation::get_GridDistance(void)
{
  float GridDistance;
  OLECHECK(GetDefaultInterface()->get_GridDistance((float*)&GridDistance));
  return GridDistance;
}

void __fastcall TPowerPointPresentation::set_GridDistance(float GridDistance/*[in]*/)
{
  GetDefaultInterface()->set_GridDistance(GridDistance/*[in]*/);
}

Powerpoint_xp::DesignsPtr __fastcall TPowerPointPresentation::get_Designs(void)
{
  Powerpoint_xp::DesignsPtr Designs;
  OLECHECK(GetDefaultInterface()->get_Designs(&Designs));
  return Designs;
}

Office_xp::SignatureSetPtr __fastcall TPowerPointPresentation::get_Signatures(void)
{
  Office_xp::SignatureSetPtr Signatures;
  OLECHECK(GetDefaultInterface()->get_Signatures(&Signatures));
  return Signatures;
}

Office_xp::MsoTriState __fastcall TPowerPointPresentation::get_RemovePersonalInformation(void)
{
  Office_xp::MsoTriState RemovePersonalInformation;
  OLECHECK(GetDefaultInterface()->get_RemovePersonalInformation((Office_xp::MsoTriState*)&RemovePersonalInformation));
  return RemovePersonalInformation;
}

void __fastcall TPowerPointPresentation::set_RemovePersonalInformation(Office_xp::MsoTriState RemovePersonalInformation/*[in]*/)
{
  GetDefaultInterface()->set_RemovePersonalInformation(RemovePersonalInformation/*[in]*/);
}

Powerpoint_xp::PpRevisionInfo __fastcall TPowerPointPresentation::get_HasRevisionInfo(void)
{
  Powerpoint_xp::PpRevisionInfo HasRevisionInfo;
  OLECHECK(GetDefaultInterface()->get_HasRevisionInfo((Powerpoint_xp::PpRevisionInfo*)&HasRevisionInfo));
  return HasRevisionInfo;
}

BSTR __fastcall TPowerPointPresentation::get_PasswordEncryptionProvider(void)
{
  BSTR PasswordEncryptionProvider = 0;
  OLECHECK(GetDefaultInterface()->get_PasswordEncryptionProvider((BSTR*)&PasswordEncryptionProvider));
  return PasswordEncryptionProvider;
}

BSTR __fastcall TPowerPointPresentation::get_PasswordEncryptionAlgorithm(void)
{
  BSTR PasswordEncryptionAlgorithm = 0;
  OLECHECK(GetDefaultInterface()->get_PasswordEncryptionAlgorithm((BSTR*)&PasswordEncryptionAlgorithm));
  return PasswordEncryptionAlgorithm;
}

int __fastcall TPowerPointPresentation::get_PasswordEncryptionKeyLength(void)
{
  int PasswordEncryptionKeyLength;
  OLECHECK(GetDefaultInterface()->get_PasswordEncryptionKeyLength((int*)&PasswordEncryptionKeyLength));
  return PasswordEncryptionKeyLength;
}

VARIANT_BOOL __fastcall TPowerPointPresentation::get_PasswordEncryptionFileProperties(void)
{
  VARIANT_BOOL PasswordEncryptionFileProperties;
  OLECHECK(GetDefaultInterface()->get_PasswordEncryptionFileProperties((VARIANT_BOOL*)&PasswordEncryptionFileProperties));
  return PasswordEncryptionFileProperties;
}

BSTR __fastcall TPowerPointPresentation::get_Password(void)
{
  BSTR Password = 0;
  OLECHECK(GetDefaultInterface()->get_Password((BSTR*)&Password));
  return Password;
}

void __fastcall TPowerPointPresentation::set_Password(BSTR Password/*[in]*/)
{
  GetDefaultInterface()->set_Password(Password/*[in]*/);
}

BSTR __fastcall TPowerPointPresentation::get_WritePassword(void)
{
  BSTR WritePassword = 0;
  OLECHECK(GetDefaultInterface()->get_WritePassword((BSTR*)&WritePassword));
  return WritePassword;
}

void __fastcall TPowerPointPresentation::set_WritePassword(BSTR WritePassword/*[in]*/)
{
  GetDefaultInterface()->set_WritePassword(WritePassword/*[in]*/);
}

_SlidePtr& TPowerPointSlide::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TPowerPointSlide::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TPowerPointSlide::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TPowerPointSlide::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TPowerPointSlide::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TPowerPointSlide::ConnectTo(_SlidePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TPowerPointSlide::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_PowerPointSlide;
  sd.IntfIID = __uuidof(_Slide);
  sd.EventIID= __uuidof(SldEvents);
  ServerData = &sd;
}

void __fastcall TPowerPointSlide::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    default:
      break;
  }
}

void __fastcall TPowerPointSlide::Select(void)
{
  GetDefaultInterface()->Select();
}

void __fastcall TPowerPointSlide::Cut(void)
{
  GetDefaultInterface()->Cut();
}

void __fastcall TPowerPointSlide::Copy(void)
{
  GetDefaultInterface()->Copy();
}

Powerpoint_xp::SlideRange* __fastcall TPowerPointSlide::Duplicate(void)
{
  Powerpoint_xp::SlideRange* Duplicate = 0;
  OLECHECK(GetDefaultInterface()->Duplicate((Powerpoint_xp::SlideRange**)&Duplicate));
  return Duplicate;
}

void __fastcall TPowerPointSlide::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TPowerPointSlide::Export(BSTR FileName/*[in]*/, BSTR FilterName/*[in]*/, 
                                         int ScaleWidth/*[in,def,opt]*/, 
                                         int ScaleHeight/*[in,def,opt]*/)
{
  GetDefaultInterface()->Export(FileName/*[in]*/, FilterName/*[in]*/, ScaleWidth/*[in,def,opt]*/, 
                                ScaleHeight/*[in,def,opt]*/);
}

void __fastcall TPowerPointSlide::MoveTo(int toPos/*[in]*/)
{
  GetDefaultInterface()->MoveTo(toPos/*[in]*/);
}

void __fastcall TPowerPointSlide::ApplyTemplate(BSTR FileName/*[in]*/)
{
  GetDefaultInterface()->ApplyTemplate(FileName/*[in]*/);
}

Powerpoint_xp::PowerPointApplicationPtr __fastcall TPowerPointSlide::get_Application(void)
{
  Powerpoint_xp::PowerPointApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

LPDISPATCH __fastcall TPowerPointSlide::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Powerpoint_xp::ShapesPtr __fastcall TPowerPointSlide::get_Shapes(void)
{
  Powerpoint_xp::ShapesPtr Shapes;
  OLECHECK(GetDefaultInterface()->get_Shapes(&Shapes));
  return Shapes;
}

Powerpoint_xp::HeadersFootersPtr __fastcall TPowerPointSlide::get_HeadersFooters(void)
{
  Powerpoint_xp::HeadersFootersPtr HeadersFooters;
  OLECHECK(GetDefaultInterface()->get_HeadersFooters(&HeadersFooters));
  return HeadersFooters;
}

Powerpoint_xp::SlideShowTransitionPtr __fastcall TPowerPointSlide::get_SlideShowTransition(void)
{
  Powerpoint_xp::SlideShowTransitionPtr SlideShowTransition;
  OLECHECK(GetDefaultInterface()->get_SlideShowTransition(&SlideShowTransition));
  return SlideShowTransition;
}

Powerpoint_xp::ColorSchemePtr __fastcall TPowerPointSlide::get_ColorScheme(void)
{
  Powerpoint_xp::ColorSchemePtr ColorScheme;
  OLECHECK(GetDefaultInterface()->get_ColorScheme(&ColorScheme));
  return ColorScheme;
}

void __fastcall TPowerPointSlide::set_ColorScheme(Powerpoint_xp::ColorSchemePtr ColorScheme/*[in]*/)
{
  GetDefaultInterface()->set_ColorScheme(ColorScheme/*[in]*/);
}

Powerpoint_xp::ShapeRangePtr __fastcall TPowerPointSlide::get_Background(void)
{
  Powerpoint_xp::ShapeRangePtr Background;
  OLECHECK(GetDefaultInterface()->get_Background(&Background));
  return Background;
}

BSTR __fastcall TPowerPointSlide::get_Name(void)
{
  BSTR Name = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&Name));
  return Name;
}

void __fastcall TPowerPointSlide::set_Name(BSTR Name/*[in]*/)
{
  GetDefaultInterface()->set_Name(Name/*[in]*/);
}

long __fastcall TPowerPointSlide::get_SlideID(void)
{
  long SlideID;
  OLECHECK(GetDefaultInterface()->get_SlideID((long*)&SlideID));
  return SlideID;
}

int __fastcall TPowerPointSlide::get_PrintSteps(void)
{
  int PrintSteps;
  OLECHECK(GetDefaultInterface()->get_PrintSteps((int*)&PrintSteps));
  return PrintSteps;
}

Powerpoint_xp::PpSlideLayout __fastcall TPowerPointSlide::get_Layout(void)
{
  Powerpoint_xp::PpSlideLayout Layout;
  OLECHECK(GetDefaultInterface()->get_Layout((Powerpoint_xp::PpSlideLayout*)&Layout));
  return Layout;
}

void __fastcall TPowerPointSlide::set_Layout(Powerpoint_xp::PpSlideLayout Layout/*[in]*/)
{
  GetDefaultInterface()->set_Layout(Layout/*[in]*/);
}

Powerpoint_xp::TagsPtr __fastcall TPowerPointSlide::get_Tags(void)
{
  Powerpoint_xp::TagsPtr Tags;
  OLECHECK(GetDefaultInterface()->get_Tags(&Tags));
  return Tags;
}

int __fastcall TPowerPointSlide::get_SlideIndex(void)
{
  int SlideIndex;
  OLECHECK(GetDefaultInterface()->get_SlideIndex((int*)&SlideIndex));
  return SlideIndex;
}

int __fastcall TPowerPointSlide::get_SlideNumber(void)
{
  int SlideNumber;
  OLECHECK(GetDefaultInterface()->get_SlideNumber((int*)&SlideNumber));
  return SlideNumber;
}

Office_xp::MsoTriState __fastcall TPowerPointSlide::get_DisplayMasterShapes(void)
{
  Office_xp::MsoTriState DisplayMasterShapes;
  OLECHECK(GetDefaultInterface()->get_DisplayMasterShapes((Office_xp::MsoTriState*)&DisplayMasterShapes));
  return DisplayMasterShapes;
}

void __fastcall TPowerPointSlide::set_DisplayMasterShapes(Office_xp::MsoTriState DisplayMasterShapes/*[in]*/)
{
  GetDefaultInterface()->set_DisplayMasterShapes(DisplayMasterShapes/*[in]*/);
}

Office_xp::MsoTriState __fastcall TPowerPointSlide::get_FollowMasterBackground(void)
{
  Office_xp::MsoTriState FollowMasterBackground;
  OLECHECK(GetDefaultInterface()->get_FollowMasterBackground((Office_xp::MsoTriState*)&FollowMasterBackground));
  return FollowMasterBackground;
}

void __fastcall TPowerPointSlide::set_FollowMasterBackground(Office_xp::MsoTriState FollowMasterBackground/*[in]*/)
{
  GetDefaultInterface()->set_FollowMasterBackground(FollowMasterBackground/*[in]*/);
}

Powerpoint_xp::SlideRangePtr __fastcall TPowerPointSlide::get_NotesPage(void)
{
  Powerpoint_xp::SlideRangePtr NotesPage;
  OLECHECK(GetDefaultInterface()->get_NotesPage(&NotesPage));
  return NotesPage;
}

Powerpoint_xp::_MasterPtr __fastcall TPowerPointSlide::get_Master(void)
{
  Powerpoint_xp::_MasterPtr Master;
  OLECHECK(GetDefaultInterface()->get_Master(&Master));
  return Master;
}

Powerpoint_xp::HyperlinksPtr __fastcall TPowerPointSlide::get_Hyperlinks(void)
{
  Powerpoint_xp::HyperlinksPtr Hyperlinks;
  OLECHECK(GetDefaultInterface()->get_Hyperlinks(&Hyperlinks));
  return Hyperlinks;
}

Office_xp::ScriptsPtr __fastcall TPowerPointSlide::get_Scripts(void)
{
  Office_xp::ScriptsPtr Scripts;
  OLECHECK(GetDefaultInterface()->get_Scripts(&Scripts));
  return Scripts;
}

Powerpoint_xp::CommentsPtr __fastcall TPowerPointSlide::get_Comments(void)
{
  Powerpoint_xp::CommentsPtr Comments;
  OLECHECK(GetDefaultInterface()->get_Comments(&Comments));
  return Comments;
}

Powerpoint_xp::DesignPtr __fastcall TPowerPointSlide::get_Design(void)
{
  Powerpoint_xp::DesignPtr Design;
  OLECHECK(GetDefaultInterface()->get_Design(&Design));
  return Design;
}

void __fastcall TPowerPointSlide::set_Design(Powerpoint_xp::DesignPtr Design/*[in]*/)
{
  GetDefaultInterface()->set_Design(Design/*[in]*/);
}

Powerpoint_xp::TimeLinePtr __fastcall TPowerPointSlide::get_TimeLine(void)
{
  Powerpoint_xp::TimeLinePtr TimeLine;
  OLECHECK(GetDefaultInterface()->get_TimeLine(&TimeLine));
  return TimeLine;
}

_MasterPtr& TMaster::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TMaster::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TMaster::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TMaster::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TMaster::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TMaster::ConnectTo(_MasterPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TMaster::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_Master;
  sd.IntfIID = __uuidof(_Master);
  sd.EventIID= __uuidof(MasterEvents);
  ServerData = &sd;
}

void __fastcall TMaster::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    default:
      break;
  }
}

void __fastcall TMaster::Delete(void)
{
  GetDefaultInterface()->Delete();
}

Powerpoint_xp::PowerPointApplicationPtr __fastcall TMaster::get_Application(void)
{
  Powerpoint_xp::PowerPointApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

LPDISPATCH __fastcall TMaster::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Powerpoint_xp::ShapesPtr __fastcall TMaster::get_Shapes(void)
{
  Powerpoint_xp::ShapesPtr Shapes;
  OLECHECK(GetDefaultInterface()->get_Shapes(&Shapes));
  return Shapes;
}

Powerpoint_xp::HeadersFootersPtr __fastcall TMaster::get_HeadersFooters(void)
{
  Powerpoint_xp::HeadersFootersPtr HeadersFooters;
  OLECHECK(GetDefaultInterface()->get_HeadersFooters(&HeadersFooters));
  return HeadersFooters;
}

Powerpoint_xp::ColorSchemePtr __fastcall TMaster::get_ColorScheme(void)
{
  Powerpoint_xp::ColorSchemePtr ColorScheme;
  OLECHECK(GetDefaultInterface()->get_ColorScheme(&ColorScheme));
  return ColorScheme;
}

void __fastcall TMaster::set_ColorScheme(Powerpoint_xp::ColorSchemePtr ColorScheme/*[in]*/)
{
  GetDefaultInterface()->set_ColorScheme(ColorScheme/*[in]*/);
}

Powerpoint_xp::ShapeRangePtr __fastcall TMaster::get_Background(void)
{
  Powerpoint_xp::ShapeRangePtr Background;
  OLECHECK(GetDefaultInterface()->get_Background(&Background));
  return Background;
}

BSTR __fastcall TMaster::get_Name(void)
{
  BSTR Name = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&Name));
  return Name;
}

void __fastcall TMaster::set_Name(BSTR Name/*[in]*/)
{
  GetDefaultInterface()->set_Name(Name/*[in]*/);
}

float __fastcall TMaster::get_Height(void)
{
  float Height;
  OLECHECK(GetDefaultInterface()->get_Height((float*)&Height));
  return Height;
}

float __fastcall TMaster::get_Width(void)
{
  float Width;
  OLECHECK(GetDefaultInterface()->get_Width((float*)&Width));
  return Width;
}

Powerpoint_xp::TextStylesPtr __fastcall TMaster::get_TextStyles(void)
{
  Powerpoint_xp::TextStylesPtr TextStyles;
  OLECHECK(GetDefaultInterface()->get_TextStyles(&TextStyles));
  return TextStyles;
}

Powerpoint_xp::HyperlinksPtr __fastcall TMaster::get_Hyperlinks(void)
{
  Powerpoint_xp::HyperlinksPtr Hyperlinks;
  OLECHECK(GetDefaultInterface()->get_Hyperlinks(&Hyperlinks));
  return Hyperlinks;
}

Office_xp::ScriptsPtr __fastcall TMaster::get_Scripts(void)
{
  Office_xp::ScriptsPtr Scripts;
  OLECHECK(GetDefaultInterface()->get_Scripts(&Scripts));
  return Scripts;
}

Powerpoint_xp::DesignPtr __fastcall TMaster::get_Design(void)
{
  Powerpoint_xp::DesignPtr Design;
  OLECHECK(GetDefaultInterface()->get_Design(&Design));
  return Design;
}

Powerpoint_xp::TimeLinePtr __fastcall TMaster::get_TimeLine(void)
{
  Powerpoint_xp::TimeLinePtr TimeLine;
  OLECHECK(GetDefaultInterface()->get_TimeLine(&TimeLine));
  return TimeLine;
}

Powerpoint_xp::SlideShowTransitionPtr __fastcall TMaster::get_SlideShowTransition(void)
{
  Powerpoint_xp::SlideShowTransitionPtr SlideShowTransition;
  OLECHECK(GetDefaultInterface()->get_SlideShowTransition(&SlideShowTransition));
  return SlideShowTransition;
}


};     // namespace Powerpoint_xp


// *********************************************************************//
// The Register function is invoked by the IDE when this module is 
// installed in a Package. It provides the list of Components (including
// OCXes) implemented by this module. The following implementation
// informs the IDE of the OCX proxy classes implemented here.
// *********************************************************************//
namespace Powerpoint_xp_srvr
{

void __fastcall PACKAGE Register()
{
  // [4]
  System::Classes::TComponentClass cls_svr[] = {
                              __classid(Powerpoint_xp::TPowerPointApplication), 
                              __classid(Powerpoint_xp::TPowerPointPresentation), 
                              __classid(Powerpoint_xp::TPowerPointSlide), 
                              __classid(Powerpoint_xp::TMaster)
                           };
  System::Classes::RegisterComponents("OfficeXP", cls_svr,
                     sizeof(cls_svr)/sizeof(cls_svr[0])-1);
}

};     // namespace Powerpoint_xp_srvr
