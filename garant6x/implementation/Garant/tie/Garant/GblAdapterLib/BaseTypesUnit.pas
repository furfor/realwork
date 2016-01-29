unit BaseTypesUnit;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "GblAdapterLib"
// ������: "w:/garant6x/implementation/Garant/tie/Garant/GblAdapterLib/BaseTypesUnit.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> garant6x::GblAdapterLib::BaseTypes
//
// ������� ����, ������������ � ��������
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include w:\garant6x\implementation\Garant\nsDefine.inc}

interface

uses
  IOUnit
  ;

type
 TClassId = Cardinal;
  {* ������������� ������ ������� }

 TObjectId = Cardinal;
  {* ������������� ������� ������ ������ }

 TPId = record
  {* Persistent ID, ��� ��� ������������� �������� ��������. }
   class_id : TClassId; // ������������� ������
   object_id : TObjectId; // ������������� �������
 end;//TPId

 TDate = record
  {* ����. }
   day : unsigned short; // �����
   month : unsigned short; // �����
   year : unsigned short; // ���.
//#UC START# *456EA6F00109publ*
//#UC END# *456EA6F00109publ*
 end;//TDate

 TDateInterval = record
  {* �������� ��� (����������). }
   start : TDate; // ��������� ����
   finish : TDate; // ����������� ����
 end;//TDateInterval

 TTime = record
  {* ����� }
   hour : unsigned short; // ����
   min : unsigned short; // ������
   sec : unsigned short; // �������
 end;//TTime

 TDateTime = record
  {* ���� � ����� }
   date : TDate; // ����
   time : TTime; // �����
 end;//TDateTime

 TLanguages = (
  {* ����� }
   LG_RUSSIAN // �������
 , LG_ENGLISH // ����������
 , LG_FRENCH // �����������
 , LG_GERMAN // ��������
 , LG_SPANISH // ���������
 , LG_ITALIAN // �����������
 );//TLanguages

 INamedElement = interface(IUnknown)
  {* ����������� �������. }
   ['{E6AAFF18-FAD7-4E46-A586-CEEC45905094}']
   function GetName: IString; stdcall;
   procedure SetName(const aValue: IString); stdcall;
   function GetComment: IString; stdcall;
   procedure SetComment(const aValue: IString); stdcall;
   property name: IString
     read GetName
     write SetName;
     {* ��� }
   property comment: IString
     read GetComment
     write SetComment;
     {* ����������� }
 end;//INamedElement

 ConstantModify = class
  {* ���������� ��������� ��� ������� �������� ����������� ���������. }
 end;//ConstantModify

 AccessDenied = class
  {* ������������ � ������ ��������� ���� �������. }
 end;//AccessDenied

 InvalidTimeStamp = class
  {* ���������� ������������ � ������ ���� ����������� �������� �� ����� ���� ��������� �� ������, �� ������� �������� ����� �������������. �������� ���������� ��������� �����. }
 end;//InvalidTimeStamp

 StorageLocked = class
  {* ���� ����������� }
 end;//StorageLocked

 Unsupported = class
  {* ������������ � ������ ���� ��������� �������� �� �������������� ��������. }
 end;//Unsupported

 NotSaved = class
  {* ������������ ��� ������� ���������/������������ ��������� � ������������� (�.� �� ����������� � ����� ��������, �������� � ������) ������� }
 end;//NotSaved

 FoldersNotAvailable = class
  {* ����� ����������.
������������ � ������, ���� � ������������ ��� ������� � ������. }
 end;//FoldersNotAvailable

 CanNotFindData = class
  {* ����������� ������ �� �������.
������������ � ������, ���� ������ ����������� �� �������� get_<something> �����������. }
 end;//CanNotFindData

 DuplicateNode = class
  {* ��������� � ������ ���������� ���� � ������, ��� ��� ���� ����� �� ����. ��� ���� ������������ ������������ ����� �����. }
 end;//DuplicateNode

 InvalidType = class
  {* ������ ��� ������ }
 end;//InvalidType

 CanNotSave = class
  {* ������ �� ����� ���� �������� }
 end;//CanNotSave

 InvalidXMLType = class
  {* ������ ��� ������� XML }
 end;//InvalidXMLType

