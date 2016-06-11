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
// File generated on 30/04/2012 12:01:47 from Type Library described below.

// ************************************************************************  //
// Type Lib: 2000\MSWORD9.olb (1)
// LIBID: {00020905-0000-0000-C000-000000000046}
// LCID: 0
// Helpfile: c:\OLB\2000\VBAWRD9.CHM 
// HelpString: Microsoft Word 9.0 Object Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.1 Office, (c:\tests\tlibimp\mso9.dll)
//   (3) v5.3 VBIDE, (c:\tests\OLB\2000\vbe6ext.olb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'Window' renamed to 'WINDOW'
//   Hint: Symbol 'Range' renamed to 'WordRange'
//   Hint: Symbol 'System' renamed to 'SYSTEM'
//   Hint: Symbol 'Selection' renamed to 'WordSelection'
//   Hint: Symbol 'Global' renamed to 'WordGlobal'
//   Hint: Symbol 'Application' renamed to 'WordApplication'
//   Hint: Symbol 'Document' renamed to 'WordDocument'
//   Hint: Symbol 'Font' renamed to 'WordFont'
//   Hint: Symbol 'ParagraphFormat' renamed to 'WordParagraphFormat'
//   Hint: Symbol 'OLEControl' renamed to 'WordOLEControl'
//   Hint: Symbol 'LetterContent' renamed to 'WordLetterContent'
//   Hint: Enum Member 'emptyenum' of 'WdCharacterCaseHID' changed to 'emptyenum_'
//   Hint: Enum Member 'emptyenum' of 'WdParagraphAlignmentHID' changed to 'emptyenum__'
//   Hint: Enum Member 'emptyenum' of 'WdListNumberStyleHID' changed to 'emptyenum___'
//   Hint: Enum Member 'emptyenum' of 'WdNoteNumberStyleHID' changed to 'emptyenum____'
//   Hint: Enum Member 'emptyenum' of 'WdCaptionNumberStyleHID' changed to 'emptyenum_____'
//   Hint: Enum Member 'emptyenum' of 'WdPageNumberStyleHID' changed to 'emptyenum______'
//   Hint: Enum Member 'emptyenum' of 'WdStatisticHID' changed to 'emptyenum_______'
//   Hint: Enum Member 'emptyenum' of 'WdTabLeaderHID' changed to 'emptyenum________'
//   Hint: Enum Member 'emptyenum' of 'WdMeasurementUnitsHID' changed to 'emptyenum_________'
//   Hint: Enum Member 'emptyenum' of 'WdSortFieldTypeHID' changed to 'emptyenum__________'
//   Hint: Enum Member 'emptyenum' of 'WdWordDialogTabHID' changed to 'emptyenum___________'
//   Hint: Enum Member 'emptyenum' of 'WdWordDialogHID' changed to 'emptyenum____________'
//   Hint: Enum Member 'emptyenum' of 'WdHelpTypeHID' changed to 'emptyenum_____________'
//   Hint: Enum Member 'emptyenum' of 'WdDictionaryTypeHID' changed to 'emptyenum______________'
//   Hint: Enum Member 'emptyenum' of 'WdTextOrientationHID' changed to 'emptyenum_______________'
//   Hint: Symbol 'Windows' renamed to 'Windoz'
//   Hint: Symbol 'Update' renamed to '_Update'
//   Hint: Symbol 'ExitWindows' renamed to 'ExitWindoz'
//   Hint: Symbol 'RGB' renamed to 'rgb'
//   Error creating palette bitmap of (TWordApplication) : No Server registered for this CoClass
//   Error creating palette bitmap of (TWordDocument) : No Server registered for this CoClass
//   Error creating palette bitmap of (TWordFont) : No Server registered for this CoClass
//   Error creating palette bitmap of (TWordParagraphFormat) : No Server registered for this CoClass
//   Error creating palette bitmap of (TWordLetterContent) : No Server registered for this CoClass
// Cmdline:
//   tlibimp  -C+ -Fe_2K -CE_2K_SRVR -Ha- -Hr+ -HpsOffice2K -Yp+ -D.\cpp2k -Cv-    2000\MSWORD9.olb
// ************************************************************************ //

#include <vcl.h>
#pragma hdrstop

#include <oleserver.hpp>
#if defined(USING_ATL)
#include <atl\atlvcl.h>
#endif

#pragma option -w-8122
#include "Word_2K_SRVR.h"

#if !defined(__PRAGMA_PACKAGE_SMART_INIT)
#define      __PRAGMA_PACKAGE_SMART_INIT
#pragma package(smart_init)
#endif

