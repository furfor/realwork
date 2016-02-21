unit m3NewRootStreamManager;

// ������: "w:\common\components\rtl\Garant\m3\m3NewRootStreamManager.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\m3\m3Define.inc}

interface

uses
 l3IntfUses
 , m3RootStreamManager
 , m3StoreHeaderDataPrim
 , ActiveX
 , m3RootStream
;

type
 Tm3NewRootStreamManager = class(Tm3RootStreamManager)
  private
   f_StoreHeaderDataClass: Rm3StoreHeaderDataPrim;
  protected
   function DoAllocNewFATElement(aFromFreeChainOnly: Boolean): Int64; override;
   procedure DoRemoveFATElementAtPos(aPosition: Int64); override;
   procedure DoClearFATElement(aPosition: Int64); override;
  public
   class function Make(const aStream: IStream): Tm3NewRootStreamManager;
   function StoreHeaderDataClass: Rm3StoreHeaderDataPrim; override;
   procedure RemoveTOCBuffData(var ATOCBuffDataPosition: Int64); override;
   function ClusterHeaderSize: Int64; override;
   constructor Create(aStream: Tm3RootStream); override;
 end;//Tm3NewRootStreamManager

implementation

uses
 l3ImplUses
 , m3StoreHeaderData
 , m3StoreHeaderDataNew
 , m3RootStreamNew
 , m3StorageBlock
 , ComObj
 , m2COMLib
 , Windows
 , SysUtils
;

class function Tm3NewRootStreamManager.Make(const aStream: IStream): Tm3NewRootStreamManager;
//#UC START# *5411B27E014C_5411A4410076_var*
var
 l_RS   : Tm3RootStream;
 l_GUID : AnsiString;
 l_RSC  : Rm3RootStream;
 l_Access : Integer;
//#UC END# *5411B27E014C_5411A4410076_var*
begin
//#UC START# *5411B27E014C_5411A4410076_impl*
 Assert(aStream <> nil);
 
 l_RSC := nil;
 
 l_GUID := m2COMCLSIDFromStream(m2COMSetPosition(0, aStream));
 if (l_GUID = GUIDToString(Tm3RootStream.HeaderID)) then
  l_RSC := Tm3RootStream
 else
 if (l_GUID = GUIDToString(Tm3RootStreamNew.HeaderID)) then
  l_RSC := Tm3RootStreamNew;

 l_Access := m2COMModeAccess(m2COMGetStatStgMode(aStream));

 if (l_RSC = nil) then
  if (l_Access = STGM_READWRITE) then
   if (m2COMGetSize(aStream) = 0) then
    l_RSC := Tm3RootStreamNew;

 if (l_RSC = nil) then
  OleError(STG_E_INVALIDHEADER)
 else
 begin
  l_RS := l_RSC.Create(aStream, l_Access);
  try
   Result := Self.Create(l_RS);
   try
    Assert(Result.RootStorageFATElement >= 0);
   except
    FreeAndNil(Result);
    raise;
   end;//try..finally
  finally
   FreeAndNil(l_RS);
  end;//try..finally
 end;//l_RSC = nil
//#UC END# *5411B27E014C_5411A4410076_impl*
end;//Tm3NewRootStreamManager.Make

function Tm3NewRootStreamManager.DoAllocNewFATElement(aFromFreeChainOnly: Boolean): Int64;
//#UC START# *54103217000D_5411A4410076_var*
var
 l_NewData : Tm3StoreHeaderDataPrim;
//#UC END# *54103217000D_5411A4410076_var*
begin
//#UC START# *54103217000D_5411A4410076_impl*
 Result := -1;
 Lock;
 try
  RootStream.LockHeader;
  try
   RootStream.LoadHeader;
   try
    Result := RootStream.HeaderData.rFirstFreeFATElement;
    if (Result = Int64(-1)) then
    begin
     if aFromFreeChainOnly then
      Exit;
     l_NewData := StoreHeaderDataClass.CreateNew(Self);
     try
      Result := l_NewData.SaveToNewPlace(RootStream.HeaderData.rAllocatedStreamSize);
     finally
      FreeAndNil(l_NewData);
     end;//try..finally
    end//Result = Int64(-1)
    else
    begin
     l_NewData := StoreHeaderDataClass.CreateAtExistingPlace(Self, Result);
     try
      RootStream.HeaderData.rFirstFreeFATElement := l_NewData.SaveToExistingPlace;
     finally
      FreeAndNil(l_NewData);
     end;//try..finally
    end;//Result = Int64(-1)
   finally
    RootStream.SaveHeader;
   end;//try..finally
  finally
   RootStream.UnlockHeader;
  end;//try..finally
 finally
  Unlock;
 end;//try..finally
//#UC END# *54103217000D_5411A4410076_impl*
end;//Tm3NewRootStreamManager.DoAllocNewFATElement

function Tm3NewRootStreamManager.StoreHeaderDataClass: Rm3StoreHeaderDataPrim;
//#UC START# *5411A48C0040_5411A4410076_var*
//#UC END# *5411A48C0040_5411A4410076_var*
begin
//#UC START# *5411A48C0040_5411A4410076_impl*
 Result := f_StoreHeaderDataClass;
//#UC END# *5411A48C0040_5411A4410076_impl*
end;//Tm3NewRootStreamManager.StoreHeaderDataClass

procedure Tm3NewRootStreamManager.DoRemoveFATElementAtPos(aPosition: Int64);
//#UC START# *5411B9D601CC_5411A4410076_var*
var
 l_FreePostition : Int64;
 l_H : Tm3StoreHeaderDataPrim;
