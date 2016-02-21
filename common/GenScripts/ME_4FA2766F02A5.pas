unit m3BaseStorage;

// ������: "w:\common\components\rtl\Garant\m3\m3BaseStorage.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\m3\m3Define.inc}

interface

uses
 l3IntfUses
 , m3BaseStore
 , ActiveX
 , l3Interfaces
 , m3StorageInterfaces
 , Windows
;

type
 TWindowsFileTime = TFileTime;

 //#UC START# *4FA2766F02A5ci*
 //#UC END# *4FA2766F02A5ci*
 //#UC START# *4FA2766F02A5cit*
 //#UC END# *4FA2766F02A5cit*
 Tm3BaseStorage = {abstract} class(Tm3BaseStore, IStorage)
  protected
   procedure DoCreateStore(const aName: Tl3WString;
    anAccess: Tm3StoreAccess;
    aStoreType: Tm3StoreType;
    out theStream: Tm3Store;
    out theReturn: hResult;
    aUseCompression: Boolean); virtual;
   procedure DoOpenStore(const aName: Tl3WString;
    anAccess: Tm3StoreAccess;
    aStoreType: Tm3StoreType;
    out theStream: Tm3Store;
    out theReturn: hResult;
    aUseCompression: Boolean); virtual;
  public
   function DestroyElement(aName: PWideChar): HResult; stdcall;
   function EnumElements(unused1: Integer;
    unused2: Pointer;
    unused3: Integer;
    out theStatStg: IEnumStatStg): HResult; stdcall;
   function Stat(out theStatStg: TStatStg;
    aStatFlag: Integer): HResult; stdcall;
 //#UC START# *4FA2766F02A5publ*
    private
    // IStorage
      function IStorage.CreateStream=COMCreateStream;
      function IStorage.OpenStream=COMOpenStream;
      function IStorage.CreateStorage=COMCreateStorage;
      function IStorage.OpenStorage=COMOpenStorage;
      function IStorage.CopyTo=COMCopyTo;
      function IStorage.MoveElementTo=COMMoveElementTo;
      function IStorage.Commit=COMCommit;
      function IStorage.Revert=COMRevert;
      function IStorage.RenameElement=COMRenameElement;
      function IStorage.SetElementTimes=COMSetElementTimes;
      function IStorage.SetClass=COMSetClass;
      function IStorage.SetStateBits=COMSetStateBits;
    protected
      procedure CopyTo(const AExcludeCount: LongInt;
                       const AExcludeArray: PIID;
                       const AExcludeSNB: TSNB;
                       const AStorage: IStorage;
                       var   AReturn: HRESULT);
        virtual;
        {-}
      procedure MoveElementTo(const ASrcName : Tl3WString;
                              const AStorage : IStorage;
                              const ADstName : PWideChar;
                              const AFlags   : LongInt;
                              var   AReturn  : HRESULT);
        virtual;
        {-}
          procedure         Revert              (var   AReturn: HRESULT
                                                ); virtual;


          procedure         DoEnumElements        (var   AEnumStatStg: IEnumStatStg;
                                                 var   AReturn: HRESULT
                                                ); virtual;


      procedure DoDestroyElement(const AName   : Tl3WString;
                               var   AReturn : HRESULT);
        virtual;
        {-}
      procedure RenameElement(const AOldName : Tl3WString;
                              const ANewName : Tl3WString;
                              var   AReturn  : HRESULT);
        virtual;
        {-}
          procedure         SetElementTimes     (const AName: PWideChar;
                                                 const ACTime: Windows.TFileTime;
                                                 const AATime: Windows.TFileTime;
                                                 const AMTime: Windows.TFileTime;
                                                 var   AReturn: HRESULT
                                                ); virtual;


          procedure         DoStat                (var   AStatStg: TStatStg;
                                                 AStatFlag: LongInt;
                                                 var   AReturn: HRESULT
                                                ); //virtual;

    public


          procedure         Commit              (AFlags: LongInt;
                                                 var   AReturn: HRESULT
                                                ); virtual;

          function          COMCreateStream     (      AName: PWideChar;
                                                       AStatStgMode: LongInt;
                                                       _unused1: LongInt;
                                                       _unused2: LongInt;
                                                 out   AStream: IStream
                                                ): HRESULT; stdcall;

          function          COMOpenStream       (      AName: PWideChar;
                                                       _unused1: Pointer;
                                                       AStatStgMode: LongInt;
                                                       _unused2: LongInt;
                                                 out   AStream: IStream
                                                ): HRESULT; stdcall;


          function          COMCreateStorage    (      AName: PWideChar;
                                                       AStatStgMode: LongInt;
                                                       _unused1: LongInt;
                                                       _unused2: LongInt;
                                                 out   AStorage: IStorage
                                                ): HRESULT; stdcall;

          function          COMOpenStorage      (      AName: PWideChar;
                                                 const _unused1: IStorage;
                                                       AStatStgMode: LongInt;
                                                       _unused2: TSNB;
                                                       _unused3: LongInt;
                                                 out   AStorage: IStorage
                                                ): HRESULT; stdcall;


          function          COMCopyTo           (      AExcludeCount: LongInt;
                                                       AExcludeArray: PIID;
                                                       AExcludeSNB: TSNB;
                                                 const AStorage: IStorage
                                                ): HRESULT; stdcall;

          function          COMMoveElementTo    (      ASrcName: PWideChar;
                                                 const AStorage: IStorage;
                                                       ADstName: PWideChar;
                                                       AFlags: LongInt
                                                ): HRESULT; stdcall;


          function          COMCommit           (AFlags: LongInt
                                                ): HRESULT; stdcall;

          function          COMRevert           (
                                                ): HRESULT; stdcall;


          function          COMRenameElement    (      AOldName: PWideChar;
                                                       ANewName: PWideChar
                                                ): HRESULT; stdcall;


          function          COMSetElementTimes  (      AName: PWideChar;
                                                 const ACTime: Windows.TFileTime;
                                                 const AATime: Windows.TFileTime;
                                                 const AMTime: Windows.TFileTime
                                                ): HRESULT; stdcall;


          function          COMSetClass         (const ACLSID: TCLSID
                                                ): HRESULT; stdcall;


          function          COMSetStateBits     (      AStateBits: LongInt;
                                                       AMask: LongInt
                                                ): HRESULT; stdcall;

 //#UC END# *4FA2766F02A5publ*
 end;//Tm3BaseStorage

