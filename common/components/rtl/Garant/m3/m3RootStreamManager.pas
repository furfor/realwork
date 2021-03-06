unit m3RootStreamManager;

// ������: "w:\common\components\rtl\Garant\m3\m3RootStreamManager.pas"
// ���������: "SimpleClass"
// ������� ������: "Tm3RootStreamManager" MUID: (540EE8E40271)

{$Include w:\common\components\rtl\Garant\m3\m3Define.inc}

interface

uses
 l3IntfUses
 , m3RootStreamManagerPrim
 , m3RootStream
 , l3Int64List
 , l3RevertedInt64List
 , m3FileRegion
 , l3CustomString
;

const
 cLockLogExt = '.lock';

type
 Tm3RootStreamManager = {abstract} class(Tm3RootStreamManagerPrim)
  private
   f_LockedRegions: Tl3Int64List;
   f_NeedLocks: Boolean;
   f_AllocatedFATElements: Tl3RevertedInt64List;
   f_AllocatedClusters: Tl3RevertedInt64List;
   f_RootStream: Tm3RootStream;
  protected
   function DoAllocNewFATElement(aFromFreeChainOnly: Boolean): Int64; virtual; abstract;
   procedure DoRemoveFATElementAtPos(aPosition: Int64); virtual; abstract;
   procedure FreeAllocatedFATElements;
   procedure DoClearFATElement(aPosition: Int64); virtual; abstract;
   procedure ValidateAllocatedSize;
   procedure FreeAllocatedClusters;
   function HasLockedRegions: Boolean;
   procedure DoLockRegion(aForRead: Boolean;
    const aRegion: Tm3FileRegion); override;
   procedure DoUnlockRegion(aForRead: Boolean;
    const aRegion: Tm3FileRegion); override;
   function pm_GetRootStorageFATElement: Int64; override;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   function DoIsValidPosition(aPosition: Int64;
    aName: Tl3CustomString): Boolean; override;
  public
   constructor Create(aStream: Tm3RootStream); reintroduce; virtual;
   function AllocNewFATElement: Int64; override;
   procedure RemoveFATElementAtPos(aPosition: Int64); override;
   function ClusterBodySize: Int64; override;
   function AllocNewCluster: Int64; override;
   function ReadOnly: Boolean; override;
   procedure ReadData(aPosition: Int64;
    out aData;
    aSize: Integer); override;
   procedure WriteData(aPosition: Int64;
    const aData;
    aSize: Integer); override;
   function AllocatedStreamSize: Int64; override;
   procedure SetPositionAndValidateIt(aPosition: Int64;
    var thePosition: Int64); override;
   procedure ReloadHeader(aName: Tl3CustomString); override;
   procedure ReadDataAtCurrent(out aData;
    aSize: Integer); override;
  protected
   property RootStream: Tm3RootStream
    read f_RootStream;
 end;//Tm3RootStreamManager

implementation

uses
 l3ImplUses
 , SysUtils
 , m2COMLib
 , m3Exceptions
 , ActiveX
 , l3Base
 , ComObj
 , l3Types
 , l3Memory
 , l3Logger
 , l3SysUtils
 , Windows
 //#UC START# *540EE8E40271impl_uses*
 //#UC END# *540EE8E40271impl_uses*
;

constructor Tm3RootStreamManager.Create(aStream: Tm3RootStream);
//#UC START# *540EED370362_540EE8E40271_var*
var
 l_FileName : WideString;
 l_Logger : Tl3Logger;
//#UC END# *540EED370362_540EE8E40271_var*
begin
//#UC START# *540EED370362_540EE8E40271_impl*
 Assert(aStream <> nil);
 aStream.SetRefTo(f_RootStream);
 if m2COMIsLocksSupported(f_RootStream, LOCK_EXCLUSIVE) then
 begin
  f_NeedLocks := true;
  l_FileName := m2COMGetStatStgName(aStream);
  Assert(l_FileName <> '');
  if ANSISameText(ExtractFileExt(l_FileName), '.tmp') then
   l_FileName := ''
  else
   l_FileName := l_FileName + cLockLogExt;
 end//m2COMIsLocksSupported(f_RootStream, LOCK_EXCLUSIVE)
 else
 begin
  f_NeedLocks := false;
  l_FileName := '';
 end;//m2COMIsLocksSupported(f_RootStream, LOCK_EXCLUSIVE)
 if f_NeedLocks then
  f_LockedRegions := Tl3Int64List.Create;
 if (l_FileName = '') then
  l_Logger := nil
 else
  l_Logger := Tl3Logger.Create(l_FileName);
 try
  inherited Create(l_Logger);
  aStream.Logger := l_Logger;
 finally
  FreeAndNil(l_Logger);
 end;//try..finally
 if Self.ReadOnly then
  ValidateAllocatedSize;
