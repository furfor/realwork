// **********************************************************************
//                                                                       
// Generated by the MTDORB IDL-to-Pascal Translator, 11.02.2002 16:13
//                                                                       
// Copyright (c) 2001                                                    
// Millennium Group.                                                     
// Samara, Russia                                                        
//                                                                       
// All Rights Reserved                                                   
//                                                                       
// **********************************************************************
unit CosEventChannelAdmin_impl;

interface

uses
  orb_int, orb, req_int, code_int, imr, imr_int, env_int, except_int, orbtypes,
  exceptions, stdstat, std_seq, Classes, CosEventChannelAdmin_int, CosEventChannelAdmin,
  CosEventComm_int, CosEventComm, poa_int;

type
  IInternalSupplier = interface
  ['{960E5306-9E5F-427f-8FD1-030544F481B1}']
    procedure notify(const data: IAny);
  end;

  IInternalConsumer = interface
  ['{98F1C052-369B-47cb-8DB3-C1E11D4C8DF9}']
    procedure listen;
  end;

  TEventChannel_impl = class;

  TProxyPushConsumer_impl = class(TProxyPushConsumer_serv)
  private
    FEventChannel : TEventChannel_impl;
    FConnected : Boolean;
    FSupplier : IPushSupplier;
  protected
    procedure push(const data: IAny); override;
    procedure disconnect_push_consumer; override;
    procedure connect_push_supplier(const push_supplier: IPushSupplier); override;
  public
    constructor Create(ch: TEventChannel_impl);
  end;

  TProxyPullSupplier_serv2 = class(TProxyPullSupplier_serv)
  protected
    procedure invoke(const serv: IStaticServerRequest); override;
    procedure _pull(const req: IStaticServerRequest); virtual;  abstract;
  end;

  TProxyPullSupplier_impl = class(TProxyPullSupplier_serv2, IInternalSupplier)
  private
    FEventChannel : TEventChannel_impl;
    FConnected : Boolean;
    FConsumer : IPullConsumer;
    FRequests : IInterfaceList;
    FEvents : IInterfaceList;
    FHasEvent : Boolean;
  protected
    procedure _pull(const req: IStaticServerRequest); override;
    function pull: IAny; override;
    function try_pull(out has_event: boolean): IAny; override;
    procedure disconnect_pull_supplier; override;
    procedure connect_pull_consumer(const pull_consumer: IPullConsumer); override;
    procedure callback(const req: IRequest);
    procedure notify(const data: IAny);
  public
    constructor Create(ch: TEventChannel_impl);
  end;

  TProxyPullConsumer_impl = class(TProxyPullConsumer_serv, IInternalConsumer, IRequestCallback)
  private
    FEventChannel : TEventChannel_impl;
    FSupplier : IPullSupplier;
    FRequest : IRequest;
  protected
    procedure disconnect_pull_consumer; override;
    procedure connect_pull_supplier(const pull_supplier: IPullSupplier); override;
    procedure callback(const req: IRequest);
    procedure listen;
  public
    constructor Create(ch: TEventChannel_impl);
  end;

  TProxyPushSupplier_impl = class(TProxyPushSupplier_serv, IInternalSupplier, IRequestCallback)
  private
    FEventChannel : TEventChannel_impl;
    FConsumer : IPushConsumer;
    FRequests : IInterfaceList;
  protected
    procedure disconnect_push_supplier; override;
    procedure connect_push_consumer(const push_consumer: IPushConsumer); override;
    procedure notify(const data: IAny);
    procedure callback(const req: IRequest);
  public
    constructor Create(ch: TEventChannel_impl);
  end;

  TConsumerAdmin_impl = class(TConsumerAdmin_serv)
  private
    FEventChannel : TEventChannel_impl;
  protected
    function obtain_push_supplier: IProxyPushSupplier; override;
    function obtain_pull_supplier: IProxyPullSupplier; override;
  public
    constructor Create(ch: TEventChannel_impl);
  end;

  TSupplierAdmin_impl = class(TSupplierAdmin_serv)
  private
    FEventChannel : TEventChannel_impl;
  protected
    function obtain_push_consumer: IProxyPushConsumer; override;
    function obtain_pull_consumer: IProxyPullConsumer; override;
  public
    constructor Create(ch: TEventChannel_impl);
  end;

  TEventChannel_impl = class(TEventChannel_serv)
  private
    FListeners : integer;
    FSupplier_admin: ISupplierAdmin;
    FConsumer_admin: IConsumerAdmin;
    FPushSuppliers,FPushConsumers,FPullSuppliers,FPullConsumers: IInterfaceList;
  protected
    function for_consumers: IConsumerAdmin; override;
    function for_suppliers: ISupplierAdmin; override;
    procedure _destroy; override;
  public
    constructor Create();
    destructor Destroy(); override;
    procedure reg_pullsupplier(val: TProxyPullSupplier_impl);
    procedure reg_pushsupplier(val: TProxyPushSupplier_impl);
    procedure reg_pullconsumer(val: TProxyPullConsumer_impl);
    procedure reg_pushconsumer(val: TProxyPushConsumer_impl);
    procedure notify(const data: IAny);
    procedure listen(val: Boolean); overload;
    function listen: Boolean; overload;
  end;

  TEventChannelFactory_impl = class(TEventChannelFactory_serv)
    function create_eventchannel: IEventChannel; override;
  end;