const
  { ����� ���������, ������������ � GblAdapter }
 NODE_FLAG_STORABLE_ENTITY : Integer = 1;
  { �����, ����������� � Node::flags. ���� BaseEntity::storable == true, �� (Node::flags AND NODE_FLAG_STORABLE_ENTITY) ���������� true }
 PROPERTY_PATH_DELIMITER : PAnsiChar = /;
  { ������ - ����������� ������ ���� }
 DEFAULT_PRELOAD_CACHE : Cardinal = 50;
  { ������ �� ��������� ��� ��������� ������������� ��������� ������ ���������. }
 LIBRARY_NAME : PAnsiChar = GblAdapter.dll;
  { �������� ���������� }

type
 AllContentIsFiltered = class
  {* �� ���������� �������������, ��� ������������ ������-������ }
 end;//AllContentIsFiltered

 TCodePage = short;
  {* ����� ������� �������� }

 IEntityStorage = interface(IUnknown)
  {* ��������� ��������� }
   ['{D4613491-81A1-4AD8-B51E-95923E4DA97A}']
   procedure GetContentType; stdcall;
     {* �������� ��� ����������� }
   procedure GetCachedContent; stdcall;
     {* �������� ��������� }
 end;//IEntityStorage

 IEntityBase = interface(IUnknown)
  {* ������� ����������� ��������� ��� ���������. ������ ��������� ������ �������� ����������� BaseTreeSupport::BaseEntity . }
   ['{AC2E64E2-18A5-4F4A-B16F-A186B4F6BB37}']
   function GetIsSaved: ByteBool; stdcall;
   function GetIsChanged: ByteBool; stdcall;
   function GetEid: Cardinal; stdcall;
   procedure SaveTo(var aStorage: IEntityStorage; out aRet {: IEntityStorage}); stdcall; // can raise AccessDenied, Unsupported, NotSaved, DuplicateNode, CanNotSave
     {* ������������ �������� ������� ���������. }
   procedure AppendTo(var aStorage: IEntityStorage; out aRet {: IEntityStorage}); stdcall; // can raise ConstantModify, AccessDenied, Unsupported, CanNotSave
     {* ��������� � ����  ���������� ��������� �������.
��������� � � ����� ������������ ������� }
   property is_saved: ByteBool
     read GetIsSaved;
     {* ������� ���� ��� ������ ������ ��� �������� � ���� ������. ��� �� ����������� ������� ������� ���������� ������� ����� �������� (���� ����� �����). ��� �� ����������� �������� �������� save ������ ����������. }
   property is_changed: ByteBool
     read GetIsChanged;
     {* �������� ������������ }
   property eid: Cardinal
     read GetEid;
     {* ������������� }
 end;//IEntityBase

 EmptyResult = class
  {* ������������ ��� �������� �� ��������� ������ � ������, ���� ��������� ���������� ������, � ��� ���������� ������� ������������ ������. }
 end;//EmptyResult

 TItemStatus = (
  {* ������ ��������. }
   IS_ABOLISHED // ������� ����
 , IS_ACTIVE // �����������
 , IS_PREACTIVE // �� ������� � ����
 , IS_UNKNOWN // �����������
 );//TItemStatus

 TNavigatorMenuItemType = (
  {* ��������� ���� ��������� ��������� ����. }
   NM_FOLDER // ������������� - �����.
 , NM_RUBRICATOR // ��������� �� ��������������.
 , NM_ATTRIBUTE_SEARCH // ����� �� ���������.
 , NM_SITUATION_SEARCH // ����� �� ��������.
 , NM_PUBLISH_SOURCE_SEARCH // ����� �� ��������� �������������.
 , NM_SINGLE_CONTEXT_SEARCH // ��������� (�������) ����� �� ���������.
 , NM_SINGLE_ATTRIBUTE_SEARCH // ��������� (�������) ����� �� ������������ ��������.
 , NM_SINGLE_DATE_NUMBER_SEARCH // ��������� (�������) ����� �� ���� � ������.
 , NM_FILTER_5X // �������� ������� �-�� ������ 5.�.
 , NM_ATTRIBUTE_SEARCH_5X // �������� ������ �� ��������� �-�� ������ 5.�.
 , NM_SITUATION_SEARCH_5X // �������� ������ �� ��������� �-�� ������ 5.�.
 , NM_UPDATE // ����������.
 , NM_CONFIGURATION_LIST // ������ ������������.
 , NM_LIST // ������.
 , NM_COMPLECT_INFO // ���������� � ���������.
 , NM_DOCUMENT // ��������
 , NM_LAW_NAVIGATOR_FOLDER // ����� "�������� ���������"
 , NM_BUSINESS_INFO_FOLDER // ����� "���������� ����������"
 , NM_SEARCH_FOLDER // ����� "�����"
 , NM_UPDATE_FOLDER // ����� "����������"
 , NM_RECENTLY_DOCUMENTS_FOLDER // ����� "��������� �������� ���������"
 , NM_EXPLANATORY_DICTIONARY // �������� �������
 , NM_NEW_DOCS // ����� ���������
 , NM_PRIME_FOLDER // ����� ���� �����
 , NM_REVIEW // ����� ���� ������ ����������������
 , NM_NEWS_LINE // �����������
 , NM_SEARCH_WITH_LAW_SUPPORT // ����� ����: ����� � �������� ����������
 , NM_LAW_SUPPORT // ����� ����: �������� ���������
 , NM_CALENDAR
 , NM_BUSINESS_REFERENCES
 , NM_HOT_INFORMATION
 , NM_CODEX // �������
 , NM_FORMS // ����� ���������
 , NM_MONITORINGS // �����������
 , NM_PHARM_SEARCH // ����� � �������
 , NM_INPHARM // ������
 , NM_PHARM_LEK // ������������� ���������
 , NM_PHARM_FIRMS // ����� �������������
 , NM_PHARM_DICT // ������� ����������� ��������
 , NM_PHARM_BASIC_SECTION // �������� ������� �����������
 , NM_TAXES_AND_FINANCE // ������ � �������
 , NM_BUSINESS_REFERENCES_FOLDER // ����� ������-�������
 , NM_LEGAL_ISSUES // ����������� �������
 , NM_HR // �������� � �����
 , NM_BUDGET_ORGS // ���. � ������������� ����������
 , NM_LAW_FOR_ALL // ����� ��� ����
 );//TNavigatorMenuItemType

 TSearchResultType = (
  {* ��� ���������� ������ }
   SRT_DOCUMENT_LIST // ������ ������ ����������
 , SRT_AUTOREFERAT // ������ �����������
 , SRT_CONSULTATION // ������� ������������
 );//TSearchResultType

 ISearchEntity = interface(IUnknown)
  {* ��������, ������������ � ����� finish_process �� �������� ����������, ��� ��������� ������ }
   ['{8299FB1B-C061-4407-84D9-AF61A0E35754}']
   function GetResultType: TSearchResultType; stdcall;
   function GetDocumentCount: size; stdcall;
   function GetEntryCount: size; stdcall;
   function GetEditionCount: size; stdcall;
   property result_type: TSearchResultType
     read GetResultType;
     {* ��� ���������� ������ (������, �����������, ������������) }
   property document_count: size
     read GetDocumentCount;
     {* ���������� ��������� ���������� }
   property entry_count: size
     read GetEntryCount;
     {* ���������� ��������� }
   property edition_count: size
     read GetEditionCount;
     {* ���������� �������� }
 end;//ISearchEntity

 TSortOrder = (
  {* ����������� ����������. }
   SO_ASCENDING // �� ����������� ��������.
 , SO_DESCENDING // �� �������� ��������.
 );//TSortOrder

 TSortType = (
  {* ��� ����������. }
   ST_PRIORITY // ���������� �� ����������� ����
 , ST_CREATE_DATE // ���������� �� ���� ��������
 , ST_LAST_EDIT_DATE // ���������� �� ���� ���������� ���������
 , ST_NOT_SORTED // �� ������������
 , ST_RELEVANCE // ���������� �� �������������
 );//TSortType

 TSortParams = record
  {* ��������� ����������. }
   sort_order : TSortOrder; // ������� ����������
   sort_type : TSortType; // ��� �����������
 end;//TSortParams

 TTextSearchOptionType = (
  {* ���� ������ �� ��������� }
   TSO_TEXT // ����� �� ������
 , TSO_NAME // ����� �� ���������
 , TSO_PARA // ����� �� ���������
 , TSO_SENTENCE // ����� �� �����������
 );//TTextSearchOptionType

 IVariant = interface(IUnknown)
  {* ��� ������ ��� ����������� }
   ['{0B872568-888B-4CC1-B7ED-D0E555EDA7B7}']
   function GetLong: Integer; stdcall; // can raise InvalidType
     {* ������� ����� }
   function GetBool: ByteBool; stdcall; // can raise InvalidType
     {* ������� ������ �������� }
   procedure GetString(out aRet {: IString}); stdcall; // can raise InvalidType
     {* ������� ������ }
   procedure GetObject(out aRet {: IUnknown}); stdcall; // can raise InvalidType
     {* ������� ������ }
 end;//IVariant

 ILanguagesList = array of TLanguages;
  {* ������ ������ }

 IStringList = array of IString;
  {* ��������� ����� }

 InternalDatabaseError = class
  {* ��������� ��������� ������ ��� ��������� � ���� }
 end;//InternalDatabaseError

 NoSession = class
  {* ������������� �� �������, ������� ����� ��������� ������ � ��������� ������, �.�. ����� ������ }
 end;//NoSession

 DuplicateName = class
  {* ������� � ����� ������ ��� ����������, � ��� � ����� ��������� ������ }
 end;//DuplicateName

 TUid = Integer;
  {* ������������� ������������ ��� ������ }

 TListNodeType = (
   LNT_SUB // ���
 , LNT_PARA // ��������
 , LNT_EXTERNAL_OBJECT // ������, ����������� �� ������� ����������
 , LNT_EXTERNAL_LINK
 , LNT_DOCUMENT_ABOLISHED // ���������� ���� ��������
 , LNT_DOCUMENT_ACTIVE // ��������
 , LNT_DOCUMENT_PREACTIVE // �� ���������� � ���� ��������
 , LNT_DOCUMENT_UNKNOWN // ����������� ���
 , LNT_EDITION_ABOLISHED // ���������� ���� ��������
 , LNT_EDITION_ACTIVE // ���������� ��������
 , LNT_EDITION_PREACTIVE // ��������, ������� ��� �� ���������
 , LNT_EDITION_UNKNOWN // ����������� ��� ��������
 , LNT_EDITIONS_GROUP // ���� ��������
 , LNT_BLOCK // ����
 , LNT_DRUG_ANNULED // �������� �����������
 , LNT_DRUG_NARCOTIC // ������������� ��������
 , LNT_DRUG_NONANNULED_NONNARCOTIC // ����������� ��������������� ��������
 , LNT_FORM_ANNULED // �������������� ����� ���������
 , LNT_FORM_RUSSIAN_IMPORTANT // �������������� ���������� ��������
 , LNT_FORM_NONRUSSIAN_IMPORTANT // �������������� ����������� ��������
 , LNT_FORM_RUSSIAN_NONIMPORTANT // ���������� ��������
 , LNT_FORM_NONRUSSIAN_NONIMPORTANT // ����������� ��������
 , LNT_FIRM // �����
 , LNT_AAK // �������� ���
 );//TListNodeType

 TBaseTypesObjectId = TObjectId;
  {* ��� ������ ����, �.�. ���� �������� � ������� ActiveX � ��� ObjectId � ������ Document }