//#UC END# *540EED370362_540EE8E40271_impl*
end;//Tm3RootStreamManager.Create

procedure Tm3RootStreamManager.FreeAllocatedFATElements;
//#UC START# *5423BFA1031A_540EE8E40271_var*
//#UC END# *5423BFA1031A_540EE8E40271_var*
begin
//#UC START# *5423BFA1031A_540EE8E40271_impl*
 Assert(Self <> nil);
 if (f_AllocatedFATElements = nil) then
  Exit;
 Self.Lock;
 try
  if (f_AllocatedFATElements <> nil) then
  begin
   if not f_AllocatedFATElements.Empty then
   begin
    RootStream.ForceLockHeader;
    try
     RootStream.LoadHeader;
     try
      if (Logger <> nil) then
       Logger.ToLog('begin: ���������� �������� FAT: ' + IntToStr(f_AllocatedFATElements.Count));
      try
       while not f_AllocatedFATElements.Empty do
       begin
        Assert(f_AllocatedFATElements.Last >= 0);
        DoRemoveFATElementAtPos(f_AllocatedFATElements.Last);
        f_AllocatedFATElements.DeleteLast;
       end;//while not f_AllocatedFATElements.Empty
      finally
       if (Logger <> nil) then
        Logger.ToLog('end: ���������� �������� FAT');
      end;//try..finally
     finally
      RootStream.SaveHeader;
     end;//try..finally 
    finally
     RootStream.UnlockHeader;
    end;//try..finally 
   end;//not f_AllocatedFATElements.Empty
  end;//f_AllocatedFATElements <> nil
 finally
  Self.Unlock;
 end;//try..finally
//#UC END# *5423BFA1031A_540EE8E40271_impl*
end;//Tm3RootStreamManager.FreeAllocatedFATElements

procedure Tm3RootStreamManager.ValidateAllocatedSize;
//#UC START# *54256B7B00F4_540EE8E40271_var*
const
 cMaxTry = 10;
var 
 l_Size     : Int64;
 l_TryCount : Integer;
 l_Delta    : Int64;
 l_Current  : Int64;
//#UC END# *54256B7B00F4_540EE8E40271_var*
begin
//#UC START# *54256B7B00F4_540EE8E40271_impl*
 l_TryCount := 0;
 while (l_TryCount < cMaxTry) do
 begin
  Inc(l_TryCount);
  RootStream.LockHeader;
  try
   RootStream.LoadHeader;
   try
    Em3InvalidStreamSize.Check(RootStream.HeaderData.rAllocatedStreamSize >= 0, '������������� ������ ���������');
    l_Size := m2COMGetSize(RootStream);
    if (RootStream.HeaderData.rAllocatedStreamSize <= l_Size) then
     break
    else
    begin
     l3System.Msg2Log('�������� ������ �������� rAllocatedStreamSize');
     // - �� ���� ����� ������� ��� ����� ����� ������
     OleCheck(IStream(RootStream).Seek(0, STREAM_SEEK_END, l_Current));
     if (l_Current >= RootStream.HeaderData.rAllocatedStreamSize) then
      break;
     if (l_TryCount < cMaxTry) then
     begin
      l3System.Msg2Log('������� �������� ���������� ��������� ����� ' + IntToStr(l_TryCount));
      Sleep(Random(500));
      continue;
     end//l_TryCount < cMaxTry
     else
     begin
      l_Delta := RootStream.HeaderData.rAllocatedStreamSize - l_Size;
      if (l_Size > 0) AND ((l_Delta / l_Size * 100) < 5 {%}) then
       l3System.Msg2Log('�������� ����� ��������� � ������������ ����� 5%. Size = ' + IntToStr(l_Size) + ' RootSize = ' + IntToStr(RootStream.HeaderData.rAllocatedStreamSize) + ' Delta = ' + IntToStr(l_Delta))
      else
       Em3InvalidStreamSize.Check(false, '�������� ����� ���������. Size = ' + IntToStr(l_Size) + ' RootSize = ' + IntToStr(RootStream.HeaderData.rAllocatedStreamSize) + ' Delta = ' + IntToStr(l_Delta));
     end;//l_TryCount < cMaxTry
    end;//RootStream.HeaderData.rAllocatedStreamSize <= l_Size 
   finally
    RootStream.SaveHeader;
   end;//try..finally
  finally
   RootStream.UnlockHeader;
  end;//try..finally
 end;//while (l_TryCount < cMaxTry)
