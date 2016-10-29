unit msmElementViews;

// ������: "w:\common\components\gui\Garant\msm\msmElementViews.pas"
// ���������: "Interfaces"
// ������� ������: "msmElementViews" MUID: (57B565F200E5)

{$Include w:\common\components\msm.inc}

interface

uses
 l3IntfUses
 , l3TreeInterfaces
 , msmModelElements
 , msmEvents
 , msmUsualData
 , l3Interfaces
 {$If NOT Defined(NoScripts)}
 , tfwScriptingInterfaces
 {$IfEnd} // NOT Defined(NoScripts)
;

type
 TmsmModelElementView = {$IfDef XE4}record{$Else}object{$EndIf}
  public
   rElement: ImsmModelElement;
   rListName: AnsiString;
   rTextName: AnsiString;
   rIsDir: Boolean;
  public
   function CompareListKey(const anOther: TmsmModelElementView): Integer;
   function ChangeIsDir(aIsDir: Boolean): TmsmModelElementView;
   function CompareStringListKey(const anOther: TmsmModelElementView): Integer;
 end;//TmsmModelElementView

 ImsmStringList = interface
  ['{39BE050D-C3D5-4353-8BF4-BF81444671D2}']
  function Get_Strings(anIndex: Integer): Il3CString;
  function Get_StringsToFind(anIndex: Integer): Il3CString;
  function Get_Count: Integer;
  property Strings[anIndex: Integer]: Il3CString
   read Get_Strings;
  property StringsToFind[anIndex: Integer]: Il3CString
   read Get_StringsToFind;
  property Count: Integer
   read Get_Count;
 end;//ImsmStringList

 ImsmModelElementStringList = interface(ImsmStringList)
  ['{FEEDDEDB-807F-4F8F-A073-358A76AAEEF3}']
  function Get_Item(anIndex: Integer): ImsmModelElement;
  function Get_Owner: ImsmModelElement;
  function Get_Count: Integer;
  function As_ImsmEventsPublisher: ImsmEventsPublisher;
   {* ����� ���������� ������ ���������� � ImsmEventsPublisher }
  function IndexOfElementView(const anElement: ImsmModelElement): Integer;
  procedure Add(anItem: TtfwWord);
  property Item[anIndex: Integer]: ImsmModelElement
   read Get_Item;
   default;
  property Owner: ImsmModelElement
   read Get_Owner;
  property Count: Integer
   read Get_Count;
 end;//ImsmModelElementStringList

 ImsmModelElementTree = interface(ImsmTree)
  ['{400299A5-3A2B-4574-975C-55DA5304FE1C}']
  function Get_Elements(anIndex: Integer): ImsmModelElement;
  function NodeByElement(const anElement: ImsmModelElement): Il3SimpleNode;
  function As_ImsmModelElementStringList: ImsmModelElementStringList;
   {* ����� ���������� ������ ���������� � ImsmModelElementStringList }
  property Elements[anIndex: Integer]: ImsmModelElement
   read Get_Elements;
 end;//ImsmModelElementTree

function TmsmModelElementView_C(const anElement: ImsmModelElement;
 const aListName: AnsiString;
 const aTextName: AnsiString): TmsmModelElementView; overload;
function TmsmModelElementView_C(const aListName: AnsiString;
 const aTextName: AnsiString): TmsmModelElementView; overload;
function TmsmModelElementView_C(const anElement: ImsmModelElement;
 const aListName: AnsiString): TmsmModelElementView; overload;
function TmsmModelElementView_C(const aListName: AnsiString): TmsmModelElementView; overload;
function TmsmModelElementView_C(const anElement: ImsmModelElement): TmsmModelElementView; overload;

implementation

uses
 l3ImplUses
 , l3PointerUtils
 , l3String
;

function TmsmModelElementView_C(const anElement: ImsmModelElement;
 const aListName: AnsiString;
 const aTextName: AnsiString): TmsmModelElementView;
//#UC START# *57B3267702E6_57B3262B00D2_var*
//#UC END# *57B3267702E6_57B3262B00D2_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *57B3267702E6_57B3262B00D2_impl*
 Result.rElement := anElement;
 Result.rListName := aListName;
 Result.rTextName := aTextName;