implementation

uses
 l3ImplUses
 , l3Base
 , m2COMLib
 , l3String
 , SysUtils
 , ComObj
 , m2MemLib
;

procedure Tm3BaseStorage.DoCreateStore(const aName: Tl3WString;
 anAccess: Tm3StoreAccess;
 aStoreType: Tm3StoreType;
 out theStream: Tm3Store;
 out theReturn: hResult;
 aUseCompression: Boolean);
//#UC START# *54520BDF0089_4FA2766F02A5_var*
//#UC END# *54520BDF0089_4FA2766F02A5_var*
begin
//#UC START# *54520BDF0089_4FA2766F02A5_impl*
 Assert(false);
 if SUCCEEDED(theReturn) then
  theReturn := E_NOTIMPL;
//#UC END# *54520BDF0089_4FA2766F02A5_impl*
end;//Tm3BaseStorage.DoCreateStore

procedure Tm3BaseStorage.DoOpenStore(const aName: Tl3WString;
 anAccess: Tm3StoreAccess;
 aStoreType: Tm3StoreType;
 out theStream: Tm3Store;
 out theReturn: hResult;
 aUseCompression: Boolean);
//#UC START# *54520C63028A_4FA2766F02A5_var*
//#UC END# *54520C63028A_4FA2766F02A5_var*
begin
//#UC START# *54520C63028A_4FA2766F02A5_impl*
 Assert(false);
 if SUCCEEDED(theReturn) then
  theReturn := E_NOTIMPL;
//#UC END# *54520C63028A_4FA2766F02A5_impl*
end;//Tm3BaseStorage.DoOpenStore

function Tm3BaseStorage.DestroyElement(aName: PWideChar): HResult;
//#UC START# *54522C200280_4FA2766F02A5_var*

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_FILENOTFOUND,
    STG_E_TOOMANYOPENFILES,     
    STG_E_ACCESSDENIED,
    STG_E_INSUFFICIENTMEMORY,
    STG_E_INVALIDPOINTER,
    STG_E_INVALIDPARAMETER,
    STG_E_INVALIDNAME,
    STG_E_REVERTED:           begin

                               Result := AErrorCode;

                              end;

    else                      begin

                               Result := AErrorCode{E_UNEXPECTED};

                              end;

   end;

  end;