//#UC END# *5411B9D601CC_5411A4410076_var*
begin
//#UC START# *5411B9D601CC_5411A4410076_impl*
 Lock;
 try
  RootStream.LockHeader;
  try
   RootStream.LoadHeader;
   try
    l_H := StoreHeaderDataClass.CreateForDeletion(Self, aPosition);
    try
     l_FreePostition := RootStream.HeaderData.rFirstFreeFATElement;
     l_H.Delete(l_FreePostition);
     RootStream.HeaderData.rFirstFreeFATElement := aPosition;
    finally
     FreeAndNil(l_H);
    end;//try..finally
   finally
    RootStream.SaveHeader;
   end;//try..finally
  finally
   RootStream.UnlockHeader;
  end;//try..finally
 finally
  Unlock;
 end;//try..finally
//#UC END# *5411B9D601CC_5411A4410076_impl*
end;//Tm3NewRootStreamManager.DoRemoveFATElementAtPos

procedure Tm3NewRootStreamManager.RemoveTOCBuffData(var ATOCBuffDataPosition: Int64);
//#UC START# *5411C6960184_5411A4410076_var*
var
 LTOCBuffFreePosition1 : Int64;
 LTOCBuffFreePosition2 : Int64;
//#UC END# *5411C6960184_5411A4410076_var*
begin
//#UC START# *5411C6960184_5411A4410076_impl*
 if (ATOCBuffDataPosition <> Int64(-1)) then
 begin
  Lock;
  try
   RootStream.LockHeader;
   try
    RootStream.LoadHeader;
    try
     LTOCBuffFreePosition1 := ATOCBuffDataPosition;

     repeat
      LTOCBuffFreePosition2 := LTOCBuffFreePosition1;
      m2COMReadBufferSafe(RootStream,
                          LTOCBuffFreePosition2,
                          LTOCBuffFreePosition1,
                          SizeOf(LTOCBuffFreePosition1));

     until (LTOCBuffFreePosition1 = Int64(-1));

     LTOCBuffFreePosition1 := RootStream.HeaderData.rFirstFreeCluster;
     m2COMWriteBufferSafe(RootStream,
                          LTOCBuffFreePosition2,
                          LTOCBuffFreePosition1,
                          SizeOf(LTOCBuffFreePosition1));
     RootStream.HeaderData.rFirstFreeCluster := ATOCBuffDataPosition;
     ATOCBuffDataPosition := Int64(-1);
    finally
     RootStream.SaveHeader;
    end;//try..finally
   finally
    RootStream.UnlockHeader;
   end;//try..finally
  finally
   Unlock;
  end;//try..finally
 end;//ATOCBuffDataPosition <> Int64(-1)
//#UC END# *5411C6960184_5411A4410076_impl*
end;//Tm3NewRootStreamManager.RemoveTOCBuffData

procedure Tm3NewRootStreamManager.DoClearFATElement(aPosition: Int64);
//#UC START# *542400C501D3_5411A4410076_var*
var
 l_NewData : Tm3StoreHeaderDataPrim;
 l_Pos     : Int64;
//#UC END# *542400C501D3_5411A4410076_var*
begin
//#UC START# *542400C501D3_5411A4410076_impl*
 l_NewData := StoreHeaderDataClass.CreateAtExistingPlace(Self, aPosition);
 try
  l_Pos := l_NewData.SaveToExistingPlace;
 finally
  FreeAndNil(l_NewData);
 end;//try..finally
//#UC END# *542400C501D3_5411A4410076_impl*
end;//Tm3NewRootStreamManager.DoClearFATElement

function Tm3NewRootStreamManager.ClusterHeaderSize: Int64;
//#UC START# *54253CB801D8_5411A4410076_var*
//#UC END# *54253CB801D8_5411A4410076_var*
begin
//#UC START# *54253CB801D8_5411A4410076_impl*
 Result := SizeOf(Tm3StorageBlockHeader);
//#UC END# *54253CB801D8_5411A4410076_impl*
end;//Tm3NewRootStreamManager.ClusterHeaderSize

constructor Tm3NewRootStreamManager.Create(aStream: Tm3RootStream);
//#UC START# *540EED370362_5411A4410076_var*
//#UC END# *540EED370362_5411A4410076_var*
begin
//#UC START# *540EED370362_5411A4410076_impl*
 Assert(aStream <> nil);
 if (aStream Is Tm3RootStreamNew) then
  f_StoreHeaderDataClass := Tm3StoreHeaderDataNew
 else
  f_StoreHeaderDataClass := Tm3StoreHeaderData;
 Assert(Assigned(f_StoreHeaderDataClass));
 inherited;
 RootStream.LockHeader;
 try
  RootStream.LoadHeader;
  try
   if not Self.ReadOnly then
   begin
    if (RootStream.HeaderData.rRootStorageFATElement = -1) then
    begin
     RootStream.HeaderData.rRootStorageFATElement := AllocNewFATElement;
     Assert(RootStream.HeaderData.rRootStorageFATElement >= 0);
    end;//RootStream.HeaderData.rRootStorageFATElement = -1
    Self.ValidateAllocatedSize;
   end;//not Self.ReadOnly
  finally
   RootStream.SaveHeader;
  end;//try..finally
 finally
  RootStream.UnlockHeader;
 end;//try..finally
//#UC END# *540EED370362_5411A4410076_impl*
end;//Tm3NewRootStreamManager.Create

end.
