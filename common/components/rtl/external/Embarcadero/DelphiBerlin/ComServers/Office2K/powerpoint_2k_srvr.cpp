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
// File generated on 30/04/2012 12:01:54 from Type Library described below.

// ************************************************************************  //
// Type Lib: 2000\MSPPT9.olb (1)
// LIBID: {91493440-5A91-11CF-8700-00AA0060263B}
// LCID: 0
// Helpfile: c:\OLB\2000\VBAPPT9.CHM 
// HelpString: Microsoft PowerPoint 9.0 Object Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.1 Office, (c:\tests\tlibimp\mso9.dll)
//   (3) v5.3 VBIDE, (c:\tests\OLB\2000\vbe6ext.olb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'Application' renamed to 'PowerPointApplication'
//   Hint: Symbol 'Global' renamed to 'PowerPointGlobal'
//   Hint: Symbol 'Presentation' renamed to 'PowerPointPresentation'
//   Hint: Symbol 'Slide' renamed to 'PowerPointSlide'
//   Hint: Symbol 'Windows' renamed to 'Windoz'
//   Hint: Symbol 'RGB' renamed to 'rgb'
//   Hint: Symbol 'Update' renamed to '_Update'
//   Hint: Symbol 'Click' renamed to '_Click'
//   Error creating palette bitmap of (TPowerPointApplication) : No Server registered for this CoClass
//   Error creating palette bitmap of (TPowerPointPresentation) : No Server registered for this CoClass
//   Error creating palette bitmap of (TPowerPointSlide) : No Server registered for this CoClass
//   Error creating palette bitmap of (TMaster) : No Server registered for this CoClass
// Cmdline:
//   tlibimp  -C+ -Fe_2K -CE_2K_SRVR -Ha- -Hr+ -HpsOffice2K -Yp+ -D.\cpp2k -Cv-   -HpcPresentation -HpcSlide -HpcMaster 2000\MSPPT9.olb
// ************************************************************************ //

#include <vcl.h>
#pragma hdrstop

#include <oleserver.hpp>
#if defined(USING_ATL)
#include <atl\atlvcl.h>
#endif

#pragma option -w-8122
#include "PowerPoint_2K_SRVR.h"

#if !defined(__PRAGMA_PACKAGE_SMART_INIT)
#define      __PRAGMA_PACKAGE_SMART_INIT
#pragma package(smart_init)
#endif