//#UC END# *54256B7B00F4_540EE8E40271_impl*
end;//Tm3RootStreamManager.ValidateAllocatedSize

procedure Tm3RootStreamManager.FreeAllocatedClusters;
//#UC START# *54292A3101CF_540EE8E40271_var*

 procedure DoRemove(aPos: Int64);
 begin//DoRemove
  Self.WriteData(aPos,
                 RootStream.HeaderData.rFirstFreeCluster,
                 SizeOf(RootStream.HeaderData.rFirstFreeCluster));
  // - ���������� ������� ���������� ���������� ����� - rNextPosition
  RootStream.HeaderData.rFirstFreeCluster := aPos;
  // - ��� ������������� ������� - ������ �������� ������ ���������
 end;//DoRemove

var
 l_Pos : Int64;
 l_Start : LongWord;
//#UC END# *54292A3101CF_540EE8E40271_var*
begin
//#UC START# *54292A3101CF_540EE8E40271_impl*
 Assert(Self <> nil);
 if (f_AllocatedClusters = nil) then
  Exit;
 Self.Lock;
 try
  if (f_AllocatedClusters <> nil) then
  begin
   if not f_AllocatedClusters.Empty then
   begin
    while not f_AllocatedClusters.Empty do
    begin
     RootStream.ForceLockHeader;
     try
      RootStream.LoadHeader;
      try
       if (Logger <> nil) then
        Logger.ToLog('begin: ���������� ��������: ' + IntToStr(f_AllocatedClusters.Count));
       l_Start := GetTickCount; 
       try
        while not f_AllocatedClusters.Empty do
        begin
         l_Pos := f_AllocatedClusters.Last;
         Assert(l_Pos >= 0);
         DoRemove(l_Pos);
         f_AllocatedClusters.DeleteLast;
         if l3IsTimeElapsed(l_Start, 3000) then
         // - ��� ����� ���� ������ remote ������������� ����������
         begin
          if (Logger <> nil) then
           Logger.ToLog('break: ���������� ��������');
          break;
         end;//l3IsTimeElapsed(l_Start, 3000)
        end;//while not f_AllocatedClusters.Empty
       finally
        if (Logger <> nil) then
         Logger.ToLog('end: ���������� ��������');
       end;//try..finally
      finally
       RootStream.SaveHeader;
      end;//try..finally
     finally
      RootStream.UnlockHeader;
     end;//try..finally
    end;//while not f_AllocatedClusters.Empty
   end;//not f_AllocatedClusters.Empty
  end;// <> nil
 finally
  Self.Unlock;
 end;//try..finally
//#UC END# *54292A3101CF_540EE8E40271_impl*
end;//Tm3RootStreamManager.FreeAllocatedClusters

function Tm3RootStreamManager.HasLockedRegions: Boolean;
//#UC START# *542EB26E0220_540EE8E40271_var*
//#UC END# *542EB26E0220_540EE8E40271_var*
begin
//#UC START# *542EB26E0220_540EE8E40271_impl*
 Result := (f_LockedRegions <> nil) AND (f_LockedRegions.Count > 0);
//#UC END# *542EB26E0220_540EE8E40271_impl*
end;//Tm3RootStreamManager.HasLockedRegions

procedure Tm3RootStreamManager.DoLockRegion(aForRead: Boolean;
 const aRegion: Tm3FileRegion);
//#UC START# *541021B90213_540EE8E40271_var*
const
 cMode : array [Boolean] of AnsiString = ('write', 'read');
var
 l_Locked : Boolean; 