const
  MAX_QUEUE_SIZE = $fffffff;

implementation

uses throw, any, static, tcode;

//***********************************************************
// CosEventChannelAdmin_ProxyPushConsumer_impl
//***********************************************************
constructor TProxyPushConsumer_impl.Create(ch: TEventChannel_impl);
begin
  inherited Create();
  FEventChannel := ch;
  FConnected := true;
  FSupplier := nil;
end;

procedure TProxyPushConsumer_impl.push(const data: IAny);
begin
  if not FConnected then
    raise TDisconnected.Create();
  FEventChannel.notify(data);
end;

procedure TProxyPushConsumer_impl.disconnect_push_consumer;
begin
  { TODO -oOVS : non_existent }
  if assigned(FSupplier){ and not FSupplier.non_existent} then
    FSupplier.disconnect_push_supplier;
  FSupplier := nil;
  FConnected := false;
end;

procedure TProxyPushConsumer_impl.connect_push_supplier(const push_supplier: IPushSupplier);
begin
  if assigned(FSupplier) and assigned(push_supplier) then
    raise TAlreadyConnected.Create();
  FSupplier := push_supplier;
end;

//***********************************************************
// CosEventChannelAdmin_ProxyPullSupplier_impl
//***********************************************************
constructor TProxyPullSupplier_impl.Create(ch: TEventChannel_impl);
begin
  inherited Create();
  FEventChannel := ch;
  FConnected := true;
  FRequests := TInterfaceList.Create;
  FEvents := TInterfaceList.Create;
end;

procedure TProxyPullSupplier_impl._pull(const req: IStaticServerRequest);
var
  a: IAny;
begin
  if not FConnected then
    raise TDisconnected.Create();
  FRequests.Add(req);
  FEventChannel.listen(true);
  if (FEvents.count > 0) and (FRequests.Count > 0) then
    begin
      a := FEvents[0] as IAny;
      FEvents.Delete(0);
      notify(a);
    end;
end;

function TProxyPullSupplier_impl.pull: IAny;
begin
  assert(false);
  result := nil;
end;

function TProxyPullSupplier_impl.try_pull(out has_event: boolean): IAny;
begin
  if not FConnected then  raise TDisconnected.Create();
  if FEvents.Count > 0 then
    begin
      result := FEvents[0] as IAny;
      FEvents.Delete(0);
      FHasEvent := true;
    end
  else
    begin
      if FRequests.Count = 0 then
        begin
          FEventChannel.listen(true);
          FEventChannel.listen(false);
        end;
      FHasEvent := false;
      Result := CreateAny;
    end;
