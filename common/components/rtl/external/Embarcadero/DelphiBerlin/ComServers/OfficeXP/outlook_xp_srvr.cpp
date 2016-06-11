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
// File generated on 22/05/2012 10:26:36 from Type Library described below.

// ************************************************************************  //
// Type Lib: XP\MSOUTL.olb (1)
// LIBID: {00062FFF-0000-0000-C000-000000000046}
// LCID: 0
// Helpfile: C:\OLB\XP\VBAOL10.CHM 
// HelpString: Microsoft Outlook 10.0 Object Library
// DepndLst: 
//   (1) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (2) v2.2 Office, (C:\Program Files (x86)\Common Files\Microsoft Shared\Office10\MSO.DLL)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'Application' renamed to 'OutlookApplication'
//   Hint: Symbol 'Update' renamed to '_Update'
// Cmdline:
//   tlibimp  -C+ -Fe_XP -CE_XP_SRVR -Ha- -Hr+ -HpsOfficeXP -Yp+ -D.\cppXP -Cv-   -HpcContactItem -HpcDistListItem -HpcDocumentItem -HpcExplorers -HpcFolders  -HpcInspectors -HpcItems -HpcJournalItem -HpcMailItem -HpcNamespace -HpcRemoteItem -HpcReportItem -HpcSyncObject -HpcTaskRequestAcceptItem -HpcTaskRequestDeclineItem -HpcTaskRequestItem -HpcTaskRequestUpdateItem -HpcNameSpace -HpcOutlookBarGroups -HpcOutlookBarPane -HpcOutlookBarShortcuts -HpcPostItem XP\MSOUTL.olb
// ************************************************************************ //

#include <vcl.h>
#pragma hdrstop

#include <oleserver.hpp>
#include <dbolectl.hpp>
#if defined(USING_ATL)
#include <atl\atlvcl.h>
#endif

#pragma option -w-8122
#include "Outlook_XP_SRVR.h"

#if !defined(__PRAGMA_PACKAGE_SMART_INIT)
#define      __PRAGMA_PACKAGE_SMART_INIT
#pragma package(smart_init)
#endif

