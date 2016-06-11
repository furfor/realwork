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
// File generated on 30/04/2012 12:01:44 from Type Library described below.

// ************************************************************************  //
// Type Lib: 2000\EXCEL9.olb (1)
// LIBID: {00020813-0000-0000-C000-000000000046}
// LCID: 0
// Helpfile: c:\OLB\2000\VBAXL9.CHM 
// HelpString: Microsoft Excel 9.0 Object Library
// DepndLst: 
//   (1) v2.1 Office, (c:\tests\tlibimp\mso9.dll)
//   (2) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
//   (3) v5.3 VBIDE, (c:\tests\OLB\2000\vbe6ext.olb)
// SYS_KIND: SYS_WIN32
// Errors:
//   Hint: Symbol 'IFont' renamed to 'ExcelIFont'
//   Hint: Symbol 'Window' renamed to 'WINDOW'
//   Hint: Symbol 'Range' renamed to 'ExcelRange'
//   Hint: Symbol 'QueryTable' renamed to 'ExcelQueryTable'
//   Hint: Symbol 'Application' renamed to 'ExcelApplication'
//   Hint: Symbol 'Chart' renamed to 'ExcelChart'
//   Hint: Symbol 'Worksheet' renamed to 'ExcelWorksheet'
//   Hint: Symbol 'Global' renamed to 'ExcelGlobal'
//   Hint: Symbol 'Workbook' renamed to 'ExcelWorkbook'
//   Hint: Symbol 'OLEObject' renamed to 'ExcelOLEObject'
//   Hint: Symbol 'RGB' renamed to 'rgb'
//   Hint: Symbol 'Windows' renamed to 'Windoz'
//   Hint: Symbol 'DialogBox' renamed to 'DialogBOX'
//   Hint: Symbol 'Update' renamed to '_Update'
//   Hint: Member 'Name' of 'Name' changed to 'Name_'
//   Error creating palette bitmap of (TExcelQueryTable) : No Server registered for this CoClass
//   Error creating palette bitmap of (TExcelApplication) : No Server registered for this CoClass
//   Error creating palette bitmap of (TExcelChart) : No Server registered for this CoClass
//   Error creating palette bitmap of (TExcelWorksheet) : No Server registered for this CoClass
//   Error creating palette bitmap of (TExcelWorkbook) : No Server registered for this CoClass
//   Error creating palette bitmap of (TExcelOLEObject) : No Server registered for this CoClass
// Cmdline:
//   tlibimp  -C+ -Fe_2K -CE_2K_SRVR -Ha- -Hr+ -HpsOffice2K -Yp+ -D.\cpp2k -Cv-    2000\EXCEL9.olb
// ************************************************************************ //

#include <vcl.h>
#pragma hdrstop

#include <oleserver.hpp>
#if defined(USING_ATL)
#include <atl\atlvcl.h>
#endif

#pragma option -w-8122
#include "Excel_2K_SRVR.h"

#if !defined(__PRAGMA_PACKAGE_SMART_INIT)
#define      __PRAGMA_PACKAGE_SMART_INIT
#pragma package(smart_init)
#endif

