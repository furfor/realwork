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

// $Rev: 34747 $
// File generated on 10/1/2010 2:37:48 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: c:\program files\microsoft officeXP\office10\frontpg.exe (1)
// LIBID: {3824BCD5-7042-11CE-8E17-0020AF9F9648}
// LCID: 0
// Helpfile: c:\program files\microsoft officeXP\office10\vbafpw10.chm 
// HelpString: Microsoft FrontPage 5.0 Web Object Reference Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\WINDOWS\System32\stdole2.tlb)
//   (2) v5.0 FrontPageEditor, (C:\PROGRA~1\MI812F~1\Office10\FPEDITAX.DLL)
//   (3) v2.2 Office, (C:\Program Files\Common Files\Microsoft Shared\Office10\MSO.DLL)
//   (4) v5.3 VBIDE, (C:\Program Files\Common Files\Microsoft Shared\VBA\VBA6\VBE6EXT.OLB)
// Errors:
//   Hint: Symbol 'System' renamed to 'SYSTEM'
//   Hint: Symbol 'Application' renamed to 'App'
//   Hint: Symbol 'System' renamed to 'SYSTEM'
//   Hint: Symbol 'Application' renamed to 'App'
// Cmdline:
//   tlibimp -Fe_XP -CE_XP_srvr -Ha- -Hs+ -Hr+ -Yp+ -HpsOfficeXP -Cs- -Ct+ -Cv- "c:\program files\microsoft officeXP\office10\frontpg.exe"
// ************************************************************************ //

#include <vcl.h>
#pragma hdrstop

#include <oleserver.hpp>
#if defined(USING_ATL)
#include <atl\atlvcl.h>
#endif

#pragma option -w-8122
#include "FrontPage_XP_srvr.h"

#if !defined(__PRAGMA_PACKAGE_SMART_INIT)
#define      __PRAGMA_PACKAGE_SMART_INIT
#pragma package(smart_init)
#endif

