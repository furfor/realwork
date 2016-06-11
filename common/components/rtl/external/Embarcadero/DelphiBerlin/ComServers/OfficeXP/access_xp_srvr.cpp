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
// File generated on 22/05/2012 10:26:35 from Type Library described below.

// ************************************************************************  //
// Type Lib: XP\MSACC.olb (1)
// LIBID: {4AFFC9A0-5F99-101B-AF4E-00AA003F0F07}
// LCID: 0
// Helpfile: C:\OLB\XP\vbaac10.chm 
// HelpString: Microsoft Access 10.0 Object Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v5.0 DAO, (C:\Program Files (x86)\Common Files\Microsoft Shared\DAO\dao360.dll)
//   (3) v2.2 Office, (C:\Program Files (x86)\Common Files\Microsoft Shared\Office10\MSO.DLL)
//   (4) v2.5 ADODB, (C:\Program Files (x86)\Common Files\System\ado\msado25.tlb)
//   (5) v5.3 VBIDE, (C:\Program Files (x86)\Common Files\Microsoft Shared\VBA\VBA6\VBE6EXT.OLB)
//   (6) v1.1 OWC10, (C:\Program Files (x86)\Common Files\Microsoft Shared\Web Components\10\OWC10.DLL)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'Hyperlink' renamed to 'AccessHyperlink'
//   Hint: Symbol 'Page' renamed to 'AccessPage'
//   Hint: Symbol 'Control' renamed to 'AccessControl'
//   Hint: Symbol 'Controls' renamed to 'Controls_'
//   Hint: Symbol 'Label' renamed to 'AccessLabel'
//   Hint: Symbol 'Rectangle' renamed to 'AccessRectangle'
//   Hint: Symbol 'Line' renamed to 'AccessLine'
//   Hint: Symbol 'Image' renamed to 'AccessImage'
//   Hint: Symbol 'CommandButton' renamed to 'AccessCommandButton'
//   Hint: Symbol 'OptionButton' renamed to 'AccessOptionButton'
//   Hint: Symbol 'CheckBox' renamed to 'AccessCheckBox'
//   Hint: Symbol 'OptionGroup' renamed to 'AccessOptionGroup'
//   Hint: Symbol 'BoundObjectFrame' renamed to 'AccessBoundObjectFrame'
//   Hint: Symbol 'TextBox' renamed to 'AccessTextBox'
//   Hint: Symbol 'ListBox' renamed to 'AccessListBox'
//   Hint: Symbol 'ComboBox' renamed to 'AccessComboBox'
//   Hint: Symbol 'ObjectFrame' renamed to 'AccessObjectFrame'
//   Hint: Symbol 'PageBreak' renamed to 'AccessPageBreak'
//   Hint: Symbol 'ToggleButton' renamed to 'AccessToggleButton'
//   Hint: Symbol 'PaletteButton' renamed to 'AccessPaletteButton'
//   Hint: Symbol 'SubForm' renamed to 'AccessSubForm'
//   Hint: Symbol 'SubReport' renamed to 'AccessSubReport'
//   Hint: Symbol 'CustomControl' renamed to 'AccessCustomControl'
//   Hint: Symbol 'TabControl' renamed to 'AccessTabControl'
//   Hint: Symbol 'Section' renamed to 'AccessSection'
//   Hint: Symbol 'GroupLevel' renamed to 'AccessGroupLevel'
//   Hint: Symbol 'Forms' renamed to 'Forms_'
//   Hint: Symbol 'Application' renamed to 'AccessApplication'
//   Hint: Symbol 'References' renamed to 'AccessReferences'
//   Hint: Symbol 'WebOptions' renamed to 'AccessWebOptions'
//   Hint: Symbol 'Form' renamed to 'AccessForm'
//   Hint: Symbol 'Report' renamed to 'AccessReport'
//   Hint: Symbol 'Click' renamed to '_Click'
//   Hint: Symbol 'Set' renamed to 'Set_'
// Cmdline:
//   tlibimp  -C+ -Fe_XP -CE_XP_SRVR -Ha- -Hr+ -HpsOfficeXP -Yp+ -D.\cppXP -Cv-   -HpcForm -HpcReferences -HpcReport XP\MSACC.olb
// ************************************************************************ //

#include <vcl.h>
#pragma hdrstop

#include <oleserver.hpp>
#if defined(USING_ATL)
#include <atl\atlvcl.h>
#endif

#pragma option -w-8122
#include "Access_XP_SRVR.h"

#if !defined(__PRAGMA_PACKAGE_SMART_INIT)
#define      __PRAGMA_PACKAGE_SMART_INIT
#pragma package(smart_init)
#endif

namespace Access_xp
{

_ApplicationPtr& TAccessApplication::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TAccessApplication::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TAccessApplication::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TAccessApplication::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TAccessApplication::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TAccessApplication::ConnectTo(_ApplicationPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TAccessApplication::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_AccessApplication;
  sd.IntfIID = __uuidof(_Application);
  sd.EventIID= GUID_NULL;
  ServerData = &sd;
}

void __fastcall TAccessApplication::NewCurrentDatabase(BSTR filepath/*[in]*/)
{
  GetDefaultInterface()->NewCurrentDatabase(filepath/*[in]*/);
}

void __fastcall TAccessApplication::OpenCurrentDatabaseOld(BSTR filepath/*[in]*/, 
                                                           VARIANT_BOOL Exclusive/*[in,def,opt]*/)
{
  GetDefaultInterface()->OpenCurrentDatabaseOld(filepath/*[in]*/, Exclusive/*[in,def,opt]*/);
}

VARIANT __fastcall TAccessApplication::GetOption(BSTR OptionName/*[in]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->GetOption(OptionName, (VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::SetOption(BSTR OptionName/*[in]*/, VARIANT Setting/*[in]*/)
{
  GetDefaultInterface()->SetOption(OptionName/*[in]*/, Setting/*[in]*/);
}

void __fastcall TAccessApplication::Echo(short EchoOn/*[in]*/, 
                                         BSTR bstrStatusBarText/*[in,def,opt]*/)
{
  GetDefaultInterface()->Echo(EchoOn/*[in]*/, bstrStatusBarText/*[in,def,opt]*/);
}

void __fastcall TAccessApplication::CloseCurrentDatabase(void)
{
  GetDefaultInterface()->CloseCurrentDatabase();
}

void __fastcall TAccessApplication::Quit(Access_xp::AcQuitOption Option/*[in,def,opt]*/)
{
  GetDefaultInterface()->Quit(Option/*[in,def,opt]*/);
}

VARIANT __fastcall TAccessApplication::SysCmd(Access_xp::AcSysCmdAction Action/*[in]*/, 
                                              VARIANT Argument2/*[in,opt]*/, 
                                              VARIANT Argument3/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->SysCmd(Action, Argument2, Argument3, (VARIANT*)&pRet));
  return pRet;
}

Access_xp::AccessForm* __fastcall TAccessApplication::CreateForm(VARIANT Database/*[in,opt]*/, 
                                                                 VARIANT FormTemplate/*[in,opt]*/)
{
  Access_xp::AccessForm* pRet = 0;
  OLECHECK(GetDefaultInterface()->CreateForm(Database, FormTemplate, (Access_xp::AccessForm**)&pRet));
  return pRet;
}

Access_xp::AccessReport* __fastcall TAccessApplication::CreateReport(VARIANT Database/*[in,opt]*/, 
                                                                     VARIANT ReportTemplate/*[in,opt]*/)
{
  Access_xp::AccessReport* pRet = 0;
  OLECHECK(GetDefaultInterface()->CreateReport(Database, ReportTemplate, (Access_xp::AccessReport**)&pRet));
  return pRet;
}

Access_xp::AccessControl* __fastcall TAccessApplication::CreateControl(BSTR FormName/*[in]*/, 
                                                                       Access_xp::AcControlType ControlType/*[in]*/, 
                                                                       Access_xp::AcSection Section/*[in,def,opt]*/, 
                                                                       VARIANT Parent/*[in,opt]*/, 
                                                                       VARIANT ColumnName/*[in,opt]*/, 
                                                                       VARIANT Left/*[in,opt]*/, 
                                                                       VARIANT Top/*[in,opt]*/, 
                                                                       VARIANT Width/*[in,opt]*/, 
                                                                       VARIANT Height/*[in,opt]*/)
{
  Access_xp::AccessControl* pRet = 0;
  OLECHECK(GetDefaultInterface()->CreateControl(FormName, ControlType, Section, Parent, ColumnName, 
                                                Left, Top, Width, Height, (Access_xp::AccessControl**)&pRet));
  return pRet;
}

Access_xp::AccessControl* __fastcall TAccessApplication::CreateReportControl(BSTR ReportName/*[in]*/, 
                                                                             Access_xp::AcControlType ControlType/*[in]*/, 
                                                                             Access_xp::AcSection Section/*[in,def,opt]*/, 
                                                                             VARIANT Parent/*[in,opt]*/, 
                                                                             VARIANT ColumnName/*[in,opt]*/, 
                                                                             VARIANT Left/*[in,opt]*/, 
                                                                             VARIANT Top/*[in,opt]*/, 
                                                                             VARIANT Width/*[in,opt]*/, 
                                                                             VARIANT Height/*[in,opt]*/)
{
  Access_xp::AccessControl* pRet = 0;
  OLECHECK(GetDefaultInterface()->CreateReportControl(ReportName, ControlType, Section, Parent, 
                                                      ColumnName, Left, Top, Width, Height, (Access_xp::AccessControl**)&pRet));
  return pRet;
}

Access_xp::AccessControl* __fastcall TAccessApplication::CreateControlEx(BSTR FormName/*[in]*/, 
                                                                         Access_xp::AcControlType ControlType/*[in]*/, 
                                                                         Access_xp::AcSection Section/*[in]*/, 
                                                                         BSTR Parent/*[in]*/, 
                                                                         BSTR ControlSource/*[in]*/, 
                                                                         long Left/*[in]*/, 
                                                                         long Top/*[in]*/, 
                                                                         long Width/*[in]*/, 
                                                                         long Height/*[in]*/)
{
  Access_xp::AccessControl* pRet = 0;
  OLECHECK(GetDefaultInterface()->CreateControlEx(FormName, ControlType, Section, Parent, 
                                                  ControlSource, Left, Top, Width, Height, (Access_xp::AccessControl**)&pRet));
  return pRet;
}