//#UC END# *54522C200280_4FA2766F02A5_var*
begin
//#UC START# *54522C200280_4FA2766F02A5_impl*
 Result := S_OK;
 try
  if m2COMCheckAccess(Self.Access,STGM_WRITE) then
   DoDestroyElement(l3PCharLen(aName), Result)
  else
   Result := STG_E_ACCESSDENIED;
 except
  on E: EOutOfMemory do
   Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
  on E: EOleSysError do
   Result := __ValidErrorCode(E.ErrorCode);
  on E: Exception do
  begin
   l3System.Exception2Log(E);
   Result := E_UNEXPECTED;
  end;//on E: Exception
  else
   Result := E_UNEXPECTED;
 end;//try..except
//#UC END# *54522C200280_4FA2766F02A5_impl*
end;//Tm3BaseStorage.DestroyElement

function Tm3BaseStorage.EnumElements(unused1: Integer;
 unused2: Pointer;
 unused3: Integer;
 out theStatStg: IEnumStatStg): HResult;
//#UC START# *5452303401DA_4FA2766F02A5_var*

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_INSUFFICIENTMEMORY,
    STG_E_INVALIDPARAMETER,
    STG_E_REVERTED:           begin

                               Result := AErrorCode;

                              end;

    else                      begin

                               Result := AErrorCode{E_UNEXPECTED};

                              end;

   end;

  end;

 var
        LEnumStatStg:             IEnumStatStg;
//#UC END# *5452303401DA_4FA2766F02A5_var*
begin
//#UC START# *5452303401DA_4FA2766F02A5_impl*

  Result := S_OK;
   try

    LEnumStatStg:=nil;
     try

      if ((unused1 <> 0) or (unused2 <> nil) or (unused3 <> 0))
       then
        begin

         Result := STG_E_INVALIDPARAMETER;

        end
       else
        begin

         DoEnumElements(LEnumStatStg,Result);

        end;

     finally

      if (@theStatStg <> nil)
       then
        begin

         theStatStg:=LEnumStatStg;

        end;

     end;

   except

    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

//#UC END# *5452303401DA_4FA2766F02A5_impl*
end;//Tm3BaseStorage.EnumElements

function Tm3BaseStorage.Stat(out theStatStg: TStatStg;
 aStatFlag: Integer): HResult;
//#UC START# *545244AA00BB_4FA2766F02A5_var*

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_ACCESSDENIED,
    STG_E_INSUFFICIENTMEMORY,
    STG_E_INVALIDPARAMETER,
    STG_E_INVALIDFLAG:        begin

                               Result := AErrorCode;

                              end;

    else                      begin

                               Result := AErrorCode{E_UNEXPECTED};

                              end;

   end;

  end;

 var
        LStatStg:                 TStatStg;
//#UC END# *545244AA00BB_4FA2766F02A5_var*
begin
//#UC START# *545244AA00BB_4FA2766F02A5_impl*

  Result := S_OK;
   try

    l3FillChar(LStatStg,SizeOf(LStatStg));
     try

      DoStat(LStatStg,AStatFlag,Result);

     finally

      m2MEMCopy(@theStatStg,@LStatStg,SizeOf(LStatStg));

     end;

   except
    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

//#UC END# *545244AA00BB_4FA2766F02A5_impl*
end;//Tm3BaseStorage.Stat

//#UC START# *4FA2766F02A5impl*
procedure   Tm3BaseStorage.CopyTo(const AExcludeCount: LongInt;
                                  const AExcludeArray: PIID;
                                  const AExcludeSNB: TSNB;
                                  const AStorage: IStorage;
                                  var   AReturn: HRESULT
                                 );
begin
 if SUCCEEDED(AReturn) then
  AReturn := E_NOTIMPL;
end;

procedure Tm3BaseStorage.MoveElementTo(const ASrcName : Tl3WString;
                                       const AStorage : IStorage;
                                       const ADstName : PWideChar;
                                       const AFlags   : LongInt;
                                       var   AReturn  : HRESULT);
begin
 if SUCCEEDED(AReturn) then
  AReturn := E_NOTIMPL;
end;

procedure   Tm3BaseStorage.Commit(AFlags: LongInt;
                                  var   AReturn: HRESULT
                                 );
begin
 if SUCCEEDED(AReturn) then
  AReturn := E_NOTIMPL;
end;

