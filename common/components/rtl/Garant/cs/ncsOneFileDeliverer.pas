unit ncsOneFileDeliverer;

// ������: "w:\common\components\rtl\Garant\cs\ncsOneFileDeliverer.pas"
// ���������: "SimpleClass"
// ������� ������: "TncsOneFileDeliverer" MUID: (546F3804032D)

{$Include w:\common\components\rtl\Garant\cs\CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , l3ProtoObject
 , ncsMessageInterfaces
 , ncsTaskedFileDesc
 , Classes
 , ddProgressObj
 , ncsTrafficCounter
 , ncsFileDesc
 , ncsMessage
;

type
 TncsOneFileDeliverer = class(Tl3ProtoObject, IncsExecutor, IncsMessageExecutorFactory)
  private
   f_Transporter: IncsTransporter;
   f_LocalPath: AnsiString;
   f_TaskID: AnsiString;
   f_Stream: TStream;
   f_Progressor: TddProgressObject;
   f_Counter: IncsTrafficCounter;
   f_ReceiveTime: Double;
   f_WriteTime: Double;
   f_LocalDesc: TncsTaskedFileDesc;
  private
   function CheckContinue(aRemoteDesc: TncsFileDesc): Boolean;
   procedure InitNew(aRemoteDesc: TncsFileDesc);
   function LocalControlFileName: AnsiString;
   function LocalPartialFileName: AnsiString;
   procedure SaveControl;
   function LocalFileName: AnsiString;
  protected
   procedure Execute(const aContext: TncsExecuteContext);
   function MakeExecutor(aMessage: TncsMessage): IncsExecutor;
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
  public
   constructor Create(const aTransporter: IncsTransporter;
    const aTaskID: AnsiString;
    const aLocalPath: AnsiString;
    aRemoteDesc: TncsFileDesc); reintroduce;
   procedure CommitDelivery;
   function DoProcess(aProgressor: TddProgressObject): Boolean;
  public
   property ReceiveTime: Double
    read f_ReceiveTime;
   property WriteTime: Double
    read f_WriteTime;
   property LocalDesc: TncsTaskedFileDesc
    read f_LocalDesc;
 end;//TncsOneFileDeliverer
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 , SysUtils
 , l3Stream
 , l3Types
 , l3CRCUtils
 , ncsGetFilePartReply
 , ncsGetFilePart
 , Math
 , ncsPushFilePart
 , ncsMessageExecutorFactory
 , ncsProfile
 , l3Base
 , l3StopWatch
 , l3FileUtils
 //#UC START# *546F3804032Dimpl_uses*
 //#UC END# *546F3804032Dimpl_uses*
;

const
 cControlExt = '.control';
 cPartialExt = '.partial';

constructor TncsOneFileDeliverer.Create(const aTransporter: IncsTransporter;
 const aTaskID: AnsiString;
 const aLocalPath: AnsiString;
 aRemoteDesc: TncsFileDesc);
//#UC START# *546F389A0156_546F3804032D_var*
//#UC END# *546F389A0156_546F3804032D_var*
begin
//#UC START# *546F389A0156_546F3804032D_impl*
 inherited Create;
 f_Transporter := aTransporter;
 f_LocalPath := aLocalPath;
 f_LocalDesc := TncsTaskedFileDesc.Create;
 f_LocalDesc.Name := aRemoteDesc.Name;
 f_TaskID := aTaskID;
 if not CheckContinue(aRemoteDesc) then
  InitNew(aRemoteDesc);
 f_ReceiveTime := 0;
 f_WriteTime := 0;
 Supports(f_Transporter, IncsTrafficCounter, f_Counter);
//#UC END# *546F389A0156_546F3804032D_impl*
end;//TncsOneFileDeliverer.Create

function TncsOneFileDeliverer.CheckContinue(aRemoteDesc: TncsFileDesc): Boolean;
//#UC START# *5473254E0090_546F3804032D_var*
var
 l_Stream: TStream;
//#UC END# *5473254E0090_546F3804032D_var*
begin
//#UC START# *5473254E0090_546F3804032D_impl*
 Result := False;
 if FileExists(LocalControlFileName) then
 begin
  l_Stream := Tl3FileStream.Create(LocalControlFileName, l3_fmRead);
  try
   f_LocalDesc.LoadFromEVD(l_Stream);
   Assert(f_LocalDesc.Name <> '');
  finally
   FreeAndNil(l_Stream);
  end;
  if not FileExists(LocalPartialFileName) then
   Exit;
  if f_LocalDesc.TaskID <> f_TaskID then
   Exit;
  if f_LocalDesc.CRC <> aRemoteDesc.CRC then
   Exit;
  if f_LocalDesc.DateTime <> aRemoteDesc.DateTime then
   Exit;
  if f_LocalDesc.Size <> aRemoteDesc.Size then
   Exit;
  Result := True;
 end
//#UC END# *5473254E0090_546F3804032D_impl*
end;//TncsOneFileDeliverer.CheckContinue

procedure TncsOneFileDeliverer.InitNew(aRemoteDesc: TncsFileDesc);
//#UC START# *5473255F03A1_546F3804032D_var*
var
 l_Stream: TStream;
//#UC END# *5473255F03A1_546F3804032D_var*
begin
//#UC START# *5473255F03A1_546F3804032D_impl*
 f_LocalDesc.TaskID := f_TaskID;
 f_LocalDesc.CopiedSize := 0;
 f_LocalDesc.CRC := aRemoteDesc.CRC;
 f_LocalDesc.Size := aRemoteDesc.Size;
 f_LocalDesc.DateTime := aRemoteDesc.DateTime;
 ForceDirectories(ExtractFilePath(LocalPartialFileName));
 l_Stream := Tl3FileStream.Create(LocalPartialFileName, l3_fmCreateReadWrite);
 try
  l_Stream.Size := f_LocalDesc.Size;
 finally
  FreeAndNil(l_Stream);
 end;
//#UC END# *5473255F03A1_546F3804032D_impl*
end;//TncsOneFileDeliverer.InitNew

function TncsOneFileDeliverer.LocalControlFileName: AnsiString;
//#UC START# *54732616034A_546F3804032D_var*
//#UC END# *54732616034A_546F3804032D_var*
begin
//#UC START# *54732616034A_546F3804032D_impl*
 Result := f_LocalPath + f_LocalDesc.Name + cControlExt;
//#UC END# *54732616034A_546F3804032D_impl*
end;//TncsOneFileDeliverer.LocalControlFileName

function TncsOneFileDeliverer.LocalPartialFileName: AnsiString;
//#UC START# *5473263D00AC_546F3804032D_var*
//#UC END# *5473263D00AC_546F3804032D_var*
begin
//#UC START# *5473263D00AC_546F3804032D_impl*
 Result := f_LocalPath + f_LocalDesc.Name + cPartialExt;
//#UC END# *5473263D00AC_546F3804032D_impl*
end;//TncsOneFileDeliverer.LocalPartialFileName

procedure TncsOneFileDeliverer.SaveControl;
//#UC START# *5474A3BD0077_546F3804032D_var*
var
 l_Stream: TStream;
//#UC END# *5474A3BD0077_546F3804032D_var*
begin
//#UC START# *5474A3BD0077_546F3804032D_impl*
 g_SaveControl.Start;
 try
  l_Stream := Tl3FileStream.Create(LocalControlFileName, l3_fmCreateReadWrite);
  try
   f_LocalDesc.SaveToEVD(l_Stream, nil);
  finally
   FreeAndNil(l_Stream);
  end;
 finally
  g_SaveControl.Stop;
 end; 
//#UC END# *5474A3BD0077_546F3804032D_impl*
end;//TncsOneFileDeliverer.SaveControl

procedure TncsOneFileDeliverer.CommitDelivery;
//#UC START# *5474A3D400D5_546F3804032D_var*
//#UC END# *5474A3D400D5_546F3804032D_var*
begin
//#UC START# *5474A3D400D5_546F3804032D_impl*
 RenameFileSafe(LocalPartialFileName, LocalFileName);
 if FileExists(LocalControlFileName) then
  DeleteFile(LocalControlFileName);
//#UC END# *5474A3D400D5_546F3804032D_impl*
end;//TncsOneFileDeliverer.CommitDelivery

function TncsOneFileDeliverer.LocalFileName: AnsiString;
//#UC START# *5474A7B201FC_546F3804032D_var*
//#UC END# *5474A7B201FC_546F3804032D_var*
begin
//#UC START# *5474A7B201FC_546F3804032D_impl*
 Result := f_LocalPath + f_LocalDesc.Name;
//#UC END# *5474A7B201FC_546F3804032D_impl*
end;//TncsOneFileDeliverer.LocalFileName

function TncsOneFileDeliverer.DoProcess(aProgressor: TddProgressObject): Boolean;
//#UC START# *5472E6E201EE_546F3804032D_var*
var
 l_Message: TncsGetFilePart;
 l_RawReply: TncsMessage;
 l_Watch: Tl3StopWatch;
 l_StreamWatch: Tl3StopWatch;
const
 cPartSize = 31*1024;
//#UC END# *5472E6E201EE_546F3804032D_var*
begin
//#UC START# *5472E6E201EE_546F3804032D_impl*
{$IFNDEF AQTIME_PROFILE}
 l_StreamWatch.Reset;
 l_Watch.Reset;
 l_Watch.Start;
{$ENDIF AQTIME_PROFILE}
 try
  aProgressor.SetRefTo(f_Progressor);
  try
   TncsMessageExecutorFactory.Instance.Register(Self);
   try
    Result := LocalDesc.CopiedSize = LocalDesc.Size;
    if Assigned(aProgressor) then
     aProgressor.IncProgress(LocalDesc.CopiedSize);
    if not Result then
    begin
     l_RawReply := nil;
     if not FileExists(LocalPartialFileName) then
      raise EInOutError.Create('File not found');
{$IFNDEF AQTIME_PROFILE}
     l_StreamWatch.Start;
{$ENDIF AQTIME_PROFILE}
     f_Stream := Tl3FileStream.Create(LocalPartialFileName, l3_fmExclusiveReadWrite);
{$IFNDEF AQTIME_PROFILE}
     l_StreamWatch.Stop;
{$ENDIF AQTIME_PROFILE}
     try
      repeat
       if not f_Transporter.Processing then
       begin
{$IFNDEF AQTIME_PROFILE}
        l3System.Msg2Log('������ �������� - ����� �����');
{$ENDIF AQTIME_PROFILE}
        Exit;
       end;
       l_Message := TncsGetFilePart.Create;
       try
        l_Message.TaskID := f_TaskID;
        l_Message.FileName := LocalDesc.Name;
        l_Message.Offset := LocalDesc.CopiedSize;
        l_Message.PartSize := Min(cPartSize, LocalDesc.Size - LocalDesc.CopiedSize);
        f_Transporter.Send(l_Message);
        FreeAndNil(l_RawReply);
        try
{$IFNDEF AQTIME_PROFILE}
         g_WaitFile.Start;
{$ENDIF AQTIME_PROFILE}
         try
          if not f_Transporter.WaitForReply(l_Message, l_RawReply) then
          begin
{$IFNDEF AQTIME_PROFILE}
           l3System.Msg2Log('������ �������� - �� ��������� ������ �� ������ �����');
{$ENDIF AQTIME_PROFILE}
           Exit;
          end;
         finally
{$IFNDEF AQTIME_PROFILE}
          g_WaitFile.Stop;
{$ENDIF AQTIME_PROFILE}
         end;
         if not (l_RawReply is TncsGetFilePartReply) then
         begin
{$IFNDEF AQTIME_PROFILE}
          l3System.Msg2Log('������ �������� - �������������� ����� �� ������ �����');
{$ENDIF AQTIME_PROFILE}
          Exit;
         end;
         if not TncsGetFilePartReply(l_RawReply).IsSuccess then
         begin
{$IFNDEF AQTIME_PROFILE}
          l3System.Msg2Log('������ �������� - ���������� ����� �� ������ �����');
{$ENDIF AQTIME_PROFILE}
          Exit;
         end;
        finally
         FreeAndNil(l_RawReply);
        end;
       finally
        FreeAndNil(l_Message);
       end;
       if LocalDesc.CopiedSize = LocalDesc.Size then
       begin
        if (l3CalcCRC32(f_Stream) = LocalDesc.CRC) then
        begin
         Result := True;
         Break;
        end
        else
        begin
         LocalDesc.CopiedSize := 0;
         if Assigned(aProgressor) then
          aProgressor.IncProgress(-LocalDesc.Size);
         SaveControl;
        end;
       end
{$IFNDEF AQTIME_PROFILE}
       else
        l3System.Msg2Log('�������� ������ - �������� ������ ����� ������� �� ������');
{$ENDIF AQTIME_PROFILE}
      until False;
     finally
      SaveControl;
{$IFNDEF AQTIME_PROFILE}
      l_StreamWatch.Start;
{$ENDIF AQTIME_PROFILE}
      FreeAndNil(f_Stream);
{$IFNDEF AQTIME_PROFILE}
      l_StreamWatch.Stop;
      f_WriteTime := f_WriteTime + l_StreamWatch.Time;
{$ENDIF AQTIME_PROFILE}
     end;
    end;
   finally
    TncsMessageExecutorFactory.Instance.UnRegister(Self);
   end;
  finally
   FreeAndNil(f_Progressor);
  end;
 finally
{$IFNDEF AQTIME_PROFILE}
  l_Watch.Stop;
  f_ReceiveTime := f_ReceiveTime + l_Watch.Time;
{$ENDIF AQTIME_PROFILE}
 end;
//#UC END# *5472E6E201EE_546F3804032D_impl*
end;//TncsOneFileDeliverer.DoProcess

procedure TncsOneFileDeliverer.Execute(const aContext: TncsExecuteContext);
//#UC START# *54607DDC0159_546F3804032D_var*
var
 l_Message: TncsPushFilePart;
 l_Watch: Tl3StopWatch;
//#UC END# *54607DDC0159_546F3804032D_var*
begin
//#UC START# *54607DDC0159_546F3804032D_impl*
{$IFNDEF AQTIME_PROFILE}
 l_Watch.Reset;
 g_ReceivePartFile.Start;
{$ENDIF AQTIME_PROFILE}
 try
  l_Message := aContext.rMessage as TncsPushFilePart;

{$IFNDEF AQTIME_PROFILE}
  l_Watch.Start;
{$ENDIF AQTIME_PROFILE}

  f_Stream.Seek(l_Message.Offset, soBeginning);
{$IFNDEF AQTIME_PROFILE}
 g_WriteFile.Start;
{$ENDIF AQTIME_PROFILE}
  l_Message.Data.CopyTo(f_Stream, l_Message.PartSize);
{$IFNDEF AQTIME_PROFILE}
 g_WriteFile.Stop;
  l_Watch.Stop;
  f_WriteTime := f_WriteTime + l_Watch.Time;
{$ENDIF AQTIME_PROFILE}

  if Assigned(f_Counter) then
   f_Counter.DoProgress(l_Message.PartSize);
  LocalDesc.CopiedSize := LocalDesc.CopiedSize + l_Message.PartSize;
//  SaveControl;
  if Assigned(f_Progressor) then
   f_Progressor.IncProgress(l_Message.PartSize);
 finally
{$IFNDEF AQTIME_PROFILE}
  g_ReceivePartFile.Stop;
{$ENDIF AQTIME_PROFILE}
 end; 
//#UC END# *54607DDC0159_546F3804032D_impl*
end;//TncsOneFileDeliverer.Execute

function TncsOneFileDeliverer.MakeExecutor(aMessage: TncsMessage): IncsExecutor;
//#UC START# *546082B801F3_546F3804032D_var*
//#UC END# *546082B801F3_546F3804032D_var*
begin
//#UC START# *546082B801F3_546F3804032D_impl*
 if (aMessage is TncsPushFilePart) and (TncsPushFilePart(aMessage).TaskID = f_TaskID) and (TncsPushFilePart(aMessage).FileName = LocalDesc.Name) then
  Result := Self
 else
  Result := nil;
//#UC END# *546082B801F3_546F3804032D_impl*
end;//TncsOneFileDeliverer.MakeExecutor

procedure TncsOneFileDeliverer.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_546F3804032D_var*
//#UC END# *479731C50290_546F3804032D_var*
begin
//#UC START# *479731C50290_546F3804032D_impl*
 f_Transporter := nil;
 FreeAndNil(f_LocalDesc);
 inherited;
//#UC END# *479731C50290_546F3804032D_impl*
end;//TncsOneFileDeliverer.Cleanup
{$IfEnd} // NOT Defined(Nemesis)

end.