namespace Powerpoint_2k
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
        (OnWindowSelectionChange)(this, (Powerpoint_2k::SelectionPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2002: {
      if (OnWindowBeforeRightClick) {
        (OnWindowBeforeRightClick)(this, (Powerpoint_2k::SelectionPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 2003: {
      if (OnWindowBeforeDoubleClick) {
        (OnWindowBeforeDoubleClick)(this, (Powerpoint_2k::SelectionPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 2004: {
      if (OnPresentationClose) {
        (OnPresentationClose)(this, (Powerpoint_2k::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2005: {
      if (OnPresentationSave) {
        (OnPresentationSave)(this, (Powerpoint_2k::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2006: {
      if (OnPresentationOpen) {
        (OnPresentationOpen)(this, (Powerpoint_2k::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2007: {
      if (OnNewPresentation) {
        (OnNewPresentation)(this, (Powerpoint_2k::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2008: {
      if (OnPresentationNewSlide) {
        (OnPresentationNewSlide)(this, (Powerpoint_2k::PowerPointSlidePtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2009: {
      if (OnWindowActivate) {
        (OnWindowActivate)(this, (Powerpoint_2k::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal), (Powerpoint_2k::DocumentWindowPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 2010: {
      if (OnWindowDeactivate) {
        (OnWindowDeactivate)(this, (Powerpoint_2k::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal), (Powerpoint_2k::DocumentWindowPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 2011: {
      if (OnSlideShowBegin) {
        (OnSlideShowBegin)(this, (Powerpoint_2k::SlideShowWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2012: {
      if (OnSlideShowNextBuild) {
        (OnSlideShowNextBuild)(this, (Powerpoint_2k::SlideShowWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2013: {
      if (OnSlideShowNextSlide) {
        (OnSlideShowNextSlide)(this, (Powerpoint_2k::SlideShowWindowPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2014: {
      if (OnSlideShowEnd) {
        (OnSlideShowEnd)(this, (Powerpoint_2k::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 2015: {
      if (OnPresentationPrint) {
        (OnPresentationPrint)(this, (Powerpoint_2k::PowerPointPresentationPtr)(LPDISPATCH)(params[0].pdispVal));
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

Powerpoint_2k::FileDialog* __fastcall TPowerPointApplication::FileDialog(Powerpoint_2k::PpFileDialogType Type/*[in]*/)
{
  Powerpoint_2k::FileDialog* FileDialog = 0;
  OLECHECK(GetDefaultInterface()->FileDialog(Type, (Powerpoint_2k::FileDialog**)&FileDialog));
  return FileDialog;
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

Powerpoint_2k::PresentationsPtr __fastcall TPowerPointApplication::get_Presentations(void)
{
  Powerpoint_2k::PresentationsPtr Presentations;
  OLECHECK(GetDefaultInterface()->get_Presentations(&Presentations));
  return Presentations;
}

Powerpoint_2k::DocumentWindowsPtr __fastcall TPowerPointApplication::get_Windoz(void)
{
  Powerpoint_2k::DocumentWindowsPtr Windoz;
  OLECHECK(GetDefaultInterface()->get_Windoz(&Windoz));
  return Windoz;
}

Powerpoint_2k::PPDialogsPtr __fastcall TPowerPointApplication::get_Dialogs(void)
{
  Powerpoint_2k::PPDialogsPtr Dialogs;
  OLECHECK(GetDefaultInterface()->get_Dialogs(&Dialogs));
  return Dialogs;
}

Powerpoint_2k::DocumentWindowPtr __fastcall TPowerPointApplication::get_ActiveWindow(void)
{
  Powerpoint_2k::DocumentWindowPtr ActiveWindow;
  OLECHECK(GetDefaultInterface()->get_ActiveWindow(&ActiveWindow));
  return ActiveWindow;
}

Powerpoint_2k::PowerPointPresentationPtr __fastcall TPowerPointApplication::get_ActivePresentation(void)
{
  Powerpoint_2k::PowerPointPresentationPtr ActivePresentation;
  OLECHECK(GetDefaultInterface()->get_ActivePresentation(&ActivePresentation));
  return ActivePresentation;
}

Powerpoint_2k::SlideShowWindowsPtr __fastcall TPowerPointApplication::get_SlideShowWindows(void)
{
  Powerpoint_2k::SlideShowWindowsPtr SlideShowWindows;
  OLECHECK(GetDefaultInterface()->get_SlideShowWindows(&SlideShowWindows));
  return SlideShowWindows;
}

Office_2k::CommandBarsPtr __fastcall TPowerPointApplication::get_CommandBars(void)
{
  Office_2k::CommandBarsPtr CommandBars;
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

Office_2k::AssistantPtr __fastcall TPowerPointApplication::get_Assistant(void)
{
  Office_2k::AssistantPtr Assistant;
  OLECHECK(GetDefaultInterface()->get_Assistant(&Assistant));
  return Assistant;
}

Office_2k::FileSearchPtr __fastcall TPowerPointApplication::get_FileSearch(void)
{
  Office_2k::FileSearchPtr FileSearch;
  OLECHECK(GetDefaultInterface()->get_FileSearch(&FileSearch));
  return FileSearch;
}

Office_2k::IFindPtr __fastcall TPowerPointApplication::get_FileFind(void)
{
  Office_2k::IFindPtr FileFind;
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

Powerpoint_2k::AddInsPtr __fastcall TPowerPointApplication::get_AddIns(void)
{
  Powerpoint_2k::AddInsPtr AddIns;
  OLECHECK(GetDefaultInterface()->get_AddIns(&AddIns));
  return AddIns;
}

Vbide_2k::VBEPtr __fastcall TPowerPointApplication::get_VBE(void)
{
  Vbide_2k::VBEPtr VBE;
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

Powerpoint_2k::PpWindowState __fastcall TPowerPointApplication::get_WindowState(void)
{
  Powerpoint_2k::PpWindowState WindowState;
  OLECHECK(GetDefaultInterface()->get_WindowState((Powerpoint_2k::PpWindowState*)&WindowState));
  return WindowState;
}

void __fastcall TPowerPointApplication::set_WindowState(Powerpoint_2k::PpWindowState WindowState/*[in]*/)
{
  GetDefaultInterface()->set_WindowState(WindowState/*[in]*/);
}

Office_2k::MsoTriState __fastcall TPowerPointApplication::get_Visible(void)
{
  Office_2k::MsoTriState Visible;
  OLECHECK(GetDefaultInterface()->get_Visible((Office_2k::MsoTriState*)&Visible));
  return Visible;
}

void __fastcall TPowerPointApplication::set_Visible(Office_2k::MsoTriState Visible/*[in]*/)
{
  GetDefaultInterface()->set_Visible(Visible/*[in]*/);
}

Office_2k::MsoTriState __fastcall TPowerPointApplication::get_Active(void)
{
  Office_2k::MsoTriState Active;
  OLECHECK(GetDefaultInterface()->get_Active((Office_2k::MsoTriState*)&Active));
  return Active;
}

Office_2k::AnswerWizardPtr __fastcall TPowerPointApplication::get_AnswerWizard(void)
{
  Office_2k::AnswerWizardPtr AnswerWizard;
  OLECHECK(GetDefaultInterface()->get_AnswerWizard(&AnswerWizard));
  return AnswerWizard;
}

Office_2k::COMAddInsPtr __fastcall TPowerPointApplication::get_COMAddIns(void)
{
  Office_2k::COMAddInsPtr COMAddIns;
  OLECHECK(GetDefaultInterface()->get_COMAddIns(&COMAddIns));
  return COMAddIns;
}

BSTR __fastcall TPowerPointApplication::get_ProductCode(void)
{
  BSTR ProductCode = 0;
  OLECHECK(GetDefaultInterface()->get_ProductCode((BSTR*)&ProductCode));
  return ProductCode;
}

Powerpoint_2k::DefaultWebOptionsPtr __fastcall TPowerPointApplication::get_DefaultWebOptions(void)
{
  Powerpoint_2k::DefaultWebOptionsPtr DefaultWebOptions;
  OLECHECK(GetDefaultInterface()->get_DefaultWebOptions(&DefaultWebOptions));
  return DefaultWebOptions;
}

Office_2k::LanguageSettingsPtr __fastcall TPowerPointApplication::get_LanguageSettings(void)
{
  Office_2k::LanguageSettingsPtr LanguageSettings;
  OLECHECK(GetDefaultInterface()->get_LanguageSettings(&LanguageSettings));
  return LanguageSettings;
}

Office_2k::MsoDebugOptionsPtr __fastcall TPowerPointApplication::get_MsoDebugOptions(void)
{
  Office_2k::MsoDebugOptionsPtr MsoDebugOptions;
  OLECHECK(GetDefaultInterface()->get_MsoDebugOptions(&MsoDebugOptions));
  return MsoDebugOptions;
}

Office_2k::MsoTriState __fastcall TPowerPointApplication::get_ShowWindowsInTaskbar(void)
{
  Office_2k::MsoTriState ShowWindowsInTaskbar;
  OLECHECK(GetDefaultInterface()->get_ShowWindowsInTaskbar((Office_2k::MsoTriState*)&ShowWindowsInTaskbar));
  return ShowWindowsInTaskbar;
}

void __fastcall TPowerPointApplication::set_ShowWindowsInTaskbar(Office_2k::MsoTriState ShowWindowsInTaskbar/*[in]*/)
{
  GetDefaultInterface()->set_ShowWindowsInTaskbar(ShowWindowsInTaskbar/*[in]*/);
}

Powerpoint_2k::MarkerPtr __fastcall TPowerPointApplication::get_Marker(void)
{
  Powerpoint_2k::MarkerPtr Marker;
  OLECHECK(GetDefaultInterface()->get_Marker(&Marker));
  return Marker;
}

Office_2k::MsoFeatureInstall __fastcall TPowerPointApplication::get_FeatureInstall(void)
{
  Office_2k::MsoFeatureInstall FeatureInstall;
  OLECHECK(GetDefaultInterface()->get_FeatureInstall((Office_2k::MsoFeatureInstall*)&FeatureInstall));
  return FeatureInstall;
}

void __fastcall TPowerPointApplication::set_FeatureInstall(Office_2k::MsoFeatureInstall FeatureInstall/*[in]*/)
{
  GetDefaultInterface()->set_FeatureInstall(FeatureInstall/*[in]*/);
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

Powerpoint_2k::_Master* __fastcall TPowerPointPresentation::AddTitleMaster(void)
{
  Powerpoint_2k::_Master* TitleMaster = 0;
  OLECHECK(GetDefaultInterface()->AddTitleMaster((Powerpoint_2k::_Master**)&TitleMaster));
  return TitleMaster;
}

void __fastcall TPowerPointPresentation::ApplyTemplate(BSTR FileName/*[in]*/)
{
  GetDefaultInterface()->ApplyTemplate(FileName/*[in]*/);
}

Powerpoint_2k::DocumentWindow* __fastcall TPowerPointPresentation::NewWindow(void)
{
  Powerpoint_2k::DocumentWindow* NewWindow = 0;
  OLECHECK(GetDefaultInterface()->NewWindow((Powerpoint_2k::DocumentWindow**)&NewWindow));
  return NewWindow;
}

void __fastcall TPowerPointPresentation::FollowHyperlink(BSTR Address/*[in]*/, 
                                                         BSTR SubAddress/*[in,def,opt]*/, 
                                                         VARIANT_BOOL NewWindow/*[in,def,opt]*/, 
                                                         VARIANT_BOOL AddHistory/*[in,def,opt]*/, 
                                                         BSTR ExtraInfo/*[in,def,opt]*/, 
                                                         Office_2k::MsoExtraInfoMethod Method/*[in,def,opt]*/, 
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
                                                  Office_2k::MsoTriState Collate/*[in,def,opt]*/)
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
                                                Powerpoint_2k::PpSaveAsFileType FileFormat/*[in,def,opt]*/, 
                                                Office_2k::MsoTriState EmbedTrueTypeFonts/*[in,def,opt]*/)
{
  GetDefaultInterface()->SaveAs(FileName/*[in]*/, FileFormat/*[in,def,opt]*/, 
                                EmbedTrueTypeFonts/*[in,def,opt]*/);
}

void __fastcall TPowerPointPresentation::SaveCopyAs(BSTR FileName/*[in]*/, 
                                                    Powerpoint_2k::PpSaveAsFileType FileFormat/*[in,def,opt]*/, 
                                                    Office_2k::MsoTriState EmbedTrueTypeFonts/*[in,def,opt]*/)
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

void __fastcall TPowerPointPresentation::ReloadAs(Office_2k::MsoEncoding cp/*[in]*/)
{
  GetDefaultInterface()->ReloadAs(cp/*[in]*/);
}

void __fastcall TPowerPointPresentation::MakeIntoTemplate(Office_2k::MsoTriState IsDesignTemplate/*[in]*/)
{
  GetDefaultInterface()->MakeIntoTemplate(IsDesignTemplate/*[in]*/);
}

void __fastcall TPowerPointPresentation::sblt(BSTR s/*[in]*/)
{
  GetDefaultInterface()->sblt(s/*[in]*/);
}

Powerpoint_2k::PowerPointApplicationPtr __fastcall TPowerPointPresentation::get_Application(void)
{
  Powerpoint_2k::PowerPointApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

LPDISPATCH __fastcall TPowerPointPresentation::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Powerpoint_2k::_MasterPtr __fastcall TPowerPointPresentation::get_SlideMaster(void)
{
  Powerpoint_2k::_MasterPtr SlideMaster;
  OLECHECK(GetDefaultInterface()->get_SlideMaster(&SlideMaster));
  return SlideMaster;
}

Powerpoint_2k::_MasterPtr __fastcall TPowerPointPresentation::get_TitleMaster(void)
{
  Powerpoint_2k::_MasterPtr TitleMaster;
  OLECHECK(GetDefaultInterface()->get_TitleMaster(&TitleMaster));
  return TitleMaster;
}

Office_2k::MsoTriState __fastcall TPowerPointPresentation::get_HasTitleMaster(void)
{
  Office_2k::MsoTriState HasTitleMaster;
  OLECHECK(GetDefaultInterface()->get_HasTitleMaster((Office_2k::MsoTriState*)&HasTitleMaster));
  return HasTitleMaster;
}

BSTR __fastcall TPowerPointPresentation::get_TemplateName(void)
{
  BSTR TemplateName = 0;
  OLECHECK(GetDefaultInterface()->get_TemplateName((BSTR*)&TemplateName));
  return TemplateName;
}

Powerpoint_2k::_MasterPtr __fastcall TPowerPointPresentation::get_NotesMaster(void)
{
  Powerpoint_2k::_MasterPtr NotesMaster;
  OLECHECK(GetDefaultInterface()->get_NotesMaster(&NotesMaster));
  return NotesMaster;
}

Powerpoint_2k::_MasterPtr __fastcall TPowerPointPresentation::get_HandoutMaster(void)
{
  Powerpoint_2k::_MasterPtr HandoutMaster;
  OLECHECK(GetDefaultInterface()->get_HandoutMaster(&HandoutMaster));
  return HandoutMaster;
}

Powerpoint_2k::SlidesPtr __fastcall TPowerPointPresentation::get_Slides(void)
{
  Powerpoint_2k::SlidesPtr Slides;
  OLECHECK(GetDefaultInterface()->get_Slides(&Slides));
  return Slides;
}

Powerpoint_2k::PageSetupPtr __fastcall TPowerPointPresentation::get_PageSetup(void)
{
  Powerpoint_2k::PageSetupPtr PageSetup;
  OLECHECK(GetDefaultInterface()->get_PageSetup(&PageSetup));
  return PageSetup;
}

Powerpoint_2k::ColorSchemesPtr __fastcall TPowerPointPresentation::get_ColorSchemes(void)
{
  Powerpoint_2k::ColorSchemesPtr ColorSchemes;
  OLECHECK(GetDefaultInterface()->get_ColorSchemes(&ColorSchemes));
  return ColorSchemes;
}

Powerpoint_2k::ExtraColorsPtr __fastcall TPowerPointPresentation::get_ExtraColors(void)
{
  Powerpoint_2k::ExtraColorsPtr ExtraColors;
  OLECHECK(GetDefaultInterface()->get_ExtraColors(&ExtraColors));
  return ExtraColors;
}

Powerpoint_2k::SlideShowSettingsPtr __fastcall TPowerPointPresentation::get_SlideShowSettings(void)
{
  Powerpoint_2k::SlideShowSettingsPtr SlideShowSettings;
  OLECHECK(GetDefaultInterface()->get_SlideShowSettings(&SlideShowSettings));
  return SlideShowSettings;
}

Powerpoint_2k::FontsPtr __fastcall TPowerPointPresentation::get_Fonts(void)
{
  Powerpoint_2k::FontsPtr Fonts;
  OLECHECK(GetDefaultInterface()->get_Fonts(&Fonts));
  return Fonts;
}

Powerpoint_2k::DocumentWindowsPtr __fastcall TPowerPointPresentation::get_Windoz(void)
{
  Powerpoint_2k::DocumentWindowsPtr Windoz;
  OLECHECK(GetDefaultInterface()->get_Windoz(&Windoz));
  return Windoz;
}

Powerpoint_2k::TagsPtr __fastcall TPowerPointPresentation::get_Tags(void)
{
  Powerpoint_2k::TagsPtr Tags;
  OLECHECK(GetDefaultInterface()->get_Tags(&Tags));
  return Tags;
}

Powerpoint_2k::ShapePtr __fastcall TPowerPointPresentation::get_DefaultShape(void)
{
  Powerpoint_2k::ShapePtr DefaultShape;
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

Vbide_2k::VBProjectPtr __fastcall TPowerPointPresentation::get_VBProject(void)
{
  Vbide_2k::VBProjectPtr VBProject;
  OLECHECK(GetDefaultInterface()->get_VBProject(&VBProject));
  return VBProject;
}

Office_2k::MsoTriState __fastcall TPowerPointPresentation::get_ReadOnly(void)
{
  Office_2k::MsoTriState ReadOnly;
  OLECHECK(GetDefaultInterface()->get_ReadOnly((Office_2k::MsoTriState*)&ReadOnly));
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

Office_2k::MsoTriState __fastcall TPowerPointPresentation::get_Saved(void)
{
  Office_2k::MsoTriState Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((Office_2k::MsoTriState*)&Saved));
  return Saved;
}

void __fastcall TPowerPointPresentation::set_Saved(Office_2k::MsoTriState Saved/*[in]*/)
{
  GetDefaultInterface()->set_Saved(Saved/*[in]*/);
}

Powerpoint_2k::PpDirection __fastcall TPowerPointPresentation::get_LayoutDirection(void)
{
  Powerpoint_2k::PpDirection LayoutDirection;
  OLECHECK(GetDefaultInterface()->get_LayoutDirection((Powerpoint_2k::PpDirection*)&LayoutDirection));
  return LayoutDirection;
}

void __fastcall TPowerPointPresentation::set_LayoutDirection(Powerpoint_2k::PpDirection LayoutDirection/*[in]*/)
{
  GetDefaultInterface()->set_LayoutDirection(LayoutDirection/*[in]*/);
}

Powerpoint_2k::PrintOptionsPtr __fastcall TPowerPointPresentation::get_PrintOptions(void)
{
  Powerpoint_2k::PrintOptionsPtr PrintOptions;
  OLECHECK(GetDefaultInterface()->get_PrintOptions(&PrintOptions));
  return PrintOptions;
}

LPDISPATCH __fastcall TPowerPointPresentation::get_Container(void)
{
  LPDISPATCH Container;
  OLECHECK(GetDefaultInterface()->get_Container((LPDISPATCH*)&Container));
  return Container;
}

Office_2k::MsoTriState __fastcall TPowerPointPresentation::get_DisplayComments(void)
{
  Office_2k::MsoTriState DisplayComments;
  OLECHECK(GetDefaultInterface()->get_DisplayComments((Office_2k::MsoTriState*)&DisplayComments));
  return DisplayComments;
}

void __fastcall TPowerPointPresentation::set_DisplayComments(Office_2k::MsoTriState DisplayComments/*[in]*/)
{
  GetDefaultInterface()->set_DisplayComments(DisplayComments/*[in]*/);
}

Powerpoint_2k::PpFarEastLineBreakLevel __fastcall TPowerPointPresentation::get_FarEastLineBreakLevel(void)
{
  Powerpoint_2k::PpFarEastLineBreakLevel FarEastLineBreakLevel;
  OLECHECK(GetDefaultInterface()->get_FarEastLineBreakLevel((Powerpoint_2k::PpFarEastLineBreakLevel*)&FarEastLineBreakLevel));
  return FarEastLineBreakLevel;
}

void __fastcall TPowerPointPresentation::set_FarEastLineBreakLevel(Powerpoint_2k::PpFarEastLineBreakLevel FarEastLineBreakLevel/*[in]*/)
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

Powerpoint_2k::SlideShowWindowPtr __fastcall TPowerPointPresentation::get_SlideShowWindow(void)
{
  Powerpoint_2k::SlideShowWindowPtr SlideShowWindow;
  OLECHECK(GetDefaultInterface()->get_SlideShowWindow(&SlideShowWindow));
  return SlideShowWindow;
}

Office_2k::MsoFarEastLineBreakLanguageID __fastcall TPowerPointPresentation::get_FarEastLineBreakLanguage(void)
{
  Office_2k::MsoFarEastLineBreakLanguageID FarEastLineBreakLanguage;
  OLECHECK(GetDefaultInterface()->get_FarEastLineBreakLanguage((Office_2k::MsoFarEastLineBreakLanguageID*)&FarEastLineBreakLanguage));
  return FarEastLineBreakLanguage;
}

void __fastcall TPowerPointPresentation::set_FarEastLineBreakLanguage(Office_2k::MsoFarEastLineBreakLanguageID FarEastLineBreakLanguage/*[in]*/)
{
  GetDefaultInterface()->set_FarEastLineBreakLanguage(FarEastLineBreakLanguage/*[in]*/);
}

Office_2k::MsoLanguageID __fastcall TPowerPointPresentation::get_DefaultLanguageID(void)
{
  Office_2k::MsoLanguageID DefaultLanguageID;
  OLECHECK(GetDefaultInterface()->get_DefaultLanguageID((Office_2k::MsoLanguageID*)&DefaultLanguageID));
  return DefaultLanguageID;
}

void __fastcall TPowerPointPresentation::set_DefaultLanguageID(Office_2k::MsoLanguageID DefaultLanguageID/*[in]*/)
{
  GetDefaultInterface()->set_DefaultLanguageID(DefaultLanguageID/*[in]*/);
}

Office_2k::CommandBarsPtr __fastcall TPowerPointPresentation::get_CommandBars(void)
{
  Office_2k::CommandBarsPtr CommandBars;
  OLECHECK(GetDefaultInterface()->get_CommandBars(&CommandBars));
  return CommandBars;
}

Powerpoint_2k::PublishObjectsPtr __fastcall TPowerPointPresentation::get_PublishObjects(void)
{
  Powerpoint_2k::PublishObjectsPtr PublishObjects;
  OLECHECK(GetDefaultInterface()->get_PublishObjects(&PublishObjects));
  return PublishObjects;
}

Powerpoint_2k::WebOptionsPtr __fastcall TPowerPointPresentation::get_WebOptions(void)
{
  Powerpoint_2k::WebOptionsPtr WebOptions;
  OLECHECK(GetDefaultInterface()->get_WebOptions(&WebOptions));
  return WebOptions;
}

Office_2k::HTMLProjectPtr __fastcall TPowerPointPresentation::get_HTMLProject(void)
{
  Office_2k::HTMLProjectPtr HTMLProject;
  OLECHECK(GetDefaultInterface()->get_HTMLProject(&HTMLProject));
  return HTMLProject;
}

Office_2k::MsoTriState __fastcall TPowerPointPresentation::get_EnvelopeVisible(void)
{
  Office_2k::MsoTriState EnvelopeVisible;
  OLECHECK(GetDefaultInterface()->get_EnvelopeVisible((Office_2k::MsoTriState*)&EnvelopeVisible));
  return EnvelopeVisible;
}

void __fastcall TPowerPointPresentation::set_EnvelopeVisible(Office_2k::MsoTriState EnvelopeVisible/*[in]*/)
{
  GetDefaultInterface()->set_EnvelopeVisible(EnvelopeVisible/*[in]*/);
}

Office_2k::MsoTriState __fastcall TPowerPointPresentation::get_VBASigned(void)
{
  Office_2k::MsoTriState VBASigned;
  OLECHECK(GetDefaultInterface()->get_VBASigned((Office_2k::MsoTriState*)&VBASigned));
  return VBASigned;
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

Powerpoint_2k::SlideRange* __fastcall TPowerPointSlide::Duplicate(void)
{
  Powerpoint_2k::SlideRange* Duplicate = 0;
  OLECHECK(GetDefaultInterface()->Duplicate((Powerpoint_2k::SlideRange**)&Duplicate));
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

Powerpoint_2k::PowerPointApplicationPtr __fastcall TPowerPointSlide::get_Application(void)
{
  Powerpoint_2k::PowerPointApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

LPDISPATCH __fastcall TPowerPointSlide::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Powerpoint_2k::ShapesPtr __fastcall TPowerPointSlide::get_Shapes(void)
{
  Powerpoint_2k::ShapesPtr Shapes;
  OLECHECK(GetDefaultInterface()->get_Shapes(&Shapes));
  return Shapes;
}

Powerpoint_2k::HeadersFootersPtr __fastcall TPowerPointSlide::get_HeadersFooters(void)
{
  Powerpoint_2k::HeadersFootersPtr HeadersFooters;
  OLECHECK(GetDefaultInterface()->get_HeadersFooters(&HeadersFooters));
  return HeadersFooters;
}

Powerpoint_2k::SlideShowTransitionPtr __fastcall TPowerPointSlide::get_SlideShowTransition(void)
{
  Powerpoint_2k::SlideShowTransitionPtr SlideShowTransition;
  OLECHECK(GetDefaultInterface()->get_SlideShowTransition(&SlideShowTransition));
  return SlideShowTransition;
}

Powerpoint_2k::ColorSchemePtr __fastcall TPowerPointSlide::get_ColorScheme(void)
{
  Powerpoint_2k::ColorSchemePtr ColorScheme;
  OLECHECK(GetDefaultInterface()->get_ColorScheme(&ColorScheme));
  return ColorScheme;
}

void __fastcall TPowerPointSlide::set_ColorScheme(Powerpoint_2k::ColorSchemePtr ColorScheme/*[in]*/)
{
  GetDefaultInterface()->set_ColorScheme(ColorScheme/*[in]*/);
}

Powerpoint_2k::ShapeRangePtr __fastcall TPowerPointSlide::get_Background(void)
{
  Powerpoint_2k::ShapeRangePtr Background;
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

Powerpoint_2k::PpSlideLayout __fastcall TPowerPointSlide::get_Layout(void)
{
  Powerpoint_2k::PpSlideLayout Layout;
  OLECHECK(GetDefaultInterface()->get_Layout((Powerpoint_2k::PpSlideLayout*)&Layout));
  return Layout;
}

void __fastcall TPowerPointSlide::set_Layout(Powerpoint_2k::PpSlideLayout Layout/*[in]*/)
{
  GetDefaultInterface()->set_Layout(Layout/*[in]*/);
}

Powerpoint_2k::TagsPtr __fastcall TPowerPointSlide::get_Tags(void)
{
  Powerpoint_2k::TagsPtr Tags;
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

Office_2k::MsoTriState __fastcall TPowerPointSlide::get_DisplayMasterShapes(void)
{
  Office_2k::MsoTriState DisplayMasterShapes;
  OLECHECK(GetDefaultInterface()->get_DisplayMasterShapes((Office_2k::MsoTriState*)&DisplayMasterShapes));
  return DisplayMasterShapes;
}

void __fastcall TPowerPointSlide::set_DisplayMasterShapes(Office_2k::MsoTriState DisplayMasterShapes/*[in]*/)
{
  GetDefaultInterface()->set_DisplayMasterShapes(DisplayMasterShapes/*[in]*/);
}

Office_2k::MsoTriState __fastcall TPowerPointSlide::get_FollowMasterBackground(void)
{
  Office_2k::MsoTriState FollowMasterBackground;
  OLECHECK(GetDefaultInterface()->get_FollowMasterBackground((Office_2k::MsoTriState*)&FollowMasterBackground));
  return FollowMasterBackground;
}

void __fastcall TPowerPointSlide::set_FollowMasterBackground(Office_2k::MsoTriState FollowMasterBackground/*[in]*/)
{
  GetDefaultInterface()->set_FollowMasterBackground(FollowMasterBackground/*[in]*/);
}

Powerpoint_2k::SlideRangePtr __fastcall TPowerPointSlide::get_NotesPage(void)
{
  Powerpoint_2k::SlideRangePtr NotesPage;
  OLECHECK(GetDefaultInterface()->get_NotesPage(&NotesPage));
  return NotesPage;
}

Powerpoint_2k::_MasterPtr __fastcall TPowerPointSlide::get_Master(void)
{
  Powerpoint_2k::_MasterPtr Master;
  OLECHECK(GetDefaultInterface()->get_Master(&Master));
  return Master;
}

Powerpoint_2k::HyperlinksPtr __fastcall TPowerPointSlide::get_Hyperlinks(void)
{
  Powerpoint_2k::HyperlinksPtr Hyperlinks;
  OLECHECK(GetDefaultInterface()->get_Hyperlinks(&Hyperlinks));
  return Hyperlinks;
}

Office_2k::ScriptsPtr __fastcall TPowerPointSlide::get_Scripts(void)
{
  Office_2k::ScriptsPtr Scripts;
  OLECHECK(GetDefaultInterface()->get_Scripts(&Scripts));
  return Scripts;
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

Powerpoint_2k::PowerPointApplicationPtr __fastcall TMaster::get_Application(void)
{
  Powerpoint_2k::PowerPointApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

LPDISPATCH __fastcall TMaster::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Powerpoint_2k::ShapesPtr __fastcall TMaster::get_Shapes(void)
{
  Powerpoint_2k::ShapesPtr Shapes;
  OLECHECK(GetDefaultInterface()->get_Shapes(&Shapes));
  return Shapes;
}

Powerpoint_2k::HeadersFootersPtr __fastcall TMaster::get_HeadersFooters(void)
{
  Powerpoint_2k::HeadersFootersPtr HeadersFooters;
  OLECHECK(GetDefaultInterface()->get_HeadersFooters(&HeadersFooters));
  return HeadersFooters;
}

Powerpoint_2k::ColorSchemePtr __fastcall TMaster::get_ColorScheme(void)
{
  Powerpoint_2k::ColorSchemePtr ColorScheme;
  OLECHECK(GetDefaultInterface()->get_ColorScheme(&ColorScheme));
  return ColorScheme;
}

void __fastcall TMaster::set_ColorScheme(Powerpoint_2k::ColorSchemePtr ColorScheme/*[in]*/)
{
  GetDefaultInterface()->set_ColorScheme(ColorScheme/*[in]*/);
}

Powerpoint_2k::ShapeRangePtr __fastcall TMaster::get_Background(void)
{
  Powerpoint_2k::ShapeRangePtr Background;
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

Powerpoint_2k::TextStylesPtr __fastcall TMaster::get_TextStyles(void)
{
  Powerpoint_2k::TextStylesPtr TextStyles;
  OLECHECK(GetDefaultInterface()->get_TextStyles(&TextStyles));
  return TextStyles;
}

Powerpoint_2k::HyperlinksPtr __fastcall TMaster::get_Hyperlinks(void)
{
  Powerpoint_2k::HyperlinksPtr Hyperlinks;
  OLECHECK(GetDefaultInterface()->get_Hyperlinks(&Hyperlinks));
  return Hyperlinks;
}

Office_2k::ScriptsPtr __fastcall TMaster::get_Scripts(void)
{
  Office_2k::ScriptsPtr Scripts;
  OLECHECK(GetDefaultInterface()->get_Scripts(&Scripts));
  return Scripts;
}


};     // namespace Powerpoint_2k


// *********************************************************************//
// The Register function is invoked by the IDE when this module is 
// installed in a Package. It provides the list of Components (including
// OCXes) implemented by this module. The following implementation
// informs the IDE of the OCX proxy classes implemented here.
// *********************************************************************//
namespace Powerpoint_2k_srvr
{

void __fastcall PACKAGE Register()
{
  // [4]
  System::Classes::TComponentClass cls_svr[] = {
                              __classid(Powerpoint_2k::TPowerPointApplication), 
                              __classid(Powerpoint_2k::TPowerPointPresentation), 
                              __classid(Powerpoint_2k::TPowerPointSlide), 
                              __classid(Powerpoint_2k::TMaster)
                           };
  System::Classes::RegisterComponents("Office2K", cls_svr,
                     sizeof(cls_svr)/sizeof(cls_svr[0])-1);
}

};     // namespace Powerpoint_2k_srvr