//#UC END# *57B3267702E6_57B3262B00D2_impl*
end;//TmsmModelElementView_C

function TmsmModelElementView_C(const aListName: AnsiString;
 const aTextName: AnsiString): TmsmModelElementView;
//#UC START# *57B327B203E3_57B3262B00D2_var*
//#UC END# *57B327B203E3_57B3262B00D2_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *57B327B203E3_57B3262B00D2_impl*
 Result := TmsmModelElementView_C(nil, aListName, aTextName);
//#UC END# *57B327B203E3_57B3262B00D2_impl*
end;//TmsmModelElementView_C

function TmsmModelElementView_C(const anElement: ImsmModelElement;
 const aListName: AnsiString): TmsmModelElementView;
//#UC START# *57B43B3A0183_57B3262B00D2_var*
//#UC END# *57B43B3A0183_57B3262B00D2_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *57B43B3A0183_57B3262B00D2_impl*
 Result := TmsmModelElementView_C(anElement, aListName, 'DefaultText');
//#UC END# *57B43B3A0183_57B3262B00D2_impl*
end;//TmsmModelElementView_C

function TmsmModelElementView_C(const aListName: AnsiString): TmsmModelElementView;
//#UC START# *57B43B540139_57B3262B00D2_var*
//#UC END# *57B43B540139_57B3262B00D2_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *57B43B540139_57B3262B00D2_impl*
 Result := TmsmModelElementView_C(nil, aListName);
//#UC END# *57B43B540139_57B3262B00D2_impl*
end;//TmsmModelElementView_C

function TmsmModelElementView_C(const anElement: ImsmModelElement): TmsmModelElementView;
//#UC START# *57B43CFB03A4_57B3262B00D2_var*
//#UC END# *57B43CFB03A4_57B3262B00D2_var*
begin
 Finalize(Result);
 System.FillChar(Result, SizeOf(Result), 0);
//#UC START# *57B43CFB03A4_57B3262B00D2_impl*
 Result := TmsmModelElementView_C(anElement, 'Inner');
//#UC END# *57B43CFB03A4_57B3262B00D2_impl*
end;//TmsmModelElementView_C

function TmsmModelElementView.CompareListKey(const anOther: TmsmModelElementView): Integer;
//#UC START# *57F4ED230163_57B3262B00D2_var*
//#UC END# *57F4ED230163_57B3262B00D2_var*
begin
//#UC START# *57F4ED230163_57B3262B00D2_impl*
 if (Self.rElement = nil) OR not Self.rElement.IsSameElement(anOther.rElement) then
  Result := l3ComparePointers(Pointer(Self.rElement), Pointer(anOther.rElement))
 else
  Result := 0;
 if (Result = 0) then
  Result := l3Compare(Self.rListName, anOther.rListName);  
//#UC END# *57F4ED230163_57B3262B00D2_impl*
end;//TmsmModelElementView.CompareListKey

function TmsmModelElementView.ChangeIsDir(aIsDir: Boolean): TmsmModelElementView;
//#UC START# *5811C4AC0136_57B3262B00D2_var*
//#UC END# *5811C4AC0136_57B3262B00D2_var*
begin
//#UC START# *5811C4AC0136_57B3262B00D2_impl*
 Result := Self;
 Result.rIsDir := aIsDir;
//#UC END# *5811C4AC0136_57B3262B00D2_impl*
end;//TmsmModelElementView.ChangeIsDir

function TmsmModelElementView.CompareStringListKey(const anOther: TmsmModelElementView): Integer;
//#UC START# *5811C4ED035E_57B3262B00D2_var*
//#UC END# *5811C4ED035E_57B3262B00D2_var*
begin
//#UC START# *5811C4ED035E_57B3262B00D2_impl*
 Result := CompareListKey(anOther);
 if (Result = 0) then
  Result := l3Compare(Self.rTextName, anOther.rTextName);
 if (Result = 0) then   
  Result := Ord(Self.rIsDir) - Ord(anOther.rIsDir);
//#UC END# *5811C4ED035E_57B3262B00D2_impl*
end;//TmsmModelElementView.CompareStringListKey

end.