//#UC END# *541021B90213_540EE8E40271_var*
begin
//#UC START# *541021B90213_540EE8E40271_impl*
 Assert(Self <> nil);
 if not f_NeedLocks then
  Exit;
 Self.Lock;
 try
  Assert(f_LockedRegions <> nil);
  try
   if (f_LockedRegions.IndexOf(aRegion.rPosition) >= 0) then
    raise Exception.Create('������ ' + IntToStr(aRegion.rPosition) + ' ��� ����� �������');
   f_LockedRegions.Add(aRegion.rPosition);
   //Assert(f_LockedRegions.IndexOf(aPosition) >= 0);
   try
    l_Locked := m2COMTimeLock(RootStream, aRegion.rPosition, aRegion.rSize);
   except
    f_LockedRegions.Remove(aRegion.rPosition);
    raise;
   end;//try..except 
   if l_Locked then
   begin
    if (Logger <> nil) then
     if (aRegion.rPosition = Self.RootStorageFATElement) then
      Logger.ToLog('Locked for ' + cMode[aForRead] + ' : ' + IntToStr(aRegion.rPosition));
   end;//m2COMTimeLock(RootStream, aPosition, aSize)
  except
   on E: Exception do
   begin
    if (Logger <> nil) then
    begin
     Logger.ToLog('����������: ' + E.ClassName + ' ' + E.Message);
     Logger.ToLog('��� ������� �������� ' + IntToStr(aRegion.rPosition));
    end;//Logger <> nil
    raise;
   end;//on E: Exception
  end;//try..except
 finally
  Self.Unlock;
 end;//try..finally
//#UC END# *541021B90213_540EE8E40271_impl*
end;//Tm3RootStreamManager.DoLockRegion

procedure Tm3RootStreamManager.DoUnlockRegion(aForRead: Boolean;
 const aRegion: Tm3FileRegion);
//#UC START# *541021E4022F_540EE8E40271_var*
const
 cMode : array [Boolean] of AnsiString = ('write', 'read');
//#UC END# *541021E4022F_540EE8E40271_var*
begin
//#UC START# *541021E4022F_540EE8E40271_impl*
 Assert(Self <> nil);
 if not f_NeedLocks then
  Exit;
 Self.Lock;
 try
  Assert(f_LockedRegions <> nil);
  if (f_LockedRegions.IndexOf(aRegion.rPosition) < 0) then
   raise Exception.Create('������ ' + IntToStr(aRegion.rPosition) + ' ����� �� ��� �������');
  f_LockedRegions.Remove(aRegion.rPosition);
  //Assert(f_LockedRegions.IndexOf(aPosition) < 0);
  if m2COMTimeUnlock(RootStream, aRegion.rPosition, aRegion.rSize) then
  begin
   if (Logger <> nil) then
    if (aRegion.rPosition = Self.RootStorageFATElement) then
     Logger.ToLog('Unlocked for ' + cMode[aForRead] + ' : ' + IntToStr(aRegion.rPosition));
  end;//m2COMTimeUnlock(RootStream, aPosition, aSize)
 finally
  Self.Unlock;
 end;//try..finally
//#UC END# *541021E4022F_540EE8E40271_impl*
end;//Tm3RootStreamManager.DoUnlockRegion

function Tm3RootStreamManager.pm_GetRootStorageFATElement: Int64;
//#UC START# *5411B3280387_540EE8E40271get_var*
//#UC END# *5411B3280387_540EE8E40271get_var*
begin
//#UC START# *5411B3280387_540EE8E40271get_impl*
 Result := RootStream.HeaderData.rRootStorageFATElement;
//#UC END# *5411B3280387_540EE8E40271get_impl*
end;//Tm3RootStreamManager.pm_GetRootStorageFATElement

function Tm3RootStreamManager.AllocNewFATElement: Int64;
//#UC START# *5423BF3603A1_540EE8E40271_var*
var
 l_Index : Integer;
 l_Pos   : Int64;
 l_Res   : hResult;
 l_GotFromFree : Integer;
