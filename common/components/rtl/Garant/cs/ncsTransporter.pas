unit ncsTransporter;

// ������: "w:\common\components\rtl\Garant\cs\ncsTransporter.pas"
// ���������: "SimpleClass"
// ������� ������: "TncsTransporter" MUID: (544A09EE005F)

{$Include w:\common\components\rtl\Garant\cs\CsDefine.inc}

interface

{$If NOT Defined(Nemesis)}
uses
 l3IntfUses
 , l3ProtoObject
 , ncsMessageInterfaces
 , ncsMessageQueue
 , ncsSendThread
 , csIdIOHandlerAbstractAdapter
 , ncsReceiveThread
 , ncsProcessThread
 , ncsReplyWaiter
 , CsCommon
 , l3InterfacePtrList
 , ncsMessage
 , Windows
 , SyncObjs
;

type
 TncsIOHandlerArray = array [TncsSocketKind] of TcsIdIOHandlerAbstractAdapter;

 _l3CriticalSectionHolder_Parent_ = Tl3ProtoObject;
 {$Include w:\common\components\rtl\Garant\L3\l3CriticalSectionHolder.imp.pas}
 TncsTransporter = class(_l3CriticalSectionHolder_, IncsTransporter)
  private
   f_Connected: Boolean;
   f_ClientID: TCsClientId;
   f_IOHandlers: TncsIOHandlerArray;
   f_Helpers: Tl3InterfacePtrList;
   f_SendQueue: TncsMessageQueue;
   f_ReceiveQueue: TncsMessageQueue;
   f_SendThread: TncsSendThread;
   f_ReceiveThread: TncsReceiveThread;
   f_ProcessThread: TncsProcessThread;
   f_ReplyWaiter: TncsReplyWaiter;
   f_IntSessionID: AnsiString;
  protected
   function pm_GetIOHandlers(SocketKind: TncsSocketKind): TcsIdIOHandlerAbstractAdapter;
   procedure pm_SetIOHandlers(SocketKind: TncsSocketKind;
    aValue: TcsIdIOHandlerAbstractAdapter);
   procedure SetConnected(aValue: Boolean);
   procedure StartProcessing;
   procedure StopProcessing(WaitForThreads: Boolean);
   procedure HandShake; virtual; abstract;
   function HandShakeKind: TncsSocketKind; virtual; abstract;
   procedure TransportStarted; virtual;
   procedure Send(aMessage: TncsMessage);
   function WaitForReply(aMessage: TncsMessage;
    var theReply: TncsMessage;
    aTimeOut: LongWord = Windows.INFINITE): Boolean;
   function Get_Connected: Boolean;
   function Get_ClientID: TCsClientId;
   procedure Set_ClientID(aValue: TCsClientId);
   function Get_Processing: Boolean;
   function Get_SessionID: AnsiString;
   procedure RegisterHelper(const aHelper: IUnknown);
   procedure UnregisterHelper(const aHelper: IUnknown);
   procedure Cleanup; override;
    {* ������� ������� ����� �������. }
   procedure InitFields; override;
   procedure ClearFields; override;
  public
   function QueryInterface(const IID: TGUID;
    out Obj): HResult; override;
    {* �������� ������� ��������� � ��������������, ���� ��� ��������. }
  protected
   property SendQueue: TncsMessageQueue
    read f_SendQueue;
   property ReceiveQueue: TncsMessageQueue
    read f_ReceiveQueue;
   property SendThread: TncsSendThread
    read f_SendThread;
   property IOHandlers[SocketKind: TncsSocketKind]: TcsIdIOHandlerAbstractAdapter
    read pm_GetIOHandlers
    write pm_SetIOHandlers;
   property ReceiveThread: TncsReceiveThread
    read f_ReceiveThread;
   property ProcessThread: TncsProcessThread
    read f_ProcessThread;
   property ReplyWaiter: TncsReplyWaiter
    read f_ReplyWaiter;
   property IntSessionID: AnsiString
    read f_IntSessionID
    write f_IntSessionID;
 end;//TncsTransporter
{$IfEnd} // NOT Defined(Nemesis)