end;

procedure TProxyPullSupplier_impl.disconnect_pull_supplier;
begin
  { TODO -oOVS : non_existent }
  if assigned(FConsumer) {and not FConsumer.non_existent} then
    FConsumer.disconnect_pull_consumer;
  FConsumer := nil;
  FConnected := false;
end;

procedure TProxyPullSupplier_impl.connect_pull_consumer(const pull_consumer: IPullConsumer);
begin
  if assigned(FConsumer) and assigned(pull_consumer) then
    raise TAlreadyConnected.Create();
  FConsumer := pull_consumer;
end;

procedure TProxyPullSupplier_impl.notify(const data: IAny);
var
  req: IStaticServerRequest;
  sa : IStaticAny;
  a: IAny;
begin
  if not FConnected or (FEvents.Count > MAX_QUEUE_SIZE) then exit;
  FEvents.Add(data);
  if FRequests.count > FEvents.count then FEventChannel.listen(false);
  if FRequests.Count = 0 then exit;
  req := FRequests[0] as IStaticServerREquest;
  FRequests.Delete(0);
  a := FEvents[0] as IAny;
  sa := StaticAny(stat_any,@a);
  req.set_result(sa);
  if not req.read_args then assert(false);
  req.write_results;
  FEvents.Delete(0);
end;

procedure TProxyPullSupplier_impl.callback(const req: IRequest);
begin
  assert(false,'not imlplemented');
end;

//***********************************************************
// CosEventChannelAdmin_ProxyPullConsumer_impl
//***********************************************************
procedure TProxyPullConsumer_impl.callback(const req: IRequest);
var
  a: IAny;
begin
  try
    req.get_response;
  except
  end;
  if req.get_environment.get_exception <> nil then
    disconnect_pull_consumer
  else
    begin
      a := CreateAny;
      a.copy(req.get_result.argument);
      FEventChannel.notify(a);
      if FEventChannel.listen then
        listen
      else
        FRequest := nil;
    end;
end;

constructor TProxyPullConsumer_impl.Create(ch: TEventChannel_impl);
begin
  inherited Create();
  FEventChannel := ch;
end;

procedure TProxyPullConsumer_impl.listen;
//var
  //obj: IORBObject;
begin
  if FRequest = nil then
    begin
      //obj := FPOA.servant_to_reference(FSupplier as IServant);
      FRequest := (FSupplier as IORBObject)._request('pull');
      FRequest.return_value.set_type(_tc_any);
      FRequest.send_deferred(self);
    end
end;

procedure TProxyPullConsumer_impl.disconnect_pull_consumer;
begin
  if assigned(FSupplier) then
    FSupplier.disconnect_pull_supplier;
  FSupplier := nil;
  FRequest := nil;
end;

procedure TProxyPullConsumer_impl.connect_pull_supplier(const pull_supplier: IPullSupplier);
begin
  if Assigned(FSupplier) and assigned(pull_supplier) then
    raise TAlreadyConnected.Create();
  FSupplier := pull_supplier;
  if FEventChannel.listen then
    listen;
end;

//***********************************************************
// CosEventChannelAdmin_ProxyPushSupplier_impl
//***********************************************************
constructor TProxyPushSupplier_impl.Create(ch: TEventChannel_impl);
begin
  inherited Create();
  FEventChannel := ch;
  FConsumer := nil;
  FRequests := TInterfaceList.Create;
end;

procedure TProxyPushSupplier_impl.disconnect_push_supplier;
var
  was_connected : Boolean;
begin
  { TODO -oOVS : non_existent }
  if assigned(FConsumer){ and not FConsumer.non_existent} then
    FConsumer.disconnect_push_consumer;
  was_connected := assigned(FConsumer);
  FConsumer := nil;
  if was_connected then FEventChannel.listen(false);
