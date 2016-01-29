unit evdTypes;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "EVD"
// �����: ����� �.�.
// ������: "w:/common/components/rtl/Garant/EVD/evdTypes.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<Interfaces::Category>> Shared Delphi::EVD::Types
//
// ������� ����, ������������ �������� EVD.
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\EVD\evdDefine.inc}

interface

type
 TevIndentType = (
  {* ������������ ������� �� �����������. }
   ev_itLeft // �� ������ ����.
 , ev_itRight // �� ������� ����.
 , ev_itCenter // �� ������.
 , ev_itWidth // �� ������.
 , ev_itPreformatted // "������������������".
 , ev_itNone
 );//TevIndentType

 TevPageOrientation = (
  {* ���������� ��������. }
   ev_poPortrait // �������.
 , ev_poLandscape // ���������.
 );//TevPageOrientation

 TevMergeStatus = (
  {* ������� ����������� �����. }
   ev_msNone
 , ev_msHead
 , ev_msContinue
 );//TevMergeStatus

 TevVerticalAligment = (
  {* ������������ ������� �� ���������. }
   ev_valTop
 , ev_valCenter
 , ev_valBottom
 );//TevVerticalAligment

 TevControlType = (
  {* ��� ��������. }
   ev_ctLabel // ����� � �������� � ���� �����
 , ev_ctEdit // ������� ��������
 , ev_ctCombo // ���������� ������
 , ev_ctButton // ������
 , ev_ctSpinedit // �������� � ������������ �������������� �����
 , ev_ctCheckEdit // �������� � CheckBox
 , ev_ctEllipsesEdit // �������� � �������
 , ev_ctRadioEdit // �������� � RadioButton
 , ev_ctCalEdit // �������� � ���������� ���������
 , ev_ctCollapsedPanel // ������������� ������
 , ev_ctStateButton // ������ � ���������� ���������
 , ev_ctEmailEdit // �������� ��� ����� E-mail ������ (� ���������)
 , ev_ctMemoEdit // ������������� ���� ����� (�� ������������)
 , ev_ctPictureLabel // ����� ���������� � ���������
 , ev_ctTextParaLabel // ����� � ������� ��������
 , ev_ctPhoneEdit
 , ev_ctUnknown // ����������� ��� ��������
 );//TevControlType

 TevReqKind = (
  {* ��� ���������. }
   ev_rkSimple // ������� ��������, ����������� ������������� (���������� � ������) (ev_rkSimple).
 , ev_rkContext // ����������� �������, ����������� �������������� (���������� � ������)(ev_rkContext).
 , ev_rkDescription // �������������� ������� (�� �������� � ������ (ev_rkDescription).
 );//TevReqKind

 TevSubPlace = (
   ev_spNoWhere
 , ev_spOnlyInContents
 , ev_spInContentsAndOnSubPanel
 , ev_spOnlyOnSubPanel
 );//TevSubPlace

const
  { Hyperlink Const }
 CI_TOPIC = 65537;
  { ��� ���� ������ �� ��������� }
 CI_BLOB = 65538;
  { ��� ������ �� �������� ������� }
 CI_MULT = 65539;
  { ��� ������������ �� ���������/�������� ������� }
 CI_REF = 65540;
  { ��� ������ �� ������� ��������-������� }
 CI_FolderLink = 65544;
 CI_ExternalOperation = 65545;
 CI_PHARM_MULTI = 65547;
  { ��� ������������ �� ��������� ������� }
 CI_PIC = 65541;
  { ��� ������ �� ������� �������� }
 CI_SCRIPT = 65552;
 CI_EDITION = 65543;
 CI_SHELL_INTERNAL = 65554;
  { ������ � �������������� ������ � �.�. �� ������ ������������ �� �������. [Requestlink:607263536] }
  { Address Defaults }
 ev_NullAddressType = 0;
 ev_defAddressType = CI_TOPIC;

type
 TevLinkViewKind = (
   ev_lvkUnknown // ����������
 , ev_lvkInternalValid // ������ �������. ����������
 , ev_lvkInternalInvalid // ������ �������. �� ������������� ����������
 , ev_lvkExternal // ������
 , ev_lvkInternalAbolished // ������ �������. �� ���������� ���� ��������
 , ev_lvkInternalPreactive // ������ �������. �� �� ���������� � ���� ��������
 , ev_lvkExternalENO // ������� ����������
 , ev_lvkInternalEdition // �������� ���������
 , ev_lvkScript
 , ev_lvkShellInternal
 );//TevLinkViewKind

 TevSubHandle = (
  {* ���� �����. }
   None
 , Sub
 , Marker
 , Bookmark
 , Mark
 );//TevSubHandle

const
  { ���� �����. }
 ev_sbtNone = None;
  { �������������� ���� �����. }
 ev_sbtSub = Sub;
  { ���� Sub'��. }
 ev_sbtMarker = Marker;
  { ���� ��������. }
 ev_sbtBookmark = Bookmark;
  { ���� ����������� �������� (����������������). }
 ev_sbtMark = Mark;
  { ���� ��������������� ������� (����������������). }
 ev_sbtPara = 10;
  { �������� (����������). }
 ev_sbtDocumentPlace = 11;
  { ����� � ��������� (����������) ��. [TevDocumentPlace]. }
 ev_sbtBySearcher = 14;
  { ������� �� Searcher'� (����������). }

type
 TevDocumentPlace = (
  {* ����� � ���������. }
   ev_dpNone // �����.
 , ev_dpEnd // � �����.
 );//TevDocumentPlace

const
  { Sub Flags }
 ev_cUserCommentFlags = 2;
  { ����� ���������������� ������������ }
 ev_cCommentsFlag = 1;
  { ����� ������������ ������� }
 ev_cVersionCommentsFlag = 4;
  { ����� ���������� ������������ }

type
 TevHFType = (
  {* ��� ����������� }
   evd_hftOrdinal
 , evd_hftLeft
 , evd_hftRight
 , evd_hftFirst
 );//TevHFType

const
 ev_spInContents = [ev_spOnlyInContents, ev_spInContentsAndOnSubPanel];
  {* ����� ������ � ���������� }

type
 TevSegmentHandle = (
   Superposition
 , View
 , Hyperlinks
 , FoundWords
 , Found
 , Objects
 , Mistakes
 , Diff
 );//TevSegmentHandle

const
  { ���� ��������� ���������� }
 ev_slSuperposition = Superposition;
  { ���� ������������ ���������. }
 ev_slView = View;
  { ���� ����������. }
 ev_slHyperlinks = Hyperlinks;
  { ���� �����������. }
 ev_slFoundWords = FoundWords;
  { ���� ���� ��������� �� ���������. }
 ev_slFound = Found;
  { ���� ��������� ���� (����������������). }
 ev_slObjects = Objects;
  { ���� ��������, ����������� � ��������. }
 ev_slMistakes = Mistakes;
  { ���� ��������� ��� �������� ��������. }
 ev_slDiff = Diff;
  { ������� ���� ������������ ���������� }

type
 TevNormalSegLayerHandleP = ev_slView..ev_slMistakes;

const
  { Sub Const }
 POSITION_TYPE_PARA_ID = 2147483648;

type
 TevBlockViewKind = (
   ev_bvkNone
 , ev_bvkLeft
 , ev_bvkRight
 );//TevBlockViewKind

 TevNormalSegLayerHandleSet = set of TevNormalSegLayerHandleP;

implementation

end.