implementation

{$If NOT Defined(Nemesis)}
uses
 l3ImplUses
 , l3Utils
 , SysUtils
 , evdNcsTypes
 //#UC START# *544A09EE005Fimpl_uses*
 //#UC END# *544A09EE005Fimpl_uses*
;

{$Include w:\common\components\rtl\Garant\L3\l3CriticalSectionHolder.imp.pas}

function TncsTransporter.pm_GetIOHandlers(SocketKind: TncsSocketKind): TcsIdIOHandlerAbstractAdapter;
//#UC START# *545225640060_544A09EE005Fget_var*
//#UC END# *545225640060_544A09EE005Fget_var*
begin
//#UC START# *545225640060_544A09EE005Fget_impl*
 Result := f_IOHandlers[SocketKind];
//#UC END# *545225640060_544A09EE005Fget_impl*
end;//TncsTransporter.pm_GetIOHandlers

procedure TncsTransporter.pm_SetIOHandlers(SocketKind: TncsSocketKind;
 aValue: TcsIdIOHandlerAbstractAdapter);
//#UC START# *545225640060_544A09EE005Fset_var*
//#UC END# *545225640060_544A09EE005Fset_var*
begin
//#UC START# *545225640060_544A09EE005Fset_impl*
 aValue.SetRefTo(f_IOHandlers[SocketKind]);
//#UC END# *545225640060_544A09EE005Fset_impl*
end;//TncsTransporter.pm_SetIOHandlers

procedure TncsTransporter.SetConnected(aValue: Boolean);
//#UC START# *54533B010030_544A09EE005F_var*
//#UC END# *54533B010030_544A09EE005F_var*
begin
//#UC START# *54533B010030_544A09EE005F_impl*
 f_Connected := aValue;
//#UC END# *54533B010030_544A09EE005F_impl*
end;//TncsTransporter.SetConnected

procedure TncsTransporter.StartProcessing;
//#UC START# *5459C7E00125_544A09EE005F_var*
//#UC END# *5459C7E00125_544A09EE005F_var*
begin
//#UC START# *5459C7E00125_544A09EE005F_impl*
 Lock;
 try
  Assert(IOHandlers[HandShakeKind] <> nil);

  SetConnected(True);

  IOHandlers[HandShakeKind].WriteBufferOpen(-1);
  HandShake;

  Assert(SendThread.Suspended);
  Assert(ReceiveThread.Suspended);

  SendQueue.Processing := True;
  ReceiveQueue.Processing := True;
  SendThread.IOHandler := IOHandlers[ncs_skSend];
  SendThread.Suspended := False;
  ReceiveThread.IOHandler := IOHandlers[ncs_skReceive];
  ReceiveThread.Suspended := False;
  ProcessThread.Suspended := False;
  TransportStarted;
 finally
  Unlock;
 end;
//#UC END# *5459C7E00125_544A09EE005F_impl*
end;//TncsTransporter.StartProcessing

procedure TncsTransporter.StopProcessing(WaitForThreads: Boolean);
//#UC START# *5459C803038D_544A09EE005F_var*
//#UC END# *5459C803038D_544A09EE005F_var*
begin
//#UC START# *5459C803038D_544A09EE005F_impl*
 Lock;
 Try
  SendQueue.Processing := False;
  ReceiveQueue.Processing := False;
  f_ReplyWaiter.Clear;

  if WaitForThreads then
  begin
   ReceiveThread.WaitFor;
   SendThread.WaitFor;
   ProcessThread.WaitFor;
  end;

  if Assigned(IOHandlers[ncs_skSend]) then
  begin
   IOHandlers[ncs_skSend].WriteBufferClose;
   IOHandlers[ncs_skSend].InputBufferClear;
  end;

  if Assigned(IOHandlers[ncs_skReceive]) then
  begin
   IOHandlers[ncs_skReceive].WriteBufferClose;
   IOHandlers[ncs_skReceive].InputBufferClear;
  end;

  SetConnected(False);
  IOHandlers[ncs_skSend] := nil;
  IOHandlers[ncs_skReceive] := nil;
 finally
  Unlock;
 end;