procedure   Tm3BaseStorage.Revert(var   AReturn: HRESULT
                                 );
begin
 if SUCCEEDED(AReturn) then
  AReturn := E_NOTIMPL;
end;

procedure   Tm3BaseStorage.DoEnumElements(var   AEnumStatStg: IEnumStatStg;
                                        var   AReturn: HRESULT
                                       );
begin
 if SUCCEEDED(AReturn) then
  AReturn := E_NOTIMPL;
end;

procedure Tm3BaseStorage.DoDestroyElement(const AName   : Tl3WString;
                                        var   AReturn : HRESULT);
begin
 if SUCCEEDED(AReturn) then
  AReturn := E_NOTIMPL;
end;

procedure Tm3BaseStorage.RenameElement(const AOldName : Tl3WString;
                                       const ANewName : Tl3WString;
                                       var   AReturn  : HRESULT);
begin
 if SUCCEEDED(AReturn) then
  AReturn := E_NOTIMPL;
end;

procedure   Tm3BaseStorage.SetElementTimes(const AName: PWideChar;
                                           const ACTime: Windows.TFileTime;
                                           const AATime: Windows.TFileTime;
                                           const AMTime: Windows.TFileTime;
                                           var   AReturn: HRESULT
                                          );
begin
 if SUCCEEDED(AReturn) then
  AReturn := E_NOTIMPL;
