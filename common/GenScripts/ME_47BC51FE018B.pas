unit NOT_FINISHED_dt_Types;

// ������: "w:\common\components\rtl\Garant\dd\NOT_FINISHED_dt_Types.pas"
// ���������: "Interfaces"

{$Include w:\common\components\rtl\Garant\dd\ddDefine.inc}

interface

uses
 l3IntfUses
 , evdDTTypes
 , l3Types
;

const
 {* ������ ��� �������� evdDTTypes.TepDivideBy }
 divNone = evdDTTypes.divNone;
 divTopic = evdDTTypes.divTopic;
 divAccRight = evdDTTypes.divAccRight;
 divSize = evdDTTypes.divSize;
 {* ������ ��� �������� evdDTTypes.TepSupportFileType }
 outEVD = evdDTTypes.outEVD;
 outEVDtext = evdDTTypes.outEVDtext;
 outTXT = evdDTTypes.outTXT;
 outNSRC = evdDTTypes.outNSRC;
 outRTF = evdDTTypes.outRTF;
 outHTML = evdDTTypes.outHTML;
 outXML = evdDTTypes.outXML;

type
 TDictID = LongWord;

 TDocID = LongInt;

 TSubID = LongInt;

 TDocType = (
  {* ���������� ���� ���������� }
  dtNone
  , dtText
  , dtRelText
  , dtShortCut
  , dtObject
  , dtDictEntry
  , dtAnnotation
  , dtFlash
 );//TDocType

 TFamilyID = Word;

 TDiapasonRec = record
 end;//TDiapasonRec

 TddPipeInputFileType = (
  dd_itAutoDetect
  , dd_itGarant
  , dd_itEverest
  , dd_itEverestInternal
  , dd_itRTFAnnotation
  , dd_itTXTAnnotation
  , dd_itFASCaseCode
  , dd_itKT
  , dd_itUnknown
 );//TddPipeInputFileType

 TUserType = (
  utNone
  , utDoc
  , utNoDoc
  , utCalendar
  , utBusiness
  , utUserInfo
  , utWEBReference
  , utEdition
  , utBook
  , utIzm
  , utCard
  , utDossier
  , utAAK_Cont
  , utAAK_Doc
 );//TUserType

 TDiapType = (
  tdNone
  , tdSingle
  , tdGroup
  , tdAll
  , tdSearch
  , tdNumList
 );//TDiapType

 TUserID = LongWord;

 TepSupportFileType = evdDTTypes.TepSupportFileType;

 TepDivideBy = evdDTTypes.TepDivideBy;

 TPathRec = record
 end;//TPathRec

 TPathStr = Tl3PathStr;

 TOpenMode = record
 end;//TOpenMode

 TOperActionType = (
 );//TOperActionType

implementation

uses
 l3ImplUses
;

end.