//#UC END# *5423BF3603A1_540EE8E40271_var*
begin
//#UC START# *5423BF3603A1_540EE8E40271_impl*
 Assert(Self <> nil);
 Assert(RootStream <> nil);
 Assert(not Self.ReadOnly);
 Self.Lock;
 try
  if (f_AllocatedFATElements <> nil) then
   if not f_AllocatedFATElements.Empty then
   begin
    Result := f_AllocatedFATElements.Last;
    Assert(Result >= 0);
    f_AllocatedFATElements.DeleteLast;
    Exit;
   end;//not f_AllocatedFATElements.Empty
  RootStream.ForceLockHeader;
  try
   RootStream.LoadHeader;
   try
    if (Logger <> nil) then
     Logger.ToLog('begin: ������������ �������� FAT');
    if (f_AllocatedFATElements = nil) then
     f_AllocatedFATElements := Tl3RevertedInt64List.MakeSorted(l3_dupError);
    Result := DoAllocNewFATElement(false);
    Assert(Result >= 0);

    l_GotFromFree := 0;

    while true do
    // - ��� ���������� ������ ���������
    begin
     l_Pos := DoAllocNewFATElement(true);
     if (l_Pos >= 0) then
     begin
      f_AllocatedFATElements.Add(l_Pos);
      Inc(l_GotFromFree);
      if (l_GotFromFree > 20) then
       break;
     end//l_Pos >= 0
     else
      break;
    end;//while true

    if (l_GotFromFree <= 2) then
    // - ��������� �����
     for l_Index := 0 to 20 - l_GotFromFree do
     begin
      l_Pos := DoAllocNewFATElement(false);
      if (l_Pos >= 0) then
       f_AllocatedFATElements.Add(l_Pos)
      else
       break;
     end;//for l_Index
    if (Logger <> nil) then
     Logger.ToLog('end: ������������ �������� FAT');
   finally
    RootStream.SaveHeader;
   end;//try..finally 
   l_Res := S_Ok;
   RootStream.Commit(STGC_DEFAULT, l_Res);
  finally
   RootStream.UnlockHeader;
  end;//try..finally
 finally
  Self.Unlock;
 end;//try..finally
//#UC END# *5423BF3603A1_540EE8E40271_impl*
end;//Tm3RootStreamManager.AllocNewFATElement

procedure Tm3RootStreamManager.RemoveFATElementAtPos(aPosition: Int64);
//#UC START# *5423BF5A00DC_540EE8E40271_var*
//#UC END# *5423BF5A00DC_540EE8E40271_var*
begin
//#UC START# *5423BF5A00DC_540EE8E40271_impl*
(* DoRemoveFATElementAtPos(aPosition);
 Exit;*)
 if (aPosition < 0) then
  Exit;
 Assert(aPosition > 0, '������ ������� ��������� ��������� ������'); 
 Assert(Self <> nil);
 Assert(RootStream <> nil);
 Assert(not Self.ReadOnly);
 Self.Lock;
 try
  if (f_AllocatedFATElements = nil) then
   f_AllocatedFATElements := Tl3RevertedInt64List.MakeSorted(l3_dupError);
  f_AllocatedFATElements.Add(aPosition);
  DoClearFATElement(aPosition); 
 finally
  Self.Unlock;
 end;//try..finally
//#UC END# *5423BF5A00DC_540EE8E40271_impl*
end;//Tm3RootStreamManager.RemoveFATElementAtPos

function Tm3RootStreamManager.ClusterBodySize: Int64;
//#UC START# *5425479101D1_540EE8E40271_var*
//#UC END# *5425479101D1_540EE8E40271_var*
begin
//#UC START# *5425479101D1_540EE8E40271_impl*
 Result := RootStream.HeaderData.rClusterBodySize;
//#UC END# *5425479101D1_540EE8E40271_impl*
end;//Tm3RootStreamManager.ClusterBodySize

