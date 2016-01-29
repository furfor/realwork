unit m3DBFiler;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "m3$DB"
// ������: "w:/common/components/rtl/Garant/m3/m3DBFiler.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi For Archi::m3$DB::m3DB::Tm3DBFiler
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\m3\m3Define.inc}

interface

uses
  m3DBInterfaces,
  l3Filer
  ;

type
 Tm3DBFiler = class(Tl3CustomFiler)
 private
 // private fields
   f_DB : Im3DB;
   f_Level : Integer;
   f_Part : Im3DBDocumentPart;
    {* ���� ��� �������� Part}
   f_PartSelector : Tm3DocPartSelector;
    {* ���� ��� �������� PartSelector}
   f_ObjectIndex : Integer;
    {* ���� ��� �������� ObjectIndex}
 protected
 // overridden protected methods
   procedure Cleanup; override;
     {* ������� ������� ����� �������. }
   procedure ClearFields; override;
     {* ��������� ������ ClearFields }
   function DoOpen: Boolean; override;
   procedure DoClose; override;
     {* ��������� ������ DoClose }
 public
 // public methods
   constructor Create(const aDB: Im3DB;
     aDocID: Integer = 0;
     aDocPart: Tm3DocPartSelector = m3_defDocPart;
     aLevel: Integer = 0); reintroduce;
 public
 // public properties
   property Part: Im3DBDocumentPart
     read f_Part;
   property PartSelector: Tm3DocPartSelector
     read f_PartSelector
     write f_PartSelector;
   property ObjectIndex: Integer
     read f_ObjectIndex
     write f_ObjectIndex;
 end;//Tm3DBFiler

implementation

uses
  l3Types,
  l3Base,
  m3StorageInterfaces
  ;

// start class Tm3DBFiler

constructor Tm3DBFiler.Create(const aDB: Im3DB;
  aDocID: Integer = 0;
  aDocPart: Tm3DocPartSelector = m3_defDocPart;
  aLevel: Integer = 0);
//#UC START# *555C8A63011E_555C88FF0236_var*
//#UC END# *555C8A63011E_555C88FF0236_var*
begin
//#UC START# *555C8A63011E_555C88FF0236_impl*
 inherited Create;
 f_DB := aDB;
 Handle := aDocID;
 f_PartSelector := aDocPart;
 f_Level := aLevel;
 //f_Index := anObjectIndex;
//#UC END# *555C8A63011E_555C88FF0236_impl*
end;//Tm3DBFiler.Create

procedure Tm3DBFiler.Cleanup;
//#UC START# *479731C50290_555C88FF0236_var*
//#UC END# *479731C50290_555C88FF0236_var*
begin
//#UC START# *479731C50290_555C88FF0236_impl*
 f_Part := nil;
 f_DB := nil;
 inherited;
 f_ObjectIndex := 0;
 f_Level := 0;
 l3FillChar(f_PartSelector, SizeOf(f_PartSelector));
//#UC END# *479731C50290_555C88FF0236_impl*
end;//Tm3DBFiler.Cleanup

procedure Tm3DBFiler.ClearFields;
 {-}
begin
 f_DB := nil;
 f_Part := nil;
 inherited;
end;//Tm3DBFiler.ClearFields

function Tm3DBFiler.DoOpen: Boolean;
//#UC START# *555C888301B0_555C88FF0236_var*

 function OpenDocumentStream(const aDoc    : Im3DBDocument;
                             out aPart     : Im3DBDocumentPart;
                             aPartSelector : Tm3DocPartSelector;
                             aIndex        : Integer;
                             aMode         : Tm3StoreAccess;
                             aLevel        : Integer): IStream;
 begin//OpenDocumentStream
  Assert(aDoc <> nil);
  aPart := aDoc.GetVersion(aLevel);
  if (aMode = m3_saRead) then
  begin
   Result := aPart.Open(aMode, aPartSelector, aIndex);
   if (Result = nil) then
   begin
    aPart := nil;
    f_DB.FreeVersions;
    // - ��������, ��� ���������� ����� ��� ����� ���������,
    //   ���� - ����� ����� � ����� ������ ����������.
    aPart := aDoc.GetConst;
    // - ���� ���������� �����
   end//Result = nil
   else
    Exit;
    // - �� ��� �������
  end;//Mode = l3_fmRead
  Result := aPart.Open(aMode, aPartSelector, aIndex);
 end;//OpenDocumentStream

 function FMtoSA(aFileMode : Tl3FileMode) : Tm3StoreAccess;
 begin
  if (aFileMode = l3_fmRead) then
   Result := m3_saRead
  else
   Result := m3_saReadWrite;
 end;

//#UC END# *555C888301B0_555C88FF0236_var*
begin
//#UC START# *555C888301B0_555C88FF0236_impl*
 Result := true;
 if (f_DB <> nil) and (Handle <> 0) then
 begin
  Assert(Handle > 0);
  COMStream := OpenDocumentStream(f_DB.GetDocument(Handle),
                                  f_Part,
                                  f_PartSelector,
                                  f_ObjectIndex,
                                  FMtoSA(Mode),
                                  f_Level);
 end // (f_DB <> nil) and (Handle <> 0)
 else
  Result := false;
//#UC END# *555C888301B0_555C88FF0236_impl*
end;//Tm3DBFiler.DoOpen

procedure Tm3DBFiler.DoClose;
//#UC START# *555C88B703E7_555C88FF0236_var*
//#UC END# *555C88B703E7_555C88FF0236_var*
begin
//#UC START# *555C88B703E7_555C88FF0236_impl*
 f_Part := nil;
 Stream := nil;
 // - ��� ����������� ����� ��� ������������������ ������ ����������
 inherited;
//#UC END# *555C88B703E7_555C88FF0236_impl*
end;//Tm3DBFiler.DoClose

end.