end;

procedure TProxyPushSupplier_impl.connect_push_consumer(const push_consumer: IPushConsumer);
begin
  if assigned(FConsumer) and assigned(push_consumer) then
    raise TAlreadyConnected.Create();
  FConsumer := push_consumer;
  FEventChannel.listen(true);
end;

procedure TProxyPushSupplier_impl.callback(const req: IRequest);
var
  i : integer;
begin
  for i := 0 to Pred(FRequests.Count) do
    if (FRequests[i] as IRequest) = req then
      begin
        try
          req.get_response;
        except
        end;
        if req.get_environment.get_exception <> nil then
          disconnect_push_supplier;
        FRequests.Delete(i);
        break;
      end;
end;

procedure TProxyPushSupplier_impl.notify(const data: IAny);
var
  req: IRequest;
  //obj: IORBObject;
begin
  if not assigned(FConsumer) or (FRequests.Count > MAX_QUEUE_SIZE) then exit;
  //obj := FPOA.servant_to_reference(FConsumer as IServant);
  req := (FConsumer as IORBObject)._request('push');
  FRequests.Add(req);
  req.add_in_arg('data').put_any(data);
  req.send_deferred(self);
end;

//***********************************************************
// CosEventChannelAdmin_ConsumerAdmin_impl
//***********************************************************
constructor TConsumerAdmin_impl.Create(ch: TEventChannel_impl);
begin
  inherited Create();
  FEventChannel := ch;
end;

function TConsumerAdmin_impl.obtain_push_supplier: IProxyPushSupplier;
var
  proxy : TProxyPushSupplier_impl;
begin
  proxy := TProxyPushSupplier_impl.Create(FEventChannel);
  FEventChannel.reg_pushsupplier(proxy);
  result := TProxyPushSupplier._narrow(FPOA.activate_for_this(proxy as IServant))
end;

function TConsumerAdmin_impl.obtain_pull_supplier: IProxyPullSupplier;
var
  proxy : TProxyPullSupplier_impl;
begin
  proxy := TProxyPullSupplier_impl.Create(FEventChannel);
  FEventChannel.reg_pullsupplier(proxy);
  result := TProxyPullSupplier._narrow(FPOA.activate_for_this(proxy as IServant));
end;

//***********************************************************
// CosEventChannelAdmin_SupplierAdmin_impl
//***********************************************************
constructor TSupplierAdmin_impl.Create(ch: TEventChannel_impl);
begin
  inherited Create();
  FEventChannel := ch;
end;

function TSupplierAdmin_impl.obtain_push_consumer: IProxyPushConsumer;
var
  proxy : TProxyPushConsumer_impl;
begin
  proxy := TProxyPushConsumer_impl.Create(FEventChannel);
  FEventChannel.reg_pushconsumer(proxy);
  result := TProxyPushConsumer._narrow(FPOA.activate_for_this(proxy as IServant));
end;

function TSupplierAdmin_impl.obtain_pull_consumer: IProxyPullConsumer;
var
  proxy : TProxyPullConsumer_impl;
begin
  proxy := TProxyPullConsumer_impl.Create(FEventChannel);
  FEventChannel.reg_pullconsumer(proxy);
  result := TProxyPullConsumer._narrow(FPOA.activate_for_this(proxy as IServant));
end;

//***********************************************************
// CosEventChannelAdmin_EventChannel_impl
//***********************************************************
constructor TEventChannel_impl.Create;
begin
  inherited Create();
  FPushSuppliers := TInterfaceList.Create;
  FPushConsumers := TInterfaceList.Create;
  FPullSuppliers := TInterfaceList.Create;
  FPullConsumers := TInterfaceList.Create;
  //FSupplier_admin := TSupplierAdmin._narrow(FPOA.activate_for_this(TSupplierAdmin_impl.Create(self) as IServant));
  //FConsumer_admin := TConsumerAdmin._narrow(FPOA.activate_for_this(TConsumerAdmin_impl.Create(self) as IServant));