function Tm3RootStreamManager.AllocNewCluster: Int64;
//#UC START# *5429114F00E8_540EE8E40271_var*

 function DoAlloc: Int64;

  function WriteNewCluster: Int64;
  var
   l_Size : Int64;
   l_Ptr  : Pointer;
   l_Position : Int64;

   procedure DoWrite;
   begin//DoWrite
    l3FillChar(l_Ptr^, l_Size, $FF);
    Self.WriteData(l_Position, l_Ptr^, l_Size);
   end;//DoWrite

  var
   l_Buff : array [0..255] of AnsiChar;
   l_ToWrite : Tl3Ptr;
  begin//WriteNewCluster
   Result := -1;
   m2COMSeek(RootStream, RootStream.HeaderData.rAllocatedStreamSize, STREAM_SEEK_SET);
   l_Position := m2COMGetPosition(RootStream);
   Em3InvalidOldPositionOfRoot.Check(l_Position, RootStream.HeaderData.rAllocatedStreamSize);
   l_Size := Self.ClusterSize;
   if (l_Size <= SizeOf(l_Buff)) then
   begin
    l_Ptr := @l_Buff;
    DoWrite;
   end//l_Size <= SizeOf(l_Buff)
   else
   begin
    l3FillChar(l_ToWrite, SizeOf(l_ToWrite));
    l_ToWrite.SetSize(l_Size);
    try
     l_Ptr := l_ToWrite.AsPointer;
     DoWrite;
    finally
     l_ToWrite.SetSize(0);
    end;//try..finally
   end;//l_Size <= SizeOf(l_Buff)
   Inc(RootStream.HeaderData.rAllocatedStreamSize, l_Size);
   Result := l_Position;
  end;//WriteNewCluster

 var
  l_Index : Integer;
  l_Pos   : Int64;
  l_Res   : hResult;
 begin//DoAlloc
  Result := WriteNewCluster;
  if (f_AllocatedClusters = nil) then
   f_AllocatedClusters := Tl3RevertedInt64List.MakeSorted(l3_dupError);
  for l_Index := 0 to 2048 - 2 do
  begin
   l_Pos := WriteNewCluster;
   Assert(l_Pos >= 0);
   f_AllocatedClusters.Add(l_Pos);
  end;//for l_Index
  l_Res := S_Ok;
  RootStream.Commit(STGC_DEFAULT, l_Res);
 end;//DoAlloc

var
 l_Filler : Int64;
 l_Next   : Int64;
 l_NextOfNext : Int64;
//#UC END# *5429114F00E8_540EE8E40271_var*
begin
//#UC START# *5429114F00E8_540EE8E40271_impl*
 Result := -1;
 Assert(Self <> nil);
 Assert(RootStream <> nil);
 Assert(not Self.ReadOnly);
 Self.Lock;
 try
  if (f_AllocatedClusters <> nil) then
  begin
   if not f_AllocatedClusters.Empty then
   begin
    Result := f_AllocatedClusters.Last;
    Assert(Result >= 0);
    f_AllocatedClusters.DeleteLast;
    Exit;
   end;//not f_AllocatedClusters.Empty
  end;//f_AllocatedClusters <> nil
  RootStream.ForceLockHeader;
  try
   RootStream.LoadHeader;
   try
    Result := RootStream.HeaderData.rFirstFreeCluster;
    Em3InvalidStreamPos.Check(Self.IsValidLink,
                              nil,
                              Result);
    if (Result = -1) then
    begin
     if (Logger <> nil) then
      Logger.ToLog('begin: ������������ ��������');
     Result := DoAlloc;
     if (Logger <> nil) then
      Logger.ToLog('end: ������������ ��������');
     Assert(Result >= 0);
    end//Result = -1
    else
    begin
     if (Logger <> nil) then
      Logger.ToLog('���������� ������� ��������� ���������');
     Self.ReadData(Result,
                   l_Next,
                   SizeOf(l_Next));
     Em3InvalidStreamPos.Check(Self.IsValidLink,
                               nil,
                               l_Next);
     // - ���������� ������� ���������� ���������� ����� - rNextPosition

     if (l_Next <> -1) then
     begin
      if (f_AllocatedClusters = nil) then
       f_AllocatedClusters := Tl3RevertedInt64List.MakeSorted(l3_dupError);
      while (l_Next <> -1) do
      begin
       f_AllocatedClusters.Add(l_Next);

       Self.ReadData(l_Next,
                     l_NextOfNext,
                     SizeOf(l_NextOfNext));
       Em3InvalidStreamPos.Check(Self.IsValidLink,
                                 nil,
                                 l_NextOfNext);
       // - ���������� ������� ���������� ���������� ����� - rNextPosition

       l_Filler := -1;
       Self.WriteData(l_Next,
                      l_Filler,
                      SizeOf(l_Filler));
       // - �� ������ ������ - "�������� ������"

       l_Next := l_NextOfNext;
       if (f_AllocatedClusters.Count >= 2048) then
        break;
      end;//l_Next <> -1
     end;//l_Next <> -1

     RootStream.HeaderData.rFirstFreeCluster := l_Next;
     // - ��������� ��������� ������� ������ ��������� ���������
     Assert(RootStream.HeaderData.rFirstFreeCluster <> Result);
     Em3InvalidStreamPos.Check(Self.IsValidLink,
                               nil,
                               RootStream.HeaderData.rFirstFreeCluster);

     l_Filler := -1;
     Self.WriteData(Result,
                    l_Filler,
                    SizeOf(l_Filler));
     // - �� ������ ������ - "�������� ������"

     if (Logger <> nil) then
     begin
      if (f_AllocatedClusters <> nil) then
       Logger.ToLog('�������� ��������� ���������: ' + IntToStr(f_AllocatedClusters.Count + 1))
      else
       Logger.ToLog('������� ���� ��������� �������');
     end;//Logger <> nil
    end;//Result = -1
   finally
    RootStream.SaveHeader;
   end;//try..finally
  finally
   RootStream.UnlockHeader;
  end;//try..finally
 finally
  Self.Unlock;
 end;//try..finally