namespace Outlook_xp
{

_SyncObjectPtr& TSyncObject::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TSyncObject::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TSyncObject::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TSyncObject::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TSyncObject::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TSyncObject::ConnectTo(_SyncObjectPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TSyncObject::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_SyncObject;
  sd.IntfIID = __uuidof(_SyncObject);
  sd.EventIID= __uuidof(SyncObjectEvents);
  ServerData = &sd;
}

void __fastcall TSyncObject::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61441: {
      if (OnSyncStart) {
        (OnSyncStart)(this);
      }
      break;
      }
    case 61442: {
      if (OnProgress) {
        (OnProgress)(this, (Outlook_xp::OlSyncState)(int)params[0], params[1].bstrVal, params[2], params[3]);
      }
      break;
      }
    case 61443: {
      if (OnError) {
        (OnError)(this, params[0], params[1].bstrVal);
      }
      break;
      }
    case 61444: {
      if (OnSyncEnd) {
        (OnSyncEnd)(this);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TSyncObject::Start(void)
{
  GetDefaultInterface()->Start();
}

void __fastcall TSyncObject::Stop(void)
{
  GetDefaultInterface()->Stop();
}

Outlook_xp::_ApplicationPtr __fastcall TSyncObject::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TSyncObject::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TSyncObject::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TSyncObject::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

BSTR __fastcall TSyncObject::get_Name(void)
{
  BSTR Name = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&Name));
  return Name;
}

_MailItemPtr& TMailItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TMailItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TMailItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TMailItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TMailItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TMailItem::ConnectTo(_MailItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TMailItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_MailItem;
  sd.IntfIID = __uuidof(_MailItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TMailItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TMailItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TMailItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TMailItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TMailItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TMailItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TMailItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TMailItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TMailItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

void __fastcall TMailItem::ClearConversationIndex(void)
{
  GetDefaultInterface()->ClearConversationIndex();
}

Outlook_xp::MailItem* __fastcall TMailItem::Forward(void)
{
  Outlook_xp::MailItem* Item = 0;
  OLECHECK(GetDefaultInterface()->Forward((Outlook_xp::MailItem**)&Item));
  return Item;
}

Outlook_xp::MailItem* __fastcall TMailItem::Reply(void)
{
  Outlook_xp::MailItem* Item = 0;
  OLECHECK(GetDefaultInterface()->Reply((Outlook_xp::MailItem**)&Item));
  return Item;
}

Outlook_xp::MailItem* __fastcall TMailItem::ReplyAll(void)
{
  Outlook_xp::MailItem* Item = 0;
  OLECHECK(GetDefaultInterface()->ReplyAll((Outlook_xp::MailItem**)&Item));
  return Item;
}

void __fastcall TMailItem::Send(void)
{
  GetDefaultInterface()->Send();
}

void __fastcall TMailItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TMailItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TMailItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TMailItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TMailItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TMailItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TMailItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TMailItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TMailItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TMailItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TMailItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TMailItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TMailItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TMailItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TMailItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TMailItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TMailItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TMailItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TMailItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TMailItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TMailItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TMailItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TMailItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TMailItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TMailItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TMailItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TMailItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TMailItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TMailItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TMailItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TMailItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TMailItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TMailItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TMailItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TMailItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TMailItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TMailItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TMailItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TMailItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TMailItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

VARIANT_BOOL __fastcall TMailItem::get_AlternateRecipientAllowed(void)
{
  VARIANT_BOOL AlternateRecipientAllowed;
  OLECHECK(GetDefaultInterface()->get_AlternateRecipientAllowed((VARIANT_BOOL*)&AlternateRecipientAllowed));
  return AlternateRecipientAllowed;
}

void __fastcall TMailItem::set_AlternateRecipientAllowed(VARIANT_BOOL AlternateRecipientAllowed/*[in]*/)
{
  GetDefaultInterface()->set_AlternateRecipientAllowed(AlternateRecipientAllowed/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_AutoForwarded(void)
{
  VARIANT_BOOL AutoForwarded;
  OLECHECK(GetDefaultInterface()->get_AutoForwarded((VARIANT_BOOL*)&AutoForwarded));
  return AutoForwarded;
}

void __fastcall TMailItem::set_AutoForwarded(VARIANT_BOOL AutoForwarded/*[in]*/)
{
  GetDefaultInterface()->set_AutoForwarded(AutoForwarded/*[in]*/);
}

BSTR __fastcall TMailItem::get_BCC(void)
{
  BSTR BCC = 0;
  OLECHECK(GetDefaultInterface()->get_BCC((BSTR*)&BCC));
  return BCC;
}

void __fastcall TMailItem::set_BCC(BSTR BCC/*[in]*/)
{
  GetDefaultInterface()->set_BCC(BCC/*[in]*/);
}

BSTR __fastcall TMailItem::get_CC(void)
{
  BSTR CC = 0;
  OLECHECK(GetDefaultInterface()->get_CC((BSTR*)&CC));
  return CC;
}

void __fastcall TMailItem::set_CC(BSTR CC/*[in]*/)
{
  GetDefaultInterface()->set_CC(CC/*[in]*/);
}

DATE __fastcall TMailItem::get_DeferredDeliveryTime(void)
{
  DATE DeferredDeliveryTime;
  OLECHECK(GetDefaultInterface()->get_DeferredDeliveryTime((DATE*)&DeferredDeliveryTime));
  return DeferredDeliveryTime;
}

void __fastcall TMailItem::set_DeferredDeliveryTime(DATE DeferredDeliveryTime/*[in]*/)
{
  GetDefaultInterface()->set_DeferredDeliveryTime(DeferredDeliveryTime/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_DeleteAfterSubmit(void)
{
  VARIANT_BOOL DeleteAfterSubmit;
  OLECHECK(GetDefaultInterface()->get_DeleteAfterSubmit((VARIANT_BOOL*)&DeleteAfterSubmit));
  return DeleteAfterSubmit;
}

void __fastcall TMailItem::set_DeleteAfterSubmit(VARIANT_BOOL DeleteAfterSubmit/*[in]*/)
{
  GetDefaultInterface()->set_DeleteAfterSubmit(DeleteAfterSubmit/*[in]*/);
}

DATE __fastcall TMailItem::get_ExpiryTime(void)
{
  DATE ExpiryTime;
  OLECHECK(GetDefaultInterface()->get_ExpiryTime((DATE*)&ExpiryTime));
  return ExpiryTime;
}

void __fastcall TMailItem::set_ExpiryTime(DATE ExpiryTime/*[in]*/)
{
  GetDefaultInterface()->set_ExpiryTime(ExpiryTime/*[in]*/);
}

DATE __fastcall TMailItem::get_FlagDueBy(void)
{
  DATE FlagDueBy;
  OLECHECK(GetDefaultInterface()->get_FlagDueBy((DATE*)&FlagDueBy));
  return FlagDueBy;
}

void __fastcall TMailItem::set_FlagDueBy(DATE FlagDueBy/*[in]*/)
{
  GetDefaultInterface()->set_FlagDueBy(FlagDueBy/*[in]*/);
}

BSTR __fastcall TMailItem::get_FlagRequest(void)
{
  BSTR FlagRequest = 0;
  OLECHECK(GetDefaultInterface()->get_FlagRequest((BSTR*)&FlagRequest));
  return FlagRequest;
}

void __fastcall TMailItem::set_FlagRequest(BSTR FlagRequest/*[in]*/)
{
  GetDefaultInterface()->set_FlagRequest(FlagRequest/*[in]*/);
}

Outlook_xp::OlFlagStatus __fastcall TMailItem::get_FlagStatus(void)
{
  Outlook_xp::OlFlagStatus FlagStatus;
  OLECHECK(GetDefaultInterface()->get_FlagStatus((Outlook_xp::OlFlagStatus*)&FlagStatus));
  return FlagStatus;
}

void __fastcall TMailItem::set_FlagStatus(Outlook_xp::OlFlagStatus FlagStatus/*[in]*/)
{
  GetDefaultInterface()->set_FlagStatus(FlagStatus/*[in]*/);
}

BSTR __fastcall TMailItem::get_HTMLBody(void)
{
  BSTR HTMLBody = 0;
  OLECHECK(GetDefaultInterface()->get_HTMLBody((BSTR*)&HTMLBody));
  return HTMLBody;
}

void __fastcall TMailItem::set_HTMLBody(BSTR HTMLBody/*[in]*/)
{
  GetDefaultInterface()->set_HTMLBody(HTMLBody/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_OriginatorDeliveryReportRequested(void)
{
  VARIANT_BOOL OriginatorDeliveryReportRequested;
  OLECHECK(GetDefaultInterface()->get_OriginatorDeliveryReportRequested((VARIANT_BOOL*)&OriginatorDeliveryReportRequested));
  return OriginatorDeliveryReportRequested;
}

void __fastcall TMailItem::set_OriginatorDeliveryReportRequested(VARIANT_BOOL OriginatorDeliveryReportRequested/*[in]*/)
{
  GetDefaultInterface()->set_OriginatorDeliveryReportRequested(OriginatorDeliveryReportRequested/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_ReadReceiptRequested(void)
{
  VARIANT_BOOL ReadReceiptRequested;
  OLECHECK(GetDefaultInterface()->get_ReadReceiptRequested((VARIANT_BOOL*)&ReadReceiptRequested));
  return ReadReceiptRequested;
}

void __fastcall TMailItem::set_ReadReceiptRequested(VARIANT_BOOL ReadReceiptRequested/*[in]*/)
{
  GetDefaultInterface()->set_ReadReceiptRequested(ReadReceiptRequested/*[in]*/);
}

BSTR __fastcall TMailItem::get_ReceivedByEntryID(void)
{
  BSTR ReceivedByEntryID = 0;
  OLECHECK(GetDefaultInterface()->get_ReceivedByEntryID((BSTR*)&ReceivedByEntryID));
  return ReceivedByEntryID;
}

BSTR __fastcall TMailItem::get_ReceivedByName(void)
{
  BSTR ReceivedByName = 0;
  OLECHECK(GetDefaultInterface()->get_ReceivedByName((BSTR*)&ReceivedByName));
  return ReceivedByName;
}

BSTR __fastcall TMailItem::get_ReceivedOnBehalfOfEntryID(void)
{
  BSTR ReceivedOnBehalfOfEntryID = 0;
  OLECHECK(GetDefaultInterface()->get_ReceivedOnBehalfOfEntryID((BSTR*)&ReceivedOnBehalfOfEntryID));
  return ReceivedOnBehalfOfEntryID;
}

BSTR __fastcall TMailItem::get_ReceivedOnBehalfOfName(void)
{
  BSTR ReceivedOnBehalfOfName = 0;
  OLECHECK(GetDefaultInterface()->get_ReceivedOnBehalfOfName((BSTR*)&ReceivedOnBehalfOfName));
  return ReceivedOnBehalfOfName;
}

DATE __fastcall TMailItem::get_ReceivedTime(void)
{
  DATE ReceivedTime;
  OLECHECK(GetDefaultInterface()->get_ReceivedTime((DATE*)&ReceivedTime));
  return ReceivedTime;
}

VARIANT_BOOL __fastcall TMailItem::get_RecipientReassignmentProhibited(void)
{
  VARIANT_BOOL RecipientReassignmentProhibited;
  OLECHECK(GetDefaultInterface()->get_RecipientReassignmentProhibited((VARIANT_BOOL*)&RecipientReassignmentProhibited));
  return RecipientReassignmentProhibited;
}

void __fastcall TMailItem::set_RecipientReassignmentProhibited(VARIANT_BOOL RecipientReassignmentProhibited/*[in]*/)
{
  GetDefaultInterface()->set_RecipientReassignmentProhibited(RecipientReassignmentProhibited/*[in]*/);
}

Outlook_xp::RecipientsPtr __fastcall TMailItem::get_Recipients(void)
{
  Outlook_xp::RecipientsPtr Recipients;
  OLECHECK(GetDefaultInterface()->get_Recipients(&Recipients));
  return Recipients;
}

VARIANT_BOOL __fastcall TMailItem::get_ReminderOverrideDefault(void)
{
  VARIANT_BOOL ReminderOverrideDefault;
  OLECHECK(GetDefaultInterface()->get_ReminderOverrideDefault((VARIANT_BOOL*)&ReminderOverrideDefault));
  return ReminderOverrideDefault;
}

void __fastcall TMailItem::set_ReminderOverrideDefault(VARIANT_BOOL ReminderOverrideDefault/*[in]*/)
{
  GetDefaultInterface()->set_ReminderOverrideDefault(ReminderOverrideDefault/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_ReminderPlaySound(void)
{
  VARIANT_BOOL ReminderPlaySound;
  OLECHECK(GetDefaultInterface()->get_ReminderPlaySound((VARIANT_BOOL*)&ReminderPlaySound));
  return ReminderPlaySound;
}

void __fastcall TMailItem::set_ReminderPlaySound(VARIANT_BOOL ReminderPlaySound/*[in]*/)
{
  GetDefaultInterface()->set_ReminderPlaySound(ReminderPlaySound/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_ReminderSet(void)
{
  VARIANT_BOOL ReminderSet;
  OLECHECK(GetDefaultInterface()->get_ReminderSet((VARIANT_BOOL*)&ReminderSet));
  return ReminderSet;
}

void __fastcall TMailItem::set_ReminderSet(VARIANT_BOOL ReminderSet/*[in]*/)
{
  GetDefaultInterface()->set_ReminderSet(ReminderSet/*[in]*/);
}

BSTR __fastcall TMailItem::get_ReminderSoundFile(void)
{
  BSTR ReminderSoundFile = 0;
  OLECHECK(GetDefaultInterface()->get_ReminderSoundFile((BSTR*)&ReminderSoundFile));
  return ReminderSoundFile;
}

void __fastcall TMailItem::set_ReminderSoundFile(BSTR ReminderSoundFile/*[in]*/)
{
  GetDefaultInterface()->set_ReminderSoundFile(ReminderSoundFile/*[in]*/);
}

DATE __fastcall TMailItem::get_ReminderTime(void)
{
  DATE ReminderTime;
  OLECHECK(GetDefaultInterface()->get_ReminderTime((DATE*)&ReminderTime));
  return ReminderTime;
}

void __fastcall TMailItem::set_ReminderTime(DATE ReminderTime/*[in]*/)
{
  GetDefaultInterface()->set_ReminderTime(ReminderTime/*[in]*/);
}

Outlook_xp::OlRemoteStatus __fastcall TMailItem::get_RemoteStatus(void)
{
  Outlook_xp::OlRemoteStatus RemoteStatus;
  OLECHECK(GetDefaultInterface()->get_RemoteStatus((Outlook_xp::OlRemoteStatus*)&RemoteStatus));
  return RemoteStatus;
}

void __fastcall TMailItem::set_RemoteStatus(Outlook_xp::OlRemoteStatus RemoteStatus/*[in]*/)
{
  GetDefaultInterface()->set_RemoteStatus(RemoteStatus/*[in]*/);
}

BSTR __fastcall TMailItem::get_ReplyRecipientNames(void)
{
  BSTR ReplyRecipientNames = 0;
  OLECHECK(GetDefaultInterface()->get_ReplyRecipientNames((BSTR*)&ReplyRecipientNames));
  return ReplyRecipientNames;
}

Outlook_xp::RecipientsPtr __fastcall TMailItem::get_ReplyRecipients(void)
{
  Outlook_xp::RecipientsPtr ReplyRecipients;
  OLECHECK(GetDefaultInterface()->get_ReplyRecipients(&ReplyRecipients));
  return ReplyRecipients;
}

Outlook_xp::MAPIFolderPtr __fastcall TMailItem::get_SaveSentMessageFolder(void)
{
  Outlook_xp::MAPIFolderPtr SaveSentMessageFolder;
  OLECHECK(GetDefaultInterface()->get_SaveSentMessageFolder(&SaveSentMessageFolder));
  return SaveSentMessageFolder;
}

void __fastcall TMailItem::_set_SaveSentMessageFolder(Outlook_xp::MAPIFolder* SaveSentMessageFolder/*[in]*/)
{
  GetDefaultInterface()->_set_SaveSentMessageFolder(SaveSentMessageFolder/*[in]*/);
}

BSTR __fastcall TMailItem::get_SenderName(void)
{
  BSTR SenderName = 0;
  OLECHECK(GetDefaultInterface()->get_SenderName((BSTR*)&SenderName));
  return SenderName;
}

VARIANT_BOOL __fastcall TMailItem::get_Sent(void)
{
  VARIANT_BOOL Sent;
  OLECHECK(GetDefaultInterface()->get_Sent((VARIANT_BOOL*)&Sent));
  return Sent;
}

DATE __fastcall TMailItem::get_SentOn(void)
{
  DATE SentOn;
  OLECHECK(GetDefaultInterface()->get_SentOn((DATE*)&SentOn));
  return SentOn;
}

BSTR __fastcall TMailItem::get_SentOnBehalfOfName(void)
{
  BSTR SentOnBehalfOfName = 0;
  OLECHECK(GetDefaultInterface()->get_SentOnBehalfOfName((BSTR*)&SentOnBehalfOfName));
  return SentOnBehalfOfName;
}

void __fastcall TMailItem::set_SentOnBehalfOfName(BSTR SentOnBehalfOfName/*[in]*/)
{
  GetDefaultInterface()->set_SentOnBehalfOfName(SentOnBehalfOfName/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_Submitted(void)
{
  VARIANT_BOOL Submitted;
  OLECHECK(GetDefaultInterface()->get_Submitted((VARIANT_BOOL*)&Submitted));
  return Submitted;
}

BSTR __fastcall TMailItem::get_To(void)
{
  BSTR To = 0;
  OLECHECK(GetDefaultInterface()->get_To((BSTR*)&To));
  return To;
}

void __fastcall TMailItem::set_To(BSTR To/*[in]*/)
{
  GetDefaultInterface()->set_To(To/*[in]*/);
}

BSTR __fastcall TMailItem::get_VotingOptions(void)
{
  BSTR VotingOptions = 0;
  OLECHECK(GetDefaultInterface()->get_VotingOptions((BSTR*)&VotingOptions));
  return VotingOptions;
}

void __fastcall TMailItem::set_VotingOptions(BSTR VotingOptions/*[in]*/)
{
  GetDefaultInterface()->set_VotingOptions(VotingOptions/*[in]*/);
}

BSTR __fastcall TMailItem::get_VotingResponse(void)
{
  BSTR VotingResponse = 0;
  OLECHECK(GetDefaultInterface()->get_VotingResponse((BSTR*)&VotingResponse));
  return VotingResponse;
}

void __fastcall TMailItem::set_VotingResponse(BSTR VotingResponse/*[in]*/)
{
  GetDefaultInterface()->set_VotingResponse(VotingResponse/*[in]*/);
}

Outlook_xp::LinksPtr __fastcall TMailItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::ItemPropertiesPtr __fastcall TMailItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlBodyFormat __fastcall TMailItem::get_BodyFormat(void)
{
  Outlook_xp::OlBodyFormat BodyFormat;
  OLECHECK(GetDefaultInterface()->get_BodyFormat((Outlook_xp::OlBodyFormat*)&BodyFormat));
  return BodyFormat;
}

void __fastcall TMailItem::set_BodyFormat(Outlook_xp::OlBodyFormat BodyFormat/*[in]*/)
{
  GetDefaultInterface()->set_BodyFormat(BodyFormat/*[in]*/);
}

Outlook_xp::OlDownloadState __fastcall TMailItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

long __fastcall TMailItem::get_InternetCodepage(void)
{
  long InternetCodepage;
  OLECHECK(GetDefaultInterface()->get_InternetCodepage((long*)&InternetCodepage));
  return InternetCodepage;
}

void __fastcall TMailItem::set_InternetCodepage(long InternetCodepage/*[in]*/)
{
  GetDefaultInterface()->set_InternetCodepage(InternetCodepage/*[in]*/);
}

Outlook_xp::OlRemoteStatus __fastcall TMailItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TMailItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TMailItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_ApplicationPtr& TOutlookApplication::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TOutlookApplication::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TOutlookApplication::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TOutlookApplication::Disconnect()
{
  if (m_DefaultIntf) {
    if (FAutoQuit)
      Quit();
    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TOutlookApplication::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TOutlookApplication::ConnectTo(_ApplicationPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TOutlookApplication::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_OutlookApplication;
  sd.IntfIID = __uuidof(_Application);
  sd.EventIID= __uuidof(ApplicationEvents_10);
  ServerData = &sd;
}

void __fastcall TOutlookApplication::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61442: {
      if (OnItemSend) {
        (OnItemSend)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61443: {
      if (OnNewMail) {
        (OnNewMail)(this);
      }
      break;
      }
    case 61444: {
      if (OnReminder) {
        (OnReminder)(this, params[0].pdispVal);
      }
      break;
      }
    case 61445: {
      if (OnOptionsPagesAdd) {
        (OnOptionsPagesAdd)(this, (Outlook_xp::PropertyPagesPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61446: {
      if (OnStartup) {
        (OnStartup)(this);
      }
      break;
      }
    case 61447: {
      if (OnQuit) {
        (OnQuit)(this);
      }
      break;
      }
    case 64106: {
      if (OnAdvancedSearchComplete) {
        (OnAdvancedSearchComplete)(this, (Outlook_xp::SearchPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 64107: {
      if (OnAdvancedSearchStopped) {
        (OnAdvancedSearchStopped)(this, (Outlook_xp::SearchPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 64144: {
      if (OnMAPILogonComplete) {
        (OnMAPILogonComplete)(this);
      }
      break;
      }
    default:
      break;
  }
}

Outlook_xp::_Explorer* __fastcall TOutlookApplication::ActiveExplorer(void)
{
  Outlook_xp::_Explorer* ActiveExplorer = 0;
  OLECHECK(GetDefaultInterface()->ActiveExplorer((Outlook_xp::_Explorer**)&ActiveExplorer));
  return ActiveExplorer;
}

Outlook_xp::_Inspector* __fastcall TOutlookApplication::ActiveInspector(void)
{
  Outlook_xp::_Inspector* ActiveInspector = 0;
  OLECHECK(GetDefaultInterface()->ActiveInspector((Outlook_xp::_Inspector**)&ActiveInspector));
  return ActiveInspector;
}

LPDISPATCH __fastcall TOutlookApplication::CreateItem(Outlook_xp::OlItemType ItemType/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->CreateItem(ItemType, (LPDISPATCH*)&Item));
  return Item;
}

LPDISPATCH __fastcall TOutlookApplication::CreateItemFromTemplate(BSTR TemplatePath/*[in]*/, 
                                                                  VARIANT InFolder/*[in,opt]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->CreateItemFromTemplate(TemplatePath, InFolder, (LPDISPATCH*)&Item));
  return Item;
}

LPDISPATCH __fastcall TOutlookApplication::CreateObject(BSTR ObjectName/*[in]*/)
{
  LPDISPATCH Object;
  OLECHECK(GetDefaultInterface()->CreateObject(ObjectName, (LPDISPATCH*)&Object));
  return Object;
}

Outlook_xp::_NameSpace* __fastcall TOutlookApplication::GetNamespace(BSTR Type/*[in]*/)
{
  Outlook_xp::_NameSpace* NameSpace = 0;
  OLECHECK(GetDefaultInterface()->GetNamespace(Type, (Outlook_xp::_NameSpace**)&NameSpace));
  return NameSpace;
}

void __fastcall TOutlookApplication::Quit(void)
{
  GetDefaultInterface()->Quit();
}

LPDISPATCH __fastcall TOutlookApplication::ActiveWindow(void)
{
  LPDISPATCH ActiveWindow;
  OLECHECK(GetDefaultInterface()->ActiveWindow((LPDISPATCH*)&ActiveWindow));
  return ActiveWindow;
}

LPDISPATCH __fastcall TOutlookApplication::CopyFile(BSTR FilePath/*[in]*/, 
                                                    BSTR DestFolderPath/*[in]*/)
{
  LPDISPATCH DocItem;
  OLECHECK(GetDefaultInterface()->CopyFile(FilePath, DestFolderPath, (LPDISPATCH*)&DocItem));
  return DocItem;
}

Outlook_xp::Search* __fastcall TOutlookApplication::AdvancedSearch(BSTR Scope/*[in]*/, 
                                                                   VARIANT Filter/*[in,opt]*/, 
                                                                   VARIANT SearchSubFolders/*[in,opt]*/, 
                                                                   VARIANT Tag/*[in,opt]*/)
{
  Outlook_xp::Search* AdvancedSearch = 0;
  OLECHECK(GetDefaultInterface()->AdvancedSearch(Scope, Filter, SearchSubFolders, Tag, (Outlook_xp::Search**)&AdvancedSearch));
  return AdvancedSearch;
}

VARIANT_BOOL __fastcall TOutlookApplication::IsSearchSynchronous(BSTR LookInFolders/*[in]*/)
{
  VARIANT_BOOL IsSearchSynchronous;
  OLECHECK(GetDefaultInterface()->IsSearchSynchronous(LookInFolders, (VARIANT_BOOL*)&IsSearchSynchronous));
  return IsSearchSynchronous;
}

void __fastcall TOutlookApplication::GetNewNickNames(VARIANT* pvar/*[in]*/)
{
  GetDefaultInterface()->GetNewNickNames(pvar/*[in]*/);
}

Outlook_xp::_ApplicationPtr __fastcall TOutlookApplication::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TOutlookApplication::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TOutlookApplication::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TOutlookApplication::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Office_xp::AssistantPtr __fastcall TOutlookApplication::get_Assistant(void)
{
  Office_xp::AssistantPtr Assistant;
  OLECHECK(GetDefaultInterface()->get_Assistant(&Assistant));
  return Assistant;
}

BSTR __fastcall TOutlookApplication::get_Name(void)
{
  BSTR Name = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&Name));
  return Name;
}

BSTR __fastcall TOutlookApplication::get_Version(void)
{
  BSTR Version = 0;
  OLECHECK(GetDefaultInterface()->get_Version((BSTR*)&Version));
  return Version;
}

Office_xp::COMAddInsPtr __fastcall TOutlookApplication::get_COMAddIns(void)
{
  Office_xp::COMAddInsPtr COMAddIns;
  OLECHECK(GetDefaultInterface()->get_COMAddIns(&COMAddIns));
  return COMAddIns;
}

Outlook_xp::_ExplorersPtr __fastcall TOutlookApplication::get_Explorers(void)
{
  Outlook_xp::_ExplorersPtr Explorers;
  OLECHECK(GetDefaultInterface()->get_Explorers(&Explorers));
  return Explorers;
}

Outlook_xp::_InspectorsPtr __fastcall TOutlookApplication::get_Inspectors(void)
{
  Outlook_xp::_InspectorsPtr Inspectors;
  OLECHECK(GetDefaultInterface()->get_Inspectors(&Inspectors));
  return Inspectors;
}

Office_xp::LanguageSettingsPtr __fastcall TOutlookApplication::get_LanguageSettings(void)
{
  Office_xp::LanguageSettingsPtr LanguageSettings;
  OLECHECK(GetDefaultInterface()->get_LanguageSettings(&LanguageSettings));
  return LanguageSettings;
}

BSTR __fastcall TOutlookApplication::get_ProductCode(void)
{
  BSTR ProductCode = 0;
  OLECHECK(GetDefaultInterface()->get_ProductCode((BSTR*)&ProductCode));
  return ProductCode;
}

Office_xp::AnswerWizardPtr __fastcall TOutlookApplication::get_AnswerWizard(void)
{
  Office_xp::AnswerWizardPtr AnswerWizard;
  OLECHECK(GetDefaultInterface()->get_AnswerWizard(&AnswerWizard));
  return AnswerWizard;
}

Office_xp::MsoFeatureInstall __fastcall TOutlookApplication::get_FeatureInstall(void)
{
  Office_xp::MsoFeatureInstall FeatureInstall;
  OLECHECK(GetDefaultInterface()->get_FeatureInstall((Office_xp::MsoFeatureInstall*)&FeatureInstall));
  return FeatureInstall;
}

void __fastcall TOutlookApplication::set_FeatureInstall(Office_xp::MsoFeatureInstall FeatureInstall/*[in]*/)
{
  GetDefaultInterface()->set_FeatureInstall(FeatureInstall/*[in]*/);
}

Outlook_xp::_RemindersPtr __fastcall TOutlookApplication::get_Reminders(void)
{
  Outlook_xp::_RemindersPtr Reminders;
  OLECHECK(GetDefaultInterface()->get_Reminders(&Reminders));
  return Reminders;
}

_ContactItemPtr& TContactItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TContactItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TContactItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TContactItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TContactItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TContactItem::ConnectTo(_ContactItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TContactItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_ContactItem;
  sd.IntfIID = __uuidof(_ContactItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TContactItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TContactItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TContactItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TContactItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TContactItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TContactItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TContactItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TContactItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TContactItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

Outlook_xp::MailItem* __fastcall TContactItem::ForwardAsVcard(void)
{
  Outlook_xp::MailItem* Item = 0;
  OLECHECK(GetDefaultInterface()->ForwardAsVcard((Outlook_xp::MailItem**)&Item));
  return Item;
}

void __fastcall TContactItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TContactItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TContactItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TContactItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TContactItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TContactItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TContactItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TContactItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TContactItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TContactItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TContactItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TContactItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TContactItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TContactItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TContactItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TContactItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TContactItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TContactItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TContactItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TContactItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TContactItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TContactItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TContactItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TContactItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TContactItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TContactItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TContactItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TContactItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TContactItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TContactItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TContactItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TContactItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TContactItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TContactItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TContactItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TContactItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TContactItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TContactItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TContactItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TContactItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TContactItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TContactItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

BSTR __fastcall TContactItem::get_Account(void)
{
  BSTR Account = 0;
  OLECHECK(GetDefaultInterface()->get_Account((BSTR*)&Account));
  return Account;
}

void __fastcall TContactItem::set_Account(BSTR Account/*[in]*/)
{
  GetDefaultInterface()->set_Account(Account/*[in]*/);
}

DATE __fastcall TContactItem::get_Anniversary(void)
{
  DATE Anniversary;
  OLECHECK(GetDefaultInterface()->get_Anniversary((DATE*)&Anniversary));
  return Anniversary;
}

void __fastcall TContactItem::set_Anniversary(DATE Anniversary/*[in]*/)
{
  GetDefaultInterface()->set_Anniversary(Anniversary/*[in]*/);
}

BSTR __fastcall TContactItem::get_AssistantName(void)
{
  BSTR AssistantName = 0;
  OLECHECK(GetDefaultInterface()->get_AssistantName((BSTR*)&AssistantName));
  return AssistantName;
}

void __fastcall TContactItem::set_AssistantName(BSTR AssistantName/*[in]*/)
{
  GetDefaultInterface()->set_AssistantName(AssistantName/*[in]*/);
}

BSTR __fastcall TContactItem::get_AssistantTelephoneNumber(void)
{
  BSTR AssistantTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_AssistantTelephoneNumber((BSTR*)&AssistantTelephoneNumber));
  return AssistantTelephoneNumber;
}

void __fastcall TContactItem::set_AssistantTelephoneNumber(BSTR AssistantTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_AssistantTelephoneNumber(AssistantTelephoneNumber/*[in]*/);
}

DATE __fastcall TContactItem::get_Birthday(void)
{
  DATE Birthday;
  OLECHECK(GetDefaultInterface()->get_Birthday((DATE*)&Birthday));
  return Birthday;
}

void __fastcall TContactItem::set_Birthday(DATE Birthday/*[in]*/)
{
  GetDefaultInterface()->set_Birthday(Birthday/*[in]*/);
}

BSTR __fastcall TContactItem::get_Business2TelephoneNumber(void)
{
  BSTR Business2TelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_Business2TelephoneNumber((BSTR*)&Business2TelephoneNumber));
  return Business2TelephoneNumber;
}

void __fastcall TContactItem::set_Business2TelephoneNumber(BSTR Business2TelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_Business2TelephoneNumber(Business2TelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessAddress(void)
{
  BSTR BusinessAddress = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessAddress((BSTR*)&BusinessAddress));
  return BusinessAddress;
}

void __fastcall TContactItem::set_BusinessAddress(BSTR BusinessAddress/*[in]*/)
{
  GetDefaultInterface()->set_BusinessAddress(BusinessAddress/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessAddressCity(void)
{
  BSTR BusinessAddressCity = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessAddressCity((BSTR*)&BusinessAddressCity));
  return BusinessAddressCity;
}

void __fastcall TContactItem::set_BusinessAddressCity(BSTR BusinessAddressCity/*[in]*/)
{
  GetDefaultInterface()->set_BusinessAddressCity(BusinessAddressCity/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessAddressCountry(void)
{
  BSTR BusinessAddressCountry = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessAddressCountry((BSTR*)&BusinessAddressCountry));
  return BusinessAddressCountry;
}

void __fastcall TContactItem::set_BusinessAddressCountry(BSTR BusinessAddressCountry/*[in]*/)
{
  GetDefaultInterface()->set_BusinessAddressCountry(BusinessAddressCountry/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessAddressPostalCode(void)
{
  BSTR BusinessAddressPostalCode = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessAddressPostalCode((BSTR*)&BusinessAddressPostalCode));
  return BusinessAddressPostalCode;
}

void __fastcall TContactItem::set_BusinessAddressPostalCode(BSTR BusinessAddressPostalCode/*[in]*/)
{
  GetDefaultInterface()->set_BusinessAddressPostalCode(BusinessAddressPostalCode/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessAddressPostOfficeBox(void)
{
  BSTR BusinessAddressPostOfficeBox = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessAddressPostOfficeBox((BSTR*)&BusinessAddressPostOfficeBox));
  return BusinessAddressPostOfficeBox;
}

void __fastcall TContactItem::set_BusinessAddressPostOfficeBox(BSTR BusinessAddressPostOfficeBox/*[in]*/)
{
  GetDefaultInterface()->set_BusinessAddressPostOfficeBox(BusinessAddressPostOfficeBox/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessAddressState(void)
{
  BSTR BusinessAddressState = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessAddressState((BSTR*)&BusinessAddressState));
  return BusinessAddressState;
}

void __fastcall TContactItem::set_BusinessAddressState(BSTR BusinessAddressState/*[in]*/)
{
  GetDefaultInterface()->set_BusinessAddressState(BusinessAddressState/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessAddressStreet(void)
{
  BSTR BusinessAddressStreet = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessAddressStreet((BSTR*)&BusinessAddressStreet));
  return BusinessAddressStreet;
}

void __fastcall TContactItem::set_BusinessAddressStreet(BSTR BusinessAddressStreet/*[in]*/)
{
  GetDefaultInterface()->set_BusinessAddressStreet(BusinessAddressStreet/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessFaxNumber(void)
{
  BSTR BusinessFaxNumber = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessFaxNumber((BSTR*)&BusinessFaxNumber));
  return BusinessFaxNumber;
}

void __fastcall TContactItem::set_BusinessFaxNumber(BSTR BusinessFaxNumber/*[in]*/)
{
  GetDefaultInterface()->set_BusinessFaxNumber(BusinessFaxNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessHomePage(void)
{
  BSTR BusinessHomePage = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessHomePage((BSTR*)&BusinessHomePage));
  return BusinessHomePage;
}

void __fastcall TContactItem::set_BusinessHomePage(BSTR BusinessHomePage/*[in]*/)
{
  GetDefaultInterface()->set_BusinessHomePage(BusinessHomePage/*[in]*/);
}

BSTR __fastcall TContactItem::get_BusinessTelephoneNumber(void)
{
  BSTR BusinessTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_BusinessTelephoneNumber((BSTR*)&BusinessTelephoneNumber));
  return BusinessTelephoneNumber;
}

void __fastcall TContactItem::set_BusinessTelephoneNumber(BSTR BusinessTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_BusinessTelephoneNumber(BusinessTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_CallbackTelephoneNumber(void)
{
  BSTR CallbackTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_CallbackTelephoneNumber((BSTR*)&CallbackTelephoneNumber));
  return CallbackTelephoneNumber;
}

void __fastcall TContactItem::set_CallbackTelephoneNumber(BSTR CallbackTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_CallbackTelephoneNumber(CallbackTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_CarTelephoneNumber(void)
{
  BSTR CarTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_CarTelephoneNumber((BSTR*)&CarTelephoneNumber));
  return CarTelephoneNumber;
}

void __fastcall TContactItem::set_CarTelephoneNumber(BSTR CarTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_CarTelephoneNumber(CarTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_Children(void)
{
  BSTR Children = 0;
  OLECHECK(GetDefaultInterface()->get_Children((BSTR*)&Children));
  return Children;
}

void __fastcall TContactItem::set_Children(BSTR Children/*[in]*/)
{
  GetDefaultInterface()->set_Children(Children/*[in]*/);
}

BSTR __fastcall TContactItem::get_CompanyAndFullName(void)
{
  BSTR CompanyAndFullName = 0;
  OLECHECK(GetDefaultInterface()->get_CompanyAndFullName((BSTR*)&CompanyAndFullName));
  return CompanyAndFullName;
}

BSTR __fastcall TContactItem::get_CompanyLastFirstNoSpace(void)
{
  BSTR CompanyLastFirstNoSpace = 0;
  OLECHECK(GetDefaultInterface()->get_CompanyLastFirstNoSpace((BSTR*)&CompanyLastFirstNoSpace));
  return CompanyLastFirstNoSpace;
}

BSTR __fastcall TContactItem::get_CompanyLastFirstSpaceOnly(void)
{
  BSTR CompanyLastFirstSpaceOnly = 0;
  OLECHECK(GetDefaultInterface()->get_CompanyLastFirstSpaceOnly((BSTR*)&CompanyLastFirstSpaceOnly));
  return CompanyLastFirstSpaceOnly;
}

BSTR __fastcall TContactItem::get_CompanyMainTelephoneNumber(void)
{
  BSTR CompanyMainTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_CompanyMainTelephoneNumber((BSTR*)&CompanyMainTelephoneNumber));
  return CompanyMainTelephoneNumber;
}

void __fastcall TContactItem::set_CompanyMainTelephoneNumber(BSTR CompanyMainTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_CompanyMainTelephoneNumber(CompanyMainTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_CompanyName(void)
{
  BSTR CompanyName = 0;
  OLECHECK(GetDefaultInterface()->get_CompanyName((BSTR*)&CompanyName));
  return CompanyName;
}

void __fastcall TContactItem::set_CompanyName(BSTR CompanyName/*[in]*/)
{
  GetDefaultInterface()->set_CompanyName(CompanyName/*[in]*/);
}

BSTR __fastcall TContactItem::get_ComputerNetworkName(void)
{
  BSTR ComputerNetworkName = 0;
  OLECHECK(GetDefaultInterface()->get_ComputerNetworkName((BSTR*)&ComputerNetworkName));
  return ComputerNetworkName;
}

void __fastcall TContactItem::set_ComputerNetworkName(BSTR ComputerNetworkName/*[in]*/)
{
  GetDefaultInterface()->set_ComputerNetworkName(ComputerNetworkName/*[in]*/);
}

BSTR __fastcall TContactItem::get_CustomerID(void)
{
  BSTR CustomerID = 0;
  OLECHECK(GetDefaultInterface()->get_CustomerID((BSTR*)&CustomerID));
  return CustomerID;
}

void __fastcall TContactItem::set_CustomerID(BSTR CustomerID/*[in]*/)
{
  GetDefaultInterface()->set_CustomerID(CustomerID/*[in]*/);
}

BSTR __fastcall TContactItem::get_Department(void)
{
  BSTR Department = 0;
  OLECHECK(GetDefaultInterface()->get_Department((BSTR*)&Department));
  return Department;
}

void __fastcall TContactItem::set_Department(BSTR Department/*[in]*/)
{
  GetDefaultInterface()->set_Department(Department/*[in]*/);
}

BSTR __fastcall TContactItem::get_Email1Address(void)
{
  BSTR Email1Address = 0;
  OLECHECK(GetDefaultInterface()->get_Email1Address((BSTR*)&Email1Address));
  return Email1Address;
}

void __fastcall TContactItem::set_Email1Address(BSTR Email1Address/*[in]*/)
{
  GetDefaultInterface()->set_Email1Address(Email1Address/*[in]*/);
}

BSTR __fastcall TContactItem::get_Email1AddressType(void)
{
  BSTR Email1AddressType = 0;
  OLECHECK(GetDefaultInterface()->get_Email1AddressType((BSTR*)&Email1AddressType));
  return Email1AddressType;
}

void __fastcall TContactItem::set_Email1AddressType(BSTR Email1AddressType/*[in]*/)
{
  GetDefaultInterface()->set_Email1AddressType(Email1AddressType/*[in]*/);
}

BSTR __fastcall TContactItem::get_Email1DisplayName(void)
{
  BSTR Email1DisplayName = 0;
  OLECHECK(GetDefaultInterface()->get_Email1DisplayName((BSTR*)&Email1DisplayName));
  return Email1DisplayName;
}

BSTR __fastcall TContactItem::get_Email1EntryID(void)
{
  BSTR Email1EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_Email1EntryID((BSTR*)&Email1EntryID));
  return Email1EntryID;
}

BSTR __fastcall TContactItem::get_Email2Address(void)
{
  BSTR Email2Address = 0;
  OLECHECK(GetDefaultInterface()->get_Email2Address((BSTR*)&Email2Address));
  return Email2Address;
}

void __fastcall TContactItem::set_Email2Address(BSTR Email2Address/*[in]*/)
{
  GetDefaultInterface()->set_Email2Address(Email2Address/*[in]*/);
}

BSTR __fastcall TContactItem::get_Email2AddressType(void)
{
  BSTR Email2AddressType = 0;
  OLECHECK(GetDefaultInterface()->get_Email2AddressType((BSTR*)&Email2AddressType));
  return Email2AddressType;
}

void __fastcall TContactItem::set_Email2AddressType(BSTR Email2AddressType/*[in]*/)
{
  GetDefaultInterface()->set_Email2AddressType(Email2AddressType/*[in]*/);
}

BSTR __fastcall TContactItem::get_Email2DisplayName(void)
{
  BSTR Email2DisplayName = 0;
  OLECHECK(GetDefaultInterface()->get_Email2DisplayName((BSTR*)&Email2DisplayName));
  return Email2DisplayName;
}

BSTR __fastcall TContactItem::get_Email2EntryID(void)
{
  BSTR Email2EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_Email2EntryID((BSTR*)&Email2EntryID));
  return Email2EntryID;
}

BSTR __fastcall TContactItem::get_Email3Address(void)
{
  BSTR Email3Address = 0;
  OLECHECK(GetDefaultInterface()->get_Email3Address((BSTR*)&Email3Address));
  return Email3Address;
}

void __fastcall TContactItem::set_Email3Address(BSTR Email3Address/*[in]*/)
{
  GetDefaultInterface()->set_Email3Address(Email3Address/*[in]*/);
}

BSTR __fastcall TContactItem::get_Email3AddressType(void)
{
  BSTR Email3AddressType = 0;
  OLECHECK(GetDefaultInterface()->get_Email3AddressType((BSTR*)&Email3AddressType));
  return Email3AddressType;
}

void __fastcall TContactItem::set_Email3AddressType(BSTR Email3AddressType/*[in]*/)
{
  GetDefaultInterface()->set_Email3AddressType(Email3AddressType/*[in]*/);
}

BSTR __fastcall TContactItem::get_Email3DisplayName(void)
{
  BSTR Email3DisplayName = 0;
  OLECHECK(GetDefaultInterface()->get_Email3DisplayName((BSTR*)&Email3DisplayName));
  return Email3DisplayName;
}

BSTR __fastcall TContactItem::get_Email3EntryID(void)
{
  BSTR Email3EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_Email3EntryID((BSTR*)&Email3EntryID));
  return Email3EntryID;
}

BSTR __fastcall TContactItem::get_FileAs(void)
{
  BSTR FileAs = 0;
  OLECHECK(GetDefaultInterface()->get_FileAs((BSTR*)&FileAs));
  return FileAs;
}

void __fastcall TContactItem::set_FileAs(BSTR FileAs/*[in]*/)
{
  GetDefaultInterface()->set_FileAs(FileAs/*[in]*/);
}

BSTR __fastcall TContactItem::get_FirstName(void)
{
  BSTR FirstName = 0;
  OLECHECK(GetDefaultInterface()->get_FirstName((BSTR*)&FirstName));
  return FirstName;
}

void __fastcall TContactItem::set_FirstName(BSTR FirstName/*[in]*/)
{
  GetDefaultInterface()->set_FirstName(FirstName/*[in]*/);
}

BSTR __fastcall TContactItem::get_FTPSite(void)
{
  BSTR FTPSite = 0;
  OLECHECK(GetDefaultInterface()->get_FTPSite((BSTR*)&FTPSite));
  return FTPSite;
}

void __fastcall TContactItem::set_FTPSite(BSTR FTPSite/*[in]*/)
{
  GetDefaultInterface()->set_FTPSite(FTPSite/*[in]*/);
}

BSTR __fastcall TContactItem::get_FullName(void)
{
  BSTR FullName = 0;
  OLECHECK(GetDefaultInterface()->get_FullName((BSTR*)&FullName));
  return FullName;
}

void __fastcall TContactItem::set_FullName(BSTR FullName/*[in]*/)
{
  GetDefaultInterface()->set_FullName(FullName/*[in]*/);
}

BSTR __fastcall TContactItem::get_FullNameAndCompany(void)
{
  BSTR FullNameAndCompany = 0;
  OLECHECK(GetDefaultInterface()->get_FullNameAndCompany((BSTR*)&FullNameAndCompany));
  return FullNameAndCompany;
}

Outlook_xp::OlGender __fastcall TContactItem::get_Gender(void)
{
  Outlook_xp::OlGender Gender;
  OLECHECK(GetDefaultInterface()->get_Gender((Outlook_xp::OlGender*)&Gender));
  return Gender;
}

void __fastcall TContactItem::set_Gender(Outlook_xp::OlGender Gender/*[in]*/)
{
  GetDefaultInterface()->set_Gender(Gender/*[in]*/);
}

BSTR __fastcall TContactItem::get_GovernmentIDNumber(void)
{
  BSTR GovernmentIDNumber = 0;
  OLECHECK(GetDefaultInterface()->get_GovernmentIDNumber((BSTR*)&GovernmentIDNumber));
  return GovernmentIDNumber;
}

void __fastcall TContactItem::set_GovernmentIDNumber(BSTR GovernmentIDNumber/*[in]*/)
{
  GetDefaultInterface()->set_GovernmentIDNumber(GovernmentIDNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_Hobby(void)
{
  BSTR Hobby = 0;
  OLECHECK(GetDefaultInterface()->get_Hobby((BSTR*)&Hobby));
  return Hobby;
}

void __fastcall TContactItem::set_Hobby(BSTR Hobby/*[in]*/)
{
  GetDefaultInterface()->set_Hobby(Hobby/*[in]*/);
}

BSTR __fastcall TContactItem::get_Home2TelephoneNumber(void)
{
  BSTR Home2TelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_Home2TelephoneNumber((BSTR*)&Home2TelephoneNumber));
  return Home2TelephoneNumber;
}

void __fastcall TContactItem::set_Home2TelephoneNumber(BSTR Home2TelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_Home2TelephoneNumber(Home2TelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_HomeAddress(void)
{
  BSTR HomeAddress = 0;
  OLECHECK(GetDefaultInterface()->get_HomeAddress((BSTR*)&HomeAddress));
  return HomeAddress;
}

void __fastcall TContactItem::set_HomeAddress(BSTR HomeAddress/*[in]*/)
{
  GetDefaultInterface()->set_HomeAddress(HomeAddress/*[in]*/);
}

BSTR __fastcall TContactItem::get_HomeAddressCity(void)
{
  BSTR HomeAddressCity = 0;
  OLECHECK(GetDefaultInterface()->get_HomeAddressCity((BSTR*)&HomeAddressCity));
  return HomeAddressCity;
}

void __fastcall TContactItem::set_HomeAddressCity(BSTR HomeAddressCity/*[in]*/)
{
  GetDefaultInterface()->set_HomeAddressCity(HomeAddressCity/*[in]*/);
}

BSTR __fastcall TContactItem::get_HomeAddressCountry(void)
{
  BSTR HomeAddressCountry = 0;
  OLECHECK(GetDefaultInterface()->get_HomeAddressCountry((BSTR*)&HomeAddressCountry));
  return HomeAddressCountry;
}

void __fastcall TContactItem::set_HomeAddressCountry(BSTR HomeAddressCountry/*[in]*/)
{
  GetDefaultInterface()->set_HomeAddressCountry(HomeAddressCountry/*[in]*/);
}

BSTR __fastcall TContactItem::get_HomeAddressPostalCode(void)
{
  BSTR HomeAddressPostalCode = 0;
  OLECHECK(GetDefaultInterface()->get_HomeAddressPostalCode((BSTR*)&HomeAddressPostalCode));
  return HomeAddressPostalCode;
}

void __fastcall TContactItem::set_HomeAddressPostalCode(BSTR HomeAddressPostalCode/*[in]*/)
{
  GetDefaultInterface()->set_HomeAddressPostalCode(HomeAddressPostalCode/*[in]*/);
}

BSTR __fastcall TContactItem::get_HomeAddressPostOfficeBox(void)
{
  BSTR HomeAddressPostOfficeBox = 0;
  OLECHECK(GetDefaultInterface()->get_HomeAddressPostOfficeBox((BSTR*)&HomeAddressPostOfficeBox));
  return HomeAddressPostOfficeBox;
}

void __fastcall TContactItem::set_HomeAddressPostOfficeBox(BSTR HomeAddressPostOfficeBox/*[in]*/)
{
  GetDefaultInterface()->set_HomeAddressPostOfficeBox(HomeAddressPostOfficeBox/*[in]*/);
}

BSTR __fastcall TContactItem::get_HomeAddressState(void)
{
  BSTR HomeAddressState = 0;
  OLECHECK(GetDefaultInterface()->get_HomeAddressState((BSTR*)&HomeAddressState));
  return HomeAddressState;
}

void __fastcall TContactItem::set_HomeAddressState(BSTR HomeAddressState/*[in]*/)
{
  GetDefaultInterface()->set_HomeAddressState(HomeAddressState/*[in]*/);
}

BSTR __fastcall TContactItem::get_HomeAddressStreet(void)
{
  BSTR HomeAddressStreet = 0;
  OLECHECK(GetDefaultInterface()->get_HomeAddressStreet((BSTR*)&HomeAddressStreet));
  return HomeAddressStreet;
}

void __fastcall TContactItem::set_HomeAddressStreet(BSTR HomeAddressStreet/*[in]*/)
{
  GetDefaultInterface()->set_HomeAddressStreet(HomeAddressStreet/*[in]*/);
}

BSTR __fastcall TContactItem::get_HomeFaxNumber(void)
{
  BSTR HomeFaxNumber = 0;
  OLECHECK(GetDefaultInterface()->get_HomeFaxNumber((BSTR*)&HomeFaxNumber));
  return HomeFaxNumber;
}

void __fastcall TContactItem::set_HomeFaxNumber(BSTR HomeFaxNumber/*[in]*/)
{
  GetDefaultInterface()->set_HomeFaxNumber(HomeFaxNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_HomeTelephoneNumber(void)
{
  BSTR HomeTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_HomeTelephoneNumber((BSTR*)&HomeTelephoneNumber));
  return HomeTelephoneNumber;
}

void __fastcall TContactItem::set_HomeTelephoneNumber(BSTR HomeTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_HomeTelephoneNumber(HomeTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_Initials(void)
{
  BSTR Initials = 0;
  OLECHECK(GetDefaultInterface()->get_Initials((BSTR*)&Initials));
  return Initials;
}

void __fastcall TContactItem::set_Initials(BSTR Initials/*[in]*/)
{
  GetDefaultInterface()->set_Initials(Initials/*[in]*/);
}

BSTR __fastcall TContactItem::get_InternetFreeBusyAddress(void)
{
  BSTR InternetFreeBusyAddress = 0;
  OLECHECK(GetDefaultInterface()->get_InternetFreeBusyAddress((BSTR*)&InternetFreeBusyAddress));
  return InternetFreeBusyAddress;
}

void __fastcall TContactItem::set_InternetFreeBusyAddress(BSTR InternetFreeBusyAddress/*[in]*/)
{
  GetDefaultInterface()->set_InternetFreeBusyAddress(InternetFreeBusyAddress/*[in]*/);
}

BSTR __fastcall TContactItem::get_ISDNNumber(void)
{
  BSTR ISDNNumber = 0;
  OLECHECK(GetDefaultInterface()->get_ISDNNumber((BSTR*)&ISDNNumber));
  return ISDNNumber;
}

void __fastcall TContactItem::set_ISDNNumber(BSTR ISDNNumber/*[in]*/)
{
  GetDefaultInterface()->set_ISDNNumber(ISDNNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_JobTitle(void)
{
  BSTR JobTitle = 0;
  OLECHECK(GetDefaultInterface()->get_JobTitle((BSTR*)&JobTitle));
  return JobTitle;
}

void __fastcall TContactItem::set_JobTitle(BSTR JobTitle/*[in]*/)
{
  GetDefaultInterface()->set_JobTitle(JobTitle/*[in]*/);
}

VARIANT_BOOL __fastcall TContactItem::get_Journal(void)
{
  VARIANT_BOOL Journal;
  OLECHECK(GetDefaultInterface()->get_Journal((VARIANT_BOOL*)&Journal));
  return Journal;
}

void __fastcall TContactItem::set_Journal(VARIANT_BOOL Journal/*[in]*/)
{
  GetDefaultInterface()->set_Journal(Journal/*[in]*/);
}

BSTR __fastcall TContactItem::get_Language(void)
{
  BSTR Language = 0;
  OLECHECK(GetDefaultInterface()->get_Language((BSTR*)&Language));
  return Language;
}

void __fastcall TContactItem::set_Language(BSTR Language/*[in]*/)
{
  GetDefaultInterface()->set_Language(Language/*[in]*/);
}

BSTR __fastcall TContactItem::get_LastFirstAndSuffix(void)
{
  BSTR LastFirstAndSuffix = 0;
  OLECHECK(GetDefaultInterface()->get_LastFirstAndSuffix((BSTR*)&LastFirstAndSuffix));
  return LastFirstAndSuffix;
}

BSTR __fastcall TContactItem::get_LastFirstNoSpace(void)
{
  BSTR LastFirstNoSpace = 0;
  OLECHECK(GetDefaultInterface()->get_LastFirstNoSpace((BSTR*)&LastFirstNoSpace));
  return LastFirstNoSpace;
}

BSTR __fastcall TContactItem::get_LastFirstNoSpaceCompany(void)
{
  BSTR LastFirstNoSpaceCompany = 0;
  OLECHECK(GetDefaultInterface()->get_LastFirstNoSpaceCompany((BSTR*)&LastFirstNoSpaceCompany));
  return LastFirstNoSpaceCompany;
}

BSTR __fastcall TContactItem::get_LastFirstSpaceOnly(void)
{
  BSTR LastFirstSpaceOnly = 0;
  OLECHECK(GetDefaultInterface()->get_LastFirstSpaceOnly((BSTR*)&LastFirstSpaceOnly));
  return LastFirstSpaceOnly;
}

BSTR __fastcall TContactItem::get_LastFirstSpaceOnlyCompany(void)
{
  BSTR LastFirstSpaceOnlyCompany = 0;
  OLECHECK(GetDefaultInterface()->get_LastFirstSpaceOnlyCompany((BSTR*)&LastFirstSpaceOnlyCompany));
  return LastFirstSpaceOnlyCompany;
}

BSTR __fastcall TContactItem::get_LastName(void)
{
  BSTR LastName = 0;
  OLECHECK(GetDefaultInterface()->get_LastName((BSTR*)&LastName));
  return LastName;
}

void __fastcall TContactItem::set_LastName(BSTR LastName/*[in]*/)
{
  GetDefaultInterface()->set_LastName(LastName/*[in]*/);
}

BSTR __fastcall TContactItem::get_LastNameAndFirstName(void)
{
  BSTR LastNameAndFirstName = 0;
  OLECHECK(GetDefaultInterface()->get_LastNameAndFirstName((BSTR*)&LastNameAndFirstName));
  return LastNameAndFirstName;
}

BSTR __fastcall TContactItem::get_MailingAddress(void)
{
  BSTR MailingAddress = 0;
  OLECHECK(GetDefaultInterface()->get_MailingAddress((BSTR*)&MailingAddress));
  return MailingAddress;
}

void __fastcall TContactItem::set_MailingAddress(BSTR MailingAddress/*[in]*/)
{
  GetDefaultInterface()->set_MailingAddress(MailingAddress/*[in]*/);
}

BSTR __fastcall TContactItem::get_MailingAddressCity(void)
{
  BSTR MailingAddressCity = 0;
  OLECHECK(GetDefaultInterface()->get_MailingAddressCity((BSTR*)&MailingAddressCity));
  return MailingAddressCity;
}

void __fastcall TContactItem::set_MailingAddressCity(BSTR MailingAddressCity/*[in]*/)
{
  GetDefaultInterface()->set_MailingAddressCity(MailingAddressCity/*[in]*/);
}

BSTR __fastcall TContactItem::get_MailingAddressCountry(void)
{
  BSTR MailingAddressCountry = 0;
  OLECHECK(GetDefaultInterface()->get_MailingAddressCountry((BSTR*)&MailingAddressCountry));
  return MailingAddressCountry;
}

void __fastcall TContactItem::set_MailingAddressCountry(BSTR MailingAddressCountry/*[in]*/)
{
  GetDefaultInterface()->set_MailingAddressCountry(MailingAddressCountry/*[in]*/);
}

BSTR __fastcall TContactItem::get_MailingAddressPostalCode(void)
{
  BSTR MailingAddressPostalCode = 0;
  OLECHECK(GetDefaultInterface()->get_MailingAddressPostalCode((BSTR*)&MailingAddressPostalCode));
  return MailingAddressPostalCode;
}

void __fastcall TContactItem::set_MailingAddressPostalCode(BSTR MailingAddressPostalCode/*[in]*/)
{
  GetDefaultInterface()->set_MailingAddressPostalCode(MailingAddressPostalCode/*[in]*/);
}

BSTR __fastcall TContactItem::get_MailingAddressPostOfficeBox(void)
{
  BSTR MailingAddressPostOfficeBox = 0;
  OLECHECK(GetDefaultInterface()->get_MailingAddressPostOfficeBox((BSTR*)&MailingAddressPostOfficeBox));
  return MailingAddressPostOfficeBox;
}

void __fastcall TContactItem::set_MailingAddressPostOfficeBox(BSTR MailingAddressPostOfficeBox/*[in]*/)
{
  GetDefaultInterface()->set_MailingAddressPostOfficeBox(MailingAddressPostOfficeBox/*[in]*/);
}

BSTR __fastcall TContactItem::get_MailingAddressState(void)
{
  BSTR MailingAddressState = 0;
  OLECHECK(GetDefaultInterface()->get_MailingAddressState((BSTR*)&MailingAddressState));
  return MailingAddressState;
}

void __fastcall TContactItem::set_MailingAddressState(BSTR MailingAddressState/*[in]*/)
{
  GetDefaultInterface()->set_MailingAddressState(MailingAddressState/*[in]*/);
}

BSTR __fastcall TContactItem::get_MailingAddressStreet(void)
{
  BSTR MailingAddressStreet = 0;
  OLECHECK(GetDefaultInterface()->get_MailingAddressStreet((BSTR*)&MailingAddressStreet));
  return MailingAddressStreet;
}

void __fastcall TContactItem::set_MailingAddressStreet(BSTR MailingAddressStreet/*[in]*/)
{
  GetDefaultInterface()->set_MailingAddressStreet(MailingAddressStreet/*[in]*/);
}

BSTR __fastcall TContactItem::get_ManagerName(void)
{
  BSTR ManagerName = 0;
  OLECHECK(GetDefaultInterface()->get_ManagerName((BSTR*)&ManagerName));
  return ManagerName;
}

void __fastcall TContactItem::set_ManagerName(BSTR ManagerName/*[in]*/)
{
  GetDefaultInterface()->set_ManagerName(ManagerName/*[in]*/);
}

BSTR __fastcall TContactItem::get_MiddleName(void)
{
  BSTR MiddleName = 0;
  OLECHECK(GetDefaultInterface()->get_MiddleName((BSTR*)&MiddleName));
  return MiddleName;
}

void __fastcall TContactItem::set_MiddleName(BSTR MiddleName/*[in]*/)
{
  GetDefaultInterface()->set_MiddleName(MiddleName/*[in]*/);
}

BSTR __fastcall TContactItem::get_MobileTelephoneNumber(void)
{
  BSTR MobileTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_MobileTelephoneNumber((BSTR*)&MobileTelephoneNumber));
  return MobileTelephoneNumber;
}

void __fastcall TContactItem::set_MobileTelephoneNumber(BSTR MobileTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_MobileTelephoneNumber(MobileTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_NetMeetingAlias(void)
{
  BSTR NetMeetingAlias = 0;
  OLECHECK(GetDefaultInterface()->get_NetMeetingAlias((BSTR*)&NetMeetingAlias));
  return NetMeetingAlias;
}

void __fastcall TContactItem::set_NetMeetingAlias(BSTR NetMeetingAlias/*[in]*/)
{
  GetDefaultInterface()->set_NetMeetingAlias(NetMeetingAlias/*[in]*/);
}

BSTR __fastcall TContactItem::get_NetMeetingServer(void)
{
  BSTR NetMeetingServer = 0;
  OLECHECK(GetDefaultInterface()->get_NetMeetingServer((BSTR*)&NetMeetingServer));
  return NetMeetingServer;
}

void __fastcall TContactItem::set_NetMeetingServer(BSTR NetMeetingServer/*[in]*/)
{
  GetDefaultInterface()->set_NetMeetingServer(NetMeetingServer/*[in]*/);
}

BSTR __fastcall TContactItem::get_NickName(void)
{
  BSTR NickName = 0;
  OLECHECK(GetDefaultInterface()->get_NickName((BSTR*)&NickName));
  return NickName;
}

void __fastcall TContactItem::set_NickName(BSTR NickName/*[in]*/)
{
  GetDefaultInterface()->set_NickName(NickName/*[in]*/);
}

BSTR __fastcall TContactItem::get_OfficeLocation(void)
{
  BSTR OfficeLocation = 0;
  OLECHECK(GetDefaultInterface()->get_OfficeLocation((BSTR*)&OfficeLocation));
  return OfficeLocation;
}

void __fastcall TContactItem::set_OfficeLocation(BSTR OfficeLocation/*[in]*/)
{
  GetDefaultInterface()->set_OfficeLocation(OfficeLocation/*[in]*/);
}

BSTR __fastcall TContactItem::get_OrganizationalIDNumber(void)
{
  BSTR OrganizationalIDNumber = 0;
  OLECHECK(GetDefaultInterface()->get_OrganizationalIDNumber((BSTR*)&OrganizationalIDNumber));
  return OrganizationalIDNumber;
}

void __fastcall TContactItem::set_OrganizationalIDNumber(BSTR OrganizationalIDNumber/*[in]*/)
{
  GetDefaultInterface()->set_OrganizationalIDNumber(OrganizationalIDNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_OtherAddress(void)
{
  BSTR OtherAddress = 0;
  OLECHECK(GetDefaultInterface()->get_OtherAddress((BSTR*)&OtherAddress));
  return OtherAddress;
}

void __fastcall TContactItem::set_OtherAddress(BSTR OtherAddress/*[in]*/)
{
  GetDefaultInterface()->set_OtherAddress(OtherAddress/*[in]*/);
}

BSTR __fastcall TContactItem::get_OtherAddressCity(void)
{
  BSTR OtherAddressCity = 0;
  OLECHECK(GetDefaultInterface()->get_OtherAddressCity((BSTR*)&OtherAddressCity));
  return OtherAddressCity;
}

void __fastcall TContactItem::set_OtherAddressCity(BSTR OtherAddressCity/*[in]*/)
{
  GetDefaultInterface()->set_OtherAddressCity(OtherAddressCity/*[in]*/);
}

BSTR __fastcall TContactItem::get_OtherAddressCountry(void)
{
  BSTR OtherAddressCountry = 0;
  OLECHECK(GetDefaultInterface()->get_OtherAddressCountry((BSTR*)&OtherAddressCountry));
  return OtherAddressCountry;
}

void __fastcall TContactItem::set_OtherAddressCountry(BSTR OtherAddressCountry/*[in]*/)
{
  GetDefaultInterface()->set_OtherAddressCountry(OtherAddressCountry/*[in]*/);
}

BSTR __fastcall TContactItem::get_OtherAddressPostalCode(void)
{
  BSTR OtherAddressPostalCode = 0;
  OLECHECK(GetDefaultInterface()->get_OtherAddressPostalCode((BSTR*)&OtherAddressPostalCode));
  return OtherAddressPostalCode;
}

void __fastcall TContactItem::set_OtherAddressPostalCode(BSTR OtherAddressPostalCode/*[in]*/)
{
  GetDefaultInterface()->set_OtherAddressPostalCode(OtherAddressPostalCode/*[in]*/);
}

BSTR __fastcall TContactItem::get_OtherAddressPostOfficeBox(void)
{
  BSTR OtherAddressPostOfficeBox = 0;
  OLECHECK(GetDefaultInterface()->get_OtherAddressPostOfficeBox((BSTR*)&OtherAddressPostOfficeBox));
  return OtherAddressPostOfficeBox;
}

void __fastcall TContactItem::set_OtherAddressPostOfficeBox(BSTR OtherAddressPostOfficeBox/*[in]*/)
{
  GetDefaultInterface()->set_OtherAddressPostOfficeBox(OtherAddressPostOfficeBox/*[in]*/);
}

BSTR __fastcall TContactItem::get_OtherAddressState(void)
{
  BSTR OtherAddressState = 0;
  OLECHECK(GetDefaultInterface()->get_OtherAddressState((BSTR*)&OtherAddressState));
  return OtherAddressState;
}

void __fastcall TContactItem::set_OtherAddressState(BSTR OtherAddressState/*[in]*/)
{
  GetDefaultInterface()->set_OtherAddressState(OtherAddressState/*[in]*/);
}

BSTR __fastcall TContactItem::get_OtherAddressStreet(void)
{
  BSTR OtherAddressStreet = 0;
  OLECHECK(GetDefaultInterface()->get_OtherAddressStreet((BSTR*)&OtherAddressStreet));
  return OtherAddressStreet;
}

void __fastcall TContactItem::set_OtherAddressStreet(BSTR OtherAddressStreet/*[in]*/)
{
  GetDefaultInterface()->set_OtherAddressStreet(OtherAddressStreet/*[in]*/);
}

BSTR __fastcall TContactItem::get_OtherFaxNumber(void)
{
  BSTR OtherFaxNumber = 0;
  OLECHECK(GetDefaultInterface()->get_OtherFaxNumber((BSTR*)&OtherFaxNumber));
  return OtherFaxNumber;
}

void __fastcall TContactItem::set_OtherFaxNumber(BSTR OtherFaxNumber/*[in]*/)
{
  GetDefaultInterface()->set_OtherFaxNumber(OtherFaxNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_OtherTelephoneNumber(void)
{
  BSTR OtherTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_OtherTelephoneNumber((BSTR*)&OtherTelephoneNumber));
  return OtherTelephoneNumber;
}

void __fastcall TContactItem::set_OtherTelephoneNumber(BSTR OtherTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_OtherTelephoneNumber(OtherTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_PagerNumber(void)
{
  BSTR PagerNumber = 0;
  OLECHECK(GetDefaultInterface()->get_PagerNumber((BSTR*)&PagerNumber));
  return PagerNumber;
}

void __fastcall TContactItem::set_PagerNumber(BSTR PagerNumber/*[in]*/)
{
  GetDefaultInterface()->set_PagerNumber(PagerNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_PersonalHomePage(void)
{
  BSTR PersonalHomePage = 0;
  OLECHECK(GetDefaultInterface()->get_PersonalHomePage((BSTR*)&PersonalHomePage));
  return PersonalHomePage;
}

void __fastcall TContactItem::set_PersonalHomePage(BSTR PersonalHomePage/*[in]*/)
{
  GetDefaultInterface()->set_PersonalHomePage(PersonalHomePage/*[in]*/);
}

BSTR __fastcall TContactItem::get_PrimaryTelephoneNumber(void)
{
  BSTR PrimaryTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_PrimaryTelephoneNumber((BSTR*)&PrimaryTelephoneNumber));
  return PrimaryTelephoneNumber;
}

void __fastcall TContactItem::set_PrimaryTelephoneNumber(BSTR PrimaryTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_PrimaryTelephoneNumber(PrimaryTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_Profession(void)
{
  BSTR Profession = 0;
  OLECHECK(GetDefaultInterface()->get_Profession((BSTR*)&Profession));
  return Profession;
}

void __fastcall TContactItem::set_Profession(BSTR Profession/*[in]*/)
{
  GetDefaultInterface()->set_Profession(Profession/*[in]*/);
}

BSTR __fastcall TContactItem::get_RadioTelephoneNumber(void)
{
  BSTR RadioTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_RadioTelephoneNumber((BSTR*)&RadioTelephoneNumber));
  return RadioTelephoneNumber;
}

void __fastcall TContactItem::set_RadioTelephoneNumber(BSTR RadioTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_RadioTelephoneNumber(RadioTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_ReferredBy(void)
{
  BSTR ReferredBy = 0;
  OLECHECK(GetDefaultInterface()->get_ReferredBy((BSTR*)&ReferredBy));
  return ReferredBy;
}

void __fastcall TContactItem::set_ReferredBy(BSTR ReferredBy/*[in]*/)
{
  GetDefaultInterface()->set_ReferredBy(ReferredBy/*[in]*/);
}

Outlook_xp::OlMailingAddress __fastcall TContactItem::get_SelectedMailingAddress(void)
{
  Outlook_xp::OlMailingAddress SelectedMailingAddress;
  OLECHECK(GetDefaultInterface()->get_SelectedMailingAddress((Outlook_xp::OlMailingAddress*)&SelectedMailingAddress));
  return SelectedMailingAddress;
}

void __fastcall TContactItem::set_SelectedMailingAddress(Outlook_xp::OlMailingAddress SelectedMailingAddress/*[in]*/)
{
  GetDefaultInterface()->set_SelectedMailingAddress(SelectedMailingAddress/*[in]*/);
}

BSTR __fastcall TContactItem::get_Spouse(void)
{
  BSTR Spouse = 0;
  OLECHECK(GetDefaultInterface()->get_Spouse((BSTR*)&Spouse));
  return Spouse;
}

void __fastcall TContactItem::set_Spouse(BSTR Spouse/*[in]*/)
{
  GetDefaultInterface()->set_Spouse(Spouse/*[in]*/);
}

BSTR __fastcall TContactItem::get_Suffix(void)
{
  BSTR Suffix = 0;
  OLECHECK(GetDefaultInterface()->get_Suffix((BSTR*)&Suffix));
  return Suffix;
}

void __fastcall TContactItem::set_Suffix(BSTR Suffix/*[in]*/)
{
  GetDefaultInterface()->set_Suffix(Suffix/*[in]*/);
}

BSTR __fastcall TContactItem::get_TelexNumber(void)
{
  BSTR TelexNumber = 0;
  OLECHECK(GetDefaultInterface()->get_TelexNumber((BSTR*)&TelexNumber));
  return TelexNumber;
}

void __fastcall TContactItem::set_TelexNumber(BSTR TelexNumber/*[in]*/)
{
  GetDefaultInterface()->set_TelexNumber(TelexNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_Title(void)
{
  BSTR Title = 0;
  OLECHECK(GetDefaultInterface()->get_Title((BSTR*)&Title));
  return Title;
}

void __fastcall TContactItem::set_Title(BSTR Title/*[in]*/)
{
  GetDefaultInterface()->set_Title(Title/*[in]*/);
}

BSTR __fastcall TContactItem::get_TTYTDDTelephoneNumber(void)
{
  BSTR TTYTDDTelephoneNumber = 0;
  OLECHECK(GetDefaultInterface()->get_TTYTDDTelephoneNumber((BSTR*)&TTYTDDTelephoneNumber));
  return TTYTDDTelephoneNumber;
}

void __fastcall TContactItem::set_TTYTDDTelephoneNumber(BSTR TTYTDDTelephoneNumber/*[in]*/)
{
  GetDefaultInterface()->set_TTYTDDTelephoneNumber(TTYTDDTelephoneNumber/*[in]*/);
}

BSTR __fastcall TContactItem::get_User1(void)
{
  BSTR User1 = 0;
  OLECHECK(GetDefaultInterface()->get_User1((BSTR*)&User1));
  return User1;
}

void __fastcall TContactItem::set_User1(BSTR User1/*[in]*/)
{
  GetDefaultInterface()->set_User1(User1/*[in]*/);
}

BSTR __fastcall TContactItem::get_User2(void)
{
  BSTR User2 = 0;
  OLECHECK(GetDefaultInterface()->get_User2((BSTR*)&User2));
  return User2;
}

void __fastcall TContactItem::set_User2(BSTR User2/*[in]*/)
{
  GetDefaultInterface()->set_User2(User2/*[in]*/);
}

BSTR __fastcall TContactItem::get_User3(void)
{
  BSTR User3 = 0;
  OLECHECK(GetDefaultInterface()->get_User3((BSTR*)&User3));
  return User3;
}

void __fastcall TContactItem::set_User3(BSTR User3/*[in]*/)
{
  GetDefaultInterface()->set_User3(User3/*[in]*/);
}

BSTR __fastcall TContactItem::get_User4(void)
{
  BSTR User4 = 0;
  OLECHECK(GetDefaultInterface()->get_User4((BSTR*)&User4));
  return User4;
}

void __fastcall TContactItem::set_User4(BSTR User4/*[in]*/)
{
  GetDefaultInterface()->set_User4(User4/*[in]*/);
}

BSTR __fastcall TContactItem::get_UserCertificate(void)
{
  BSTR UserCertificate = 0;
  OLECHECK(GetDefaultInterface()->get_UserCertificate((BSTR*)&UserCertificate));
  return UserCertificate;
}

void __fastcall TContactItem::set_UserCertificate(BSTR UserCertificate/*[in]*/)
{
  GetDefaultInterface()->set_UserCertificate(UserCertificate/*[in]*/);
}

BSTR __fastcall TContactItem::get_WebPage(void)
{
  BSTR WebPage = 0;
  OLECHECK(GetDefaultInterface()->get_WebPage((BSTR*)&WebPage));
  return WebPage;
}

void __fastcall TContactItem::set_WebPage(BSTR WebPage/*[in]*/)
{
  GetDefaultInterface()->set_WebPage(WebPage/*[in]*/);
}

BSTR __fastcall TContactItem::get_YomiCompanyName(void)
{
  BSTR YomiCompanyName = 0;
  OLECHECK(GetDefaultInterface()->get_YomiCompanyName((BSTR*)&YomiCompanyName));
  return YomiCompanyName;
}

void __fastcall TContactItem::set_YomiCompanyName(BSTR YomiCompanyName/*[in]*/)
{
  GetDefaultInterface()->set_YomiCompanyName(YomiCompanyName/*[in]*/);
}

BSTR __fastcall TContactItem::get_YomiFirstName(void)
{
  BSTR YomiFirstName = 0;
  OLECHECK(GetDefaultInterface()->get_YomiFirstName((BSTR*)&YomiFirstName));
  return YomiFirstName;
}

void __fastcall TContactItem::set_YomiFirstName(BSTR YomiFirstName/*[in]*/)
{
  GetDefaultInterface()->set_YomiFirstName(YomiFirstName/*[in]*/);
}

BSTR __fastcall TContactItem::get_YomiLastName(void)
{
  BSTR YomiLastName = 0;
  OLECHECK(GetDefaultInterface()->get_YomiLastName((BSTR*)&YomiLastName));
  return YomiLastName;
}

void __fastcall TContactItem::set_YomiLastName(BSTR YomiLastName/*[in]*/)
{
  GetDefaultInterface()->set_YomiLastName(YomiLastName/*[in]*/);
}

Outlook_xp::LinksPtr __fastcall TContactItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::ItemPropertiesPtr __fastcall TContactItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

BSTR __fastcall TContactItem::get_LastFirstNoSpaceAndSuffix(void)
{
  BSTR LastFirstNoSpaceAndSuffix = 0;
  OLECHECK(GetDefaultInterface()->get_LastFirstNoSpaceAndSuffix((BSTR*)&LastFirstNoSpaceAndSuffix));
  return LastFirstNoSpaceAndSuffix;
}

Outlook_xp::OlDownloadState __fastcall TContactItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

BSTR __fastcall TContactItem::get_IMAddress(void)
{
  BSTR IMAddress = 0;
  OLECHECK(GetDefaultInterface()->get_IMAddress((BSTR*)&IMAddress));
  return IMAddress;
}

void __fastcall TContactItem::set_IMAddress(BSTR IMAddress/*[in]*/)
{
  GetDefaultInterface()->set_IMAddress(IMAddress/*[in]*/);
}

Outlook_xp::OlRemoteStatus __fastcall TContactItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TContactItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

void __fastcall TContactItem::set_Email1DisplayName(BSTR Email1DisplayName/*[in]*/)
{
  GetDefaultInterface()->set_Email1DisplayName(Email1DisplayName/*[in]*/);
}

void __fastcall TContactItem::set_Email2DisplayName(BSTR Email2DisplayName/*[in]*/)
{
  GetDefaultInterface()->set_Email2DisplayName(Email2DisplayName/*[in]*/);
}

void __fastcall TContactItem::set_Email3DisplayName(BSTR Email3DisplayName/*[in]*/)
{
  GetDefaultInterface()->set_Email3DisplayName(Email3DisplayName/*[in]*/);
}

VARIANT_BOOL __fastcall TContactItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_DistListItemPtr& TDistListItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TDistListItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TDistListItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TDistListItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TDistListItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TDistListItem::ConnectTo(_DistListItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TDistListItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_DistListItem;
  sd.IntfIID = __uuidof(_DistListItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TDistListItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TDistListItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TDistListItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TDistListItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TDistListItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TDistListItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TDistListItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TDistListItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TDistListItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

void __fastcall TDistListItem::AddMembers(Outlook_xp::Recipients* Recipients/*[in]*/)
{
  GetDefaultInterface()->AddMembers(Recipients/*[in]*/);
}

void __fastcall TDistListItem::RemoveMembers(Outlook_xp::Recipients* Recipients/*[in]*/)
{
  GetDefaultInterface()->RemoveMembers(Recipients/*[in]*/);
}

Outlook_xp::Recipient* __fastcall TDistListItem::GetMember(long Index/*[in]*/)
{
  Outlook_xp::Recipient* Recipient = 0;
  OLECHECK(GetDefaultInterface()->GetMember(Index, (Outlook_xp::Recipient**)&Recipient));
  return Recipient;
}

void __fastcall TDistListItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

void __fastcall TDistListItem::AddMember(Outlook_xp::Recipient* Recipient/*[in]*/)
{
  GetDefaultInterface()->AddMember(Recipient/*[in]*/);
}

void __fastcall TDistListItem::RemoveMember(Outlook_xp::Recipient* Recipient/*[in]*/)
{
  GetDefaultInterface()->RemoveMember(Recipient/*[in]*/);
}

Outlook_xp::_ApplicationPtr __fastcall TDistListItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TDistListItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TDistListItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TDistListItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TDistListItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TDistListItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TDistListItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TDistListItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TDistListItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TDistListItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TDistListItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TDistListItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TDistListItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TDistListItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TDistListItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TDistListItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TDistListItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TDistListItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TDistListItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TDistListItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TDistListItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TDistListItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TDistListItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TDistListItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TDistListItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TDistListItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TDistListItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TDistListItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TDistListItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TDistListItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TDistListItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TDistListItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TDistListItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TDistListItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TDistListItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TDistListItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TDistListItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TDistListItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TDistListItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TDistListItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TDistListItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

BSTR __fastcall TDistListItem::get_DLName(void)
{
  BSTR DLName = 0;
  OLECHECK(GetDefaultInterface()->get_DLName((BSTR*)&DLName));
  return DLName;
}

void __fastcall TDistListItem::set_DLName(BSTR DLName/*[in]*/)
{
  GetDefaultInterface()->set_DLName(DLName/*[in]*/);
}

long __fastcall TDistListItem::get_MemberCount(void)
{
  long MemberCount;
  OLECHECK(GetDefaultInterface()->get_MemberCount((long*)&MemberCount));
  return MemberCount;
}

long __fastcall TDistListItem::get_CheckSum(void)
{
  long CheckSum;
  OLECHECK(GetDefaultInterface()->get_CheckSum((long*)&CheckSum));
  return CheckSum;
}

VARIANT __fastcall TDistListItem::get_Members(void)
{
  VARIANT Members;
  OLECHECK(GetDefaultInterface()->get_Members((VARIANT*)&Members));
  return Members;
}

void __fastcall TDistListItem::set_Members(VARIANT Members/*[in]*/)
{
  GetDefaultInterface()->set_Members(Members/*[in]*/);
}

VARIANT __fastcall TDistListItem::get_OneOffMembers(void)
{
  VARIANT OneOffMembers;
  OLECHECK(GetDefaultInterface()->get_OneOffMembers((VARIANT*)&OneOffMembers));
  return OneOffMembers;
}

void __fastcall TDistListItem::set_OneOffMembers(VARIANT OneOffMembers/*[in]*/)
{
  GetDefaultInterface()->set_OneOffMembers(OneOffMembers/*[in]*/);
}

Outlook_xp::LinksPtr __fastcall TDistListItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::OlDownloadState __fastcall TDistListItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

Outlook_xp::ItemPropertiesPtr __fastcall TDistListItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlRemoteStatus __fastcall TDistListItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TDistListItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TDistListItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_DocumentItemPtr& TDocumentItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TDocumentItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TDocumentItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TDocumentItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TDocumentItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TDocumentItem::ConnectTo(_DocumentItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TDocumentItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_DocumentItem;
  sd.IntfIID = __uuidof(_DocumentItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TDocumentItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TDocumentItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TDocumentItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TDocumentItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TDocumentItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TDocumentItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TDocumentItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TDocumentItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TDocumentItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

void __fastcall TDocumentItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TDocumentItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TDocumentItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TDocumentItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TDocumentItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TDocumentItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TDocumentItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TDocumentItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TDocumentItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TDocumentItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TDocumentItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TDocumentItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TDocumentItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TDocumentItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TDocumentItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TDocumentItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TDocumentItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TDocumentItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TDocumentItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TDocumentItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TDocumentItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TDocumentItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TDocumentItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TDocumentItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TDocumentItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TDocumentItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TDocumentItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TDocumentItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TDocumentItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TDocumentItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TDocumentItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TDocumentItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TDocumentItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TDocumentItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TDocumentItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TDocumentItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TDocumentItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TDocumentItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TDocumentItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TDocumentItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TDocumentItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TDocumentItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

Outlook_xp::LinksPtr __fastcall TDocumentItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::OlDownloadState __fastcall TDocumentItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

Outlook_xp::ItemPropertiesPtr __fastcall TDocumentItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlRemoteStatus __fastcall TDocumentItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TDocumentItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TDocumentItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_ExplorersPtr& TExplorers::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TExplorers::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TExplorers::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TExplorers::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TExplorers::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TExplorers::ConnectTo(_ExplorersPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TExplorers::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_Explorers;
  sd.IntfIID = __uuidof(_Explorers);
  sd.EventIID= __uuidof(ExplorersEvents);
  ServerData = &sd;
}

void __fastcall TExplorers::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61441: {
      if (OnNewExplorer) {
        (OnNewExplorer)(this, (Outlook_xp::_ExplorerPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

Outlook_xp::Explorer* __fastcall TExplorers::Item(VARIANT Index/*[in]*/)
{
  Outlook_xp::Explorer* Item = 0;
  OLECHECK(GetDefaultInterface()->Item(Index, (Outlook_xp::Explorer**)&Item));
  return Item;
}

Outlook_xp::_Explorer* __fastcall TExplorers::Add(VARIANT Folder/*[in]*/, 
                                                  Outlook_xp::OlFolderDisplayMode DisplayMode/*[in,opt]*/)
{
  Outlook_xp::_Explorer* Explorer = 0;
  OLECHECK(GetDefaultInterface()->Add(Folder, DisplayMode, (Outlook_xp::_Explorer**)&Explorer));
  return Explorer;
}

Outlook_xp::_ApplicationPtr __fastcall TExplorers::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TExplorers::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TExplorers::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TExplorers::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

long __fastcall TExplorers::get_Count(void)
{
  long Count;
  OLECHECK(GetDefaultInterface()->get_Count((long*)&Count));
  return Count;
}

_InspectorsPtr& TInspectors::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TInspectors::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TInspectors::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TInspectors::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TInspectors::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TInspectors::ConnectTo(_InspectorsPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TInspectors::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_Inspectors;
  sd.IntfIID = __uuidof(_Inspectors);
  sd.EventIID= __uuidof(InspectorsEvents);
  ServerData = &sd;
}

void __fastcall TInspectors::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61441: {
      if (OnNewInspector) {
        (OnNewInspector)(this, (Outlook_xp::_InspectorPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

Outlook_xp::Inspector* __fastcall TInspectors::Item(VARIANT Index/*[in]*/)
{
  Outlook_xp::Inspector* Item = 0;
  OLECHECK(GetDefaultInterface()->Item(Index, (Outlook_xp::Inspector**)&Item));
  return Item;
}

Outlook_xp::_Inspector* __fastcall TInspectors::Add(LPDISPATCH Item/*[in]*/)
{
  Outlook_xp::_Inspector* Inspector = 0;
  OLECHECK(GetDefaultInterface()->Add(Item, (Outlook_xp::_Inspector**)&Inspector));
  return Inspector;
}

Outlook_xp::_ApplicationPtr __fastcall TInspectors::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TInspectors::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TInspectors::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TInspectors::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

long __fastcall TInspectors::get_Count(void)
{
  long Count;
  OLECHECK(GetDefaultInterface()->get_Count((long*)&Count));
  return Count;
}

_FoldersPtr& TFolders::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TFolders::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TFolders::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TFolders::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TFolders::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TFolders::ConnectTo(_FoldersPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TFolders::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_Folders;
  sd.IntfIID = __uuidof(_Folders);
  sd.EventIID= __uuidof(FoldersEvents);
  ServerData = &sd;
}

void __fastcall TFolders::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61441: {
      if (OnFolderAdd) {
        (OnFolderAdd)(this, (Outlook_xp::MAPIFolderPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61442: {
      if (OnFolderChange) {
        (OnFolderChange)(this, (Outlook_xp::MAPIFolderPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61443: {
      if (OnFolderRemove) {
        (OnFolderRemove)(this);
      }
      break;
      }
    default:
      break;
  }
}

Outlook_xp::MAPIFolder* __fastcall TFolders::Item(VARIANT Index/*[in]*/)
{
  Outlook_xp::MAPIFolder* Item = 0;
  OLECHECK(GetDefaultInterface()->Item(Index, (Outlook_xp::MAPIFolder**)&Item));
  return Item;
}

Outlook_xp::MAPIFolder* __fastcall TFolders::Add(BSTR Name/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  Outlook_xp::MAPIFolder* Folder = 0;
  OLECHECK(GetDefaultInterface()->Add(Name, Type, (Outlook_xp::MAPIFolder**)&Folder));
  return Folder;
}

Outlook_xp::MAPIFolder* __fastcall TFolders::GetFirst(void)
{
  Outlook_xp::MAPIFolder* Folder = 0;
  OLECHECK(GetDefaultInterface()->GetFirst((Outlook_xp::MAPIFolder**)&Folder));
  return Folder;
}

Outlook_xp::MAPIFolder* __fastcall TFolders::GetLast(void)
{
  Outlook_xp::MAPIFolder* Folder = 0;
  OLECHECK(GetDefaultInterface()->GetLast((Outlook_xp::MAPIFolder**)&Folder));
  return Folder;
}

Outlook_xp::MAPIFolder* __fastcall TFolders::GetNext(void)
{
  Outlook_xp::MAPIFolder* Folder = 0;
  OLECHECK(GetDefaultInterface()->GetNext((Outlook_xp::MAPIFolder**)&Folder));
  return Folder;
}

Outlook_xp::MAPIFolder* __fastcall TFolders::GetPrevious(void)
{
  Outlook_xp::MAPIFolder* Folder = 0;
  OLECHECK(GetDefaultInterface()->GetPrevious((Outlook_xp::MAPIFolder**)&Folder));
  return Folder;
}

void __fastcall TFolders::Remove(long Index/*[in]*/)
{
  GetDefaultInterface()->Remove(Index/*[in]*/);
}

Outlook_xp::_ApplicationPtr __fastcall TFolders::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TFolders::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TFolders::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TFolders::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

long __fastcall TFolders::get_Count(void)
{
  long Count;
  OLECHECK(GetDefaultInterface()->get_Count((long*)&Count));
  return Count;
}

LPUNKNOWN __fastcall TFolders::get_RawTable(void)
{
  LPUNKNOWN RawTable;
  OLECHECK(GetDefaultInterface()->get_RawTable((LPUNKNOWN*)&RawTable));
  return RawTable;
}

_ItemsPtr& TItems::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TItems::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TItems::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TItems::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TItems::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TItems::ConnectTo(_ItemsPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TItems::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_Items;
  sd.IntfIID = __uuidof(_Items);
  sd.EventIID= __uuidof(ItemsEvents);
  ServerData = &sd;
}

void __fastcall TItems::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61441: {
      if (OnItemAdd) {
        (OnItemAdd)(this, params[0].pdispVal);
      }
      break;
      }
    case 61442: {
      if (OnItemChange) {
        (OnItemChange)(this, params[0].pdispVal);
      }
      break;
      }
    case 61443: {
      if (OnItemRemove) {
        (OnItemRemove)(this);
      }
      break;
      }
    default:
      break;
  }
}

LPDISPATCH __fastcall TItems::Item(VARIANT Index/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Item(Index, (LPDISPATCH*)&Item));
  return Item;
}

LPDISPATCH __fastcall TItems::Add(VARIANT Type/*[in,opt]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Add(Type, (LPDISPATCH*)&Item));
  return Item;
}

LPDISPATCH __fastcall TItems::Find(BSTR Filter/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Find(Filter, (LPDISPATCH*)&Item));
  return Item;
}

LPDISPATCH __fastcall TItems::FindNext(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->FindNext((LPDISPATCH*)&Item));
  return Item;
}

LPDISPATCH __fastcall TItems::GetFirst(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->GetFirst((LPDISPATCH*)&Item));
  return Item;
}

LPDISPATCH __fastcall TItems::GetLast(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->GetLast((LPDISPATCH*)&Item));
  return Item;
}

LPDISPATCH __fastcall TItems::GetNext(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->GetNext((LPDISPATCH*)&Item));
  return Item;
}

LPDISPATCH __fastcall TItems::GetPrevious(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->GetPrevious((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TItems::Remove(long Index/*[in]*/)
{
  GetDefaultInterface()->Remove(Index/*[in]*/);
}

void __fastcall TItems::ResetColumns(void)
{
  GetDefaultInterface()->ResetColumns();
}

Outlook_xp::_Items* __fastcall TItems::Restrict(BSTR Filter/*[in]*/)
{
  Outlook_xp::_Items* Items = 0;
  OLECHECK(GetDefaultInterface()->Restrict(Filter, (Outlook_xp::_Items**)&Items));
  return Items;
}

void __fastcall TItems::SetColumns(BSTR Columns/*[in]*/)
{
  GetDefaultInterface()->SetColumns(Columns/*[in]*/);
}

void __fastcall TItems::Sort(BSTR Property/*[in]*/, VARIANT Descending/*[in,opt]*/)
{
  GetDefaultInterface()->Sort(Property/*[in]*/, Descending/*[in,opt]*/);
}

Outlook_xp::_ApplicationPtr __fastcall TItems::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TItems::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TItems::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TItems::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

long __fastcall TItems::get_Count(void)
{
  long Count;
  OLECHECK(GetDefaultInterface()->get_Count((long*)&Count));
  return Count;
}

LPUNKNOWN __fastcall TItems::get_RawTable(void)
{
  LPUNKNOWN RawTable;
  OLECHECK(GetDefaultInterface()->get_RawTable((LPUNKNOWN*)&RawTable));
  return RawTable;
}

VARIANT_BOOL __fastcall TItems::get_IncludeRecurrences(void)
{
  VARIANT_BOOL IncludeRecurrences;
  OLECHECK(GetDefaultInterface()->get_IncludeRecurrences((VARIANT_BOOL*)&IncludeRecurrences));
  return IncludeRecurrences;
}

void __fastcall TItems::set_IncludeRecurrences(VARIANT_BOOL IncludeRecurrences/*[in]*/)
{
  GetDefaultInterface()->set_IncludeRecurrences(IncludeRecurrences/*[in]*/);
}

_JournalItemPtr& TJournalItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TJournalItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TJournalItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TJournalItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TJournalItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TJournalItem::ConnectTo(_JournalItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TJournalItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_JournalItem;
  sd.IntfIID = __uuidof(_JournalItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TJournalItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TJournalItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TJournalItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TJournalItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TJournalItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TJournalItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TJournalItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TJournalItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TJournalItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

Outlook_xp::MailItem* __fastcall TJournalItem::Forward(void)
{
  Outlook_xp::MailItem* Item = 0;
  OLECHECK(GetDefaultInterface()->Forward((Outlook_xp::MailItem**)&Item));
  return Item;
}

Outlook_xp::MailItem* __fastcall TJournalItem::Reply(void)
{
  Outlook_xp::MailItem* Item = 0;
  OLECHECK(GetDefaultInterface()->Reply((Outlook_xp::MailItem**)&Item));
  return Item;
}

Outlook_xp::MailItem* __fastcall TJournalItem::ReplyAll(void)
{
  Outlook_xp::MailItem* Item = 0;
  OLECHECK(GetDefaultInterface()->ReplyAll((Outlook_xp::MailItem**)&Item));
  return Item;
}

void __fastcall TJournalItem::StartTimer(void)
{
  GetDefaultInterface()->StartTimer();
}

void __fastcall TJournalItem::StopTimer(void)
{
  GetDefaultInterface()->StopTimer();
}

void __fastcall TJournalItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TJournalItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TJournalItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TJournalItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TJournalItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TJournalItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TJournalItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TJournalItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TJournalItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TJournalItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TJournalItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TJournalItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TJournalItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TJournalItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TJournalItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TJournalItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TJournalItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TJournalItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TJournalItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TJournalItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TJournalItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TJournalItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TJournalItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TJournalItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TJournalItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TJournalItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TJournalItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TJournalItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TJournalItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TJournalItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TJournalItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TJournalItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TJournalItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TJournalItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TJournalItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TJournalItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TJournalItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TJournalItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TJournalItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TJournalItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TJournalItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TJournalItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

BSTR __fastcall TJournalItem::get_ContactNames(void)
{
  BSTR ContactNames = 0;
  OLECHECK(GetDefaultInterface()->get_ContactNames((BSTR*)&ContactNames));
  return ContactNames;
}

void __fastcall TJournalItem::set_ContactNames(BSTR ContactNames/*[in]*/)
{
  GetDefaultInterface()->set_ContactNames(ContactNames/*[in]*/);
}

VARIANT_BOOL __fastcall TJournalItem::get_DocPosted(void)
{
  VARIANT_BOOL DocPosted;
  OLECHECK(GetDefaultInterface()->get_DocPosted((VARIANT_BOOL*)&DocPosted));
  return DocPosted;
}

void __fastcall TJournalItem::set_DocPosted(VARIANT_BOOL DocPosted/*[in]*/)
{
  GetDefaultInterface()->set_DocPosted(DocPosted/*[in]*/);
}

VARIANT_BOOL __fastcall TJournalItem::get_DocPrinted(void)
{
  VARIANT_BOOL DocPrinted;
  OLECHECK(GetDefaultInterface()->get_DocPrinted((VARIANT_BOOL*)&DocPrinted));
  return DocPrinted;
}

void __fastcall TJournalItem::set_DocPrinted(VARIANT_BOOL DocPrinted/*[in]*/)
{
  GetDefaultInterface()->set_DocPrinted(DocPrinted/*[in]*/);
}

VARIANT_BOOL __fastcall TJournalItem::get_DocRouted(void)
{
  VARIANT_BOOL DocRouted;
  OLECHECK(GetDefaultInterface()->get_DocRouted((VARIANT_BOOL*)&DocRouted));
  return DocRouted;
}

void __fastcall TJournalItem::set_DocRouted(VARIANT_BOOL DocRouted/*[in]*/)
{
  GetDefaultInterface()->set_DocRouted(DocRouted/*[in]*/);
}

VARIANT_BOOL __fastcall TJournalItem::get_DocSaved(void)
{
  VARIANT_BOOL DocSaved;
  OLECHECK(GetDefaultInterface()->get_DocSaved((VARIANT_BOOL*)&DocSaved));
  return DocSaved;
}

void __fastcall TJournalItem::set_DocSaved(VARIANT_BOOL DocSaved/*[in]*/)
{
  GetDefaultInterface()->set_DocSaved(DocSaved/*[in]*/);
}

long __fastcall TJournalItem::get_Duration(void)
{
  long Duration;
  OLECHECK(GetDefaultInterface()->get_Duration((long*)&Duration));
  return Duration;
}

void __fastcall TJournalItem::set_Duration(long Duration/*[in]*/)
{
  GetDefaultInterface()->set_Duration(Duration/*[in]*/);
}

DATE __fastcall TJournalItem::get_End(void)
{
  DATE End;
  OLECHECK(GetDefaultInterface()->get_End((DATE*)&End));
  return End;
}

void __fastcall TJournalItem::set_End(DATE End/*[in]*/)
{
  GetDefaultInterface()->set_End(End/*[in]*/);
}

BSTR __fastcall TJournalItem::get_Type(void)
{
  BSTR Type = 0;
  OLECHECK(GetDefaultInterface()->get_Type((BSTR*)&Type));
  return Type;
}

void __fastcall TJournalItem::set_Type(BSTR Type/*[in]*/)
{
  GetDefaultInterface()->set_Type(Type/*[in]*/);
}

Outlook_xp::RecipientsPtr __fastcall TJournalItem::get_Recipients(void)
{
  Outlook_xp::RecipientsPtr Recipients;
  OLECHECK(GetDefaultInterface()->get_Recipients(&Recipients));
  return Recipients;
}

DATE __fastcall TJournalItem::get_Start(void)
{
  DATE Start;
  OLECHECK(GetDefaultInterface()->get_Start((DATE*)&Start));
  return Start;
}

void __fastcall TJournalItem::set_Start(DATE Start/*[in]*/)
{
  GetDefaultInterface()->set_Start(Start/*[in]*/);
}

Outlook_xp::LinksPtr __fastcall TJournalItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::OlDownloadState __fastcall TJournalItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

Outlook_xp::ItemPropertiesPtr __fastcall TJournalItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlRemoteStatus __fastcall TJournalItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TJournalItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TJournalItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_NameSpacePtr& TNameSpace::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TNameSpace::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TNameSpace::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TNameSpace::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TNameSpace::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TNameSpace::ConnectTo(_NameSpacePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TNameSpace::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_NameSpace;
  sd.IntfIID = __uuidof(_NameSpace);
  sd.EventIID= __uuidof(NameSpaceEvents);
  ServerData = &sd;
}

void __fastcall TNameSpace::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61445: {
      if (OnOptionsPagesAdd) {
        (OnOptionsPagesAdd)(this, (Outlook_xp::PropertyPagesPtr)(LPDISPATCH)(params[0].pdispVal), (Outlook_xp::MAPIFolderPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

Outlook_xp::Recipient* __fastcall TNameSpace::CreateRecipient(BSTR RecipientName/*[in]*/)
{
  Outlook_xp::Recipient* Recipient = 0;
  OLECHECK(GetDefaultInterface()->CreateRecipient(RecipientName, (Outlook_xp::Recipient**)&Recipient));
  return Recipient;
}

Outlook_xp::MAPIFolder* __fastcall TNameSpace::GetDefaultFolder(Outlook_xp::OlDefaultFolders FolderType/*[in]*/)
{
  Outlook_xp::MAPIFolder* Folder = 0;
  OLECHECK(GetDefaultInterface()->GetDefaultFolder(FolderType, (Outlook_xp::MAPIFolder**)&Folder));
  return Folder;
}

Outlook_xp::MAPIFolder* __fastcall TNameSpace::GetFolderFromID(BSTR EntryIDFolder/*[in]*/, 
                                                               VARIANT EntryIDStore/*[in,opt]*/)
{
  Outlook_xp::MAPIFolder* Folder = 0;
  OLECHECK(GetDefaultInterface()->GetFolderFromID(EntryIDFolder, EntryIDStore, (Outlook_xp::MAPIFolder**)&Folder));
  return Folder;
}

LPDISPATCH __fastcall TNameSpace::GetItemFromID(BSTR EntryIDItem/*[in]*/, 
                                                VARIANT EntryIDStore/*[in,opt]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->GetItemFromID(EntryIDItem, EntryIDStore, (LPDISPATCH*)&Item));
  return Item;
}

Outlook_xp::Recipient* __fastcall TNameSpace::GetRecipientFromID(BSTR EntryID/*[in]*/)
{
  Outlook_xp::Recipient* Recipient = 0;
  OLECHECK(GetDefaultInterface()->GetRecipientFromID(EntryID, (Outlook_xp::Recipient**)&Recipient));
  return Recipient;
}

Outlook_xp::MAPIFolder* __fastcall TNameSpace::GetSharedDefaultFolder(Outlook_xp::Recipient* Recipient/*[in]*/, 
                                                                      Outlook_xp::OlDefaultFolders FolderType/*[in]*/)
{
  Outlook_xp::MAPIFolder* Folder = 0;
  OLECHECK(GetDefaultInterface()->GetSharedDefaultFolder(Recipient, FolderType, (Outlook_xp::MAPIFolder**)&Folder));
  return Folder;
}

void __fastcall TNameSpace::Logoff(void)
{
  GetDefaultInterface()->Logoff();
}

void __fastcall TNameSpace::Logon(VARIANT Profile/*[in,opt]*/, VARIANT Password/*[in,opt]*/, 
                                  VARIANT ShowDialog/*[in,opt]*/, VARIANT NewSession/*[in,opt]*/)
{
  GetDefaultInterface()->Logon(Profile/*[in,opt]*/, Password/*[in,opt]*/, ShowDialog/*[in,opt]*/, 
                               NewSession/*[in,opt]*/);
}

Outlook_xp::MAPIFolder* __fastcall TNameSpace::PickFolder(void)
{
  Outlook_xp::MAPIFolder* Folder = 0;
  OLECHECK(GetDefaultInterface()->PickFolder((Outlook_xp::MAPIFolder**)&Folder));
  return Folder;
}

void __fastcall TNameSpace::RefreshRemoteHeaders(void)
{
  GetDefaultInterface()->RefreshRemoteHeaders();
}

void __fastcall TNameSpace::AddStore(VARIANT Store/*[in]*/)
{
  GetDefaultInterface()->AddStore(Store/*[in]*/);
}

void __fastcall TNameSpace::RemoveStore(Outlook_xp::MAPIFolder* Folder/*[in]*/)
{
  GetDefaultInterface()->RemoveStore(Folder/*[in]*/);
}

void __fastcall TNameSpace::Dial(VARIANT ContactItem/*[in,opt]*/)
{
  GetDefaultInterface()->Dial(ContactItem/*[in,opt]*/);
}

Outlook_xp::_ApplicationPtr __fastcall TNameSpace::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TNameSpace::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TNameSpace::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TNameSpace::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::RecipientPtr __fastcall TNameSpace::get_CurrentUser(void)
{
  Outlook_xp::RecipientPtr CurrentUser;
  OLECHECK(GetDefaultInterface()->get_CurrentUser(&CurrentUser));
  return CurrentUser;
}

Outlook_xp::_FoldersPtr __fastcall TNameSpace::get_Folders(void)
{
  Outlook_xp::_FoldersPtr Folders;
  OLECHECK(GetDefaultInterface()->get_Folders(&Folders));
  return Folders;
}

BSTR __fastcall TNameSpace::get_Type(void)
{
  BSTR Type = 0;
  OLECHECK(GetDefaultInterface()->get_Type((BSTR*)&Type));
  return Type;
}

Outlook_xp::AddressListsPtr __fastcall TNameSpace::get_AddressLists(void)
{
  Outlook_xp::AddressListsPtr AddressLists;
  OLECHECK(GetDefaultInterface()->get_AddressLists(&AddressLists));
  return AddressLists;
}

Outlook_xp::SyncObjectsPtr __fastcall TNameSpace::get_SyncObjects(void)
{
  Outlook_xp::SyncObjectsPtr SyncObjects;
  OLECHECK(GetDefaultInterface()->get_SyncObjects(&SyncObjects));
  return SyncObjects;
}

VARIANT_BOOL __fastcall TNameSpace::get_Offline(void)
{
  VARIANT_BOOL Offline;
  OLECHECK(GetDefaultInterface()->get_Offline((VARIANT_BOOL*)&Offline));
  return Offline;
}

LPUNKNOWN __fastcall TNameSpace::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

_OutlookBarGroupsPtr& TOutlookBarGroups::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TOutlookBarGroups::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TOutlookBarGroups::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TOutlookBarGroups::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TOutlookBarGroups::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TOutlookBarGroups::ConnectTo(_OutlookBarGroupsPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TOutlookBarGroups::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_OutlookBarGroups;
  sd.IntfIID = __uuidof(_OutlookBarGroups);
  sd.EventIID= __uuidof(OutlookBarGroupsEvents);
  ServerData = &sd;
}

void __fastcall TOutlookBarGroups::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61441: {
      if (OnGroupAdd) {
        (OnGroupAdd)(this, (Outlook_xp::OutlookBarGroupPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61442: {
      if (OnBeforeGroupAdd) {
        (OnBeforeGroupAdd)(this, params[0].pboolVal);
      }
      break;
      }
    case 61443: {
      if (OnBeforeGroupRemove) {
        (OnBeforeGroupRemove)(this, (Outlook_xp::OutlookBarGroupPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

Outlook_xp::OutlookBarGroup* __fastcall TOutlookBarGroups::Item(VARIANT Index/*[in]*/)
{
  Outlook_xp::OutlookBarGroup* Item = 0;
  OLECHECK(GetDefaultInterface()->Item(Index, (Outlook_xp::OutlookBarGroup**)&Item));
  return Item;
}

Outlook_xp::OutlookBarGroup* __fastcall TOutlookBarGroups::Add(BSTR Name/*[in]*/, 
                                                               VARIANT Index/*[in,opt]*/)
{
  Outlook_xp::OutlookBarGroup* Group = 0;
  OLECHECK(GetDefaultInterface()->Add(Name, Index, (Outlook_xp::OutlookBarGroup**)&Group));
  return Group;
}

void __fastcall TOutlookBarGroups::Remove(VARIANT Index/*[in]*/)
{
  GetDefaultInterface()->Remove(Index/*[in]*/);
}

Outlook_xp::_ApplicationPtr __fastcall TOutlookBarGroups::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TOutlookBarGroups::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TOutlookBarGroups::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TOutlookBarGroups::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

long __fastcall TOutlookBarGroups::get_Count(void)
{
  long Count;
  OLECHECK(GetDefaultInterface()->get_Count((long*)&Count));
  return Count;
}

_OutlookBarPanePtr& TOutlookBarPane::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TOutlookBarPane::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TOutlookBarPane::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TOutlookBarPane::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TOutlookBarPane::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TOutlookBarPane::ConnectTo(_OutlookBarPanePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TOutlookBarPane::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_OutlookBarPane;
  sd.IntfIID = __uuidof(_OutlookBarPane);
  sd.EventIID= __uuidof(OutlookBarPaneEvents);
  ServerData = &sd;
}

void __fastcall TOutlookBarPane::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61441: {
      if (OnBeforeNavigate) {
        (OnBeforeNavigate)(this, (Outlook_xp::OutlookBarShortcutPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnBeforeGroupSwitch) {
        (OnBeforeGroupSwitch)(this, (Outlook_xp::OutlookBarGroupPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

Outlook_xp::_ApplicationPtr __fastcall TOutlookBarPane::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TOutlookBarPane::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TOutlookBarPane::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TOutlookBarPane::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::OutlookBarStoragePtr __fastcall TOutlookBarPane::get_Contents(void)
{
  Outlook_xp::OutlookBarStoragePtr Contents;
  OLECHECK(GetDefaultInterface()->get_Contents(&Contents));
  return Contents;
}

Outlook_xp::OutlookBarGroupPtr __fastcall TOutlookBarPane::get_CurrentGroup(void)
{
  Outlook_xp::OutlookBarGroupPtr CurrentGroup;
  OLECHECK(GetDefaultInterface()->get_CurrentGroup(&CurrentGroup));
  return CurrentGroup;
}

void __fastcall TOutlookBarPane::_set_CurrentGroup(Outlook_xp::OutlookBarGroup* CurrentGroup/*[in]*/)
{
  GetDefaultInterface()->_set_CurrentGroup(CurrentGroup/*[in]*/);
}

BSTR __fastcall TOutlookBarPane::get_Name(void)
{
  BSTR Name = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&Name));
  return Name;
}

VARIANT_BOOL __fastcall TOutlookBarPane::get_Visible(void)
{
  VARIANT_BOOL Visible;
  OLECHECK(GetDefaultInterface()->get_Visible((VARIANT_BOOL*)&Visible));
  return Visible;
}

void __fastcall TOutlookBarPane::set_Visible(VARIANT_BOOL Visible/*[in]*/)
{
  GetDefaultInterface()->set_Visible(Visible/*[in]*/);
}

_OutlookBarShortcutsPtr& TOutlookBarShortcuts::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TOutlookBarShortcuts::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TOutlookBarShortcuts::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TOutlookBarShortcuts::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TOutlookBarShortcuts::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TOutlookBarShortcuts::ConnectTo(_OutlookBarShortcutsPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TOutlookBarShortcuts::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_OutlookBarShortcuts;
  sd.IntfIID = __uuidof(_OutlookBarShortcuts);
  sd.EventIID= __uuidof(OutlookBarShortcutsEvents);
  ServerData = &sd;
}

void __fastcall TOutlookBarShortcuts::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61441: {
      if (OnShortcutAdd) {
        (OnShortcutAdd)(this, (Outlook_xp::OutlookBarShortcutPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61442: {
      if (OnBeforeShortcutAdd) {
        (OnBeforeShortcutAdd)(this, params[0].pboolVal);
      }
      break;
      }
    case 61443: {
      if (OnBeforeShortcutRemove) {
        (OnBeforeShortcutRemove)(this, (Outlook_xp::OutlookBarShortcutPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

Outlook_xp::OutlookBarShortcut* __fastcall TOutlookBarShortcuts::Item(VARIANT Index/*[in]*/)
{
  Outlook_xp::OutlookBarShortcut* Item = 0;
  OLECHECK(GetDefaultInterface()->Item(Index, (Outlook_xp::OutlookBarShortcut**)&Item));
  return Item;
}

Outlook_xp::OutlookBarShortcut* __fastcall TOutlookBarShortcuts::Add(VARIANT Target/*[in]*/, 
                                                                     BSTR Name/*[in]*/, 
                                                                     VARIANT Index/*[in,opt]*/)
{
  Outlook_xp::OutlookBarShortcut* Shortcut = 0;
  OLECHECK(GetDefaultInterface()->Add(Target, Name, Index, (Outlook_xp::OutlookBarShortcut**)&Shortcut));
  return Shortcut;
}

void __fastcall TOutlookBarShortcuts::Remove(VARIANT Index/*[in]*/)
{
  GetDefaultInterface()->Remove(Index/*[in]*/);
}

Outlook_xp::_ApplicationPtr __fastcall TOutlookBarShortcuts::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TOutlookBarShortcuts::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TOutlookBarShortcuts::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TOutlookBarShortcuts::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

long __fastcall TOutlookBarShortcuts::get_Count(void)
{
  long Count;
  OLECHECK(GetDefaultInterface()->get_Count((long*)&Count));
  return Count;
}

_PostItemPtr& TPostItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TPostItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TPostItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TPostItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TPostItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TPostItem::ConnectTo(_PostItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TPostItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_PostItem;
  sd.IntfIID = __uuidof(_PostItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TPostItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TPostItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TPostItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TPostItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TPostItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TPostItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TPostItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TPostItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TPostItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

void __fastcall TPostItem::ClearConversationIndex(void)
{
  GetDefaultInterface()->ClearConversationIndex();
}

Outlook_xp::MailItem* __fastcall TPostItem::Forward(void)
{
  Outlook_xp::MailItem* Item = 0;
  OLECHECK(GetDefaultInterface()->Forward((Outlook_xp::MailItem**)&Item));
  return Item;
}

void __fastcall TPostItem::Post(void)
{
  GetDefaultInterface()->Post();
}

Outlook_xp::MailItem* __fastcall TPostItem::Reply(void)
{
  Outlook_xp::MailItem* Item = 0;
  OLECHECK(GetDefaultInterface()->Reply((Outlook_xp::MailItem**)&Item));
  return Item;
}

void __fastcall TPostItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

VARIANT_BOOL __fastcall TPostItem::SetACLs(void)
{
  VARIANT_BOOL AllOkay;
  OLECHECK(GetDefaultInterface()->SetACLs((VARIANT_BOOL*)&AllOkay));
  return AllOkay;
}

Outlook_xp::_ApplicationPtr __fastcall TPostItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TPostItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TPostItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TPostItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TPostItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TPostItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TPostItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TPostItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TPostItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TPostItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TPostItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TPostItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TPostItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TPostItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TPostItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TPostItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TPostItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TPostItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TPostItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TPostItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TPostItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TPostItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TPostItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TPostItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TPostItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TPostItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TPostItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TPostItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TPostItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TPostItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TPostItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TPostItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TPostItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TPostItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TPostItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TPostItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TPostItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TPostItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TPostItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TPostItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TPostItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

DATE __fastcall TPostItem::get_ExpiryTime(void)
{
  DATE ExpiryTime;
  OLECHECK(GetDefaultInterface()->get_ExpiryTime((DATE*)&ExpiryTime));
  return ExpiryTime;
}

void __fastcall TPostItem::set_ExpiryTime(DATE ExpiryTime/*[in]*/)
{
  GetDefaultInterface()->set_ExpiryTime(ExpiryTime/*[in]*/);
}

BSTR __fastcall TPostItem::get_HTMLBody(void)
{
  BSTR HTMLBody = 0;
  OLECHECK(GetDefaultInterface()->get_HTMLBody((BSTR*)&HTMLBody));
  return HTMLBody;
}

void __fastcall TPostItem::set_HTMLBody(BSTR HTMLBody/*[in]*/)
{
  GetDefaultInterface()->set_HTMLBody(HTMLBody/*[in]*/);
}

DATE __fastcall TPostItem::get_ReceivedTime(void)
{
  DATE ReceivedTime;
  OLECHECK(GetDefaultInterface()->get_ReceivedTime((DATE*)&ReceivedTime));
  return ReceivedTime;
}

BSTR __fastcall TPostItem::get_SenderName(void)
{
  BSTR SenderName = 0;
  OLECHECK(GetDefaultInterface()->get_SenderName((BSTR*)&SenderName));
  return SenderName;
}

DATE __fastcall TPostItem::get_SentOn(void)
{
  DATE SentOn;
  OLECHECK(GetDefaultInterface()->get_SentOn((DATE*)&SentOn));
  return SentOn;
}

Outlook_xp::LinksPtr __fastcall TPostItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::ItemPropertiesPtr __fastcall TPostItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlBodyFormat __fastcall TPostItem::get_BodyFormat(void)
{
  Outlook_xp::OlBodyFormat BodyFormat;
  OLECHECK(GetDefaultInterface()->get_BodyFormat((Outlook_xp::OlBodyFormat*)&BodyFormat));
  return BodyFormat;
}

void __fastcall TPostItem::set_BodyFormat(Outlook_xp::OlBodyFormat BodyFormat/*[in]*/)
{
  GetDefaultInterface()->set_BodyFormat(BodyFormat/*[in]*/);
}

Outlook_xp::OlDownloadState __fastcall TPostItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

long __fastcall TPostItem::get_InternetCodepage(void)
{
  long InternetCodepage;
  OLECHECK(GetDefaultInterface()->get_InternetCodepage((long*)&InternetCodepage));
  return InternetCodepage;
}

void __fastcall TPostItem::set_InternetCodepage(long InternetCodepage/*[in]*/)
{
  GetDefaultInterface()->set_InternetCodepage(InternetCodepage/*[in]*/);
}

Outlook_xp::OlRemoteStatus __fastcall TPostItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TPostItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TPostItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_RemoteItemPtr& TRemoteItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TRemoteItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TRemoteItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TRemoteItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TRemoteItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TRemoteItem::ConnectTo(_RemoteItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TRemoteItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_RemoteItem;
  sd.IntfIID = __uuidof(_RemoteItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TRemoteItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TRemoteItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TRemoteItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TRemoteItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TRemoteItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TRemoteItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TRemoteItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TRemoteItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TRemoteItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

void __fastcall TRemoteItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TRemoteItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TRemoteItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TRemoteItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TRemoteItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TRemoteItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TRemoteItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TRemoteItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TRemoteItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TRemoteItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TRemoteItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TRemoteItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TRemoteItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TRemoteItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TRemoteItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TRemoteItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TRemoteItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TRemoteItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TRemoteItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TRemoteItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TRemoteItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TRemoteItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TRemoteItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TRemoteItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TRemoteItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TRemoteItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TRemoteItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TRemoteItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TRemoteItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TRemoteItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TRemoteItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TRemoteItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TRemoteItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TRemoteItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TRemoteItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TRemoteItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TRemoteItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TRemoteItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TRemoteItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TRemoteItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TRemoteItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TRemoteItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

VARIANT_BOOL __fastcall TRemoteItem::get_HasAttachment(void)
{
  VARIANT_BOOL HasAttachment;
  OLECHECK(GetDefaultInterface()->get_HasAttachment((VARIANT_BOOL*)&HasAttachment));
  return HasAttachment;
}

BSTR __fastcall TRemoteItem::get_RemoteMessageClass(void)
{
  BSTR RemoteMessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_RemoteMessageClass((BSTR*)&RemoteMessageClass));
  return RemoteMessageClass;
}

long __fastcall TRemoteItem::get_TransferSize(void)
{
  long TransferSize;
  OLECHECK(GetDefaultInterface()->get_TransferSize((long*)&TransferSize));
  return TransferSize;
}

long __fastcall TRemoteItem::get_TransferTime(void)
{
  long TransferTime;
  OLECHECK(GetDefaultInterface()->get_TransferTime((long*)&TransferTime));
  return TransferTime;
}

Outlook_xp::LinksPtr __fastcall TRemoteItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::OlDownloadState __fastcall TRemoteItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

Outlook_xp::ItemPropertiesPtr __fastcall TRemoteItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlRemoteStatus __fastcall TRemoteItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TRemoteItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TRemoteItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_ReportItemPtr& TReportItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TReportItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TReportItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TReportItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TReportItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TReportItem::ConnectTo(_ReportItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TReportItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_ReportItem;
  sd.IntfIID = __uuidof(_ReportItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TReportItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TReportItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TReportItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TReportItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TReportItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TReportItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TReportItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TReportItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TReportItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

void __fastcall TReportItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TReportItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TReportItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TReportItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TReportItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TReportItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TReportItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TReportItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TReportItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TReportItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TReportItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TReportItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TReportItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TReportItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TReportItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TReportItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TReportItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TReportItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TReportItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TReportItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TReportItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TReportItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TReportItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TReportItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TReportItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TReportItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TReportItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TReportItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TReportItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TReportItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TReportItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TReportItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TReportItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TReportItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TReportItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TReportItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TReportItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TReportItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TReportItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TReportItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TReportItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TReportItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

Outlook_xp::LinksPtr __fastcall TReportItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::OlDownloadState __fastcall TReportItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

Outlook_xp::ItemPropertiesPtr __fastcall TReportItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlRemoteStatus __fastcall TReportItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TReportItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TReportItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_TaskRequestAcceptItemPtr& TTaskRequestAcceptItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TTaskRequestAcceptItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TTaskRequestAcceptItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TTaskRequestAcceptItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TTaskRequestAcceptItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TTaskRequestAcceptItem::ConnectTo(_TaskRequestAcceptItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TTaskRequestAcceptItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_TaskRequestAcceptItem;
  sd.IntfIID = __uuidof(_TaskRequestAcceptItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TTaskRequestAcceptItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TTaskRequestAcceptItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TTaskRequestAcceptItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TTaskRequestAcceptItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TTaskRequestAcceptItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TTaskRequestAcceptItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TTaskRequestAcceptItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TTaskRequestAcceptItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TTaskRequestAcceptItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

Outlook_xp::TaskItem* __fastcall TTaskRequestAcceptItem::GetAssociatedTask(VARIANT_BOOL AddToTaskList/*[in]*/)
{
  Outlook_xp::TaskItem* Item = 0;
  OLECHECK(GetDefaultInterface()->GetAssociatedTask(AddToTaskList, (Outlook_xp::TaskItem**)&Item));
  return Item;
}

void __fastcall TTaskRequestAcceptItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TTaskRequestAcceptItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TTaskRequestAcceptItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TTaskRequestAcceptItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TTaskRequestAcceptItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TTaskRequestAcceptItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TTaskRequestAcceptItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TTaskRequestAcceptItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TTaskRequestAcceptItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TTaskRequestAcceptItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TTaskRequestAcceptItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TTaskRequestAcceptItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TTaskRequestAcceptItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TTaskRequestAcceptItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TTaskRequestAcceptItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TTaskRequestAcceptItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TTaskRequestAcceptItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TTaskRequestAcceptItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TTaskRequestAcceptItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TTaskRequestAcceptItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TTaskRequestAcceptItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TTaskRequestAcceptItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TTaskRequestAcceptItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TTaskRequestAcceptItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TTaskRequestAcceptItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TTaskRequestAcceptItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TTaskRequestAcceptItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TTaskRequestAcceptItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TTaskRequestAcceptItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestAcceptItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TTaskRequestAcceptItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TTaskRequestAcceptItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TTaskRequestAcceptItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TTaskRequestAcceptItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TTaskRequestAcceptItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TTaskRequestAcceptItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TTaskRequestAcceptItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TTaskRequestAcceptItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TTaskRequestAcceptItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestAcceptItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TTaskRequestAcceptItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TTaskRequestAcceptItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

Outlook_xp::LinksPtr __fastcall TTaskRequestAcceptItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::OlDownloadState __fastcall TTaskRequestAcceptItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

Outlook_xp::ItemPropertiesPtr __fastcall TTaskRequestAcceptItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlRemoteStatus __fastcall TTaskRequestAcceptItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TTaskRequestAcceptItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestAcceptItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_TaskRequestDeclineItemPtr& TTaskRequestDeclineItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TTaskRequestDeclineItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TTaskRequestDeclineItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TTaskRequestDeclineItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TTaskRequestDeclineItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TTaskRequestDeclineItem::ConnectTo(_TaskRequestDeclineItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TTaskRequestDeclineItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_TaskRequestDeclineItem;
  sd.IntfIID = __uuidof(_TaskRequestDeclineItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TTaskRequestDeclineItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TTaskRequestDeclineItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TTaskRequestDeclineItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TTaskRequestDeclineItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TTaskRequestDeclineItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TTaskRequestDeclineItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TTaskRequestDeclineItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TTaskRequestDeclineItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TTaskRequestDeclineItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

Outlook_xp::TaskItem* __fastcall TTaskRequestDeclineItem::GetAssociatedTask(VARIANT_BOOL AddToTaskList/*[in]*/)
{
  Outlook_xp::TaskItem* Item = 0;
  OLECHECK(GetDefaultInterface()->GetAssociatedTask(AddToTaskList, (Outlook_xp::TaskItem**)&Item));
  return Item;
}

void __fastcall TTaskRequestDeclineItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TTaskRequestDeclineItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TTaskRequestDeclineItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TTaskRequestDeclineItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TTaskRequestDeclineItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TTaskRequestDeclineItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TTaskRequestDeclineItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TTaskRequestDeclineItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TTaskRequestDeclineItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TTaskRequestDeclineItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TTaskRequestDeclineItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TTaskRequestDeclineItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TTaskRequestDeclineItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TTaskRequestDeclineItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TTaskRequestDeclineItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TTaskRequestDeclineItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TTaskRequestDeclineItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TTaskRequestDeclineItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TTaskRequestDeclineItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TTaskRequestDeclineItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TTaskRequestDeclineItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TTaskRequestDeclineItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TTaskRequestDeclineItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TTaskRequestDeclineItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TTaskRequestDeclineItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TTaskRequestDeclineItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TTaskRequestDeclineItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TTaskRequestDeclineItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TTaskRequestDeclineItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestDeclineItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TTaskRequestDeclineItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TTaskRequestDeclineItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TTaskRequestDeclineItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TTaskRequestDeclineItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TTaskRequestDeclineItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TTaskRequestDeclineItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TTaskRequestDeclineItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TTaskRequestDeclineItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TTaskRequestDeclineItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestDeclineItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TTaskRequestDeclineItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TTaskRequestDeclineItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

Outlook_xp::LinksPtr __fastcall TTaskRequestDeclineItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::OlDownloadState __fastcall TTaskRequestDeclineItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

Outlook_xp::ItemPropertiesPtr __fastcall TTaskRequestDeclineItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlRemoteStatus __fastcall TTaskRequestDeclineItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TTaskRequestDeclineItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestDeclineItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_TaskRequestItemPtr& TTaskRequestItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TTaskRequestItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TTaskRequestItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TTaskRequestItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TTaskRequestItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TTaskRequestItem::ConnectTo(_TaskRequestItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TTaskRequestItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_TaskRequestItem;
  sd.IntfIID = __uuidof(_TaskRequestItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TTaskRequestItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TTaskRequestItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TTaskRequestItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TTaskRequestItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TTaskRequestItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TTaskRequestItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TTaskRequestItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TTaskRequestItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TTaskRequestItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

Outlook_xp::TaskItem* __fastcall TTaskRequestItem::GetAssociatedTask(VARIANT_BOOL AddToTaskList/*[in]*/)
{
  Outlook_xp::TaskItem* Item = 0;
  OLECHECK(GetDefaultInterface()->GetAssociatedTask(AddToTaskList, (Outlook_xp::TaskItem**)&Item));
  return Item;
}

void __fastcall TTaskRequestItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TTaskRequestItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TTaskRequestItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TTaskRequestItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TTaskRequestItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TTaskRequestItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TTaskRequestItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TTaskRequestItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TTaskRequestItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TTaskRequestItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TTaskRequestItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TTaskRequestItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TTaskRequestItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TTaskRequestItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TTaskRequestItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TTaskRequestItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TTaskRequestItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TTaskRequestItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TTaskRequestItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TTaskRequestItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TTaskRequestItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TTaskRequestItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TTaskRequestItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TTaskRequestItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TTaskRequestItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TTaskRequestItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TTaskRequestItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TTaskRequestItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TTaskRequestItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TTaskRequestItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TTaskRequestItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TTaskRequestItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TTaskRequestItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TTaskRequestItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TTaskRequestItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TTaskRequestItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TTaskRequestItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TTaskRequestItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TTaskRequestItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TTaskRequestItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

Outlook_xp::LinksPtr __fastcall TTaskRequestItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::OlDownloadState __fastcall TTaskRequestItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

Outlook_xp::ItemPropertiesPtr __fastcall TTaskRequestItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlRemoteStatus __fastcall TTaskRequestItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TTaskRequestItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}

_TaskRequestUpdateItemPtr& TTaskRequestUpdateItem::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TTaskRequestUpdateItem::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TTaskRequestUpdateItem::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TTaskRequestUpdateItem::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TTaskRequestUpdateItem::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TTaskRequestUpdateItem::ConnectTo(_TaskRequestUpdateItemPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TTaskRequestUpdateItem::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_TaskRequestUpdateItem;
  sd.IntfIID = __uuidof(_TaskRequestUpdateItem);
  sd.EventIID= __uuidof(ItemEvents_10);
  ServerData = &sd;
}

void __fastcall TTaskRequestUpdateItem::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 61443: {
      if (OnOpen) {
        (OnOpen)(this, params[0].pboolVal);
      }
      break;
      }
    case 61446: {
      if (OnCustomAction) {
        (OnCustomAction)(this, params[0].pdispVal, params[1].pdispVal, params[2].pboolVal);
      }
      break;
      }
    case 61448: {
      if (OnCustomPropertyChange) {
        (OnCustomPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 62568: {
      if (OnForward) {
        (OnForward)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61444: {
      if (OnClose) {
        (OnClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 61449: {
      if (OnPropertyChange) {
        (OnPropertyChange)(this, params[0].bstrVal);
      }
      break;
      }
    case 61441: {
      if (OnRead) {
        (OnRead)(this);
      }
      break;
      }
    case 62566: {
      if (OnReply) {
        (OnReply)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 62567: {
      if (OnReplyAll) {
        (OnReplyAll)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    case 61445: {
      if (OnSend) {
        (OnSend)(this, params[0].pboolVal);
      }
      break;
      }
    case 61442: {
      if (OnWrite) {
        (OnWrite)(this, params[0].pboolVal);
      }
      break;
      }
    case 61450: {
      if (OnBeforeCheckNames) {
        (OnBeforeCheckNames)(this, params[0].pboolVal);
      }
      break;
      }
    case 61451: {
      if (OnAttachmentAdd) {
        (OnAttachmentAdd)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61452: {
      if (OnAttachmentRead) {
        (OnAttachmentRead)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 61453: {
      if (OnBeforeAttachmentSave) {
        (OnBeforeAttachmentSave)(this, (Outlook_xp::AttachmentPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 64117: {
      if (OnBeforeDelete) {
        (OnBeforeDelete)(this, params[0].pdispVal, params[1].pboolVal);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TTaskRequestUpdateItem::Close(Outlook_xp::OlInspectorClose SaveMode/*[in]*/)
{
  GetDefaultInterface()->Close(SaveMode/*[in]*/);
}

LPDISPATCH __fastcall TTaskRequestUpdateItem::Copy(void)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Copy((LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TTaskRequestUpdateItem::Delete(void)
{
  GetDefaultInterface()->Delete();
}

void __fastcall TTaskRequestUpdateItem::Display(VARIANT Modal/*[in,opt]*/)
{
  GetDefaultInterface()->Display(Modal/*[in,opt]*/);
}

LPDISPATCH __fastcall TTaskRequestUpdateItem::Move(Outlook_xp::MAPIFolder* DestFldr/*[in]*/)
{
  LPDISPATCH Item;
  OLECHECK(GetDefaultInterface()->Move(DestFldr, (LPDISPATCH*)&Item));
  return Item;
}

void __fastcall TTaskRequestUpdateItem::PrintOut(void)
{
  GetDefaultInterface()->PrintOut();
}

void __fastcall TTaskRequestUpdateItem::Save(void)
{
  GetDefaultInterface()->Save();
}

void __fastcall TTaskRequestUpdateItem::SaveAs(BSTR Path/*[in]*/, VARIANT Type/*[in,opt]*/)
{
  GetDefaultInterface()->SaveAs(Path/*[in]*/, Type/*[in,opt]*/);
}

Outlook_xp::TaskItem* __fastcall TTaskRequestUpdateItem::GetAssociatedTask(VARIANT_BOOL AddToTaskList/*[in]*/)
{
  Outlook_xp::TaskItem* Item = 0;
  OLECHECK(GetDefaultInterface()->GetAssociatedTask(AddToTaskList, (Outlook_xp::TaskItem**)&Item));
  return Item;
}

void __fastcall TTaskRequestUpdateItem::ShowCategoriesDialog(void)
{
  GetDefaultInterface()->ShowCategoriesDialog();
}

Outlook_xp::_ApplicationPtr __fastcall TTaskRequestUpdateItem::get_Application(void)
{
  Outlook_xp::_ApplicationPtr Application;
  OLECHECK(GetDefaultInterface()->get_Application(&Application));
  return Application;
}

Outlook_xp::OlObjectClass __fastcall TTaskRequestUpdateItem::get_Class(void)
{
  Outlook_xp::OlObjectClass Class;
  OLECHECK(GetDefaultInterface()->get_Class((Outlook_xp::OlObjectClass*)&Class));
  return Class;
}

Outlook_xp::_NameSpacePtr __fastcall TTaskRequestUpdateItem::get_Session(void)
{
  Outlook_xp::_NameSpacePtr Session;
  OLECHECK(GetDefaultInterface()->get_Session(&Session));
  return Session;
}

LPDISPATCH __fastcall TTaskRequestUpdateItem::get_Parent(void)
{
  LPDISPATCH Parent;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&Parent));
  return Parent;
}

Outlook_xp::ActionsPtr __fastcall TTaskRequestUpdateItem::get_Actions(void)
{
  Outlook_xp::ActionsPtr Actions;
  OLECHECK(GetDefaultInterface()->get_Actions(&Actions));
  return Actions;
}

Outlook_xp::AttachmentsPtr __fastcall TTaskRequestUpdateItem::get_Attachments(void)
{
  Outlook_xp::AttachmentsPtr Attachments;
  OLECHECK(GetDefaultInterface()->get_Attachments(&Attachments));
  return Attachments;
}

BSTR __fastcall TTaskRequestUpdateItem::get_BillingInformation(void)
{
  BSTR BillingInformation = 0;
  OLECHECK(GetDefaultInterface()->get_BillingInformation((BSTR*)&BillingInformation));
  return BillingInformation;
}

void __fastcall TTaskRequestUpdateItem::set_BillingInformation(BSTR BillingInformation/*[in]*/)
{
  GetDefaultInterface()->set_BillingInformation(BillingInformation/*[in]*/);
}

BSTR __fastcall TTaskRequestUpdateItem::get_Body(void)
{
  BSTR Body = 0;
  OLECHECK(GetDefaultInterface()->get_Body((BSTR*)&Body));
  return Body;
}

void __fastcall TTaskRequestUpdateItem::set_Body(BSTR Body/*[in]*/)
{
  GetDefaultInterface()->set_Body(Body/*[in]*/);
}

BSTR __fastcall TTaskRequestUpdateItem::get_Categories(void)
{
  BSTR Categories = 0;
  OLECHECK(GetDefaultInterface()->get_Categories((BSTR*)&Categories));
  return Categories;
}

void __fastcall TTaskRequestUpdateItem::set_Categories(BSTR Categories/*[in]*/)
{
  GetDefaultInterface()->set_Categories(Categories/*[in]*/);
}

BSTR __fastcall TTaskRequestUpdateItem::get_Companies(void)
{
  BSTR Companies = 0;
  OLECHECK(GetDefaultInterface()->get_Companies((BSTR*)&Companies));
  return Companies;
}

void __fastcall TTaskRequestUpdateItem::set_Companies(BSTR Companies/*[in]*/)
{
  GetDefaultInterface()->set_Companies(Companies/*[in]*/);
}

BSTR __fastcall TTaskRequestUpdateItem::get_ConversationIndex(void)
{
  BSTR ConversationIndex = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationIndex((BSTR*)&ConversationIndex));
  return ConversationIndex;
}

BSTR __fastcall TTaskRequestUpdateItem::get_ConversationTopic(void)
{
  BSTR ConversationTopic = 0;
  OLECHECK(GetDefaultInterface()->get_ConversationTopic((BSTR*)&ConversationTopic));
  return ConversationTopic;
}

DATE __fastcall TTaskRequestUpdateItem::get_CreationTime(void)
{
  DATE CreationTime;
  OLECHECK(GetDefaultInterface()->get_CreationTime((DATE*)&CreationTime));
  return CreationTime;
}

BSTR __fastcall TTaskRequestUpdateItem::get_EntryID(void)
{
  BSTR EntryID = 0;
  OLECHECK(GetDefaultInterface()->get_EntryID((BSTR*)&EntryID));
  return EntryID;
}

Outlook_xp::FormDescriptionPtr __fastcall TTaskRequestUpdateItem::get_FormDescription(void)
{
  Outlook_xp::FormDescriptionPtr FormDescription;
  OLECHECK(GetDefaultInterface()->get_FormDescription(&FormDescription));
  return FormDescription;
}

Outlook_xp::_InspectorPtr __fastcall TTaskRequestUpdateItem::get_GetInspector(void)
{
  Outlook_xp::_InspectorPtr GetInspector;
  OLECHECK(GetDefaultInterface()->get_GetInspector(&GetInspector));
  return GetInspector;
}

Outlook_xp::OlImportance __fastcall TTaskRequestUpdateItem::get_Importance(void)
{
  Outlook_xp::OlImportance Importance;
  OLECHECK(GetDefaultInterface()->get_Importance((Outlook_xp::OlImportance*)&Importance));
  return Importance;
}

void __fastcall TTaskRequestUpdateItem::set_Importance(Outlook_xp::OlImportance Importance/*[in]*/)
{
  GetDefaultInterface()->set_Importance(Importance/*[in]*/);
}

DATE __fastcall TTaskRequestUpdateItem::get_LastModificationTime(void)
{
  DATE LastModificationTime;
  OLECHECK(GetDefaultInterface()->get_LastModificationTime((DATE*)&LastModificationTime));
  return LastModificationTime;
}

LPUNKNOWN __fastcall TTaskRequestUpdateItem::get_MAPIOBJECT(void)
{
  LPUNKNOWN MAPIOBJECT;
  OLECHECK(GetDefaultInterface()->get_MAPIOBJECT((LPUNKNOWN*)&MAPIOBJECT));
  return MAPIOBJECT;
}

BSTR __fastcall TTaskRequestUpdateItem::get_MessageClass(void)
{
  BSTR MessageClass = 0;
  OLECHECK(GetDefaultInterface()->get_MessageClass((BSTR*)&MessageClass));
  return MessageClass;
}

void __fastcall TTaskRequestUpdateItem::set_MessageClass(BSTR MessageClass/*[in]*/)
{
  GetDefaultInterface()->set_MessageClass(MessageClass/*[in]*/);
}

BSTR __fastcall TTaskRequestUpdateItem::get_Mileage(void)
{
  BSTR Mileage = 0;
  OLECHECK(GetDefaultInterface()->get_Mileage((BSTR*)&Mileage));
  return Mileage;
}

void __fastcall TTaskRequestUpdateItem::set_Mileage(BSTR Mileage/*[in]*/)
{
  GetDefaultInterface()->set_Mileage(Mileage/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestUpdateItem::get_NoAging(void)
{
  VARIANT_BOOL NoAging;
  OLECHECK(GetDefaultInterface()->get_NoAging((VARIANT_BOOL*)&NoAging));
  return NoAging;
}

void __fastcall TTaskRequestUpdateItem::set_NoAging(VARIANT_BOOL NoAging/*[in]*/)
{
  GetDefaultInterface()->set_NoAging(NoAging/*[in]*/);
}

long __fastcall TTaskRequestUpdateItem::get_OutlookInternalVersion(void)
{
  long OutlookInternalVersion;
  OLECHECK(GetDefaultInterface()->get_OutlookInternalVersion((long*)&OutlookInternalVersion));
  return OutlookInternalVersion;
}

BSTR __fastcall TTaskRequestUpdateItem::get_OutlookVersion(void)
{
  BSTR OutlookVersion = 0;
  OLECHECK(GetDefaultInterface()->get_OutlookVersion((BSTR*)&OutlookVersion));
  return OutlookVersion;
}

VARIANT_BOOL __fastcall TTaskRequestUpdateItem::get_Saved(void)
{
  VARIANT_BOOL Saved;
  OLECHECK(GetDefaultInterface()->get_Saved((VARIANT_BOOL*)&Saved));
  return Saved;
}

Outlook_xp::OlSensitivity __fastcall TTaskRequestUpdateItem::get_Sensitivity(void)
{
  Outlook_xp::OlSensitivity Sensitivity;
  OLECHECK(GetDefaultInterface()->get_Sensitivity((Outlook_xp::OlSensitivity*)&Sensitivity));
  return Sensitivity;
}

void __fastcall TTaskRequestUpdateItem::set_Sensitivity(Outlook_xp::OlSensitivity Sensitivity/*[in]*/)
{
  GetDefaultInterface()->set_Sensitivity(Sensitivity/*[in]*/);
}

long __fastcall TTaskRequestUpdateItem::get_Size(void)
{
  long Size;
  OLECHECK(GetDefaultInterface()->get_Size((long*)&Size));
  return Size;
}

BSTR __fastcall TTaskRequestUpdateItem::get_Subject(void)
{
  BSTR Subject = 0;
  OLECHECK(GetDefaultInterface()->get_Subject((BSTR*)&Subject));
  return Subject;
}

void __fastcall TTaskRequestUpdateItem::set_Subject(BSTR Subject/*[in]*/)
{
  GetDefaultInterface()->set_Subject(Subject/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestUpdateItem::get_UnRead(void)
{
  VARIANT_BOOL UnRead;
  OLECHECK(GetDefaultInterface()->get_UnRead((VARIANT_BOOL*)&UnRead));
  return UnRead;
}

void __fastcall TTaskRequestUpdateItem::set_UnRead(VARIANT_BOOL UnRead/*[in]*/)
{
  GetDefaultInterface()->set_UnRead(UnRead/*[in]*/);
}

Outlook_xp::UserPropertiesPtr __fastcall TTaskRequestUpdateItem::get_UserProperties(void)
{
  Outlook_xp::UserPropertiesPtr UserProperties;
  OLECHECK(GetDefaultInterface()->get_UserProperties(&UserProperties));
  return UserProperties;
}

Outlook_xp::LinksPtr __fastcall TTaskRequestUpdateItem::get_Links(void)
{
  Outlook_xp::LinksPtr Links;
  OLECHECK(GetDefaultInterface()->get_Links(&Links));
  return Links;
}

Outlook_xp::OlDownloadState __fastcall TTaskRequestUpdateItem::get_DownloadState(void)
{
  Outlook_xp::OlDownloadState DownloadState;
  OLECHECK(GetDefaultInterface()->get_DownloadState((Outlook_xp::OlDownloadState*)&DownloadState));
  return DownloadState;
}

Outlook_xp::ItemPropertiesPtr __fastcall TTaskRequestUpdateItem::get_ItemProperties(void)
{
  Outlook_xp::ItemPropertiesPtr ItemProperties;
  OLECHECK(GetDefaultInterface()->get_ItemProperties(&ItemProperties));
  return ItemProperties;
}

Outlook_xp::OlRemoteStatus __fastcall TTaskRequestUpdateItem::get_MarkForDownload(void)
{
  Outlook_xp::OlRemoteStatus MarkForDownload;
  OLECHECK(GetDefaultInterface()->get_MarkForDownload((Outlook_xp::OlRemoteStatus*)&MarkForDownload));
  return MarkForDownload;
}

void __fastcall TTaskRequestUpdateItem::set_MarkForDownload(Outlook_xp::OlRemoteStatus MarkForDownload/*[in]*/)
{
  GetDefaultInterface()->set_MarkForDownload(MarkForDownload/*[in]*/);
}

VARIANT_BOOL __fastcall TTaskRequestUpdateItem::get_IsConflict(void)
{
  VARIANT_BOOL IsConflict;
  OLECHECK(GetDefaultInterface()->get_IsConflict((VARIANT_BOOL*)&IsConflict));
  return IsConflict;
}


};     // namespace Outlook_xp


// *********************************************************************//
// The Register function is invoked by the IDE when this module is 
// installed in a Package. It provides the list of Components (including
// OCXes) implemented by this module. The following implementation
// informs the IDE of the OCX proxy classes implemented here.
// *********************************************************************//
namespace Outlook_xp_srvr
{

void __fastcall PACKAGE Register()
{
  // [22]
  System::Classes::TComponentClass cls_svr[] = {
                              __classid(Outlook_xp::TSyncObject), 
                              __classid(Outlook_xp::TMailItem), 
                              __classid(Outlook_xp::TOutlookApplication), 
                              __classid(Outlook_xp::TContactItem), 
                              __classid(Outlook_xp::TDistListItem), 
                              __classid(Outlook_xp::TDocumentItem), 
                              __classid(Outlook_xp::TExplorers), 
                              __classid(Outlook_xp::TInspectors), 
                              __classid(Outlook_xp::TFolders), 
                              __classid(Outlook_xp::TItems), 
                              __classid(Outlook_xp::TJournalItem), 
                              __classid(Outlook_xp::TNameSpace), 
                              __classid(Outlook_xp::TOutlookBarGroups), 
                              __classid(Outlook_xp::TOutlookBarPane), 
                              __classid(Outlook_xp::TOutlookBarShortcuts), 
                              __classid(Outlook_xp::TPostItem), 
                              __classid(Outlook_xp::TRemoteItem), 
                              __classid(Outlook_xp::TReportItem), 
                              __classid(Outlook_xp::TTaskRequestAcceptItem), 
                              __classid(Outlook_xp::TTaskRequestDeclineItem), 
                              __classid(Outlook_xp::TTaskRequestItem), 
                              __classid(Outlook_xp::TTaskRequestUpdateItem)
                           };
  System::Classes::RegisterComponents("OfficeXP", cls_svr,
                     sizeof(cls_svr)/sizeof(cls_svr[0])-1);
}

};     // namespace Outlook_xp_srvr
