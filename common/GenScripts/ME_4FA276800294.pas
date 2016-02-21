unit m3BaseStream;

// ������: "w:\common\components\rtl\Garant\m3\m3BaseStream.pas"
// ���������: "SimpleClass"

{$Include w:\common\components\rtl\Garant\m3\m3Define.inc}

interface

uses
 l3IntfUses
 , m3PrimStream
 , ActiveX
;

type
 //#UC START# *4FA276800294ci*
 //#UC END# *4FA276800294ci*
 //#UC START# *4FA276800294cit*
 //#UC END# *4FA276800294cit*
 Tm3BaseStream = {abstract} class(Tm3PrimStream, IStream)
 //#UC START# *4FA276800294publ*
   public
   // public methods

          function          IStreamRead             (      ABuff: Pointer;
                                                       ASize: LongInt;
                                                       AResult: PLongInt
                                                ): HRESULT; override;

          function          IStreamWrite            (      ABuff: Pointer;
                                                       ASize: LongInt;
                                                       AResult: PLongInt
                                                ): HRESULT; override;


          function          IStreamSeek             (      AOffset: Int64;
                                                       AOrigin: LongInt;
                                                 out   AResult: Int64
                                                ): HRESULT; override;


          function          IStreamSetSize          (      ASize: Int64
                                                ): HRESULT; override;


          function          IStreamLockRegion       (      AOffset: Int64;
                                                       ASize: Int64;
                                                       ALockType: LongInt
                                                ): HRESULT; override;

          function          IStreamUnlockRegion     (      AOffset: Int64;
                                                       ASize: Int64;
                                                       ALockType: LongInt
                                                ): HRESULT; override;


          function          IStreamStat             (out   AStatStg: TStatStg;
                                                       AStatFlag: LongInt
                                                ): HRESULT; override;


          function          IStreamCommit           (AFlags: LongInt
                                                ): HRESULT; override;

          function          IStreamRevert           (
                                                ): HRESULT; override;


          function          IStreamClone            (out   AStream: IStream
                                                ): HRESULT; override;
 //#UC END# *4FA276800294publ*
 end;//Tm3BaseStream

implementation

uses
 l3ImplUses
 , Windows
 , m2COMLib
 , SysUtils
 , ComObj
 , l3Base
 , Classes
 , m2MemLib
;

//#UC START# *4FA276800294impl*

// start class Tm3BaseStream

function Tm3BaseStream.IStreamRead(ABuff   : Pointer;
                               ASize   : LongInt;
                               AResult : PLongInt): HRESULT;

 function __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
 begin//__ValidErrorCode
  case AErrorCode of
   STG_E_ACCESSDENIED,
   STG_E_INVALIDPOINTER,
   STG_E_REVERTED:
    Result := AErrorCode;
   else
    Result := AErrorCode{E_UNEXPECTED};
  end;//case AErrorCode
 end;//__ValidErrorCode

var
 LResult : LongInt;
begin//COMRead
 Result := S_OK;
 try
  LResult := 0;
  try
   if m2COMCheckAccess(Self.Access, STGM_READ) then
   begin
    DoRead(ABuff, ASize, LResult, Result);
    if ((Result = S_OK) and (LResult <> ASize)) then
     Result := S_FALSE;
   end//m2COMCheckAccess(Self.Access, STGM_READ)
   else
    Result := STG_E_ACCESSDENIED;
  finally
   if (AResult <> nil) then
    AResult^:=LResult;
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
end;//COMRead

function Tm3BaseStream.IStreamWrite(ABuff   : Pointer;
                                ASize   : LongInt;
                                AResult : PLongInt): HRESULT;

 function __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
 begin//__ValidErrorCode
  case aErrorCode of
   STG_E_ACCESSDENIED,
   STG_E_INVALIDPOINTER,
   STG_E_WRITEFAULT,
   STG_E_MEDIUMFULL,
   STG_E_REVERTED:
    Result := AErrorCode;
   else
    Result := AErrorCode{E_UNEXPECTED};
  end;//case aErrorCode
 end;//__ValidErrorCode

var
 LResult : LongInt;
begin//COMWrite
 Result := S_OK;
 try
  LResult := 0;
  try
   if m2COMCheckAccess(Self.Access, STGM_WRITE) then
   begin
    DoWrite(ABuff, ASize, LResult, Result);
    if ((Result = S_OK) and (LResult <> ASize)) then
     Result := STG_E_CANTSAVE;
   end//m2COMCheckAccess(Self.Access, STGM_WRITE)
   else
    Result := STG_E_ACCESSDENIED;
  finally
   if (AResult <> nil) then
    AResult^:=LResult;
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
end;//COMWrite

