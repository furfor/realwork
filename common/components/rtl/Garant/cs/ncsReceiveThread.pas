unit ncsReceiveThread;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//
// ���������� "cs"
// ������: "w:/common/components/rtl/Garant/cs/ncsReceiveThread.pas"
// ������ Delphi ���������� (.pas)
// Generated from UML model, root element: <<SimpleClass::Class>> Shared Delphi For Archi::cs::Messages::TncsReceiveThread
//
//
// ��� ����� ����������� ��� ��� "������-������".
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// ! ��������� ������������ � ������. ������� ������ - ������. !

{$Include ..\cs\CsDefine.inc}

interface

{$If not defined(Nemesis)}
uses
  ncsTransporterIOThread
  ;
{$IfEnd} //not Nemesis

{$If not defined(Nemesis)}
type
 TncsReceiveThread = class(TncsTransporterIOThread)
 protected
 // overridden protected methods
   procedure DoExecute; override;
     {* �������� ��������� ����. ��� ���������� � �������� }
 end;//TncsReceiveThread
{$IfEnd} //not Nemesis

implementation

{$If not defined(Nemesis)}
uses
  Classes,
  l3TempMemoryStream,
  SysUtils,
  l3Base,
  ncsMessage,
  ncsMessageFactory,
  evdNcsTypes,
  ncsProfile
  ;
{$IfEnd} //not Nemesis

{$If not defined(Nemesis)}

const
   { ThreadTimeouts }
  c_ReadTimeout = 300;

// start class TncsReceiveThread

procedure TncsReceiveThread.DoExecute;
//#UC START# *4911B69E037D_54534F1A00BF_var*
var
 l_Stream: TStream;
{$IFDEF ncsSniffMessage}
 l_Stream2: TStream;
 l_Str: AnsiString;
{$ENDIF ncsSniffMessage}
 l_Message: TncsMessage;
 l_InvalidReply: TncsInvalidMessage;
//#UC END# *4911B69E037D_54534F1A00BF_var*
begin
//#UC START# *4911B69E037D_54534F1A00BF_impl*
 try
  while not TerminatedConnection do
  begin

   if IOHandler.WaitForReadData(c_ReadTimeout) then
   begin
    if TerminatedConnection then
     Exit;
    l_Stream := Tl3TempMemoryStream.Create;
    try
     IOHandler.ReadStream(l_Stream);
     g_ReveiveMessage.Start;
     try
      l_Stream.Seek(0, soFromBeginning);
{$IFDEF ncsSniffMessage}
      l_Stream2 := TFileStream.Create(ParamStr(0)+'.msg', fmOpenWrite);
      try
       l_Stream2.Seek(0, soEnd);
       l_Str := Format('*** %s ***'#13#10, [FormatDateTime('dd.mm.yyyy hh:nn:ss.zzz', Now)]);
       l_Stream2.Write(l_Str[1], Length(l_Str));
       l_STream2.CopyFrom(l_Stream, 0);
       l_Stream.Seek(0, soBeginning);
       l_Str := '*** ! ***'#13#10;
       l_Stream2.Write(l_Str[1], Length(l_Str));
      finally
       FreeAndNil(l_STream2);
      end;
{$ENDIF ncsSniffMessage}

      g_LoadMessage.Start;
      try
       l_Message := TncsMessageFactory.MakeFromEVD(l_Stream);
      finally
       g_LoadMessage.Stop;
      end;
      try
       if Assigned(l_Message) then
        Queue.Push(l_Message)
       else
        l3System.Msg2Log('�� ������� ��������� ncsMessage!!');
      finally
       FreeAndNil(l_Message);
      end;
     finally
      g_ReveiveMessage.Stop;
     end;
    finally
     FreeAndNil(l_Stream);
    end;
   end
   else
   begin
    if TerminatedConnection then
     Exit;
    Sleep(0); 
   end;
  end;
 finally
  ReleaseIOHandler;
  Queue.SignalMessageReady;
 end;
//#UC END# *4911B69E037D_54534F1A00BF_impl*
end;//TncsReceiveThread.DoExecute

{$IfEnd} //not Nemesis

end.