namespace Word_2k
{

_ApplicationPtr& TWordApplication::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TWordApplication::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TWordApplication::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TWordApplication::Disconnect()
{
  if (m_DefaultIntf) {
    if (FAutoQuit)
      Quit();
    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TWordApplication::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TWordApplication::ConnectTo(_ApplicationPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TWordApplication::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_WordApplication;
  sd.IntfIID = __uuidof(_Application);
  sd.EventIID= __uuidof(ApplicationEvents2);
  ServerData = &sd;
}

void __fastcall TWordApplication::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1: {
      if (OnStartup) {
        (OnStartup)(this);
      }
      break;
      }
    case 2: {
      if (OnQuit) {
        (OnQuit)(this);
      }
      break;
      }
    case 3: {
      if (OnDocumentChange) {
        (OnDocumentChange)(this);
      }
      break;
      }
    case 4: {
      if (OnDocumentOpen) {
        (OnDocumentOpen)(this, (Word_2k::WordDocumentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 6: {
      if (OnDocumentBeforeClose) {
        (OnDocumentBeforeClose)(this, (Word_2k::WordDocumentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 7: {
      if (OnDocumentBeforePrint) {
        (OnDocumentBeforePrint)(this, (Word_2k::WordDocumentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 8: {
      if (OnDocumentBeforeSave) {
        (OnDocumentBeforeSave)(this, (Word_2k::WordDocumentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal, params[2].pboolVal);
      }
      break;
      }
    case 9: {
      if (OnNewDocument) {
        (OnNewDocument)(this, (Word_2k::WordDocumentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 10: {
      if (OnWindowActivate) {
        (OnWindowActivate)(this, (Word_2k::WordDocumentPtr)(LPDISPATCH)(params[0].pdispVal), (Word_2k::WINDOWPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 11: {
      if (OnWindowDeactivate) {
        (OnWindowDeactivate)(this, (Word_2k::WordDocumentPtr)(LPDISPATCH)(params[0].pdispVal), (Word_2k::WINDOWPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 12: {
      if (OnWindowSelectionChange) {
        (OnWindowSelectionChange)(this, (Word_2k::WordSelectionPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 13: {
      if (OnWindowBeforeRightClick) {
        (OnWindowBeforeRightClick)(this, (Word_2k::WordSelectionPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 14: {
      if (OnWindowBeforeDoubleClick) {
        (OnWindowBeforeDoubleClick)(this, (Word_2k::WordSelectionPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TWordApplication::Quit(VARIANT* SaveChanges/*[in,opt]*/, 
                                       VARIANT* OriginalFormat/*[in,opt]*/, 
                                       VARIANT* RouteDocument/*[in,opt]*/)
{
  GetDefaultInterface()->Quit(SaveChanges/*[in,opt]*/, OriginalFormat/*[in,opt]*/, 
                              RouteDocument/*[in,opt]*/);
}

void __fastcall TWordApplication::ScreenRefresh(void)
{
  GetDefaultInterface()->ScreenRefresh();
}

void __fastcall TWordApplication::PrintOutOld(VARIANT* Background/*[in,opt]*/, 
                                              VARIANT* Append/*[in,opt]*/, 
                                              VARIANT* Range/*[in,opt]*/, 
                                              VARIANT* OutputFileName/*[in,opt]*/, 
                                              VARIANT* From/*[in,opt]*/, VARIANT* To/*[in,opt]*/, 
                                              VARIANT* Item/*[in,opt]*/, VARIANT* Copies/*[in,opt]*/, 
                                              VARIANT* Pages/*[in,opt]*/, 
                                              VARIANT* PageType/*[in,opt]*/, 
                                              VARIANT* PrintToFile/*[in,opt]*/, 
                                              VARIANT* Collate/*[in,opt]*/, 
                                              VARIANT* FileName/*[in,opt]*/, 
                                              VARIANT* ActivePrinterMacGX/*[in,opt]*/, 
                                              VARIANT* ManualDuplexPrint/*[in,opt]*/)
{
  GetDefaultInterface()->PrintOutOld(Background/*[in,opt]*/, Append/*[in,opt]*/, Range/*[in,opt]*/, 
                                     OutputFileName/*[in,opt]*/, From/*[in,opt]*/, To/*[in,opt]*/, 
                                     Item/*[in,opt]*/, Copies/*[in,opt]*/, Pages/*[in,opt]*/, 
                                     PageType/*[in,opt]*/, PrintToFile/*[in,opt]*/, 
                                     Collate/*[in,opt]*/, FileName/*[in,opt]*/, 
                                     ActivePrinterMacGX/*[in,opt]*/, ManualDuplexPrint/*[in,opt]*/);
}

void __fastcall TWordApplication::LookupNameProperties(BSTR Name/*[in]*/)
{
  GetDefaultInterface()->LookupNameProperties(Name/*[in]*/);
}

void __fastcall TWordApplication::SubstituteFont(BSTR UnavailableFont/*[in]*/, 
                                                 BSTR SubstituteFont/*[in]*/)
{
  GetDefaultInterface()->SubstituteFont(UnavailableFont/*[in]*/, SubstituteFont/*[in]*/);
}

VARIANT_BOOL __fastcall TWordApplication::Repeat(VARIANT* Times/*[in,opt]*/)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->Repeat(Times, (VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::DDEExecute(long Channel/*[in]*/, BSTR Command/*[in]*/)
{
  GetDefaultInterface()->DDEExecute(Channel/*[in]*/, Command/*[in]*/);
}

long __fastcall TWordApplication::DDEInitiate(BSTR App/*[in]*/, BSTR Topic/*[in]*/)
{
  long prop;
  OLECHECK(GetDefaultInterface()->DDEInitiate(App, Topic, (long*)&prop));
  return prop;
}

void __fastcall TWordApplication::DDEPoke(long Channel/*[in]*/, BSTR Item/*[in]*/, BSTR Data/*[in]*/)
{
  GetDefaultInterface()->DDEPoke(Channel/*[in]*/, Item/*[in]*/, Data/*[in]*/);
}

BSTR __fastcall TWordApplication::DDERequest(long Channel/*[in]*/, BSTR Item/*[in]*/)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->DDERequest(Channel, Item, (BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::DDETerminate(long Channel/*[in]*/)
{
  GetDefaultInterface()->DDETerminate(Channel/*[in]*/);
}

void __fastcall TWordApplication::DDETerminateAll(void)
{
  GetDefaultInterface()->DDETerminateAll();
}

long __fastcall TWordApplication::BuildKeyCode(Word_2k::WdKey Arg1/*[in]*/, 
                                               VARIANT* Arg2/*[in,opt]*/, VARIANT* Arg3/*[in,opt]*/, 
                                               VARIANT* Arg4/*[in,opt]*/)
{
  long prop;
  OLECHECK(GetDefaultInterface()->BuildKeyCode(Arg1, Arg2, Arg3, Arg4, (long*)&prop));
  return prop;
}

BSTR __fastcall TWordApplication::KeyString(long KeyCode/*[in]*/, VARIANT* KeyCode2/*[in,opt]*/)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->KeyString(KeyCode, KeyCode2, (BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::OrganizerCopy(BSTR Source/*[in]*/, BSTR Destination/*[in]*/, 
                                                BSTR Name/*[in]*/, 
                                                Word_2k::WdOrganizerObject Object/*[in]*/)
{
  GetDefaultInterface()->OrganizerCopy(Source/*[in]*/, Destination/*[in]*/, Name/*[in]*/, 
                                       Object/*[in]*/);
}

void __fastcall TWordApplication::OrganizerDelete(BSTR Source/*[in]*/, BSTR Name/*[in]*/, 
                                                  Word_2k::WdOrganizerObject Object/*[in]*/)
{
  GetDefaultInterface()->OrganizerDelete(Source/*[in]*/, Name/*[in]*/, Object/*[in]*/);
}

void __fastcall TWordApplication::OrganizerRename(BSTR Source/*[in]*/, BSTR Name/*[in]*/, 
                                                  BSTR NewName/*[in]*/, 
                                                  Word_2k::WdOrganizerObject Object/*[in]*/)
{
  GetDefaultInterface()->OrganizerRename(Source/*[in]*/, Name/*[in]*/, NewName/*[in]*/, 
                                         Object/*[in]*/);
}

void __fastcall TWordApplication::AddAddress(LPSAFEARRAY* TagID/*[in]*/, LPSAFEARRAY* Value/*[in]*/)
{
  GetDefaultInterface()->AddAddress(TagID/*[in]*/, Value/*[in]*/);
}

BSTR __fastcall TWordApplication::GetAddress(VARIANT* Name/*[in,opt]*/, 
                                             VARIANT* AddressProperties/*[in,opt]*/, 
                                             VARIANT* UseAutoText/*[in,opt]*/, 
                                             VARIANT* DisplaySelectDialog/*[in,opt]*/, 
                                             VARIANT* SelectDialog/*[in,opt]*/, 
                                             VARIANT* CheckNamesDialog/*[in,opt]*/, 
                                             VARIANT* RecentAddressesChoice/*[in,opt]*/, 
                                             VARIANT* UpdateRecentAddresses/*[in,opt]*/)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->GetAddress(Name, AddressProperties, UseAutoText, 
                                             DisplaySelectDialog, SelectDialog, CheckNamesDialog, 
                                             RecentAddressesChoice, UpdateRecentAddresses, (BSTR*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::CheckGrammar(BSTR String/*[in]*/)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->CheckGrammar(String, (VARIANT_BOOL*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::CheckSpelling(BSTR Word/*[in]*/, 
                                                        VARIANT* CustomDictionary/*[in,opt]*/, 
                                                        VARIANT* IgnoreUppercase/*[in,opt]*/, 
                                                        VARIANT* MainDictionary/*[in,opt]*/, 
                                                        VARIANT* CustomDictionary2/*[in,opt]*/, 
                                                        VARIANT* CustomDictionary3/*[in,opt]*/, 
                                                        VARIANT* CustomDictionary4/*[in,opt]*/, 
                                                        VARIANT* CustomDictionary5/*[in,opt]*/, 
                                                        VARIANT* CustomDictionary6/*[in,opt]*/, 
                                                        VARIANT* CustomDictionary7/*[in,opt]*/, 
                                                        VARIANT* CustomDictionary8/*[in,opt]*/, 
                                                        VARIANT* CustomDictionary9/*[in,opt]*/, 
                                                        VARIANT* CustomDictionary10/*[in,opt]*/)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->CheckSpelling(Word, CustomDictionary, IgnoreUppercase, 
                                                MainDictionary, CustomDictionary2, CustomDictionary3, 
                                                CustomDictionary4, CustomDictionary5, 
                                                CustomDictionary6, CustomDictionary7, 
                                                CustomDictionary8, CustomDictionary9, 
                                                CustomDictionary10, (VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::ResetIgnoreAll(void)
{
  GetDefaultInterface()->ResetIgnoreAll();
}

Word_2k::SpellingSuggestions* __fastcall TWordApplication::GetSpellingSuggestions(BSTR Word/*[in]*/, 
                                                                                  VARIANT* CustomDictionary/*[in,opt]*/, 
                                                                                  VARIANT* IgnoreUppercase/*[in,opt]*/, 
                                                                                  VARIANT* MainDictionary/*[in,opt]*/, 
                                                                                  VARIANT* SuggestionMode/*[in,opt]*/, 
                                                                                  VARIANT* CustomDictionary2/*[in,opt]*/, 
                                                                                  VARIANT* CustomDictionary3/*[in,opt]*/, 
                                                                                  VARIANT* CustomDictionary4/*[in,opt]*/, 
                                                                                  VARIANT* CustomDictionary5/*[in,opt]*/, 
                                                                                  VARIANT* CustomDictionary6/*[in,opt]*/, 
                                                                                  VARIANT* CustomDictionary7/*[in,opt]*/, 
                                                                                  VARIANT* CustomDictionary8/*[in,opt]*/, 
                                                                                  VARIANT* CustomDictionary9/*[in,opt]*/, 
                                                                                  VARIANT* CustomDictionary10/*[in,opt]*/)
{
  Word_2k::SpellingSuggestions* prop = 0;
  OLECHECK(GetDefaultInterface()->GetSpellingSuggestions(Word, CustomDictionary, IgnoreUppercase, 
                                                         MainDictionary, SuggestionMode, 
                                                         CustomDictionary2, CustomDictionary3, 
                                                         CustomDictionary4, CustomDictionary5, 
                                                         CustomDictionary6, CustomDictionary7, 
                                                         CustomDictionary8, CustomDictionary9, 
                                                         CustomDictionary10, (Word_2k::SpellingSuggestions**)&prop));
  return prop;
}

void __fastcall TWordApplication::GoBack(void)
{
  GetDefaultInterface()->GoBack();
}

void __fastcall TWordApplication::Help(VARIANT* HelpType/*[in]*/)
{
  GetDefaultInterface()->Help(HelpType/*[in]*/);
}

void __fastcall TWordApplication::AutomaticChange(void)
{
  GetDefaultInterface()->AutomaticChange();
}

void __fastcall TWordApplication::ShowMe(void)
{
  GetDefaultInterface()->ShowMe();
}

void __fastcall TWordApplication::HelpTool(void)
{
  GetDefaultInterface()->HelpTool();
}

Word_2k::WINDOW* __fastcall TWordApplication::NewWindow(void)
{
  Word_2k::WINDOW* prop = 0;
  OLECHECK(GetDefaultInterface()->NewWindow((Word_2k::WINDOW**)&prop));
  return prop;
}

void __fastcall TWordApplication::ListCommands(VARIANT_BOOL ListAllCommands/*[in]*/)
{
  GetDefaultInterface()->ListCommands(ListAllCommands/*[in]*/);
}

void __fastcall TWordApplication::ShowClipboard(void)
{
  GetDefaultInterface()->ShowClipboard();
}

void __fastcall TWordApplication::OnTime(VARIANT* When/*[in]*/, BSTR Name/*[in]*/, 
                                         VARIANT* Tolerance/*[in,opt]*/)
{
  GetDefaultInterface()->OnTime(When/*[in]*/, Name/*[in]*/, Tolerance/*[in,opt]*/);
}

void __fastcall TWordApplication::NextLetter(void)
{
  GetDefaultInterface()->NextLetter();
}

short __fastcall TWordApplication::MountVolume(BSTR Zone/*[in]*/, BSTR Server/*[in]*/, 
                                               BSTR Volume/*[in]*/, VARIANT* User/*[in,opt]*/, 
                                               VARIANT* UserPassword/*[in,opt]*/, 
                                               VARIANT* VolumePassword/*[in,opt]*/)
{
  short prop;
  OLECHECK(GetDefaultInterface()->MountVolume(Zone, Server, Volume, User, UserPassword, 
                                              VolumePassword, (short*)&prop));
  return prop;
}

BSTR __fastcall TWordApplication::CleanString(BSTR String/*[in]*/)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->CleanString(String, (BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::SendFax(void)
{
  GetDefaultInterface()->SendFax();
}

void __fastcall TWordApplication::ChangeFileOpenDirectory(BSTR Path/*[in]*/)
{
  GetDefaultInterface()->ChangeFileOpenDirectory(Path/*[in]*/);
}

void __fastcall TWordApplication::RunOld(BSTR MacroName/*[in]*/)
{
  GetDefaultInterface()->RunOld(MacroName/*[in]*/);
}

void __fastcall TWordApplication::GoForward(void)
{
  GetDefaultInterface()->GoForward();
}

void __fastcall TWordApplication::Move(long Left/*[in]*/, long Top/*[in]*/)
{
  GetDefaultInterface()->Move(Left/*[in]*/, Top/*[in]*/);
}

void __fastcall TWordApplication::Resize(long Width/*[in]*/, long Height/*[in]*/)
{
  GetDefaultInterface()->Resize(Width/*[in]*/, Height/*[in]*/);
}

float __fastcall TWordApplication::InchesToPoints(float Inches/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->InchesToPoints(Inches, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::CentimetersToPoints(float Centimeters/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->CentimetersToPoints(Centimeters, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::MillimetersToPoints(float Millimeters/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->MillimetersToPoints(Millimeters, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::PicasToPoints(float Picas/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->PicasToPoints(Picas, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::LinesToPoints(float Lines/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->LinesToPoints(Lines, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::PointsToInches(float Points/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->PointsToInches(Points, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::PointsToCentimeters(float Points/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->PointsToCentimeters(Points, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::PointsToMillimeters(float Points/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->PointsToMillimeters(Points, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::PointsToPicas(float Points/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->PointsToPicas(Points, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::PointsToLines(float Points/*[in]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->PointsToLines(Points, (float*)&prop));
  return prop;
}

void __fastcall TWordApplication::Activate(void)
{
  GetDefaultInterface()->Activate();
}

float __fastcall TWordApplication::PointsToPixels(float Points/*[in]*/, 
                                                  VARIANT* fVertical/*[in,opt]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->PointsToPixels(Points, fVertical, (float*)&prop));
  return prop;
}

float __fastcall TWordApplication::PixelsToPoints(float Pixels/*[in]*/, 
                                                  VARIANT* fVertical/*[in,opt]*/)
{
  float prop;
  OLECHECK(GetDefaultInterface()->PixelsToPoints(Pixels, fVertical, (float*)&prop));
  return prop;
}

void __fastcall TWordApplication::KeyboardLatin(void)
{
  GetDefaultInterface()->KeyboardLatin();
}

void __fastcall TWordApplication::KeyboardBidi(void)
{
  GetDefaultInterface()->KeyboardBidi();
}

void __fastcall TWordApplication::ToggleKeyboard(void)
{
  GetDefaultInterface()->ToggleKeyboard();
}

long __fastcall TWordApplication::Keyboard(long LangId/*[in,def,opt]*/)
{
  long prop;
  OLECHECK(GetDefaultInterface()->Keyboard(LangId, (long*)&prop));
  return prop;
}

BSTR __fastcall TWordApplication::ProductCode(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->ProductCode((BSTR*)&prop));
  return prop;
}

Word_2k::DefaultWebOptions* __fastcall TWordApplication::DefaultWebOptions(void)
{
  Word_2k::DefaultWebOptions* prop = 0;
  OLECHECK(GetDefaultInterface()->DefaultWebOptions((Word_2k::DefaultWebOptions**)&prop));
  return prop;
}

void __fastcall TWordApplication::DiscussionSupport(VARIANT* Range/*[in]*/, VARIANT* cid/*[in]*/, 
                                                    VARIANT* piCSE/*[in]*/)
{
  GetDefaultInterface()->DiscussionSupport(Range/*[in]*/, cid/*[in]*/, piCSE/*[in]*/);
}

void __fastcall TWordApplication::SetDefaultTheme(BSTR Name/*[in]*/, 
                                                  Word_2k::WdDocumentMedium DocumentType/*[in]*/)
{
  GetDefaultInterface()->SetDefaultTheme(Name/*[in]*/, DocumentType/*[in]*/);
}

BSTR __fastcall TWordApplication::GetDefaultTheme(Word_2k::WdDocumentMedium DocumentType/*[in]*/)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->GetDefaultTheme(DocumentType, (BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::PrintOut(VARIANT* Background/*[in,opt]*/, 
                                           VARIANT* Append/*[in,opt]*/, VARIANT* Range/*[in,opt]*/, 
                                           VARIANT* OutputFileName/*[in,opt]*/, 
                                           VARIANT* From/*[in,opt]*/, VARIANT* To/*[in,opt]*/, 
                                           VARIANT* Item/*[in,opt]*/, VARIANT* Copies/*[in,opt]*/, 
                                           VARIANT* Pages/*[in,opt]*/, VARIANT* PageType/*[in,opt]*/, 
                                           VARIANT* PrintToFile/*[in,opt]*/, 
                                           VARIANT* Collate/*[in,opt]*/, 
                                           VARIANT* FileName/*[in,opt]*/, 
                                           VARIANT* ActivePrinterMacGX/*[in,opt]*/, 
                                           VARIANT* ManualDuplexPrint/*[in,opt]*/, 
                                           VARIANT* PrintZoomColumn/*[in,opt]*/, 
                                           VARIANT* PrintZoomRow/*[in,opt]*/, 
                                           VARIANT* PrintZoomPaperWidth/*[in,opt]*/, 
                                           VARIANT* PrintZoomPaperHeight/*[in,opt]*/)
{
  GetDefaultInterface()->PrintOut(Background/*[in,opt]*/, Append/*[in,opt]*/, Range/*[in,opt]*/, 
                                  OutputFileName/*[in,opt]*/, From/*[in,opt]*/, To/*[in,opt]*/, 
                                  Item/*[in,opt]*/, Copies/*[in,opt]*/, Pages/*[in,opt]*/, 
                                  PageType/*[in,opt]*/, PrintToFile/*[in,opt]*/, Collate/*[in,opt]*/, 
                                  FileName/*[in,opt]*/, ActivePrinterMacGX/*[in,opt]*/, 
                                  ManualDuplexPrint/*[in,opt]*/, PrintZoomColumn/*[in,opt]*/, 
                                  PrintZoomRow/*[in,opt]*/, PrintZoomPaperWidth/*[in,opt]*/, 
                                  PrintZoomPaperHeight/*[in,opt]*/);
}

VARIANT __fastcall TWordApplication::Run(BSTR MacroName/*[in]*/, VARIANT* varg1/*[in,opt]*/, 
                                         VARIANT* varg2/*[in,opt]*/, VARIANT* varg3/*[in,opt]*/, 
                                         VARIANT* varg4/*[in,opt]*/, VARIANT* varg5/*[in,opt]*/, 
                                         VARIANT* varg6/*[in,opt]*/, VARIANT* varg7/*[in,opt]*/, 
                                         VARIANT* varg8/*[in,opt]*/, VARIANT* varg9/*[in,opt]*/, 
                                         VARIANT* varg10/*[in,opt]*/, VARIANT* varg11/*[in,opt]*/, 
                                         VARIANT* varg12/*[in,opt]*/, VARIANT* varg13/*[in,opt]*/, 
                                         VARIANT* varg14/*[in,opt]*/, VARIANT* varg15/*[in,opt]*/, 
                                         VARIANT* varg16/*[in,opt]*/, VARIANT* varg17/*[in,opt]*/, 
                                         VARIANT* varg18/*[in,opt]*/, VARIANT* varg19/*[in,opt]*/, 
                                         VARIANT* varg20/*[in,opt]*/, VARIANT* varg21/*[in,opt]*/, 
                                         VARIANT* varg22/*[in,opt]*/, VARIANT* varg23/*[in,opt]*/, 
                                         VARIANT* varg24/*[in,opt]*/, VARIANT* varg25/*[in,opt]*/, 
                                         VARIANT* varg26/*[in,opt]*/, VARIANT* varg27/*[in,opt]*/, 
                                         VARIANT* varg28/*[in,opt]*/, VARIANT* varg29/*[in,opt]*/, 
                                         VARIANT* varg30/*[in,opt]*/)
{
  VARIANT prop;
  OLECHECK(GetDefaultInterface()->Run(MacroName, varg1, varg2, varg3, varg4, varg5, varg6, varg7, 
                                      varg8, varg9, varg10, varg11, varg12, varg13, varg14, varg15, 
                                      varg16, varg17, varg18, varg19, varg20, varg21, varg22, varg23, 
                                      varg24, varg25, varg26, varg27, varg28, varg29, varg30, (VARIANT*)&prop));
  return prop;
}

Word_2k::WordApplicationPtr __fastcall TWordApplication::get_Application(void)
{
  Word_2k::WordApplicationPtr prop;
  OLECHECK(GetDefaultInterface()->get_Application(&prop));
  return prop;
}

long __fastcall TWordApplication::get_Creator(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Creator((long*)&prop));
  return prop;
}

LPDISPATCH __fastcall TWordApplication::get_Parent(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&prop));
  return prop;
}

BSTR __fastcall TWordApplication::get_Name(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&prop));
  return prop;
}

Word_2k::DocumentsPtr __fastcall TWordApplication::get_Documents(void)
{
  Word_2k::DocumentsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Documents(&prop));
  return prop;
}

Word_2k::WindowsPtr __fastcall TWordApplication::get_Windoz(void)
{
  Word_2k::WindowsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Windoz(&prop));
  return prop;
}

Word_2k::WordDocumentPtr __fastcall TWordApplication::get_ActiveDocument(void)
{
  Word_2k::WordDocumentPtr prop;
  OLECHECK(GetDefaultInterface()->get_ActiveDocument(&prop));
  return prop;
}

Word_2k::WINDOWPtr __fastcall TWordApplication::get_ActiveWindow(void)
{
  Word_2k::WINDOWPtr prop;
  OLECHECK(GetDefaultInterface()->get_ActiveWindow(&prop));
  return prop;
}

Word_2k::WordSelectionPtr __fastcall TWordApplication::get_Selection(void)
{
  Word_2k::WordSelectionPtr prop;
  OLECHECK(GetDefaultInterface()->get_Selection(&prop));
  return prop;
}

LPDISPATCH __fastcall TWordApplication::get_WordBasic(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_WordBasic((LPDISPATCH*)&prop));
  return prop;
}

Word_2k::RecentFilesPtr __fastcall TWordApplication::get_RecentFiles(void)
{
  Word_2k::RecentFilesPtr prop;
  OLECHECK(GetDefaultInterface()->get_RecentFiles(&prop));
  return prop;
}

Word_2k::TemplatePtr __fastcall TWordApplication::get_NormalTemplate(void)
{
  Word_2k::TemplatePtr prop;
  OLECHECK(GetDefaultInterface()->get_NormalTemplate(&prop));
  return prop;
}

Word_2k::SYSTEMPtr __fastcall TWordApplication::get_System(void)
{
  Word_2k::SYSTEMPtr prop;
  OLECHECK(GetDefaultInterface()->get_System(&prop));
  return prop;
}

Word_2k::AutoCorrectPtr __fastcall TWordApplication::get_AutoCorrect(void)
{
  Word_2k::AutoCorrectPtr prop;
  OLECHECK(GetDefaultInterface()->get_AutoCorrect(&prop));
  return prop;
}

Word_2k::FontNamesPtr __fastcall TWordApplication::get_FontNames(void)
{
  Word_2k::FontNamesPtr prop;
  OLECHECK(GetDefaultInterface()->get_FontNames(&prop));
  return prop;
}

Word_2k::FontNamesPtr __fastcall TWordApplication::get_LandscapeFontNames(void)
{
  Word_2k::FontNamesPtr prop;
  OLECHECK(GetDefaultInterface()->get_LandscapeFontNames(&prop));
  return prop;
}

Word_2k::FontNamesPtr __fastcall TWordApplication::get_PortraitFontNames(void)
{
  Word_2k::FontNamesPtr prop;
  OLECHECK(GetDefaultInterface()->get_PortraitFontNames(&prop));
  return prop;
}

Word_2k::LanguagesPtr __fastcall TWordApplication::get_Languages(void)
{
  Word_2k::LanguagesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Languages(&prop));
  return prop;
}

Office_2k::AssistantPtr __fastcall TWordApplication::get_Assistant(void)
{
  Office_2k::AssistantPtr prop;
  OLECHECK(GetDefaultInterface()->get_Assistant(&prop));
  return prop;
}

Word_2k::BrowserPtr __fastcall TWordApplication::get_Browser(void)
{
  Word_2k::BrowserPtr prop;
  OLECHECK(GetDefaultInterface()->get_Browser(&prop));
  return prop;
}

Word_2k::FileConvertersPtr __fastcall TWordApplication::get_FileConverters(void)
{
  Word_2k::FileConvertersPtr prop;
  OLECHECK(GetDefaultInterface()->get_FileConverters(&prop));
  return prop;
}

Word_2k::MailingLabelPtr __fastcall TWordApplication::get_MailingLabel(void)
{
  Word_2k::MailingLabelPtr prop;
  OLECHECK(GetDefaultInterface()->get_MailingLabel(&prop));
  return prop;
}

Word_2k::DialogsPtr __fastcall TWordApplication::get_Dialogs(void)
{
  Word_2k::DialogsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Dialogs(&prop));
  return prop;
}

Word_2k::CaptionLabelsPtr __fastcall TWordApplication::get_CaptionLabels(void)
{
  Word_2k::CaptionLabelsPtr prop;
  OLECHECK(GetDefaultInterface()->get_CaptionLabels(&prop));
  return prop;
}

Word_2k::AutoCaptionsPtr __fastcall TWordApplication::get_AutoCaptions(void)
{
  Word_2k::AutoCaptionsPtr prop;
  OLECHECK(GetDefaultInterface()->get_AutoCaptions(&prop));
  return prop;
}

Word_2k::AddInsPtr __fastcall TWordApplication::get_AddIns(void)
{
  Word_2k::AddInsPtr prop;
  OLECHECK(GetDefaultInterface()->get_AddIns(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_Visible(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_Visible((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_Visible(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_Visible(prop/*[in]*/);
}

BSTR __fastcall TWordApplication::get_Version(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Version((BSTR*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_ScreenUpdating(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_ScreenUpdating((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_ScreenUpdating(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_ScreenUpdating(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordApplication::get_PrintPreview(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_PrintPreview((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_PrintPreview(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_PrintPreview(prop/*[in]*/);
}

Word_2k::TasksPtr __fastcall TWordApplication::get_Tasks(void)
{
  Word_2k::TasksPtr prop;
  OLECHECK(GetDefaultInterface()->get_Tasks(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_DisplayStatusBar(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_DisplayStatusBar((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_DisplayStatusBar(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_DisplayStatusBar(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordApplication::get_SpecialMode(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_SpecialMode((VARIANT_BOOL*)&prop));
  return prop;
}

long __fastcall TWordApplication::get_UsableWidth(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_UsableWidth((long*)&prop));
  return prop;
}

long __fastcall TWordApplication::get_UsableHeight(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_UsableHeight((long*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_MathCoprocessorAvailable(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_MathCoprocessorAvailable((VARIANT_BOOL*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_MouseAvailable(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_MouseAvailable((VARIANT_BOOL*)&prop));
  return prop;
}

VARIANT __fastcall TWordApplication::get_International(Word_2k::WdInternationalIndex Index/*[in]*/)
{
  VARIANT prop;
  OLECHECK(GetDefaultInterface()->get_International(Index, (VARIANT*)&prop));
  return prop;
}

BSTR __fastcall TWordApplication::get_Build(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Build((BSTR*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_CapsLock(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_CapsLock((VARIANT_BOOL*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_NumLock(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_NumLock((VARIANT_BOOL*)&prop));
  return prop;
}

BSTR __fastcall TWordApplication::get_UserName(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_UserName((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_UserName(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_UserName(prop/*[in]*/);
}

BSTR __fastcall TWordApplication::get_UserInitials(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_UserInitials((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_UserInitials(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_UserInitials(prop/*[in]*/);
}

BSTR __fastcall TWordApplication::get_UserAddress(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_UserAddress((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_UserAddress(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_UserAddress(prop/*[in]*/);
}

LPDISPATCH __fastcall TWordApplication::get_MacroContainer(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_MacroContainer((LPDISPATCH*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_DisplayRecentFiles(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_DisplayRecentFiles((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_DisplayRecentFiles(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_DisplayRecentFiles(prop/*[in]*/);
}

Office_2k::CommandBarsPtr __fastcall TWordApplication::get_CommandBars(void)
{
  Office_2k::CommandBarsPtr prop;
  OLECHECK(GetDefaultInterface()->get_CommandBars(&prop));
  return prop;
}

Word_2k::SynonymInfo* __fastcall TWordApplication::get_SynonymInfo(BSTR Word/*[in]*/, 
                                                                   VARIANT* LanguageID/*[in,opt]*/)
{
  Word_2k::SynonymInfo* prop = 0;
  OLECHECK(GetDefaultInterface()->get_SynonymInfo(Word, LanguageID, (Word_2k::SynonymInfo**)&prop));
  return prop;
}

Vbide_2k::VBEPtr __fastcall TWordApplication::get_VBE(void)
{
  Vbide_2k::VBEPtr prop;
  OLECHECK(GetDefaultInterface()->get_VBE(&prop));
  return prop;
}

BSTR __fastcall TWordApplication::get_DefaultSaveFormat(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_DefaultSaveFormat((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_DefaultSaveFormat(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_DefaultSaveFormat(prop/*[in]*/);
}

Word_2k::ListGalleriesPtr __fastcall TWordApplication::get_ListGalleries(void)
{
  Word_2k::ListGalleriesPtr prop;
  OLECHECK(GetDefaultInterface()->get_ListGalleries(&prop));
  return prop;
}

BSTR __fastcall TWordApplication::get_ActivePrinter(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_ActivePrinter((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_ActivePrinter(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_ActivePrinter(prop/*[in]*/);
}

Word_2k::TemplatesPtr __fastcall TWordApplication::get_Templates(void)
{
  Word_2k::TemplatesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Templates(&prop));
  return prop;
}

LPDISPATCH __fastcall TWordApplication::get_CustomizationContext(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_CustomizationContext((LPDISPATCH*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_CustomizationContext(LPDISPATCH prop/*[in]*/)
{
  GetDefaultInterface()->set_CustomizationContext(prop/*[in]*/);
}

Word_2k::KeyBindingsPtr __fastcall TWordApplication::get_KeyBindings(void)
{
  Word_2k::KeyBindingsPtr prop;
  OLECHECK(GetDefaultInterface()->get_KeyBindings(&prop));
  return prop;
}

Word_2k::KeysBoundTo* __fastcall TWordApplication::get_KeysBoundTo(Word_2k::WdKeyCategory KeyCategory/*[in]*/, 
                                                                   BSTR Command/*[in]*/, 
                                                                   VARIANT* CommandParameter/*[in,opt]*/)
{
  Word_2k::KeysBoundTo* prop = 0;
  OLECHECK(GetDefaultInterface()->get_KeysBoundTo(KeyCategory, Command, CommandParameter, (Word_2k::KeysBoundTo**)&prop));
  return prop;
}

Word_2k::KeyBinding* __fastcall TWordApplication::get_FindKey(long KeyCode/*[in]*/, 
                                                              VARIANT* KeyCode2/*[in,opt]*/)
{
  Word_2k::KeyBinding* prop = 0;
  OLECHECK(GetDefaultInterface()->get_FindKey(KeyCode, KeyCode2, (Word_2k::KeyBinding**)&prop));
  return prop;
}

BSTR __fastcall TWordApplication::get_Caption(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Caption((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_Caption(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_Caption(prop/*[in]*/);
}

BSTR __fastcall TWordApplication::get_Path(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Path((BSTR*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_DisplayScrollBars(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_DisplayScrollBars((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_DisplayScrollBars(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_DisplayScrollBars(prop/*[in]*/);
}

BSTR __fastcall TWordApplication::get_StartupPath(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_StartupPath((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_StartupPath(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_StartupPath(prop/*[in]*/);
}

long __fastcall TWordApplication::get_BackgroundSavingStatus(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_BackgroundSavingStatus((long*)&prop));
  return prop;
}

long __fastcall TWordApplication::get_BackgroundPrintingStatus(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_BackgroundPrintingStatus((long*)&prop));
  return prop;
}

long __fastcall TWordApplication::get_Left(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Left((long*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_Left(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Left(prop/*[in]*/);
}

long __fastcall TWordApplication::get_Top(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Top((long*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_Top(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Top(prop/*[in]*/);
}

long __fastcall TWordApplication::get_Width(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Width((long*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_Width(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Width(prop/*[in]*/);
}

long __fastcall TWordApplication::get_Height(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Height((long*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_Height(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Height(prop/*[in]*/);
}

Word_2k::WdWindowState __fastcall TWordApplication::get_WindowState(void)
{
  Word_2k::WdWindowState prop;
  OLECHECK(GetDefaultInterface()->get_WindowState((Word_2k::WdWindowState*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_WindowState(Word_2k::WdWindowState prop/*[in]*/)
{
  GetDefaultInterface()->set_WindowState(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordApplication::get_DisplayAutoCompleteTips(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_DisplayAutoCompleteTips((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_DisplayAutoCompleteTips(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_DisplayAutoCompleteTips(prop/*[in]*/);
}

Word_2k::OptionsPtr __fastcall TWordApplication::get_Options(void)
{
  Word_2k::OptionsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Options(&prop));
  return prop;
}

Word_2k::WdAlertLevel __fastcall TWordApplication::get_DisplayAlerts(void)
{
  Word_2k::WdAlertLevel prop;
  OLECHECK(GetDefaultInterface()->get_DisplayAlerts((Word_2k::WdAlertLevel*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_DisplayAlerts(Word_2k::WdAlertLevel prop/*[in]*/)
{
  GetDefaultInterface()->set_DisplayAlerts(prop/*[in]*/);
}

Word_2k::DictionariesPtr __fastcall TWordApplication::get_CustomDictionaries(void)
{
  Word_2k::DictionariesPtr prop;
  OLECHECK(GetDefaultInterface()->get_CustomDictionaries(&prop));
  return prop;
}

BSTR __fastcall TWordApplication::get_PathSeparator(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_PathSeparator((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_StatusBar(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_StatusBar(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TWordApplication::get_MAPIAvailable(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_MAPIAvailable((VARIANT_BOOL*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_DisplayScreenTips(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_DisplayScreenTips((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_DisplayScreenTips(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_DisplayScreenTips(prop/*[in]*/);
}

Word_2k::WdEnableCancelKey __fastcall TWordApplication::get_EnableCancelKey(void)
{
  Word_2k::WdEnableCancelKey prop;
  OLECHECK(GetDefaultInterface()->get_EnableCancelKey((Word_2k::WdEnableCancelKey*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_EnableCancelKey(Word_2k::WdEnableCancelKey prop/*[in]*/)
{
  GetDefaultInterface()->set_EnableCancelKey(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordApplication::get_UserControl(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_UserControl((VARIANT_BOOL*)&prop));
  return prop;
}

Office_2k::FileSearchPtr __fastcall TWordApplication::get_FileSearch(void)
{
  Office_2k::FileSearchPtr prop;
  OLECHECK(GetDefaultInterface()->get_FileSearch(&prop));
  return prop;
}

Word_2k::WdMailSystem __fastcall TWordApplication::get_MailSystem(void)
{
  Word_2k::WdMailSystem prop;
  OLECHECK(GetDefaultInterface()->get_MailSystem((Word_2k::WdMailSystem*)&prop));
  return prop;
}

BSTR __fastcall TWordApplication::get_DefaultTableSeparator(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_DefaultTableSeparator((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_DefaultTableSeparator(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_DefaultTableSeparator(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordApplication::get_ShowVisualBasicEditor(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_ShowVisualBasicEditor((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_ShowVisualBasicEditor(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_ShowVisualBasicEditor(prop/*[in]*/);
}

BSTR __fastcall TWordApplication::get_BrowseExtraFileTypes(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_BrowseExtraFileTypes((BSTR*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_BrowseExtraFileTypes(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_BrowseExtraFileTypes(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordApplication::get_IsObjectValid(LPDISPATCH Object/*[in]*/)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_IsObjectValid(Object, (VARIANT_BOOL*)&prop));
  return prop;
}

Word_2k::HangulHanjaConversionDictionariesPtr __fastcall TWordApplication::get_HangulHanjaDictionaries(void)
{
  Word_2k::HangulHanjaConversionDictionariesPtr prop;
  OLECHECK(GetDefaultInterface()->get_HangulHanjaDictionaries(&prop));
  return prop;
}

Word_2k::MailMessagePtr __fastcall TWordApplication::get_MailMessage(void)
{
  Word_2k::MailMessagePtr prop;
  OLECHECK(GetDefaultInterface()->get_MailMessage(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_FocusInMailHeader(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_FocusInMailHeader((VARIANT_BOOL*)&prop));
  return prop;
}

Word_2k::EmailOptionsPtr __fastcall TWordApplication::get_EmailOptions(void)
{
  Word_2k::EmailOptionsPtr prop;
  OLECHECK(GetDefaultInterface()->get_EmailOptions(&prop));
  return prop;
}

Office_2k::MsoLanguageID __fastcall TWordApplication::get_Language(void)
{
  Office_2k::MsoLanguageID prop;
  OLECHECK(GetDefaultInterface()->get_Language((Office_2k::MsoLanguageID*)&prop));
  return prop;
}

Office_2k::COMAddInsPtr __fastcall TWordApplication::get_COMAddIns(void)
{
  Office_2k::COMAddInsPtr prop;
  OLECHECK(GetDefaultInterface()->get_COMAddIns(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_CheckLanguage(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_CheckLanguage((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_CheckLanguage(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_CheckLanguage(prop/*[in]*/);
}

Office_2k::LanguageSettingsPtr __fastcall TWordApplication::get_LanguageSettings(void)
{
  Office_2k::LanguageSettingsPtr prop;
  OLECHECK(GetDefaultInterface()->get_LanguageSettings(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordApplication::get_Dummy1(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_Dummy1((VARIANT_BOOL*)&prop));
  return prop;
}

Office_2k::AnswerWizardPtr __fastcall TWordApplication::get_AnswerWizard(void)
{
  Office_2k::AnswerWizardPtr prop;
  OLECHECK(GetDefaultInterface()->get_AnswerWizard(&prop));
  return prop;
}

Office_2k::MsoFeatureInstall __fastcall TWordApplication::get_FeatureInstall(void)
{
  Office_2k::MsoFeatureInstall prop;
  OLECHECK(GetDefaultInterface()->get_FeatureInstall((Office_2k::MsoFeatureInstall*)&prop));
  return prop;
}

void __fastcall TWordApplication::set_FeatureInstall(Office_2k::MsoFeatureInstall prop/*[in]*/)
{
  GetDefaultInterface()->set_FeatureInstall(prop/*[in]*/);
}

_DocumentPtr& TWordDocument::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TWordDocument::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TWordDocument::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TWordDocument::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TWordDocument::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TWordDocument::ConnectTo(_DocumentPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TWordDocument::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_WordDocument;
  sd.IntfIID = __uuidof(_Document);
  sd.EventIID= __uuidof(DocumentEvents);
  ServerData = &sd;
}

void __fastcall TWordDocument::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 4: {
      if (OnNew) {
        (OnNew)(this);
      }
      break;
      }
    case 5: {
      if (OnOpen) {
        (OnOpen)(this);
      }
      break;
      }
    case 6: {
      if (OnClose) {
        (OnClose)(this);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TWordDocument::Close(VARIANT* SaveChanges/*[in,opt]*/, 
                                     VARIANT* OriginalFormat/*[in,opt]*/, 
                                     VARIANT* RouteDocument/*[in,opt]*/)
{
  GetDefaultInterface()->Close(SaveChanges/*[in,opt]*/, OriginalFormat/*[in,opt]*/, 
                               RouteDocument/*[in,opt]*/);
}

void __fastcall TWordDocument::SaveAs(VARIANT* FileName/*[in,opt]*/, VARIANT* FileFormat/*[in,opt]*/, 
                                      VARIANT* LockComments/*[in,opt]*/, 
                                      VARIANT* Password/*[in,opt]*/, 
                                      VARIANT* AddToRecentFiles/*[in,opt]*/, 
                                      VARIANT* WritePassword/*[in,opt]*/, 
                                      VARIANT* ReadOnlyRecommended/*[in,opt]*/, 
                                      VARIANT* EmbedTrueTypeFonts/*[in,opt]*/, 
                                      VARIANT* SaveNativePictureFormat/*[in,opt]*/, 
                                      VARIANT* SaveFormsData/*[in,opt]*/, 
                                      VARIANT* SaveAsAOCELetter/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(FileName/*[in,opt]*/, FileFormat/*[in,opt]*/, 
                                LockComments/*[in,opt]*/, Password/*[in,opt]*/, 
                                AddToRecentFiles/*[in,opt]*/, WritePassword/*[in,opt]*/, 
                                ReadOnlyRecommended/*[in,opt]*/, EmbedTrueTypeFonts/*[in,opt]*/, 
                                SaveNativePictureFormat/*[in,opt]*/, SaveFormsData/*[in,opt]*/, 
                                SaveAsAOCELetter/*[in,opt]*/);
}

void __fastcall TWordDocument::Repaginate(void)
{
  GetDefaultInterface()->Repaginate();
}

void __fastcall TWordDocument::FitToPages(void)
{
  GetDefaultInterface()->FitToPages();
}

void __fastcall TWordDocument::ManualHyphenation(void)
{
  GetDefaultInterface()->ManualHyphenation();
}

void __fastcall TWordDocument::Select(void)
{
  GetDefaultInterface()->Select();
}

void __fastcall TWordDocument::DataForm(void)
{
  GetDefaultInterface()->DataForm();
}

void __fastcall TWordDocument::Route(void)
{
  GetDefaultInterface()->Route();
}

void __fastcall TWordDocument::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TWordDocument::PrintOutOld(VARIANT* Background/*[in,opt]*/, 
                                           VARIANT* Append/*[in,opt]*/, VARIANT* Range/*[in,opt]*/, 
                                           VARIANT* OutputFileName/*[in,opt]*/, 
                                           VARIANT* From/*[in,opt]*/, VARIANT* To/*[in,opt]*/, 
                                           VARIANT* Item/*[in,opt]*/, VARIANT* Copies/*[in,opt]*/, 
                                           VARIANT* Pages/*[in,opt]*/, VARIANT* PageType/*[in,opt]*/, 
                                           VARIANT* PrintToFile/*[in,opt]*/, 
                                           VARIANT* Collate/*[in,opt]*/, 
                                           VARIANT* ActivePrinterMacGX/*[in,opt]*/, 
                                           VARIANT* ManualDuplexPrint/*[in,opt]*/)
{
  GetDefaultInterface()->PrintOutOld(Background/*[in,opt]*/, Append/*[in,opt]*/, Range/*[in,opt]*/, 
                                     OutputFileName/*[in,opt]*/, From/*[in,opt]*/, To/*[in,opt]*/, 
                                     Item/*[in,opt]*/, Copies/*[in,opt]*/, Pages/*[in,opt]*/, 
                                     PageType/*[in,opt]*/, PrintToFile/*[in,opt]*/, 
                                     Collate/*[in,opt]*/, ActivePrinterMacGX/*[in,opt]*/, 
                                     ManualDuplexPrint/*[in,opt]*/);
}

void __fastcall TWordDocument::SendMail(void)
{
  GetDefaultInterface()->SendMail();
}

Word_2k::WordRange* __fastcall TWordDocument::Range(VARIANT* Start/*[in,opt]*/, 
                                                    VARIANT* End/*[in,opt]*/)
{
  Word_2k::WordRange* prop = 0;
  OLECHECK(GetDefaultInterface()->Range(Start, End, (Word_2k::WordRange**)&prop));
  return prop;
}

void __fastcall TWordDocument::RunAutoMacro(Word_2k::WdAutoMacros Which/*[in]*/)
{
  GetDefaultInterface()->RunAutoMacro(Which/*[in]*/);
}

void __fastcall TWordDocument::Activate(void)
{
  GetDefaultInterface()->Activate();
}

void __fastcall TWordDocument::PrintPreview(void)
{
  GetDefaultInterface()->PrintPreview();
}

Word_2k::WordRange* __fastcall TWordDocument::GoTo(VARIANT* What/*[in,opt]*/, 
                                                   VARIANT* Which/*[in,opt]*/, 
                                                   VARIANT* Count/*[in,opt]*/, 
                                                   VARIANT* Name/*[in,opt]*/)
{
  Word_2k::WordRange* prop = 0;
  OLECHECK(GetDefaultInterface()->GoTo(What, Which, Count, Name, (Word_2k::WordRange**)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::Undo(VARIANT* Times/*[in,opt]*/)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->Undo(Times, (VARIANT_BOOL*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::Redo(VARIANT* Times/*[in,opt]*/)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->Redo(Times, (VARIANT_BOOL*)&prop));
  return prop;
}

long __fastcall TWordDocument::ComputeStatistics(Word_2k::WdStatistic Statistic/*[in]*/, 
                                                 VARIANT* IncludeFootnotesAndEndnotes/*[in,opt]*/)
{
  long prop;
  OLECHECK(GetDefaultInterface()->ComputeStatistics(Statistic, IncludeFootnotesAndEndnotes, (long*)&prop));
  return prop;
}

void __fastcall TWordDocument::MakeCompatibilityDefault(void)
{
  GetDefaultInterface()->MakeCompatibilityDefault();
}

void __fastcall TWordDocument::Protect(Word_2k::WdProtectionType Type/*[in]*/, 
                                       VARIANT* NoReset/*[in,opt]*/, VARIANT* Password/*[in,opt]*/)
{
  GetDefaultInterface()->Protect(Type/*[in]*/, NoReset/*[in,opt]*/, Password/*[in,opt]*/);
}

void __fastcall TWordDocument::Unprotect(VARIANT* Password/*[in,opt]*/)
{
  GetDefaultInterface()->Unprotect(Password/*[in,opt]*/);
}

void __fastcall TWordDocument::EditionOptions(Word_2k::WdEditionType Type/*[in]*/, 
                                              Word_2k::WdEditionOption Option/*[in]*/, 
                                              BSTR Name/*[in]*/, VARIANT* Format/*[in,opt]*/)
{
  GetDefaultInterface()->EditionOptions(Type/*[in]*/, Option/*[in]*/, Name/*[in]*/, 
                                        Format/*[in,opt]*/);
}

void __fastcall TWordDocument::RunLetterWizard(VARIANT* LetterContent/*[in,opt]*/, 
                                               VARIANT* WizardMode/*[in,opt]*/)
{
  GetDefaultInterface()->RunLetterWizard(LetterContent/*[in,opt]*/, WizardMode/*[in,opt]*/);
}

Word_2k::WordLetterContent* __fastcall TWordDocument::GetLetterContent(void)
{
  Word_2k::WordLetterContent* prop = 0;
  OLECHECK(GetDefaultInterface()->GetLetterContent((Word_2k::WordLetterContent**)&prop));
  return prop;
}

void __fastcall TWordDocument::SetLetterContent(VARIANT* LetterContent/*[in]*/)
{
  GetDefaultInterface()->SetLetterContent(LetterContent/*[in]*/);
}

void __fastcall TWordDocument::CopyStylesFromTemplate(BSTR Template/*[in]*/)
{
  GetDefaultInterface()->CopyStylesFromTemplate(Template/*[in]*/);
}

void __fastcall TWordDocument::UpdateStyles(void)
{
  GetDefaultInterface()->UpdateStyles();
}

void __fastcall TWordDocument::CheckGrammar(void)
{
  GetDefaultInterface()->CheckGrammar();
}

void __fastcall TWordDocument::CheckSpelling(VARIANT* CustomDictionary/*[in,opt]*/, 
                                             VARIANT* IgnoreUppercase/*[in,opt]*/, 
                                             VARIANT* AlwaysSuggest/*[in,opt]*/, 
                                             VARIANT* CustomDictionary2/*[in,opt]*/, 
                                             VARIANT* CustomDictionary3/*[in,opt]*/, 
                                             VARIANT* CustomDictionary4/*[in,opt]*/, 
                                             VARIANT* CustomDictionary5/*[in,opt]*/, 
                                             VARIANT* CustomDictionary6/*[in,opt]*/, 
                                             VARIANT* CustomDictionary7/*[in,opt]*/, 
                                             VARIANT* CustomDictionary8/*[in,opt]*/, 
                                             VARIANT* CustomDictionary9/*[in,opt]*/, 
                                             VARIANT* CustomDictionary10/*[in,opt]*/)
{
  GetDefaultInterface()->CheckSpelling(CustomDictionary/*[in,opt]*/, IgnoreUppercase/*[in,opt]*/, 
                                       AlwaysSuggest/*[in,opt]*/, CustomDictionary2/*[in,opt]*/, 
                                       CustomDictionary3/*[in,opt]*/, CustomDictionary4/*[in,opt]*/, 
                                       CustomDictionary5/*[in,opt]*/, CustomDictionary6/*[in,opt]*/, 
                                       CustomDictionary7/*[in,opt]*/, CustomDictionary8/*[in,opt]*/, 
                                       CustomDictionary9/*[in,opt]*/, CustomDictionary10/*[in,opt]*/);
}

void __fastcall TWordDocument::FollowHyperlink(VARIANT* Address/*[in,opt]*/, 
                                               VARIANT* SubAddress/*[in,opt]*/, 
                                               VARIANT* NewWindow/*[in,opt]*/, 
                                               VARIANT* AddHistory/*[in,opt]*/, 
                                               VARIANT* ExtraInfo/*[in,opt]*/, 
                                               VARIANT* Method/*[in,opt]*/, 
                                               VARIANT* HeaderInfo/*[in,opt]*/)
{
  GetDefaultInterface()->FollowHyperlink(Address/*[in,opt]*/, SubAddress/*[in,opt]*/, 
                                         NewWindow/*[in,opt]*/, AddHistory/*[in,opt]*/, 
                                         ExtraInfo/*[in,opt]*/, Method/*[in,opt]*/, 
                                         HeaderInfo/*[in,opt]*/);
}

void __fastcall TWordDocument::AddToFavorites(void)
{
  GetDefaultInterface()->AddToFavorites();
}

void __fastcall TWordDocument::Reload(void)
{
  GetDefaultInterface()->Reload();
}

Word_2k::WordRange* __fastcall TWordDocument::AutoSummarize(VARIANT* Length/*[in,opt]*/, 
                                                            VARIANT* Mode/*[in,opt]*/, 
                                                            VARIANT* UpdateProperties/*[in,opt]*/)
{
  Word_2k::WordRange* prop = 0;
  OLECHECK(GetDefaultInterface()->AutoSummarize(Length, Mode, UpdateProperties, (Word_2k::WordRange**)&prop));
  return prop;
}

void __fastcall TWordDocument::RemoveNumbers(VARIANT* NumberType/*[in,opt]*/)
{
  GetDefaultInterface()->RemoveNumbers(NumberType/*[in,opt]*/);
}

void __fastcall TWordDocument::ConvertNumbersToText(VARIANT* NumberType/*[in,opt]*/)
{
  GetDefaultInterface()->ConvertNumbersToText(NumberType/*[in,opt]*/);
}

long __fastcall TWordDocument::CountNumberedItems(VARIANT* NumberType/*[in,opt]*/, 
                                                  VARIANT* Level/*[in,opt]*/)
{
  long prop;
  OLECHECK(GetDefaultInterface()->CountNumberedItems(NumberType, Level, (long*)&prop));
  return prop;
}

void __fastcall TWordDocument::Post(void)
{
  GetDefaultInterface()->Post();
}

void __fastcall TWordDocument::ToggleFormsDesign(void)
{
  GetDefaultInterface()->ToggleFormsDesign();
}

void __fastcall TWordDocument::Compare(BSTR Name/*[in]*/)
{
  GetDefaultInterface()->Compare(Name/*[in]*/);
}

void __fastcall TWordDocument::UpdateSummaryProperties(void)
{
  GetDefaultInterface()->UpdateSummaryProperties();
}

VARIANT __fastcall TWordDocument::GetCrossReferenceItems(VARIANT* ReferenceType/*[in]*/)
{
  VARIANT prop;
  OLECHECK(GetDefaultInterface()->GetCrossReferenceItems(ReferenceType, (VARIANT*)&prop));
  return prop;
}

void __fastcall TWordDocument::AutoFormat(void)
{
  GetDefaultInterface()->AutoFormat();
}

void __fastcall TWordDocument::ViewCode(void)
{
  GetDefaultInterface()->ViewCode();
}

void __fastcall TWordDocument::ViewPropertyBrowser(void)
{
  GetDefaultInterface()->ViewPropertyBrowser();
}

void __fastcall TWordDocument::ForwardMailer(void)
{
  GetDefaultInterface()->ForwardMailer();
}

void __fastcall TWordDocument::Reply(void)
{
  GetDefaultInterface()->Reply();
}

void __fastcall TWordDocument::ReplyAll(void)
{
  GetDefaultInterface()->ReplyAll();
}

void __fastcall TWordDocument::SendMailer(VARIANT* FileFormat/*[in,opt]*/, 
                                          VARIANT* Priority/*[in,opt]*/)
{
  GetDefaultInterface()->SendMailer(FileFormat/*[in,opt]*/, Priority/*[in,opt]*/);
}

void __fastcall TWordDocument::UndoClear(void)
{
  GetDefaultInterface()->UndoClear();
}

void __fastcall TWordDocument::PresentIt(void)
{
  GetDefaultInterface()->PresentIt();
}

void __fastcall TWordDocument::SendFax(BSTR Address/*[in]*/, VARIANT* Subject/*[in,opt]*/)
{
  GetDefaultInterface()->SendFax(Address/*[in]*/, Subject/*[in,opt]*/);
}

void __fastcall TWordDocument::Merge(BSTR FileName/*[in]*/)
{
  GetDefaultInterface()->Merge(FileName/*[in]*/);
}

void __fastcall TWordDocument::ClosePrintPreview(void)
{
  GetDefaultInterface()->ClosePrintPreview();
}

void __fastcall TWordDocument::CheckConsistency(void)
{
  GetDefaultInterface()->CheckConsistency();
}

Word_2k::WordLetterContent* __fastcall TWordDocument::CreateLetterContent(BSTR DateFormat/*[in]*/, 
                                                                          VARIANT_BOOL IncludeHeaderFooter/*[in]*/, 
                                                                          BSTR PageDesign/*[in]*/, 
                                                                          Word_2k::WdLetterStyle LetterStyle/*[in]*/, 
                                                                          VARIANT_BOOL Letterhead/*[in]*/, 
                                                                          Word_2k::WdLetterheadLocation LetterheadLocation/*[in]*/, 
                                                                          float LetterheadSize/*[in]*/, 
                                                                          BSTR RecipientName/*[in]*/, 
                                                                          BSTR RecipientAddress/*[in]*/, 
                                                                          BSTR Salutation/*[in]*/, 
                                                                          Word_2k::WdSalutationType SalutationType/*[in]*/, 
                                                                          BSTR RecipientReference/*[in]*/, 
                                                                          BSTR MailingInstructions/*[in]*/, 
                                                                          BSTR AttentionLine/*[in]*/, 
                                                                          BSTR Subject/*[in]*/, 
                                                                          BSTR CCList/*[in]*/, 
                                                                          BSTR ReturnAddress/*[in]*/, 
                                                                          BSTR SenderName/*[in]*/, 
                                                                          BSTR Closing/*[in]*/, 
                                                                          BSTR SenderCompany/*[in]*/, 
                                                                          BSTR SenderJobTitle/*[in]*/, 
                                                                          BSTR SenderInitials/*[in]*/, 
                                                                          long EnclosureNumber/*[in]*/, 
                                                                          VARIANT* InfoBlock/*[in,opt]*/, 
                                                                          VARIANT* RecipientCode/*[in,opt]*/, 
                                                                          VARIANT* RecipientGender/*[in,opt]*/, 
                                                                          VARIANT* ReturnAddressShortForm/*[in,opt]*/, 
                                                                          VARIANT* SenderCity/*[in,opt]*/, 
                                                                          VARIANT* SenderCode/*[in,opt]*/, 
                                                                          VARIANT* SenderGender/*[in,opt]*/, 
                                                                          VARIANT* SenderReference/*[in,opt]*/)
{
  Word_2k::WordLetterContent* prop = 0;
  OLECHECK(GetDefaultInterface()->CreateLetterContent(DateFormat, IncludeHeaderFooter, PageDesign, 
                                                      LetterStyle, Letterhead, LetterheadLocation, 
                                                      LetterheadSize, RecipientName, 
                                                      RecipientAddress, Salutation, SalutationType, 
                                                      RecipientReference, MailingInstructions, 
                                                      AttentionLine, Subject, CCList, ReturnAddress, 
                                                      SenderName, Closing, SenderCompany, 
                                                      SenderJobTitle, SenderInitials, 
                                                      EnclosureNumber, InfoBlock, RecipientCode, 
                                                      RecipientGender, ReturnAddressShortForm, 
                                                      SenderCity, SenderCode, SenderGender, 
                                                      SenderReference, (Word_2k::WordLetterContent**)&prop));
  return prop;
}

void __fastcall TWordDocument::AcceptAllRevisions(void)
{
  GetDefaultInterface()->AcceptAllRevisions();
}

void __fastcall TWordDocument::RejectAllRevisions(void)
{
  GetDefaultInterface()->RejectAllRevisions();
}

void __fastcall TWordDocument::DetectLanguage(void)
{
  GetDefaultInterface()->DetectLanguage();
}

void __fastcall TWordDocument::ApplyTheme(BSTR Name/*[in]*/)
{
  GetDefaultInterface()->ApplyTheme(Name/*[in]*/);
}

void __fastcall TWordDocument::RemoveTheme(void)
{
  GetDefaultInterface()->RemoveTheme();
}

void __fastcall TWordDocument::WebPagePreview(void)
{
  GetDefaultInterface()->WebPagePreview();
}

void __fastcall TWordDocument::ReloadAs(Office_2k::MsoEncoding Encoding/*[in]*/)
{
  GetDefaultInterface()->ReloadAs(Encoding/*[in]*/);
}

void __fastcall TWordDocument::PrintOut(VARIANT* Background/*[in,opt]*/, VARIANT* Append/*[in,opt]*/, 
                                        VARIANT* Range/*[in,opt]*/, 
                                        VARIANT* OutputFileName/*[in,opt]*/, 
                                        VARIANT* From/*[in,opt]*/, VARIANT* To/*[in,opt]*/, 
                                        VARIANT* Item/*[in,opt]*/, VARIANT* Copies/*[in,opt]*/, 
                                        VARIANT* Pages/*[in,opt]*/, VARIANT* PageType/*[in,opt]*/, 
                                        VARIANT* PrintToFile/*[in,opt]*/, 
                                        VARIANT* Collate/*[in,opt]*/, 
                                        VARIANT* ActivePrinterMacGX/*[in,opt]*/, 
                                        VARIANT* ManualDuplexPrint/*[in,opt]*/, 
                                        VARIANT* PrintZoomColumn/*[in,opt]*/, 
                                        VARIANT* PrintZoomRow/*[in,opt]*/, 
                                        VARIANT* PrintZoomPaperWidth/*[in,opt]*/, 
                                        VARIANT* PrintZoomPaperHeight/*[in,opt]*/)
{
  GetDefaultInterface()->PrintOut(Background/*[in,opt]*/, Append/*[in,opt]*/, Range/*[in,opt]*/, 
                                  OutputFileName/*[in,opt]*/, From/*[in,opt]*/, To/*[in,opt]*/, 
                                  Item/*[in,opt]*/, Copies/*[in,opt]*/, Pages/*[in,opt]*/, 
                                  PageType/*[in,opt]*/, PrintToFile/*[in,opt]*/, Collate/*[in,opt]*/, 
                                  ActivePrinterMacGX/*[in,opt]*/, ManualDuplexPrint/*[in,opt]*/, 
                                  PrintZoomColumn/*[in,opt]*/, PrintZoomRow/*[in,opt]*/, 
                                  PrintZoomPaperWidth/*[in,opt]*/, PrintZoomPaperHeight/*[in,opt]*/);
}

void __fastcall TWordDocument::sblt(BSTR s/*[in]*/)
{
  GetDefaultInterface()->sblt(s/*[in]*/);
}

BSTR __fastcall TWordDocument::get_Name(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&prop));
  return prop;
}

Word_2k::WordApplicationPtr __fastcall TWordDocument::get_Application(void)
{
  Word_2k::WordApplicationPtr prop;
  OLECHECK(GetDefaultInterface()->get_Application(&prop));
  return prop;
}

long __fastcall TWordDocument::get_Creator(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Creator((long*)&prop));
  return prop;
}

LPDISPATCH __fastcall TWordDocument::get_Parent(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&prop));
  return prop;
}

LPDISPATCH __fastcall TWordDocument::get_BuiltInDocumentProperties(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_BuiltInDocumentProperties((LPDISPATCH*)&prop));
  return prop;
}

LPDISPATCH __fastcall TWordDocument::get_CustomDocumentProperties(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_CustomDocumentProperties((LPDISPATCH*)&prop));
  return prop;
}

BSTR __fastcall TWordDocument::get_Path(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Path((BSTR*)&prop));
  return prop;
}

Word_2k::BookmarksPtr __fastcall TWordDocument::get_Bookmarks(void)
{
  Word_2k::BookmarksPtr prop;
  OLECHECK(GetDefaultInterface()->get_Bookmarks(&prop));
  return prop;
}

Word_2k::TablesPtr __fastcall TWordDocument::get_Tables(void)
{
  Word_2k::TablesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Tables(&prop));
  return prop;
}

Word_2k::FootnotesPtr __fastcall TWordDocument::get_Footnotes(void)
{
  Word_2k::FootnotesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Footnotes(&prop));
  return prop;
}

Word_2k::EndnotesPtr __fastcall TWordDocument::get_Endnotes(void)
{
  Word_2k::EndnotesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Endnotes(&prop));
  return prop;
}

Word_2k::CommentsPtr __fastcall TWordDocument::get_Comments(void)
{
  Word_2k::CommentsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Comments(&prop));
  return prop;
}

Word_2k::WdDocumentType __fastcall TWordDocument::get_Type(void)
{
  Word_2k::WdDocumentType prop;
  OLECHECK(GetDefaultInterface()->get_Type((Word_2k::WdDocumentType*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_AutoHyphenation(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_AutoHyphenation((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_AutoHyphenation(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_AutoHyphenation(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_HyphenateCaps(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_HyphenateCaps((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_HyphenateCaps(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_HyphenateCaps(prop/*[in]*/);
}

long __fastcall TWordDocument::get_HyphenationZone(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_HyphenationZone((long*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_HyphenationZone(long prop/*[in]*/)
{
  GetDefaultInterface()->set_HyphenationZone(prop/*[in]*/);
}

long __fastcall TWordDocument::get_ConsecutiveHyphensLimit(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_ConsecutiveHyphensLimit((long*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_ConsecutiveHyphensLimit(long prop/*[in]*/)
{
  GetDefaultInterface()->set_ConsecutiveHyphensLimit(prop/*[in]*/);
}

Word_2k::SectionsPtr __fastcall TWordDocument::get_Sections(void)
{
  Word_2k::SectionsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Sections(&prop));
  return prop;
}

Word_2k::ParagraphsPtr __fastcall TWordDocument::get_Paragraphs(void)
{
  Word_2k::ParagraphsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Paragraphs(&prop));
  return prop;
}

Word_2k::WordsPtr __fastcall TWordDocument::get_Words(void)
{
  Word_2k::WordsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Words(&prop));
  return prop;
}

Word_2k::SentencesPtr __fastcall TWordDocument::get_Sentences(void)
{
  Word_2k::SentencesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Sentences(&prop));
  return prop;
}

Word_2k::CharactersPtr __fastcall TWordDocument::get_Characters(void)
{
  Word_2k::CharactersPtr prop;
  OLECHECK(GetDefaultInterface()->get_Characters(&prop));
  return prop;
}

Word_2k::FieldsPtr __fastcall TWordDocument::get_Fields(void)
{
  Word_2k::FieldsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Fields(&prop));
  return prop;
}

Word_2k::FormFieldsPtr __fastcall TWordDocument::get_FormFields(void)
{
  Word_2k::FormFieldsPtr prop;
  OLECHECK(GetDefaultInterface()->get_FormFields(&prop));
  return prop;
}

Word_2k::StylesPtr __fastcall TWordDocument::get_Styles(void)
{
  Word_2k::StylesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Styles(&prop));
  return prop;
}

Word_2k::FramesPtr __fastcall TWordDocument::get_Frames(void)
{
  Word_2k::FramesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Frames(&prop));
  return prop;
}

Word_2k::TablesOfFiguresPtr __fastcall TWordDocument::get_TablesOfFigures(void)
{
  Word_2k::TablesOfFiguresPtr prop;
  OLECHECK(GetDefaultInterface()->get_TablesOfFigures(&prop));
  return prop;
}

Word_2k::VariablesPtr __fastcall TWordDocument::get_Variables(void)
{
  Word_2k::VariablesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Variables(&prop));
  return prop;
}

Word_2k::MailMergePtr __fastcall TWordDocument::get_MailMerge(void)
{
  Word_2k::MailMergePtr prop;
  OLECHECK(GetDefaultInterface()->get_MailMerge(&prop));
  return prop;
}

Word_2k::EnvelopePtr __fastcall TWordDocument::get_Envelope(void)
{
  Word_2k::EnvelopePtr prop;
  OLECHECK(GetDefaultInterface()->get_Envelope(&prop));
  return prop;
}

BSTR __fastcall TWordDocument::get_FullName(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_FullName((BSTR*)&prop));
  return prop;
}

Word_2k::RevisionsPtr __fastcall TWordDocument::get_Revisions(void)
{
  Word_2k::RevisionsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Revisions(&prop));
  return prop;
}

Word_2k::TablesOfContentsPtr __fastcall TWordDocument::get_TablesOfContents(void)
{
  Word_2k::TablesOfContentsPtr prop;
  OLECHECK(GetDefaultInterface()->get_TablesOfContents(&prop));
  return prop;
}

Word_2k::TablesOfAuthoritiesPtr __fastcall TWordDocument::get_TablesOfAuthorities(void)
{
  Word_2k::TablesOfAuthoritiesPtr prop;
  OLECHECK(GetDefaultInterface()->get_TablesOfAuthorities(&prop));
  return prop;
}

Word_2k::PageSetupPtr __fastcall TWordDocument::get_PageSetup(void)
{
  Word_2k::PageSetupPtr prop;
  OLECHECK(GetDefaultInterface()->get_PageSetup(&prop));
  return prop;
}

void __fastcall TWordDocument::set_PageSetup(Word_2k::PageSetupPtr prop/*[in]*/)
{
  GetDefaultInterface()->set_PageSetup(prop/*[in]*/);
}

Word_2k::WindowsPtr __fastcall TWordDocument::get_Windoz(void)
{
  Word_2k::WindowsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Windoz(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_HasRoutingSlip(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_HasRoutingSlip((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_HasRoutingSlip(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_HasRoutingSlip(prop/*[in]*/);
}

Word_2k::RoutingSlipPtr __fastcall TWordDocument::get_RoutingSlip(void)
{
  Word_2k::RoutingSlipPtr prop;
  OLECHECK(GetDefaultInterface()->get_RoutingSlip(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_Routed(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_Routed((VARIANT_BOOL*)&prop));
  return prop;
}

Word_2k::TablesOfAuthoritiesCategoriesPtr __fastcall TWordDocument::get_TablesOfAuthoritiesCategories(void)
{
  Word_2k::TablesOfAuthoritiesCategoriesPtr prop;
  OLECHECK(GetDefaultInterface()->get_TablesOfAuthoritiesCategories(&prop));
  return prop;
}

Word_2k::IndexesPtr __fastcall TWordDocument::get_Indexes(void)
{
  Word_2k::IndexesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Indexes(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_Saved(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_Saved(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_Saved(prop/*[in]*/);
}

Word_2k::WordRangePtr __fastcall TWordDocument::get_Content(void)
{
  Word_2k::WordRangePtr prop;
  OLECHECK(GetDefaultInterface()->get_Content(&prop));
  return prop;
}

Word_2k::WINDOWPtr __fastcall TWordDocument::get_ActiveWindow(void)
{
  Word_2k::WINDOWPtr prop;
  OLECHECK(GetDefaultInterface()->get_ActiveWindow(&prop));
  return prop;
}

Word_2k::WdDocumentKind __fastcall TWordDocument::get_Kind(void)
{
  Word_2k::WdDocumentKind prop;
  OLECHECK(GetDefaultInterface()->get_Kind((Word_2k::WdDocumentKind*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_Kind(Word_2k::WdDocumentKind prop/*[in]*/)
{
  GetDefaultInterface()->set_Kind(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_ReadOnly(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_ReadOnly((VARIANT_BOOL*)&prop));
  return prop;
}

Word_2k::SubdocumentsPtr __fastcall TWordDocument::get_Subdocuments(void)
{
  Word_2k::SubdocumentsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Subdocuments(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_IsMasterDocument(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_IsMasterDocument((VARIANT_BOOL*)&prop));
  return prop;
}

float __fastcall TWordDocument::get_DefaultTabStop(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_DefaultTabStop((float*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_DefaultTabStop(float prop/*[in]*/)
{
  GetDefaultInterface()->set_DefaultTabStop(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_EmbedTrueTypeFonts(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_EmbedTrueTypeFonts((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_EmbedTrueTypeFonts(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_EmbedTrueTypeFonts(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_SaveFormsData(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_SaveFormsData((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_SaveFormsData(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_SaveFormsData(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_ReadOnlyRecommended(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_ReadOnlyRecommended((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_ReadOnlyRecommended(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_ReadOnlyRecommended(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_SaveSubsetFonts(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_SaveSubsetFonts((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_SaveSubsetFonts(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_SaveSubsetFonts(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_Compatibility(Word_2k::WdCompatibility Type/*[in]*/)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_Compatibility(Type, (VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_Compatibility(Word_2k::WdCompatibility Type/*[in]*/, 
                                                 VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_Compatibility(Type/*[in]*/, prop/*[in]*/);
}

Word_2k::StoryRangesPtr __fastcall TWordDocument::get_StoryRanges(void)
{
  Word_2k::StoryRangesPtr prop;
  OLECHECK(GetDefaultInterface()->get_StoryRanges(&prop));
  return prop;
}

Office_2k::CommandBarsPtr __fastcall TWordDocument::get_CommandBars(void)
{
  Office_2k::CommandBarsPtr prop;
  OLECHECK(GetDefaultInterface()->get_CommandBars(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_IsSubdocument(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_IsSubdocument((VARIANT_BOOL*)&prop));
  return prop;
}

long __fastcall TWordDocument::get_SaveFormat(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_SaveFormat((long*)&prop));
  return prop;
}

Word_2k::WdProtectionType __fastcall TWordDocument::get_ProtectionType(void)
{
  Word_2k::WdProtectionType prop;
  OLECHECK(GetDefaultInterface()->get_ProtectionType((Word_2k::WdProtectionType*)&prop));
  return prop;
}

Word_2k::HyperlinksPtr __fastcall TWordDocument::get_Hyperlinks(void)
{
  Word_2k::HyperlinksPtr prop;
  OLECHECK(GetDefaultInterface()->get_Hyperlinks(&prop));
  return prop;
}

Word_2k::ShapesPtr __fastcall TWordDocument::get_Shapes(void)
{
  Word_2k::ShapesPtr prop;
  OLECHECK(GetDefaultInterface()->get_Shapes(&prop));
  return prop;
}

Word_2k::ListTemplatesPtr __fastcall TWordDocument::get_ListTemplates(void)
{
  Word_2k::ListTemplatesPtr prop;
  OLECHECK(GetDefaultInterface()->get_ListTemplates(&prop));
  return prop;
}

Word_2k::ListsPtr __fastcall TWordDocument::get_Lists(void)
{
  Word_2k::ListsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Lists(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_UpdateStylesOnOpen(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_UpdateStylesOnOpen((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_UpdateStylesOnOpen(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_UpdateStylesOnOpen(prop/*[in]*/);
}

VARIANT __fastcall TWordDocument::get_AttachedTemplate(void)
{
  VARIANT prop;
  OLECHECK(GetDefaultInterface()->get_AttachedTemplate((VARIANT*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_AttachedTemplate(VARIANT* prop/*[in]*/)
{
  GetDefaultInterface()->set_AttachedTemplate(prop/*[in]*/);
}

Word_2k::InlineShapesPtr __fastcall TWordDocument::get_InlineShapes(void)
{
  Word_2k::InlineShapesPtr prop;
  OLECHECK(GetDefaultInterface()->get_InlineShapes(&prop));
  return prop;
}

Word_2k::ShapePtr __fastcall TWordDocument::get_Background(void)
{
  Word_2k::ShapePtr prop;
  OLECHECK(GetDefaultInterface()->get_Background(&prop));
  return prop;
}

void __fastcall TWordDocument::set_Background(Word_2k::ShapePtr prop/*[in]*/)
{
  GetDefaultInterface()->set_Background(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_GrammarChecked(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_GrammarChecked((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_GrammarChecked(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_GrammarChecked(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_SpellingChecked(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_SpellingChecked((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_SpellingChecked(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_SpellingChecked(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_ShowGrammaticalErrors(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_ShowGrammaticalErrors((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_ShowGrammaticalErrors(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_ShowGrammaticalErrors(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_ShowSpellingErrors(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_ShowSpellingErrors((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_ShowSpellingErrors(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_ShowSpellingErrors(prop/*[in]*/);
}

Word_2k::VersionsPtr __fastcall TWordDocument::get_Versions(void)
{
  Word_2k::VersionsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Versions(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_ShowSummary(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_ShowSummary((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_ShowSummary(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_ShowSummary(prop/*[in]*/);
}

Word_2k::WdSummaryMode __fastcall TWordDocument::get_SummaryViewMode(void)
{
  Word_2k::WdSummaryMode prop;
  OLECHECK(GetDefaultInterface()->get_SummaryViewMode((Word_2k::WdSummaryMode*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_SummaryViewMode(Word_2k::WdSummaryMode prop/*[in]*/)
{
  GetDefaultInterface()->set_SummaryViewMode(prop/*[in]*/);
}

long __fastcall TWordDocument::get_SummaryLength(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_SummaryLength((long*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_SummaryLength(long prop/*[in]*/)
{
  GetDefaultInterface()->set_SummaryLength(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_PrintFractionalWidths(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_PrintFractionalWidths((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_PrintFractionalWidths(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_PrintFractionalWidths(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_PrintPostScriptOverText(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_PrintPostScriptOverText((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_PrintPostScriptOverText(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_PrintPostScriptOverText(prop/*[in]*/);
}

LPDISPATCH __fastcall TWordDocument::get_Container(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_Container((LPDISPATCH*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_PrintFormsData(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_PrintFormsData((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_PrintFormsData(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_PrintFormsData(prop/*[in]*/);
}

Word_2k::ListParagraphsPtr __fastcall TWordDocument::get_ListParagraphs(void)
{
  Word_2k::ListParagraphsPtr prop;
  OLECHECK(GetDefaultInterface()->get_ListParagraphs(&prop));
  return prop;
}

void __fastcall TWordDocument::set_Password(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_Password(Param1/*[in]*/);
}

void __fastcall TWordDocument::set_WritePassword(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_WritePassword(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_HasPassword(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_HasPassword((VARIANT_BOOL*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_WriteReserved(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_WriteReserved((VARIANT_BOOL*)&prop));
  return prop;
}

BSTR __fastcall TWordDocument::get_ActiveWritingStyle(VARIANT* LanguageID/*[in]*/)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_ActiveWritingStyle(LanguageID, (BSTR*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_ActiveWritingStyle(VARIANT* LanguageID/*[in]*/, BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_ActiveWritingStyle(LanguageID/*[in]*/, prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_UserControl(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_UserControl((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_UserControl(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_UserControl(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_HasMailer(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_HasMailer((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_HasMailer(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_HasMailer(prop/*[in]*/);
}

Word_2k::MailerPtr __fastcall TWordDocument::get_Mailer(void)
{
  Word_2k::MailerPtr prop;
  OLECHECK(GetDefaultInterface()->get_Mailer(&prop));
  return prop;
}

Word_2k::ReadabilityStatisticsPtr __fastcall TWordDocument::get_ReadabilityStatistics(void)
{
  Word_2k::ReadabilityStatisticsPtr prop;
  OLECHECK(GetDefaultInterface()->get_ReadabilityStatistics(&prop));
  return prop;
}

Word_2k::ProofreadingErrorsPtr __fastcall TWordDocument::get_GrammaticalErrors(void)
{
  Word_2k::ProofreadingErrorsPtr prop;
  OLECHECK(GetDefaultInterface()->get_GrammaticalErrors(&prop));
  return prop;
}

Word_2k::ProofreadingErrorsPtr __fastcall TWordDocument::get_SpellingErrors(void)
{
  Word_2k::ProofreadingErrorsPtr prop;
  OLECHECK(GetDefaultInterface()->get_SpellingErrors(&prop));
  return prop;
}

Vbide_2k::VBProjectPtr __fastcall TWordDocument::get_VBProject(void)
{
  Vbide_2k::VBProjectPtr prop;
  OLECHECK(GetDefaultInterface()->get_VBProject(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_FormsDesign(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_FormsDesign((VARIANT_BOOL*)&prop));
  return prop;
}

BSTR __fastcall TWordDocument::get__CodeName(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get__CodeName((BSTR*)&prop));
  return prop;
}

void __fastcall TWordDocument::set__CodeName(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set__CodeName(prop/*[in]*/);
}

BSTR __fastcall TWordDocument::get_CodeName(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_CodeName((BSTR*)&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_SnapToGrid(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_SnapToGrid((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_SnapToGrid(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_SnapToGrid(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_SnapToShapes(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_SnapToShapes((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_SnapToShapes(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_SnapToShapes(prop/*[in]*/);
}

float __fastcall TWordDocument::get_GridDistanceHorizontal(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_GridDistanceHorizontal((float*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_GridDistanceHorizontal(float prop/*[in]*/)
{
  GetDefaultInterface()->set_GridDistanceHorizontal(prop/*[in]*/);
}

float __fastcall TWordDocument::get_GridDistanceVertical(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_GridDistanceVertical((float*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_GridDistanceVertical(float prop/*[in]*/)
{
  GetDefaultInterface()->set_GridDistanceVertical(prop/*[in]*/);
}

float __fastcall TWordDocument::get_GridOriginHorizontal(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_GridOriginHorizontal((float*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_GridOriginHorizontal(float prop/*[in]*/)
{
  GetDefaultInterface()->set_GridOriginHorizontal(prop/*[in]*/);
}

float __fastcall TWordDocument::get_GridOriginVertical(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_GridOriginVertical((float*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_GridOriginVertical(float prop/*[in]*/)
{
  GetDefaultInterface()->set_GridOriginVertical(prop/*[in]*/);
}

long __fastcall TWordDocument::get_GridSpaceBetweenHorizontalLines(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_GridSpaceBetweenHorizontalLines((long*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_GridSpaceBetweenHorizontalLines(long prop/*[in]*/)
{
  GetDefaultInterface()->set_GridSpaceBetweenHorizontalLines(prop/*[in]*/);
}

long __fastcall TWordDocument::get_GridSpaceBetweenVerticalLines(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_GridSpaceBetweenVerticalLines((long*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_GridSpaceBetweenVerticalLines(long prop/*[in]*/)
{
  GetDefaultInterface()->set_GridSpaceBetweenVerticalLines(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_GridOriginFromMargin(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_GridOriginFromMargin((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_GridOriginFromMargin(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_GridOriginFromMargin(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_KerningByAlgorithm(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_KerningByAlgorithm((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_KerningByAlgorithm(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_KerningByAlgorithm(prop/*[in]*/);
}

Word_2k::WdJustificationMode __fastcall TWordDocument::get_JustificationMode(void)
{
  Word_2k::WdJustificationMode prop;
  OLECHECK(GetDefaultInterface()->get_JustificationMode((Word_2k::WdJustificationMode*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_JustificationMode(Word_2k::WdJustificationMode prop/*[in]*/)
{
  GetDefaultInterface()->set_JustificationMode(prop/*[in]*/);
}

Word_2k::WdFarEastLineBreakLevel __fastcall TWordDocument::get_FarEastLineBreakLevel(void)
{
  Word_2k::WdFarEastLineBreakLevel prop;
  OLECHECK(GetDefaultInterface()->get_FarEastLineBreakLevel((Word_2k::WdFarEastLineBreakLevel*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_FarEastLineBreakLevel(Word_2k::WdFarEastLineBreakLevel prop/*[in]*/)
{
  GetDefaultInterface()->set_FarEastLineBreakLevel(prop/*[in]*/);
}

BSTR __fastcall TWordDocument::get_NoLineBreakBefore(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_NoLineBreakBefore((BSTR*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_NoLineBreakBefore(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_NoLineBreakBefore(prop/*[in]*/);
}

BSTR __fastcall TWordDocument::get_NoLineBreakAfter(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_NoLineBreakAfter((BSTR*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_NoLineBreakAfter(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_NoLineBreakAfter(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_TrackRevisions(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_TrackRevisions((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_TrackRevisions(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_TrackRevisions(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_PrintRevisions(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_PrintRevisions((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_PrintRevisions(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_PrintRevisions(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_ShowRevisions(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_ShowRevisions((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_ShowRevisions(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_ShowRevisions(prop/*[in]*/);
}

BSTR __fastcall TWordDocument::get_ActiveTheme(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_ActiveTheme((BSTR*)&prop));
  return prop;
}

BSTR __fastcall TWordDocument::get_ActiveThemeDisplayName(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_ActiveThemeDisplayName((BSTR*)&prop));
  return prop;
}

Word_2k::EmailPtr __fastcall TWordDocument::get_Email(void)
{
  Word_2k::EmailPtr prop;
  OLECHECK(GetDefaultInterface()->get_Email(&prop));
  return prop;
}

Office_2k::ScriptsPtr __fastcall TWordDocument::get_Scripts(void)
{
  Office_2k::ScriptsPtr prop;
  OLECHECK(GetDefaultInterface()->get_Scripts(&prop));
  return prop;
}

VARIANT_BOOL __fastcall TWordDocument::get_LanguageDetected(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_LanguageDetected((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_LanguageDetected(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_LanguageDetected(prop/*[in]*/);
}

Word_2k::WdFarEastLineBreakLanguageID __fastcall TWordDocument::get_FarEastLineBreakLanguage(void)
{
  Word_2k::WdFarEastLineBreakLanguageID prop;
  OLECHECK(GetDefaultInterface()->get_FarEastLineBreakLanguage((Word_2k::WdFarEastLineBreakLanguageID*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_FarEastLineBreakLanguage(Word_2k::WdFarEastLineBreakLanguageID prop/*[in]*/)
{
  GetDefaultInterface()->set_FarEastLineBreakLanguage(prop/*[in]*/);
}

Word_2k::FramesetPtr __fastcall TWordDocument::get_Frameset(void)
{
  Word_2k::FramesetPtr prop;
  OLECHECK(GetDefaultInterface()->get_Frameset(&prop));
  return prop;
}

VARIANT __fastcall TWordDocument::get_ClickAndTypeParagraphStyle(void)
{
  VARIANT prop;
  OLECHECK(GetDefaultInterface()->get_ClickAndTypeParagraphStyle((VARIANT*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_ClickAndTypeParagraphStyle(VARIANT* prop/*[in]*/)
{
  GetDefaultInterface()->set_ClickAndTypeParagraphStyle(prop/*[in]*/);
}

Office_2k::HTMLProjectPtr __fastcall TWordDocument::get_HTMLProject(void)
{
  Office_2k::HTMLProjectPtr prop;
  OLECHECK(GetDefaultInterface()->get_HTMLProject(&prop));
  return prop;
}

Word_2k::WebOptionsPtr __fastcall TWordDocument::get_WebOptions(void)
{
  Word_2k::WebOptionsPtr prop;
  OLECHECK(GetDefaultInterface()->get_WebOptions(&prop));
  return prop;
}

Office_2k::MsoEncoding __fastcall TWordDocument::get_OpenEncoding(void)
{
  Office_2k::MsoEncoding prop;
  OLECHECK(GetDefaultInterface()->get_OpenEncoding((Office_2k::MsoEncoding*)&prop));
  return prop;
}

Office_2k::MsoEncoding __fastcall TWordDocument::get_SaveEncoding(void)
{
  Office_2k::MsoEncoding prop;
  OLECHECK(GetDefaultInterface()->get_SaveEncoding((Office_2k::MsoEncoding*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_SaveEncoding(Office_2k::MsoEncoding prop/*[in]*/)
{
  GetDefaultInterface()->set_SaveEncoding(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_OptimizeForWord97(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_OptimizeForWord97((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordDocument::set_OptimizeForWord97(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_OptimizeForWord97(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordDocument::get_VBASigned(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_VBASigned((VARIANT_BOOL*)&prop));
  return prop;
}

_FontPtr& TWordFont::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TWordFont::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TWordFont::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TWordFont::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TWordFont::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TWordFont::ConnectTo(_FontPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TWordFont::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_WordFont;
  sd.IntfIID = __uuidof(_Font);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

void __fastcall TWordFont::Grow(void)
{
  GetDefaultInterface()->Grow();
}

void __fastcall TWordFont::Shrink(void)
{
  GetDefaultInterface()->Shrink();
}

void __fastcall TWordFont::Reset(void)
{
  GetDefaultInterface()->Reset();
}

void __fastcall TWordFont::SetAsTemplateDefault(void)
{
  GetDefaultInterface()->SetAsTemplateDefault();
}

Word_2k::WordApplicationPtr __fastcall TWordFont::get_Application(void)
{
  Word_2k::WordApplicationPtr prop;
  OLECHECK(GetDefaultInterface()->get_Application(&prop));
  return prop;
}

long __fastcall TWordFont::get_Creator(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Creator((long*)&prop));
  return prop;
}

LPDISPATCH __fastcall TWordFont::get_Parent(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&prop));
  return prop;
}

Word_2k::WordFontPtr __fastcall TWordFont::get_Duplicate(void)
{
  Word_2k::WordFontPtr prop;
  OLECHECK(GetDefaultInterface()->get_Duplicate(&prop));
  return prop;
}

long __fastcall TWordFont::get_Bold(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Bold((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Bold(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Bold(prop/*[in]*/);
}

long __fastcall TWordFont::get_Italic(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Italic((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Italic(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Italic(prop/*[in]*/);
}

long __fastcall TWordFont::get_Hidden(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Hidden((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Hidden(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Hidden(prop/*[in]*/);
}

long __fastcall TWordFont::get_SmallCaps(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_SmallCaps((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_SmallCaps(long prop/*[in]*/)
{
  GetDefaultInterface()->set_SmallCaps(prop/*[in]*/);
}

long __fastcall TWordFont::get_AllCaps(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_AllCaps((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_AllCaps(long prop/*[in]*/)
{
  GetDefaultInterface()->set_AllCaps(prop/*[in]*/);
}

long __fastcall TWordFont::get_StrikeThrough(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_StrikeThrough((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_StrikeThrough(long prop/*[in]*/)
{
  GetDefaultInterface()->set_StrikeThrough(prop/*[in]*/);
}

long __fastcall TWordFont::get_DoubleStrikeThrough(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_DoubleStrikeThrough((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_DoubleStrikeThrough(long prop/*[in]*/)
{
  GetDefaultInterface()->set_DoubleStrikeThrough(prop/*[in]*/);
}

Word_2k::WdColorIndex __fastcall TWordFont::get_ColorIndex(void)
{
  Word_2k::WdColorIndex prop;
  OLECHECK(GetDefaultInterface()->get_ColorIndex((Word_2k::WdColorIndex*)&prop));
  return prop;
}

void __fastcall TWordFont::set_ColorIndex(Word_2k::WdColorIndex prop/*[in]*/)
{
  GetDefaultInterface()->set_ColorIndex(prop/*[in]*/);
}

long __fastcall TWordFont::get_Subscript(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Subscript((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Subscript(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Subscript(prop/*[in]*/);
}

long __fastcall TWordFont::get_Superscript(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Superscript((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Superscript(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Superscript(prop/*[in]*/);
}

Word_2k::WdUnderline __fastcall TWordFont::get_Underline(void)
{
  Word_2k::WdUnderline prop;
  OLECHECK(GetDefaultInterface()->get_Underline((Word_2k::WdUnderline*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Underline(Word_2k::WdUnderline prop/*[in]*/)
{
  GetDefaultInterface()->set_Underline(prop/*[in]*/);
}

float __fastcall TWordFont::get_Size(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_Size((float*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Size(float prop/*[in]*/)
{
  GetDefaultInterface()->set_Size(prop/*[in]*/);
}

BSTR __fastcall TWordFont::get_Name(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Name(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_Name(prop/*[in]*/);
}

long __fastcall TWordFont::get_Position(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Position((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Position(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Position(prop/*[in]*/);
}

float __fastcall TWordFont::get_Spacing(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_Spacing((float*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Spacing(float prop/*[in]*/)
{
  GetDefaultInterface()->set_Spacing(prop/*[in]*/);
}

long __fastcall TWordFont::get_Scaling(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Scaling((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Scaling(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Scaling(prop/*[in]*/);
}

long __fastcall TWordFont::get_Shadow(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Shadow((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Shadow(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Shadow(prop/*[in]*/);
}

long __fastcall TWordFont::get_Outline(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Outline((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Outline(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Outline(prop/*[in]*/);
}

long __fastcall TWordFont::get_Emboss(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Emboss((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Emboss(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Emboss(prop/*[in]*/);
}

float __fastcall TWordFont::get_Kerning(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_Kerning((float*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Kerning(float prop/*[in]*/)
{
  GetDefaultInterface()->set_Kerning(prop/*[in]*/);
}

long __fastcall TWordFont::get_Engrave(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Engrave((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Engrave(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Engrave(prop/*[in]*/);
}

Word_2k::WdAnimation __fastcall TWordFont::get_Animation(void)
{
  Word_2k::WdAnimation prop;
  OLECHECK(GetDefaultInterface()->get_Animation((Word_2k::WdAnimation*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Animation(Word_2k::WdAnimation prop/*[in]*/)
{
  GetDefaultInterface()->set_Animation(prop/*[in]*/);
}

Word_2k::BordersPtr __fastcall TWordFont::get_Borders(void)
{
  Word_2k::BordersPtr prop;
  OLECHECK(GetDefaultInterface()->get_Borders(&prop));
  return prop;
}

void __fastcall TWordFont::set_Borders(Word_2k::BordersPtr prop/*[in]*/)
{
  GetDefaultInterface()->set_Borders(prop/*[in]*/);
}

Word_2k::ShadingPtr __fastcall TWordFont::get_Shading(void)
{
  Word_2k::ShadingPtr prop;
  OLECHECK(GetDefaultInterface()->get_Shading(&prop));
  return prop;
}

Word_2k::WdEmphasisMark __fastcall TWordFont::get_EmphasisMark(void)
{
  Word_2k::WdEmphasisMark prop;
  OLECHECK(GetDefaultInterface()->get_EmphasisMark((Word_2k::WdEmphasisMark*)&prop));
  return prop;
}

void __fastcall TWordFont::set_EmphasisMark(Word_2k::WdEmphasisMark prop/*[in]*/)
{
  GetDefaultInterface()->set_EmphasisMark(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordFont::get_DisableCharacterSpaceGrid(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_DisableCharacterSpaceGrid((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordFont::set_DisableCharacterSpaceGrid(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_DisableCharacterSpaceGrid(prop/*[in]*/);
}

BSTR __fastcall TWordFont::get_NameFarEast(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_NameFarEast((BSTR*)&prop));
  return prop;
}

void __fastcall TWordFont::set_NameFarEast(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_NameFarEast(prop/*[in]*/);
}

BSTR __fastcall TWordFont::get_NameAscii(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_NameAscii((BSTR*)&prop));
  return prop;
}

void __fastcall TWordFont::set_NameAscii(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_NameAscii(prop/*[in]*/);
}

BSTR __fastcall TWordFont::get_NameOther(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_NameOther((BSTR*)&prop));
  return prop;
}

void __fastcall TWordFont::set_NameOther(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_NameOther(prop/*[in]*/);
}

Word_2k::WdColor __fastcall TWordFont::get_Color(void)
{
  Word_2k::WdColor prop;
  OLECHECK(GetDefaultInterface()->get_Color((Word_2k::WdColor*)&prop));
  return prop;
}

void __fastcall TWordFont::set_Color(Word_2k::WdColor prop/*[in]*/)
{
  GetDefaultInterface()->set_Color(prop/*[in]*/);
}

long __fastcall TWordFont::get_BoldBi(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_BoldBi((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_BoldBi(long prop/*[in]*/)
{
  GetDefaultInterface()->set_BoldBi(prop/*[in]*/);
}

long __fastcall TWordFont::get_ItalicBi(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_ItalicBi((long*)&prop));
  return prop;
}

void __fastcall TWordFont::set_ItalicBi(long prop/*[in]*/)
{
  GetDefaultInterface()->set_ItalicBi(prop/*[in]*/);
}

float __fastcall TWordFont::get_SizeBi(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_SizeBi((float*)&prop));
  return prop;
}

void __fastcall TWordFont::set_SizeBi(float prop/*[in]*/)
{
  GetDefaultInterface()->set_SizeBi(prop/*[in]*/);
}

BSTR __fastcall TWordFont::get_NameBi(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_NameBi((BSTR*)&prop));
  return prop;
}

void __fastcall TWordFont::set_NameBi(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_NameBi(prop/*[in]*/);
}

Word_2k::WdColorIndex __fastcall TWordFont::get_ColorIndexBi(void)
{
  Word_2k::WdColorIndex prop;
  OLECHECK(GetDefaultInterface()->get_ColorIndexBi((Word_2k::WdColorIndex*)&prop));
  return prop;
}

void __fastcall TWordFont::set_ColorIndexBi(Word_2k::WdColorIndex prop/*[in]*/)
{
  GetDefaultInterface()->set_ColorIndexBi(prop/*[in]*/);
}

Word_2k::WdColor __fastcall TWordFont::get_DiacriticColor(void)
{
  Word_2k::WdColor prop;
  OLECHECK(GetDefaultInterface()->get_DiacriticColor((Word_2k::WdColor*)&prop));
  return prop;
}

void __fastcall TWordFont::set_DiacriticColor(Word_2k::WdColor prop/*[in]*/)
{
  GetDefaultInterface()->set_DiacriticColor(prop/*[in]*/);
}

Word_2k::WdColor __fastcall TWordFont::get_UnderlineColor(void)
{
  Word_2k::WdColor prop;
  OLECHECK(GetDefaultInterface()->get_UnderlineColor((Word_2k::WdColor*)&prop));
  return prop;
}

void __fastcall TWordFont::set_UnderlineColor(Word_2k::WdColor prop/*[in]*/)
{
  GetDefaultInterface()->set_UnderlineColor(prop/*[in]*/);
}

_ParagraphFormatPtr& TWordParagraphFormat::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TWordParagraphFormat::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TWordParagraphFormat::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TWordParagraphFormat::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TWordParagraphFormat::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TWordParagraphFormat::ConnectTo(_ParagraphFormatPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TWordParagraphFormat::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_WordParagraphFormat;
  sd.IntfIID = __uuidof(_ParagraphFormat);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

void __fastcall TWordParagraphFormat::CloseUp(void)
{
  GetDefaultInterface()->CloseUp();
}

void __fastcall TWordParagraphFormat::OpenUp(void)
{
  GetDefaultInterface()->OpenUp();
}

void __fastcall TWordParagraphFormat::OpenOrCloseUp(void)
{
  GetDefaultInterface()->OpenOrCloseUp();
}

void __fastcall TWordParagraphFormat::TabHangingIndent(short Count/*[in]*/)
{
  GetDefaultInterface()->TabHangingIndent(Count/*[in]*/);
}

void __fastcall TWordParagraphFormat::TabIndent(short Count/*[in]*/)
{
  GetDefaultInterface()->TabIndent(Count/*[in]*/);
}

void __fastcall TWordParagraphFormat::Reset(void)
{
  GetDefaultInterface()->Reset();
}

void __fastcall TWordParagraphFormat::Space1(void)
{
  GetDefaultInterface()->Space1();
}

void __fastcall TWordParagraphFormat::Space15(void)
{
  GetDefaultInterface()->Space15();
}

void __fastcall TWordParagraphFormat::Space2(void)
{
  GetDefaultInterface()->Space2();
}

void __fastcall TWordParagraphFormat::IndentCharWidth(short Count/*[in]*/)
{
  GetDefaultInterface()->IndentCharWidth(Count/*[in]*/);
}

void __fastcall TWordParagraphFormat::IndentFirstLineCharWidth(short Count/*[in]*/)
{
  GetDefaultInterface()->IndentFirstLineCharWidth(Count/*[in]*/);
}

Word_2k::WordApplicationPtr __fastcall TWordParagraphFormat::get_Application(void)
{
  Word_2k::WordApplicationPtr prop;
  OLECHECK(GetDefaultInterface()->get_Application(&prop));
  return prop;
}

long __fastcall TWordParagraphFormat::get_Creator(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Creator((long*)&prop));
  return prop;
}

LPDISPATCH __fastcall TWordParagraphFormat::get_Parent(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&prop));
  return prop;
}

Word_2k::WordParagraphFormatPtr __fastcall TWordParagraphFormat::get_Duplicate(void)
{
  Word_2k::WordParagraphFormatPtr prop;
  OLECHECK(GetDefaultInterface()->get_Duplicate(&prop));
  return prop;
}

VARIANT __fastcall TWordParagraphFormat::get_Style(void)
{
  VARIANT prop;
  OLECHECK(GetDefaultInterface()->get_Style((VARIANT*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_Style(VARIANT* prop/*[in]*/)
{
  GetDefaultInterface()->set_Style(prop/*[in]*/);
}

Word_2k::WdParagraphAlignment __fastcall TWordParagraphFormat::get_Alignment(void)
{
  Word_2k::WdParagraphAlignment prop;
  OLECHECK(GetDefaultInterface()->get_Alignment((Word_2k::WdParagraphAlignment*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_Alignment(Word_2k::WdParagraphAlignment prop/*[in]*/)
{
  GetDefaultInterface()->set_Alignment(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_KeepTogether(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_KeepTogether((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_KeepTogether(long prop/*[in]*/)
{
  GetDefaultInterface()->set_KeepTogether(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_KeepWithNext(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_KeepWithNext((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_KeepWithNext(long prop/*[in]*/)
{
  GetDefaultInterface()->set_KeepWithNext(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_PageBreakBefore(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_PageBreakBefore((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_PageBreakBefore(long prop/*[in]*/)
{
  GetDefaultInterface()->set_PageBreakBefore(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_NoLineNumber(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_NoLineNumber((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_NoLineNumber(long prop/*[in]*/)
{
  GetDefaultInterface()->set_NoLineNumber(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_RightIndent(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_RightIndent((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_RightIndent(float prop/*[in]*/)
{
  GetDefaultInterface()->set_RightIndent(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_LeftIndent(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_LeftIndent((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_LeftIndent(float prop/*[in]*/)
{
  GetDefaultInterface()->set_LeftIndent(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_FirstLineIndent(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_FirstLineIndent((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_FirstLineIndent(float prop/*[in]*/)
{
  GetDefaultInterface()->set_FirstLineIndent(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_LineSpacing(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_LineSpacing((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_LineSpacing(float prop/*[in]*/)
{
  GetDefaultInterface()->set_LineSpacing(prop/*[in]*/);
}

Word_2k::WdLineSpacing __fastcall TWordParagraphFormat::get_LineSpacingRule(void)
{
  Word_2k::WdLineSpacing prop;
  OLECHECK(GetDefaultInterface()->get_LineSpacingRule((Word_2k::WdLineSpacing*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_LineSpacingRule(Word_2k::WdLineSpacing prop/*[in]*/)
{
  GetDefaultInterface()->set_LineSpacingRule(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_SpaceBefore(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_SpaceBefore((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_SpaceBefore(float prop/*[in]*/)
{
  GetDefaultInterface()->set_SpaceBefore(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_SpaceAfter(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_SpaceAfter((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_SpaceAfter(float prop/*[in]*/)
{
  GetDefaultInterface()->set_SpaceAfter(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_Hyphenation(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Hyphenation((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_Hyphenation(long prop/*[in]*/)
{
  GetDefaultInterface()->set_Hyphenation(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_WidowControl(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_WidowControl((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_WidowControl(long prop/*[in]*/)
{
  GetDefaultInterface()->set_WidowControl(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_FarEastLineBreakControl(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_FarEastLineBreakControl((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_FarEastLineBreakControl(long prop/*[in]*/)
{
  GetDefaultInterface()->set_FarEastLineBreakControl(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_WordWrap(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_WordWrap((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_WordWrap(long prop/*[in]*/)
{
  GetDefaultInterface()->set_WordWrap(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_HangingPunctuation(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_HangingPunctuation((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_HangingPunctuation(long prop/*[in]*/)
{
  GetDefaultInterface()->set_HangingPunctuation(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_HalfWidthPunctuationOnTopOfLine(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_HalfWidthPunctuationOnTopOfLine((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_HalfWidthPunctuationOnTopOfLine(long prop/*[in]*/)
{
  GetDefaultInterface()->set_HalfWidthPunctuationOnTopOfLine(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_AddSpaceBetweenFarEastAndAlpha(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_AddSpaceBetweenFarEastAndAlpha((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_AddSpaceBetweenFarEastAndAlpha(long prop/*[in]*/)
{
  GetDefaultInterface()->set_AddSpaceBetweenFarEastAndAlpha(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_AddSpaceBetweenFarEastAndDigit(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_AddSpaceBetweenFarEastAndDigit((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_AddSpaceBetweenFarEastAndDigit(long prop/*[in]*/)
{
  GetDefaultInterface()->set_AddSpaceBetweenFarEastAndDigit(prop/*[in]*/);
}

Word_2k::WdBaselineAlignment __fastcall TWordParagraphFormat::get_BaseLineAlignment(void)
{
  Word_2k::WdBaselineAlignment prop;
  OLECHECK(GetDefaultInterface()->get_BaseLineAlignment((Word_2k::WdBaselineAlignment*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_BaseLineAlignment(Word_2k::WdBaselineAlignment prop/*[in]*/)
{
  GetDefaultInterface()->set_BaseLineAlignment(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_AutoAdjustRightIndent(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_AutoAdjustRightIndent((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_AutoAdjustRightIndent(long prop/*[in]*/)
{
  GetDefaultInterface()->set_AutoAdjustRightIndent(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_DisableLineHeightGrid(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_DisableLineHeightGrid((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_DisableLineHeightGrid(long prop/*[in]*/)
{
  GetDefaultInterface()->set_DisableLineHeightGrid(prop/*[in]*/);
}

Word_2k::TabStopsPtr __fastcall TWordParagraphFormat::get_TabStops(void)
{
  Word_2k::TabStopsPtr prop;
  OLECHECK(GetDefaultInterface()->get_TabStops(&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_TabStops(Word_2k::TabStopsPtr prop/*[in]*/)
{
  GetDefaultInterface()->set_TabStops(prop/*[in]*/);
}

Word_2k::BordersPtr __fastcall TWordParagraphFormat::get_Borders(void)
{
  Word_2k::BordersPtr prop;
  OLECHECK(GetDefaultInterface()->get_Borders(&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_Borders(Word_2k::BordersPtr prop/*[in]*/)
{
  GetDefaultInterface()->set_Borders(prop/*[in]*/);
}

Word_2k::ShadingPtr __fastcall TWordParagraphFormat::get_Shading(void)
{
  Word_2k::ShadingPtr prop;
  OLECHECK(GetDefaultInterface()->get_Shading(&prop));
  return prop;
}

Word_2k::WdOutlineLevel __fastcall TWordParagraphFormat::get_OutlineLevel(void)
{
  Word_2k::WdOutlineLevel prop;
  OLECHECK(GetDefaultInterface()->get_OutlineLevel((Word_2k::WdOutlineLevel*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_OutlineLevel(Word_2k::WdOutlineLevel prop/*[in]*/)
{
  GetDefaultInterface()->set_OutlineLevel(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_CharacterUnitRightIndent(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_CharacterUnitRightIndent((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_CharacterUnitRightIndent(float prop/*[in]*/)
{
  GetDefaultInterface()->set_CharacterUnitRightIndent(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_CharacterUnitLeftIndent(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_CharacterUnitLeftIndent((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_CharacterUnitLeftIndent(float prop/*[in]*/)
{
  GetDefaultInterface()->set_CharacterUnitLeftIndent(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_CharacterUnitFirstLineIndent(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_CharacterUnitFirstLineIndent((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_CharacterUnitFirstLineIndent(float prop/*[in]*/)
{
  GetDefaultInterface()->set_CharacterUnitFirstLineIndent(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_LineUnitBefore(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_LineUnitBefore((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_LineUnitBefore(float prop/*[in]*/)
{
  GetDefaultInterface()->set_LineUnitBefore(prop/*[in]*/);
}

float __fastcall TWordParagraphFormat::get_LineUnitAfter(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_LineUnitAfter((float*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_LineUnitAfter(float prop/*[in]*/)
{
  GetDefaultInterface()->set_LineUnitAfter(prop/*[in]*/);
}

Word_2k::WdReadingOrder __fastcall TWordParagraphFormat::get_ReadingOrder(void)
{
  Word_2k::WdReadingOrder prop;
  OLECHECK(GetDefaultInterface()->get_ReadingOrder((Word_2k::WdReadingOrder*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_ReadingOrder(Word_2k::WdReadingOrder prop/*[in]*/)
{
  GetDefaultInterface()->set_ReadingOrder(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_SpaceBeforeAuto(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_SpaceBeforeAuto((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_SpaceBeforeAuto(long prop/*[in]*/)
{
  GetDefaultInterface()->set_SpaceBeforeAuto(prop/*[in]*/);
}

long __fastcall TWordParagraphFormat::get_SpaceAfterAuto(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_SpaceAfterAuto((long*)&prop));
  return prop;
}

void __fastcall TWordParagraphFormat::set_SpaceAfterAuto(long prop/*[in]*/)
{
  GetDefaultInterface()->set_SpaceAfterAuto(prop/*[in]*/);
}

_LetterContentPtr& TWordLetterContent::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TWordLetterContent::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TWordLetterContent::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TWordLetterContent::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TWordLetterContent::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TWordLetterContent::ConnectTo(_LetterContentPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TWordLetterContent::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_WordLetterContent;
  sd.IntfIID = __uuidof(_LetterContent);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

Word_2k::WordApplicationPtr __fastcall TWordLetterContent::get_Application(void)
{
  Word_2k::WordApplicationPtr prop;
  OLECHECK(GetDefaultInterface()->get_Application(&prop));
  return prop;
}

long __fastcall TWordLetterContent::get_Creator(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_Creator((long*)&prop));
  return prop;
}

LPDISPATCH __fastcall TWordLetterContent::get_Parent(void)
{
  LPDISPATCH prop;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&prop));
  return prop;
}

Word_2k::WordLetterContentPtr __fastcall TWordLetterContent::get_Duplicate(void)
{
  Word_2k::WordLetterContentPtr prop;
  OLECHECK(GetDefaultInterface()->get_Duplicate(&prop));
  return prop;
}

BSTR __fastcall TWordLetterContent::get_DateFormat(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_DateFormat((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_DateFormat(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_DateFormat(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordLetterContent::get_IncludeHeaderFooter(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_IncludeHeaderFooter((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_IncludeHeaderFooter(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_IncludeHeaderFooter(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_PageDesign(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_PageDesign((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_PageDesign(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_PageDesign(prop/*[in]*/);
}

Word_2k::WdLetterStyle __fastcall TWordLetterContent::get_LetterStyle(void)
{
  Word_2k::WdLetterStyle prop;
  OLECHECK(GetDefaultInterface()->get_LetterStyle((Word_2k::WdLetterStyle*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_LetterStyle(Word_2k::WdLetterStyle prop/*[in]*/)
{
  GetDefaultInterface()->set_LetterStyle(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordLetterContent::get_Letterhead(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_Letterhead((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_Letterhead(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_Letterhead(prop/*[in]*/);
}

Word_2k::WdLetterheadLocation __fastcall TWordLetterContent::get_LetterheadLocation(void)
{
  Word_2k::WdLetterheadLocation prop;
  OLECHECK(GetDefaultInterface()->get_LetterheadLocation((Word_2k::WdLetterheadLocation*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_LetterheadLocation(Word_2k::WdLetterheadLocation prop/*[in]*/)
{
  GetDefaultInterface()->set_LetterheadLocation(prop/*[in]*/);
}

float __fastcall TWordLetterContent::get_LetterheadSize(void)
{
  float prop;
  OLECHECK(GetDefaultInterface()->get_LetterheadSize((float*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_LetterheadSize(float prop/*[in]*/)
{
  GetDefaultInterface()->set_LetterheadSize(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_RecipientName(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_RecipientName((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_RecipientName(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_RecipientName(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_RecipientAddress(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_RecipientAddress((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_RecipientAddress(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_RecipientAddress(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_Salutation(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Salutation((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_Salutation(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_Salutation(prop/*[in]*/);
}

Word_2k::WdSalutationType __fastcall TWordLetterContent::get_SalutationType(void)
{
  Word_2k::WdSalutationType prop;
  OLECHECK(GetDefaultInterface()->get_SalutationType((Word_2k::WdSalutationType*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_SalutationType(Word_2k::WdSalutationType prop/*[in]*/)
{
  GetDefaultInterface()->set_SalutationType(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_RecipientReference(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_RecipientReference((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_RecipientReference(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_RecipientReference(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_MailingInstructions(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_MailingInstructions((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_MailingInstructions(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_MailingInstructions(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_AttentionLine(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_AttentionLine((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_AttentionLine(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_AttentionLine(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_Subject(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_Subject(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_Subject(prop/*[in]*/);
}

long __fastcall TWordLetterContent::get_EnclosureNumber(void)
{
  long prop;
  OLECHECK(GetDefaultInterface()->get_EnclosureNumber((long*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_EnclosureNumber(long prop/*[in]*/)
{
  GetDefaultInterface()->set_EnclosureNumber(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_CCList(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_CCList((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_CCList(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_CCList(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_ReturnAddress(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_ReturnAddress((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_ReturnAddress(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_ReturnAddress(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_SenderName(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_SenderName((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_SenderName(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_SenderName(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_Closing(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_Closing((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_Closing(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_Closing(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_SenderCompany(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_SenderCompany((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_SenderCompany(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_SenderCompany(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_SenderJobTitle(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_SenderJobTitle((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_SenderJobTitle(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_SenderJobTitle(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_SenderInitials(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_SenderInitials((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_SenderInitials(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_SenderInitials(prop/*[in]*/);
}

VARIANT_BOOL __fastcall TWordLetterContent::get_InfoBlock(void)
{
  VARIANT_BOOL prop;
  OLECHECK(GetDefaultInterface()->get_InfoBlock((VARIANT_BOOL*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_InfoBlock(VARIANT_BOOL prop/*[in]*/)
{
  GetDefaultInterface()->set_InfoBlock(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_RecipientCode(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_RecipientCode((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_RecipientCode(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_RecipientCode(prop/*[in]*/);
}

Word_2k::WdSalutationGender __fastcall TWordLetterContent::get_RecipientGender(void)
{
  Word_2k::WdSalutationGender prop;
  OLECHECK(GetDefaultInterface()->get_RecipientGender((Word_2k::WdSalutationGender*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_RecipientGender(Word_2k::WdSalutationGender prop/*[in]*/)
{
  GetDefaultInterface()->set_RecipientGender(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_ReturnAddressShortForm(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_ReturnAddressShortForm((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_ReturnAddressShortForm(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_ReturnAddressShortForm(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_SenderCity(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_SenderCity((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_SenderCity(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_SenderCity(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_SenderCode(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_SenderCode((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_SenderCode(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_SenderCode(prop/*[in]*/);
}

Word_2k::WdSalutationGender __fastcall TWordLetterContent::get_SenderGender(void)
{
  Word_2k::WdSalutationGender prop;
  OLECHECK(GetDefaultInterface()->get_SenderGender((Word_2k::WdSalutationGender*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_SenderGender(Word_2k::WdSalutationGender prop/*[in]*/)
{
  GetDefaultInterface()->set_SenderGender(prop/*[in]*/);
}

BSTR __fastcall TWordLetterContent::get_SenderReference(void)
{
  BSTR prop = 0;
  OLECHECK(GetDefaultInterface()->get_SenderReference((BSTR*)&prop));
  return prop;
}

void __fastcall TWordLetterContent::set_SenderReference(BSTR prop/*[in]*/)
{
  GetDefaultInterface()->set_SenderReference(prop/*[in]*/);
}


};     // namespace Word_2k


// *********************************************************************//
// The Register function is invoked by the IDE when this module is 
// installed in a Package. It provides the list of Components (including
// OCXes) implemented by this module. The following implementation
// informs the IDE of the OCX proxy classes implemented here.
// *********************************************************************//
namespace Word_2k_srvr
{

void __fastcall PACKAGE Register()
{
  // [5]
  System::Classes::TComponentClass cls_svr[] = {
                              __classid(Word_2k::TWordApplication), 
                              __classid(Word_2k::TWordDocument), 
                              __classid(Word_2k::TWordFont), 
                              __classid(Word_2k::TWordParagraphFormat), 
                              __classid(Word_2k::TWordLetterContent)
                           };
  System::Classes::RegisterComponents("Office2K", cls_svr,
                     sizeof(cls_svr)/sizeof(cls_svr[0])-1);
}

};     // namespace Word_2k_srvr