//#UC END# *5429114F00E8_540EE8E40271_impl*
end;//Tm3RootStreamManager.AllocNewCluster

function Tm3RootStreamManager.ReadOnly: Boolean;
//#UC START# *542E69CA007F_540EE8E40271_var*
//#UC END# *542E69CA007F_540EE8E40271_var*
begin
//#UC START# *542E69CA007F_540EE8E40271_impl*
 Result := RootStream.ReadOnly;
//#UC END# *542E69CA007F_540EE8E40271_impl*
end;//Tm3RootStreamManager.ReadOnly

procedure Tm3RootStreamManager.ReadData(aPosition: Int64;
 out aData;
 aSize: Integer);
//#UC START# *543F8E8F0358_540EE8E40271_var*
//#UC END# *543F8E8F0358_540EE8E40271_var*
begin
//#UC START# *543F8E8F0358_540EE8E40271_impl*
 Assert(Self.RootStream <> nil);
 m2COMReadBufferSafe(Self.RootStream, aPosition, aData, aSize);
//#UC END# *543F8E8F0358_540EE8E40271_impl*
end;//Tm3RootStreamManager.ReadData

procedure Tm3RootStreamManager.WriteData(aPosition: Int64;
 const aData;
 aSize: Integer);
//#UC START# *543F8ED700E2_540EE8E40271_var*
//#UC END# *543F8ED700E2_540EE8E40271_var*
begin
//#UC START# *543F8ED700E2_540EE8E40271_impl*
 Assert(Self.RootStream <> nil);
 m2COMWriteBufferSafe(Self.RootStream, aPosition, aData, aSize);
//#UC END# *543F8ED700E2_540EE8E40271_impl*
end;//Tm3RootStreamManager.WriteData

function Tm3RootStreamManager.AllocatedStreamSize: Int64;
//#UC START# *543F90700143_540EE8E40271_var*
//#UC END# *543F90700143_540EE8E40271_var*
begin
//#UC START# *543F90700143_540EE8E40271_impl*
 Assert(Self.RootStream <> nil);
 Result := RootStream.HeaderData.rAllocatedStreamSize;
//#UC END# *543F90700143_540EE8E40271_impl*
end;//Tm3RootStreamManager.AllocatedStreamSize

procedure Tm3RootStreamManager.SetPositionAndValidateIt(aPosition: Int64;
 var thePosition: Int64);
//#UC START# *543F960901AE_540EE8E40271_var*
//#UC END# *543F960901AE_540EE8E40271_var*
begin
//#UC START# *543F960901AE_540EE8E40271_impl*
 Assert(Self.RootStream <> nil);
 m2COMSeek(Self.RootStream, aPosition, STREAM_SEEK_SET);
 thePosition := m2COMGetPosition(Self.RootStream);
 Em3InvalidOldPositionOfRoot.Check(thePosition, aPosition);
//#UC END# *543F960901AE_540EE8E40271_impl*
end;//Tm3RootStreamManager.SetPositionAndValidateIt

procedure Tm3RootStreamManager.ReloadHeader(aName: Tl3CustomString);
//#UC START# *543FAEB90303_540EE8E40271_var*
var
 l_S : String;
//#UC END# *543FAEB90303_540EE8E40271_var*
begin
//#UC START# *543FAEB90303_540EE8E40271_impl*
 l_S := '������������ ��������� ��� ��������� ������ ������: ' + aName.AsString;
 if (Logger <> nil) then
  Logger.ToLog(l_S);
 //l3System.Stack2Log(l_S);
 RootStream.LockHeader;
 try
  RootStream.LoadHeader;
  RootStream.SaveHeader;
 finally
  RootStream.UnlockHeader;
 end;//try..finally