end;

 procedure   Tm3BaseStorage.DoStat(var   AStatStg: TStatStg;
                                 AStatFlag: LongInt;
                                 var   AReturn: HRESULT);
 begin

  if SUCCEEDED(AReturn)
   then
    begin

     with AStatStg do
      begin

       if (AStatFlag = STATFLAG_NONAME) then
        pwcsName := nil
       else
        m2COMAllocWideBuff(pwcsName, DoGetName);

       dwType := STGTY_STORAGE;
       cbSize := DoGetSize;
       grfMode := DoGetAccess;

       clsid := GUID_NULL;
       grfStateBits := 0;

      end;

    end;

 end;

 function    Tm3BaseStorage.COMCreateStream(      AName: PWideChar;
                                                  AStatStgMode: LongInt;
                                                  _unused1: LongInt;
                                                  _unused2: LongInt;
                                            out   AStream: IStream
                                           ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_INVALIDFUNCTION,
    STG_E_TOOMANYOPENFILES,
    STG_E_ACCESSDENIED,
    STG_E_INSUFFICIENTMEMORY,
    STG_E_INVALIDPOINTER,
    STG_E_FILEALREADYEXISTS,
    STG_E_INVALIDPARAMETER,
    STG_E_INVALIDNAME,
    STG_E_INVALIDFLAG,
    STG_E_REVERTED:           begin

                               Result := AErrorCode;

                              end;

    else                      begin

                               Result := AErrorCode{E_UNEXPECTED};

                              end;

   end;

  end;

 var
        LStream:                  IStream;
        l_S : Tm3Store;
 begin

  Result := S_OK;
   try

    LStream:=nil;
     try

      if ((_unused1 <> 0) or (_unused2 <> 0))
       then
        begin

         Result := STG_E_INVALIDPARAMETER;

        end
       else
        begin
         if m2COMCheckAccess(Self.Access,m2COMModeAccess(AStatStgMode))
          then
          begin
           DoCreateStore(l3PCharLen(AName), AStatStgMode, STGTY_STREAM, l_S, Result, true);
           lStream := l_S.rStream;
          end
          else
           Result := STG_E_ACCESSDENIED;
        end;

     finally

      if (@AStream <> nil)
       then
        begin

         AStream:=LStream;

        end;

     end;

   except
    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

function    Tm3BaseStorage.COMOpenStream(AName        : PWideChar;
                                         _unused1     : Pointer;
                                         AStatStgMode : LongInt;
                                         _unused2     : LongInt;
                                         out AStream  : IStream): HRESULT;

 function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
 begin

  case AErrorCode of

   STG_E_INVALIDFUNCTION,
   STG_E_FILENOTFOUND,
   STG_E_TOOMANYOPENFILES,
   STG_E_ACCESSDENIED,
   STG_E_INSUFFICIENTMEMORY,
   STG_E_INVALIDPOINTER,
   STG_E_INVALIDPARAMETER,
   STG_E_INVALIDNAME,
   STG_E_INVALIDFLAG,
   STG_E_REVERTED:           begin

                              Result := AErrorCode;

                             end;

   else                      begin

                              Result := AErrorCode{E_UNEXPECTED};

                             end;

  end;

 end;

var
 l_Stream : IStream;
 l_S      : Tm3Store;
begin//COMOpenStream
 Result := S_OK;
 try
  l_Stream:=nil;
  try
   if ((_unused1 <> nil) or (_unused2 <> 0)) then
    Result := STG_E_INVALIDPARAMETER
   else
   if m2COMCheckAccess(Self.Access,m2COMModeAccess(AStatStgMode)) then
   begin
    DoOpenStore(l3PCharLen(AName), AStatStgMode, STGTY_STREAM, l_S, Result, true);
    l_Stream := l_S.rStream;
   end
   else
    Result := STG_E_ACCESSDENIED;
  finally
   if (@AStream <> nil) then
    AStream := l_Stream;
  end;//try..finally
 except
  on E: EOutOfMemory do
   Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
  on E: EOleSysError do
   Result := __ValidErrorCode(E.ErrorCode);
  on E: Exception do
  begin
   l3System.Exception2Log(E);
   Result := E_UNEXPECTED;
  end;//on E: Exception
  else
   Result := E_UNEXPECTED;
 end;//try..except
end;//COMOpenStream

function    Tm3BaseStorage.COMCreateStorage(      AName: PWideChar;
                                                  AStatStgMode: LongInt;
                                                  _unused1: LongInt;
                                                  _unused2: LongInt;
                                            out   AStorage: IStorage
                                           ): HRESULT;

 function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
 begin

  case AErrorCode of

   STG_E_INVALIDFUNCTION,
   STG_E_TOOMANYOPENFILES,
   STG_E_ACCESSDENIED,
   STG_E_INSUFFICIENTMEMORY,
   STG_E_INVALIDPOINTER,
   STG_E_FILEALREADYEXISTS,
   STG_E_INVALIDPARAMETER,
   STG_E_INVALIDNAME,
   STG_E_INVALIDFLAG,
   STG_E_REVERTED:           begin

                              Result := AErrorCode;

                             end;

   else                      begin

                              Result := AErrorCode{E_UNEXPECTED};

                             end;

  end;

 end;

var
 LStorage : IStorage;
 l_S : Tm3Store;
begin
 Result := S_OK;
 try
  LStorage:=nil;
  try
   if ((_unused1 <> 0) or (_unused2 <> 0)) then
    Result := STG_E_INVALIDPARAMETER
   else
   if m2COMCheckAccess(Self.Access,m2COMModeAccess(AStatStgMode)) then
   begin
    DoCreateStore(l3PCharLen(AName), AStatStgMode, STGTY_STORAGE, l_S, Result, true);
    lStorage := l_S.AsIStorage;
   end
   else
    Result := STG_E_ACCESSDENIED;
  finally
   if (@AStorage <> nil) then
    AStorage:=LStorage;
  end;//try..finally
 except
  on E: EOutOfMemory do
   Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
  on E: EOleSysError do
   Result := __ValidErrorCode(E.ErrorCode);
  on E: Exception do
  begin
   l3System.Exception2Log(E);
   Result := E_UNEXPECTED;
  end;//on E: Exception
  else
   Result := E_UNEXPECTED;
 end;//try..except
end;

function Tm3BaseStorage.COMOpenStorage(AName          : PWideChar;
                                       const _unused1 : IStorage;
                                       AStatStgMode   : LongInt;
                                       _unused2       : TSNB;
                                       _unused3       : LongInt;
                                       out   AStorage : IStorage): HRESULT;

 function __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
 begin
  case AErrorCode of
   STG_E_INVALIDFUNCTION,
   STG_E_FILENOTFOUND,
   STG_E_TOOMANYOPENFILES,
   STG_E_ACCESSDENIED,
   STG_E_INSUFFICIENTMEMORY,
   STG_E_INVALIDPOINTER,
   STG_E_INVALIDPARAMETER,
   STG_E_INVALIDNAME,
   STG_E_INVALIDFLAG,
   STG_E_REVERTED:
    Result := AErrorCode;
   else
    Result := AErrorCode{E_UNEXPECTED};
  end;//case AErrorCode
 end;

var
 LStorage : IStorage;
 l_S : Tm3Store;
begin//COMOpenStorage
 Result := S_OK;
 try
  LStorage := nil;
  try
   if ((_unused1 <> nil) or (_unused2 <> nil) or (_unused3 <> 0)) then
    Result := STG_E_INVALIDPARAMETER
   else
   if m2COMCheckAccess(Self.Access,m2COMModeAccess(AStatStgMode)) then
   begin
    DoOpenStore(l3PCharLen(AName), AStatStgMode, STGTY_STORAGE, l_S, Result, true);
    lStorage := l_S.AsIStorage;
   end 
   else
    Result := STG_E_ACCESSDENIED;
  finally
   if (@AStorage <> nil) then
    AStorage := LStorage;
  end;//try..finally
 except
  on E: EOutOfMemory do
   Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
  on E: EOleSysError do
   Result := __ValidErrorCode(E.ErrorCode);
  on E: Exception do
  begin
   l3System.Exception2Log(E);
   Result := E_UNEXPECTED;
  end;//on E: Exception
  else
   Result := E_UNEXPECTED;
 end;//try..except
end;//COMOpenStorage

 function    Tm3BaseStorage.COMCopyTo(      AExcludeCount: LongInt;
                                            AExcludeArray: PIID;
                                            AExcludeSNB: TSNB;
                                      const AStorage: IStorage
                                     ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_TOOMANYOPENFILES,
    STG_E_ACCESSDENIED,
    STG_E_INSUFFICIENTMEMORY,
    STG_E_INVALIDPOINTER,
    STG_E_INVALIDPARAMETER,
    STG_E_MEDIUMFULL,
    STG_E_REVERTED:           begin

                               Result := AErrorCode;

                              end;

    else                      begin

                               Result := AErrorCode{E_UNEXPECTED};

                              end;

   end;

  end;

 begin

  Result := S_OK;
   try

    CopyTo(AExcludeCount,AExcludeArray,AExcludeSNB,AStorage,Result);

   except
    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

function Tm3BaseStorage.COMMoveElementTo(ASrcName       : PWideChar;
                                         const AStorage : IStorage;
                                         ADstName       : PWideChar;
                                         AFlags         : LongInt): HRESULT;

 function __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
 begin
  case AErrorCode of
   STG_E_FILENOTFOUND,
   STG_E_TOOMANYOPENFILES,
   STG_E_ACCESSDENIED,
   STG_E_INSUFFICIENTMEMORY,
   STG_E_INVALIDPOINTER,
   STG_E_FILEALREADYEXISTS,
   STG_E_INVALIDPARAMETER,
   STG_E_INVALIDNAME,
   STG_E_INVALIDFLAG,
   STG_E_REVERTED:
    Result := AErrorCode;
   else
    Result := AErrorCode{E_UNEXPECTED};
  end;//case AErrorCode
 end;

begin//COMMoveElementTo
 Result := S_OK;
 try
  if ((AFlags < STGMOVE_MOVE) or (AFlags > STGMOVE_COPY)) then
   Result := STG_E_INVALIDFLAG
  else
  if ((AFlags = STGMOVE_COPY) or ((AFlags = STGMOVE_MOVE) and m2COMCheckAccess(Self.Access,STGM_WRITE))) then
   MoveElementTo(l3PCharLen(ASrcName),AStorage,ADstName,AFlags,Result)
  else
   Result := STG_E_ACCESSDENIED;
 except
  on E: EOutOfMemory do
   Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
  on E: EOleSysError do
   Result := __ValidErrorCode(E.ErrorCode);
  on E: Exception do
  begin
   l3System.Exception2Log(E);
   Result := E_UNEXPECTED;
  end;//on E: Exception
  else
   Result := E_UNEXPECTED;
 end;//try..except
end;//COMMoveElementTo

 function    Tm3BaseStorage.COMCommit(AFlags: LongInt
                                     ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_TOOMANYOPENFILES,  
    STG_E_INVALIDPARAMETER,  
    STG_E_MEDIUMFULL,        
    STG_E_INVALIDFLAG,       
    STG_E_NOTCURRENT,        
    STG_E_REVERTED:         begin

                             Result:=AErrorCode;

                            end;

    else                    begin

                             Result := AErrorCode{E_UNEXPECTED};

                            end;

   end;

  end;

 begin

  Result := S_OK;
   try

    if m2COMCheckAccess(Self.Access,STGM_WRITE)
     then
      begin

       Commit(AFlags,Result);

      end;

   except
    on E: EOutOfMemory do
     Result:=__ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result:=__ValidErrorCode(E.ErrorCode);
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

 function    Tm3BaseStorage.COMRevert(
                                     ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_TOOMANYOPENFILES,
    STG_E_INSUFFICIENTMEMORY,
    STG_E_REVERTED:           begin

                               Result:=AErrorCode;

                              end;

    else                      begin

                               Result := AErrorCode{E_UNEXPECTED};

                              end;

   end;

  end;

 begin

  Result := S_OK;
   try

    Revert(Result);

   except
    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

function Tm3BaseStorage.COMRenameElement(AOldName : PWideChar;
                                         ANewName : PWideChar): HRESULT;

 function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
 begin

  case AErrorCode of

   STG_E_FILENOTFOUND,
   STG_E_TOOMANYOPENFILES,
   STG_E_ACCESSDENIED,
   STG_E_INSUFFICIENTMEMORY,
   STG_E_INVALIDPOINTER,
   STG_E_FILEALREADYEXISTS,
   STG_E_INVALIDPARAMETER,
   STG_E_INVALIDNAME,
   STG_E_REVERTED:           begin

                              Result := AErrorCode;

                             end;

   else                      begin

                              Result := AErrorCode{E_UNEXPECTED};

                             end;

  end;

 end;

begin
 Result := S_OK;
 try
  if m2COMCheckAccess(Self.Access,STGM_WRITE) then
   RenameElement(l3PCharLen(AOldName), l3PCharLen(ANewName), Result)
  else
   Result := STG_E_ACCESSDENIED;
 except
  on E: EOutOfMemory do
   Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
  on E: EOleSysError do
   Result := __ValidErrorCode(E.ErrorCode);
  on E: Exception do
  begin
   l3System.Exception2Log(E);
   Result := E_UNEXPECTED;
  end;//on E: Exception
  else
   Result := E_UNEXPECTED;
 end;//try..except
end;

 function    Tm3BaseStorage.COMSetElementTimes(      AName: PWideChar;
                                               const ACTime: Windows.TFileTime;
                                               const AATime: Windows.TFileTime;
                                               const AMTime: Windows.TFileTime
                                              ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_FILENOTFOUND,         
    STG_E_TOOMANYOPENFILES,     
    STG_E_ACCESSDENIED,         
    STG_E_INSUFFICIENTMEMORY,
    STG_E_INVALIDPOINTER,
    STG_E_INVALIDPARAMETER,     
    STG_E_INVALIDNAME,          
    STG_E_REVERTED:           begin

                               Result := AErrorCode;

                              end;

    else                      begin

                               Result := AErrorCode{E_UNEXPECTED};

                              end;

   end;

  end;

 begin

  Result := S_OK;
   try

    if m2COMCheckAccess(Self.Access,STGM_WRITE)
     then
      begin

       SetElementTimes(AName,ACTime,AATime,AMTime,Result);

      end
     else
      begin

       Result := STG_E_ACCESSDENIED;

      end;

   except
    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

 function    Tm3BaseStorage.COMSetClass(const ACLSID: TCLSID
                                       ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_ACCESSDENIED,
    STG_E_MEDIUMFULL,
    STG_E_REVERTED:     begin

                         Result := AErrorCode;

                        end;

    else                begin

                         Result := AErrorCode{E_UNEXPECTED};

                        end;

   end;

  end;

 begin

  Result := S_OK;
   try

    if m2COMCheckAccess(Self.Access,STGM_WRITE)
     then
      begin

       //SetClass(ACLSID,Result);

      end
     else
      begin

       Result := STG_E_ACCESSDENIED;

      end;

   except

    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

 function    Tm3BaseStorage.COMSetStateBits(      AStateBits: LongInt;
                                                  AMask: LongInt
                                           ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_ACCESSDENIED,
    STG_E_INVALIDPARAMETER,
    STG_E_INVALIDFLAG:      begin

                             Result := AErrorCode;

                            end;

    else                    begin

                             Result := AErrorCode{E_UNEXPECTED};

                            end;

   end;

  end;

 begin

  Result := S_OK;
   try

    if m2COMCheckAccess(Self.Access,STGM_WRITE)
     then
      begin

       //SetStateBits(AStateBits,AMask,Result);

      end
     else
      begin

       Result := STG_E_ACCESSDENIED;

      end;

   except
    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

//#UC END# *4FA2766F02A5impl*

end.
