unit m3BaseEnumStatStg;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "m3"
// ������: "w:/common/components/rtl/Garant/m3/m3BaseEnumStatStg.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi For Archi::m3::m3CoreObjects::Tm3BaseEnumStatStg
//
// ������� ����� ��� ���������� IEnumStatStg
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\m3\m3Define.inc}

interface

uses
  ActiveX,
  l3CProtoObject
  ;

type
//#UC START# *548588F802A3ci*
//#UC END# *548588F802A3ci*
//#UC START# *548588F802A3cit*
//#UC END# *548588F802A3cit*
 Tm3BaseEnumStatStg = class(Tl3CProtoObject, IEnumStatStg)
  {* ������� ����� ��� ���������� IEnumStatStg }
//#UC START# *548588F802A3publ*
         private


                function          IEnumStatStg.Next=COMNext;
                function          IEnumStatStg.Skip=COMSkip;
                function          IEnumStatStg.Reset=COMReset;
                function          IEnumStatStg.Clone=COMClone;


         protected


                procedure         Next                (const ACount: LongInt;
                                                       const ABuff: PStatStg;
                                                       const AResult: PLongInt;
                                                       var   AReturn: HRESULT
                                                      ); virtual;

                procedure         Skip                (const ACount: LongInt;
                                                       var   AReturn: HRESULT
                                                      ); virtual;


                procedure         Reset               (var   AReturn: HRESULT
                                                      ); virtual;


                procedure         Clone               (var   AEnumStatStg: IEnumStatStg;
                                                       var   AReturn: HRESULT
                                                      ); reintroduce; virtual;


         public


                function          COMNext             (      ACount: LongInt;
                                                       out   ABuff;
                                                             AResult: PLongInt
                                                      ): HRESULT; stdcall;

                function          COMSkip             (      ACount: LongInt
                                                      ): HRESULT; stdcall;


                function          COMReset            (
                                                      ): HRESULT; stdcall;


                function          COMClone            (out   AEnumStatStg: IEnumStatStg
                                                      ): HRESULT; stdcall;
//#UC END# *548588F802A3publ*
 end;//Tm3BaseEnumStatStg

implementation

uses
  SysUtils,
  Windows,
  ComObj,
  l3Base,
  m2MemLib
  ;


//#UC START# *548588F802A3impl*

// start class Tm3BaseEnumStatStg

 procedure   Tm3BaseEnumStatStg.Next(const ACount: LongInt;
                                     const ABuff: PStatStg;
                                     const AResult: PLongInt;
                                     var   AReturn: HRESULT
                                    );
 begin

  if SUCCEEDED(AReturn)
   then
    begin

     AReturn:=E_NOTIMPL;

    end;

 end;

 procedure   Tm3BaseEnumStatStg.Skip(const ACount: LongInt;
                                     var   AReturn: HRESULT
                                    );
 begin

  if SUCCEEDED(AReturn)
   then
    begin

     AReturn:=E_NOTIMPL;

    end;

 end;

 procedure   Tm3BaseEnumStatStg.Reset(var   AReturn: HRESULT
                                     );
 begin

  if SUCCEEDED(AReturn)
   then
    begin

     AReturn:=E_NOTIMPL;

    end;

 end;

 procedure   Tm3BaseEnumStatStg.Clone(var   AEnumStatStg: IEnumStatStg;
                                      var   AReturn: HRESULT
                                     );
 begin

  if SUCCEEDED(AReturn)
   then
    begin

     AReturn:=E_NOTIMPL;

    end;

 end;

 function    Tm3BaseEnumStatStg.COMNext(      ACount: LongInt;
                                        out   ABuff;
                                              AResult: PLongInt
                                       ): HRESULT;
 var
        LResult:                  LongInt;
        LStatStg:                 TStatStg;
        LStatStgPtr:              PStatStg;
 begin

  Result := S_OK;
   try

    LResult:=0;
     try

      if (ACount = 1)
       then
        begin

         l3FillChar(LStatStg,SizeOf(LStatStg));
          try

           Next(ACount,@LStatStg,@LResult,Result);

           if ((Result = S_OK) and (LResult <> ACount))
            then
             begin

              Result := S_FALSE;

             end;

          finally

           m2MEMCopy(@ABuff,@LStatStg,SizeOf(LStatStg));

          end;

        end
       else
        begin

         m2MEMAlloc(Pointer(LStatStgPtr),ACount*SizeOf(LStatStgPtr^),0);
          try

           try

            Next(ACount,LStatStgPtr,@LResult,Result);

            if ((Result = S_OK) and (LResult <> ACount))
             then
              begin

               Result := S_FALSE;

              end;

           finally

            m2MEMCopy(@ABuff,LStatStgPtr,LResult*SizeOf(LStatStgPtr^));

           end;

          finally

           m2MEMFree(Pointer(LStatStgPtr));

          end;

        end;

     finally

      if (AResult <> nil)
       then
        begin

         AResult^:=LResult;

        end;

     end;

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

 function    Tm3BaseEnumStatStg.COMSkip(      ACount: LongInt
                                       ): HRESULT;
 begin

  Result := S_OK;
   try

    Skip(ACount,Result);

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

 function    Tm3BaseEnumStatStg.COMReset(
                                        ): HRESULT;
 begin

  Result := S_OK;
   try

    Reset(Result);

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

 function    Tm3BaseEnumStatStg.COMClone(out   AEnumStatStg: IEnumStatStg
                                        ): HRESULT;

  function    __ValidErrorCode(const AErrorCode: HRESULT): HRESULT;
  begin

   case AErrorCode of

    E_OUTOFMEMORY,
    E_INVALIDARG:  begin

                    Result := AErrorCode;

                   end;

    else           begin

                    Result := AErrorCode{E_UNEXPECTED};

                   end;

   end;

  end;

 var
        LEnumStatStg:             IEnumStatStg;
 begin

  Result := S_OK;
   try

    LEnumStatStg:=nil;
     try

      Clone(LEnumStatStg,Result);

     finally

      if (@AEnumStatStg <> nil)
       then
        begin

         AEnumStatStg:=LEnumStatStg;

        end;

     end;

   except
    on E: EOutOfMemory do
     Result := __ValidErrorCode(E_OUTOFMEMORY);
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

//#UC END# *548588F802A3impl*
end.