//#UC END# *5459C803038D_544A09EE005F_impl*
end;//TncsTransporter.StopProcessing

procedure TncsTransporter.TransportStarted;
//#UC START# *5492C5F703AA_544A09EE005F_var*
//#UC END# *5492C5F703AA_544A09EE005F_var*
begin
//#UC START# *5492C5F703AA_544A09EE005F_impl*
 // Do nothing
//#UC END# *5492C5F703AA_544A09EE005F_impl*
end;//TncsTransporter.TransportStarted

procedure TncsTransporter.Send(aMessage: TncsMessage);
//#UC START# *5464B4E900DA_544A09EE005F_var*
//#UC END# *5464B4E900DA_544A09EE005F_var*
begin
//#UC START# *5464B4E900DA_544A09EE005F_impl*
 if aMessage.Kind = ncs_mkMessage then
  f_ReplyWaiter.SubmitMessage(aMessage);
 f_SendQueue.Push(aMessage);
//#UC END# *5464B4E900DA_544A09EE005F_impl*
end;//TncsTransporter.Send

function TncsTransporter.WaitForReply(aMessage: TncsMessage;
 var theReply: TncsMessage;
 aTimeOut: LongWord = Windows.INFINITE): Boolean;
//#UC START# *5464B52F02D5_544A09EE005F_var*
//#UC END# *5464B52F02D5_544A09EE005F_var*
begin
//#UC START# *5464B52F02D5_544A09EE005F_impl*
 Result := f_ReplyWaiter.WaitForReply(aMessage, theReply, aTimeOut);
//#UC END# *5464B52F02D5_544A09EE005F_impl*
end;//TncsTransporter.WaitForReply

function TncsTransporter.Get_Connected: Boolean;
//#UC START# *5465AB2B00CA_544A09EE005Fget_var*
//#UC END# *5465AB2B00CA_544A09EE005Fget_var*
begin
//#UC START# *5465AB2B00CA_544A09EE005Fget_impl*
 Result := f_Connected;
//#UC END# *5465AB2B00CA_544A09EE005Fget_impl*
end;//TncsTransporter.Get_Connected

function TncsTransporter.Get_ClientID: TCsClientId;
//#UC START# *546608F101DE_544A09EE005Fget_var*
//#UC END# *546608F101DE_544A09EE005Fget_var*
begin
//#UC START# *546608F101DE_544A09EE005Fget_impl*
 Result := f_ClientID;
//#UC END# *546608F101DE_544A09EE005Fget_impl*
end;//TncsTransporter.Get_ClientID

procedure TncsTransporter.Set_ClientID(aValue: TCsClientId);
//#UC START# *546608F101DE_544A09EE005Fset_var*
//#UC END# *546608F101DE_544A09EE005Fset_var*
begin
//#UC START# *546608F101DE_544A09EE005Fset_impl*
 f_ClientID := aValue;
//#UC END# *546608F101DE_544A09EE005Fset_impl*
end;//TncsTransporter.Set_ClientID

function TncsTransporter.Get_Processing: Boolean;
//#UC START# *5486B96A0025_544A09EE005Fget_var*
//#UC END# *5486B96A0025_544A09EE005Fget_var*
begin
//#UC START# *5486B96A0025_544A09EE005Fget_impl*
 Result := f_Connected and f_SendQueue.Processing and f_ReceiveQueue.Processing;
 if Result and Assigned(f_SendThread.IOHandler) then
  Result := f_SendThread.IOHandler.Connected;
//#UC END# *5486B96A0025_544A09EE005Fget_impl*
end;//TncsTransporter.Get_Processing

function TncsTransporter.Get_SessionID: AnsiString;
//#UC START# *548FEF4F002E_544A09EE005Fget_var*
//#UC END# *548FEF4F002E_544A09EE005Fget_var*
begin
//#UC START# *548FEF4F002E_544A09EE005Fget_impl*
 Result := IntSessionID;