function Tm3BaseStream.IStreamSeek(AOffset : Int64;
                               AOrigin : LongInt;
                               out AResult : Int64): HRESULT;

 function __ValidErrorCode(AErrorCode: HRESULT): HRESULT;
 begin//__ValidErrorCode
  case AErrorCode of
   STG_E_INVALIDFUNCTION,
   STG_E_INVALIDPOINTER,
   STG_E_REVERTED:
    Result := AErrorCode;
   else
    Result := AErrorCode{E_UNEXPECTED};
  end;//case AErrorCode
 end;//__ValidErrorCode

var
 LResult : Int64;
begin
 Result := S_OK;
 try
  LResult:=Int64(-1);
  try
   DoSeek(AOffset, TSeekOrigin(AOrigin), LResult, Result);
   if ((Result = S_OK) and (LResult = Int64(-1))) then
    Result := STG_E_INVALIDFUNCTION;
  finally
   if (@AResult <> nil) then
    AResult:=LResult;
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

 function    Tm3BaseStream.IStreamSetSize(      ASize: Int64
                                     ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_INVALIDFUNCTION,
    STG_E_MEDIUMFULL,
    STG_E_REVERTED:        begin

                            Result := AErrorCode;

                           end;

    else                   begin

                            Result := AErrorCode{E_UNEXPECTED};

                           end;

   end;

  end;

 begin

  Result := S_OK;
   try

    DoSetSize(ASize,Result);

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

 function    Tm3BaseStream.IStreamLockRegion(      AOffset: Int64;
                                               ASize: Int64;
                                               ALockType: LongInt
                                        ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_INVALIDFUNCTION,
    STG_E_LOCKVIOLATION,
    STG_E_REVERTED:        begin

                            Result := AErrorCode;

                           end;

    else                   begin

                            Result := AErrorCode{E_UNEXPECTED};

                           end;

   end;

  end;

 begin

  Result := S_OK;
   try

    LockRegion(AOffset,ASize,ALockType,Result);

   except
    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: EAssertionFailed do
    begin
     l3System.Exception2Log(E);
     Result := E_NOTIMPL;
    end;//on E: EAssertionFailed
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

 function    Tm3BaseStream.IStreamUnlockRegion(      AOffset: Int64;
                                                 ASize: Int64;
                                                 ALockType: LongInt
                                          ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_INVALIDFUNCTION,
    STG_E_LOCKVIOLATION,
    STG_E_REVERTED:        begin

                            Result := AErrorCode;

                           end;

    else                   begin

                            Result := AErrorCode{E_UNEXPECTED};

                           end;

   end;

  end;

 begin

  Result := S_OK;
   try

    UnlockRegion(AOffset,ASize,ALockType,Result);

   except
    on E: EOutOfMemory do
     Result := __ValidErrorCode(STG_E_INSUFFICIENTMEMORY);
    on E: EOleSysError do
     Result := __ValidErrorCode(E.ErrorCode);
    on E: EAssertionFailed do
    begin
     l3System.Exception2Log(E);
     Result := E_NOTIMPL;
    end;//on E: EAssertionFailed
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

 function    Tm3BaseStream.IStreamStat(out   AStatStg: TStatStg;
                                         AStatFlag: LongInt
                                  ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_ACCESSDENIED,
    STG_E_INSUFFICIENTMEMORY,
    STG_E_INVALIDPOINTER,
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
        LStatStg:                 TStatStg;
 begin

  Result := S_OK;
   try

    l3FillChar(LStatStg,SizeOf(LStatStg));
     try

      Stat(LStatStg,AStatFlag,Result);

     finally

      m2MEMCopy(@AStatStg,@LStatStg,SizeOf(LStatStg));

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

 function    Tm3BaseStream.IStreamCommit(AFlags: LongInt
                                    ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_MEDIUMFULL,
    STG_E_REVERTED:   begin

                       Result := AErrorCode;

                      end;

    else              begin

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

 function    Tm3BaseStream.IStreamRevert(
                                    ): HRESULT;

 begin

  Result := S_OK;
   try

    Revert(Result);

   except
    on E: Exception do
    begin
     l3System.Exception2Log(E);
     Result := E_UNEXPECTED;
    end;//on E: Exception
    else
     Result := E_UNEXPECTED;
   end;//try..except

 end;

 function    Tm3BaseStream.IStreamClone(out   AStream: IStream
                                   ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    STG_E_INSUFFICIENTMEMORY,
    STG_E_INVALIDPOINTER,
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
 begin

  Result := S_OK;
   try

    LStream:=nil;
     try

      Clone(LStream,Result);

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

//#UC END# *4FA276800294impl*

end.