const
  { KindConstants }
 ALL_DOCUMENTS_KIND : unsigned long long = -1;


function TDate_make: TDate; overload;
  {* ������� ������� ���� }
function TDate_make(y: unsigned short;
    m: unsigned short;
    d: unsigned short): TDate; overload;
  {* ������� �������� ���� }

//#UC START# *456EA56002BFunit_intf*
//#UC END# *456EA56002BFunit_intf*

implementation

function TDate_make: TDate;
  {* ������� ������� ���� }
//#UC START# *462C9BE5030D_456EA6F00109_var*
//#UC END# *462C9BE5030D_456EA6F00109_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *462C9BE5030D_456EA6F00109_impl*
 !!! Needs to be implemented !!!
//#UC END# *462C9BE5030D_456EA6F00109_impl*
end;//TDate.Make


function TDate_make(y: unsigned short;
      m: unsigned short;
      d: unsigned short): TDate;
  {* ������� �������� ���� }
//#UC START# *462C9BF10128_456EA6F00109_var*
//#UC END# *462C9BF10128_456EA6F00109_var*
begin
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *462C9BF10128_456EA6F00109_impl*
 !!! Needs to be implemented !!!
//#UC END# *462C9BF10128_456EA6F00109_impl*
end;//TDate.Make

end.