//#UC END# *548FEF4F002E_544A09EE005Fget_impl*
end;//TncsTransporter.Get_SessionID

procedure TncsTransporter.RegisterHelper(const aHelper: IUnknown);
//#UC START# *57F3749202B7_544A09EE005F_var*
//#UC END# *57F3749202B7_544A09EE005F_var*
begin
//#UC START# *57F3749202B7_544A09EE005F_impl*
 f_Helpers.Add(aHelper);
//#UC END# *57F3749202B7_544A09EE005F_impl*
end;//TncsTransporter.RegisterHelper

procedure TncsTransporter.UnregisterHelper(const aHelper: IUnknown);
//#UC START# *57F374AC00AA_544A09EE005F_var*
//#UC END# *57F374AC00AA_544A09EE005F_var*
begin
//#UC START# *57F374AC00AA_544A09EE005F_impl*
 f_Helpers.Remove(aHelper);
//#UC END# *57F374AC00AA_544A09EE005F_impl*
end;//TncsTransporter.UnregisterHelper

function TncsTransporter.QueryInterface(const IID: TGUID;
 out Obj): HResult;
 {* �������� ������� ��������� � ��������������, ���� ��� ��������. }
//#UC START# *47913CBF0265_544A09EE005F_var*
var
 l_IDX: Integer;
//#UC END# *47913CBF0265_544A09EE005F_var*
begin
//#UC START# *47913CBF0265_544A09EE005F_impl*
 Result := inherited QueryInterface(IID, Obj);
 if Result <> S_Ok then
  for l_IDX := 0 to f_Helpers.Count - 1 do
  begin
   Result := f_Helpers[l_IDX].QueryInterface(IID, Obj);
   if Result = S_Ok then
    Break;
  end;
//#UC END# *47913CBF0265_544A09EE005F_impl*
end;//TncsTransporter.QueryInterface

procedure TncsTransporter.Cleanup;
 {* ������� ������� ����� �������. }
//#UC START# *479731C50290_544A09EE005F_var*
//#UC END# *479731C50290_544A09EE005F_var*
begin
//#UC START# *479731C50290_544A09EE005F_impl*
 StopProcessing(True);

 FreeAndNil(f_SendThread);
 FreeAndNil(f_SendQueue);

 FreeAndNil(f_ReceiveThread);
 FreeAndNil(f_ProcessThread);
 FreeAndNil(f_ReceiveQueue);

 IOHandlers[ncs_skSend] := nil;
 IOHandlers[ncs_skReceive] := nil;
 FreeAndNil(f_ReplyWaiter);
 FreeAndNil(f_Helpers);
 inherited;
//#UC END# *479731C50290_544A09EE005F_impl*
end;//TncsTransporter.Cleanup

procedure TncsTransporter.InitFields;
//#UC START# *47A042E100E2_544A09EE005F_var*
//#UC END# *47A042E100E2_544A09EE005F_var*
begin
//#UC START# *47A042E100E2_544A09EE005F_impl*
 inherited;
 f_ReplyWaiter := TncsReplyWaiter.Create;

 f_SendQueue := TncsMessageQueue.Create;
 f_SendThread := TncsSendThread.Create(f_SendQueue);

 f_ReceiveQueue := TncsMessageQueue.Create;
 f_ReceiveThread := TncsReceiveThread.Create(f_ReceiveQueue);
 f_ProcessThread := TncsProcessThread.Create(f_ReceiveQueue, Self, f_ReplyWaiter);

 f_Helpers := Tl3InterfacePtrList.Make;
//#UC END# *47A042E100E2_544A09EE005F_impl*
end;//TncsTransporter.InitFields

procedure TncsTransporter.ClearFields;
begin
 IntSessionID := '';
 inherited;
end;//TncsTransporter.ClearFields
{$IfEnd} // NOT Defined(Nemesis)

end.