namespace Excel_2k
{

_QueryTablePtr& TExcelQueryTable::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TExcelQueryTable::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TExcelQueryTable::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TExcelQueryTable::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TExcelQueryTable::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TExcelQueryTable::ConnectTo(_QueryTablePtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TExcelQueryTable::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_ExcelQueryTable;
  sd.IntfIID = __uuidof(_QueryTable);
  sd.EventIID= __uuidof(RefreshEvents);
  ServerData = &sd;
}

void __fastcall TExcelQueryTable::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1596: {
      if (OnBeforeRefresh) {
        (OnBeforeRefresh)(this, params[0].pboolVal);
      }
      break;
      }
    case 1597: {
      if (OnAfterRefresh) {
        (OnAfterRefresh)(this, params[0]);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TExcelQueryTable::CancelRefresh(void)
{
  GetDefaultInterface()->CancelRefresh();
}

void __fastcall TExcelQueryTable::Delete(void)
{
  GetDefaultInterface()->Delete();
}

VARIANT_BOOL __fastcall TExcelQueryTable::Refresh(VARIANT BackgroundQuery/*[in,opt]*/)
{
  return  GetDefaultInterface()->Refresh(BackgroundQuery/*[in,opt]*/);
}

void __fastcall TExcelQueryTable::ResetTimer(void)
{
  GetDefaultInterface()->ResetTimer();
}

Excel_2k::ExcelApplicationPtr __fastcall TExcelQueryTable::get_Application(void)
{
  return  GetDefaultInterface()->get_Application();
}

Excel_2k::XlCreator __fastcall TExcelQueryTable::get_Creator(void)
{
  return  GetDefaultInterface()->get_Creator();
}

LPDISPATCH __fastcall TExcelQueryTable::get_Parent(void)
{
  return  GetDefaultInterface()->get_Parent();
}

BSTR __fastcall TExcelQueryTable::get_Name(void)
{
  return  GetDefaultInterface()->get_Name();
}

void __fastcall TExcelQueryTable::set_Name(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_Name(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_FieldNames(void)
{
  return  GetDefaultInterface()->get_FieldNames();
}

void __fastcall TExcelQueryTable::set_FieldNames(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_FieldNames(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_RowNumbers(void)
{
  return  GetDefaultInterface()->get_RowNumbers();
}

void __fastcall TExcelQueryTable::set_RowNumbers(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_RowNumbers(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_FillAdjacentFormulas(void)
{
  return  GetDefaultInterface()->get_FillAdjacentFormulas();
}

void __fastcall TExcelQueryTable::set_FillAdjacentFormulas(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_FillAdjacentFormulas(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_HasAutoFormat(void)
{
  return  GetDefaultInterface()->get_HasAutoFormat();
}

void __fastcall TExcelQueryTable::set_HasAutoFormat(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_HasAutoFormat(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_RefreshOnFileOpen(void)
{
  return  GetDefaultInterface()->get_RefreshOnFileOpen();
}

void __fastcall TExcelQueryTable::set_RefreshOnFileOpen(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_RefreshOnFileOpen(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_Refreshing(void)
{
  return  GetDefaultInterface()->get_Refreshing();
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_FetchedRowOverflow(void)
{
  return  GetDefaultInterface()->get_FetchedRowOverflow();
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_BackgroundQuery(void)
{
  return  GetDefaultInterface()->get_BackgroundQuery();
}

void __fastcall TExcelQueryTable::set_BackgroundQuery(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_BackgroundQuery(Param1/*[in]*/);
}

Excel_2k::XlCellInsertionMode __fastcall TExcelQueryTable::get_RefreshStyle(void)
{
  return  GetDefaultInterface()->get_RefreshStyle();
}

void __fastcall TExcelQueryTable::set_RefreshStyle(Excel_2k::XlCellInsertionMode Param1/*[in]*/)
{
  GetDefaultInterface()->set_RefreshStyle(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_EnableRefresh(void)
{
  return  GetDefaultInterface()->get_EnableRefresh();
}

void __fastcall TExcelQueryTable::set_EnableRefresh(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_EnableRefresh(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_SavePassword(void)
{
  return  GetDefaultInterface()->get_SavePassword();
}

void __fastcall TExcelQueryTable::set_SavePassword(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_SavePassword(Param1/*[in]*/);
}

Excel_2k::ExcelRangePtr __fastcall TExcelQueryTable::get_Destination(void)
{
  return  GetDefaultInterface()->get_Destination();
}

VARIANT __fastcall TExcelQueryTable::get_Connection(void)
{
  return  GetDefaultInterface()->get_Connection();
}

void __fastcall TExcelQueryTable::set_Connection(VARIANT Param1/*[in]*/)
{
  GetDefaultInterface()->set_Connection(Param1/*[in]*/);
}

VARIANT __fastcall TExcelQueryTable::get_Sql(void)
{
  return  GetDefaultInterface()->get_Sql();
}

void __fastcall TExcelQueryTable::set_Sql(VARIANT Param1/*[in]*/)
{
  GetDefaultInterface()->set_Sql(Param1/*[in]*/);
}

BSTR __fastcall TExcelQueryTable::get_PostText(void)
{
  return  GetDefaultInterface()->get_PostText();
}

void __fastcall TExcelQueryTable::set_PostText(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_PostText(Param1/*[in]*/);
}

Excel_2k::ExcelRangePtr __fastcall TExcelQueryTable::get_ResultRange(void)
{
  return  GetDefaultInterface()->get_ResultRange();
}

Excel_2k::ParametersPtr __fastcall TExcelQueryTable::get_Parameters(void)
{
  return  GetDefaultInterface()->get_Parameters();
}

LPDISPATCH __fastcall TExcelQueryTable::get_Recordset(void)
{
  return  GetDefaultInterface()->get_Recordset();
}

void __fastcall TExcelQueryTable::_set_Recordset(LPDISPATCH Param1/*[in]*/)
{
  GetDefaultInterface()->_set_Recordset(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_SaveData(void)
{
  return  GetDefaultInterface()->get_SaveData();
}

void __fastcall TExcelQueryTable::set_SaveData(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_SaveData(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_TablesOnlyFromHTML(void)
{
  return  GetDefaultInterface()->get_TablesOnlyFromHTML();
}

void __fastcall TExcelQueryTable::set_TablesOnlyFromHTML(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_TablesOnlyFromHTML(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_EnableEditing(void)
{
  return  GetDefaultInterface()->get_EnableEditing();
}

void __fastcall TExcelQueryTable::set_EnableEditing(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_EnableEditing(Param1/*[in]*/);
}

Excel_2k::XlPlatform __fastcall TExcelQueryTable::get_TextFilePlatform(void)
{
  return  GetDefaultInterface()->get_TextFilePlatform();
}

void __fastcall TExcelQueryTable::set_TextFilePlatform(Excel_2k::XlPlatform Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFilePlatform(Param1/*[in]*/);
}

long __fastcall TExcelQueryTable::get_TextFileStartRow(void)
{
  return  GetDefaultInterface()->get_TextFileStartRow();
}

void __fastcall TExcelQueryTable::set_TextFileStartRow(long Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileStartRow(Param1/*[in]*/);
}

Excel_2k::XlTextParsingType __fastcall TExcelQueryTable::get_TextFileParseType(void)
{
  return  GetDefaultInterface()->get_TextFileParseType();
}

void __fastcall TExcelQueryTable::set_TextFileParseType(Excel_2k::XlTextParsingType Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileParseType(Param1/*[in]*/);
}

Excel_2k::XlTextQualifier __fastcall TExcelQueryTable::get_TextFileTextQualifier(void)
{
  return  GetDefaultInterface()->get_TextFileTextQualifier();
}

void __fastcall TExcelQueryTable::set_TextFileTextQualifier(Excel_2k::XlTextQualifier Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileTextQualifier(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_TextFileConsecutiveDelimiter(void)
{
  return  GetDefaultInterface()->get_TextFileConsecutiveDelimiter();
}

void __fastcall TExcelQueryTable::set_TextFileConsecutiveDelimiter(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileConsecutiveDelimiter(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_TextFileTabDelimiter(void)
{
  return  GetDefaultInterface()->get_TextFileTabDelimiter();
}

void __fastcall TExcelQueryTable::set_TextFileTabDelimiter(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileTabDelimiter(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_TextFileSemicolonDelimiter(void)
{
  return  GetDefaultInterface()->get_TextFileSemicolonDelimiter();
}

void __fastcall TExcelQueryTable::set_TextFileSemicolonDelimiter(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileSemicolonDelimiter(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_TextFileCommaDelimiter(void)
{
  return  GetDefaultInterface()->get_TextFileCommaDelimiter();
}

void __fastcall TExcelQueryTable::set_TextFileCommaDelimiter(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileCommaDelimiter(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_TextFileSpaceDelimiter(void)
{
  return  GetDefaultInterface()->get_TextFileSpaceDelimiter();
}

void __fastcall TExcelQueryTable::set_TextFileSpaceDelimiter(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileSpaceDelimiter(Param1/*[in]*/);
}

BSTR __fastcall TExcelQueryTable::get_TextFileOtherDelimiter(void)
{
  return  GetDefaultInterface()->get_TextFileOtherDelimiter();
}

void __fastcall TExcelQueryTable::set_TextFileOtherDelimiter(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileOtherDelimiter(Param1/*[in]*/);
}

VARIANT __fastcall TExcelQueryTable::get_TextFileColumnDataTypes(void)
{
  return  GetDefaultInterface()->get_TextFileColumnDataTypes();
}

void __fastcall TExcelQueryTable::set_TextFileColumnDataTypes(VARIANT Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileColumnDataTypes(Param1/*[in]*/);
}

VARIANT __fastcall TExcelQueryTable::get_TextFileFixedColumnWidths(void)
{
  return  GetDefaultInterface()->get_TextFileFixedColumnWidths();
}

void __fastcall TExcelQueryTable::set_TextFileFixedColumnWidths(VARIANT Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileFixedColumnWidths(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_PreserveColumnInfo(void)
{
  return  GetDefaultInterface()->get_PreserveColumnInfo();
}

void __fastcall TExcelQueryTable::set_PreserveColumnInfo(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_PreserveColumnInfo(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_PreserveFormatting(void)
{
  return  GetDefaultInterface()->get_PreserveFormatting();
}

void __fastcall TExcelQueryTable::set_PreserveFormatting(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_PreserveFormatting(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_AdjustColumnWidth(void)
{
  return  GetDefaultInterface()->get_AdjustColumnWidth();
}

void __fastcall TExcelQueryTable::set_AdjustColumnWidth(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_AdjustColumnWidth(Param1/*[in]*/);
}

VARIANT __fastcall TExcelQueryTable::get_CommandText(void)
{
  return  GetDefaultInterface()->get_CommandText();
}

void __fastcall TExcelQueryTable::set_CommandText(VARIANT Param1/*[in]*/)
{
  GetDefaultInterface()->set_CommandText(Param1/*[in]*/);
}

Excel_2k::XlCmdType __fastcall TExcelQueryTable::get_CommandType(void)
{
  return  GetDefaultInterface()->get_CommandType();
}

void __fastcall TExcelQueryTable::set_CommandType(Excel_2k::XlCmdType Param1/*[in]*/)
{
  GetDefaultInterface()->set_CommandType(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_TextFilePromptOnRefresh(void)
{
  return  GetDefaultInterface()->get_TextFilePromptOnRefresh();
}

void __fastcall TExcelQueryTable::set_TextFilePromptOnRefresh(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFilePromptOnRefresh(Param1/*[in]*/);
}

Excel_2k::xlQueryType __fastcall TExcelQueryTable::get_QueryType(void)
{
  return  GetDefaultInterface()->get_QueryType();
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_MaintainConnection(void)
{
  return  GetDefaultInterface()->get_MaintainConnection();
}

void __fastcall TExcelQueryTable::set_MaintainConnection(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_MaintainConnection(Param1/*[in]*/);
}

BSTR __fastcall TExcelQueryTable::get_TextFileDecimalSeparator(void)
{
  return  GetDefaultInterface()->get_TextFileDecimalSeparator();
}

void __fastcall TExcelQueryTable::set_TextFileDecimalSeparator(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileDecimalSeparator(Param1/*[in]*/);
}

BSTR __fastcall TExcelQueryTable::get_TextFileThousandsSeparator(void)
{
  return  GetDefaultInterface()->get_TextFileThousandsSeparator();
}

void __fastcall TExcelQueryTable::set_TextFileThousandsSeparator(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_TextFileThousandsSeparator(Param1/*[in]*/);
}

long __fastcall TExcelQueryTable::get_RefreshPeriod(void)
{
  return  GetDefaultInterface()->get_RefreshPeriod();
}

void __fastcall TExcelQueryTable::set_RefreshPeriod(long Param1/*[in]*/)
{
  GetDefaultInterface()->set_RefreshPeriod(Param1/*[in]*/);
}

Excel_2k::xlWebSelectionType __fastcall TExcelQueryTable::get_WebSelectionType(void)
{
  return  GetDefaultInterface()->get_WebSelectionType();
}

void __fastcall TExcelQueryTable::set_WebSelectionType(Excel_2k::xlWebSelectionType Param1/*[in]*/)
{
  GetDefaultInterface()->set_WebSelectionType(Param1/*[in]*/);
}

Excel_2k::xlWebFormatting __fastcall TExcelQueryTable::get_WebFormatting(void)
{
  return  GetDefaultInterface()->get_WebFormatting();
}

void __fastcall TExcelQueryTable::set_WebFormatting(Excel_2k::xlWebFormatting Param1/*[in]*/)
{
  GetDefaultInterface()->set_WebFormatting(Param1/*[in]*/);
}

BSTR __fastcall TExcelQueryTable::get_WebTables(void)
{
  return  GetDefaultInterface()->get_WebTables();
}

void __fastcall TExcelQueryTable::set_WebTables(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_WebTables(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_WebPreFormattedTextToColumns(void)
{
  return  GetDefaultInterface()->get_WebPreFormattedTextToColumns();
}

void __fastcall TExcelQueryTable::set_WebPreFormattedTextToColumns(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_WebPreFormattedTextToColumns(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_WebSingleBlockTextImport(void)
{
  return  GetDefaultInterface()->get_WebSingleBlockTextImport();
}

void __fastcall TExcelQueryTable::set_WebSingleBlockTextImport(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_WebSingleBlockTextImport(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_WebDisableDateRecognition(void)
{
  return  GetDefaultInterface()->get_WebDisableDateRecognition();
}

void __fastcall TExcelQueryTable::set_WebDisableDateRecognition(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_WebDisableDateRecognition(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelQueryTable::get_WebConsecutiveDelimitersAsOne(void)
{
  return  GetDefaultInterface()->get_WebConsecutiveDelimitersAsOne();
}

void __fastcall TExcelQueryTable::set_WebConsecutiveDelimitersAsOne(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_WebConsecutiveDelimitersAsOne(Param1/*[in]*/);
}

_ApplicationPtr& TExcelApplication::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TExcelApplication::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TExcelApplication::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TExcelApplication::Disconnect()
{
  if (m_DefaultIntf) {
    if (FAutoQuit)
      Quit();
    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TExcelApplication::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TExcelApplication::ConnectTo(_ApplicationPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TExcelApplication::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_ExcelApplication;
  sd.IntfIID = __uuidof(_Application);
  sd.EventIID= __uuidof(AppEvents);
  ServerData = &sd;
}

void __fastcall TExcelApplication::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1565: {
      if (OnNewWorkbook) {
        (OnNewWorkbook)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1558: {
      if (OnSheetSelectionChange) {
        (OnSheetSelectionChange)(this, params[0].pdispVal, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 1559: {
      if (OnSheetBeforeDoubleClick) {
        (OnSheetBeforeDoubleClick)(this, params[0].pdispVal, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[1].pdispVal), params[2].pboolVal);
      }
      break;
      }
    case 1560: {
      if (OnSheetBeforeRightClick) {
        (OnSheetBeforeRightClick)(this, params[0].pdispVal, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[1].pdispVal), params[2].pboolVal);
      }
      break;
      }
    case 1561: {
      if (OnSheetActivate1) {
        (OnSheetActivate1)(this, params[0].pdispVal);
      }
      break;
      }
    case 1562: {
      if (OnSheetDeactivate1) {
        (OnSheetDeactivate1)(this, params[0].pdispVal);
      }
      break;
      }
    case 1563: {
      if (OnSheetCalculate) {
        (OnSheetCalculate)(this, params[0].pdispVal);
      }
      break;
      }
    case 1564: {
      if (OnSheetChange) {
        (OnSheetChange)(this, params[0].pdispVal, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 1567: {
      if (OnWorkbookOpen) {
        (OnWorkbookOpen)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1568: {
      if (OnWorkbookActivate) {
        (OnWorkbookActivate)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1569: {
      if (OnWorkbookDeactivate) {
        (OnWorkbookDeactivate)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1570: {
      if (OnWorkbookBeforeClose) {
        (OnWorkbookBeforeClose)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 1571: {
      if (OnWorkbookBeforeSave) {
        (OnWorkbookBeforeSave)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal), params[1], params[2].pboolVal);
      }
      break;
      }
    case 1572: {
      if (OnWorkbookBeforePrint) {
        (OnWorkbookBeforePrint)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 1573: {
      if (OnWorkbookNewSheet) {
        (OnWorkbookNewSheet)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal), params[1].pdispVal);
      }
      break;
      }
    case 1574: {
      if (OnWorkbookAddinInstall) {
        (OnWorkbookAddinInstall)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1575: {
      if (OnWorkbookAddinUninstall) {
        (OnWorkbookAddinUninstall)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1554: {
      if (OnWindowResize) {
        (OnWindowResize)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal), (Excel_2k::WINDOWPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 1556: {
      if (OnWindowActivate) {
        (OnWindowActivate)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal), (Excel_2k::WINDOWPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 1557: {
      if (OnWindowDeactivate) {
        (OnWindowDeactivate)(this, (Excel_2k::ExcelWorkbookPtr)(LPDISPATCH)(params[0].pdispVal), (Excel_2k::WINDOWPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 1854: {
      if (OnSheetFollowHyperlink) {
        (OnSheetFollowHyperlink)(this, params[0].pdispVal, (Excel_2k::HyperlinkPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TExcelApplication::Calculate(long lcid/*[in]*/)
{
  GetDefaultInterface()->Calculate(lcid/*[in]*/);
}

void __fastcall TExcelApplication::DDEExecute(long Channel/*[in]*/, BSTR String/*[in]*/, 
                                              long lcid/*[in]*/)
{
  GetDefaultInterface()->DDEExecute(Channel/*[in]*/, String/*[in]*/, lcid/*[in]*/);
}

long __fastcall TExcelApplication::DDEInitiate(BSTR App/*[in]*/, BSTR Topic/*[in]*/, 
                                               long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->DDEInitiate(App, Topic, lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::DDEPoke(long Channel/*[in]*/, VARIANT Item/*[in]*/, 
                                           VARIANT Data/*[in]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->DDEPoke(Channel/*[in]*/, Item/*[in]*/, Data/*[in]*/, lcid/*[in]*/);
}

VARIANT __fastcall TExcelApplication::DDERequest(long Channel/*[in]*/, BSTR Item/*[in]*/, 
                                                 long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->DDERequest(Channel, Item, lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::DDETerminate(long Channel/*[in]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->DDETerminate(Channel/*[in]*/, lcid/*[in]*/);
}

VARIANT __fastcall TExcelApplication::Evaluate(VARIANT Name/*[in]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->Evaluate(Name, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::_Evaluate(VARIANT Name/*[in]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->_Evaluate(Name, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::ExecuteExcel4Macro(BSTR String/*[in]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->ExecuteExcel4Macro(String, lcid, (VARIANT*)&RHS));
  return RHS;
}

Excel_2k::ExcelRange* __fastcall TExcelApplication::Intersect(Excel_2k::ExcelRange* Arg1/*[in]*/, 
                                                              Excel_2k::ExcelRange* Arg2/*[in]*/, 
                                                              VARIANT Arg3/*[in,opt]*/, 
                                                              VARIANT Arg4/*[in,opt]*/, 
                                                              VARIANT Arg5/*[in,opt]*/, 
                                                              VARIANT Arg6/*[in,opt]*/, 
                                                              VARIANT Arg7/*[in,opt]*/, 
                                                              VARIANT Arg8/*[in,opt]*/, 
                                                              VARIANT Arg9/*[in,opt]*/, 
                                                              VARIANT Arg10/*[in,opt]*/, 
                                                              VARIANT Arg11/*[in,opt]*/, 
                                                              VARIANT Arg12/*[in,opt]*/, 
                                                              VARIANT Arg13/*[in,opt]*/, 
                                                              VARIANT Arg14/*[in,opt]*/, 
                                                              VARIANT Arg15/*[in,opt]*/, 
                                                              VARIANT Arg16/*[in,opt]*/, 
                                                              VARIANT Arg17/*[in,opt]*/, 
                                                              VARIANT Arg18/*[in,opt]*/, 
                                                              VARIANT Arg19/*[in,opt]*/, 
                                                              VARIANT Arg20/*[in,opt]*/, 
                                                              VARIANT Arg21/*[in,opt]*/, 
                                                              VARIANT Arg22/*[in,opt]*/, 
                                                              VARIANT Arg23/*[in,opt]*/, 
                                                              VARIANT Arg24/*[in,opt]*/, 
                                                              VARIANT Arg25/*[in,opt]*/, 
                                                              VARIANT Arg26/*[in,opt]*/, 
                                                              VARIANT Arg27/*[in,opt]*/, 
                                                              VARIANT Arg28/*[in,opt]*/, 
                                                              VARIANT Arg29/*[in,opt]*/, 
                                                              VARIANT Arg30/*[in,opt]*/, 
                                                              long lcid/*[in]*/)
{
  Excel_2k::ExcelRange* RHS = 0;
  OLECHECK(GetDefaultInterface()->Intersect(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9, 
                                            Arg10, Arg11, Arg12, Arg13, Arg14, Arg15, Arg16, Arg17, 
                                            Arg18, Arg19, Arg20, Arg21, Arg22, Arg23, Arg24, Arg25, 
                                            Arg26, Arg27, Arg28, Arg29, Arg30, lcid, (Excel_2k::ExcelRange**)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::Run(VARIANT Macro/*[in,opt]*/, VARIANT Arg1/*[in,opt]*/, 
                                          VARIANT Arg2/*[in,opt]*/, VARIANT Arg3/*[in,opt]*/, 
                                          VARIANT Arg4/*[in,opt]*/, VARIANT Arg5/*[in,opt]*/, 
                                          VARIANT Arg6/*[in,opt]*/, VARIANT Arg7/*[in,opt]*/, 
                                          VARIANT Arg8/*[in,opt]*/, VARIANT Arg9/*[in,opt]*/, 
                                          VARIANT Arg10/*[in,opt]*/, VARIANT Arg11/*[in,opt]*/, 
                                          VARIANT Arg12/*[in,opt]*/, VARIANT Arg13/*[in,opt]*/, 
                                          VARIANT Arg14/*[in,opt]*/, VARIANT Arg15/*[in,opt]*/, 
                                          VARIANT Arg16/*[in,opt]*/, VARIANT Arg17/*[in,opt]*/, 
                                          VARIANT Arg18/*[in,opt]*/, VARIANT Arg19/*[in,opt]*/, 
                                          VARIANT Arg20/*[in,opt]*/, VARIANT Arg21/*[in,opt]*/, 
                                          VARIANT Arg22/*[in,opt]*/, VARIANT Arg23/*[in,opt]*/, 
                                          VARIANT Arg24/*[in,opt]*/, VARIANT Arg25/*[in,opt]*/, 
                                          VARIANT Arg26/*[in,opt]*/, VARIANT Arg27/*[in,opt]*/, 
                                          VARIANT Arg28/*[in,opt]*/, VARIANT Arg29/*[in,opt]*/, 
                                          VARIANT Arg30/*[in,opt]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->Run(Macro, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9, 
                                      Arg10, Arg11, Arg12, Arg13, Arg14, Arg15, Arg16, Arg17, Arg18, 
                                      Arg19, Arg20, Arg21, Arg22, Arg23, Arg24, Arg25, Arg26, Arg27, 
                                      Arg28, Arg29, Arg30, (VARIANT*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::_Run2(VARIANT Macro/*[in,opt]*/, VARIANT Arg1/*[in,opt]*/, 
                                            VARIANT Arg2/*[in,opt]*/, VARIANT Arg3/*[in,opt]*/, 
                                            VARIANT Arg4/*[in,opt]*/, VARIANT Arg5/*[in,opt]*/, 
                                            VARIANT Arg6/*[in,opt]*/, VARIANT Arg7/*[in,opt]*/, 
                                            VARIANT Arg8/*[in,opt]*/, VARIANT Arg9/*[in,opt]*/, 
                                            VARIANT Arg10/*[in,opt]*/, VARIANT Arg11/*[in,opt]*/, 
                                            VARIANT Arg12/*[in,opt]*/, VARIANT Arg13/*[in,opt]*/, 
                                            VARIANT Arg14/*[in,opt]*/, VARIANT Arg15/*[in,opt]*/, 
                                            VARIANT Arg16/*[in,opt]*/, VARIANT Arg17/*[in,opt]*/, 
                                            VARIANT Arg18/*[in,opt]*/, VARIANT Arg19/*[in,opt]*/, 
                                            VARIANT Arg20/*[in,opt]*/, VARIANT Arg21/*[in,opt]*/, 
                                            VARIANT Arg22/*[in,opt]*/, VARIANT Arg23/*[in,opt]*/, 
                                            VARIANT Arg24/*[in,opt]*/, VARIANT Arg25/*[in,opt]*/, 
                                            VARIANT Arg26/*[in,opt]*/, VARIANT Arg27/*[in,opt]*/, 
                                            VARIANT Arg28/*[in,opt]*/, VARIANT Arg29/*[in,opt]*/, 
                                            VARIANT Arg30/*[in,opt]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->_Run2(Macro, Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9, 
                                        Arg10, Arg11, Arg12, Arg13, Arg14, Arg15, Arg16, Arg17, 
                                        Arg18, Arg19, Arg20, Arg21, Arg22, Arg23, Arg24, Arg25, 
                                        Arg26, Arg27, Arg28, Arg29, Arg30, lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::SendKeys(VARIANT Keys/*[in]*/, VARIANT Wait/*[in,opt]*/, 
                                            long lcid/*[in]*/)
{
  GetDefaultInterface()->SendKeys(Keys/*[in]*/, Wait/*[in,opt]*/, lcid/*[in]*/);
}

Excel_2k::ExcelRange* __fastcall TExcelApplication::Union(Excel_2k::ExcelRange* Arg1/*[in]*/, 
                                                          Excel_2k::ExcelRange* Arg2/*[in]*/, 
                                                          VARIANT Arg3/*[in,opt]*/, 
                                                          VARIANT Arg4/*[in,opt]*/, 
                                                          VARIANT Arg5/*[in,opt]*/, 
                                                          VARIANT Arg6/*[in,opt]*/, 
                                                          VARIANT Arg7/*[in,opt]*/, 
                                                          VARIANT Arg8/*[in,opt]*/, 
                                                          VARIANT Arg9/*[in,opt]*/, 
                                                          VARIANT Arg10/*[in,opt]*/, 
                                                          VARIANT Arg11/*[in,opt]*/, 
                                                          VARIANT Arg12/*[in,opt]*/, 
                                                          VARIANT Arg13/*[in,opt]*/, 
                                                          VARIANT Arg14/*[in,opt]*/, 
                                                          VARIANT Arg15/*[in,opt]*/, 
                                                          VARIANT Arg16/*[in,opt]*/, 
                                                          VARIANT Arg17/*[in,opt]*/, 
                                                          VARIANT Arg18/*[in,opt]*/, 
                                                          VARIANT Arg19/*[in,opt]*/, 
                                                          VARIANT Arg20/*[in,opt]*/, 
                                                          VARIANT Arg21/*[in,opt]*/, 
                                                          VARIANT Arg22/*[in,opt]*/, 
                                                          VARIANT Arg23/*[in,opt]*/, 
                                                          VARIANT Arg24/*[in,opt]*/, 
                                                          VARIANT Arg25/*[in,opt]*/, 
                                                          VARIANT Arg26/*[in,opt]*/, 
                                                          VARIANT Arg27/*[in,opt]*/, 
                                                          VARIANT Arg28/*[in,opt]*/, 
                                                          VARIANT Arg29/*[in,opt]*/, 
                                                          VARIANT Arg30/*[in,opt]*/, 
                                                          long lcid/*[in]*/)
{
  Excel_2k::ExcelRange* RHS = 0;
  OLECHECK(GetDefaultInterface()->Union(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9, Arg10, 
                                        Arg11, Arg12, Arg13, Arg14, Arg15, Arg16, Arg17, Arg18, 
                                        Arg19, Arg20, Arg21, Arg22, Arg23, Arg24, Arg25, Arg26, 
                                        Arg27, Arg28, Arg29, Arg30, lcid, (Excel_2k::ExcelRange**)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::ActivateMicrosoftApp(Excel_2k::XlMSApplication Index/*[in]*/, 
                                                        long lcid/*[in]*/)
{
  GetDefaultInterface()->ActivateMicrosoftApp(Index/*[in]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::AddChartAutoFormat(VARIANT Chart/*[in]*/, BSTR Name/*[in]*/, 
                                                      VARIANT Description/*[in,opt]*/, 
                                                      long lcid/*[in]*/)
{
  GetDefaultInterface()->AddChartAutoFormat(Chart/*[in]*/, Name/*[in]*/, Description/*[in,opt]*/, 
                                            lcid/*[in]*/);
}

void __fastcall TExcelApplication::AddCustomList(VARIANT ListArray/*[in]*/, 
                                                 VARIANT ByRow/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->AddCustomList(ListArray/*[in]*/, ByRow/*[in,opt]*/, lcid/*[in]*/);
}

double __fastcall TExcelApplication::CentimetersToPoints(double Centimeters/*[in]*/, 
                                                         long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->CentimetersToPoints(Centimeters, lcid, (double*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::CheckSpelling(BSTR Word/*[in]*/, 
                                                         VARIANT CustomDictionary/*[in,opt]*/, 
                                                         VARIANT IgnoreUppercase/*[in,opt]*/, 
                                                         long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->CheckSpelling(Word, CustomDictionary, IgnoreUppercase, lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::ConvertFormula(VARIANT Formula/*[in]*/, 
                                                     Excel_2k::XlReferenceStyle FromReferenceStyle/*[in]*/, 
                                                     VARIANT ToReferenceStyle/*[in,opt]*/, 
                                                     VARIANT ToAbsolute/*[in,opt]*/, 
                                                     VARIANT RelativeTo/*[in,opt]*/, 
                                                     long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->ConvertFormula(Formula, FromReferenceStyle, ToReferenceStyle, 
                                                 ToAbsolute, RelativeTo, lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::Dummy1(void)
{
  GetDefaultInterface()->Dummy1();
}

void __fastcall TExcelApplication::Dummy2(void)
{
  GetDefaultInterface()->Dummy2();
}

void __fastcall TExcelApplication::Dummy3(void)
{
  GetDefaultInterface()->Dummy3();
}

void __fastcall TExcelApplication::Dummy4(void)
{
  GetDefaultInterface()->Dummy4();
}

void __fastcall TExcelApplication::Dummy5(void)
{
  GetDefaultInterface()->Dummy5();
}

void __fastcall TExcelApplication::Dummy6(void)
{
  GetDefaultInterface()->Dummy6();
}

void __fastcall TExcelApplication::Dummy7(void)
{
  GetDefaultInterface()->Dummy7();
}

void __fastcall TExcelApplication::Dummy8(void)
{
  GetDefaultInterface()->Dummy8();
}

void __fastcall TExcelApplication::Dummy9(void)
{
  GetDefaultInterface()->Dummy9();
}

void __fastcall TExcelApplication::Dummy10(void)
{
  GetDefaultInterface()->Dummy10();
}

void __fastcall TExcelApplication::Dummy11(void)
{
  GetDefaultInterface()->Dummy11();
}

void __fastcall TExcelApplication::DeleteChartAutoFormat(BSTR Name/*[in]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->DeleteChartAutoFormat(Name/*[in]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::DeleteCustomList(long ListNum/*[in]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->DeleteCustomList(ListNum/*[in]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::DoubleClick(long lcid/*[in]*/)
{
  GetDefaultInterface()->DoubleClick(lcid/*[in]*/);
}

void __fastcall TExcelApplication::_FindFile(long lcid/*[in]*/)
{
  GetDefaultInterface()->_FindFile(lcid/*[in]*/);
}

VARIANT __fastcall TExcelApplication::GetCustomListContents(long ListNum/*[in]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->GetCustomListContents(ListNum, lcid, (VARIANT*)&RHS));
  return RHS;
}

long __fastcall TExcelApplication::GetCustomListNum(VARIANT ListArray/*[in]*/, long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->GetCustomListNum(ListArray, lcid, (long*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::GetOpenFilename(VARIANT FileFilter/*[in,opt]*/, 
                                                      VARIANT FilterIndex/*[in,opt]*/, 
                                                      VARIANT Title/*[in,opt]*/, 
                                                      VARIANT ButtonText/*[in,opt]*/, 
                                                      VARIANT MultiSelect/*[in,opt]*/, 
                                                      long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->GetOpenFilename(FileFilter, FilterIndex, Title, ButtonText, 
                                                  MultiSelect, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::GetSaveAsFilename(VARIANT InitialFilename/*[in,opt]*/, 
                                                        VARIANT FileFilter/*[in,opt]*/, 
                                                        VARIANT FilterIndex/*[in,opt]*/, 
                                                        VARIANT Title/*[in,opt]*/, 
                                                        VARIANT ButtonText/*[in,opt]*/, 
                                                        long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->GetSaveAsFilename(InitialFilename, FileFilter, FilterIndex, Title, 
                                                    ButtonText, lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::Goto(VARIANT Reference/*[in,opt]*/, VARIANT Scroll/*[in,opt]*/, 
                                        long lcid/*[in]*/)
{
  GetDefaultInterface()->Goto(Reference/*[in,opt]*/, Scroll/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::Help(VARIANT HelpFile/*[in,opt]*/, 
                                        VARIANT HelpContextID/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Help(HelpFile/*[in,opt]*/, HelpContextID/*[in,opt]*/, lcid/*[in]*/);
}

double __fastcall TExcelApplication::InchesToPoints(double Inches/*[in]*/, long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->InchesToPoints(Inches, lcid, (double*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::InputBox(BSTR Prompt/*[in]*/, VARIANT Title/*[in,opt]*/, 
                                               VARIANT Default/*[in,opt]*/, VARIANT Left/*[in,opt]*/, 
                                               VARIANT Top/*[in,opt]*/, VARIANT HelpFile/*[in,opt]*/, 
                                               VARIANT HelpContextID/*[in,opt]*/, 
                                               VARIANT Type/*[in,opt]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->InputBox(Prompt, Title, Default, Left, Top, HelpFile, 
                                           HelpContextID, Type, lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::MacroOptions(VARIANT Macro/*[in,opt]*/, 
                                                VARIANT Description/*[in,opt]*/, 
                                                VARIANT HasMenu/*[in,opt]*/, 
                                                VARIANT MenuText/*[in,opt]*/, 
                                                VARIANT HasShortcutKey/*[in,opt]*/, 
                                                VARIANT ShortcutKey/*[in,opt]*/, 
                                                VARIANT Category/*[in,opt]*/, 
                                                VARIANT StatusBar/*[in,opt]*/, 
                                                VARIANT HelpContextID/*[in,opt]*/, 
                                                VARIANT HelpFile/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->MacroOptions(Macro/*[in,opt]*/, Description/*[in,opt]*/, 
                                      HasMenu/*[in,opt]*/, MenuText/*[in,opt]*/, 
                                      HasShortcutKey/*[in,opt]*/, ShortcutKey/*[in,opt]*/, 
                                      Category/*[in,opt]*/, StatusBar/*[in,opt]*/, 
                                      HelpContextID/*[in,opt]*/, HelpFile/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::MailLogoff(long lcid/*[in]*/)
{
  GetDefaultInterface()->MailLogoff(lcid/*[in]*/);
}

void __fastcall TExcelApplication::MailLogon(VARIANT Name/*[in,opt]*/, VARIANT Password/*[in,opt]*/, 
                                             VARIANT DownloadNewMail/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->MailLogon(Name/*[in,opt]*/, Password/*[in,opt]*/, 
                                   DownloadNewMail/*[in,opt]*/, lcid/*[in]*/);
}

Excel_2k::ExcelWorkbook* __fastcall TExcelApplication::NextLetter(long lcid/*[in]*/)
{
  Excel_2k::ExcelWorkbook* RHS = 0;
  OLECHECK(GetDefaultInterface()->NextLetter(lcid, (Excel_2k::ExcelWorkbook**)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::OnKey(BSTR Key/*[in]*/, VARIANT Procedure/*[in,opt]*/, 
                                         long lcid/*[in]*/)
{
  GetDefaultInterface()->OnKey(Key/*[in]*/, Procedure/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::OnRepeat(BSTR Text/*[in]*/, BSTR Procedure/*[in]*/, 
                                            long lcid/*[in]*/)
{
  GetDefaultInterface()->OnRepeat(Text/*[in]*/, Procedure/*[in]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::OnTime(VARIANT EarliestTime/*[in]*/, BSTR Procedure/*[in]*/, 
                                          VARIANT LatestTime/*[in,opt]*/, 
                                          VARIANT Schedule/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->OnTime(EarliestTime/*[in]*/, Procedure/*[in]*/, LatestTime/*[in,opt]*/, 
                                Schedule/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::OnUndo(BSTR Text/*[in]*/, BSTR Procedure/*[in]*/, 
                                          long lcid/*[in]*/)
{
  GetDefaultInterface()->OnUndo(Text/*[in]*/, Procedure/*[in]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::Quit(void)
{
  GetDefaultInterface()->Quit();
}

void __fastcall TExcelApplication::RecordMacro(VARIANT BasicCode/*[in,opt]*/, 
                                               VARIANT XlmCode/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->RecordMacro(BasicCode/*[in,opt]*/, XlmCode/*[in,opt]*/, lcid/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::RegisterXLL(BSTR Filename/*[in]*/, long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->RegisterXLL(Filename, lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::Repeat(long lcid/*[in]*/)
{
  GetDefaultInterface()->Repeat(lcid/*[in]*/);
}

void __fastcall TExcelApplication::ResetTipWizard(long lcid/*[in]*/)
{
  GetDefaultInterface()->ResetTipWizard(lcid/*[in]*/);
}

void __fastcall TExcelApplication::Save(VARIANT Filename/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Save(Filename/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::SaveWorkspace(VARIANT Filename/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->SaveWorkspace(Filename/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::SetDefaultChart(VARIANT FormatName/*[in,opt]*/, 
                                                   VARIANT Gallery/*[in,opt]*/)
{
  GetDefaultInterface()->SetDefaultChart(FormatName/*[in,opt]*/, Gallery/*[in,opt]*/);
}

void __fastcall TExcelApplication::Undo(long lcid/*[in]*/)
{
  GetDefaultInterface()->Undo(lcid/*[in]*/);
}

void __fastcall TExcelApplication::Volatile(VARIANT Volatile/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Volatile(Volatile/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelApplication::_Wait(VARIANT Time/*[in]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->_Wait(Time/*[in]*/, lcid/*[in]*/);
}

VARIANT __fastcall TExcelApplication::_WSFunction(VARIANT Arg1/*[in,opt]*/, VARIANT Arg2/*[in,opt]*/, 
                                                  VARIANT Arg3/*[in,opt]*/, VARIANT Arg4/*[in,opt]*/, 
                                                  VARIANT Arg5/*[in,opt]*/, VARIANT Arg6/*[in,opt]*/, 
                                                  VARIANT Arg7/*[in,opt]*/, VARIANT Arg8/*[in,opt]*/, 
                                                  VARIANT Arg9/*[in,opt]*/, 
                                                  VARIANT Arg10/*[in,opt]*/, 
                                                  VARIANT Arg11/*[in,opt]*/, 
                                                  VARIANT Arg12/*[in,opt]*/, 
                                                  VARIANT Arg13/*[in,opt]*/, 
                                                  VARIANT Arg14/*[in,opt]*/, 
                                                  VARIANT Arg15/*[in,opt]*/, 
                                                  VARIANT Arg16/*[in,opt]*/, 
                                                  VARIANT Arg17/*[in,opt]*/, 
                                                  VARIANT Arg18/*[in,opt]*/, 
                                                  VARIANT Arg19/*[in,opt]*/, 
                                                  VARIANT Arg20/*[in,opt]*/, 
                                                  VARIANT Arg21/*[in,opt]*/, 
                                                  VARIANT Arg22/*[in,opt]*/, 
                                                  VARIANT Arg23/*[in,opt]*/, 
                                                  VARIANT Arg24/*[in,opt]*/, 
                                                  VARIANT Arg25/*[in,opt]*/, 
                                                  VARIANT Arg26/*[in,opt]*/, 
                                                  VARIANT Arg27/*[in,opt]*/, 
                                                  VARIANT Arg28/*[in,opt]*/, 
                                                  VARIANT Arg29/*[in,opt]*/, 
                                                  VARIANT Arg30/*[in,opt]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->_WSFunction(Arg1, Arg2, Arg3, Arg4, Arg5, Arg6, Arg7, Arg8, Arg9, 
                                              Arg10, Arg11, Arg12, Arg13, Arg14, Arg15, Arg16, Arg17, 
                                              Arg18, Arg19, Arg20, Arg21, Arg22, Arg23, Arg24, Arg25, 
                                              Arg26, Arg27, Arg28, Arg29, Arg30, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::Wait(VARIANT Time/*[in]*/, long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->Wait(Time, lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::GetPhonetic(VARIANT Text/*[in,opt]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->GetPhonetic(Text, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::Dummy12(void)
{
  GetDefaultInterface()->Dummy12();
}

void __fastcall TExcelApplication::CalculateFull(void)
{
  GetDefaultInterface()->CalculateFull();
}

VARIANT_BOOL __fastcall TExcelApplication::FindFile(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->FindFile(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

Excel_2k::ExcelApplicationPtr __fastcall TExcelApplication::get_Application(void)
{
  Excel_2k::ExcelApplicationPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Application(&RHS));
  return RHS;
}

Excel_2k::XlCreator __fastcall TExcelApplication::get_Creator(void)
{
  Excel_2k::XlCreator RHS;
  OLECHECK(GetDefaultInterface()->get_Creator((Excel_2k::XlCreator*)&RHS));
  return RHS;
}

Excel_2k::ExcelApplicationPtr __fastcall TExcelApplication::get_Parent(void)
{
  Excel_2k::ExcelApplicationPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Parent(&RHS));
  return RHS;
}

Excel_2k::ExcelRangePtr __fastcall TExcelApplication::get_ActiveCell(void)
{
  Excel_2k::ExcelRangePtr RHS;
  OLECHECK(GetDefaultInterface()->get_ActiveCell(&RHS));
  return RHS;
}

Excel_2k::ExcelChartPtr __fastcall TExcelApplication::get_ActiveChart(void)
{
  Excel_2k::ExcelChartPtr RHS;
  OLECHECK(GetDefaultInterface()->get_ActiveChart(&RHS));
  return RHS;
}

Excel_2k::DialogSheetPtr __fastcall TExcelApplication::get_ActiveDialog(void)
{
  Excel_2k::DialogSheetPtr RHS;
  OLECHECK(GetDefaultInterface()->get_ActiveDialog(&RHS));
  return RHS;
}

Excel_2k::MenuBarPtr __fastcall TExcelApplication::get_ActiveMenuBar(void)
{
  Excel_2k::MenuBarPtr RHS;
  OLECHECK(GetDefaultInterface()->get_ActiveMenuBar(&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_ActivePrinter(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_ActivePrinter(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ActivePrinter(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_ActivePrinter(lcid/*[in]*/, RHS/*[in]*/);
}

LPDISPATCH __fastcall TExcelApplication::get_ActiveSheet(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_ActiveSheet((LPDISPATCH*)&RHS));
  return RHS;
}

Excel_2k::WINDOWPtr __fastcall TExcelApplication::get_ActiveWindow(void)
{
  Excel_2k::WINDOWPtr RHS;
  OLECHECK(GetDefaultInterface()->get_ActiveWindow(&RHS));
  return RHS;
}

Excel_2k::ExcelWorkbookPtr __fastcall TExcelApplication::get_ActiveWorkbook(void)
{
  Excel_2k::ExcelWorkbookPtr RHS;
  OLECHECK(GetDefaultInterface()->get_ActiveWorkbook(&RHS));
  return RHS;
}

Excel_2k::AddInsPtr __fastcall TExcelApplication::get_AddIns(void)
{
  Excel_2k::AddInsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_AddIns(&RHS));
  return RHS;
}

Office_2k::AssistantPtr __fastcall TExcelApplication::get_Assistant(void)
{
  Office_2k::AssistantPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Assistant(&RHS));
  return RHS;
}

Excel_2k::ExcelRangePtr __fastcall TExcelApplication::get_Cells(void)
{
  Excel_2k::ExcelRangePtr RHS;
  OLECHECK(GetDefaultInterface()->get_Cells(&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelApplication::get_Charts(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Charts(&RHS));
  return RHS;
}

Excel_2k::ExcelRangePtr __fastcall TExcelApplication::get_Columns(void)
{
  Excel_2k::ExcelRangePtr RHS;
  OLECHECK(GetDefaultInterface()->get_Columns(&RHS));
  return RHS;
}

Office_2k::CommandBarsPtr __fastcall TExcelApplication::get_CommandBars(void)
{
  Office_2k::CommandBarsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_CommandBars(&RHS));
  return RHS;
}

long __fastcall TExcelApplication::get_DDEAppReturnCode(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_DDEAppReturnCode(lcid, (long*)&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelApplication::get_DialogSheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_DialogSheets(&RHS));
  return RHS;
}

Excel_2k::MenuBarsPtr __fastcall TExcelApplication::get_MenuBars(void)
{
  Excel_2k::MenuBarsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_MenuBars(&RHS));
  return RHS;
}

Excel_2k::ModulesPtr __fastcall TExcelApplication::get_Modules(void)
{
  Excel_2k::ModulesPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Modules(&RHS));
  return RHS;
}

Excel_2k::NamesPtr __fastcall TExcelApplication::get_Names(void)
{
  Excel_2k::NamesPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Names(&RHS));
  return RHS;
}

Excel_2k::ExcelRange* __fastcall TExcelApplication::get_Range(VARIANT Cell1/*[in]*/, 
                                                              VARIANT Cell2/*[in,opt]*/)
{
  Excel_2k::ExcelRange* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Range(Cell1, Cell2, (Excel_2k::ExcelRange**)&RHS));
  return RHS;
}

Excel_2k::ExcelRangePtr __fastcall TExcelApplication::get_Rows(void)
{
  Excel_2k::ExcelRangePtr RHS;
  OLECHECK(GetDefaultInterface()->get_Rows(&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelApplication::get_Selection(long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_Selection(lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelApplication::get_Sheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Sheets(&RHS));
  return RHS;
}

Excel_2k::Menu* __fastcall TExcelApplication::get_ShortcutMenus(long Index/*[in]*/)
{
  Excel_2k::Menu* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_ShortcutMenus(Index, (Excel_2k::Menu**)&RHS));
  return RHS;
}

Excel_2k::ExcelWorkbook* __fastcall TExcelApplication::get_ThisWorkbook(long lcid/*[in]*/)
{
  Excel_2k::ExcelWorkbook* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_ThisWorkbook(lcid, (Excel_2k::ExcelWorkbook**)&RHS));
  return RHS;
}

Excel_2k::ToolbarsPtr __fastcall TExcelApplication::get_Toolbars(void)
{
  Excel_2k::ToolbarsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Toolbars(&RHS));
  return RHS;
}

Excel_2k::WindowsPtr __fastcall TExcelApplication::get_Windoz(void)
{
  Excel_2k::WindowsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Windoz(&RHS));
  return RHS;
}

Excel_2k::WorkbooksPtr __fastcall TExcelApplication::get_Workbooks(void)
{
  Excel_2k::WorkbooksPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Workbooks(&RHS));
  return RHS;
}

Excel_2k::WorksheetFunctionPtr __fastcall TExcelApplication::get_WorksheetFunction(void)
{
  Excel_2k::WorksheetFunctionPtr RHS;
  OLECHECK(GetDefaultInterface()->get_WorksheetFunction(&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelApplication::get_Worksheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Worksheets(&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelApplication::get_Excel4IntlMacroSheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Excel4IntlMacroSheets(&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelApplication::get_Excel4MacroSheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Excel4MacroSheets(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_AlertBeforeOverwriting(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_AlertBeforeOverwriting(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_AlertBeforeOverwriting(long lcid/*[in]*/, 
                                                              VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_AlertBeforeOverwriting(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_AltStartupPath(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_AltStartupPath(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_AltStartupPath(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_AltStartupPath(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_AskToUpdateLinks(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_AskToUpdateLinks(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_AskToUpdateLinks(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_AskToUpdateLinks(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_EnableAnimations(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnableAnimations(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_EnableAnimations(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableAnimations(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::AutoCorrectPtr __fastcall TExcelApplication::get_AutoCorrect(void)
{
  Excel_2k::AutoCorrectPtr RHS;
  OLECHECK(GetDefaultInterface()->get_AutoCorrect(&RHS));
  return RHS;
}

long __fastcall TExcelApplication::get_Build(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_Build(lcid, (long*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_CalculateBeforeSave(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_CalculateBeforeSave(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_CalculateBeforeSave(long lcid/*[in]*/, 
                                                           VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_CalculateBeforeSave(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlCalculation __fastcall TExcelApplication::get_Calculation(long lcid/*[in]*/)
{
  Excel_2k::XlCalculation RHS;
  OLECHECK(GetDefaultInterface()->get_Calculation(lcid, (Excel_2k::XlCalculation*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Calculation(long lcid/*[in]*/, 
                                                   Excel_2k::XlCalculation RHS/*[in]*/)
{
  GetDefaultInterface()->set_Calculation(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT __fastcall TExcelApplication::get_Caller(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_Caller(Index, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_CanPlaySounds(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_CanPlaySounds(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_CanRecordSounds(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_CanRecordSounds(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_Caption(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Caption((BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Caption(BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_Caption(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_CellDragAndDrop(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_CellDragAndDrop(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_CellDragAndDrop(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_CellDragAndDrop(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT __fastcall TExcelApplication::get_ClipboardFormats(VARIANT Index/*[in,opt]*/, 
                                                           long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_ClipboardFormats(Index, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayClipboardWindow(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayClipboardWindow(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayClipboardWindow(long lcid/*[in]*/, 
                                                              VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayClipboardWindow(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_ColorButtons(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ColorButtons((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ColorButtons(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ColorButtons(RHS/*[in]*/);
}

Excel_2k::XlCommandUnderlines __fastcall TExcelApplication::get_CommandUnderlines(long lcid/*[in]*/)
{
  Excel_2k::XlCommandUnderlines RHS;
  OLECHECK(GetDefaultInterface()->get_CommandUnderlines(lcid, (Excel_2k::XlCommandUnderlines*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_CommandUnderlines(long lcid/*[in]*/, 
                                                         Excel_2k::XlCommandUnderlines RHS/*[in]*/)
{
  GetDefaultInterface()->set_CommandUnderlines(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_ConstrainNumeric(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ConstrainNumeric(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ConstrainNumeric(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ConstrainNumeric(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_CopyObjectsWithCells(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_CopyObjectsWithCells(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_CopyObjectsWithCells(long lcid/*[in]*/, 
                                                            VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_CopyObjectsWithCells(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlMousePointer __fastcall TExcelApplication::get_Cursor(long lcid/*[in]*/)
{
  Excel_2k::XlMousePointer RHS;
  OLECHECK(GetDefaultInterface()->get_Cursor(lcid, (Excel_2k::XlMousePointer*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Cursor(long lcid/*[in]*/, 
                                              Excel_2k::XlMousePointer RHS/*[in]*/)
{
  GetDefaultInterface()->set_Cursor(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_CustomListCount(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_CustomListCount(lcid, (long*)&RHS));
  return RHS;
}

Excel_2k::XlCutCopyMode __fastcall TExcelApplication::get_CutCopyMode(long lcid/*[in]*/)
{
  Excel_2k::XlCutCopyMode RHS;
  OLECHECK(GetDefaultInterface()->get_CutCopyMode(lcid, (Excel_2k::XlCutCopyMode*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_CutCopyMode(long lcid/*[in]*/, 
                                                   Excel_2k::XlCutCopyMode RHS/*[in]*/)
{
  GetDefaultInterface()->set_CutCopyMode(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_DataEntryMode(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_DataEntryMode(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DataEntryMode(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_DataEntryMode(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get__Default(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get__Default((BSTR*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_DefaultFilePath(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_DefaultFilePath(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DefaultFilePath(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_DefaultFilePath(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::DialogsPtr __fastcall TExcelApplication::get_Dialogs(void)
{
  Excel_2k::DialogsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Dialogs(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayAlerts(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayAlerts(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayAlerts(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayAlerts(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayFormulaBar(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayFormulaBar(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayFormulaBar(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayFormulaBar(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayFullScreen(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayFullScreen(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayFullScreen(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayFullScreen(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayNoteIndicator(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayNoteIndicator((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayNoteIndicator(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayNoteIndicator(RHS/*[in]*/);
}

Excel_2k::XlCommentDisplayMode __fastcall TExcelApplication::get_DisplayCommentIndicator(void)
{
  Excel_2k::XlCommentDisplayMode RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayCommentIndicator((Excel_2k::XlCommentDisplayMode*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayCommentIndicator(Excel_2k::XlCommentDisplayMode RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayCommentIndicator(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayExcel4Menus(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayExcel4Menus(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayExcel4Menus(long lcid/*[in]*/, 
                                                          VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayExcel4Menus(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayRecentFiles(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayRecentFiles((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayRecentFiles(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayRecentFiles(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayScrollBars(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayScrollBars(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayScrollBars(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayScrollBars(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayStatusBar(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayStatusBar(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayStatusBar(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayStatusBar(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_EditDirectlyInCell(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EditDirectlyInCell(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_EditDirectlyInCell(long lcid/*[in]*/, 
                                                          VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EditDirectlyInCell(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_EnableAutoComplete(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnableAutoComplete((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_EnableAutoComplete(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableAutoComplete(RHS/*[in]*/);
}

Excel_2k::XlEnableCancelKey __fastcall TExcelApplication::get_EnableCancelKey(long lcid/*[in]*/)
{
  Excel_2k::XlEnableCancelKey RHS;
  OLECHECK(GetDefaultInterface()->get_EnableCancelKey(lcid, (Excel_2k::XlEnableCancelKey*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_EnableCancelKey(long lcid/*[in]*/, 
                                                       Excel_2k::XlEnableCancelKey RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableCancelKey(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_EnableSound(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnableSound((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_EnableSound(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableSound(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_EnableTipWizard(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnableTipWizard(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_EnableTipWizard(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableTipWizard(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT __fastcall TExcelApplication::get_FileConverters(VARIANT Index1/*[in,opt]*/, 
                                                         VARIANT Index2/*[in,opt]*/, 
                                                         long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_FileConverters(Index1, Index2, lcid, (VARIANT*)&RHS));
  return RHS;
}

Office_2k::FileSearchPtr __fastcall TExcelApplication::get_FileSearch(void)
{
  Office_2k::FileSearchPtr RHS;
  OLECHECK(GetDefaultInterface()->get_FileSearch(&RHS));
  return RHS;
}

Office_2k::IFindPtr __fastcall TExcelApplication::get_FileFind(void)
{
  Office_2k::IFindPtr RHS;
  OLECHECK(GetDefaultInterface()->get_FileFind(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_FixedDecimal(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_FixedDecimal(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_FixedDecimal(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_FixedDecimal(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_FixedDecimalPlaces(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_FixedDecimalPlaces(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_FixedDecimalPlaces(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_FixedDecimalPlaces(lcid/*[in]*/, RHS/*[in]*/);
}

double __fastcall TExcelApplication::get_Height(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_Height(lcid, (double*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Height(long lcid/*[in]*/, double RHS/*[in]*/)
{
  GetDefaultInterface()->set_Height(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_IgnoreRemoteRequests(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_IgnoreRemoteRequests(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_IgnoreRemoteRequests(long lcid/*[in]*/, 
                                                            VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_IgnoreRemoteRequests(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_Interactive(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_Interactive(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Interactive(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_Interactive(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT __fastcall TExcelApplication::get_International(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_International(Index, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_Iteration(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_Iteration(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Iteration(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_Iteration(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_LargeButtons(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_LargeButtons((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_LargeButtons(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_LargeButtons(RHS/*[in]*/);
}

double __fastcall TExcelApplication::get_Left(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_Left(lcid, (double*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Left(long lcid/*[in]*/, double RHS/*[in]*/)
{
  GetDefaultInterface()->set_Left(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_LibraryPath(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_LibraryPath(lcid, (BSTR*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::get_MailSession(long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_MailSession(lcid, (VARIANT*)&RHS));
  return RHS;
}

Excel_2k::XlMailSystem __fastcall TExcelApplication::get_MailSystem(long lcid/*[in]*/)
{
  Excel_2k::XlMailSystem RHS;
  OLECHECK(GetDefaultInterface()->get_MailSystem(lcid, (Excel_2k::XlMailSystem*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_MathCoprocessorAvailable(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_MathCoprocessorAvailable(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

double __fastcall TExcelApplication::get_MaxChange(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_MaxChange(lcid, (double*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_MaxChange(long lcid/*[in]*/, double RHS/*[in]*/)
{
  GetDefaultInterface()->set_MaxChange(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_MaxIterations(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_MaxIterations(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_MaxIterations(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_MaxIterations(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_MemoryFree(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_MemoryFree(lcid, (long*)&RHS));
  return RHS;
}

long __fastcall TExcelApplication::get_MemoryTotal(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_MemoryTotal(lcid, (long*)&RHS));
  return RHS;
}

long __fastcall TExcelApplication::get_MemoryUsed(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_MemoryUsed(lcid, (long*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_MouseAvailable(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_MouseAvailable(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_MoveAfterReturn(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_MoveAfterReturn(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_MoveAfterReturn(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_MoveAfterReturn(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlDirection __fastcall TExcelApplication::get_MoveAfterReturnDirection(long lcid/*[in]*/)
{
  Excel_2k::XlDirection RHS;
  OLECHECK(GetDefaultInterface()->get_MoveAfterReturnDirection(lcid, (Excel_2k::XlDirection*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_MoveAfterReturnDirection(long lcid/*[in]*/, 
                                                                Excel_2k::XlDirection RHS/*[in]*/)
{
  GetDefaultInterface()->set_MoveAfterReturnDirection(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::RecentFilesPtr __fastcall TExcelApplication::get_RecentFiles(void)
{
  Excel_2k::RecentFilesPtr RHS;
  OLECHECK(GetDefaultInterface()->get_RecentFiles(&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_Name(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_NetworkTemplatesPath(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_NetworkTemplatesPath(lcid, (BSTR*)&RHS));
  return RHS;
}

Excel_2k::ODBCErrorsPtr __fastcall TExcelApplication::get_ODBCErrors(void)
{
  Excel_2k::ODBCErrorsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_ODBCErrors(&RHS));
  return RHS;
}

long __fastcall TExcelApplication::get_ODBCTimeout(void)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_ODBCTimeout((long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ODBCTimeout(long RHS/*[in]*/)
{
  GetDefaultInterface()->set_ODBCTimeout(RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_OnCalculate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnCalculate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_OnCalculate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnCalculate(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_OnData(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnData(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_OnData(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnData(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_OnDoubleClick(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnDoubleClick(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_OnDoubleClick(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnDoubleClick(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_OnEntry(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnEntry(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_OnEntry(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnEntry(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_OnSheetActivate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnSheetActivate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_OnSheetActivate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnSheetActivate(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_OnSheetDeactivate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnSheetDeactivate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_OnSheetDeactivate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnSheetDeactivate(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_OnWindow(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnWindow(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_OnWindow(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnWindow(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_OperatingSystem(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OperatingSystem(lcid, (BSTR*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_OrganizationName(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OrganizationName(lcid, (BSTR*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_Path(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Path(lcid, (BSTR*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_PathSeparator(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_PathSeparator(lcid, (BSTR*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::get_PreviousSelections(VARIANT Index/*[in,opt]*/, 
                                                             long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_PreviousSelections(Index, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_PivotTableSelection(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_PivotTableSelection((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_PivotTableSelection(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_PivotTableSelection(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_PromptForSummaryInfo(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_PromptForSummaryInfo(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_PromptForSummaryInfo(long lcid/*[in]*/, 
                                                            VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_PromptForSummaryInfo(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_RecordRelative(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_RecordRelative(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

Excel_2k::XlReferenceStyle __fastcall TExcelApplication::get_ReferenceStyle(long lcid/*[in]*/)
{
  Excel_2k::XlReferenceStyle RHS;
  OLECHECK(GetDefaultInterface()->get_ReferenceStyle(lcid, (Excel_2k::XlReferenceStyle*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ReferenceStyle(long lcid/*[in]*/, 
                                                      Excel_2k::XlReferenceStyle RHS/*[in]*/)
{
  GetDefaultInterface()->set_ReferenceStyle(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT __fastcall TExcelApplication::get_RegisteredFunctions(VARIANT Index1/*[in,opt]*/, 
                                                              VARIANT Index2/*[in,opt]*/, 
                                                              long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_RegisteredFunctions(Index1, Index2, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_RollZoom(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_RollZoom((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_RollZoom(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_RollZoom(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_ScreenUpdating(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ScreenUpdating(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ScreenUpdating(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ScreenUpdating(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_SheetsInNewWorkbook(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_SheetsInNewWorkbook(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_SheetsInNewWorkbook(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_SheetsInNewWorkbook(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_ShowChartTipNames(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ShowChartTipNames((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ShowChartTipNames(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ShowChartTipNames(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_ShowChartTipValues(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ShowChartTipValues((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ShowChartTipValues(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ShowChartTipValues(RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_StandardFont(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_StandardFont(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_StandardFont(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_StandardFont(lcid/*[in]*/, RHS/*[in]*/);
}

double __fastcall TExcelApplication::get_StandardFontSize(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_StandardFontSize(lcid, (double*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_StandardFontSize(long lcid/*[in]*/, double RHS/*[in]*/)
{
  GetDefaultInterface()->set_StandardFontSize(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_StartupPath(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_StartupPath(lcid, (BSTR*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelApplication::get_StatusBar(long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_StatusBar(lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_StatusBar(long lcid/*[in]*/, VARIANT RHS/*[in]*/)
{
  GetDefaultInterface()->set_StatusBar(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_TemplatesPath(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_TemplatesPath(lcid, (BSTR*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_ShowToolTips(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ShowToolTips((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ShowToolTips(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ShowToolTips(RHS/*[in]*/);
}

double __fastcall TExcelApplication::get_Top(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_Top(lcid, (double*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Top(long lcid/*[in]*/, double RHS/*[in]*/)
{
  GetDefaultInterface()->set_Top(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlFileFormat __fastcall TExcelApplication::get_DefaultSaveFormat(void)
{
  Excel_2k::XlFileFormat RHS;
  OLECHECK(GetDefaultInterface()->get_DefaultSaveFormat((Excel_2k::XlFileFormat*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DefaultSaveFormat(Excel_2k::XlFileFormat RHS/*[in]*/)
{
  GetDefaultInterface()->set_DefaultSaveFormat(RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_TransitionMenuKey(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_TransitionMenuKey(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_TransitionMenuKey(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_TransitionMenuKey(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_TransitionMenuKeyAction(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_TransitionMenuKeyAction(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_TransitionMenuKeyAction(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_TransitionMenuKeyAction(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_TransitionNavigKeys(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_TransitionNavigKeys(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_TransitionNavigKeys(long lcid/*[in]*/, 
                                                           VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_TransitionNavigKeys(lcid/*[in]*/, RHS/*[in]*/);
}

double __fastcall TExcelApplication::get_UsableHeight(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_UsableHeight(lcid, (double*)&RHS));
  return RHS;
}

double __fastcall TExcelApplication::get_UsableWidth(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_UsableWidth(lcid, (double*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_UserControl(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_UserControl((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_UserControl(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_UserControl(RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_UserName(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_UserName(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_UserName(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_UserName(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelApplication::get_Value(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Value((BSTR*)&RHS));
  return RHS;
}

Vbide_2k::VBEPtr __fastcall TExcelApplication::get_VBE(void)
{
  Vbide_2k::VBEPtr RHS;
  OLECHECK(GetDefaultInterface()->get_VBE(&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_Version(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Version(lcid, (BSTR*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_Visible(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_Visible(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Visible(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_Visible(lcid/*[in]*/, RHS/*[in]*/);
}

double __fastcall TExcelApplication::get_Width(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_Width(lcid, (double*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_Width(long lcid/*[in]*/, double RHS/*[in]*/)
{
  GetDefaultInterface()->set_Width(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_WindowsForPens(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_WindowsForPens(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

Excel_2k::XlWindowState __fastcall TExcelApplication::get_WindowState(long lcid/*[in]*/)
{
  Excel_2k::XlWindowState RHS;
  OLECHECK(GetDefaultInterface()->get_WindowState(lcid, (Excel_2k::XlWindowState*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_WindowState(long lcid/*[in]*/, 
                                                   Excel_2k::XlWindowState RHS/*[in]*/)
{
  GetDefaultInterface()->set_WindowState(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_UILanguage(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_UILanguage(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_UILanguage(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_UILanguage(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_DefaultSheetDirection(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_DefaultSheetDirection(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DefaultSheetDirection(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_DefaultSheetDirection(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelApplication::get_CursorMovement(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_CursorMovement(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_CursorMovement(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_CursorMovement(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_ControlCharacters(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ControlCharacters(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ControlCharacters(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ControlCharacters(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_EnableEvents(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnableEvents((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_EnableEvents(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableEvents(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_DisplayInfoWindow(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayInfoWindow((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_DisplayInfoWindow(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayInfoWindow(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelApplication::get_ExtendList(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ExtendList((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ExtendList(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ExtendList(RHS/*[in]*/);
}

Excel_2k::OLEDBErrorsPtr __fastcall TExcelApplication::get_OLEDBErrors(void)
{
  Excel_2k::OLEDBErrorsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_OLEDBErrors(&RHS));
  return RHS;
}

Office_2k::COMAddInsPtr __fastcall TExcelApplication::get_COMAddIns(void)
{
  Office_2k::COMAddInsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_COMAddIns(&RHS));
  return RHS;
}

Excel_2k::DefaultWebOptionsPtr __fastcall TExcelApplication::get_DefaultWebOptions(void)
{
  Excel_2k::DefaultWebOptionsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_DefaultWebOptions(&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_ProductCode(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_ProductCode((BSTR*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelApplication::get_UserLibraryPath(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_UserLibraryPath((BSTR*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_AutoPercentEntry(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_AutoPercentEntry((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_AutoPercentEntry(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_AutoPercentEntry(RHS/*[in]*/);
}

Office_2k::LanguageSettingsPtr __fastcall TExcelApplication::get_LanguageSettings(void)
{
  Office_2k::LanguageSettingsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_LanguageSettings(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_Dummy101(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_Dummy101((VARIANT_BOOL*)&RHS));
  return RHS;
}

Office_2k::AnswerWizardPtr __fastcall TExcelApplication::get_AnswerWizard(void)
{
  Office_2k::AnswerWizardPtr RHS;
  OLECHECK(GetDefaultInterface()->get_AnswerWizard(&RHS));
  return RHS;
}

long __fastcall TExcelApplication::get_CalculationVersion(void)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_CalculationVersion((long*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelApplication::get_ShowWindowsInTaskbar(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ShowWindowsInTaskbar((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_ShowWindowsInTaskbar(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ShowWindowsInTaskbar(RHS/*[in]*/);
}

Office_2k::MsoFeatureInstall __fastcall TExcelApplication::get_FeatureInstall(void)
{
  Office_2k::MsoFeatureInstall RHS;
  OLECHECK(GetDefaultInterface()->get_FeatureInstall((Office_2k::MsoFeatureInstall*)&RHS));
  return RHS;
}

void __fastcall TExcelApplication::set_FeatureInstall(Office_2k::MsoFeatureInstall RHS/*[in]*/)
{
  GetDefaultInterface()->set_FeatureInstall(RHS/*[in]*/);
}

_ChartPtr& TExcelChart::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TExcelChart::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TExcelChart::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TExcelChart::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TExcelChart::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TExcelChart::ConnectTo(_ChartPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TExcelChart::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_ExcelChart;
  sd.IntfIID = __uuidof(_Chart);
  sd.EventIID= __uuidof(ChartEvents);
  ServerData = &sd;
}

void __fastcall TExcelChart::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 304: {
      if (OnActivate) {
        (OnActivate)(this);
      }
      break;
      }
    case 1530: {
      if (OnDeactivate) {
        (OnDeactivate)(this);
      }
      break;
      }
    case 256: {
      if (OnResize) {
        (OnResize)(this);
      }
      break;
      }
    case 1531: {
      if (OnMouseDown) {
        (OnMouseDown)(this, params[0], params[1], params[2], params[3]);
      }
      break;
      }
    case 1532: {
      if (OnMouseUp) {
        (OnMouseUp)(this, params[0], params[1], params[2], params[3]);
      }
      break;
      }
    case 1533: {
      if (OnMouseMove) {
        (OnMouseMove)(this, params[0], params[1], params[2], params[3]);
      }
      break;
      }
    case 1534: {
      if (OnBeforeRightClick) {
        (OnBeforeRightClick)(this, params[0].pboolVal);
      }
      break;
      }
    case 1535: {
      if (OnDragPlot) {
        (OnDragPlot)(this);
      }
      break;
      }
    case 1536: {
      if (OnDragOver) {
        (OnDragOver)(this);
      }
      break;
      }
    case 1537: {
      if (OnBeforeDoubleClick) {
        (OnBeforeDoubleClick)(this, params[0], params[1], params[2], params[3].pboolVal);
      }
      break;
      }
    case 235: {
      if (OnSelect) {
        (OnSelect)(this, params[0], params[1], params[2]);
      }
      break;
      }
    case 1538: {
      if (OnSeriesChange) {
        (OnSeriesChange)(this, params[0], params[1]);
      }
      break;
      }
    case 279: {
      if (OnCalculate) {
        (OnCalculate)(this);
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TExcelChart::Activate(long lcid/*[in]*/)
{
  GetDefaultInterface()->Activate(lcid/*[in]*/);
}

void __fastcall TExcelChart::Copy(VARIANT Before/*[in,opt]*/, VARIANT After/*[in,opt]*/, 
                                  long lcid/*[in]*/)
{
  GetDefaultInterface()->Copy(Before/*[in,opt]*/, After/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::Delete(long lcid/*[in]*/)
{
  GetDefaultInterface()->Delete(lcid/*[in]*/);
}

void __fastcall TExcelChart::Move(VARIANT Before/*[in,opt]*/, VARIANT After/*[in,opt]*/, 
                                  long lcid/*[in]*/)
{
  GetDefaultInterface()->Move(Before/*[in,opt]*/, After/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::_PrintOut(VARIANT From/*[in,opt]*/, VARIANT To/*[in,opt]*/, 
                                       VARIANT Copies/*[in,opt]*/, VARIANT Preview/*[in,opt]*/, 
                                       VARIANT ActivePrinter/*[in,opt]*/, 
                                       VARIANT PrintToFile/*[in,opt]*/, VARIANT Collate/*[in,opt]*/, 
                                       long lcid/*[in]*/)
{
  GetDefaultInterface()->_PrintOut(From/*[in,opt]*/, To/*[in,opt]*/, Copies/*[in,opt]*/, 
                                   Preview/*[in,opt]*/, ActivePrinter/*[in,opt]*/, 
                                   PrintToFile/*[in,opt]*/, Collate/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::PrintPreview(VARIANT EnableChanges/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->PrintPreview(EnableChanges/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::Protect(VARIANT Password/*[in,opt]*/, 
                                     VARIANT DrawingObjects/*[in,opt]*/, 
                                     VARIANT Contents/*[in,opt]*/, VARIANT Scenarios/*[in,opt]*/, 
                                     VARIANT UserInterfaceOnly/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Protect(Password/*[in,opt]*/, DrawingObjects/*[in,opt]*/, 
                                 Contents/*[in,opt]*/, Scenarios/*[in,opt]*/, 
                                 UserInterfaceOnly/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::SaveAs(BSTR Filename/*[in]*/, VARIANT FileFormat/*[in,opt]*/, 
                                    VARIANT Password/*[in,opt]*/, 
                                    VARIANT WriteResPassword/*[in,opt]*/, 
                                    VARIANT ReadOnlyRecommended/*[in,opt]*/, 
                                    VARIANT CreateBackup/*[in,opt]*/, VARIANT AddToMru/*[in,opt]*/, 
                                    VARIANT TextCodepage/*[in,opt]*/, 
                                    VARIANT TextVisualLayout/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->SaveAs(Filename/*[in]*/, FileFormat/*[in,opt]*/, Password/*[in,opt]*/, 
                                WriteResPassword/*[in,opt]*/, ReadOnlyRecommended/*[in,opt]*/, 
                                CreateBackup/*[in,opt]*/, AddToMru/*[in,opt]*/, 
                                TextCodepage/*[in,opt]*/, TextVisualLayout/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::Select(VARIANT Replace/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Select(Replace/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::Unprotect(VARIANT Password/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Unprotect(Password/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::ApplyDataLabels(Excel_2k::XlDataLabelsType Type/*[in,def,opt]*/, 
                                             VARIANT LegendKey/*[in,opt]*/, 
                                             VARIANT AutoText/*[in,opt]*/, 
                                             VARIANT HasLeaderLines/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->ApplyDataLabels(Type/*[in,def,opt]*/, LegendKey/*[in,opt]*/, 
                                         AutoText/*[in,opt]*/, HasLeaderLines/*[in,opt]*/, 
                                         lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelChart::Arcs(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Arcs(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::AreaGroups(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->AreaGroups(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::AutoFormat(long Gallery/*[in]*/, VARIANT Format/*[in,opt]*/)
{
  GetDefaultInterface()->AutoFormat(Gallery/*[in]*/, Format/*[in,opt]*/);
}

LPDISPATCH __fastcall TExcelChart::Axes(VARIANT Type/*[in,opt]*/, 
                                        Excel_2k::XlAxisGroup AxisGroup/*[in,def,opt]*/, 
                                        long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Axes(Type, AxisGroup, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::SetBackgroundPicture(BSTR Filename/*[in]*/)
{
  GetDefaultInterface()->SetBackgroundPicture(Filename/*[in]*/);
}

LPDISPATCH __fastcall TExcelChart::BarGroups(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->BarGroups(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::Buttons(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Buttons(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::ChartGroups(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->ChartGroups(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::ChartObjects(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->ChartObjects(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::ChartWizard(VARIANT Source/*[in,opt]*/, VARIANT Gallery/*[in,opt]*/, 
                                         VARIANT Format/*[in,opt]*/, VARIANT PlotBy/*[in,opt]*/, 
                                         VARIANT CategoryLabels/*[in,opt]*/, 
                                         VARIANT SeriesLabels/*[in,opt]*/, 
                                         VARIANT HasLegend/*[in,opt]*/, VARIANT Title/*[in,opt]*/, 
                                         VARIANT CategoryTitle/*[in,opt]*/, 
                                         VARIANT ValueTitle/*[in,opt]*/, 
                                         VARIANT ExtraTitle/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->ChartWizard(Source/*[in,opt]*/, Gallery/*[in,opt]*/, Format/*[in,opt]*/, 
                                     PlotBy/*[in,opt]*/, CategoryLabels/*[in,opt]*/, 
                                     SeriesLabels/*[in,opt]*/, HasLegend/*[in,opt]*/, 
                                     Title/*[in,opt]*/, CategoryTitle/*[in,opt]*/, 
                                     ValueTitle/*[in,opt]*/, ExtraTitle/*[in,opt]*/, lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelChart::CheckBoxes(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->CheckBoxes(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::CheckSpelling(VARIANT CustomDictionary/*[in,opt]*/, 
                                           VARIANT IgnoreUppercase/*[in,opt]*/, 
                                           VARIANT AlwaysSuggest/*[in,opt]*/, 
                                           VARIANT SpellLang/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->CheckSpelling(CustomDictionary/*[in,opt]*/, IgnoreUppercase/*[in,opt]*/, 
                                       AlwaysSuggest/*[in,opt]*/, SpellLang/*[in,opt]*/, 
                                       lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelChart::ColumnGroups(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->ColumnGroups(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::CopyPicture(Excel_2k::XlPictureAppearance Appearance/*[in,def,opt]*/, 
                                         Excel_2k::XlCopyPictureFormat Format/*[in,def,opt]*/, 
                                         Excel_2k::XlPictureAppearance Size/*[in,def,opt]*/, 
                                         long lcid/*[in]*/)
{
  GetDefaultInterface()->CopyPicture(Appearance/*[in,def,opt]*/, Format/*[in,def,opt]*/, 
                                     Size/*[in,def,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::CreatePublisher(VARIANT Edition/*[in,opt]*/, 
                                             Excel_2k::XlPictureAppearance Appearance/*[in,def,opt]*/, 
                                             Excel_2k::XlPictureAppearance Size/*[in,def,opt]*/, 
                                             VARIANT ContainsPICT/*[in,opt]*/, 
                                             VARIANT ContainsBIFF/*[in,opt]*/, 
                                             VARIANT ContainsRTF/*[in,opt]*/, 
                                             VARIANT ContainsVALU/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->CreatePublisher(Edition/*[in,opt]*/, Appearance/*[in,def,opt]*/, 
                                         Size/*[in,def,opt]*/, ContainsPICT/*[in,opt]*/, 
                                         ContainsBIFF/*[in,opt]*/, ContainsRTF/*[in,opt]*/, 
                                         ContainsVALU/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelChart::Deselect(long lcid/*[in]*/)
{
  GetDefaultInterface()->Deselect(lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelChart::DoughnutGroups(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->DoughnutGroups(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::Drawings(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Drawings(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::DrawingObjects(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->DrawingObjects(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::DropDowns(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->DropDowns(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelChart::Evaluate(VARIANT Name/*[in]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->Evaluate(Name, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelChart::_Evaluate(VARIANT Name/*[in]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->_Evaluate(Name, lcid, (VARIANT*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::GroupBoxes(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->GroupBoxes(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::GroupObjects(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->GroupObjects(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::Labels(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Labels(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::LineGroups(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->LineGroups(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::Lines(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Lines(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::ListBoxes(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->ListBoxes(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

Excel_2k::ExcelChart* __fastcall TExcelChart::Location(Excel_2k::XlChartLocation Where/*[in]*/, 
                                                       VARIANT Name/*[in,opt]*/)
{
  Excel_2k::ExcelChart* RHS = 0;
  OLECHECK(GetDefaultInterface()->Location(Where, Name, (Excel_2k::ExcelChart**)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::OLEObjects(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->OLEObjects(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::OptionButtons(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->OptionButtons(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::Ovals(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Ovals(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::Paste(VARIANT Type/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Paste(Type/*[in,opt]*/, lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelChart::Pictures(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Pictures(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::PieGroups(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->PieGroups(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::RadarGroups(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->RadarGroups(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::Rectangles(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Rectangles(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::ScrollBars(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->ScrollBars(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::SeriesCollection(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->SeriesCollection(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::Spinners(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Spinners(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::TextBoxes(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->TextBoxes(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::ApplyCustomType(Excel_2k::XlChartType ChartType/*[in]*/, 
                                             VARIANT TypeName/*[in,opt]*/)
{
  GetDefaultInterface()->ApplyCustomType(ChartType/*[in]*/, TypeName/*[in,opt]*/);
}

LPDISPATCH __fastcall TExcelChart::XYGroups(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->XYGroups(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::CopyChartBuild(void)
{
  GetDefaultInterface()->CopyChartBuild();
}

void __fastcall TExcelChart::GetChartElement(long x/*[in]*/, long y/*[in]*/, long* ElementID/*[in]*/, 
                                             long* Arg1/*[in]*/, long* Arg2/*[in]*/)
{
  GetDefaultInterface()->GetChartElement(x/*[in]*/, y/*[in]*/, ElementID/*[in]*/, Arg1/*[in]*/, 
                                         Arg2/*[in]*/);
}

void __fastcall TExcelChart::SetSourceData(Excel_2k::ExcelRange* Source/*[in]*/, 
                                           VARIANT PlotBy/*[in,opt]*/)
{
  GetDefaultInterface()->SetSourceData(Source/*[in]*/, PlotBy/*[in,opt]*/);
}

VARIANT_BOOL __fastcall TExcelChart::Export(BSTR Filename/*[in]*/, VARIANT FilterName/*[in,opt]*/, 
                                            VARIANT Interactive/*[in,opt]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->Export(Filename, FilterName, Interactive, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::Refresh(void)
{
  GetDefaultInterface()->Refresh();
}

void __fastcall TExcelChart::PrintOut(VARIANT From/*[in,opt]*/, VARIANT To/*[in,opt]*/, 
                                      VARIANT Copies/*[in,opt]*/, VARIANT Preview/*[in,opt]*/, 
                                      VARIANT ActivePrinter/*[in,opt]*/, 
                                      VARIANT PrintToFile/*[in,opt]*/, VARIANT Collate/*[in,opt]*/, 
                                      VARIANT PrToFileName/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->PrintOut(From/*[in,opt]*/, To/*[in,opt]*/, Copies/*[in,opt]*/, 
                                  Preview/*[in,opt]*/, ActivePrinter/*[in,opt]*/, 
                                  PrintToFile/*[in,opt]*/, Collate/*[in,opt]*/, 
                                  PrToFileName/*[in,opt]*/, lcid/*[in]*/);
}

Excel_2k::ExcelApplicationPtr __fastcall TExcelChart::get_Application(void)
{
  Excel_2k::ExcelApplicationPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Application(&RHS));
  return RHS;
}

Excel_2k::XlCreator __fastcall TExcelChart::get_Creator(void)
{
  Excel_2k::XlCreator RHS;
  OLECHECK(GetDefaultInterface()->get_Creator((Excel_2k::XlCreator*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::get_Parent(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelChart::get_CodeName(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_CodeName((BSTR*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelChart::get__CodeName(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get__CodeName((BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set__CodeName(BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set__CodeName(RHS/*[in]*/);
}

long __fastcall TExcelChart::get_Index(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_Index(lcid, (long*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelChart::get_Name(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_Name(BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_Name(RHS/*[in]*/);
}

LPDISPATCH __fastcall TExcelChart::get_Next(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_Next((LPDISPATCH*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelChart::get_OnDoubleClick(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnDoubleClick(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_OnDoubleClick(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnDoubleClick(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelChart::get_OnSheetActivate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnSheetActivate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_OnSheetActivate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnSheetActivate(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelChart::get_OnSheetDeactivate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnSheetDeactivate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_OnSheetDeactivate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnSheetDeactivate(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::PageSetupPtr __fastcall TExcelChart::get_PageSetup(void)
{
  Excel_2k::PageSetupPtr RHS;
  OLECHECK(GetDefaultInterface()->get_PageSetup(&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelChart::get_Previous(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_Previous((LPDISPATCH*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelChart::get_ProtectContents(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectContents(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelChart::get_ProtectDrawingObjects(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectDrawingObjects(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelChart::get_ProtectionMode(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectionMode(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

Excel_2k::XlSheetVisibility __fastcall TExcelChart::get_Visible(long lcid/*[in]*/)
{
  Excel_2k::XlSheetVisibility RHS;
  OLECHECK(GetDefaultInterface()->get_Visible(lcid, (Excel_2k::XlSheetVisibility*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_Visible(long lcid/*[in]*/, Excel_2k::XlSheetVisibility RHS/*[in]*/)
{
  GetDefaultInterface()->set_Visible(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::ShapesPtr __fastcall TExcelChart::get_Shapes(void)
{
  Excel_2k::ShapesPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Shapes(&RHS));
  return RHS;
}

Excel_2k::ChartGroup* __fastcall TExcelChart::get_Area3DGroup(long lcid/*[in]*/)
{
  Excel_2k::ChartGroup* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Area3DGroup(lcid, (Excel_2k::ChartGroup**)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelChart::get_AutoScaling(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_AutoScaling(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_AutoScaling(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_AutoScaling(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::ChartGroup* __fastcall TExcelChart::get_Bar3DGroup(long lcid/*[in]*/)
{
  Excel_2k::ChartGroup* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Bar3DGroup(lcid, (Excel_2k::ChartGroup**)&RHS));
  return RHS;
}

Excel_2k::ChartArea* __fastcall TExcelChart::get_ChartArea(long lcid/*[in]*/)
{
  Excel_2k::ChartArea* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_ChartArea(lcid, (Excel_2k::ChartArea**)&RHS));
  return RHS;
}

Excel_2k::ChartTitle* __fastcall TExcelChart::get_ChartTitle(long lcid/*[in]*/)
{
  Excel_2k::ChartTitle* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_ChartTitle(lcid, (Excel_2k::ChartTitle**)&RHS));
  return RHS;
}

Excel_2k::ChartGroup* __fastcall TExcelChart::get_Column3DGroup(long lcid/*[in]*/)
{
  Excel_2k::ChartGroup* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Column3DGroup(lcid, (Excel_2k::ChartGroup**)&RHS));
  return RHS;
}

Excel_2k::Corners* __fastcall TExcelChart::get_Corners(long lcid/*[in]*/)
{
  Excel_2k::Corners* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Corners(lcid, (Excel_2k::Corners**)&RHS));
  return RHS;
}

Excel_2k::DataTablePtr __fastcall TExcelChart::get_DataTable(void)
{
  Excel_2k::DataTablePtr RHS;
  OLECHECK(GetDefaultInterface()->get_DataTable(&RHS));
  return RHS;
}

long __fastcall TExcelChart::get_DepthPercent(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_DepthPercent(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_DepthPercent(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_DepthPercent(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlDisplayBlanksAs __fastcall TExcelChart::get_DisplayBlanksAs(long lcid/*[in]*/)
{
  Excel_2k::XlDisplayBlanksAs RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayBlanksAs(lcid, (Excel_2k::XlDisplayBlanksAs*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_DisplayBlanksAs(long lcid/*[in]*/, 
                                                 Excel_2k::XlDisplayBlanksAs RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayBlanksAs(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelChart::get_Elevation(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_Elevation(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_Elevation(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_Elevation(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::Floor* __fastcall TExcelChart::get_Floor(long lcid/*[in]*/)
{
  Excel_2k::Floor* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Floor(lcid, (Excel_2k::Floor**)&RHS));
  return RHS;
}

long __fastcall TExcelChart::get_GapDepth(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_GapDepth(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_GapDepth(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_GapDepth(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT __fastcall TExcelChart::get_HasAxis(VARIANT Index1/*[in,opt]*/, VARIANT Index2/*[in,opt]*/, 
                                            long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_HasAxis(Index1, Index2, lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_HasAxis(VARIANT Index1/*[in,opt]*/, VARIANT Index2/*[in,opt]*/, 
                                         long lcid/*[in]*/, VARIANT RHS/*[in]*/)
{
  GetDefaultInterface()->set_HasAxis(Index1/*[in,opt]*/, Index2/*[in,opt]*/, lcid/*[in]*/, 
                                     RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelChart::get_HasDataTable(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_HasDataTable((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_HasDataTable(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_HasDataTable(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelChart::get_HasLegend(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_HasLegend(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_HasLegend(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_HasLegend(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelChart::get_HasTitle(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_HasTitle(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_HasTitle(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_HasTitle(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelChart::get_HeightPercent(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_HeightPercent(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_HeightPercent(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_HeightPercent(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::HyperlinksPtr __fastcall TExcelChart::get_Hyperlinks(void)
{
  Excel_2k::HyperlinksPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Hyperlinks(&RHS));
  return RHS;
}

Excel_2k::Legend* __fastcall TExcelChart::get_Legend(long lcid/*[in]*/)
{
  Excel_2k::Legend* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Legend(lcid, (Excel_2k::Legend**)&RHS));
  return RHS;
}

Excel_2k::ChartGroup* __fastcall TExcelChart::get_Line3DGroup(long lcid/*[in]*/)
{
  Excel_2k::ChartGroup* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Line3DGroup(lcid, (Excel_2k::ChartGroup**)&RHS));
  return RHS;
}

long __fastcall TExcelChart::get_Perspective(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_Perspective(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_Perspective(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_Perspective(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::ChartGroup* __fastcall TExcelChart::get_Pie3DGroup(long lcid/*[in]*/)
{
  Excel_2k::ChartGroup* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Pie3DGroup(lcid, (Excel_2k::ChartGroup**)&RHS));
  return RHS;
}

Excel_2k::PlotArea* __fastcall TExcelChart::get_PlotArea(long lcid/*[in]*/)
{
  Excel_2k::PlotArea* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_PlotArea(lcid, (Excel_2k::PlotArea**)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelChart::get_PlotVisibleOnly(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_PlotVisibleOnly(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_PlotVisibleOnly(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_PlotVisibleOnly(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT __fastcall TExcelChart::get_RightAngleAxes(long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_RightAngleAxes(lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_RightAngleAxes(long lcid/*[in]*/, VARIANT RHS/*[in]*/)
{
  GetDefaultInterface()->set_RightAngleAxes(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT __fastcall TExcelChart::get_Rotation(long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_Rotation(lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_Rotation(long lcid/*[in]*/, VARIANT RHS/*[in]*/)
{
  GetDefaultInterface()->set_Rotation(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelChart::get_SizeWithWindow(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_SizeWithWindow(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_SizeWithWindow(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_SizeWithWindow(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelChart::get_ShowWindow(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ShowWindow((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_ShowWindow(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ShowWindow(RHS/*[in]*/);
}

long __fastcall TExcelChart::get_SubType(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_SubType(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_SubType(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_SubType(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::ChartGroup* __fastcall TExcelChart::get_SurfaceGroup(long lcid/*[in]*/)
{
  Excel_2k::ChartGroup* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_SurfaceGroup(lcid, (Excel_2k::ChartGroup**)&RHS));
  return RHS;
}

long __fastcall TExcelChart::get_Type(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_Type(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_Type(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set_Type(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlChartType __fastcall TExcelChart::get_ChartType(void)
{
  Excel_2k::XlChartType RHS;
  OLECHECK(GetDefaultInterface()->get_ChartType((Excel_2k::XlChartType*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_ChartType(Excel_2k::XlChartType RHS/*[in]*/)
{
  GetDefaultInterface()->set_ChartType(RHS/*[in]*/);
}

Excel_2k::Walls* __fastcall TExcelChart::get_Walls(long lcid/*[in]*/)
{
  Excel_2k::Walls* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Walls(lcid, (Excel_2k::Walls**)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelChart::get_WallsAndGridlines2D(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_WallsAndGridlines2D(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_WallsAndGridlines2D(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_WallsAndGridlines2D(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlBarShape __fastcall TExcelChart::get_BarShape(void)
{
  Excel_2k::XlBarShape RHS;
  OLECHECK(GetDefaultInterface()->get_BarShape((Excel_2k::XlBarShape*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_BarShape(Excel_2k::XlBarShape RHS/*[in]*/)
{
  GetDefaultInterface()->set_BarShape(RHS/*[in]*/);
}

Excel_2k::XlRowCol __fastcall TExcelChart::get_PlotBy(void)
{
  Excel_2k::XlRowCol RHS;
  OLECHECK(GetDefaultInterface()->get_PlotBy((Excel_2k::XlRowCol*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_PlotBy(Excel_2k::XlRowCol RHS/*[in]*/)
{
  GetDefaultInterface()->set_PlotBy(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelChart::get_ProtectFormatting(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectFormatting((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_ProtectFormatting(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ProtectFormatting(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelChart::get_ProtectData(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectData((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_ProtectData(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ProtectData(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelChart::get_ProtectGoalSeek(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectGoalSeek((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_ProtectGoalSeek(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ProtectGoalSeek(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelChart::get_ProtectSelection(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectSelection((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_ProtectSelection(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ProtectSelection(RHS/*[in]*/);
}

Excel_2k::PivotLayoutPtr __fastcall TExcelChart::get_PivotLayout(void)
{
  Excel_2k::PivotLayoutPtr RHS;
  OLECHECK(GetDefaultInterface()->get_PivotLayout(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelChart::get_HasPivotFields(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_HasPivotFields((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelChart::set_HasPivotFields(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_HasPivotFields(RHS/*[in]*/);
}

Office_2k::ScriptsPtr __fastcall TExcelChart::get_Scripts(void)
{
  Office_2k::ScriptsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Scripts(&RHS));
  return RHS;
}

_WorksheetPtr& TExcelWorksheet::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TExcelWorksheet::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TExcelWorksheet::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TExcelWorksheet::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TExcelWorksheet::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TExcelWorksheet::ConnectTo(_WorksheetPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TExcelWorksheet::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_ExcelWorksheet;
  sd.IntfIID = __uuidof(_Worksheet);
  sd.EventIID= __uuidof(DocEvents);
  ServerData = &sd;
}

void __fastcall TExcelWorksheet::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1543: {
      if (OnSelectionChange) {
        (OnSelectionChange)(this, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1537: {
      if (OnBeforeDoubleClick) {
        (OnBeforeDoubleClick)(this, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 1534: {
      if (OnBeforeRightClick) {
        (OnBeforeRightClick)(this, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[0].pdispVal), params[1].pboolVal);
      }
      break;
      }
    case 304: {
      if (OnActivate) {
        (OnActivate)(this);
      }
      break;
      }
    case 1530: {
      if (OnDeactivate) {
        (OnDeactivate)(this);
      }
      break;
      }
    case 279: {
      if (OnCalculate1) {
        (OnCalculate1)(this);
      }
      break;
      }
    case 1545: {
      if (OnChange) {
        (OnChange)(this, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1470: {
      if (OnFollowHyperlink) {
        (OnFollowHyperlink)(this, (Excel_2k::HyperlinkPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TExcelWorksheet::Activate(long lcid/*[in]*/)
{
  GetDefaultInterface()->Activate(lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::Copy(VARIANT Before/*[in,opt]*/, VARIANT After/*[in,opt]*/, 
                                      long lcid/*[in]*/)
{
  GetDefaultInterface()->Copy(Before/*[in,opt]*/, After/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::Delete(long lcid/*[in]*/)
{
  GetDefaultInterface()->Delete(lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::Move(VARIANT Before/*[in,opt]*/, VARIANT After/*[in,opt]*/, 
                                      long lcid/*[in]*/)
{
  GetDefaultInterface()->Move(Before/*[in,opt]*/, After/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::_PrintOut(VARIANT From/*[in,opt]*/, VARIANT To/*[in,opt]*/, 
                                           VARIANT Copies/*[in,opt]*/, VARIANT Preview/*[in,opt]*/, 
                                           VARIANT ActivePrinter/*[in,opt]*/, 
                                           VARIANT PrintToFile/*[in,opt]*/, 
                                           VARIANT Collate/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->_PrintOut(From/*[in,opt]*/, To/*[in,opt]*/, Copies/*[in,opt]*/, 
                                   Preview/*[in,opt]*/, ActivePrinter/*[in,opt]*/, 
                                   PrintToFile/*[in,opt]*/, Collate/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::PrintPreview(VARIANT EnableChanges/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->PrintPreview(EnableChanges/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::Protect(VARIANT Password/*[in,opt]*/, 
                                         VARIANT DrawingObjects/*[in,opt]*/, 
                                         VARIANT Contents/*[in,opt]*/, VARIANT Scenarios/*[in,opt]*/, 
                                         VARIANT UserInterfaceOnly/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Protect(Password/*[in,opt]*/, DrawingObjects/*[in,opt]*/, 
                                 Contents/*[in,opt]*/, Scenarios/*[in,opt]*/, 
                                 UserInterfaceOnly/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::SaveAs(BSTR Filename/*[in]*/, VARIANT FileFormat/*[in,opt]*/, 
                                        VARIANT Password/*[in,opt]*/, 
                                        VARIANT WriteResPassword/*[in,opt]*/, 
                                        VARIANT ReadOnlyRecommended/*[in,opt]*/, 
                                        VARIANT CreateBackup/*[in,opt]*/, 
                                        VARIANT AddToMru/*[in,opt]*/, 
                                        VARIANT TextCodepage/*[in,opt]*/, 
                                        VARIANT TextVisualLayout/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->SaveAs(Filename/*[in]*/, FileFormat/*[in,opt]*/, Password/*[in,opt]*/, 
                                WriteResPassword/*[in,opt]*/, ReadOnlyRecommended/*[in,opt]*/, 
                                CreateBackup/*[in,opt]*/, AddToMru/*[in,opt]*/, 
                                TextCodepage/*[in,opt]*/, TextVisualLayout/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::Select(VARIANT Replace/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Select(Replace/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::Unprotect(VARIANT Password/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Unprotect(Password/*[in,opt]*/, lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelWorksheet::Arcs(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Arcs(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::SetBackgroundPicture(BSTR Filename/*[in]*/)
{
  GetDefaultInterface()->SetBackgroundPicture(Filename/*[in]*/);
}

LPDISPATCH __fastcall TExcelWorksheet::Buttons(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Buttons(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::Calculate(long lcid/*[in]*/)
{
  GetDefaultInterface()->Calculate(lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelWorksheet::ChartObjects(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->ChartObjects(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::CheckBoxes(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->CheckBoxes(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::CheckSpelling(VARIANT CustomDictionary/*[in,opt]*/, 
                                               VARIANT IgnoreUppercase/*[in,opt]*/, 
                                               VARIANT AlwaysSuggest/*[in,opt]*/, 
                                               VARIANT SpellLang/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->CheckSpelling(CustomDictionary/*[in,opt]*/, IgnoreUppercase/*[in,opt]*/, 
                                       AlwaysSuggest/*[in,opt]*/, SpellLang/*[in,opt]*/, 
                                       lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::ClearArrows(long lcid/*[in]*/)
{
  GetDefaultInterface()->ClearArrows(lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelWorksheet::Drawings(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Drawings(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::DrawingObjects(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->DrawingObjects(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::DropDowns(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->DropDowns(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelWorksheet::Evaluate(VARIANT Name/*[in]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->Evaluate(Name, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelWorksheet::_Evaluate(VARIANT Name/*[in]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->_Evaluate(Name, lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::ResetAllPageBreaks(void)
{
  GetDefaultInterface()->ResetAllPageBreaks();
}

LPDISPATCH __fastcall TExcelWorksheet::GroupBoxes(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->GroupBoxes(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::GroupObjects(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->GroupObjects(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::Labels(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Labels(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::Lines(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Lines(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::ListBoxes(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->ListBoxes(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::OLEObjects(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->OLEObjects(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::OptionButtons(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->OptionButtons(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::Ovals(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Ovals(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::Paste(VARIANT Destination/*[in,opt]*/, VARIANT Link/*[in,opt]*/, 
                                       long lcid/*[in]*/)
{
  GetDefaultInterface()->Paste(Destination/*[in,opt]*/, Link/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::PasteSpecial(VARIANT Format/*[in,opt]*/, VARIANT Link/*[in,opt]*/, 
                                              VARIANT DisplayAsIcon/*[in,opt]*/, 
                                              VARIANT IconFileName/*[in,opt]*/, 
                                              VARIANT IconIndex/*[in,opt]*/, 
                                              VARIANT IconLabel/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->PasteSpecial(Format/*[in,opt]*/, Link/*[in,opt]*/, 
                                      DisplayAsIcon/*[in,opt]*/, IconFileName/*[in,opt]*/, 
                                      IconIndex/*[in,opt]*/, IconLabel/*[in,opt]*/, lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelWorksheet::Pictures(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Pictures(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::PivotTables(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->PivotTables(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

Excel_2k::PivotTable* __fastcall TExcelWorksheet::PivotTableWizard(VARIANT SourceType/*[in,opt]*/, 
                                                                   VARIANT SourceData/*[in,opt]*/, 
                                                                   VARIANT TableDestination/*[in,opt]*/, 
                                                                   VARIANT TableName/*[in,opt]*/, 
                                                                   VARIANT RowGrand/*[in,opt]*/, 
                                                                   VARIANT ColumnGrand/*[in,opt]*/, 
                                                                   VARIANT SaveData/*[in,opt]*/, 
                                                                   VARIANT HasAutoFormat/*[in,opt]*/, 
                                                                   VARIANT AutoPage/*[in,opt]*/, 
                                                                   VARIANT Reserved/*[in,opt]*/, 
                                                                   VARIANT BackgroundQuery/*[in,opt]*/, 
                                                                   VARIANT OptimizeCache/*[in,opt]*/, 
                                                                   VARIANT PageFieldOrder/*[in,opt]*/, 
                                                                   VARIANT PageFieldWrapCount/*[in,opt]*/, 
                                                                   VARIANT ReadData/*[in,opt]*/, 
                                                                   VARIANT Connection/*[in,opt]*/, 
                                                                   long lcid/*[in]*/)
{
  Excel_2k::PivotTable* RHS = 0;
  OLECHECK(GetDefaultInterface()->PivotTableWizard(SourceType, SourceData, TableDestination, 
                                                   TableName, RowGrand, ColumnGrand, SaveData, 
                                                   HasAutoFormat, AutoPage, Reserved, 
                                                   BackgroundQuery, OptimizeCache, PageFieldOrder, 
                                                   PageFieldWrapCount, ReadData, Connection, lcid, (Excel_2k::PivotTable**)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::Rectangles(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Rectangles(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::Scenarios(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Scenarios(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::ScrollBars(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->ScrollBars(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::ShowAllData(long lcid/*[in]*/)
{
  GetDefaultInterface()->ShowAllData(lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::ShowDataForm(long lcid/*[in]*/)
{
  GetDefaultInterface()->ShowDataForm(lcid/*[in]*/);
}

LPDISPATCH __fastcall TExcelWorksheet::Spinners(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->Spinners(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::TextBoxes(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->TextBoxes(Index, lcid, (LPDISPATCH*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::ClearCircles(void)
{
  GetDefaultInterface()->ClearCircles();
}

void __fastcall TExcelWorksheet::CircleInvalid(void)
{
  GetDefaultInterface()->CircleInvalid();
}

void __fastcall TExcelWorksheet::PrintOut(VARIANT From/*[in,opt]*/, VARIANT To/*[in,opt]*/, 
                                          VARIANT Copies/*[in,opt]*/, VARIANT Preview/*[in,opt]*/, 
                                          VARIANT ActivePrinter/*[in,opt]*/, 
                                          VARIANT PrintToFile/*[in,opt]*/, 
                                          VARIANT Collate/*[in,opt]*/, 
                                          VARIANT PrToFileName/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->PrintOut(From/*[in,opt]*/, To/*[in,opt]*/, Copies/*[in,opt]*/, 
                                  Preview/*[in,opt]*/, ActivePrinter/*[in,opt]*/, 
                                  PrintToFile/*[in,opt]*/, Collate/*[in,opt]*/, 
                                  PrToFileName/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorksheet::_CheckSpelling(VARIANT CustomDictionary/*[in,opt]*/, 
                                                VARIANT IgnoreUppercase/*[in,opt]*/, 
                                                VARIANT AlwaysSuggest/*[in,opt]*/, 
                                                VARIANT SpellLang/*[in,opt]*/, 
                                                VARIANT IgnoreFinalYaa/*[in,opt]*/, 
                                                VARIANT SpellScript/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->_CheckSpelling(CustomDictionary/*[in,opt]*/, IgnoreUppercase/*[in,opt]*/, 
                                        AlwaysSuggest/*[in,opt]*/, SpellLang/*[in,opt]*/, 
                                        IgnoreFinalYaa/*[in,opt]*/, SpellScript/*[in,opt]*/, 
                                        lcid/*[in]*/);
}

Excel_2k::ExcelApplicationPtr __fastcall TExcelWorksheet::get_Application(void)
{
  Excel_2k::ExcelApplicationPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Application(&RHS));
  return RHS;
}

Excel_2k::XlCreator __fastcall TExcelWorksheet::get_Creator(void)
{
  Excel_2k::XlCreator RHS;
  OLECHECK(GetDefaultInterface()->get_Creator((Excel_2k::XlCreator*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::get_Parent(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorksheet::get_CodeName(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_CodeName((BSTR*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorksheet::get__CodeName(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get__CodeName((BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set__CodeName(BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set__CodeName(RHS/*[in]*/);
}

long __fastcall TExcelWorksheet::get_Index(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_Index(lcid, (long*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorksheet::get_Name(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_Name(BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_Name(RHS/*[in]*/);
}

LPDISPATCH __fastcall TExcelWorksheet::get_Next(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_Next((LPDISPATCH*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorksheet::get_OnDoubleClick(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnDoubleClick(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_OnDoubleClick(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnDoubleClick(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelWorksheet::get_OnSheetActivate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnSheetActivate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_OnSheetActivate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnSheetActivate(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelWorksheet::get_OnSheetDeactivate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnSheetDeactivate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_OnSheetDeactivate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnSheetDeactivate(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::PageSetupPtr __fastcall TExcelWorksheet::get_PageSetup(void)
{
  Excel_2k::PageSetupPtr RHS;
  OLECHECK(GetDefaultInterface()->get_PageSetup(&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorksheet::get_Previous(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_Previous((LPDISPATCH*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_ProtectContents(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectContents(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_ProtectDrawingObjects(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectDrawingObjects(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_ProtectionMode(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectionMode(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_ProtectScenarios(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectScenarios(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

Excel_2k::XlSheetVisibility __fastcall TExcelWorksheet::get_Visible(long lcid/*[in]*/)
{
  Excel_2k::XlSheetVisibility RHS;
  OLECHECK(GetDefaultInterface()->get_Visible(lcid, (Excel_2k::XlSheetVisibility*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_Visible(long lcid/*[in]*/, 
                                             Excel_2k::XlSheetVisibility RHS/*[in]*/)
{
  GetDefaultInterface()->set_Visible(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::ShapesPtr __fastcall TExcelWorksheet::get_Shapes(void)
{
  Excel_2k::ShapesPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Shapes(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_TransitionExpEval(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_TransitionExpEval(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_TransitionExpEval(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_TransitionExpEval(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_AutoFilterMode(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_AutoFilterMode(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_AutoFilterMode(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_AutoFilterMode(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_EnableCalculation(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnableCalculation((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_EnableCalculation(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableCalculation(RHS/*[in]*/);
}

Excel_2k::ExcelRangePtr __fastcall TExcelWorksheet::get_Cells(void)
{
  Excel_2k::ExcelRangePtr RHS;
  OLECHECK(GetDefaultInterface()->get_Cells(&RHS));
  return RHS;
}

Excel_2k::ExcelRange* __fastcall TExcelWorksheet::get_CircularReference(long lcid/*[in]*/)
{
  Excel_2k::ExcelRange* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_CircularReference(lcid, (Excel_2k::ExcelRange**)&RHS));
  return RHS;
}

Excel_2k::ExcelRangePtr __fastcall TExcelWorksheet::get_Columns(void)
{
  Excel_2k::ExcelRangePtr RHS;
  OLECHECK(GetDefaultInterface()->get_Columns(&RHS));
  return RHS;
}

Excel_2k::XlConsolidationFunction __fastcall TExcelWorksheet::get_ConsolidationFunction(long lcid/*[in]*/)
{
  Excel_2k::XlConsolidationFunction RHS;
  OLECHECK(GetDefaultInterface()->get_ConsolidationFunction(lcid, (Excel_2k::XlConsolidationFunction*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelWorksheet::get_ConsolidationOptions(long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_ConsolidationOptions(lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelWorksheet::get_ConsolidationSources(long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_ConsolidationSources(lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_DisplayAutomaticPageBreaks(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayAutomaticPageBreaks(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_DisplayAutomaticPageBreaks(long lcid/*[in]*/, 
                                                                VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayAutomaticPageBreaks(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_EnableAutoFilter(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnableAutoFilter(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_EnableAutoFilter(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableAutoFilter(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlEnableSelection __fastcall TExcelWorksheet::get_EnableSelection(void)
{
  Excel_2k::XlEnableSelection RHS;
  OLECHECK(GetDefaultInterface()->get_EnableSelection((Excel_2k::XlEnableSelection*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_EnableSelection(Excel_2k::XlEnableSelection RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableSelection(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_EnableOutlining(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnableOutlining(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_EnableOutlining(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnableOutlining(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_EnablePivotTable(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnablePivotTable(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_EnablePivotTable(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnablePivotTable(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_FilterMode(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_FilterMode(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

Excel_2k::NamesPtr __fastcall TExcelWorksheet::get_Names(void)
{
  Excel_2k::NamesPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Names(&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorksheet::get_OnCalculate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnCalculate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_OnCalculate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnCalculate(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelWorksheet::get_OnData(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnData(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_OnData(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnData(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelWorksheet::get_OnEntry(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnEntry(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_OnEntry(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnEntry(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::OutlinePtr __fastcall TExcelWorksheet::get_Outline(void)
{
  Excel_2k::OutlinePtr RHS;
  OLECHECK(GetDefaultInterface()->get_Outline(&RHS));
  return RHS;
}

Excel_2k::ExcelRange* __fastcall TExcelWorksheet::get_Range(VARIANT Cell1/*[in]*/, 
                                                            VARIANT Cell2/*[in,opt]*/)
{
  Excel_2k::ExcelRange* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Range(Cell1, Cell2, (Excel_2k::ExcelRange**)&RHS));
  return RHS;
}

Excel_2k::ExcelRangePtr __fastcall TExcelWorksheet::get_Rows(void)
{
  Excel_2k::ExcelRangePtr RHS;
  OLECHECK(GetDefaultInterface()->get_Rows(&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorksheet::get_ScrollArea(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_ScrollArea((BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_ScrollArea(BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_ScrollArea(RHS/*[in]*/);
}

double __fastcall TExcelWorksheet::get_StandardHeight(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_StandardHeight(lcid, (double*)&RHS));
  return RHS;
}

double __fastcall TExcelWorksheet::get_StandardWidth(long lcid/*[in]*/)
{
  double RHS;
  OLECHECK(GetDefaultInterface()->get_StandardWidth(lcid, (double*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_StandardWidth(long lcid/*[in]*/, double RHS/*[in]*/)
{
  GetDefaultInterface()->set_StandardWidth(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_TransitionFormEntry(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_TransitionFormEntry(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_TransitionFormEntry(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_TransitionFormEntry(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlSheetType __fastcall TExcelWorksheet::get_Type(long lcid/*[in]*/)
{
  Excel_2k::XlSheetType RHS;
  OLECHECK(GetDefaultInterface()->get_Type(lcid, (Excel_2k::XlSheetType*)&RHS));
  return RHS;
}

Excel_2k::ExcelRange* __fastcall TExcelWorksheet::get_UsedRange(long lcid/*[in]*/)
{
  Excel_2k::ExcelRange* RHS = 0;
  OLECHECK(GetDefaultInterface()->get_UsedRange(lcid, (Excel_2k::ExcelRange**)&RHS));
  return RHS;
}

Excel_2k::HPageBreaksPtr __fastcall TExcelWorksheet::get_HPageBreaks(void)
{
  Excel_2k::HPageBreaksPtr RHS;
  OLECHECK(GetDefaultInterface()->get_HPageBreaks(&RHS));
  return RHS;
}

Excel_2k::VPageBreaksPtr __fastcall TExcelWorksheet::get_VPageBreaks(void)
{
  Excel_2k::VPageBreaksPtr RHS;
  OLECHECK(GetDefaultInterface()->get_VPageBreaks(&RHS));
  return RHS;
}

Excel_2k::QueryTablesPtr __fastcall TExcelWorksheet::get_QueryTables(void)
{
  Excel_2k::QueryTablesPtr RHS;
  OLECHECK(GetDefaultInterface()->get_QueryTables(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_DisplayPageBreaks(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayPageBreaks((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_DisplayPageBreaks(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayPageBreaks(RHS/*[in]*/);
}

Excel_2k::CommentsPtr __fastcall TExcelWorksheet::get_Comments(void)
{
  Excel_2k::CommentsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Comments(&RHS));
  return RHS;
}

Excel_2k::HyperlinksPtr __fastcall TExcelWorksheet::get_Hyperlinks(void)
{
  Excel_2k::HyperlinksPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Hyperlinks(&RHS));
  return RHS;
}

long __fastcall TExcelWorksheet::get__DisplayRightToLeft(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get__DisplayRightToLeft(lcid, (long*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set__DisplayRightToLeft(long lcid/*[in]*/, long RHS/*[in]*/)
{
  GetDefaultInterface()->set__DisplayRightToLeft(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::AutoFilterPtr __fastcall TExcelWorksheet::get_AutoFilter(void)
{
  Excel_2k::AutoFilterPtr RHS;
  OLECHECK(GetDefaultInterface()->get_AutoFilter(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorksheet::get_DisplayRightToLeft(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayRightToLeft(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorksheet::set_DisplayRightToLeft(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayRightToLeft(lcid/*[in]*/, RHS/*[in]*/);
}

Office_2k::ScriptsPtr __fastcall TExcelWorksheet::get_Scripts(void)
{
  Office_2k::ScriptsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Scripts(&RHS));
  return RHS;
}

_WorkbookPtr& TExcelWorkbook::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TExcelWorkbook::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TExcelWorkbook::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TExcelWorkbook::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TExcelWorkbook::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TExcelWorkbook::ConnectTo(_WorkbookPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TExcelWorkbook::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_ExcelWorkbook;
  sd.IntfIID = __uuidof(_Workbook);
  sd.EventIID= __uuidof(WorkbookEvents);
  ServerData = &sd;
}

void __fastcall TExcelWorkbook::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 682: {
      if (OnOpen) {
        (OnOpen)(this);
      }
      break;
      }
    case 304: {
      if (OnActivate) {
        (OnActivate)(this);
      }
      break;
      }
    case 1530: {
      if (OnDeactivate) {
        (OnDeactivate)(this);
      }
      break;
      }
    case 1546: {
      if (OnBeforeClose) {
        (OnBeforeClose)(this, params[0].pboolVal);
      }
      break;
      }
    case 1547: {
      if (OnBeforeSave) {
        (OnBeforeSave)(this, params[0], params[1].pboolVal);
      }
      break;
      }
    case 1549: {
      if (OnBeforePrint) {
        (OnBeforePrint)(this, params[0].pboolVal);
      }
      break;
      }
    case 1550: {
      if (OnNewSheet) {
        (OnNewSheet)(this, params[0].pdispVal);
      }
      break;
      }
    case 1552: {
      if (OnAddinInstall) {
        (OnAddinInstall)(this);
      }
      break;
      }
    case 1553: {
      if (OnAddinUninstall) {
        (OnAddinUninstall)(this);
      }
      break;
      }
    case 1554: {
      if (OnWindowResize) {
        (OnWindowResize)(this, (Excel_2k::WINDOWPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1556: {
      if (OnWindowActivate) {
        (OnWindowActivate)(this, (Excel_2k::WINDOWPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1557: {
      if (OnWindowDeactivate) {
        (OnWindowDeactivate)(this, (Excel_2k::WINDOWPtr)(LPDISPATCH)(params[0].pdispVal));
      }
      break;
      }
    case 1558: {
      if (OnSheetSelectionChange) {
        (OnSheetSelectionChange)(this, params[0].pdispVal, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 1559: {
      if (OnSheetBeforeDoubleClick) {
        (OnSheetBeforeDoubleClick)(this, params[0].pdispVal, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[1].pdispVal), params[2].pboolVal);
      }
      break;
      }
    case 1560: {
      if (OnSheetBeforeRightClick) {
        (OnSheetBeforeRightClick)(this, params[0].pdispVal, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[1].pdispVal), params[2].pboolVal);
      }
      break;
      }
    case 1561: {
      if (OnSheetActivate1) {
        (OnSheetActivate1)(this, params[0].pdispVal);
      }
      break;
      }
    case 1562: {
      if (OnSheetDeactivate1) {
        (OnSheetDeactivate1)(this, params[0].pdispVal);
      }
      break;
      }
    case 1563: {
      if (OnSheetCalculate) {
        (OnSheetCalculate)(this, params[0].pdispVal);
      }
      break;
      }
    case 1564: {
      if (OnSheetChange) {
        (OnSheetChange)(this, params[0].pdispVal, (Excel_2k::ExcelRangePtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    case 1854: {
      if (OnSheetFollowHyperlink) {
        (OnSheetFollowHyperlink)(this, params[0].pdispVal, (Excel_2k::HyperlinkPtr)(LPDISPATCH)(params[1].pdispVal));
      }
      break;
      }
    default:
      break;
  }
}

void __fastcall TExcelWorkbook::Activate(long lcid/*[in]*/)
{
  GetDefaultInterface()->Activate(lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::ChangeFileAccess(Excel_2k::XlFileAccess Mode/*[in]*/, 
                                                 VARIANT WritePassword/*[in,opt]*/, 
                                                 VARIANT Notify/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->ChangeFileAccess(Mode/*[in]*/, WritePassword/*[in,opt]*/, 
                                          Notify/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::ChangeLink(BSTR Name/*[in]*/, BSTR NewName/*[in]*/, 
                                           Excel_2k::XlLinkType Type/*[in,def,opt]*/, 
                                           long lcid/*[in]*/)
{
  GetDefaultInterface()->ChangeLink(Name/*[in]*/, NewName/*[in]*/, Type/*[in,def,opt]*/, 
                                    lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::Close(VARIANT SaveChanges/*[in,opt]*/, VARIANT Filename/*[in,opt]*/, 
                                      VARIANT RouteWorkbook/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Close(SaveChanges/*[in,opt]*/, Filename/*[in,opt]*/, 
                               RouteWorkbook/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::DeleteNumberFormat(BSTR NumberFormat/*[in]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->DeleteNumberFormat(NumberFormat/*[in]*/, lcid/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::ExclusiveAccess(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->ExclusiveAccess(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::ForwardMailer(long lcid/*[in]*/)
{
  GetDefaultInterface()->ForwardMailer(lcid/*[in]*/);
}

VARIANT __fastcall TExcelWorkbook::LinkInfo(BSTR Name/*[in]*/, Excel_2k::XlLinkInfo LinkInfo/*[in]*/, 
                                            VARIANT Type/*[in,opt]*/, VARIANT EditionRef/*[in,opt]*/, 
                                            long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->LinkInfo(Name, LinkInfo, Type, EditionRef, lcid, (VARIANT*)&RHS));
  return RHS;
}

VARIANT __fastcall TExcelWorkbook::LinkSources(VARIANT Type/*[in,opt]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->LinkSources(Type, lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::MergeWorkbook(VARIANT Filename/*[in]*/)
{
  GetDefaultInterface()->MergeWorkbook(Filename/*[in]*/);
}

Excel_2k::WINDOW* __fastcall TExcelWorkbook::NewWindow(long lcid/*[in]*/)
{
  Excel_2k::WINDOW* RHS = 0;
  OLECHECK(GetDefaultInterface()->NewWindow(lcid, (Excel_2k::WINDOW**)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::OpenLinks(BSTR Name/*[in]*/, VARIANT ReadOnly/*[in,opt]*/, 
                                          VARIANT Type/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->OpenLinks(Name/*[in]*/, ReadOnly/*[in,opt]*/, Type/*[in,opt]*/, 
                                   lcid/*[in]*/);
}

Excel_2k::PivotCaches* __fastcall TExcelWorkbook::PivotCaches(void)
{
  Excel_2k::PivotCaches* RHS = 0;
  OLECHECK(GetDefaultInterface()->PivotCaches((Excel_2k::PivotCaches**)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::Post(VARIANT DestName/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Post(DestName/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::_PrintOut(VARIANT From/*[in,opt]*/, VARIANT To/*[in,opt]*/, 
                                          VARIANT Copies/*[in,opt]*/, VARIANT Preview/*[in,opt]*/, 
                                          VARIANT ActivePrinter/*[in,opt]*/, 
                                          VARIANT PrintToFile/*[in,opt]*/, 
                                          VARIANT Collate/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->_PrintOut(From/*[in,opt]*/, To/*[in,opt]*/, Copies/*[in,opt]*/, 
                                   Preview/*[in,opt]*/, ActivePrinter/*[in,opt]*/, 
                                   PrintToFile/*[in,opt]*/, Collate/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::PrintPreview(VARIANT EnableChanges/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->PrintPreview(EnableChanges/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::Protect(VARIANT Password/*[in,opt]*/, VARIANT Structure/*[in,opt]*/, 
                                        VARIANT Windoz/*[in,opt]*/)
{
  GetDefaultInterface()->Protect(Password/*[in,opt]*/, Structure/*[in,opt]*/, Windoz/*[in,opt]*/);
}

void __fastcall TExcelWorkbook::ProtectSharing(VARIANT Filename/*[in,opt]*/, 
                                               VARIANT Password/*[in,opt]*/, 
                                               VARIANT WriteResPassword/*[in,opt]*/, 
                                               VARIANT ReadOnlyRecommended/*[in,opt]*/, 
                                               VARIANT CreateBackup/*[in,opt]*/, 
                                               VARIANT SharingPassword/*[in,opt]*/)
{
  GetDefaultInterface()->ProtectSharing(Filename/*[in,opt]*/, Password/*[in,opt]*/, 
                                        WriteResPassword/*[in,opt]*/, 
                                        ReadOnlyRecommended/*[in,opt]*/, CreateBackup/*[in,opt]*/, 
                                        SharingPassword/*[in,opt]*/);
}

void __fastcall TExcelWorkbook::RefreshAll(void)
{
  GetDefaultInterface()->RefreshAll();
}

void __fastcall TExcelWorkbook::Reply(long lcid/*[in]*/)
{
  GetDefaultInterface()->Reply(lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::ReplyAll(long lcid/*[in]*/)
{
  GetDefaultInterface()->ReplyAll(lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::RemoveUser(long Index/*[in]*/)
{
  GetDefaultInterface()->RemoveUser(Index/*[in]*/);
}

void __fastcall TExcelWorkbook::Route(long lcid/*[in]*/)
{
  GetDefaultInterface()->Route(lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::RunAutoMacros(Excel_2k::XlRunAutoMacro Which/*[in]*/, 
                                              long lcid/*[in]*/)
{
  GetDefaultInterface()->RunAutoMacros(Which/*[in]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::Save(long lcid/*[in]*/)
{
  GetDefaultInterface()->Save(lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::SaveAs(VARIANT Filename/*[in,opt]*/, VARIANT FileFormat/*[in,opt]*/, 
                                       VARIANT Password/*[in,opt]*/, 
                                       VARIANT WriteResPassword/*[in,opt]*/, 
                                       VARIANT ReadOnlyRecommended/*[in,opt]*/, 
                                       VARIANT CreateBackup/*[in,opt]*/, 
                                       Excel_2k::XlSaveAsAccessMode AccessMode/*[in,def,opt]*/, 
                                       VARIANT ConflictResolution/*[in,opt]*/, 
                                       VARIANT AddToMru/*[in,opt]*/, 
                                       VARIANT TextCodepage/*[in,opt]*/, 
                                       VARIANT TextVisualLayout/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->SaveAs(Filename/*[in,opt]*/, FileFormat/*[in,opt]*/, Password/*[in,opt]*/, 
                                WriteResPassword/*[in,opt]*/, ReadOnlyRecommended/*[in,opt]*/, 
                                CreateBackup/*[in,opt]*/, AccessMode/*[in,def,opt]*/, 
                                ConflictResolution/*[in,opt]*/, AddToMru/*[in,opt]*/, 
                                TextCodepage/*[in,opt]*/, TextVisualLayout/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::SaveCopyAs(VARIANT Filename/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->SaveCopyAs(Filename/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::SendMail(VARIANT Recipients/*[in]*/, VARIANT Subject/*[in,opt]*/, 
                                         VARIANT ReturnReceipt/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->SendMail(Recipients/*[in]*/, Subject/*[in,opt]*/, ReturnReceipt/*[in,opt]*/, 
                                  lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::SendMailer(VARIANT FileFormat/*[in,opt]*/, 
                                           Excel_2k::XlPriority Priority/*[in,def,opt]*/, 
                                           long lcid/*[in]*/)
{
  GetDefaultInterface()->SendMailer(FileFormat/*[in,opt]*/, Priority/*[in,def,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::SetLinkOnData(BSTR Name/*[in]*/, VARIANT Procedure/*[in,opt]*/, 
                                              long lcid/*[in]*/)
{
  GetDefaultInterface()->SetLinkOnData(Name/*[in]*/, Procedure/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::Unprotect(VARIANT Password/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->Unprotect(Password/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::UnprotectSharing(VARIANT SharingPassword/*[in,opt]*/)
{
  GetDefaultInterface()->UnprotectSharing(SharingPassword/*[in,opt]*/);
}

void __fastcall TExcelWorkbook::UpdateFromFile(long lcid/*[in]*/)
{
  GetDefaultInterface()->UpdateFromFile(lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::UpdateLink(VARIANT Name/*[in,opt]*/, VARIANT Type/*[in,opt]*/, 
                                           long lcid/*[in]*/)
{
  GetDefaultInterface()->UpdateLink(Name/*[in,opt]*/, Type/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::HighlightChangesOptions(VARIANT When/*[in,opt]*/, 
                                                        VARIANT Who/*[in,opt]*/, 
                                                        VARIANT Where/*[in,opt]*/)
{
  GetDefaultInterface()->HighlightChangesOptions(When/*[in,opt]*/, Who/*[in,opt]*/, 
                                                 Where/*[in,opt]*/);
}

void __fastcall TExcelWorkbook::PurgeChangeHistoryNow(long Days/*[in]*/, 
                                                      VARIANT SharingPassword/*[in,opt]*/)
{
  GetDefaultInterface()->PurgeChangeHistoryNow(Days/*[in]*/, SharingPassword/*[in,opt]*/);
}

void __fastcall TExcelWorkbook::AcceptAllChanges(VARIANT When/*[in,opt]*/, VARIANT Who/*[in,opt]*/, 
                                                 VARIANT Where/*[in,opt]*/)
{
  GetDefaultInterface()->AcceptAllChanges(When/*[in,opt]*/, Who/*[in,opt]*/, Where/*[in,opt]*/);
}

void __fastcall TExcelWorkbook::RejectAllChanges(VARIANT When/*[in,opt]*/, VARIANT Who/*[in,opt]*/, 
                                                 VARIANT Where/*[in,opt]*/)
{
  GetDefaultInterface()->RejectAllChanges(When/*[in,opt]*/, Who/*[in,opt]*/, Where/*[in,opt]*/);
}

void __fastcall TExcelWorkbook::PivotTableWizard(VARIANT SourceType/*[in,opt]*/, 
                                                 VARIANT SourceData/*[in,opt]*/, 
                                                 VARIANT TableDestination/*[in,opt]*/, 
                                                 VARIANT TableName/*[in,opt]*/, 
                                                 VARIANT RowGrand/*[in,opt]*/, 
                                                 VARIANT ColumnGrand/*[in,opt]*/, 
                                                 VARIANT SaveData/*[in,opt]*/, 
                                                 VARIANT HasAutoFormat/*[in,opt]*/, 
                                                 VARIANT AutoPage/*[in,opt]*/, 
                                                 VARIANT Reserved/*[in,opt]*/, 
                                                 VARIANT BackgroundQuery/*[in,opt]*/, 
                                                 VARIANT OptimizeCache/*[in,opt]*/, 
                                                 VARIANT PageFieldOrder/*[in,opt]*/, 
                                                 VARIANT PageFieldWrapCount/*[in,opt]*/, 
                                                 VARIANT ReadData/*[in,opt]*/, 
                                                 VARIANT Connection/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->PivotTableWizard(SourceType/*[in,opt]*/, SourceData/*[in,opt]*/, 
                                          TableDestination/*[in,opt]*/, TableName/*[in,opt]*/, 
                                          RowGrand/*[in,opt]*/, ColumnGrand/*[in,opt]*/, 
                                          SaveData/*[in,opt]*/, HasAutoFormat/*[in,opt]*/, 
                                          AutoPage/*[in,opt]*/, Reserved/*[in,opt]*/, 
                                          BackgroundQuery/*[in,opt]*/, OptimizeCache/*[in,opt]*/, 
                                          PageFieldOrder/*[in,opt]*/, PageFieldWrapCount/*[in,opt]*/, 
                                          ReadData/*[in,opt]*/, Connection/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::ResetColors(void)
{
  GetDefaultInterface()->ResetColors();
}

void __fastcall TExcelWorkbook::FollowHyperlink(BSTR Address/*[in]*/, VARIANT SubAddress/*[in,opt]*/, 
                                                VARIANT NewWindow/*[in,opt]*/, 
                                                VARIANT AddHistory/*[in,opt]*/, 
                                                VARIANT ExtraInfo/*[in,opt]*/, 
                                                VARIANT Method/*[in,opt]*/, 
                                                VARIANT HeaderInfo/*[in,opt]*/)
{
  GetDefaultInterface()->FollowHyperlink(Address/*[in]*/, SubAddress/*[in,opt]*/, 
                                         NewWindow/*[in,opt]*/, AddHistory/*[in,opt]*/, 
                                         ExtraInfo/*[in,opt]*/, Method/*[in,opt]*/, 
                                         HeaderInfo/*[in,opt]*/);
}

void __fastcall TExcelWorkbook::AddToFavorites(void)
{
  GetDefaultInterface()->AddToFavorites();
}

void __fastcall TExcelWorkbook::PrintOut(VARIANT From/*[in,opt]*/, VARIANT To/*[in,opt]*/, 
                                         VARIANT Copies/*[in,opt]*/, VARIANT Preview/*[in,opt]*/, 
                                         VARIANT ActivePrinter/*[in,opt]*/, 
                                         VARIANT PrintToFile/*[in,opt]*/, 
                                         VARIANT Collate/*[in,opt]*/, 
                                         VARIANT PrToFileName/*[in,opt]*/, long lcid/*[in]*/)
{
  GetDefaultInterface()->PrintOut(From/*[in,opt]*/, To/*[in,opt]*/, Copies/*[in,opt]*/, 
                                  Preview/*[in,opt]*/, ActivePrinter/*[in,opt]*/, 
                                  PrintToFile/*[in,opt]*/, Collate/*[in,opt]*/, 
                                  PrToFileName/*[in,opt]*/, lcid/*[in]*/);
}

void __fastcall TExcelWorkbook::WebPagePreview(void)
{
  GetDefaultInterface()->WebPagePreview();
}

void __fastcall TExcelWorkbook::ReloadAs(Office_2k::MsoEncoding Encoding/*[in]*/)
{
  GetDefaultInterface()->ReloadAs(Encoding/*[in]*/);
}

void __fastcall TExcelWorkbook::Dummy1(long unused/*[in]*/)
{
  GetDefaultInterface()->Dummy1(unused/*[in]*/);
}

void __fastcall TExcelWorkbook::sblt(BSTR s/*[in]*/)
{
  GetDefaultInterface()->sblt(s/*[in]*/);
}

Excel_2k::ExcelApplicationPtr __fastcall TExcelWorkbook::get_Application(void)
{
  Excel_2k::ExcelApplicationPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Application(&RHS));
  return RHS;
}

Excel_2k::XlCreator __fastcall TExcelWorkbook::get_Creator(void)
{
  Excel_2k::XlCreator RHS;
  OLECHECK(GetDefaultInterface()->get_Creator((Excel_2k::XlCreator*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorkbook::get_Parent(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_Parent((LPDISPATCH*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_AcceptLabelsInFormulas(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_AcceptLabelsInFormulas((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_AcceptLabelsInFormulas(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_AcceptLabelsInFormulas(RHS/*[in]*/);
}

Excel_2k::ExcelChartPtr __fastcall TExcelWorkbook::get_ActiveChart(void)
{
  Excel_2k::ExcelChartPtr RHS;
  OLECHECK(GetDefaultInterface()->get_ActiveChart(&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorkbook::get_ActiveSheet(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_ActiveSheet((LPDISPATCH*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorkbook::get_Author(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Author(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_Author(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_Author(lcid/*[in]*/, RHS/*[in]*/);
}

long __fastcall TExcelWorkbook::get_AutoUpdateFrequency(void)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_AutoUpdateFrequency((long*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_AutoUpdateFrequency(long RHS/*[in]*/)
{
  GetDefaultInterface()->set_AutoUpdateFrequency(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_AutoUpdateSaveChanges(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_AutoUpdateSaveChanges((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_AutoUpdateSaveChanges(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_AutoUpdateSaveChanges(RHS/*[in]*/);
}

long __fastcall TExcelWorkbook::get_ChangeHistoryDuration(void)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_ChangeHistoryDuration((long*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_ChangeHistoryDuration(long RHS/*[in]*/)
{
  GetDefaultInterface()->set_ChangeHistoryDuration(RHS/*[in]*/);
}

LPDISPATCH __fastcall TExcelWorkbook::get_BuiltinDocumentProperties(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_BuiltinDocumentProperties((LPDISPATCH*)&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelWorkbook::get_Charts(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Charts(&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorkbook::get_CodeName(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_CodeName((BSTR*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorkbook::get__CodeName(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get__CodeName((BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set__CodeName(BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set__CodeName(RHS/*[in]*/);
}

VARIANT __fastcall TExcelWorkbook::get_Colors(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_Colors(Index, lcid, (VARIANT*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_Colors(VARIANT Index/*[in,opt]*/, long lcid/*[in]*/, 
                                           VARIANT RHS/*[in]*/)
{
  GetDefaultInterface()->set_Colors(Index/*[in,opt]*/, lcid/*[in]*/, RHS/*[in]*/);
}

Office_2k::CommandBarsPtr __fastcall TExcelWorkbook::get_CommandBars(void)
{
  Office_2k::CommandBarsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_CommandBars(&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorkbook::get_Comments(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Comments(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_Comments(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_Comments(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlSaveConflictResolution __fastcall TExcelWorkbook::get_ConflictResolution(void)
{
  Excel_2k::XlSaveConflictResolution RHS;
  OLECHECK(GetDefaultInterface()->get_ConflictResolution((Excel_2k::XlSaveConflictResolution*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_ConflictResolution(Excel_2k::XlSaveConflictResolution RHS/*[in]*/)
{
  GetDefaultInterface()->set_ConflictResolution(RHS/*[in]*/);
}

LPDISPATCH __fastcall TExcelWorkbook::get_Container(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_Container((LPDISPATCH*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_CreateBackup(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_CreateBackup(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

LPDISPATCH __fastcall TExcelWorkbook::get_CustomDocumentProperties(void)
{
  LPDISPATCH RHS;
  OLECHECK(GetDefaultInterface()->get_CustomDocumentProperties((LPDISPATCH*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_Date1904(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_Date1904(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_Date1904(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_Date1904(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::SheetsPtr __fastcall TExcelWorkbook::get_DialogSheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_DialogSheets(&RHS));
  return RHS;
}

Excel_2k::xlDisplayDrawingObjects __fastcall TExcelWorkbook::get_DisplayDrawingObjects(long lcid/*[in]*/)
{
  Excel_2k::xlDisplayDrawingObjects RHS;
  OLECHECK(GetDefaultInterface()->get_DisplayDrawingObjects(lcid, (Excel_2k::xlDisplayDrawingObjects*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_DisplayDrawingObjects(long lcid/*[in]*/, 
                                                          Excel_2k::xlDisplayDrawingObjects RHS/*[in]*/)
{
  GetDefaultInterface()->set_DisplayDrawingObjects(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::XlFileFormat __fastcall TExcelWorkbook::get_FileFormat(long lcid/*[in]*/)
{
  Excel_2k::XlFileFormat RHS;
  OLECHECK(GetDefaultInterface()->get_FileFormat(lcid, (Excel_2k::XlFileFormat*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorkbook::get_FullName(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_FullName(lcid, (BSTR*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_HasMailer(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_HasMailer(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_HasMailer(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_HasMailer(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_HasPassword(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_HasPassword(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_HasRoutingSlip(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_HasRoutingSlip(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_HasRoutingSlip(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_HasRoutingSlip(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_IsAddin(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_IsAddin((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_IsAddin(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_IsAddin(RHS/*[in]*/);
}

BSTR __fastcall TExcelWorkbook::get_Keywords(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Keywords(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_Keywords(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_Keywords(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::MailerPtr __fastcall TExcelWorkbook::get_Mailer(void)
{
  Excel_2k::MailerPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Mailer(&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelWorkbook::get_Modules(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Modules(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_MultiUserEditing(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_MultiUserEditing(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorkbook::get_Name(void)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Name((BSTR*)&RHS));
  return RHS;
}

Excel_2k::NamesPtr __fastcall TExcelWorkbook::get_Names(void)
{
  Excel_2k::NamesPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Names(&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorkbook::get_OnSave(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnSave(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_OnSave(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnSave(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelWorkbook::get_OnSheetActivate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnSheetActivate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_OnSheetActivate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnSheetActivate(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelWorkbook::get_OnSheetDeactivate(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_OnSheetDeactivate(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_OnSheetDeactivate(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_OnSheetDeactivate(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelWorkbook::get_Path(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Path(lcid, (BSTR*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_PersonalViewListSettings(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_PersonalViewListSettings((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_PersonalViewListSettings(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_PersonalViewListSettings(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_PersonalViewPrintSettings(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_PersonalViewPrintSettings((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_PersonalViewPrintSettings(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_PersonalViewPrintSettings(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_PrecisionAsDisplayed(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_PrecisionAsDisplayed(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_PrecisionAsDisplayed(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_PrecisionAsDisplayed(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_ProtectStructure(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectStructure((VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_ProtectWindows(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ProtectWindows((VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_ReadOnly(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ReadOnly(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_ReadOnlyRecommended(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ReadOnlyRecommended(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

long __fastcall TExcelWorkbook::get_RevisionNumber(long lcid/*[in]*/)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_RevisionNumber(lcid, (long*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_Routed(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_Routed(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

Excel_2k::RoutingSlipPtr __fastcall TExcelWorkbook::get_RoutingSlip(void)
{
  Excel_2k::RoutingSlipPtr RHS;
  OLECHECK(GetDefaultInterface()->get_RoutingSlip(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_Saved(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_Saved(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_Saved(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_Saved(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_SaveLinkValues(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_SaveLinkValues(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_SaveLinkValues(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_SaveLinkValues(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::SheetsPtr __fastcall TExcelWorkbook::get_Sheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Sheets(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_ShowConflictHistory(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ShowConflictHistory(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_ShowConflictHistory(long lcid/*[in]*/, VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ShowConflictHistory(lcid/*[in]*/, RHS/*[in]*/);
}

Excel_2k::StylesPtr __fastcall TExcelWorkbook::get_Styles(void)
{
  Excel_2k::StylesPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Styles(&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorkbook::get_Subject(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Subject(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_Subject(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_Subject(lcid/*[in]*/, RHS/*[in]*/);
}

BSTR __fastcall TExcelWorkbook::get_Title(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_Title(lcid, (BSTR*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_Title(long lcid/*[in]*/, BSTR RHS/*[in]*/)
{
  GetDefaultInterface()->set_Title(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_UpdateRemoteReferences(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_UpdateRemoteReferences(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_UpdateRemoteReferences(long lcid/*[in]*/, 
                                                           VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_UpdateRemoteReferences(lcid/*[in]*/, RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_UserControl(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_UserControl((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_UserControl(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_UserControl(RHS/*[in]*/);
}

VARIANT __fastcall TExcelWorkbook::get_UserStatus(long lcid/*[in]*/)
{
  VARIANT RHS;
  OLECHECK(GetDefaultInterface()->get_UserStatus(lcid, (VARIANT*)&RHS));
  return RHS;
}

Excel_2k::CustomViewsPtr __fastcall TExcelWorkbook::get_CustomViews(void)
{
  Excel_2k::CustomViewsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_CustomViews(&RHS));
  return RHS;
}

Excel_2k::WindowsPtr __fastcall TExcelWorkbook::get_Windoz(void)
{
  Excel_2k::WindowsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Windoz(&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelWorkbook::get_Worksheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Worksheets(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_WriteReserved(long lcid/*[in]*/)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_WriteReserved(lcid, (VARIANT_BOOL*)&RHS));
  return RHS;
}

BSTR __fastcall TExcelWorkbook::get_WriteReservedBy(long lcid/*[in]*/)
{
  BSTR RHS = 0;
  OLECHECK(GetDefaultInterface()->get_WriteReservedBy(lcid, (BSTR*)&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelWorkbook::get_Excel4IntlMacroSheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Excel4IntlMacroSheets(&RHS));
  return RHS;
}

Excel_2k::SheetsPtr __fastcall TExcelWorkbook::get_Excel4MacroSheets(void)
{
  Excel_2k::SheetsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_Excel4MacroSheets(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_TemplateRemoveExtData(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_TemplateRemoveExtData((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_TemplateRemoveExtData(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_TemplateRemoveExtData(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_HighlightChangesOnScreen(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_HighlightChangesOnScreen((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_HighlightChangesOnScreen(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_HighlightChangesOnScreen(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_KeepChangeHistory(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_KeepChangeHistory((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_KeepChangeHistory(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_KeepChangeHistory(RHS/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_ListChangesOnNewSheet(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_ListChangesOnNewSheet((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_ListChangesOnNewSheet(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_ListChangesOnNewSheet(RHS/*[in]*/);
}

Vbide_2k::VBProjectPtr __fastcall TExcelWorkbook::get_VBProject(void)
{
  Vbide_2k::VBProjectPtr RHS;
  OLECHECK(GetDefaultInterface()->get_VBProject(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_IsInplace(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_IsInplace((VARIANT_BOOL*)&RHS));
  return RHS;
}

Excel_2k::PublishObjectsPtr __fastcall TExcelWorkbook::get_PublishObjects(void)
{
  Excel_2k::PublishObjectsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_PublishObjects(&RHS));
  return RHS;
}

Excel_2k::WebOptionsPtr __fastcall TExcelWorkbook::get_WebOptions(void)
{
  Excel_2k::WebOptionsPtr RHS;
  OLECHECK(GetDefaultInterface()->get_WebOptions(&RHS));
  return RHS;
}

Office_2k::HTMLProjectPtr __fastcall TExcelWorkbook::get_HTMLProject(void)
{
  Office_2k::HTMLProjectPtr RHS;
  OLECHECK(GetDefaultInterface()->get_HTMLProject(&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_EnvelopeVisible(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_EnvelopeVisible((VARIANT_BOOL*)&RHS));
  return RHS;
}

void __fastcall TExcelWorkbook::set_EnvelopeVisible(VARIANT_BOOL RHS/*[in]*/)
{
  GetDefaultInterface()->set_EnvelopeVisible(RHS/*[in]*/);
}

long __fastcall TExcelWorkbook::get_CalculationVersion(void)
{
  long RHS;
  OLECHECK(GetDefaultInterface()->get_CalculationVersion((long*)&RHS));
  return RHS;
}

VARIANT_BOOL __fastcall TExcelWorkbook::get_VBASigned(void)
{
  VARIANT_BOOL RHS;
  OLECHECK(GetDefaultInterface()->get_VBASigned((VARIANT_BOOL*)&RHS));
  return RHS;
}

_OLEObjectPtr& TExcelOLEObject::GetDefaultInterface()
{
  if (!m_DefaultIntf)
    Connect();
  return m_DefaultIntf;
}

_di_IUnknown __fastcall TExcelOLEObject::GetDunk()
{
  _di_IUnknown diUnk;
  if (m_DefaultIntf) {
    IUnknownPtr punk = m_DefaultIntf;
    diUnk = LPUNKNOWN(punk);
  }
  return diUnk;
}

void __fastcall TExcelOLEObject::Connect()
{
  if (!m_DefaultIntf) {
    _di_IUnknown punk = GetServer();
    m_DefaultIntf = punk;
    if (ServerData->EventIID != GUID_NULL)
      ConnectEvents(GetDunk());
  }
}

void __fastcall TExcelOLEObject::Disconnect()
{
  if (m_DefaultIntf) {

    if (ServerData->EventIID != GUID_NULL)
      DisconnectEvents(GetDunk());
    m_DefaultIntf.Reset();
  }
}

void __fastcall TExcelOLEObject::BeforeDestruction()
{
  Disconnect();
}

void __fastcall TExcelOLEObject::ConnectTo(_OLEObjectPtr intf)
{
  Disconnect();
  m_DefaultIntf = intf;
  if (ServerData->EventIID != GUID_NULL)
    ConnectEvents(GetDunk());
}

void __fastcall TExcelOLEObject::InitServerData()
{
  static Vcl::Oleserver::TServerData sd;
  sd.ClassID = CLSID_ExcelOLEObject;
  sd.IntfIID = __uuidof(_OLEObject);
  sd.EventIID= __uuidof(OLEObjectEvents);
  ServerData = &sd;
}

void __fastcall TExcelOLEObject::InvokeEvent(int id, Vcl::Oleserver::TVariantArray& params)
{
  switch(id)
  {
    case 1541: {
      if (OnGotFocus) {
        (OnGotFocus)(this);
      }
      break;
      }
    case 1542: {
      if (OnLostFocus) {
        (OnLostFocus)(this);
      }
      break;
      }
    default:
      break;
  }
}

VARIANT __fastcall TExcelOLEObject::BringToFront(void)
{
  return  GetDefaultInterface()->BringToFront();
}

VARIANT __fastcall TExcelOLEObject::Copy(void)
{
  return  GetDefaultInterface()->Copy();
}

VARIANT __fastcall TExcelOLEObject::CopyPicture(Excel_2k::XlPictureAppearance Appearance/*[in,def,opt]*/, 
                                                Excel_2k::XlCopyPictureFormat Format/*[in,def,opt]*/)
{
  return  GetDefaultInterface()->CopyPicture(Appearance/*[in,def,opt]*/, Format/*[in,def,opt]*/);
}

VARIANT __fastcall TExcelOLEObject::Cut(void)
{
  return  GetDefaultInterface()->Cut();
}

VARIANT __fastcall TExcelOLEObject::Delete(void)
{
  return  GetDefaultInterface()->Delete();
}

LPDISPATCH __fastcall TExcelOLEObject::Duplicate(void)
{
  return  GetDefaultInterface()->Duplicate();
}

VARIANT __fastcall TExcelOLEObject::Select(VARIANT Replace/*[in,opt]*/)
{
  return  GetDefaultInterface()->Select(Replace/*[in,opt]*/);
}

VARIANT __fastcall TExcelOLEObject::SendToBack(void)
{
  return  GetDefaultInterface()->SendToBack();
}

VARIANT __fastcall TExcelOLEObject::Activate(void)
{
  return  GetDefaultInterface()->Activate();
}

VARIANT __fastcall TExcelOLEObject::_Update(void)
{
  return  GetDefaultInterface()->_Update();
}

VARIANT __fastcall TExcelOLEObject::Verb(Excel_2k::XlOLEVerb Verb/*[in,def,opt]*/)
{
  return  GetDefaultInterface()->Verb(Verb/*[in,def,opt]*/);
}

Excel_2k::ExcelApplicationPtr __fastcall TExcelOLEObject::get_Application(void)
{
  return  GetDefaultInterface()->get_Application();
}

Excel_2k::XlCreator __fastcall TExcelOLEObject::get_Creator(void)
{
  return  GetDefaultInterface()->get_Creator();
}

LPDISPATCH __fastcall TExcelOLEObject::get_Parent(void)
{
  return  GetDefaultInterface()->get_Parent();
}

Excel_2k::ExcelRangePtr __fastcall TExcelOLEObject::get_BottomRightCell(void)
{
  return  GetDefaultInterface()->get_BottomRightCell();
}

VARIANT_BOOL __fastcall TExcelOLEObject::get_Enabled(void)
{
  return  GetDefaultInterface()->get_Enabled();
}

void __fastcall TExcelOLEObject::set_Enabled(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_Enabled(Param1/*[in]*/);
}

double __fastcall TExcelOLEObject::get_Height(void)
{
  return  GetDefaultInterface()->get_Height();
}

void __fastcall TExcelOLEObject::set_Height(double Param1/*[in]*/)
{
  GetDefaultInterface()->set_Height(Param1/*[in]*/);
}

long __fastcall TExcelOLEObject::get_Index(void)
{
  return  GetDefaultInterface()->get_Index();
}

double __fastcall TExcelOLEObject::get_Left(void)
{
  return  GetDefaultInterface()->get_Left();
}

void __fastcall TExcelOLEObject::set_Left(double Param1/*[in]*/)
{
  GetDefaultInterface()->set_Left(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelOLEObject::get_Locked(void)
{
  return  GetDefaultInterface()->get_Locked();
}

void __fastcall TExcelOLEObject::set_Locked(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_Locked(Param1/*[in]*/);
}

BSTR __fastcall TExcelOLEObject::get_Name(void)
{
  return  GetDefaultInterface()->get_Name();
}

void __fastcall TExcelOLEObject::set_Name(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_Name(Param1/*[in]*/);
}

BSTR __fastcall TExcelOLEObject::get_OnAction(void)
{
  return  GetDefaultInterface()->get_OnAction();
}

void __fastcall TExcelOLEObject::set_OnAction(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_OnAction(Param1/*[in]*/);
}

VARIANT __fastcall TExcelOLEObject::get_Placement(void)
{
  return  GetDefaultInterface()->get_Placement();
}

void __fastcall TExcelOLEObject::set_Placement(VARIANT Param1/*[in]*/)
{
  GetDefaultInterface()->set_Placement(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelOLEObject::get_PrintObject(void)
{
  return  GetDefaultInterface()->get_PrintObject();
}

void __fastcall TExcelOLEObject::set_PrintObject(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_PrintObject(Param1/*[in]*/);
}

double __fastcall TExcelOLEObject::get_Top(void)
{
  return  GetDefaultInterface()->get_Top();
}

void __fastcall TExcelOLEObject::set_Top(double Param1/*[in]*/)
{
  GetDefaultInterface()->set_Top(Param1/*[in]*/);
}

Excel_2k::ExcelRangePtr __fastcall TExcelOLEObject::get_TopLeftCell(void)
{
  return  GetDefaultInterface()->get_TopLeftCell();
}

VARIANT_BOOL __fastcall TExcelOLEObject::get_Visible(void)
{
  return  GetDefaultInterface()->get_Visible();
}

void __fastcall TExcelOLEObject::set_Visible(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_Visible(Param1/*[in]*/);
}

double __fastcall TExcelOLEObject::get_Width(void)
{
  return  GetDefaultInterface()->get_Width();
}

void __fastcall TExcelOLEObject::set_Width(double Param1/*[in]*/)
{
  GetDefaultInterface()->set_Width(Param1/*[in]*/);
}

long __fastcall TExcelOLEObject::get_ZOrder(void)
{
  return  GetDefaultInterface()->get_ZOrder();
}

Excel_2k::ShapeRangePtr __fastcall TExcelOLEObject::get_ShapeRange(void)
{
  return  GetDefaultInterface()->get_ShapeRange();
}

Excel_2k::BorderPtr __fastcall TExcelOLEObject::get_Border(void)
{
  return  GetDefaultInterface()->get_Border();
}

Excel_2k::InteriorPtr __fastcall TExcelOLEObject::get_Interior(void)
{
  return  GetDefaultInterface()->get_Interior();
}

VARIANT_BOOL __fastcall TExcelOLEObject::get_Shadow(void)
{
  return  GetDefaultInterface()->get_Shadow();
}

void __fastcall TExcelOLEObject::set_Shadow(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_Shadow(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelOLEObject::get_AutoLoad(void)
{
  return  GetDefaultInterface()->get_AutoLoad();
}

void __fastcall TExcelOLEObject::set_AutoLoad(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_AutoLoad(Param1/*[in]*/);
}

VARIANT_BOOL __fastcall TExcelOLEObject::get_AutoUpdate(void)
{
  return  GetDefaultInterface()->get_AutoUpdate();
}

void __fastcall TExcelOLEObject::set_AutoUpdate(VARIANT_BOOL Param1/*[in]*/)
{
  GetDefaultInterface()->set_AutoUpdate(Param1/*[in]*/);
}

LPDISPATCH __fastcall TExcelOLEObject::get_Object(void)
{
  return  GetDefaultInterface()->get_Object();
}

VARIANT __fastcall TExcelOLEObject::get_OLEType(void)
{
  return  GetDefaultInterface()->get_OLEType();
}

BSTR __fastcall TExcelOLEObject::get_SourceName(void)
{
  return  GetDefaultInterface()->get_SourceName();
}

void __fastcall TExcelOLEObject::set_SourceName(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_SourceName(Param1/*[in]*/);
}

BSTR __fastcall TExcelOLEObject::get_LinkedCell(void)
{
  return  GetDefaultInterface()->get_LinkedCell();
}

void __fastcall TExcelOLEObject::set_LinkedCell(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_LinkedCell(Param1/*[in]*/);
}

BSTR __fastcall TExcelOLEObject::get_ListFillRange(void)
{
  return  GetDefaultInterface()->get_ListFillRange();
}

void __fastcall TExcelOLEObject::set_ListFillRange(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_ListFillRange(Param1/*[in]*/);
}

BSTR __fastcall TExcelOLEObject::get_ProgId(void)
{
  return  GetDefaultInterface()->get_ProgId();
}

BSTR __fastcall TExcelOLEObject::get_AltHTML(void)
{
  return  GetDefaultInterface()->get_AltHTML();
}

void __fastcall TExcelOLEObject::set_AltHTML(BSTR Param1/*[in]*/)
{
  GetDefaultInterface()->set_AltHTML(Param1/*[in]*/);
}


};     // namespace Excel_2k


// *********************************************************************//
// The Register function is invoked by the IDE when this module is 
// installed in a Package. It provides the list of Components (including
// OCXes) implemented by this module. The following implementation
// informs the IDE of the OCX proxy classes implemented here.
// *********************************************************************//
namespace Excel_2k_srvr
{

void __fastcall PACKAGE Register()
{
  // [6]
  System::Classes::TComponentClass cls_svr[] = {
                              __classid(Excel_2k::TExcelQueryTable), 
                              __classid(Excel_2k::TExcelApplication), 
                              __classid(Excel_2k::TExcelChart), 
                              __classid(Excel_2k::TExcelWorksheet), 
                              __classid(Excel_2k::TExcelWorkbook), 
                              __classid(Excel_2k::TExcelOLEObject)
                           };
  System::Classes::RegisterComponents("Office2K", cls_svr,
                     sizeof(cls_svr)/sizeof(cls_svr[0])-1);
}

};     // namespace Excel_2k_srvr