Access_xp::AccessControl* __fastcall TAccessApplication::CreateReportControlEx(BSTR ReportName/*[in]*/, 
                                                                               Access_xp::AcControlType ControlType/*[in]*/, 
                                                                               Access_xp::AcSection Section/*[in]*/, 
                                                                               BSTR Parent/*[in]*/, 
                                                                               BSTR ControlName/*[in]*/, 
                                                                               long Left/*[in]*/, 
                                                                               long Top/*[in]*/, 
                                                                               long Width/*[in]*/, 
                                                                               long Height/*[in]*/)
{
  Access_xp::AccessControl* pRet = 0;
  OLECHECK(GetDefaultInterface()->CreateReportControlEx(ReportName, ControlType, Section, Parent, 
                                                        ControlName, Left, Top, Width, Height, (Access_xp::AccessControl**)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::DeleteControl(BSTR FormName/*[in]*/, BSTR ControlName/*[in]*/)
{
  GetDefaultInterface()->DeleteControl(FormName/*[in]*/, ControlName/*[in]*/);
}

void __fastcall TAccessApplication::DeleteReportControl(BSTR ReportName/*[in]*/, 
                                                        BSTR ControlName/*[in]*/)
{
  GetDefaultInterface()->DeleteReportControl(ReportName/*[in]*/, ControlName/*[in]*/);
}

long __fastcall TAccessApplication::CreateGroupLevel(BSTR ReportName/*[in]*/, 
                                                     BSTR Expression/*[in]*/, short Header/*[in]*/, 
                                                     short Footer/*[in]*/)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->CreateGroupLevel(ReportName, Expression, Header, Footer, (long*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DMin(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                            VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DMin(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DMax(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                            VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DMax(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DSum(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                            VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DSum(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DAvg(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                            VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DAvg(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DLookup(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                               VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DLookup(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DLast(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                             VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DLast(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DVar(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                            VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DVar(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DVarP(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                             VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DVarP(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DStDev(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                              VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DStDev(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DStDevP(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                               VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DStDevP(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DFirst(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                              VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DFirst(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DCount(BSTR Expr/*[in]*/, BSTR Domain/*[in]*/, 
                                              VARIANT Criteria/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DCount(Expr, Domain, Criteria, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::Eval(BSTR StringExpr/*[in]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->Eval(StringExpr, (VARIANT*)&pRet));
  return pRet;
}

BSTR __fastcall TAccessApplication::CurrentUser(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->CurrentUser((BSTR*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::DDEInitiate(BSTR Application/*[in]*/, BSTR Topic/*[in]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->DDEInitiate(Application, Topic, (VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::DDEExecute(VARIANT ChanNum/*[in]*/, BSTR Command/*[in]*/)
{
  GetDefaultInterface()->DDEExecute(ChanNum/*[in]*/, Command/*[in]*/);
}

void __fastcall TAccessApplication::DDEPoke(VARIANT ChanNum/*[in]*/, BSTR Item/*[in]*/, 
                                            BSTR Data/*[in]*/)
{
  GetDefaultInterface()->DDEPoke(ChanNum/*[in]*/, Item/*[in]*/, Data/*[in]*/);
}

BSTR __fastcall TAccessApplication::DDERequest(VARIANT ChanNum/*[in]*/, BSTR Item/*[in]*/)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->DDERequest(ChanNum, Item, (BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::DDETerminate(VARIANT ChanNum/*[in]*/)
{
  GetDefaultInterface()->DDETerminate(ChanNum/*[in]*/);
}

void __fastcall TAccessApplication::DDETerminateAll(void)
{
  GetDefaultInterface()->DDETerminateAll();
}

Dao_xp::Database* __fastcall TAccessApplication::CurrentDb(void)
{
  Dao_xp::Database* pRet = 0;
  OLECHECK(GetDefaultInterface()->CurrentDb((Dao_xp::Database**)&pRet));
  return pRet;
}

Dao_xp::Database* __fastcall TAccessApplication::CodeDb(void)
{
  Dao_xp::Database* pRet = 0;
  OLECHECK(GetDefaultInterface()->CodeDb((Dao_xp::Database**)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::BeginUndoable(long Hwnd/*[in]*/)
{
  GetDefaultInterface()->BeginUndoable(Hwnd/*[in]*/);
}

void __fastcall TAccessApplication::SetUndoRecording(short yesno/*[in]*/)
{
  GetDefaultInterface()->SetUndoRecording(yesno/*[in]*/);
}

BSTR __fastcall TAccessApplication::BuildCriteria(BSTR Field/*[in]*/, short FieldType/*[in]*/, 
                                                  BSTR Expression/*[in]*/)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->BuildCriteria(Field, FieldType, Expression, (BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::InsertText(BSTR Text/*[in]*/, BSTR ModuleName/*[in]*/)
{
  GetDefaultInterface()->InsertText(Text/*[in]*/, ModuleName/*[in]*/);
}

void __fastcall TAccessApplication::ReloadAddIns(void)
{
  GetDefaultInterface()->ReloadAddIns();
}

Dao_xp::Workspace* __fastcall TAccessApplication::DefaultWorkspaceClone(void)
{
  Dao_xp::Workspace* pRet = 0;
  OLECHECK(GetDefaultInterface()->DefaultWorkspaceClone((Dao_xp::Workspace**)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::RefreshTitleBar(void)
{
  GetDefaultInterface()->RefreshTitleBar();
}

void __fastcall TAccessApplication::AddAutoCorrect(BSTR ChangeFrom/*[in]*/, BSTR ChangeTo/*[in]*/)
{
  GetDefaultInterface()->AddAutoCorrect(ChangeFrom/*[in]*/, ChangeTo/*[in]*/);
}

void __fastcall TAccessApplication::DelAutoCorrect(BSTR ChangeFrom/*[in]*/)
{
  GetDefaultInterface()->DelAutoCorrect(ChangeFrom/*[in]*/);
}

int __fastcall TAccessApplication::hWndAccessApp(void)
{
  int phWndAccessAppWnd;
  OLECHECK(GetDefaultInterface()->hWndAccessApp((int*)&phWndAccessAppWnd));
  return phWndAccessAppWnd;
}

VARIANT __fastcall TAccessApplication::Run(BSTR Procedure/*[in]*/, VARIANT* Arg1/*[in,out,opt]*/, 
                                           VARIANT* Arg2/*[in,out,opt]*/, 
                                           VARIANT* Arg3/*[in,out,opt]*/, 
                                           VARIANT* Arg4/*[in,out,opt]*/, 
                                           VARIANT* Arg5/*[in,out,opt]*/, 
                                           VARIANT* Arg6/*[in,out,opt]*/, 
                                           VARIANT* Arg7/*[in,out,opt]*/, 
                                           VARIANT* Arg8/*[in,out,opt]*/, 
                                           VARIANT* Arg9/*[in,out,opt]*/, 
                                           VARIANT* Arg10/*[in,out,opt]*/, 
                                           VARIANT* Arg11/*[in,out,opt]*/, 
                                           VARIANT* Arg12/*[in,out,opt]*/, 
                                           VARIANT* Arg13/*[in,out,opt]*/, 
                                           VARIANT* Arg14/*[in,out,opt]*/, 
                                           VARIANT* Arg15/*[in,out,opt]*/, 
                                           VARIANT* Arg16/*[in,out,opt]*/, 
                                           VARIANT* Arg17/*[in,out,opt]*/, 
                                           VARIANT* Arg18/*[in,out,opt]*/, 
                                           VARIANT* Arg19/*[in,out,opt]*/, 
                                           VARIANT* Arg20/*[in,out,opt]*/, 
                                           VARIANT* Arg21/*[in,out,opt]*/, 
                                           VARIANT* Arg22/*[in,out,opt]*/, 
                                           VARIANT* Arg23/*[in,out,opt]*/, 
                                           VARIANT* Arg24/*[in,out,opt]*/, 
                                           VARIANT* Arg25/*[in,out,opt]*/, 
                                           VARIANT* Arg26/*[in,out,opt]*/, 
                                           VARIANT* Arg27/*[in,out,opt]*/, 
                                           VARIANT* Arg28/*[in,out,opt]*/, 
                                           VARIANT* Arg29/*[in,out,opt]*/, 
                                           VARIANT* Arg30/*[in,out,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->Run(Procedure, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, 
                                      Arg9, Arg10, Arg11, Arg12, Arg13, Arg14, Arg15, Arg16, Arg17, 
                                      Arg18, Arg19, Arg20, Arg21, Arg22, Arg23, Arg24, Arg25, Arg26, 
                                      Arg27, Arg28, Arg29, Arg30, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::Nz(VARIANT Value/*[in]*/, VARIANT ValueIfNull/*[in,opt]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->Nz(Value, ValueIfNull, (VARIANT*)&pRet));
  return pRet;
}

LPDISPATCH __fastcall TAccessApplication::LoadPicture(BSTR FileName/*[in]*/)
{
  LPDISPATCH pRet;
  OLECHECK(GetDefaultInterface()->LoadPicture(FileName, (LPDISPATCH*)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::ReplaceModule(long objtyp/*[in]*/, BSTR ModuleName/*[in]*/, 
                                                  BSTR FileName/*[in]*/, long token/*[in]*/)
{
  GetDefaultInterface()->ReplaceModule(objtyp/*[in]*/, ModuleName/*[in]*/, FileName/*[in]*/, 
                                       token/*[in]*/);
}

VARIANT __fastcall TAccessApplication::AccessError(VARIANT ErrorNumber/*[in]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->AccessError(ErrorNumber, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::BuilderString(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->BuilderString((VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::StringFromGUID(VARIANT Guid/*[in]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->StringFromGUID(Guid, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::GUIDFromString(VARIANT String/*[in]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->GUIDFromString(String, (VARIANT*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessApplication::AppLoadString(long id/*[in]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->AppLoadString(id, (VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::FollowHyperlink(BSTR Address/*[in]*/, 
                                                    BSTR SubAddress/*[in,def,opt]*/, 
                                                    VARIANT_BOOL NewWindow/*[in,def,opt]*/, 
                                                    VARIANT_BOOL AddHistory/*[in,def,opt]*/, 
                                                    VARIANT ExtraInfo/*[in,opt]*/, 
                                                    Office_xp::MsoExtraInfoMethod Method/*[in,def,opt]*/, 
                                                    BSTR HeaderInfo/*[in,def,opt]*/)
{
  GetDefaultInterface()->FollowHyperlink(Address/*[in]*/, SubAddress/*[in,def,opt]*/, 
                                         NewWindow/*[in,def,opt]*/, AddHistory/*[in,def,opt]*/, 
                                         ExtraInfo/*[in,opt]*/, Method/*[in,def,opt]*/, 
                                         HeaderInfo/*[in,def,opt]*/);
}

void __fastcall TAccessApplication::SaveAsText(Access_xp::AcObjectType ObjectType/*[in]*/, 
                                               BSTR ObjectName/*[in]*/, BSTR FileName/*[in]*/)
{
  GetDefaultInterface()->SaveAsText(ObjectType/*[in]*/, ObjectName/*[in]*/, FileName/*[in]*/);
}

void __fastcall TAccessApplication::LoadFromText(Access_xp::AcObjectType ObjectType/*[in]*/, 
                                                 BSTR ObjectName/*[in]*/, BSTR FileName/*[in]*/)
{
  GetDefaultInterface()->LoadFromText(ObjectType/*[in]*/, ObjectName/*[in]*/, FileName/*[in]*/);
}

void __fastcall TAccessApplication::AddToFavorites(void)
{
  GetDefaultInterface()->AddToFavorites();
}

void __fastcall TAccessApplication::RefreshDatabaseWindow(void)
{
  GetDefaultInterface()->RefreshDatabaseWindow();
}

void __fastcall TAccessApplication::RunCommand(Access_xp::AcCommand Command/*[in]*/)
{
  GetDefaultInterface()->RunCommand(Command/*[in]*/);
}

BSTR __fastcall TAccessApplication::HyperlinkPart(VARIANT Hyperlink/*[in]*/, 
                                                  Access_xp::AcHyperlinkPart Part/*[in,def,opt]*/)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->HyperlinkPart(Hyperlink, Part, (BSTR*)&pRet));
  return pRet;
}

VARIANT_BOOL __fastcall TAccessApplication::GetHiddenAttribute(Access_xp::AcObjectType ObjectType/*[in]*/, 
                                                               BSTR ObjectName/*[in]*/)
{
  VARIANT_BOOL pfHidden;
  OLECHECK(GetDefaultInterface()->GetHiddenAttribute(ObjectType, ObjectName, (VARIANT_BOOL*)&pfHidden));
  return pfHidden;
}

void __fastcall TAccessApplication::SetHiddenAttribute(Access_xp::AcObjectType ObjectType/*[in]*/, 
                                                       BSTR ObjectName/*[in]*/, 
                                                       VARIANT_BOOL fHidden/*[in]*/)
{
  GetDefaultInterface()->SetHiddenAttribute(ObjectType/*[in]*/, ObjectName/*[in]*/, fHidden/*[in]*/);
}

Access_xp::DataAccessPage* __fastcall TAccessApplication::CreateDataAccessPage(VARIANT FileName/*[in,opt]*/, 
                                                                               VARIANT_BOOL CreateNewFile/*[in,def,opt]*/)
{
  Access_xp::DataAccessPage* pRet = 0;
  OLECHECK(GetDefaultInterface()->CreateDataAccessPage(FileName, CreateNewFile, (Access_xp::DataAccessPage**)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::NewAccessProject(BSTR filepath/*[in]*/, 
                                                     VARIANT Connect/*[in,opt]*/)
{
  GetDefaultInterface()->NewAccessProject(filepath/*[in]*/, Connect/*[in,opt]*/);
}

void __fastcall TAccessApplication::OpenAccessProject(BSTR filepath/*[in]*/, 
                                                      VARIANT_BOOL Exclusive/*[in,def,opt]*/)
{
  GetDefaultInterface()->OpenAccessProject(filepath/*[in]*/, Exclusive/*[in,def,opt]*/);
}

void __fastcall TAccessApplication::CreateAccessProject(BSTR filepath/*[in]*/, 
                                                        VARIANT Connect/*[in,opt]*/)
{
  GetDefaultInterface()->CreateAccessProject(filepath/*[in]*/, Connect/*[in,opt]*/);
}

double __fastcall TAccessApplication::EuroConvert(double Number/*[in]*/, BSTR SourceCurrency/*[in]*/, 
                                                  BSTR TargetCurrency/*[in]*/, 
                                                  VARIANT FullPrecision/*[in,opt]*/, 
                                                  VARIANT TriangulationPrecision/*[in,opt]*/)
{
  double pRet;
  OLECHECK(GetDefaultInterface()->EuroConvert(Number, SourceCurrency, TargetCurrency, FullPrecision, 
                                              TriangulationPrecision, (double*)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::CreateNewWorkgroupFile(BSTR Path/*[in,def,opt]*/, 
                                                           BSTR Name/*[in,def,opt]*/, 
                                                           BSTR Company/*[in,def,opt]*/, 
                                                           BSTR WorkgroupID/*[in,def,opt]*/, 
                                                           VARIANT_BOOL Replace/*[in,def,opt]*/)
{
  GetDefaultInterface()->CreateNewWorkgroupFile(Path/*[in,def,opt]*/, Name/*[in,def,opt]*/, 
                                                Company/*[in,def,opt]*/, WorkgroupID/*[in,def,opt]*/, 
                                                Replace/*[in,def,opt]*/);
}

void __fastcall TAccessApplication::SetDefaultWorkgroupFile(BSTR Path/*[in]*/)
{
  GetDefaultInterface()->SetDefaultWorkgroupFile(Path/*[in]*/);
}

void __fastcall TAccessApplication::ConvertAccessProject(BSTR SourceFilename/*[in]*/, 
                                                         BSTR DestinationFilename/*[in]*/, 
                                                         Access_xp::AcFileFormat DestinationFileFormat/*[in]*/)
{
  GetDefaultInterface()->ConvertAccessProject(SourceFilename/*[in]*/, DestinationFilename/*[in]*/, 
                                              DestinationFileFormat/*[in]*/);
}

void __fastcall TAccessApplication::OpenCurrentDatabase(BSTR filepath/*[in]*/, 
                                                        VARIANT_BOOL Exclusive/*[in,def,opt]*/, 
                                                        BSTR bstrPassword/*[in,def,opt]*/)
{
  GetDefaultInterface()->OpenCurrentDatabase(filepath/*[in]*/, Exclusive/*[in,def,opt]*/, 
                                             bstrPassword/*[in,def,opt]*/);
}

VARIANT_BOOL __fastcall TAccessApplication::CompactRepair(BSTR SourceFile/*[in]*/, 
                                                          BSTR DestinationFile/*[in]*/, 
                                                          VARIANT_BOOL LogFile/*[in,def,opt]*/)
{
  VARIANT_BOOL pfRet;
  OLECHECK(GetDefaultInterface()->CompactRepair(SourceFile, DestinationFile, LogFile, (VARIANT_BOOL*)&pfRet));
  return pfRet;
}

void __fastcall TAccessApplication::ExportXML(Access_xp::AcExportXMLObjectType ObjectType/*[in]*/, 
                                              BSTR DataSource/*[in]*/, 
                                              BSTR DataTarget/*[in,def,opt]*/, 
                                              BSTR SchemaTarget/*[in,def,opt]*/, 
                                              BSTR PresentationTarget/*[in,def,opt]*/, 
                                              BSTR ImageTarget/*[in,def,opt]*/, 
                                              Access_xp::AcExportXMLEncoding Encoding/*[in,def,opt]*/, 
                                              long OtherFlags/*[in,def,opt]*/)
{
  GetDefaultInterface()->ExportXML(ObjectType/*[in]*/, DataSource/*[in]*/, 
                                   DataTarget/*[in,def,opt]*/, SchemaTarget/*[in,def,opt]*/, 
                                   PresentationTarget/*[in,def,opt]*/, ImageTarget/*[in,def,opt]*/, 
                                   Encoding/*[in,def,opt]*/, OtherFlags/*[in,def,opt]*/);
}

void __fastcall TAccessApplication::ImportXML(BSTR DataSource/*[in]*/, 
                                              Access_xp::AcImportXMLOption ImportOptions/*[in,def,opt]*/)
{
  GetDefaultInterface()->ImportXML(DataSource/*[in]*/, ImportOptions/*[in,def,opt]*/);
}

Access_xp::AccessApplicationPtr __fastcall TAccessApplication::get_Application(void)
{
  Access_xp::AccessApplicationPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Application(&pRet));
  return pRet;
}

LPDISPATCH __fastcall TAccessApplication::get_Parent(void)
{
  LPDISPATCH pRet;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&pRet));
  return pRet;
}

LPDISPATCH __fastcall TAccessApplication::get_CodeContextObject(void)
{
  LPDISPATCH pRet;
  OLECHECK(GetDefaultInterface()->get_CodeContextObject((LPDISPATCH*)&pRet));
  return pRet;
}

BSTR __fastcall TAccessApplication::get_MenuBar(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_MenuBar((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::set_MenuBar(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_MenuBar(pRet/*[in]*/);
}

Access_xp::AcObjectType __fastcall TAccessApplication::get_CurrentObjectType(void)
{
  Access_xp::AcObjectType pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentObjectType((Access_xp::AcObjectType*)&pRet));
  return pRet;
}

BSTR __fastcall TAccessApplication::get_CurrentObjectName(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_CurrentObjectName((BSTR*)&pRet));
  return pRet;
}

Access_xp::Forms_Ptr __fastcall TAccessApplication::get_Forms(void)
{
  Access_xp::Forms_Ptr pRet;
  OLECHECK(GetDefaultInterface()->get_Forms(&pRet));
  return pRet;
}

Access_xp::ReportsPtr __fastcall TAccessApplication::get_Reports(void)
{
  Access_xp::ReportsPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Reports(&pRet));
  return pRet;
}

Access_xp::ScreenPtr __fastcall TAccessApplication::get_Screen(void)
{
  Access_xp::ScreenPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Screen(&pRet));
  return pRet;
}

Access_xp::DoCmdPtr __fastcall TAccessApplication::get_DoCmd(void)
{
  Access_xp::DoCmdPtr pRet;
  OLECHECK(GetDefaultInterface()->get_DoCmd(&pRet));
  return pRet;
}

BSTR __fastcall TAccessApplication::get_ShortcutMenuBar(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_ShortcutMenuBar((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessApplication::set_ShortcutMenuBar(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_ShortcutMenuBar(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessApplication::get_Visible(void)
{
  VARIANT_BOOL pfVisible;
  OLECHECK(GetDefaultInterface()->get_Visible((VARIANT_BOOL*)&pfVisible));
  return pfVisible;
}

void __fastcall TAccessApplication::set_Visible(VARIANT_BOOL pfVisible/*[in]*/)
{
  GetDefaultInterface()->set_Visible(pfVisible/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessApplication::get_UserControl(void)
{
  VARIANT_BOOL pfUserCtrl;
  OLECHECK(GetDefaultInterface()->get_UserControl((VARIANT_BOOL*)&pfUserCtrl));
  return pfUserCtrl;
}

void __fastcall TAccessApplication::set_UserControl(VARIANT_BOOL pfUserCtrl/*[in]*/)
{
  GetDefaultInterface()->set_UserControl(pfUserCtrl/*[in]*/);
}

Dao_xp::DBEnginePtr __fastcall TAccessApplication::get_DBEngine(void)
{
  Dao_xp::DBEnginePtr pRet;
  OLECHECK(GetDefaultInterface()->get_DBEngine(&pRet));
  return pRet;
}

Office_xp::CommandBarsPtr __fastcall TAccessApplication::get_CommandBars(void)
{
  Office_xp::CommandBarsPtr pRet;
  OLECHECK(GetDefaultInterface()->get_CommandBars(&pRet));
  return pRet;
}

Office_xp::AssistantPtr __fastcall TAccessApplication::get_Assistant(void)
{
  Office_xp::AssistantPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Assistant(&pRet));
  return pRet;
}

Access_xp::AccessReferencesPtr __fastcall TAccessApplication::get_References(void)
{
  Access_xp::AccessReferencesPtr pRet;
  OLECHECK(GetDefaultInterface()->get_References(&pRet));
  return pRet;
}

Access_xp::ModulesPtr __fastcall TAccessApplication::get_Modules(void)
{
  Access_xp::ModulesPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Modules(&pRet));
  return pRet;
}

Office_xp::FileSearchPtr __fastcall TAccessApplication::get_FileSearch(void)
{
  Office_xp::FileSearchPtr pRet;
  OLECHECK(GetDefaultInterface()->get_FileSearch(&pRet));
  return pRet;
}

VARIANT_BOOL __fastcall TAccessApplication::get_IsCompiled(void)
{
  VARIANT_BOOL pfCompiled;
  OLECHECK(GetDefaultInterface()->get_IsCompiled((VARIANT_BOOL*)&pfCompiled));
  return pfCompiled;
}

Vbide_xp::VBEPtr __fastcall TAccessApplication::get_VBE(void)
{
  Vbide_xp::VBEPtr ppVBE;
  OLECHECK(GetDefaultInterface()->get_VBE(&ppVBE));
  return ppVBE;
}

Access_xp::DataAccessPagesPtr __fastcall TAccessApplication::get_DataAccessPages(void)
{
  Access_xp::DataAccessPagesPtr pRet;
  OLECHECK(GetDefaultInterface()->get_DataAccessPages(&pRet));
  return pRet;
}

BSTR __fastcall TAccessApplication::get_ADOConnectString(void)
{
  BSTR pbstrADOConnectString = 0;
  OLECHECK(GetDefaultInterface()->get_ADOConnectString((BSTR*)&pbstrADOConnectString));
  return pbstrADOConnectString;
}

Access_xp::CurrentProjectPtr __fastcall TAccessApplication::get_CurrentProject(void)
{
  Access_xp::CurrentProjectPtr pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentProject(&pRet));
  return pRet;
}

Access_xp::CurrentDataPtr __fastcall TAccessApplication::get_CurrentData(void)
{
  Access_xp::CurrentDataPtr pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentData(&pRet));
  return pRet;
}

Access_xp::CodeProjectPtr __fastcall TAccessApplication::get_CodeProject(void)
{
  Access_xp::CodeProjectPtr pRet;
  OLECHECK(GetDefaultInterface()->get_CodeProject(&pRet));
  return pRet;
}

Access_xp::CodeDataPtr __fastcall TAccessApplication::get_CodeData(void)
{
  Access_xp::CodeDataPtr pRet;
  OLECHECK(GetDefaultInterface()->get_CodeData(&pRet));
  return pRet;
}

Access_xp::WizHookPtr __fastcall TAccessApplication::get_WizHook(void)
{
  Access_xp::WizHookPtr pRet;
  OLECHECK(GetDefaultInterface()->get_WizHook(&pRet));
  return pRet;
}

BSTR __fastcall TAccessApplication::get_ProductCode(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_ProductCode((BSTR*)&pRet));
  return pRet;
}

Office_xp::COMAddInsPtr __fastcall TAccessApplication::get_COMAddIns(void)
{
  Office_xp::COMAddInsPtr pRet;
  OLECHECK(GetDefaultInterface()->get_COMAddIns(&pRet));
  return pRet;
}

BSTR __fastcall TAccessApplication::get_Name(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&pRet));
  return pRet;
}

Access_xp::DefaultWebOptionsPtr __fastcall TAccessApplication::get_DefaultWebOptions(void)
{
  Access_xp::DefaultWebOptionsPtr ppDWO;
  OLECHECK(GetDefaultInterface()->get_DefaultWebOptions(&ppDWO));
  return ppDWO;
}

Office_xp::LanguageSettingsPtr __fastcall TAccessApplication::get_LanguageSettings(void)
{
  Office_xp::LanguageSettingsPtr ppRet;
  OLECHECK(GetDefaultInterface()->get_LanguageSettings(&ppRet));
  return ppRet;
}

Office_xp::AnswerWizardPtr __fastcall TAccessApplication::get_AnswerWizard(void)
{
  Office_xp::AnswerWizardPtr pRet;
  OLECHECK(GetDefaultInterface()->get_AnswerWizard(&pRet));
  return pRet;
}

Office_xp::MsoFeatureInstall __fastcall TAccessApplication::get_FeatureInstall(void)
{
  Office_xp::MsoFeatureInstall FeatureInstall;
  OLECHECK(GetDefaultInterface()->get_FeatureInstall((Office_xp::MsoFeatureInstall*)&FeatureInstall));
  return FeatureInstall;
}

void __fastcall TAccessApplication::set_FeatureInstall(Office_xp::MsoFeatureInstall FeatureInstall/*[in]*/)
{
  GetDefaultInterface()->set_FeatureInstall(FeatureInstall/*[in]*/);
}

VARIANT __fastcall TAccessApplication::get_VGXFrameInterval(void)
{
  VARIANT pnmsec;
  OLECHECK(GetDefaultInterface()->get_VGXFrameInterval((VARIANT*)&pnmsec));
  return pnmsec;
}

Office_xp::FileDialog* __fastcall TAccessApplication::get_FileDialog(Office_xp::MsoFileDialogType dialogType/*[in]*/)
{
  Office_xp::FileDialog* pRet = 0;
  OLECHECK(GetDefaultInterface()->get_FileDialog(dialogType, (Office_xp::FileDialog**)&pRet));
  return pRet;
}

VARIANT_BOOL __fastcall TAccessApplication::get_BrokenReference(void)
{
  VARIANT_BOOL pfBrokenReference;
  OLECHECK(GetDefaultInterface()->get_BrokenReference((VARIANT_BOOL*)&pfBrokenReference));
  return pfBrokenReference;
}

Access_xp::PrintersPtr __fastcall TAccessApplication::get_Printers(void)
{
  Access_xp::PrintersPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Printers(&pRet));
  return pRet;
}

Access_xp::_PrinterPtr __fastcall TAccessApplication::get_Printer(void)
{
  Access_xp::_PrinterPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Printer(&pRet));
  return pRet;
}

void __fastcall TAccessApplication::set_Printer(Access_xp::_PrinterPtr pRet/*[in]*/)
{
  GetDefaultInterface()->set_Printer(pRet/*[in]*/);
}

void __fastcall TAccessApplication::_set_Printer(Access_xp::_Printer* pRet/*[in]*/)
{
  GetDefaultInterface()->_set_Printer(pRet/*[in]*/);
}

Office_xp::MsoDebugOptionsPtr __fastcall TAccessApplication::get_MsoDebugOptions(void)
{
  Office_xp::MsoDebugOptionsPtr MsoDebugOptions;
  OLECHECK(GetDefaultInterface()->get_MsoDebugOptions(&MsoDebugOptions));
  return MsoDebugOptions;
}

BSTR __fastcall TAccessApplication::get_Version(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Version((BSTR*)&pRet));
  return pRet;
}

long __fastcall TAccessApplication::get_Build(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_Build((long*)&pRet));
  return pRet;
}

Office_xp::NewFilePtr __fastcall TAccessApplication::get_NewFileTaskPane(void)
{
  Office_xp::NewFilePtr pRet;
  OLECHECK(GetDefaultInterface()->get_NewFileTaskPane(&pRet));
  return pRet;
}

_ReferencesPtr& TAccessReferences::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TAccessReferences::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TAccessReferences::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TAccessReferences::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TAccessReferences::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TAccessReferences::ConnectTo(_ReferencesPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TAccessReferences::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_AccessReferences;
  sd.IntfIID = __uuidof(_References);
  sd.EventIID= __uuidof(_References_Events);
  ServerData = &sd;
}

void __fastcall TAccessReferences::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 0: {
      if (OnItemAdded) {
        (OnItemAdded)(this, (Access_xp::ReferencePtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1: {
      if (OnItemRemoved) {
        (OnItemRemoved)(this, (Access_xp::ReferencePtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

Access_xp::Reference* __fastcall TAccessReferences::Item(VARIANT var/*[in]*/)
{
  Access_xp::Reference* Reference = 0;
  OLECHECK(GetDefaultInterface()->Item(var, (Access_xp::Reference**)&Reference));
  return Reference;
}

LPUNKNOWN __fastcall TAccessReferences::_NewEnum(void)
{
  LPUNKNOWN ppenum;
  OLECHECK(GetDefaultInterface()->_NewEnum((LPUNKNOWN*)&ppenum));
  return ppenum;
}

Access_xp::Reference* __fastcall TAccessReferences::AddFromGuid(BSTR Guid/*[in]*/, 
                                                                long Major/*[in]*/, 
                                                                long Minor/*[in]*/)
{
  Access_xp::Reference* Reference = 0;
  OLECHECK(GetDefaultInterface()->AddFromGuid(Guid, Major, Minor, (Access_xp::Reference**)&Reference));
  return Reference;
}

Access_xp::Reference* __fastcall TAccessReferences::AddFromFile(BSTR FileName/*[in]*/)
{
  Access_xp::Reference* Reference = 0;
  OLECHECK(GetDefaultInterface()->AddFromFile(FileName, (Access_xp::Reference**)&Reference));
  return Reference;
}

void __fastcall TAccessReferences::Remove(Access_xp::Reference* Reference/*[in]*/)
{
  GetDefaultInterface()->Remove(Reference/*[in]*/);
}

LPDISPATCH __fastcall TAccessReferences::get_Parent(void)
{
  LPDISPATCH retval;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&retval));
  return retval;
}

long __fastcall TAccessReferences::get_Count(void)
{
  long Count;
  OLECHECK(GetDefaultInterface()->get_Count((long*)&Count));
  return Count;
}

_Form2Ptr& TAccessForm::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TAccessForm::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TAccessForm::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TAccessForm::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TAccessForm::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TAccessForm::ConnectTo(_Form2Ptr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TAccessForm::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_AccessForm;
  sd.IntfIID = __uuidof(_Form2);
  sd.EventIID= __uuidof(_FormEvents);
  ServerData = &sd;
}

void __fastcall TAccessForm::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 2067: {
      if (OnLoad1) {
        (OnLoad1)(this);
      }
      break;
      }
    case 2058: {
      if (OnCurrent1) {
        (OnCurrent1)(this);
      }
      break;
      }
    case 2059: {
      if (OnBeforeInsert) {
        (OnBeforeInsert)(this, params[0].piVal);
      }
      break;
      }
    case 2060: {
      if (OnAfterInsert) {
        (OnAfterInsert)(this);
      }
      break;
      }
    case 2061: {
      if (OnBeforeUpdate) {
        (OnBeforeUpdate)(this, params[0].piVal);
      }
      break;
      }
    case 2062: {
      if (OnAfterUpdate) {
        (OnAfterUpdate)(this);
      }
      break;
      }
    case 2063: {
      if (OnDelete1) {
        (OnDelete1)(this, params[0].piVal);
      }
      break;
      }
    case 2064: {
      if (OnBeforeDelConfirm) {
        (OnBeforeDelConfirm)(this, params[0].piVal, params[1].piVal);
      }
      break;
      }
    case 2065: {
      if (OnAfterDelConfirm) {
        (OnAfterDelConfirm)(this, params[0].piVal);
      }
      break;
      }
    case 2066: {
      if (OnOpen1) {
        (OnOpen1)(this, params[0].piVal);
      }
      break;
      }
    case 2068: {
      if (OnResize1) {
        (OnResize1)(this);
      }
      break;
      }
    case 2069: {
      if (OnUnload1) {
        (OnUnload1)(this, params[0].piVal);
      }
      break;
      }
    case 2070: {
      if (OnClose1) {
        (OnClose1)(this);
      }
      break;
      }
    case 2071: {
      if (OnActivate1) {
        (OnActivate1)(this);
      }
      break;
      }
    case 2072: {
      if (OnDeactivate1) {
        (OnDeactivate1)(this);
      }
      break;
      }
    case 2073: {
      if (OnGotFocus1) {
        (OnGotFocus1)(this);
      }
      break;
      }
    case 2074: {
      if (OnLostFocus1) {
        (OnLostFocus1)(this);
      }
      break;
      }
    case -600: {
      if (On_Click) {
        (On_Click)(this);
      }
      break;
      }
    case -601: {
      if (OnDblClick1) {
        (OnDblClick1)(this, params[0].piVal);
      }
      break;
      }
    case -605: {
      if (OnMouseDown1) {
        (OnMouseDown1)(this, params[0].piVal, params[1].piVal, params[2].pfltVal, params[3].pfltVal);
      }
      break;
      }
    case -606: {
      if (OnMouseMove1) {
        (OnMouseMove1)(this, params[0].piVal, params[1].piVal, params[2].pfltVal, params[3].pfltVal);
      }
      break;
      }
    case -607: {
      if (OnMouseUp1) {
        (OnMouseUp1)(this, params[0].piVal, params[1].piVal, params[2].pfltVal, params[3].pfltVal);
      }
      break;
      }
    case -602: {
      if (OnKeyDown1) {
        (OnKeyDown1)(this, params[0].piVal, params[1].piVal);
      }
      break;
      }
    case -603: {
      if (OnKeyPress1) {
        (OnKeyPress1)(this, params[0].piVal);
      }
      break;
      }
    case -604: {
      if (OnKeyUp1) {
        (OnKeyUp1)(this, params[0].piVal, params[1].piVal);
      }
      break;
      }
    case 2083: {
      if (OnError1) {
        (OnError1)(this, params[0].piVal, params[1].piVal);
      }
      break;
      }
    case 2084: {
      if (OnTimer1) {
        (OnTimer1)(this);
      }
      break;
      }
    case 2155: {
      if (OnFilter1) {
        (OnFilter1)(this, params[0].piVal, params[1].piVal);
      }
      break;
      }
    case 2156: {
      if (OnApplyFilter1) {
        (OnApplyFilter1)(this, params[0].piVal, params[1].piVal);
      }
      break;
      }
    case 2205: {
      if (OnDirty1) {
        (OnDirty1)(this, params[0].piVal);
      }
      break;
      }
    case 2145: {
      if (OnUndo1) {
        (OnUndo1)(this, params[0].piVal);
      }
      break;
      }
    case 2334: {
      if (OnRecordExit1) {
        (OnRecordExit1)(this, params[0].piVal);
      }
      break;
      }
    case 2369: {
      if (OnBeginBatchEdit) {
        (OnBeginBatchEdit)(this, params[0].piVal);
      }
      break;
      }
    case 2370: {
      if (OnUndoBatchEdit) {
        (OnUndoBatchEdit)(this, params[0].piVal);
      }
      break;
      }
    case 2371: {
      if (OnBeforeBeginTransaction) {
        (OnBeforeBeginTransaction)(this, params[0].piVal, (Adodb_xp::Connection**)(LPDISPATCH*)(params[1].ppdispVal));
      }
      break;
      }
    case 2372: {
      if (OnAfterBeginTransaction) {
        (OnAfterBeginTransaction)(this, (Adodb_xp::Connection**)(LPDISPATCH*)(params[0].ppdispVal));
      }
      break;
      }
    case 2373: {
      if (OnBeforeCommitTransaction) {
        (OnBeforeCommitTransaction)(this, params[0].piVal, (Adodb_xp::Connection**)(LPDISPATCH*)(params[1].ppdispVal));
      }
      break;
      }
    case 2374: {
      if (OnAfterCommitTransaction) {
        (OnAfterCommitTransaction)(this, (Adodb_xp::Connection**)(LPDISPATCH*)(params[0].ppdispVal));
      }
      break;
      }
    case 2375: {
      if (OnRollbackTransaction) {
        (OnRollbackTransaction)(this, (Adodb_xp::Connection**)(LPDISPATCH*)(params[0].ppdispVal));
      }
      break;
      }
    case 2383: {
      if (OnConnect1) {
        (OnConnect1)(this);
      }
      break;
      }
    case 2384: {
      if (OnDisconnect1) {
        (OnDisconnect1)(this);
      }
      break;
      }
    case 2385: {
      if (OnPivotTableChange) {
        (OnPivotTableChange)(this, params[0]);
      }
      break;
      }
    case 2386: {
      if (OnQuery) {
        (OnQuery)(this);
      }
      break;
      }
    case 2387: {
      if (OnBeforeQuery) {
        (OnBeforeQuery)(this);
      }
      break;
      }
    case 2388: {
      if (OnSelectionChange) {
        (OnSelectionChange)(this);
      }
      break;
      }
    case 2389: {
      if (OnCommandBeforeExecute) {
        (OnCommandBeforeExecute)(this, params[0], params[1].pdispVal);
      }
      break;
      }
    case 2390: {
      if (OnCommandChecked) {
        (OnCommandChecked)(this, params[0], params[1].pdispVal);
      }
      break;
      }
    case 2391: {
      if (OnCommandEnabled) {
        (OnCommandEnabled)(this, params[0], params[1].pdispVal);
      }
      break;
      }
    case 2392: {
      if (OnCommandExecute) {
        (OnCommandExecute)(this, params[0]);
      }
      break;
      }
    case 2394: {
      if (OnDataSetChange) {
        (OnDataSetChange)(this);
      }
      break;
      }
    case 2395: {
      if (OnBeforeScreenTip) {
        (OnBeforeScreenTip)(this, params[0].pdispVal, params[1].pdispVal);
      }
      break;
      }
    case 2399: {
      if (OnBeforeRender) {
        (OnBeforeRender)(this, params[0].pdispVal, params[1].pdispVal, params[2].pdispVal);
      }
      break;
      }
    case 2397: {
      if (OnAfterRender) {
        (OnAfterRender)(this, params[0].pdispVal, params[1].pdispVal);
      }
      break;
      }
    case 2396: {
      if (OnAfterFinalRender) {
        (OnAfterFinalRender)(this, params[0].pdispVal);
      }
      break;
      }
    case 2398: {
      if (OnAfterLayout) {
        (OnAfterLayout)(this, params[0].pdispVal);
      }
      break;
      }
    case 2401: {
      if (OnMouseWheel) {
        (OnMouseWheel)(this, params[0], params[1]);
      }
      break;
      }
    case 2402: {
      if (OnViewChange) {
        (OnViewChange)(this, params[0]);
      }
      break;
      }
    case 2403: {
      if (OnDataChange) {
        (OnDataChange)(this, params[0]);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TAccessForm::accSelect(long flagsSelect/*[in]*/, VARIANT varChild/*[in,opt]*/)
{
  GetDefaultInterface()->accSelect(flagsSelect/*[in]*/, varChild/*[in,opt]*/);
}

void __fastcall TAccessForm::accLocation(long* pxLeft/*[out]*/, long* pyTop/*[out]*/, 
                                         long* pcxWidth/*[out]*/, long* pcyHeight/*[out]*/, 
                                         VARIANT varChild/*[in,opt]*/)
{
  GetDefaultInterface()->accLocation(pxLeft/*[out]*/, pyTop/*[out]*/, pcxWidth/*[out]*/, 
                                     pcyHeight/*[out]*/, varChild/*[in,opt]*/);
}

VARIANT __fastcall TAccessForm::accNavigate(long navDir/*[in]*/, VARIANT varStart/*[in,opt]*/)
{
  VARIANT pvarEndUpAt;
  OLECHECK(GetDefaultInterface()->accNavigate(navDir, varStart, (VARIANT*)&pvarEndUpAt));
  return pvarEndUpAt;
}

VARIANT __fastcall TAccessForm::accHitTest(long xLeft/*[in]*/, long yTop/*[in]*/)
{
  VARIANT pvarChild;
  OLECHECK(GetDefaultInterface()->accHitTest(xLeft, yTop, (VARIANT*)&pvarChild));
  return pvarChild;
}

void __fastcall TAccessForm::accDoDefaultAction(VARIANT varChild/*[in,opt]*/)
{
  GetDefaultInterface()->accDoDefaultAction(varChild/*[in,opt]*/);
}

void __fastcall TAccessForm::Undo(void)
{
  GetDefaultInterface()->Undo();
}

void __fastcall TAccessForm::Recalc(void)
{
  GetDefaultInterface()->Recalc();
}

void __fastcall TAccessForm::Requery(void)
{
  GetDefaultInterface()->Requery();
}

void __fastcall TAccessForm::Refresh(void)
{
  GetDefaultInterface()->Refresh();
}

void __fastcall TAccessForm::Repaint(void)
{
  GetDefaultInterface()->Repaint();
}

void __fastcall TAccessForm::GoToPage(long PageNumber/*[in]*/, long Right/*[in,def,opt]*/, 
                                      long Down/*[in,def,opt]*/)
{
  GetDefaultInterface()->GoToPage(PageNumber/*[in]*/, Right/*[in,def,opt]*/, Down/*[in,def,opt]*/);
}

void __fastcall TAccessForm::SetFocus(void)
{
  GetDefaultInterface()->SetFocus();
}

VARIANT __fastcall TAccessForm::_Evaluate(BSTR bstrExpr/*[in]*/, LPSAFEARRAY* ppsa/*[in]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->_Evaluate(bstrExpr, ppsa, (VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::Move(VARIANT Left/*[in]*/, VARIANT Top/*[in,opt]*/, 
                                  VARIANT Width/*[in,opt]*/, VARIANT Height/*[in,opt]*/)
{
  GetDefaultInterface()->Move(Left/*[in]*/, Top/*[in,opt]*/, Width/*[in,opt]*/, Height/*[in,opt]*/);
}

LPDISPATCH __fastcall TAccessForm::get_accParent(void)
{
  LPDISPATCH ppdispParent;
  OLECHECK(GetDefaultInterface()->get_accParent((LPDISPATCH*)&ppdispParent));
  return ppdispParent;
}

long __fastcall TAccessForm::get_accChildCount(void)
{
  long pcountChildren;
  OLECHECK(GetDefaultInterface()->get_accChildCount((long*)&pcountChildren));
  return pcountChildren;
}

LPDISPATCH __fastcall TAccessForm::get_accChild(VARIANT varChild/*[in]*/)
{
  LPDISPATCH ppdispChild;
  OLECHECK(GetDefaultInterface()->get_accChild(varChild, (LPDISPATCH*)&ppdispChild));
  return ppdispChild;
}

BSTR __fastcall TAccessForm::get_accName(VARIANT varChild/*[in,opt]*/)
{
  BSTR pszName = 0;
  OLECHECK(GetDefaultInterface()->get_accName(varChild, (BSTR*)&pszName));
  return pszName;
}

BSTR __fastcall TAccessForm::get_accValue(VARIANT varChild/*[in,opt]*/)
{
  BSTR pszValue = 0;
  OLECHECK(GetDefaultInterface()->get_accValue(varChild, (BSTR*)&pszValue));
  return pszValue;
}

BSTR __fastcall TAccessForm::get_accDescription(VARIANT varChild/*[in,opt]*/)
{
  BSTR pszDescription = 0;
  OLECHECK(GetDefaultInterface()->get_accDescription(varChild, (BSTR*)&pszDescription));
  return pszDescription;
}

VARIANT __fastcall TAccessForm::get_accRole(VARIANT varChild/*[in,opt]*/)
{
  VARIANT pvarRole;
  OLECHECK(GetDefaultInterface()->get_accRole(varChild, (VARIANT*)&pvarRole));
  return pvarRole;
}

VARIANT __fastcall TAccessForm::get_accState(VARIANT varChild/*[in,opt]*/)
{
  VARIANT pvarState;
  OLECHECK(GetDefaultInterface()->get_accState(varChild, (VARIANT*)&pvarState));
  return pvarState;
}

BSTR __fastcall TAccessForm::get_accHelp(VARIANT varChild/*[in,opt]*/)
{
  BSTR pszHelp = 0;
  OLECHECK(GetDefaultInterface()->get_accHelp(varChild, (BSTR*)&pszHelp));
  return pszHelp;
}

long __fastcall TAccessForm::get_accHelpTopic(BSTR* pszHelpFile/*[out]*/, 
                                              VARIANT varChild/*[in,opt]*/)
{
  long pidTopic;
  OLECHECK(GetDefaultInterface()->get_accHelpTopic(pszHelpFile, varChild, (long*)&pidTopic));
  return pidTopic;
}

BSTR __fastcall TAccessForm::get_accKeyboardShortcut(VARIANT varChild/*[in,opt]*/)
{
  BSTR pszKeyboardShortcut = 0;
  OLECHECK(GetDefaultInterface()->get_accKeyboardShortcut(varChild, (BSTR*)&pszKeyboardShortcut));
  return pszKeyboardShortcut;
}

VARIANT __fastcall TAccessForm::get_accFocus(void)
{
  VARIANT pvarChild;
  OLECHECK(GetDefaultInterface()->get_accFocus((VARIANT*)&pvarChild));
  return pvarChild;
}

VARIANT __fastcall TAccessForm::get_accSelection(void)
{
  VARIANT pvarChildren;
  OLECHECK(GetDefaultInterface()->get_accSelection((VARIANT*)&pvarChildren));
  return pvarChildren;
}

BSTR __fastcall TAccessForm::get_accDefaultAction(VARIANT varChild/*[in,opt]*/)
{
  BSTR pszDefaultAction = 0;
  OLECHECK(GetDefaultInterface()->get_accDefaultAction(varChild, (BSTR*)&pszDefaultAction));
  return pszDefaultAction;
}

void __fastcall TAccessForm::set_accName(VARIANT varChild/*[in,opt]*/, BSTR pszName/*[in]*/)
{
  GetDefaultInterface()->set_accName(varChild/*[in,opt]*/, pszName/*[in]*/);
}

void __fastcall TAccessForm::set_accValue(VARIANT varChild/*[in,opt]*/, BSTR pszValue/*[in]*/)
{
  GetDefaultInterface()->set_accValue(varChild/*[in,opt]*/, pszValue/*[in]*/);
}

BSTR __fastcall TAccessForm::get_FormName(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_FormName((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_FormName(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_FormName(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_RecordSource(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_RecordSource((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_RecordSource(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_RecordSource(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_Filter(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Filter((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Filter(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Filter(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_FilterOn(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_FilterOn((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_FilterOn(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_FilterOn(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OrderBy(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OrderBy((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OrderBy(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OrderBy(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_OrderByOn(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_OrderByOn((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OrderByOn(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_OrderByOn(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowFilters(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowFilters((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowFilters(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowFilters(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_Caption(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Caption((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Caption(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Caption(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_DefaultView(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_DefaultView((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DefaultView(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_DefaultView(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_ViewsAllowed(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_ViewsAllowed((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ViewsAllowed(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_ViewsAllowed(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowEditing(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowEditing((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowEditing(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowEditing(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_DefaultEditing(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_DefaultEditing((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DefaultEditing(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_DefaultEditing(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowEdits(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowEdits((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowEdits(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowEdits(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowDeletions(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowDeletions((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowDeletions(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowDeletions(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowAdditions(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowAdditions((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowAdditions(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowAdditions(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_DataEntry(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_DataEntry((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DataEntry(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_DataEntry(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_AllowUpdating(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_AllowUpdating((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowUpdating(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowUpdating(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_RecordsetType(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_RecordsetType((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_RecordsetType(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_RecordsetType(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_RecordLocks(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_RecordLocks((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_RecordLocks(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_RecordLocks(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_ScrollBars(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_ScrollBars((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ScrollBars(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_ScrollBars(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_RecordSelectors(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_RecordSelectors((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_RecordSelectors(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_RecordSelectors(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_NavigationButtons(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_NavigationButtons((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_NavigationButtons(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_NavigationButtons(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_DividingLines(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_DividingLines((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DividingLines(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_DividingLines(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AutoResize(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AutoResize((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AutoResize(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AutoResize(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AutoCenter(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AutoCenter((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AutoCenter(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AutoCenter(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_PopUp(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_PopUp((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PopUp(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_PopUp(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_Modal(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Modal((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Modal(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Modal(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_BorderStyle(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_BorderStyle((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BorderStyle(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_BorderStyle(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_ControlBox(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_ControlBox((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ControlBox(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_ControlBox(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_MinButton(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_MinButton((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_MinButton(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_MinButton(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_MaxButton(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_MaxButton((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_MaxButton(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_MaxButton(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_MinMaxButtons(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_MinMaxButtons((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_MinMaxButtons(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_MinMaxButtons(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_CloseButton(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_CloseButton((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CloseButton(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_CloseButton(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_WhatsThisButton(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_WhatsThisButton((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_WhatsThisButton(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_WhatsThisButton(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_Width(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_Width((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Width(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_Width(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_Picture(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Picture((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Picture(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Picture(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_PictureType(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_PictureType((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PictureType(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureType(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_PictureSizeMode(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_PictureSizeMode((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PictureSizeMode(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureSizeMode(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_PictureAlignment(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_PictureAlignment((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PictureAlignment(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureAlignment(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_PictureTiling(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_PictureTiling((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PictureTiling(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureTiling(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_Cycle(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_Cycle((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Cycle(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_Cycle(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_MenuBar(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_MenuBar((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_MenuBar(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_MenuBar(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_Toolbar(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Toolbar((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Toolbar(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Toolbar(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_ShortcutMenu(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_ShortcutMenu((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ShortcutMenu(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_ShortcutMenu(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_ShortcutMenuBar(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_ShortcutMenuBar((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ShortcutMenuBar(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_ShortcutMenuBar(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_GridX(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_GridX((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_GridX(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_GridX(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_GridY(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_GridY((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_GridY(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_GridY(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_LayoutForPrint(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_LayoutForPrint((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_LayoutForPrint(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_LayoutForPrint(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_FastLaserPrinting(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_FastLaserPrinting((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_FastLaserPrinting(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_FastLaserPrinting(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_HelpFile(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_HelpFile((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_HelpFile(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_HelpFile(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_HelpContextId(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_HelpContextId((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_HelpContextId(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_HelpContextId(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_RowHeight(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_RowHeight((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_RowHeight(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_RowHeight(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_DatasheetFontName(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_DatasheetFontName((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetFontName(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetFontName(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_DatasheetFontHeight(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetFontHeight((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetFontHeight(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetFontHeight(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_DatasheetFontWeight(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetFontWeight((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetFontWeight(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetFontWeight(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_DatasheetFontItalic(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetFontItalic((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetFontItalic(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetFontItalic(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_DatasheetFontUnderline(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetFontUnderline((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetFontUnderline(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetFontUnderline(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_TabularCharSet(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_TabularCharSet((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_TabularCharSet(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_TabularCharSet(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_DatasheetGridlinesBehavior(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetGridlinesBehavior((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetGridlinesBehavior(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetGridlinesBehavior(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_DatasheetGridlinesColor(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetGridlinesColor((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetGridlinesColor(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetGridlinesColor(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_DatasheetCellsEffect(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetCellsEffect((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetCellsEffect(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetCellsEffect(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_DatasheetForeColor(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetForeColor((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetForeColor(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetForeColor(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_ShowGrid(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_ShowGrid((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ShowGrid(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_ShowGrid(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_DatasheetBackColor(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetBackColor((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetBackColor(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetBackColor(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_Hwnd(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_Hwnd((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Hwnd(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_Hwnd(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_Count(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_Count((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Count(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_Count(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_Page(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_Page((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Page(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_Page(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_Pages(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_Pages((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Pages(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_Pages(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_LogicalPageWidth(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_LogicalPageWidth((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_LogicalPageWidth(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_LogicalPageWidth(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_LogicalPageHeight(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_LogicalPageHeight((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_LogicalPageHeight(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_LogicalPageHeight(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_ZoomControl(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_ZoomControl((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ZoomControl(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_ZoomControl(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_Visible(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Visible((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Visible(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Visible(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_Painting(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Painting((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Painting(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Painting(pRet/*[in]*/);
}

VARIANT __fastcall TAccessForm::get_PrtMip(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PrtMip((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PrtMip(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PrtMip(pRet/*[in]*/);
}

VARIANT __fastcall TAccessForm::get_PrtDevMode(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PrtDevMode((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PrtDevMode(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PrtDevMode(pRet/*[in]*/);
}

VARIANT __fastcall TAccessForm::get_PrtDevNames(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PrtDevNames((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PrtDevNames(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PrtDevNames(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_FrozenColumns(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_FrozenColumns((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_FrozenColumns(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_FrozenColumns(pRet/*[in]*/);
}

VARIANT __fastcall TAccessForm::get_Bookmark(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_Bookmark((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Bookmark(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_Bookmark(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_TabularFamily(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_TabularFamily((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_TabularFamily(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_TabularFamily(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get__Name(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get__Name((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set__Name(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set__Name(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_PaletteSource(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_PaletteSource((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PaletteSource(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_PaletteSource(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_Tag(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Tag((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Tag(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Tag(pRet/*[in]*/);
}

VARIANT __fastcall TAccessForm::get_PaintPalette(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PaintPalette((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PaintPalette(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PaintPalette(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnMenu(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnMenu((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnMenu(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnMenu(pRet/*[in]*/);
}

VARIANT __fastcall TAccessForm::get_OpenArgs(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_OpenArgs((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OpenArgs(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_OpenArgs(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_ConnectSynch(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_ConnectSynch((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ConnectSynch(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_ConnectSynch(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnCurrent(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnCurrent((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnCurrent(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnCurrent(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnInsert(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnInsert((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnInsert(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnInsert(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_BeforeInsert(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_BeforeInsert((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BeforeInsert(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_BeforeInsert(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_AfterInsert(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_AfterInsert((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AfterInsert(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_AfterInsert(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_BeforeUpdate(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_BeforeUpdate((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BeforeUpdate(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_BeforeUpdate(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_AfterUpdate(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_AfterUpdate((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AfterUpdate(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_AfterUpdate(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnDirty(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnDirty((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnDirty(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnDirty(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnDelete(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnDelete((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnDelete(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnDelete(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_BeforeDelConfirm(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_BeforeDelConfirm((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BeforeDelConfirm(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_BeforeDelConfirm(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_AfterDelConfirm(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_AfterDelConfirm((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AfterDelConfirm(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_AfterDelConfirm(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnOpen(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnOpen((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnOpen(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnOpen(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnLoad(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnLoad((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnLoad(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnLoad(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnResize(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnResize((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnResize(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnResize(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnUnload(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnUnload((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnUnload(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnUnload(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnClose(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnClose((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnClose(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnClose(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnActivate(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnActivate((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnActivate(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnActivate(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnDeactivate(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnDeactivate((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnDeactivate(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnDeactivate(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnGotFocus(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnGotFocus((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnGotFocus(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnGotFocus(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnLostFocus(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnLostFocus((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnLostFocus(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnLostFocus(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnClick(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnClick((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnClick(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnClick(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnDblClick(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnDblClick((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnDblClick(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnDblClick(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnMouseDown(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnMouseDown((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnMouseDown(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnMouseDown(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnMouseMove(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnMouseMove((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnMouseMove(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnMouseMove(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnMouseUp(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnMouseUp((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnMouseUp(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnMouseUp(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnKeyDown(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnKeyDown((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnKeyDown(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnKeyDown(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnKeyUp(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnKeyUp((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnKeyUp(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnKeyUp(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnKeyPress(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnKeyPress((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnKeyPress(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnKeyPress(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_KeyPreview(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_KeyPreview((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_KeyPreview(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_KeyPreview(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnError(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnError((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnError(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnError(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnFilter(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnFilter((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnFilter(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnFilter(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnApplyFilter(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnApplyFilter((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnApplyFilter(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnApplyFilter(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnTimer(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnTimer((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnTimer(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnTimer(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_TimerInterval(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_TimerInterval((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_TimerInterval(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_TimerInterval(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_Dirty(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Dirty((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Dirty(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Dirty(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_WindowWidth(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_WindowWidth((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_WindowWidth(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_WindowWidth(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_WindowHeight(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_WindowHeight((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_WindowHeight(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_WindowHeight(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_CurrentView(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentView((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CurrentView(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_CurrentView(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_CurrentSectionTop(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentSectionTop((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CurrentSectionTop(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_CurrentSectionTop(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_CurrentSectionLeft(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentSectionLeft((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CurrentSectionLeft(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_CurrentSectionLeft(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_SelLeft(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_SelLeft((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_SelLeft(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_SelLeft(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_SelTop(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_SelTop((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_SelTop(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_SelTop(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_SelWidth(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_SelWidth((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_SelWidth(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_SelWidth(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_SelHeight(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_SelHeight((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_SelHeight(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_SelHeight(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_CurrentRecord(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentRecord((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CurrentRecord(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_CurrentRecord(pRet/*[in]*/);
}

VARIANT __fastcall TAccessForm::get_PictureData(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PictureData((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PictureData(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureData(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_InsideHeight(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_InsideHeight((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_InsideHeight(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_InsideHeight(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_InsideWidth(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_InsideWidth((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_InsideWidth(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_InsideWidth(pRet/*[in]*/);
}

VARIANT __fastcall TAccessForm::get_PicturePalette(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PicturePalette((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PicturePalette(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PicturePalette(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_HasModule(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_HasModule((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_HasModule(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_HasModule(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_acHiddenCurrentPage(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_acHiddenCurrentPage((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_acHiddenCurrentPage(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_acHiddenCurrentPage(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_Orientation(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_Orientation((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Orientation(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_Orientation(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowDesignChanges(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowDesignChanges((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowDesignChanges(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowDesignChanges(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_ServerFilter(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_ServerFilter((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ServerFilter(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_ServerFilter(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_ServerFilterByForm(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_ServerFilterByForm((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ServerFilterByForm(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_ServerFilterByForm(pRet/*[in]*/);
}

long __fastcall TAccessForm::get_MaxRecords(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_MaxRecords((long*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_MaxRecords(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_MaxRecords(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_UniqueTable(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_UniqueTable((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_UniqueTable(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_UniqueTable(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_ResyncCommand(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_ResyncCommand((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ResyncCommand(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_ResyncCommand(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_InputParameters(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_InputParameters((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_InputParameters(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_InputParameters(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_MaxRecButton(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_MaxRecButton((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_MaxRecButton(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_MaxRecButton(pRet/*[in]*/);
}

Access_xp::AccessApplicationPtr __fastcall TAccessForm::get_Application(void)
{
  Access_xp::AccessApplicationPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Application(&pRet));
  return pRet;
}

LPDISPATCH __fastcall TAccessForm::get_Parent(void)
{
  LPDISPATCH pRet;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&pRet));
  return pRet;
}

short __fastcall TAccessForm::get_NewRecord(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_NewRecord((short*)&pRet));
  return pRet;
}

Access_xp::AccessControlPtr __fastcall TAccessForm::get_ActiveControl(void)
{
  Access_xp::AccessControlPtr pRet;
  OLECHECK(GetDefaultInterface()->get_ActiveControl(&pRet));
  return pRet;
}

Access_xp::AccessControl* __fastcall TAccessForm::get_DefaultControl(long ControlType/*[in]*/)
{
  Access_xp::AccessControl* pRet = 0;
  OLECHECK(GetDefaultInterface()->get_DefaultControl(ControlType, (Access_xp::AccessControl**)&pRet));
  return pRet;
}

LPDISPATCH __fastcall TAccessForm::get_Dynaset(void)
{
  LPDISPATCH pRet;
  OLECHECK(GetDefaultInterface()->get_Dynaset((LPDISPATCH*)&pRet));
  return pRet;
}

LPDISPATCH __fastcall TAccessForm::get_RecordsetClone(void)
{
  LPDISPATCH pRet;
  OLECHECK(GetDefaultInterface()->get_RecordsetClone((LPDISPATCH*)&pRet));
  return pRet;
}

LPDISPATCH __fastcall TAccessForm::get_Recordset(void)
{
  LPDISPATCH pRet;
  OLECHECK(GetDefaultInterface()->get_Recordset((LPDISPATCH*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::_set_Recordset(LPDISPATCH pRet/*[in]*/)
{
  GetDefaultInterface()->_set_Recordset(pRet/*[in]*/);
}

Access_xp::AccessSection* __fastcall TAccessForm::get_Section(VARIANT Index/*[in]*/)
{
  Access_xp::AccessSection* pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Section(Index, (Access_xp::AccessSection**)&pRet));
  return pRet;
}

Access_xp::AccessFormPtr __fastcall TAccessForm::get_Form(void)
{
  Access_xp::AccessFormPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Form(&pRet));
  return pRet;
}

Access_xp::ModulePtr __fastcall TAccessForm::get_Module(void)
{
  Access_xp::ModulePtr pRet;
  OLECHECK(GetDefaultInterface()->get_Module(&pRet));
  return pRet;
}

Access_xp::PropertiesPtr __fastcall TAccessForm::get_Properties(void)
{
  Access_xp::PropertiesPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Properties(&pRet));
  return pRet;
}

Access_xp::AccessControlPtr __fastcall TAccessForm::get_ConnectControl(void)
{
  Access_xp::AccessControlPtr pRet;
  OLECHECK(GetDefaultInterface()->get_ConnectControl(&pRet));
  return pRet;
}

Access_xp::Controls_Ptr __fastcall TAccessForm::get_Controls(void)
{
  Access_xp::Controls_Ptr pRet;
  OLECHECK(GetDefaultInterface()->get_Controls(&pRet));
  return pRet;
}

BSTR __fastcall TAccessForm::get_Name(void)
{
  BSTR pbstrName = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&pbstrName));
  return pbstrName;
}

void __fastcall TAccessForm::set_Name(BSTR pbstrName/*[in]*/)
{
  GetDefaultInterface()->set_Name(pbstrName/*[in]*/);
}

short __fastcall TAccessForm::get_SubdatasheetHeight(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_SubdatasheetHeight((short*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_SubdatasheetHeight(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_SubdatasheetHeight(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_SubdatasheetExpanded(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_SubdatasheetExpanded((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_SubdatasheetExpanded(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_SubdatasheetExpanded(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_DatasheetBorderLineStyle(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetBorderLineStyle((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetBorderLineStyle(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetBorderLineStyle(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_DatasheetColumnHeaderUnderlineStyle(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_DatasheetColumnHeaderUnderlineStyle((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DatasheetColumnHeaderUnderlineStyle(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_DatasheetColumnHeaderUnderlineStyle(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_HorizontalDatasheetGridlineStyle(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_HorizontalDatasheetGridlineStyle((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_HorizontalDatasheetGridlineStyle(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_HorizontalDatasheetGridlineStyle(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_VerticalDatasheetGridlineStyle(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_VerticalDatasheetGridlineStyle((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_VerticalDatasheetGridlineStyle(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_VerticalDatasheetGridlineStyle(pRet/*[in]*/);
}

short __fastcall TAccessForm::get_WindowTop(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_WindowTop((short*)&pRet));
  return pRet;
}

short __fastcall TAccessForm::get_WindowLeft(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_WindowLeft((short*)&pRet));
  return pRet;
}

BSTR __fastcall TAccessForm::get_OnUndo(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnUndo((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnUndo(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnUndo(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnRecordExit(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnRecordExit((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnRecordExit(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnRecordExit(pRet/*[in]*/);
}

Owc10_xp::PivotTableDeprecatedPtr __fastcall TAccessForm::get_PivotTable(void)
{
  Owc10_xp::PivotTableDeprecatedPtr ppRet;
  OLECHECK(GetDefaultInterface()->get_PivotTable(&ppRet));
  return ppRet;
}

Owc10_xp::ChartSpaceDeprecatedPtr __fastcall TAccessForm::get_ChartSpace(void)
{
  Owc10_xp::ChartSpaceDeprecatedPtr ppRet;
  OLECHECK(GetDefaultInterface()->get_ChartSpace(&ppRet));
  return ppRet;
}

Access_xp::_PrinterPtr __fastcall TAccessForm::get_Printer(void)
{
  Access_xp::_PrinterPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Printer(&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Printer(Access_xp::_PrinterPtr pRet/*[in]*/)
{
  GetDefaultInterface()->set_Printer(pRet/*[in]*/);
}

void __fastcall TAccessForm::_set_Printer(Access_xp::_Printer* pRet/*[in]*/)
{
  GetDefaultInterface()->_set_Printer(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_Moveable(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Moveable((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Moveable(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Moveable(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_BeginBatchEdit(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_BeginBatchEdit((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BeginBatchEdit(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_BeginBatchEdit(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_UndoBatchEdit(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_UndoBatchEdit((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_UndoBatchEdit(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_UndoBatchEdit(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_BeforeBeginTransaction(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_BeforeBeginTransaction((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BeforeBeginTransaction(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_BeforeBeginTransaction(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_AfterBeginTransaction(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_AfterBeginTransaction((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AfterBeginTransaction(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_AfterBeginTransaction(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_BeforeCommitTransaction(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_BeforeCommitTransaction((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BeforeCommitTransaction(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_BeforeCommitTransaction(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_AfterCommitTransaction(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_AfterCommitTransaction((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AfterCommitTransaction(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_AfterCommitTransaction(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_RollbackTransaction(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_RollbackTransaction((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_RollbackTransaction(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_RollbackTransaction(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowFormView(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowFormView((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowFormView(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowFormView(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowDatasheetView(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowDatasheetView((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowDatasheetView(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowDatasheetView(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowPivotTableView(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowPivotTableView((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowPivotTableView(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowPivotTableView(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_AllowPivotChartView(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AllowPivotChartView((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AllowPivotChartView(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AllowPivotChartView(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnConnect(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnConnect((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnConnect(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnConnect(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_OnDisconnect(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnDisconnect((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_OnDisconnect(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnDisconnect(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_PivotTableChange(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_PivotTableChange((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_PivotTableChange(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_PivotTableChange(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_Query(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Query((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_Query(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Query(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_BeforeQuery(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_BeforeQuery((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BeforeQuery(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_BeforeQuery(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_SelectionChange(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_SelectionChange((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_SelectionChange(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_SelectionChange(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_CommandBeforeExecute(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_CommandBeforeExecute((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CommandBeforeExecute(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_CommandBeforeExecute(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_CommandChecked(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_CommandChecked((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CommandChecked(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_CommandChecked(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_CommandEnabled(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_CommandEnabled((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CommandEnabled(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_CommandEnabled(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_CommandExecute(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_CommandExecute((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CommandExecute(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_CommandExecute(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_DataSetChange(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_DataSetChange((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DataSetChange(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_DataSetChange(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_BeforeScreenTip(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_BeforeScreenTip((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BeforeScreenTip(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_BeforeScreenTip(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_AfterFinalRender(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_AfterFinalRender((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AfterFinalRender(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_AfterFinalRender(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_AfterRender(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_AfterRender((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AfterRender(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_AfterRender(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_AfterLayout(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_AfterLayout((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_AfterLayout(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_AfterLayout(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_BeforeRender(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_BeforeRender((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BeforeRender(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_BeforeRender(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_MouseWheel(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_MouseWheel((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_MouseWheel(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_MouseWheel(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_ViewChange(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_ViewChange((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_ViewChange(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_ViewChange(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_DataChange(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_DataChange((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_DataChange(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_DataChange(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_FetchDefaults(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_FetchDefaults((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_FetchDefaults(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_FetchDefaults(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_BatchUpdates(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_BatchUpdates((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_BatchUpdates(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_BatchUpdates(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessForm::get_CommitOnClose(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_CommitOnClose((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CommitOnClose(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_CommitOnClose(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_CommitOnNavigation(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_CommitOnNavigation((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_CommitOnNavigation(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_CommitOnNavigation(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessForm::get_UseDefaultPrinter(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_UseDefaultPrinter((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_UseDefaultPrinter(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_UseDefaultPrinter(pRet/*[in]*/);
}

BSTR __fastcall TAccessForm::get_RecordSourceQualifier(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_RecordSourceQualifier((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessForm::set_RecordSourceQualifier(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_RecordSourceQualifier(pRet/*[in]*/);
}

_Report2Ptr& TAccessReport::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TAccessReport::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TAccessReport::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TAccessReport::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TAccessReport::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TAccessReport::ConnectTo(_Report2Ptr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TAccessReport::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_AccessReport;
  sd.IntfIID = __uuidof(_Report2);
  sd.EventIID= __uuidof(_ReportEvents);
  ServerData = &sd;
}

void __fastcall TAccessReport::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 2066: {
      if (OnOpen1) {
        (OnOpen1)(this, params[0].piVal);
      }
      break;
      }
    case 2070: {
      if (OnClose1) {
        (OnClose1)(this);
      }
      break;
      }
    case 2071: {
      if (OnActivate1) {
        (OnActivate1)(this);
      }
      break;
      }
    case 2072: {
      if (OnDeactivate1) {
        (OnDeactivate1)(this);
      }
      break;
      }
    case 2083: {
      if (OnError1) {
        (OnError1)(this, params[0].piVal, params[1].piVal);
      }
      break;
      }
    case 2161: {
      if (OnNoData1) {
        (OnNoData1)(this, params[0].piVal);
      }
      break;
      }
    case 2162: {
      if (OnPage1) {
        (OnPage1)(this);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TAccessReport::Circle(short flags/*[in]*/, float X/*[in]*/, float Y/*[in]*/, 
                                      float radius/*[in]*/, long color/*[in]*/, float start/*[in]*/, 
                                      float end/*[in]*/, float aspect/*[in]*/)
{
  GetDefaultInterface()->Circle(flags/*[in]*/, X/*[in]*/, Y/*[in]*/, radius/*[in]*/, color/*[in]*/, 
                                start/*[in]*/, end/*[in]*/, aspect/*[in]*/);
}

void __fastcall TAccessReport::Line(short flags/*[in]*/, float x1/*[in]*/, float y1/*[in]*/, 
                                    float x2/*[in]*/, float y2/*[in]*/, long color/*[in]*/)
{
  GetDefaultInterface()->Line(flags/*[in]*/, x1/*[in]*/, y1/*[in]*/, x2/*[in]*/, y2/*[in]*/, 
                              color/*[in]*/);
}

void __fastcall TAccessReport::PSet(short flags/*[in]*/, float X/*[in]*/, float Y/*[in]*/, 
                                    long color/*[in]*/)
{
  GetDefaultInterface()->PSet(flags/*[in]*/, X/*[in]*/, Y/*[in]*/, color/*[in]*/);
}

void __fastcall TAccessReport::Scale(short flags/*[in]*/, float x1/*[in]*/, float y1/*[in]*/, 
                                     float x2/*[in]*/, float y2/*[in]*/)
{
  GetDefaultInterface()->Scale(flags/*[in]*/, x1/*[in]*/, y1/*[in]*/, x2/*[in]*/, y2/*[in]*/);
}

float __fastcall TAccessReport::TextWidth(BSTR Expr/*[in]*/)
{
  float pRet;
  OLECHECK(GetDefaultInterface()->TextWidth(Expr, (float*)&pRet));
  return pRet;
}

float __fastcall TAccessReport::TextHeight(BSTR Expr/*[in]*/)
{
  float pRet;
  OLECHECK(GetDefaultInterface()->TextHeight(Expr, (float*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::Print(BSTR Expr/*[in]*/)
{
  GetDefaultInterface()->Print(Expr/*[in]*/);
}

VARIANT __fastcall TAccessReport::_Evaluate(BSTR bstrExpr/*[in]*/, LPSAFEARRAY* ppsa/*[in]*/)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->_Evaluate(bstrExpr, ppsa, (VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::Move(VARIANT Left/*[in]*/, VARIANT Top/*[in,opt]*/, 
                                    VARIANT Width/*[in,opt]*/, VARIANT Height/*[in,opt]*/)
{
  GetDefaultInterface()->Move(Left/*[in]*/, Top/*[in,opt]*/, Width/*[in,opt]*/, Height/*[in,opt]*/);
}

BSTR __fastcall TAccessReport::get_FormName(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_FormName((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FormName(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_FormName(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_RecordSource(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_RecordSource((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_RecordSource(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_RecordSource(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_Filter(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Filter((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Filter(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Filter(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_FilterOn(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_FilterOn((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FilterOn(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_FilterOn(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_OrderBy(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OrderBy((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OrderBy(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OrderBy(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_OrderByOn(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_OrderByOn((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OrderByOn(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_OrderByOn(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_ServerFilter(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_ServerFilter((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ServerFilter(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_ServerFilter(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_Caption(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Caption((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Caption(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Caption(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_RecordLocks(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_RecordLocks((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_RecordLocks(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_RecordLocks(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_PageHeader(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_PageHeader((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PageHeader(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_PageHeader(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_PageFooter(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_PageFooter((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PageFooter(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_PageFooter(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_DateGrouping(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_DateGrouping((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_DateGrouping(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_DateGrouping(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_GrpKeepTogether(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_GrpKeepTogether((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_GrpKeepTogether(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_GrpKeepTogether(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_MinButton(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_MinButton((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_MinButton(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_MinButton(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_MaxButton(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_MaxButton((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_MaxButton(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_MaxButton(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_Width(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_Width((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Width(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_Width(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_Picture(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Picture((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Picture(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Picture(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_PictureType(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_PictureType((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PictureType(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureType(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_PictureSizeMode(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_PictureSizeMode((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PictureSizeMode(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureSizeMode(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_PictureAlignment(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_PictureAlignment((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PictureAlignment(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureAlignment(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_PictureTiling(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_PictureTiling((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PictureTiling(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureTiling(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_PicturePages(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_PicturePages((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PicturePages(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_PicturePages(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_MenuBar(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_MenuBar((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_MenuBar(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_MenuBar(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_Toolbar(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Toolbar((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Toolbar(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Toolbar(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_ShortcutMenuBar(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_ShortcutMenuBar((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ShortcutMenuBar(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_ShortcutMenuBar(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_GridX(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_GridX((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_GridX(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_GridX(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_GridY(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_GridY((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_GridY(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_GridY(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_LayoutForPrint(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_LayoutForPrint((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_LayoutForPrint(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_LayoutForPrint(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_FastLaserPrinting(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_FastLaserPrinting((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FastLaserPrinting(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_FastLaserPrinting(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_HelpFile(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_HelpFile((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_HelpFile(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_HelpFile(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_HelpContextId(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_HelpContextId((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_HelpContextId(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_HelpContextId(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_Hwnd(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_Hwnd((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Hwnd(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_Hwnd(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_Count(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_Count((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Count(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_Count(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_Page(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_Page((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Page(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_Page(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_Pages(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_Pages((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Pages(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_Pages(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_LogicalPageWidth(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_LogicalPageWidth((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_LogicalPageWidth(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_LogicalPageWidth(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_LogicalPageHeight(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_LogicalPageHeight((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_LogicalPageHeight(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_LogicalPageHeight(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_ZoomControl(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_ZoomControl((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ZoomControl(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_ZoomControl(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_HasData(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_HasData((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_HasData(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_HasData(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_Left(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_Left((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Left(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_Left(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_Top(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_Top((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Top(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_Top(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_Height(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_Height((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Height(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_Height(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_PrintSection(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_PrintSection((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PrintSection(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_PrintSection(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_NextRecord(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_NextRecord((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_NextRecord(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_NextRecord(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_MoveLayout(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_MoveLayout((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_MoveLayout(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_MoveLayout(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_FormatCount(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_FormatCount((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FormatCount(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_FormatCount(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_PrintCount(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_PrintCount((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PrintCount(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_PrintCount(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_Visible(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Visible((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Visible(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Visible(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_Painting(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Painting((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Painting(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Painting(pRet/*[in]*/);
}

VARIANT __fastcall TAccessReport::get_PrtMip(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PrtMip((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PrtMip(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PrtMip(pRet/*[in]*/);
}

VARIANT __fastcall TAccessReport::get_PrtDevMode(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PrtDevMode((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PrtDevMode(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PrtDevMode(pRet/*[in]*/);
}

VARIANT __fastcall TAccessReport::get_PrtDevNames(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PrtDevNames((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PrtDevNames(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PrtDevNames(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_ForeColor(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_ForeColor((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ForeColor(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_ForeColor(pRet/*[in]*/);
}

float __fastcall TAccessReport::get_CurrentX(void)
{
  float pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentX((float*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_CurrentX(float pRet/*[in]*/)
{
  GetDefaultInterface()->set_CurrentX(pRet/*[in]*/);
}

float __fastcall TAccessReport::get_CurrentY(void)
{
  float pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentY((float*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_CurrentY(float pRet/*[in]*/)
{
  GetDefaultInterface()->set_CurrentY(pRet/*[in]*/);
}

float __fastcall TAccessReport::get_ScaleHeight(void)
{
  float pRet;
  OLECHECK(GetDefaultInterface()->get_ScaleHeight((float*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ScaleHeight(float pRet/*[in]*/)
{
  GetDefaultInterface()->set_ScaleHeight(pRet/*[in]*/);
}

float __fastcall TAccessReport::get_ScaleLeft(void)
{
  float pRet;
  OLECHECK(GetDefaultInterface()->get_ScaleLeft((float*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ScaleLeft(float pRet/*[in]*/)
{
  GetDefaultInterface()->set_ScaleLeft(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_ScaleMode(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_ScaleMode((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ScaleMode(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_ScaleMode(pRet/*[in]*/);
}

float __fastcall TAccessReport::get_ScaleTop(void)
{
  float pRet;
  OLECHECK(GetDefaultInterface()->get_ScaleTop((float*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ScaleTop(float pRet/*[in]*/)
{
  GetDefaultInterface()->set_ScaleTop(pRet/*[in]*/);
}

float __fastcall TAccessReport::get_ScaleWidth(void)
{
  float pRet;
  OLECHECK(GetDefaultInterface()->get_ScaleWidth((float*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ScaleWidth(float pRet/*[in]*/)
{
  GetDefaultInterface()->set_ScaleWidth(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_FontBold(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_FontBold((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FontBold(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_FontBold(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_FontItalic(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_FontItalic((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FontItalic(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_FontItalic(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_FontName(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_FontName((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FontName(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_FontName(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_FontSize(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_FontSize((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FontSize(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_FontSize(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_FontUnderline(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_FontUnderline((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FontUnderline(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_FontUnderline(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_DrawMode(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_DrawMode((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_DrawMode(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_DrawMode(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_DrawStyle(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_DrawStyle((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_DrawStyle(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_DrawStyle(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_DrawWidth(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_DrawWidth((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_DrawWidth(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_DrawWidth(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_FillColor(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_FillColor((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FillColor(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_FillColor(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_FillStyle(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_FillStyle((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_FillStyle(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_FillStyle(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get__Name(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get__Name((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set__Name(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set__Name(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_PaletteSource(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_PaletteSource((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PaletteSource(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_PaletteSource(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_Tag(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Tag((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Tag(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_Tag(pRet/*[in]*/);
}

VARIANT __fastcall TAccessReport::get_PaintPalette(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PaintPalette((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PaintPalette(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PaintPalette(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_OnMenu(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnMenu((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OnMenu(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnMenu(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_OnOpen(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnOpen((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OnOpen(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnOpen(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_OnClose(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnClose((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OnClose(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnClose(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_OnActivate(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnActivate((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OnActivate(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnActivate(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_OnDeactivate(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnDeactivate((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OnDeactivate(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnDeactivate(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_OnNoData(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnNoData((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OnNoData(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnNoData(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_OnPage(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnPage((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OnPage(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnPage(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_OnError(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_OnError((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OnError(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_OnError(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_Dirty(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Dirty((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Dirty(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Dirty(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_CurrentRecord(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_CurrentRecord((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_CurrentRecord(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_CurrentRecord(pRet/*[in]*/);
}

VARIANT __fastcall TAccessReport::get_PictureData(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PictureData((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PictureData(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PictureData(pRet/*[in]*/);
}

VARIANT __fastcall TAccessReport::get_PicturePalette(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_PicturePalette((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PicturePalette(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_PicturePalette(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_HasModule(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_HasModule((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_HasModule(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_HasModule(pRet/*[in]*/);
}

long __fastcall TAccessReport::get_acHiddenCurrentPage(void)
{
  long pRet;
  OLECHECK(GetDefaultInterface()->get_acHiddenCurrentPage((long*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_acHiddenCurrentPage(long pRet/*[in]*/)
{
  GetDefaultInterface()->set_acHiddenCurrentPage(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_Orientation(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_Orientation((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Orientation(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_Orientation(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_InputParameters(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_InputParameters((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_InputParameters(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_InputParameters(pRet/*[in]*/);
}

Access_xp::AccessApplicationPtr __fastcall TAccessReport::get_Application(void)
{
  Access_xp::AccessApplicationPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Application(&pRet));
  return pRet;
}

LPDISPATCH __fastcall TAccessReport::get_Parent(void)
{
  LPDISPATCH pRet;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&pRet));
  return pRet;
}

Access_xp::AccessControlPtr __fastcall TAccessReport::get_ActiveControl(void)
{
  Access_xp::AccessControlPtr pRet;
  OLECHECK(GetDefaultInterface()->get_ActiveControl(&pRet));
  return pRet;
}

Access_xp::AccessControl* __fastcall TAccessReport::get_DefaultControl(long ControlType/*[in]*/)
{
  Access_xp::AccessControl* pRet = 0;
  OLECHECK(GetDefaultInterface()->get_DefaultControl(ControlType, (Access_xp::AccessControl**)&pRet));
  return pRet;
}

Access_xp::AccessSection* __fastcall TAccessReport::get_Section(VARIANT Index/*[in]*/)
{
  Access_xp::AccessSection* pRet = 0;
  OLECHECK(GetDefaultInterface()->get_Section(Index, (Access_xp::AccessSection**)&pRet));
  return pRet;
}

Access_xp::AccessGroupLevel* __fastcall TAccessReport::get_GroupLevel(long Index/*[in]*/)
{
  Access_xp::AccessGroupLevel* pRet = 0;
  OLECHECK(GetDefaultInterface()->get_GroupLevel(Index, (Access_xp::AccessGroupLevel**)&pRet));
  return pRet;
}

Access_xp::AccessReportPtr __fastcall TAccessReport::get_Report(void)
{
  Access_xp::AccessReportPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Report(&pRet));
  return pRet;
}

Access_xp::ModulePtr __fastcall TAccessReport::get_Module(void)
{
  Access_xp::ModulePtr pRet;
  OLECHECK(GetDefaultInterface()->get_Module(&pRet));
  return pRet;
}

Access_xp::PropertiesPtr __fastcall TAccessReport::get_Properties(void)
{
  Access_xp::PropertiesPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Properties(&pRet));
  return pRet;
}

Access_xp::Controls_Ptr __fastcall TAccessReport::get_Controls(void)
{
  Access_xp::Controls_Ptr pRet;
  OLECHECK(GetDefaultInterface()->get_Controls(&pRet));
  return pRet;
}

BSTR __fastcall TAccessReport::get_Name(void)
{
  BSTR pbstrName = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&pbstrName));
  return pbstrName;
}

void __fastcall TAccessReport::set_Name(BSTR pbstrName/*[in]*/)
{
  GetDefaultInterface()->set_Name(pbstrName/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_AutoResize(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AutoResize((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_AutoResize(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AutoResize(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_AutoCenter(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_AutoCenter((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_AutoCenter(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_AutoCenter(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_PopUp(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_PopUp((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_PopUp(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_PopUp(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_Modal(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Modal((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Modal(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Modal(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_BorderStyle(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_BorderStyle((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_BorderStyle(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_BorderStyle(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_ControlBox(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_ControlBox((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_ControlBox(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_ControlBox(pRet/*[in]*/);
}

unsigned_char __fastcall TAccessReport::get_MinMaxButtons(void)
{
  unsigned_char pRet;
  OLECHECK(GetDefaultInterface()->get_MinMaxButtons((unsigned_char*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_MinMaxButtons(unsigned_char pRet/*[in]*/)
{
  GetDefaultInterface()->set_MinMaxButtons(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_CloseButton(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_CloseButton((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_CloseButton(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_CloseButton(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_WindowWidth(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_WindowWidth((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_WindowWidth(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_WindowWidth(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_WindowHeight(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_WindowHeight((short*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_WindowHeight(short pRet/*[in]*/)
{
  GetDefaultInterface()->set_WindowHeight(pRet/*[in]*/);
}

short __fastcall TAccessReport::get_WindowTop(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_WindowTop((short*)&pRet));
  return pRet;
}

short __fastcall TAccessReport::get_WindowLeft(void)
{
  short pRet;
  OLECHECK(GetDefaultInterface()->get_WindowLeft((short*)&pRet));
  return pRet;
}

VARIANT __fastcall TAccessReport::get_OpenArgs(void)
{
  VARIANT pRet;
  OLECHECK(GetDefaultInterface()->get_OpenArgs((VARIANT*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_OpenArgs(VARIANT pRet/*[in]*/)
{
  GetDefaultInterface()->set_OpenArgs(pRet/*[in]*/);
}

Access_xp::_PrinterPtr __fastcall TAccessReport::get_Printer(void)
{
  Access_xp::_PrinterPtr pRet;
  OLECHECK(GetDefaultInterface()->get_Printer(&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Printer(Access_xp::_PrinterPtr pRet/*[in]*/)
{
  GetDefaultInterface()->set_Printer(pRet/*[in]*/);
}

void __fastcall TAccessReport::_set_Printer(Access_xp::_Printer* pRet/*[in]*/)
{
  GetDefaultInterface()->_set_Printer(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_Moveable(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_Moveable((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_Moveable(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_Moveable(pRet/*[in]*/);
}

VARIANT_BOOL __fastcall TAccessReport::get_UseDefaultPrinter(void)
{
  VARIANT_BOOL pRet;
  OLECHECK(GetDefaultInterface()->get_UseDefaultPrinter((VARIANT_BOOL*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_UseDefaultPrinter(VARIANT_BOOL pRet/*[in]*/)
{
  GetDefaultInterface()->set_UseDefaultPrinter(pRet/*[in]*/);
}

LPDISPATCH __fastcall TAccessReport::get_Recordset(void)
{
  LPDISPATCH pRet;
  OLECHECK(GetDefaultInterface()->get_Recordset((LPDISPATCH*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::_set_Recordset(LPDISPATCH pRet/*[in]*/)
{
  GetDefaultInterface()->_set_Recordset(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_RecordSourceQualifier(void)
{
  BSTR pRet = 0;
  OLECHECK(GetDefaultInterface()->get_RecordSourceQualifier((BSTR*)&pRet));
  return pRet;
}

void __fastcall TAccessReport::set_RecordSourceQualifier(BSTR pRet/*[in]*/)
{
  GetDefaultInterface()->set_RecordSourceQualifier(pRet/*[in]*/);
}

BSTR __fastcall TAccessReport::get_Shape(void)
{
  BSTR pbstr = 0;
  OLECHECK(GetDefaultInterface()->get_Shape((BSTR*)&pbstr));
  return pbstr;
}


};     // namespace Access_xp


// *********************************************************************//
// The Register function is invoked by the IDE when this module is 
// installed in a Package. It provides the list of Components (including
// OCXes) implemented by this module. The following implementation
// informs the IDE of the OCX proxy classes implemented here.
// *********************************************************************//
namespace Access_xp_srvr
{

void __fastcall PACKAGE Register()
{
  // [4]
  System::Classes::TComponentClass cls_svr[] = {
                              __classid(Access_xp::TAccessApplication), 
                              __classid(Access_xp::TAccessReferences), 
                              __classid(Access_xp::TAccessForm), 
                              __classid(Access_xp::TAccessReport)
                           };
  System::Classes::RegisterComponents("OfficeXP", cls_svr,
                     sizeof(cls_svr)/sizeof(cls_svr[0])-1);
}

};     // namespace Access_xp_srvr