end;

destructor TEventChannel_impl.Destroy;
begin
  inherited;
end;

function TEventChannel_impl.for_consumers: IConsumerAdmin;
begin
  if FConsumer_admin = nil then
    FConsumer_admin := TConsumerAdmin._narrow(FPOA.activate_for_this(TConsumerAdmin_impl.Create(self) as IServant));
  result := FConsumer_admin;
end;

function TEventChannel_impl.for_suppliers: ISupplierAdmin;
begin
  if FSupplier_admin = nil then
    FSupplier_admin := TSupplierAdmin._narrow(FPOA.activate_for_this(TSupplierAdmin_impl.Create(self) as IServant));
  result := FSupplier_admin;
end;

function TEventChannel_impl.listen: Boolean;
begin
  Result := FListeners > 0
end;

procedure TEventChannel_impl.listen(val: Boolean);
var
  i : integer;
begin
  if val then
    begin
      Inc(FListeners);
      for i := 0 to Pred(FPullConsumers.Count) do
        (FPullConsumers[i] as IInternalConsumer).listen;
    end
  else
    begin
      assert(FListeners>0);
      dec(FListeners);
    end;
end;

procedure TEventChannel_impl.notify(const data: IAny);
var
  i : integer;
begin
  for i := 0 to Pred(FPushSuppliers.Count) do
    try
      (FPushSuppliers[i] as IInternalSupplier).notify(data);
    except
      //consume
    end; { try/except }
  for i := 0 to Pred(FPullSuppliers.Count) do
    try
      (FPullSuppliers[i] as IInternalSupplier).notify(data);
    except
      //consume
    end; { try/except }
end;

procedure TEventChannel_impl.reg_pullconsumer(
  val: TProxyPullConsumer_impl);
begin
  FPullConsumers.Add(val)
end;

procedure TEventChannel_impl.reg_pullsupplier(
  val: TProxyPullSupplier_impl);
begin
  FPullSuppliers.Add(val)
end;

procedure TEventChannel_impl.reg_pushconsumer(
  val: TProxyPushConsumer_impl);
begin
  FPushConsumers.Add(val)
end;

procedure TEventChannel_impl.reg_pushsupplier(
  val: TProxyPushSupplier_impl);
begin
  FPushSuppliers.Add(val)
end;

procedure TEventChannel_impl._destroy;
var
  i : integer;
begin
  for i := 0 to Pred(FPushSuppliers.Count) do
    (FPushSuppliers[i] as IPushSupplier).disconnect_push_supplier;
  for i := 0 to Pred(FPullSuppliers.Count) do
    (FPushSuppliers[i] as IPullSupplier).disconnect_pull_supplier;
  for i := 0 to Pred(FPullConsumers.Count) do
    (FPullConsumers[i] as IPullConsumer).disconnect_pull_consumer;
  for i := 0 to Pred(FPushConsumers.Count) do
    (FPushConsumers[i] as IPushConsumer).disconnect_push_consumer;
end;

//***********************************************************
// SimpleEventChannelAdmin_EventChannelFactory_impl
//***********************************************************
function TEventChannelFactory_impl.create_eventchannel: IEventChannel;
var
  obj: IORBObject;
begin
  obj := FPOA.activate_for_this(TEventChannel_impl.Create as IServant);
  result := TEventChannel._narrow(obj);
end;

//***********************************************************
// TProxyPullSupplier_serv2 }
//***********************************************************
procedure TProxyPullSupplier_serv2.invoke(
  const serv: IStaticServerRequest);
begin
  if serv.op_name = 'pull' then
    begin
      _pull(serv);
    end
  else
    inherited invoke(serv);
end;

end.