namespace Frontpage_xp
{

_ApplicationPtr& TApp::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TApp::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TApp::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TApp::Disconnect()
{
  if (m_DefaultIntf) {
    if (FAutoQuit)
      Quit();
    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TApp::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TApp::ConnectTo(_ApplicationPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TApp::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_App;
  sd.IntfIID = __uuidof(_Application);
  sd.EventIID= __uuidof(_IApplicationEvents);
  ServerData = &sd;
}

void __fastcall TApp::InvokeEvent(int id, Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1: {
      if (OnWebNew) {
        (OnWebNew)(this, (Frontpage_xp::WebPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2: {
      if (OnWebOpen) {
        (OnWebOpen)(this, (Frontpage_xp::WebPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 3: {
      if (OnWebClose) {
        (OnWebClose)(this, (Frontpage_xp::WebPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 4: {
      if (OnBeforeWebPublish) {
        (OnBeforeWebPublish)(this, (Frontpage_xp::WebPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pbstrVal, params[2].pboolVal);
      }
      break;
      }
    case 5: {
      if (OnAfterWebPublish) {
        (OnAfterWebPublish)(this, (Frontpage_xp::WebPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 6: {
      if (OnPageNew) {
        (OnPageNew)(this, (Frontpage_xp::PageWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 7: {
      if (OnPageOpen) {
        (OnPageOpen)(this, (Frontpage_xp::PageWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 8: {
      if (OnPageClose) {
        (OnPageClose)(this, (Frontpage_xp::PageWindowPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 9: {
      if (OnBeforePageSave) {
        (OnBeforePageSave)(this, (Frontpage_xp::PageWindowPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal, params[2].pboolVal);
      }
      break;
      }
    case 10: {
      if (OnAfterPageSave) {
        (OnAfterPageSave)(this, (Frontpage_xp::PageWindowPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 11: {
      if (OnWindowActivate) {
        (OnWindowActivate)(this, (Frontpage_xp::WebWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 12: {
      if (OnWindowDeactivate) {
        (OnWindowDeactivate)(this, (Frontpage_xp::WebWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 13: {
      if (OnBeforeWebWindowViewChange) {
        (OnBeforeWebWindowViewChange)(this, (Frontpage_xp::WebWindowPtr)(LPDISPATCH)(params[0].pdispVal), (Frontpage_xp::FpWebViewModeEx)(int)params[1], params[2].pboolVal);
      }
      break;
      }
    case 14: {
      if (OnAfterWebWindowViewChange) {
        (OnAfterWebWindowViewChange)(this, (Frontpage_xp::WebWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 15: {
      if (OnRecalculateHyperlinks) {
        (OnRecalculateHyperlinks)(this, (Frontpage_xp::WebPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 16: {
      if (OnBeforePageWindowViewChange) {
        (OnBeforePageWindowViewChange)(this, (Frontpage_xp::PageWindowPtr)(LPDISPATCH)(params[0].pdispVal), (Frontpage_xp::FpPageViewMode)(int)params[1], params[2].pboolVal);
      }
      break;
      }
    case 17: {
      if (OnAfterPageWindowViewChange) {
        (OnAfterPageWindowViewChange)(this, (Frontpage_xp::PageWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 18: {
      if (OnPageWindowActivate) {
        (OnPageWindowActivate)(this, (Frontpage_xp::PageWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 19: {
      if (OnWebFileCheckOut) {
        (OnWebFileCheckOut)(this, (Frontpage_xp::WebPtr)(LPDISPATCH)(params[0].pdispVal), (Frontpage_xp::WebFilePtr)(LPDISPATCH)(params[1].pdispVal), params[2].pboolVal, (Frontpage_xp::FpCheckOutOption*)(int*)(params[3].plVal));
      }
      break;
      }
    case 20: {
      if (OnBeforeWebWindowSubViewChange) {
        (OnBeforeWebWindowSubViewChange)(this, (Frontpage_xp::WebWindowPtr)(LPDISPATCH)(params[0].pdispVal), (Frontpage_xp::FpWebSubView)(int)params[1], params[2].pboolVal);
      }
      break;
      }
    case 21: {
      if (OnAfterWebWindowSubViewChange) {
        (OnAfterWebWindowSubViewChange)(this, (Frontpage_xp::WebWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

Frontpage_xp::PageWindow* __fastcall TApp::LocatePage(BSTR DocumentUrl/*[in]*/, 
                                                      Frontpage_xp::FpPageViewMode ViewMode/*[in,def,opt]*/)
{
  Frontpage_xp::PageWindow* ppObj = 0;
  OLECHECK(GetDefaultInterface()->LocatePage(DocumentUrl, ViewMode, (Frontpage_xp::PageWindow**)&ppObj));
  return ppObj;
}

BSTR __fastcall TApp::MakeAbs(VARIANT* UrlBase/*[in]*/, BSTR Url/*[in]*/)
{
  BSTR pbzAbsUrl = 0;
  OLECHECK(GetDefaultInterface()->MakeAbs(UrlBase, Url, (BSTR*)&pbzAbsUrl));
  return pbzAbsUrl;
}

BSTR __fastcall TApp::MakeRel(VARIANT* UrlBase/*[in]*/, BSTR Url/*[in]*/)
{
  BSTR pbzRelUrl = 0;
  OLECHECK(GetDefaultInterface()->MakeRel(UrlBase, Url, (BSTR*)&pbzRelUrl));
  return pbzRelUrl;
}

void __fastcall TApp::Quit(void)
{
  GetDefaultInterface()->Quit();
}

VARIANT __fastcall TApp::Run(BSTR MacroName/*[in]*/, LPSAFEARRAY* safeArrayOfParams/*[in]*/)
{
  VARIANT Run;
  OLECHECK(GetDefaultInterface()->Run(MacroName, safeArrayOfParams, (VARIANT*)&Run));
  return Run;
}

void __fastcall TApp::OnTime(VARIANT* When/*[in]*/, BSTR Name/*[in]*/, 
                             VARIANT* Tolerance/*[in,opt]*/)
{
  GetDefaultInterface()->OnTime(When/*[in]*/, Name/*[in]*/, Tolerance/*[in,opt]*/);
}

BSTR __fastcall TApp::ParseURL(BSTR Url/*[in]*/, Frontpage_xp::FpURLComponent URLComponent/*[in]*/)
{
  BSTR pbzRelUrl = 0;
  OLECHECK(GetDefaultInterface()->ParseURL(Url, URLComponent, (BSTR*)&pbzRelUrl));
  return pbzRelUrl;
}

Frontpage_xp::_ApplicationPtr __fastcall TApp::get_Application(void)
{
  Frontpage_xp::_ApplicationPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_Application(&ppVal));
  return ppVal;
}

Frontpageeditor_xp::IHTMLDocument2Ptr __fastcall TApp::get__deprecated_ActiveDocument(void)
{
  Frontpageeditor_xp::IHTMLDocument2Ptr ppVal;
  OLECHECK(GetDefaultInterface()->get__deprecated_ActiveDocument(&ppVal));
  return ppVal;
}

Frontpage_xp::PageWindowPtr __fastcall TApp::get_ActivePageWindow(void)
{
  Frontpage_xp::PageWindowPtr pVal;
  OLECHECK(GetDefaultInterface()->get_ActivePageWindow(&pVal));
  return pVal;
}

Frontpage_xp::WebPtr __fastcall TApp::get_ActiveWeb(void)
{
  Frontpage_xp::WebPtr pVal;
  OLECHECK(GetDefaultInterface()->get_ActiveWeb(&pVal));
  return pVal;
}

Frontpage_xp::WebWindowPtr __fastcall TApp::get_ActiveWebWindow(void)
{
  Frontpage_xp::WebWindowPtr pVal;
  OLECHECK(GetDefaultInterface()->get_ActiveWebWindow(&pVal));
  return pVal;
}

Office_xp::AnswerWizardPtr __fastcall TApp::get_AnswerWizard(void)
{
  Office_xp::AnswerWizardPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_AnswerWizard(&ppVal));
  return ppVal;
}

BSTR __fastcall TApp::get_Build(void)
{
  BSTR pVal = 0;
  OLECHECK(GetDefaultInterface()->get_Build((BSTR*)&pVal));
  return pVal;
}

Office_xp::COMAddInsPtr __fastcall TApp::get_COMAddIns(void)
{
  Office_xp::COMAddInsPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_COMAddIns(&ppVal));
  return ppVal;
}

Office_xp::CommandBarsPtr __fastcall TApp::get_CommandBars(void)
{
  Office_xp::CommandBarsPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_CommandBars(&ppVal));
  return ppVal;
}

Office_xp::FileSearchPtr __fastcall TApp::get_FileSearch(void)
{
  Office_xp::FileSearchPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_FileSearch(&ppVal));
  return ppVal;
}

Office_xp::LanguageSettingsPtr __fastcall TApp::get_LanguageSettings(void)
{
  Office_xp::LanguageSettingsPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_LanguageSettings(&ppVal));
  return ppVal;
}

BSTR __fastcall TApp::get_Name(void)
{
  BSTR pVal = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&pVal));
  return pVal;
}

BSTR __fastcall TApp::get_OrganizationName(void)
{
  BSTR pVal = 0;
  OLECHECK(GetDefaultInterface()->get_OrganizationName((BSTR*)&pVal));
  return pVal;
}

Frontpage_xp::SYSTEMPtr __fastcall TApp::get_System(void)
{
  Frontpage_xp::SYSTEMPtr pVal;
  OLECHECK(GetDefaultInterface()->get_System(&pVal));
  return pVal;
}

Frontpage_xp::ThemesPtr __fastcall TApp::get_Themes(void)
{
  Frontpage_xp::ThemesPtr pVal;
  OLECHECK(GetDefaultInterface()->get_Themes(&pVal));
  return pVal;
}

BSTR __fastcall TApp::get_UserName(void)
{
  BSTR pVal = 0;
  OLECHECK(GetDefaultInterface()->get_UserName((BSTR*)&pVal));
  return pVal;
}

void __fastcall TApp::set_UserName(BSTR pVal/*[in]*/)
{
  GetDefaultInterface()->set_UserName(pVal/*[in]*/);
}

BSTR __fastcall TApp::get_Version(void)
{
  BSTR pVal = 0;
  OLECHECK(GetDefaultInterface()->get_Version((BSTR*)&pVal));
  return pVal;
}

Frontpage_xp::WebsPtr __fastcall TApp::get_Webs(void)
{
  Frontpage_xp::WebsPtr pVal;
  OLECHECK(GetDefaultInterface()->get_Webs(&pVal));
  return pVal;
}

Frontpage_xp::WebWindowsPtr __fastcall TApp::get_WebWindows(void)
{
  Frontpage_xp::WebWindowsPtr pVal;
  OLECHECK(GetDefaultInterface()->get_WebWindows(&pVal));
  return pVal;
}

BSTR __fastcall TApp::get_ProductCode(void)
{
  BSTR ProductCode = 0;
  OLECHECK(GetDefaultInterface()->get_ProductCode((BSTR*)&ProductCode));
  return ProductCode;
}

Office_xp::AssistantPtr __fastcall TApp::get_Assistant(void)
{
  Office_xp::AssistantPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_Assistant(&ppVal));
  return ppVal;
}

Frontpage_xp::FpConnectionSpeed __fastcall TApp::get_ConnectionSpeed(void)
{
  Frontpage_xp::FpConnectionSpeed pConnectionSpeed;
  OLECHECK(GetDefaultInterface()->get_ConnectionSpeed((Frontpage_xp::FpConnectionSpeed*)&pConnectionSpeed));
  return pConnectionSpeed;
}

void __fastcall TApp::set_ConnectionSpeed(Frontpage_xp::FpConnectionSpeed pConnectionSpeed/*[in]*/)
{
  GetDefaultInterface()->set_ConnectionSpeed(pConnectionSpeed/*[in]*/);
}

long __fastcall TApp::get_OlderFile(void)
{
  long plDays;
  OLECHECK(GetDefaultInterface()->get_OlderFile((long*)&plDays));
  return plDays;
}

void __fastcall TApp::set_OlderFile(long plDays/*[in]*/)
{
  GetDefaultInterface()->set_OlderFile(plDays/*[in]*/);
}

long __fastcall TApp::get_RecentFile(void)
{
  long plDays;
  OLECHECK(GetDefaultInterface()->get_RecentFile((long*)&plDays));
  return plDays;
}

void __fastcall TApp::set_RecentFile(long plDays/*[in]*/)
{
  GetDefaultInterface()->set_RecentFile(plDays/*[in]*/);
}

long __fastcall TApp::get_SlowPage(void)
{
  long plSeconds;
  OLECHECK(GetDefaultInterface()->get_SlowPage((long*)&plSeconds));
  return plSeconds;
}

void __fastcall TApp::set_SlowPage(long plSeconds/*[in]*/)
{
  GetDefaultInterface()->set_SlowPage(plSeconds/*[in]*/);
}

Office_xp::FileDialog* __fastcall TApp::get_FileDialog(Office_xp::MsoFileDialogType DialogType/*[in]*/)
{
  Office_xp::FileDialog* ppVal = 0;
  OLECHECK(GetDefaultInterface()->get_FileDialog(DialogType, (Office_xp::FileDialog**)&ppVal));
  return ppVal;
}

Vbide_xp::VBEPtr __fastcall TApp::get_VBE(void)
{
  Vbide_xp::VBEPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_VBE(&ppVal));
  return ppVal;
}

long __fastcall TApp::get_MonthsShown(void)
{
  long plMonths;
  OLECHECK(GetDefaultInterface()->get_MonthsShown((long*)&plMonths));
  return plMonths;
}

void __fastcall TApp::set_MonthsShown(long plMonths/*[in]*/)
{
  GetDefaultInterface()->set_MonthsShown(plMonths/*[in]*/);
}

Office_xp::NewFilePtr __fastcall TApp::get_NewPageorWeb(void)
{
  Office_xp::NewFilePtr ppVal;
  OLECHECK(GetDefaultInterface()->get_NewPageorWeb(&ppVal));
  return ppVal;
}

VARIANT_BOOL __fastcall TApp::get_ShowStartupDialog(void)
{
  VARIANT_BOOL pfShowAtStartup;
  OLECHECK(GetDefaultInterface()->get_ShowStartupDialog((VARIANT_BOOL*)&pfShowAtStartup));
  return pfShowAtStartup;
}

void __fastcall TApp::set_ShowStartupDialog(VARIANT_BOOL pfShowAtStartup/*[in]*/)
{
  GetDefaultInterface()->set_ShowStartupDialog(pfShowAtStartup/*[in]*/);
}

Frontpageeditor_xp::DispFPHTMLDocumentPtr __fastcall TApp::get_ActiveDocument(void)
{
  Frontpageeditor_xp::DispFPHTMLDocumentPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_ActiveDocument(&ppVal));
  return ppVal;
}

PageWindowPtr& TPageWindowEx::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TPageWindowEx::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TPageWindowEx::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TPageWindowEx::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TPageWindowEx::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TPageWindowEx::ConnectTo(PageWindowPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TPageWindowEx::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_PageWindowEx;
  sd.IntfIID = __uuidof(PageWindow);
  sd.EventIID= __uuidof(_IPageWindowEvents);
  ServerData = &sd;
}

void __fastcall TPageWindowEx::InvokeEvent(int id, Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 2: {
      if (OnBeforeSave) {
        (OnBeforeSave)(this, params[0].pboolVal, params[1].pboolVal);
      }
      break;
      }
    case 3: {
      if (OnAfterSave) {
        (OnAfterSave)(this, params[0].pboolVal);
      }
      break;
      }
    case 4: {
      if (OnBeforeViewChange) {
        (OnBeforeViewChange)(this, (Frontpage_xp::FpPageViewMode)(int)params[0], params[1].pboolVal);
      }
      break;
      }
    case 5: {
      if (OnAfterViewChange) {
        (OnAfterViewChange)(this);
      }
      break;
      }
    case 6: {
      if (OnActivate) {
        (OnActivate)(this);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TPageWindowEx::ApplyTheme(BSTR ThemeName/*[in]*/, 
                                          Frontpage_xp::FpThemeProperties ThemeProperties/*[in,def,opt]*/)
{
  GetDefaultInterface()->ApplyTheme(ThemeName/*[in]*/, ThemeProperties/*[in,def,opt]*/);
}

void __fastcall TPageWindowEx::Close(VARIANT_BOOL ForceSave/*[in,def,opt]*/)
{
  GetDefaultInterface()->Close(ForceSave/*[in,def,opt]*/);
}

void __fastcall TPageWindowEx::Refresh(VARIANT_BOOL SaveChanges/*[in,def,opt]*/)
{
  GetDefaultInterface()->Refresh(SaveChanges/*[in,def,opt]*/);
}

void __fastcall TPageWindowEx::Save(VARIANT_BOOL ForceOverwrite/*[in,def,opt]*/)
{
  GetDefaultInterface()->Save(ForceOverwrite/*[in,def,opt]*/);
}

void __fastcall TPageWindowEx::SaveAs(BSTR DestinationUrl/*[in]*/, 
                                      VARIANT_BOOL ForceOverwrite/*[in,def,opt]*/)
{
  GetDefaultInterface()->SaveAs(DestinationUrl/*[in]*/, ForceOverwrite/*[in,def,opt]*/);
}

void __fastcall TPageWindowEx::Activate(void)
{
  GetDefaultInterface()->Activate();
}

Frontpageeditor_xp::IHTMLDocument2Ptr __fastcall TPageWindowEx::get__deprecated_ActiveDocument(void)
{
  Frontpageeditor_xp::IHTMLDocument2Ptr ppDocObj;
  OLECHECK(GetDefaultInterface()->get__deprecated_ActiveDocument(&ppDocObj));
  return ppDocObj;
}

Frontpageeditor_xp::IHTMLWindow2Ptr __fastcall TPageWindowEx::get_ActiveFrameWindow(void)
{
  Frontpageeditor_xp::IHTMLWindow2Ptr ppDocObj;
  OLECHECK(GetDefaultInterface()->get_ActiveFrameWindow(&ppDocObj));
  return ppDocObj;
}

BSTR __fastcall TPageWindowEx::get_Caption(void)
{
  BSTR pszCaption = 0;
  OLECHECK(GetDefaultInterface()->get_Caption((BSTR*)&pszCaption));
  return pszCaption;
}

Frontpageeditor_xp::IHTMLDocument2Ptr __fastcall TPageWindowEx::get__deprecated_Document(void)
{
  Frontpageeditor_xp::IHTMLDocument2Ptr ppDocObj;
  OLECHECK(GetDefaultInterface()->get__deprecated_Document(&ppDocObj));
  return ppDocObj;
}

Frontpage_xp::WebFilePtr __fastcall TPageWindowEx::get_File(void)
{
  Frontpage_xp::WebFilePtr ppFileObj;
  OLECHECK(GetDefaultInterface()->get_File(&ppFileObj));
  return ppFileObj;
}

Frontpageeditor_xp::IHTMLWindow2Ptr __fastcall TPageWindowEx::get_FrameWindow(void)
{
  Frontpageeditor_xp::IHTMLWindow2Ptr ppFrameWindowObj;
  OLECHECK(GetDefaultInterface()->get_FrameWindow(&ppFrameWindowObj));
  return ppFrameWindowObj;
}

VARIANT_BOOL __fastcall TPageWindowEx::get_IsDirty(void)
{
  VARIANT_BOOL pfIsDirty;
  OLECHECK(GetDefaultInterface()->get_IsDirty((VARIANT_BOOL*)&pfIsDirty));
  return pfIsDirty;
}

VARIANT __fastcall TPageWindowEx::get_ThemeProperties(Frontpage_xp::FpThemeProperties PropertyIndex/*[in,def,opt]*/)
{
  VARIANT ppv;
  OLECHECK(GetDefaultInterface()->get_ThemeProperties(PropertyIndex, (VARIANT*)&ppv));
  return ppv;
}

Frontpage_xp::FpPageViewMode __fastcall TPageWindowEx::get_ViewMode(void)
{
  Frontpage_xp::FpPageViewMode pviewMode;
  OLECHECK(GetDefaultInterface()->get_ViewMode((Frontpage_xp::FpPageViewMode*)&pviewMode));
  return pviewMode;
}

void __fastcall TPageWindowEx::set_ViewMode(Frontpage_xp::FpPageViewMode pviewMode/*[in]*/)
{
  GetDefaultInterface()->set_ViewMode(pviewMode/*[in]*/);
}

VARIANT_BOOL __fastcall TPageWindowEx::get_Visible(void)
{
  VARIANT_BOOL pfIsWindowVisible;
  OLECHECK(GetDefaultInterface()->get_Visible((VARIANT_BOOL*)&pfIsWindowVisible));
  return pfIsWindowVisible;
}

Frontpage_xp::WebPtr __fastcall TPageWindowEx::get_Web(void)
{
  Frontpage_xp::WebPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_Web(&ppVal));
  return ppVal;
}

Frontpageeditor_xp::IHTMLDocument2Ptr __fastcall TPageWindowEx::get_PreviewDocument(void)
{
  Frontpageeditor_xp::IHTMLDocument2Ptr ppIEDoc;
  OLECHECK(GetDefaultInterface()->get_PreviewDocument(&ppIEDoc));
  return ppIEDoc;
}

Frontpageeditor_xp::DispFPHTMLDocumentPtr __fastcall TPageWindowEx::get_ActiveDocument(void)
{
  Frontpageeditor_xp::DispFPHTMLDocumentPtr ppDocObj;
  OLECHECK(GetDefaultInterface()->get_ActiveDocument(&ppDocObj));
  return ppDocObj;
}

Frontpageeditor_xp::DispFPHTMLDocumentPtr __fastcall TPageWindowEx::get_Document(void)
{
  Frontpageeditor_xp::DispFPHTMLDocumentPtr ppDocObj;
  OLECHECK(GetDefaultInterface()->get_Document(&ppDocObj));
  return ppDocObj;
}

void __fastcall TPageWindowEx::set_IsDirty(VARIANT_BOOL pfIsDirty/*[in]*/)
{
  GetDefaultInterface()->set_IsDirty(pfIsDirty/*[in]*/);
}

WebPtr& TWebEx::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TWebEx::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TWebEx::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TWebEx::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TWebEx::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TWebEx::ConnectTo(WebPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TWebEx::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_WebEx;
  sd.IntfIID = __uuidof(Web);
  sd.EventIID= __uuidof(_IWebEvents);
  ServerData = &sd;
}

void __fastcall TWebEx::InvokeEvent(int id, Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1: {
      if (OnBeforePublish) {
        (OnBeforePublish)(this, params[0].pbstrVal, params[1].pboolVal);
      }
      break;
      }
    case 2: {
      if (OnAfterPublish) {
        (OnAfterPublish)(this, params[0].pboolVal);
      }
      break;
      }
    case 3: {
      if (OnRecalculateHyperlinks) {
        (OnRecalculateHyperlinks)(this, params[0].pboolVal);
      }
      break;
      }
    case 4: {
      if (OnWebFileCheckOut) {
        (OnWebFileCheckOut)(this, (Frontpage_xp::WebFilePtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal, (Frontpage_xp::FpCheckOutOption*)(int*)(params[2].plVal));
      }
      break;
      }
    case 5: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TWebEx::Activate(void)
{
  GetDefaultInterface()->Activate();
}

void __fastcall TWebEx::ApplyTheme(BSTR ThemeName/*[in]*/, 
                                   Frontpage_xp::FpThemeProperties ThemeProperties/*[in,def,opt]*/)
{
  GetDefaultInterface()->ApplyTheme(ThemeName/*[in]*/, ThemeProperties/*[in,def,opt]*/);
}

void __fastcall TWebEx::CancelRequests(void)
{
  GetDefaultInterface()->CancelRequests();
}

void __fastcall TWebEx::Close(void)
{
  GetDefaultInterface()->Close();
}

void __fastcall TWebEx::Delete(Frontpage_xp::FpWebDeleteFlags WebDeleteFlags/*[in,def,opt]*/)
{
  GetDefaultInterface()->Delete(WebDeleteFlags/*[in,def,opt]*/);
}

Frontpage_xp::WebFile* __fastcall TWebEx::LocateFile(BSTR FileUrl/*[in]*/)
{
  Frontpage_xp::WebFile* ppFileObj = 0;
  OLECHECK(GetDefaultInterface()->LocateFile(FileUrl, (Frontpage_xp::WebFile**)&ppFileObj));
  return ppFileObj;
}

Frontpage_xp::WebFolder* __fastcall TWebEx::LocateFolder(BSTR FolderUrl/*[in]*/)
{
  Frontpage_xp::WebFolder* ppFolderObj = 0;
  OLECHECK(GetDefaultInterface()->LocateFolder(FolderUrl, (Frontpage_xp::WebFolder**)&ppFolderObj));
  return ppFolderObj;
}

Frontpage_xp::PageWindow* __fastcall TWebEx::LocatePage(BSTR FileUrl/*[in]*/, 
                                                        Frontpage_xp::FpPageViewMode ViewMode/*[in,def,opt]*/)
{
  Frontpage_xp::PageWindow* ppObj = 0;
  OLECHECK(GetDefaultInterface()->LocatePage(FileUrl, ViewMode, (Frontpage_xp::PageWindow**)&ppObj));
  return ppObj;
}

void __fastcall TWebEx::Publish(BSTR DestinationUrl/*[in]*/, 
                                Frontpage_xp::FpWebPublishFlags PublishFlags/*[in,def,opt]*/, 
                                BSTR UserName/*[in,def,opt]*/, BSTR Password/*[in,def,opt]*/)
{
  GetDefaultInterface()->Publish(DestinationUrl/*[in]*/, PublishFlags/*[in,def,opt]*/, 
                                 UserName/*[in,def,opt]*/, Password/*[in,def,opt]*/);
}

void __fastcall TWebEx::RecalcHyperlinks(void)
{
  GetDefaultInterface()->RecalcHyperlinks();
}

void __fastcall TWebEx::Refresh(VARIANT_BOOL FetchAll/*[in,def,opt]*/)
{
  GetDefaultInterface()->Refresh(FetchAll/*[in,def,opt]*/);
}

void __fastcall TWebEx::ApplyNavigationStructure(void)
{
  GetDefaultInterface()->ApplyNavigationStructure();
}

void __fastcall TWebEx::ApplyTemplate(BSTR TemplateDir/*[in]*/, 
                                      VARIANT_BOOL fOverWrite/*[in,def,opt]*/)
{
  GetDefaultInterface()->ApplyTemplate(TemplateDir/*[in]*/, fOverWrite/*[in,def,opt]*/);
}

Frontpage_xp::WebWindowPtr __fastcall TWebEx::get_ActiveWebWindow(void)
{
  Frontpage_xp::WebWindowPtr ppActiveWebWindow;
  OLECHECK(GetDefaultInterface()->get_ActiveWebWindow(&ppActiveWebWindow));
  return ppActiveWebWindow;
}

VARIANT_BOOL __fastcall TWebEx::get_AllowsLongFilenames(void)
{
  VARIANT_BOOL pbAllowLongFileNames;
  OLECHECK(GetDefaultInterface()->get_AllowsLongFilenames((VARIANT_BOOL*)&pbAllowLongFileNames));
  return pbAllowLongFileNames;
}

Frontpage_xp::NavigationNodePtr __fastcall TWebEx::get_RootNavigationNode(void)
{
  Frontpage_xp::NavigationNodePtr ppRootNavigationNode;
  OLECHECK(GetDefaultInterface()->get_RootNavigationNode(&ppRootNavigationNode));
  return ppRootNavigationNode;
}

Frontpage_xp::NavigationNodePtr __fastcall TWebEx::get_HomeNavigationNode(void)
{
  Frontpage_xp::NavigationNodePtr ppRootNavigationNode;
  OLECHECK(GetDefaultInterface()->get_HomeNavigationNode(&ppRootNavigationNode));
  return ppRootNavigationNode;
}

VARIANT_BOOL __fastcall TWebEx::get_IsUnderRevisionControl(void)
{
  VARIANT_BOOL pbIsUnderRCS;
  OLECHECK(GetDefaultInterface()->get_IsUnderRevisionControl((VARIANT_BOOL*)&pbIsUnderRCS));
  return pbIsUnderRCS;
}

Frontpage_xp::PropertiesPtr __fastcall TWebEx::get_Properties(void)
{
  Frontpage_xp::PropertiesPtr ppProps;
  OLECHECK(GetDefaultInterface()->get_Properties(&ppProps));
  return ppProps;
}

BSTR __fastcall TWebEx::get_RevisionControlProject(void)
{
  BSTR pbzRCSProjectName = 0;
  OLECHECK(GetDefaultInterface()->get_RevisionControlProject((BSTR*)&pbzRCSProjectName));
  return pbzRCSProjectName;
}

void __fastcall TWebEx::set_RevisionControlProject(BSTR pbzRCSProjectName/*[in]*/)
{
  GetDefaultInterface()->set_RevisionControlProject(pbzRCSProjectName/*[in]*/);
}

Frontpage_xp::WebFolderPtr __fastcall TWebEx::get_RootFolder(void)
{
  Frontpage_xp::WebFolderPtr ppRootFolder;
  OLECHECK(GetDefaultInterface()->get_RootFolder(&ppRootFolder));
  return ppRootFolder;
}

VARIANT __fastcall TWebEx::get_SharedBorders(Frontpage_xp::FpSharedBorders BorderIndex/*[in,def,opt]*/)
{
  VARIANT ppv;
  OLECHECK(GetDefaultInterface()->get_SharedBorders(BorderIndex, (VARIANT*)&ppv));
  return ppv;
}

void __fastcall TWebEx::set_SharedBorders(Frontpage_xp::FpSharedBorders BorderIndex/*[in,def,opt]*/, 
                                          VARIANT* ppv/*[in]*/)
{
  GetDefaultInterface()->set_SharedBorders(BorderIndex/*[in,def,opt]*/, ppv/*[in]*/);
}

VARIANT __fastcall TWebEx::get_ThemeProperties(Frontpage_xp::FpThemeProperties PropertyIndex/*[in,def,opt]*/)
{
  VARIANT ppv;
  OLECHECK(GetDefaultInterface()->get_ThemeProperties(PropertyIndex, (VARIANT*)&ppv));
  return ppv;
}

Frontpage_xp::ThemesPtr __fastcall TWebEx::get_Themes(void)
{
  Frontpage_xp::ThemesPtr ppThemesInWeb;
  OLECHECK(GetDefaultInterface()->get_Themes(&ppThemesInWeb));
  return ppThemesInWeb;
}

BSTR __fastcall TWebEx::get_Title(void)
{
  BSTR szWebTitle = 0;
  OLECHECK(GetDefaultInterface()->get_Title((BSTR*)&szWebTitle));
  return szWebTitle;
}

void __fastcall TWebEx::set_Title(BSTR szWebTitle/*[in]*/)
{
  GetDefaultInterface()->set_Title(szWebTitle/*[in]*/);
}

BSTR __fastcall TWebEx::get_Url(void)
{
  BSTR szWebUrl = 0;
  OLECHECK(GetDefaultInterface()->get_Url((BSTR*)&szWebUrl));
  return szWebUrl;
}

Frontpage_xp::WebWindowsPtr __fastcall TWebEx::get_WebWindows(void)
{
  Frontpage_xp::WebWindowsPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_WebWindows(&ppVal));
  return ppVal;
}

VARIANT_BOOL __fastcall TWebEx::get_IsHiddenFoldersEnabled(void)
{
  VARIANT_BOOL pbIsHiddenFoldersEnabled;
  OLECHECK(GetDefaultInterface()->get_IsHiddenFoldersEnabled((VARIANT_BOOL*)&pbIsHiddenFoldersEnabled));
  return pbIsHiddenFoldersEnabled;
}

void __fastcall TWebEx::set_IsHiddenFoldersEnabled(VARIANT_BOOL pbIsHiddenFoldersEnabled/*[in]*/)
{
  GetDefaultInterface()->set_IsHiddenFoldersEnabled(pbIsHiddenFoldersEnabled/*[in]*/);
}

Frontpage_xp::WebFilesPtr __fastcall TWebEx::get_AllFiles(void)
{
  Frontpage_xp::WebFilesPtr ppFilesCollection;
  OLECHECK(GetDefaultInterface()->get_AllFiles(&ppFilesCollection));
  return ppFilesCollection;
}

Frontpage_xp::WebFoldersPtr __fastcall TWebEx::get_AllFolders(void)
{
  Frontpage_xp::WebFoldersPtr ppFoldersCollection;
  OLECHECK(GetDefaultInterface()->get_AllFolders(&ppFoldersCollection));
  return ppFoldersCollection;
}

Frontpage_xp::NavigationNodesPtr __fastcall TWebEx::get_AllNavigationNodes(void)
{
  Frontpage_xp::NavigationNodesPtr ppNodes;
  OLECHECK(GetDefaultInterface()->get_AllNavigationNodes(&ppNodes));
  return ppNodes;
}

Frontpage_xp::_ListsPtr __fastcall TWebEx::get_Lists(void)
{
  Frontpage_xp::_ListsPtr ppLists;
  OLECHECK(GetDefaultInterface()->get_Lists(&ppLists));
  return ppLists;
}

WebWindowPtr& TWebWindowEx::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TWebWindowEx::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TWebWindowEx::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TWebWindowEx::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TWebWindowEx::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TWebWindowEx::ConnectTo(WebWindowPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TWebWindowEx::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_WebWindowEx;
  sd.IntfIID = __uuidof(WebWindow);
  sd.EventIID= __uuidof(_IWebWindowEvents);
  ServerData = &sd;
}

void __fastcall TWebWindowEx::InvokeEvent(int id, Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1: {
      if (OnBeforeViewChange) {
        (OnBeforeViewChange)(this, (Frontpage_xp::FpWebViewModeEx)(int)params[0], params[1].pboolVal);
      }
      break;
      }
    case 2: {
      if (OnAfterViewChange) {
        (OnAfterViewChange)(this);
      }
      break;
      }
    case 3: {
      if (OnActivate) {
        (OnActivate)(this);
      }
      break;
      }
    case 4: {
      if (OnDeactivate) {
        (OnDeactivate)(this);
      }
      break;
      }
    case 5: {
      if (OnBeforeSubViewChange) {
        (OnBeforeSubViewChange)(this, (Frontpage_xp::FpWebSubView)(int)params[0], params[1].pboolVal);
      }
      break;
      }
    case 6: {
      if (OnAfterSubViewChange) {
        (OnAfterSubViewChange)(this);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TWebWindowEx::Activate(void)
{
  GetDefaultInterface()->Activate();
}

void __fastcall TWebWindowEx::Close(void)
{
  GetDefaultInterface()->Close();
}

void __fastcall TWebWindowEx::VerifyAllLinks(void)
{
  GetDefaultInterface()->VerifyAllLinks();
}

void __fastcall TWebWindowEx::SaveReport(Frontpage_xp::FpWebViewModeEx reportviewModeEx/*[in]*/, 
                                         BSTR DestinationUrl/*[in]*/, BSTR Title/*[in]*/, 
                                         VARIANT_BOOL ForceOverwrite/*[in,def,opt]*/)
{
  GetDefaultInterface()->SaveReport(reportviewModeEx/*[in]*/, DestinationUrl/*[in]*/, Title/*[in]*/, 
                                    ForceOverwrite/*[in,def,opt]*/);
}

Frontpage_xp::PageWindowPtr __fastcall TWebWindowEx::get_ActivePageWindow(void)
{
  Frontpage_xp::PageWindowPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_ActivePageWindow(&ppVal));
  return ppVal;
}

BSTR __fastcall TWebWindowEx::get_Caption(void)
{
  BSTR pVal = 0;
  OLECHECK(GetDefaultInterface()->get_Caption((BSTR*)&pVal));
  return pVal;
}

Frontpage_xp::WebPtr __fastcall TWebWindowEx::get_Web(void)
{
  Frontpage_xp::WebPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_Web(&ppVal));
  return ppVal;
}

Frontpage_xp::PageWindowsPtr __fastcall TWebWindowEx::get_PageWindows(void)
{
  Frontpage_xp::PageWindowsPtr ppVal;
  OLECHECK(GetDefaultInterface()->get_PageWindows(&ppVal));
  return ppVal;
}

Frontpage_xp::FpWebViewMode __fastcall TWebWindowEx::get_ViewMode(void)
{
  Frontpage_xp::FpWebViewMode pviewMode;
  OLECHECK(GetDefaultInterface()->get_ViewMode((Frontpage_xp::FpWebViewMode*)&pviewMode));
  return pviewMode;
}

void __fastcall TWebWindowEx::set_ViewMode(Frontpage_xp::FpWebViewMode pviewMode/*[in]*/)
{
  GetDefaultInterface()->set_ViewMode(pviewMode/*[in]*/);
}

VARIANT_BOOL __fastcall TWebWindowEx::get_Visible(void)
{
  VARIANT_BOOL pfIsWindowVisible;
  OLECHECK(GetDefaultInterface()->get_Visible((VARIANT_BOOL*)&pfIsWindowVisible));
  return pfIsWindowVisible;
}

void __fastcall TWebWindowEx::set_Visible(VARIANT_BOOL pfIsWindowVisible/*[in]*/)
{
  GetDefaultInterface()->set_Visible(pfIsWindowVisible/*[in]*/);
}

LPSAFEARRAY __fastcall TWebWindowEx::get_SelectedFiles(void)
{
  LPSAFEARRAY psa;
  OLECHECK(GetDefaultInterface()->get_SelectedFiles((LPSAFEARRAY*)&psa));
  return psa;
}

LPSAFEARRAY __fastcall TWebWindowEx::get_SelectedFolders(void)
{
  LPSAFEARRAY psa;
  OLECHECK(GetDefaultInterface()->get_SelectedFolders((LPSAFEARRAY*)&psa));
  return psa;
}

Frontpage_xp::FpWebViewModeEx __fastcall TWebWindowEx::get_ViewModeEx(void)
{
  Frontpage_xp::FpWebViewModeEx pviewModeEx;
  OLECHECK(GetDefaultInterface()->get_ViewModeEx((Frontpage_xp::FpWebViewModeEx*)&pviewModeEx));
  return pviewModeEx;
}

void __fastcall TWebWindowEx::set_ViewModeEx(Frontpage_xp::FpWebViewModeEx pviewModeEx/*[in]*/)
{
  GetDefaultInterface()->set_ViewModeEx(pviewModeEx/*[in]*/);
}

Frontpage_xp::FpWebSubView __fastcall TWebWindowEx::get_SubViewMode(void)
{
  Frontpage_xp::FpWebSubView pSubView;
  OLECHECK(GetDefaultInterface()->get_SubViewMode((Frontpage_xp::FpWebSubView*)&pSubView));
  return pSubView;
}

void __fastcall TWebWindowEx::set_SubViewMode(Frontpage_xp::FpWebSubView pSubView/*[in]*/)
{
  GetDefaultInterface()->set_SubViewMode(pSubView/*[in]*/);
}

_ListsPtr& TLists::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TLists::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TLists::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TLists::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TLists::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TLists::ConnectTo(_ListsPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TLists::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_Lists;
  sd.IntfIID = __uuidof(_Lists);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Frontpage_xp::_List* __fastcall TLists::Add(BSTR Name/*[in]*/, BSTR ParentFolder/*[in,def,opt]*/, 
                                            Frontpage_xp::FpListType ListType/*[in,def,opt]*/, 
                                            BSTR Description/*[in,def,opt]*/)
{
  Frontpage_xp::_List* ppVal = 0;
  OLECHECK(GetDefaultInterface()->Add(Name, ParentFolder, ListType, Description, (Frontpage_xp::_List**)&ppVal));
  return ppVal;
}

VARIANT __fastcall TLists::get_Count(void)
{
  VARIANT plCount;
  OLECHECK(GetDefaultInterface()->get_Count((VARIANT*)&plCount));
  return plCount;
}

LPUNKNOWN __fastcall TLists::get__NewEnum(void)
{
  LPUNKNOWN ppVal;
  OLECHECK(GetDefaultInterface()->get__NewEnum((LPUNKNOWN*)&ppVal));
  return ppVal;
}

LPDISPATCH __fastcall TLists::get_Item(VARIANT* Index/*[in]*/)
{
  LPDISPATCH ppVal;
  OLECHECK(GetDefaultInterface()->get_Item(Index, (LPDISPATCH*)&ppVal));
  return ppVal;
}

_ListPtr& TList::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TList::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TList::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TList::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TList::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TList::ConnectTo(_ListPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TList::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_List;
  sd.IntfIID = __uuidof(_List);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

void __fastcall TList::ApplyChanges(void)
{
  GetDefaultInterface()->ApplyChanges();
}

void __fastcall TList::Reserved1(void)
{
  GetDefaultInterface()->Reserved1();
}

void __fastcall TList::Reserved2(void)
{
  GetDefaultInterface()->Reserved2();
}

void __fastcall TList::Reserved3(void)
{
  GetDefaultInterface()->Reserved3();
}

void __fastcall TList::Reserved4(void)
{
  GetDefaultInterface()->Reserved4();
}

void __fastcall TList::Reserved5(void)
{
  GetDefaultInterface()->Reserved5();
}

void __fastcall TList::Reserved6(void)
{
  GetDefaultInterface()->Reserved6();
}

void __fastcall TList::Reserved7(void)
{
  GetDefaultInterface()->Reserved7();
}

void __fastcall TList::Reserved8(void)
{
  GetDefaultInterface()->Reserved8();
}

void __fastcall TList::Reserved9(void)
{
  GetDefaultInterface()->Reserved9();
}

void __fastcall TList::Reserved10(void)
{
  GetDefaultInterface()->Reserved10();
}

BSTR __fastcall TList::get_Name(void)
{
  BSTR pbstrName = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&pbstrName));
  return pbstrName;
}

void __fastcall TList::set_Name(BSTR pbstrName/*[in]*/)
{
  GetDefaultInterface()->set_Name(pbstrName/*[in]*/);
}

BSTR __fastcall TList::get_Description(void)
{
  BSTR pbstrDescription = 0;
  OLECHECK(GetDefaultInterface()->get_Description((BSTR*)&pbstrDescription));
  return pbstrDescription;
}

void __fastcall TList::set_Description(BSTR pbstrDescription/*[in]*/)
{
  GetDefaultInterface()->set_Description(pbstrDescription/*[in]*/);
}

Frontpage_xp::_ListFieldsPtr __fastcall TList::get_Fields(void)
{
  Frontpage_xp::_ListFieldsPtr ppListFields;
  OLECHECK(GetDefaultInterface()->get_Fields(&ppListFields));
  return ppListFields;
}

Frontpage_xp::WebFolderPtr __fastcall TList::get_Folder(void)
{
  Frontpage_xp::WebFolderPtr ppWebFolder;
  OLECHECK(GetDefaultInterface()->get_Folder(&ppWebFolder));
  return ppWebFolder;
}

BSTR __fastcall TList::get_DefaultViewPage(void)
{
  BSTR pbstrViewPage = 0;
  OLECHECK(GetDefaultInterface()->get_DefaultViewPage((BSTR*)&pbstrViewPage));
  return pbstrViewPage;
}

void __fastcall TList::set_DefaultViewPage(BSTR pbstrViewPage/*[in]*/)
{
  GetDefaultInterface()->set_DefaultViewPage(pbstrViewPage/*[in]*/);
}

BSTR __fastcall TList::get_DisplayForm(void)
{
  BSTR pbstrDisplayForm = 0;
  OLECHECK(GetDefaultInterface()->get_DisplayForm((BSTR*)&pbstrDisplayForm));
  return pbstrDisplayForm;
}

void __fastcall TList::set_DisplayForm(BSTR pbstrDisplayForm/*[in]*/)
{
  GetDefaultInterface()->set_DisplayForm(pbstrDisplayForm/*[in]*/);
}

BSTR __fastcall TList::get_EditForm(void)
{
  BSTR pbstrEditForm = 0;
  OLECHECK(GetDefaultInterface()->get_EditForm((BSTR*)&pbstrEditForm));
  return pbstrEditForm;
}

void __fastcall TList::set_EditForm(BSTR pbstrEditForm/*[in]*/)
{
  GetDefaultInterface()->set_EditForm(pbstrEditForm/*[in]*/);
}

BSTR __fastcall TList::get_NewForm(void)
{
  BSTR pbstrNewForm = 0;
  OLECHECK(GetDefaultInterface()->get_NewForm((BSTR*)&pbstrNewForm));
  return pbstrNewForm;
}

void __fastcall TList::set_NewForm(BSTR pbstrNewForm/*[in]*/)
{
  GetDefaultInterface()->set_NewForm(pbstrNewForm/*[in]*/);
}

Frontpage_xp::FpListDesignSecurity __fastcall TList::get_DesignSecurity(void)
{
  Frontpage_xp::FpListDesignSecurity peDesignSecurity;
  OLECHECK(GetDefaultInterface()->get_DesignSecurity((Frontpage_xp::FpListDesignSecurity*)&peDesignSecurity));
  return peDesignSecurity;
}

void __fastcall TList::set_DesignSecurity(Frontpage_xp::FpListDesignSecurity peDesignSecurity/*[in]*/)
{
  GetDefaultInterface()->set_DesignSecurity(peDesignSecurity/*[in]*/);
}

Frontpage_xp::FpListType __fastcall TList::get_Type(void)
{
  Frontpage_xp::FpListType peListType;
  OLECHECK(GetDefaultInterface()->get_Type((Frontpage_xp::FpListType*)&peListType));
  return peListType;
}

Frontpage_xp::WebPtr __fastcall TList::get_Web(void)
{
  Frontpage_xp::WebPtr pWeb;
  OLECHECK(GetDefaultInterface()->get_Web(&pWeb));
  return pWeb;
}

VARIANT_BOOL __fastcall TList::get_ReadOnly(void)
{
  VARIANT_BOOL pReadOnly;
  OLECHECK(GetDefaultInterface()->get_ReadOnly((VARIANT_BOOL*)&pReadOnly));
  return pReadOnly;
}

LPSAFEARRAY __fastcall TList::get_ViewPages(void)
{
  LPSAFEARRAY ppsaViewPages;
  OLECHECK(GetDefaultInterface()->get_ViewPages((LPSAFEARRAY*)&ppsaViewPages));
  return ppsaViewPages;
}

_BasicListPtr& TBasicList::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TBasicList::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TBasicList::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TBasicList::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TBasicList::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TBasicList::ConnectTo(_BasicListPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TBasicList::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_BasicList;
  sd.IntfIID = __uuidof(_BasicList);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Frontpage_xp::FpListEditSecurity __fastcall TBasicList::get_EditSecurity(void)
{
  Frontpage_xp::FpListEditSecurity peEditSecurity;
  OLECHECK(GetDefaultInterface()->get_EditSecurity((Frontpage_xp::FpListEditSecurity*)&peEditSecurity));
  return peEditSecurity;
}

void __fastcall TBasicList::set_EditSecurity(Frontpage_xp::FpListEditSecurity peEditSecurity/*[in]*/)
{
  GetDefaultInterface()->set_EditSecurity(peEditSecurity/*[in]*/);
}

Frontpage_xp::FpListReadSecurity __fastcall TBasicList::get_ReadSecurity(void)
{
  Frontpage_xp::FpListReadSecurity peReadSecurity;
  OLECHECK(GetDefaultInterface()->get_ReadSecurity((Frontpage_xp::FpListReadSecurity*)&peReadSecurity));
  return peReadSecurity;
}

void __fastcall TBasicList::set_ReadSecurity(Frontpage_xp::FpListReadSecurity peReadSecurity/*[in]*/)
{
  GetDefaultInterface()->set_ReadSecurity(peReadSecurity/*[in]*/);
}

_SurveyPtr& TSurvey::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TSurvey::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TSurvey::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TSurvey::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TSurvey::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TSurvey::ConnectTo(_SurveyPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TSurvey::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_Survey;
  sd.IntfIID = __uuidof(_Survey);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Frontpage_xp::FpListEditSecurity __fastcall TSurvey::get_EditSecurity(void)
{
  Frontpage_xp::FpListEditSecurity peEditSecurity;
  OLECHECK(GetDefaultInterface()->get_EditSecurity((Frontpage_xp::FpListEditSecurity*)&peEditSecurity));
  return peEditSecurity;
}

void __fastcall TSurvey::set_EditSecurity(Frontpage_xp::FpListEditSecurity peEditSecurity/*[in]*/)
{
  GetDefaultInterface()->set_EditSecurity(peEditSecurity/*[in]*/);
}

Frontpage_xp::FpListReadSecurity __fastcall TSurvey::get_ReadSecurity(void)
{
  Frontpage_xp::FpListReadSecurity peReadSecurity;
  OLECHECK(GetDefaultInterface()->get_ReadSecurity((Frontpage_xp::FpListReadSecurity*)&peReadSecurity));
  return peReadSecurity;
}

void __fastcall TSurvey::set_ReadSecurity(Frontpage_xp::FpListReadSecurity peReadSecurity/*[in]*/)
{
  GetDefaultInterface()->set_ReadSecurity(peReadSecurity/*[in]*/);
}

VARIANT_BOOL __fastcall TSurvey::get_ShowUserNamesInResults(void)
{
  VARIANT_BOOL pShowUserNames;
  OLECHECK(GetDefaultInterface()->get_ShowUserNamesInResults((VARIANT_BOOL*)&pShowUserNames));
  return pShowUserNames;
}

void __fastcall TSurvey::set_ShowUserNamesInResults(VARIANT_BOOL pShowUserNames/*[in]*/)
{
  GetDefaultInterface()->set_ShowUserNamesInResults(pShowUserNames/*[in]*/);
}

VARIANT_BOOL __fastcall TSurvey::get_AllowMultipleResponses(void)
{
  VARIANT_BOOL pAllowMultipleResponses;
  OLECHECK(GetDefaultInterface()->get_AllowMultipleResponses((VARIANT_BOOL*)&pAllowMultipleResponses));
  return pAllowMultipleResponses;
}

void __fastcall TSurvey::set_AllowMultipleResponses(VARIANT_BOOL pAllowMultipleResponses/*[in]*/)
{
  GetDefaultInterface()->set_AllowMultipleResponses(pAllowMultipleResponses/*[in]*/);
}

_DocumentLibraryPtr& TDocumentLibrary::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TDocumentLibrary::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TDocumentLibrary::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TDocumentLibrary::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TDocumentLibrary::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TDocumentLibrary::ConnectTo(_DocumentLibraryPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TDocumentLibrary::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_DocumentLibrary;
  sd.IntfIID = __uuidof(_DocumentLibrary);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

BSTR __fastcall TDocumentLibrary::get_Template(void)
{
  BSTR pbstrTemplate = 0;
  OLECHECK(GetDefaultInterface()->get_Template((BSTR*)&pbstrTemplate));
  return pbstrTemplate;
}

void __fastcall TDocumentLibrary::set_Template(BSTR pbstrTemplate/*[in]*/)
{
  GetDefaultInterface()->set_Template(pbstrTemplate/*[in]*/);
}

BSTR __fastcall TDocumentLibrary::get_FileDialogViewPage(void)
{
  BSTR pbstrViewPage = 0;
  OLECHECK(GetDefaultInterface()->get_FileDialogViewPage((BSTR*)&pbstrViewPage));
  return pbstrViewPage;
}

void __fastcall TDocumentLibrary::set_FileDialogViewPage(BSTR pbstrViewPage/*[in]*/)
{
  GetDefaultInterface()->set_FileDialogViewPage(pbstrViewPage/*[in]*/);
}

BSTR __fastcall TDocumentLibrary::get_FileSaveForm(void)
{
  BSTR pbstrSaveForm = 0;
  OLECHECK(GetDefaultInterface()->get_FileSaveForm((BSTR*)&pbstrSaveForm));
  return pbstrSaveForm;
}

void __fastcall TDocumentLibrary::set_FileSaveForm(BSTR pbstrSaveForm/*[in]*/)
{
  GetDefaultInterface()->set_FileSaveForm(pbstrSaveForm/*[in]*/);
}

_ListFieldsPtr& TListFields::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFields::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFields::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFields::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFields::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFields::ConnectTo(_ListFieldsPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFields::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFields;
  sd.IntfIID = __uuidof(_ListFields);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Frontpage_xp::_ListField* __fastcall TListFields::Add(BSTR Name/*[in]*/, 
                                                      BSTR Description/*[in,def,opt]*/, 
                                                      Frontpage_xp::FpFieldType FieldType/*[in,def,opt]*/, 
                                                      VARIANT_BOOL Required/*[in,def,opt]*/, 
                                                      Frontpage_xp::_ListField* pLookupField/*[in,def,opt]*/, 
                                                      VARIANT* DefaultValue/*[in,opt]*/)
{
  Frontpage_xp::_ListField* ppVal = 0;
  OLECHECK(GetDefaultInterface()->Add(Name, Description, FieldType, Required, pLookupField, 
                                      DefaultValue, (Frontpage_xp::_ListField**)&ppVal));
  return ppVal;
}

VARIANT __fastcall TListFields::get_Count(void)
{
  VARIANT plCount;
  OLECHECK(GetDefaultInterface()->get_Count((VARIANT*)&plCount));
  return plCount;
}

LPUNKNOWN __fastcall TListFields::get__NewEnum(void)
{
  LPUNKNOWN ppVal;
  OLECHECK(GetDefaultInterface()->get__NewEnum((LPUNKNOWN*)&ppVal));
  return ppVal;
}

LPDISPATCH __fastcall TListFields::get_Item(VARIANT* Index/*[in]*/)
{
  LPDISPATCH ppVal;
  OLECHECK(GetDefaultInterface()->get_Item(Index, (LPDISPATCH*)&ppVal));
  return ppVal;
}

_ListFieldPtr& TListField::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListField::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListField::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListField::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListField::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListField::ConnectTo(_ListFieldPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListField::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListField;
  sd.IntfIID = __uuidof(_ListField);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

void __fastcall TListField::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TListField::Reserved1(void)
{
  GetDefaultInterface()->Reserved1();
}

void __fastcall TListField::Reserved2(void)
{
  GetDefaultInterface()->Reserved2();
}

void __fastcall TListField::Reserved3(void)
{
  GetDefaultInterface()->Reserved3();
}

void __fastcall TListField::Reserved4(void)
{
  GetDefaultInterface()->Reserved4();
}

void __fastcall TListField::Reserved5(void)
{
  GetDefaultInterface()->Reserved5();
}

void __fastcall TListField::Reserved6(void)
{
  GetDefaultInterface()->Reserved6();
}

void __fastcall TListField::Reserved7(void)
{
  GetDefaultInterface()->Reserved7();
}

void __fastcall TListField::Reserved8(void)
{
  GetDefaultInterface()->Reserved8();
}

void __fastcall TListField::Reserved9(void)
{
  GetDefaultInterface()->Reserved9();
}

void __fastcall TListField::Reserved10(void)
{
  GetDefaultInterface()->Reserved10();
}

BSTR __fastcall TListField::get_Name(void)
{
  BSTR pbstrName = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&pbstrName));
  return pbstrName;
}

void __fastcall TListField::set_Name(BSTR pbstrName/*[in]*/)
{
  GetDefaultInterface()->set_Name(pbstrName/*[in]*/);
}

BSTR __fastcall TListField::get_Description(void)
{
  BSTR pbstrDescription = 0;
  OLECHECK(GetDefaultInterface()->get_Description((BSTR*)&pbstrDescription));
  return pbstrDescription;
}

void __fastcall TListField::set_Description(BSTR pbstrDescription/*[in]*/)
{
  GetDefaultInterface()->set_Description(pbstrDescription/*[in]*/);
}

Frontpage_xp::FpFieldType __fastcall TListField::get_Type(void)
{
  Frontpage_xp::FpFieldType pType;
  OLECHECK(GetDefaultInterface()->get_Type((Frontpage_xp::FpFieldType*)&pType));
  return pType;
}

VARIANT_BOOL __fastcall TListField::get_ReadOnly(void)
{
  VARIANT_BOOL pReadOnly;
  OLECHECK(GetDefaultInterface()->get_ReadOnly((VARIANT_BOOL*)&pReadOnly));
  return pReadOnly;
}

Frontpage_xp::WebPtr __fastcall TListField::get_Web(void)
{
  Frontpage_xp::WebPtr pWeb;
  OLECHECK(GetDefaultInterface()->get_Web(&pWeb));
  return pWeb;
}

_ListFieldSingleLinePtr& TListFieldSingleLine::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldSingleLine::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldSingleLine::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldSingleLine::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldSingleLine::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldSingleLine::ConnectTo(_ListFieldSingleLinePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldSingleLine::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldSingleLine;
  sd.IntfIID = __uuidof(_ListFieldSingleLine);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

long __fastcall TListFieldSingleLine::get_MaxLength(void)
{
  long plMaxLength;
  OLECHECK(GetDefaultInterface()->get_MaxLength((long*)&plMaxLength));
  return plMaxLength;
}

void __fastcall TListFieldSingleLine::set_MaxLength(long plMaxLength/*[in]*/)
{
  GetDefaultInterface()->set_MaxLength(plMaxLength/*[in]*/);
}

VARIANT __fastcall TListFieldSingleLine::get_DefaultValue(void)
{
  VARIANT pvDefaultValue;
  OLECHECK(GetDefaultInterface()->get_DefaultValue((VARIANT*)&pvDefaultValue));
  return pvDefaultValue;
}

void __fastcall TListFieldSingleLine::set_DefaultValue(VARIANT* pvDefaultValue/*[in]*/)
{
  GetDefaultInterface()->set_DefaultValue(pvDefaultValue/*[in]*/);
}

VARIANT_BOOL __fastcall TListFieldSingleLine::get_Required(void)
{
  VARIANT_BOOL pRequired;
  OLECHECK(GetDefaultInterface()->get_Required((VARIANT_BOOL*)&pRequired));
  return pRequired;
}

void __fastcall TListFieldSingleLine::set_Required(VARIANT_BOOL pRequired/*[in]*/)
{
  GetDefaultInterface()->set_Required(pRequired/*[in]*/);
}

_ListFieldMultiLinePtr& TListFieldMultiLine::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldMultiLine::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldMultiLine::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldMultiLine::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldMultiLine::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldMultiLine::ConnectTo(_ListFieldMultiLinePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldMultiLine::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldMultiLine;
  sd.IntfIID = __uuidof(_ListFieldMultiLine);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

long __fastcall TListFieldMultiLine::get_NumberOfLines(void)
{
  long plNumberOfLines;
  OLECHECK(GetDefaultInterface()->get_NumberOfLines((long*)&plNumberOfLines));
  return plNumberOfLines;
}

void __fastcall TListFieldMultiLine::set_NumberOfLines(long plNumberOfLines/*[in]*/)
{
  GetDefaultInterface()->set_NumberOfLines(plNumberOfLines/*[in]*/);
}

VARIANT __fastcall TListFieldMultiLine::get_DefaultValue(void)
{
  VARIANT pvDefaultValue;
  OLECHECK(GetDefaultInterface()->get_DefaultValue((VARIANT*)&pvDefaultValue));
  return pvDefaultValue;
}

void __fastcall TListFieldMultiLine::set_DefaultValue(VARIANT* pvDefaultValue/*[in]*/)
{
  GetDefaultInterface()->set_DefaultValue(pvDefaultValue/*[in]*/);
}

VARIANT_BOOL __fastcall TListFieldMultiLine::get_Required(void)
{
  VARIANT_BOOL pRequired;
  OLECHECK(GetDefaultInterface()->get_Required((VARIANT_BOOL*)&pRequired));
  return pRequired;
}

void __fastcall TListFieldMultiLine::set_Required(VARIANT_BOOL pRequired/*[in]*/)
{
  GetDefaultInterface()->set_Required(pRequired/*[in]*/);
}

_ListFieldNumberPtr& TListFieldNumber::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldNumber::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldNumber::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldNumber::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldNumber::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldNumber::ConnectTo(_ListFieldNumberPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldNumber::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldNumber;
  sd.IntfIID = __uuidof(_ListFieldNumber);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Frontpage_xp::FpNumberFieldFormat __fastcall TListFieldNumber::get_DisplayFormat(void)
{
  Frontpage_xp::FpNumberFieldFormat pFormat;
  OLECHECK(GetDefaultInterface()->get_DisplayFormat((Frontpage_xp::FpNumberFieldFormat*)&pFormat));
  return pFormat;
}

void __fastcall TListFieldNumber::set_DisplayFormat(Frontpage_xp::FpNumberFieldFormat pFormat/*[in]*/)
{
  GetDefaultInterface()->set_DisplayFormat(pFormat/*[in]*/);
}

VARIANT_BOOL __fastcall TListFieldNumber::get_ShowAsPercentage(void)
{
  VARIANT_BOOL pShowAsPercentage;
  OLECHECK(GetDefaultInterface()->get_ShowAsPercentage((VARIANT_BOOL*)&pShowAsPercentage));
  return pShowAsPercentage;
}

void __fastcall TListFieldNumber::set_ShowAsPercentage(VARIANT_BOOL pShowAsPercentage/*[in]*/)
{
  GetDefaultInterface()->set_ShowAsPercentage(pShowAsPercentage/*[in]*/);
}

VARIANT __fastcall TListFieldNumber::get_MinimumValue(void)
{
  VARIANT pvMinimumValue;
  OLECHECK(GetDefaultInterface()->get_MinimumValue((VARIANT*)&pvMinimumValue));
  return pvMinimumValue;
}

void __fastcall TListFieldNumber::set_MinimumValue(VARIANT* pvMinimumValue/*[in]*/)
{
  GetDefaultInterface()->set_MinimumValue(pvMinimumValue/*[in]*/);
}

VARIANT __fastcall TListFieldNumber::get_MaximumValue(void)
{
  VARIANT pvMaximumValue;
  OLECHECK(GetDefaultInterface()->get_MaximumValue((VARIANT*)&pvMaximumValue));
  return pvMaximumValue;
}

void __fastcall TListFieldNumber::set_MaximumValue(VARIANT* pvMaximumValue/*[in]*/)
{
  GetDefaultInterface()->set_MaximumValue(pvMaximumValue/*[in]*/);
}

VARIANT __fastcall TListFieldNumber::get_DefaultValue(void)
{
  VARIANT pvDefaultValue;
  OLECHECK(GetDefaultInterface()->get_DefaultValue((VARIANT*)&pvDefaultValue));
  return pvDefaultValue;
}

void __fastcall TListFieldNumber::set_DefaultValue(VARIANT* pvDefaultValue/*[in]*/)
{
  GetDefaultInterface()->set_DefaultValue(pvDefaultValue/*[in]*/);
}

VARIANT_BOOL __fastcall TListFieldNumber::get_Required(void)
{
  VARIANT_BOOL pRequired;
  OLECHECK(GetDefaultInterface()->get_Required((VARIANT_BOOL*)&pRequired));
  return pRequired;
}

void __fastcall TListFieldNumber::set_Required(VARIANT_BOOL pRequired/*[in]*/)
{
  GetDefaultInterface()->set_Required(pRequired/*[in]*/);
}

_ListFieldCurrencyPtr& TListFieldCurrency::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldCurrency::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldCurrency::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldCurrency::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldCurrency::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldCurrency::ConnectTo(_ListFieldCurrencyPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldCurrency::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldCurrency;
  sd.IntfIID = __uuidof(_ListFieldCurrency);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Frontpage_xp::FpNumberFieldFormat __fastcall TListFieldCurrency::get_DisplayFormat(void)
{
  Frontpage_xp::FpNumberFieldFormat pFormat;
  OLECHECK(GetDefaultInterface()->get_DisplayFormat((Frontpage_xp::FpNumberFieldFormat*)&pFormat));
  return pFormat;
}

void __fastcall TListFieldCurrency::set_DisplayFormat(Frontpage_xp::FpNumberFieldFormat pFormat/*[in]*/)
{
  GetDefaultInterface()->set_DisplayFormat(pFormat/*[in]*/);
}

Frontpage_xp::FpCurrencyFieldFormat __fastcall TListFieldCurrency::get_Currency(void)
{
  Frontpage_xp::FpCurrencyFieldFormat peCurrency;
  OLECHECK(GetDefaultInterface()->get_Currency((Frontpage_xp::FpCurrencyFieldFormat*)&peCurrency));
  return peCurrency;
}

void __fastcall TListFieldCurrency::set_Currency(Frontpage_xp::FpCurrencyFieldFormat peCurrency/*[in]*/)
{
  GetDefaultInterface()->set_Currency(peCurrency/*[in]*/);
}

VARIANT __fastcall TListFieldCurrency::get_MinimumValue(void)
{
  VARIANT pvMinimumValue;
  OLECHECK(GetDefaultInterface()->get_MinimumValue((VARIANT*)&pvMinimumValue));
  return pvMinimumValue;
}

void __fastcall TListFieldCurrency::set_MinimumValue(VARIANT* pvMinimumValue/*[in]*/)
{
  GetDefaultInterface()->set_MinimumValue(pvMinimumValue/*[in]*/);
}

VARIANT __fastcall TListFieldCurrency::get_MaximumValue(void)
{
  VARIANT pvMaximumValue;
  OLECHECK(GetDefaultInterface()->get_MaximumValue((VARIANT*)&pvMaximumValue));
  return pvMaximumValue;
}

void __fastcall TListFieldCurrency::set_MaximumValue(VARIANT* pvMaximumValue/*[in]*/)
{
  GetDefaultInterface()->set_MaximumValue(pvMaximumValue/*[in]*/);
}

VARIANT __fastcall TListFieldCurrency::get_DefaultValue(void)
{
  VARIANT pvDefaultValue;
  OLECHECK(GetDefaultInterface()->get_DefaultValue((VARIANT*)&pvDefaultValue));
  return pvDefaultValue;
}

void __fastcall TListFieldCurrency::set_DefaultValue(VARIANT* pvDefaultValue/*[in]*/)
{
  GetDefaultInterface()->set_DefaultValue(pvDefaultValue/*[in]*/);
}

VARIANT_BOOL __fastcall TListFieldCurrency::get_Required(void)
{
  VARIANT_BOOL pRequired;
  OLECHECK(GetDefaultInterface()->get_Required((VARIANT_BOOL*)&pRequired));
  return pRequired;
}

void __fastcall TListFieldCurrency::set_Required(VARIANT_BOOL pRequired/*[in]*/)
{
  GetDefaultInterface()->set_Required(pRequired/*[in]*/);
}

_ListFieldDateTimePtr& TListFieldDateTime::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldDateTime::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldDateTime::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldDateTime::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldDateTime::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldDateTime::ConnectTo(_ListFieldDateTimePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldDateTime::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldDateTime;
  sd.IntfIID = __uuidof(_ListFieldDateTime);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Frontpage_xp::FpDateTimeFieldFormat __fastcall TListFieldDateTime::get_DisplayFormat(void)
{
  Frontpage_xp::FpDateTimeFieldFormat pFormat;
  OLECHECK(GetDefaultInterface()->get_DisplayFormat((Frontpage_xp::FpDateTimeFieldFormat*)&pFormat));
  return pFormat;
}

void __fastcall TListFieldDateTime::set_DisplayFormat(Frontpage_xp::FpDateTimeFieldFormat pFormat/*[in]*/)
{
  GetDefaultInterface()->set_DisplayFormat(pFormat/*[in]*/);
}

VARIANT __fastcall TListFieldDateTime::get_DefaultValue(void)
{
  VARIANT pvDefaultValue;
  OLECHECK(GetDefaultInterface()->get_DefaultValue((VARIANT*)&pvDefaultValue));
  return pvDefaultValue;
}

void __fastcall TListFieldDateTime::set_DefaultValue(VARIANT* pvDefaultValue/*[in]*/)
{
  GetDefaultInterface()->set_DefaultValue(pvDefaultValue/*[in]*/);
}

VARIANT_BOOL __fastcall TListFieldDateTime::get_Required(void)
{
  VARIANT_BOOL pRequired;
  OLECHECK(GetDefaultInterface()->get_Required((VARIANT_BOOL*)&pRequired));
  return pRequired;
}

void __fastcall TListFieldDateTime::set_Required(VARIANT_BOOL pRequired/*[in]*/)
{
  GetDefaultInterface()->set_Required(pRequired/*[in]*/);
}

_ListFieldChoicePtr& TListFieldChoice::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldChoice::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldChoice::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldChoice::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldChoice::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldChoice::ConnectTo(_ListFieldChoicePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldChoice::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldChoice;
  sd.IntfIID = __uuidof(_ListFieldChoice);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

void __fastcall TListFieldChoice::SetChoices(LPSAFEARRAY* ppsaChoices/*[in]*/)
{
  GetDefaultInterface()->SetChoices(ppsaChoices/*[in]*/);
}

void __fastcall TListFieldChoice::AddChoice(BSTR Text/*[in]*/, long Index/*[in,def,opt]*/)
{
  GetDefaultInterface()->AddChoice(Text/*[in]*/, Index/*[in,def,opt]*/);
}

void __fastcall TListFieldChoice::RemoveChoice(long Index/*[in]*/)
{
  GetDefaultInterface()->RemoveChoice(Index/*[in]*/);
}

void __fastcall TListFieldChoice::ClearChoices(void)
{
  GetDefaultInterface()->ClearChoices();
}

Frontpage_xp::FpChoiceFieldFormat __fastcall TListFieldChoice::get_DisplayFormat(void)
{
  Frontpage_xp::FpChoiceFieldFormat pFormat;
  OLECHECK(GetDefaultInterface()->get_DisplayFormat((Frontpage_xp::FpChoiceFieldFormat*)&pFormat));
  return pFormat;
}

void __fastcall TListFieldChoice::set_DisplayFormat(Frontpage_xp::FpChoiceFieldFormat pFormat/*[in]*/)
{
  GetDefaultInterface()->set_DisplayFormat(pFormat/*[in]*/);
}

LPSAFEARRAY __fastcall TListFieldChoice::get_Choices(void)
{
  LPSAFEARRAY ppsaChoices;
  OLECHECK(GetDefaultInterface()->get_Choices((LPSAFEARRAY*)&ppsaChoices));
  return ppsaChoices;
}

VARIANT __fastcall TListFieldChoice::get_DefaultValue(void)
{
  VARIANT pvDefaultValue;
  OLECHECK(GetDefaultInterface()->get_DefaultValue((VARIANT*)&pvDefaultValue));
  return pvDefaultValue;
}

void __fastcall TListFieldChoice::set_DefaultValue(VARIANT* pvDefaultValue/*[in]*/)
{
  GetDefaultInterface()->set_DefaultValue(pvDefaultValue/*[in]*/);
}

VARIANT_BOOL __fastcall TListFieldChoice::get_Required(void)
{
  VARIANT_BOOL pRequired;
  OLECHECK(GetDefaultInterface()->get_Required((VARIANT_BOOL*)&pRequired));
  return pRequired;
}

void __fastcall TListFieldChoice::set_Required(VARIANT_BOOL pRequired/*[in]*/)
{
  GetDefaultInterface()->set_Required(pRequired/*[in]*/);
}

_ListFieldLookupPtr& TListFieldLookup::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldLookup::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldLookup::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldLookup::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldLookup::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldLookup::ConnectTo(_ListFieldLookupPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldLookup::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldLookup;
  sd.IntfIID = __uuidof(_ListFieldLookup);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Frontpage_xp::_ListFieldPtr __fastcall TListFieldLookup::get_LookupField(void)
{
  Frontpage_xp::_ListFieldPtr ppField;
  OLECHECK(GetDefaultInterface()->get_LookupField(&ppField));
  return ppField;
}

void __fastcall TListFieldLookup::set_LookupField(Frontpage_xp::_ListFieldPtr ppField/*[in]*/)
{
  GetDefaultInterface()->set_LookupField(ppField/*[in]*/);
}

_ListFieldTrueFalsePtr& TListFieldTrueFalse::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldTrueFalse::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldTrueFalse::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldTrueFalse::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldTrueFalse::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldTrueFalse::ConnectTo(_ListFieldTrueFalsePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldTrueFalse::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldTrueFalse;
  sd.IntfIID = __uuidof(_ListFieldTrueFalse);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

VARIANT __fastcall TListFieldTrueFalse::get_DefaultValue(void)
{
  VARIANT pvDefaultValue;
  OLECHECK(GetDefaultInterface()->get_DefaultValue((VARIANT*)&pvDefaultValue));
  return pvDefaultValue;
}

void __fastcall TListFieldTrueFalse::set_DefaultValue(VARIANT* pvDefaultValue/*[in]*/)
{
  GetDefaultInterface()->set_DefaultValue(pvDefaultValue/*[in]*/);
}

_ListFieldURLPtr& TListFieldURL::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldURL::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldURL::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldURL::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldURL::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldURL::ConnectTo(_ListFieldURLPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldURL::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldURL;
  sd.IntfIID = __uuidof(_ListFieldURL);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Frontpage_xp::FpURLFieldFormat __fastcall TListFieldURL::get_DisplayFormat(void)
{
  Frontpage_xp::FpURLFieldFormat pFormat;
  OLECHECK(GetDefaultInterface()->get_DisplayFormat((Frontpage_xp::FpURLFieldFormat*)&pFormat));
  return pFormat;
}

void __fastcall TListFieldURL::set_DisplayFormat(Frontpage_xp::FpURLFieldFormat pFormat/*[in]*/)
{
  GetDefaultInterface()->set_DisplayFormat(pFormat/*[in]*/);
}

BSTR __fastcall TListFieldURL::get_DefaultText(void)
{
  BSTR pbstrDefaultText = 0;
  OLECHECK(GetDefaultInterface()->get_DefaultText((BSTR*)&pbstrDefaultText));
  return pbstrDefaultText;
}

void __fastcall TListFieldURL::set_DefaultText(BSTR pbstrDefaultText/*[in]*/)
{
  GetDefaultInterface()->set_DefaultText(pbstrDefaultText/*[in]*/);
}

VARIANT __fastcall TListFieldURL::get_DefaultValue(void)
{
  VARIANT pvDefaultValue;
  OLECHECK(GetDefaultInterface()->get_DefaultValue((VARIANT*)&pvDefaultValue));
  return pvDefaultValue;
}

void __fastcall TListFieldURL::set_DefaultValue(VARIANT* pvDefaultValue/*[in]*/)
{
  GetDefaultInterface()->set_DefaultValue(pvDefaultValue/*[in]*/);
}

VARIANT_BOOL __fastcall TListFieldURL::get_Required(void)
{
  VARIANT_BOOL pRequired;
  OLECHECK(GetDefaultInterface()->get_Required((VARIANT_BOOL*)&pRequired));
  return pRequired;
}

void __fastcall TListFieldURL::set_Required(VARIANT_BOOL pRequired/*[in]*/)
{
  GetDefaultInterface()->set_Required(pRequired/*[in]*/);
}

_ListFieldCounterPtr& TListFieldCounter::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldCounter::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldCounter::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldCounter::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldCounter::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldCounter::ConnectTo(_ListFieldCounterPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldCounter::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldCounter;
  sd.IntfIID = __uuidof(_ListFieldCounter);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

_ListFieldIntegerPtr& TListFieldInteger::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldInteger::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldInteger::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldInteger::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldInteger::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldInteger::ConnectTo(_ListFieldIntegerPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldInteger::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldInteger;
  sd.IntfIID = __uuidof(_ListFieldInteger);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

_ListFieldComputedPtr& TListFieldComputed::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldComputed::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldComputed::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldComputed::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldComputed::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldComputed::ConnectTo(_ListFieldComputedPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldComputed::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldComputed;
  sd.IntfIID = __uuidof(_ListFieldComputed);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

_ListFieldFilePtr& TListFieldFile::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TListFieldFile::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TListFieldFile::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TListFieldFile::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TListFieldFile::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TListFieldFile::ConnectTo(_ListFieldFilePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TListFieldFile::InitServerData()
{
  static Oleserver::TServerData sd;
  sd.ClassID = CLSID_ListFieldFile;
  sd.IntfIID = __uuidof(_ListFieldFile);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}


};     // namespace Frontpage_xp


// *********************************************************************//
// The Register function is invoked by the IDE when this module is 
// installed in a Package. It provides the list of Components (including
// OCXes) implemented by this module. The following implementation
// informs the IDE of the OCX proxy classes implemented here.
// *********************************************************************//
namespace Frontpage_xp_srvr
{

void __fastcall PACKAGE Register()
{
  // [24]
  TComponentClass cls_svr[] = {
                              __classid(Frontpage_xp::TApp), 
                              __classid(Frontpage_xp::TPageWindowEx), 
                              __classid(Frontpage_xp::TWebEx), 
                              __classid(Frontpage_xp::TWebWindowEx), 
                              __classid(Frontpage_xp::TLists), 
                              __classid(Frontpage_xp::TList), 
                              __classid(Frontpage_xp::TBasicList), 
                              __classid(Frontpage_xp::TSurvey), 
                              __classid(Frontpage_xp::TDocumentLibrary), 
                              __classid(Frontpage_xp::TListFields), 
                              __classid(Frontpage_xp::TListField), 
                              __classid(Frontpage_xp::TListFieldSingleLine), 
                              __classid(Frontpage_xp::TListFieldMultiLine), 
                              __classid(Frontpage_xp::TListFieldNumber), 
                              __classid(Frontpage_xp::TListFieldCurrency), 
                              __classid(Frontpage_xp::TListFieldDateTime), 
                              __classid(Frontpage_xp::TListFieldChoice), 
                              __classid(Frontpage_xp::TListFieldLookup), 
                              __classid(Frontpage_xp::TListFieldTrueFalse), 
                              __classid(Frontpage_xp::TListFieldURL), 
                              __classid(Frontpage_xp::TListFieldCounter), 
                              __classid(Frontpage_xp::TListFieldInteger), 
                              __classid(Frontpage_xp::TListFieldComputed), 
                              __classid(Frontpage_xp::TListFieldFile)
                           };
  RegisterComponents("OfficeXP", cls_svr,
                     sizeof(cls_svr)/sizeof(cls_svr[0])-1);
}

};     // namespace Frontpage_xp_srvr