//#UC END# *543FAEB90303_540EE8E40271_impl*
end;//Tm3RootStreamManager.ReloadHeader

procedure Tm3RootStreamManager.ReadDataAtCurrent(out aData;
 aSize: Integer);
//#UC START# *54411B71009B_540EE8E40271_var*
//#UC END# *54411B71009B_540EE8E40271_var*
begin
//#UC START# *54411B71009B_540EE8E40271_impl*
 Assert(Self.RootStream <> nil);
 m2COMReadBufferSafe(Self.RootStream, aData, aSize);
//#UC END# *54411B71009B_540EE8E40271_impl*
end;//Tm3RootStreamManager.ReadDataAtCurrent

procedure Tm3RootStreamManager.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_540EE8E40271_var*
//#UC END# *479731C50290_540EE8E40271_var*
begin
//#UC START# *479731C50290_540EE8E40271_impl*
 FreeAllocatedFATElements;
 FreeAllocatedClusters;
 FreeAndNil(f_RootStream);
 Assert(not HasLockedRegions);
 FreeAndNil(f_LockedRegions);
 FreeAndNil(f_AllocatedClusters);
 FreeAndNil(f_AllocatedFATElements);
 inherited;
//#UC END# *479731C50290_540EE8E40271_impl*
end;//Tm3RootStreamManager.Cleanup

function Tm3RootStreamManager.DoIsValidPosition(aPosition: Int64;
 aName: Tl3CustomString): Boolean;
//#UC START# *540EFD500389_540EE8E40271_var*
(*const
 cDiv = 10000;*)
var
 l_Size : Int64;
 //l_Res : hResult;
//#UC END# *540EFD500389_540EE8E40271_var*
begin
//#UC START# *540EFD500389_540EE8E40271_impl*
 Result := inherited DoIsValidPosition(aPosition, aName);

 if Result then
  Exit;

 ReloadHeader(aName);
 // - ��� ������������ ���������, ���� �� ��� ��� ��������

 if Self.ReadOnly then
  l_Size := Self.AllocatedStreamSize + 1
 else
  l_Size := m2COMGetSize(RootStream);
  
 Result := (aPosition < l_Size);
 
(* if not Result then
 begin
  if Self.ReadOnly then
   Exit;
  l_Res := S_OK;
  RootStream.Commit(STGC_DEFAULT, l_Res);
  Sleep(100);
  l_Size := m2COMGetSize(RootStream);
  Result := (aPosition < l_Size);
  if Result then
   l3System.Stack2Log('������ �������')
  else
  begin
   Sleep(200);
   l_Size := m2COMGetSize(RootStream);
   Result := (aPosition < l_Size);
   if Result then
    l3System.Stack2Log('������ ������� �2')
   else
   begin
    l3System.Stack2Log(Format('������� %d ������ ������� ������ (%d). ����������� = %d. rAllocatedStreamSize = %d. ����������� = %d. ', [aPosition, l_Size, aPosition - l_Size, RootStream.HeaderData.rAllocatedStreamSize, RootStream.HeaderData.rAllocatedStreamSize - l_Size]));
    if (RootStream.HeaderData.rAllocatedStreamSize >= aPosition + Self.ClusterSize) then
    begin
     Result := true;
     l3System.Stack2Log('������ � ������� ��������');
     Exit;
    end;//RootStream.HeaderData.rAllocatedStreamSize >= aPosition + Self.ClusterSize
    if (aPosition > High(Integer)) then
    // - ������� ���� ������ "�������� ��������"
     Exit;
    if (aPosition div cDiv > l_Size div cDiv) then
    // - ������� "������" ���������� �� ������� ������
     Exit;
    l_Res := S_OK; 
    RootStream.Commit(STGC_DEFAULT, l_Res);
    Sleep(200);
    l_Size := m2COMGetSize(RootStream);
    Result := (aPosition < l_Size);
    if Result then
     l3System.Stack2Log('������ ������� �3')
    else
     l3System.Stack2Log('����������� �������� ��������������');
    Result := true;
    // - �������, ��� ����� ������
   end;//Result
  end;//Result
 end;//not Result*)
//#UC END# *540EFD500389_540EE8E40271_impl*
end;//Tm3RootStreamManager.DoIsValidPosition

end.
