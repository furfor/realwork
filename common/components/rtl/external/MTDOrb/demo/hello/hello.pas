// Generated by DORB idltopas compiler, 24.08.2000
unit hello;

interface

uses
  orb_int,orb,req_int,code_int,imr,imr_int,env_int,except_int,types,
  stdstat,std_seq,poa,poa_int,value_int,value,classes,hello_int;

type

  THelloWorld = class(TORBObject,IHelloWorld)
  protected
    procedure hello; virtual; abstract;
    function narrow_helper(const str: string): Pointer; override;
  public
    class function _narrow(const obj : IORBObject): IHelloWorld;
    class function narrow_helper2(const obj: IORBObject): Boolean;
  end;

  THelloWorld_stub = class(THelloWorld)
  protected
    procedure hello; override;
  end;

  THelloWorld_skel = class(TStaticMethodDispatcher,IStaticInterfaceDispatcher,IHelloWorld)
  protected
    procedure hello; virtual; abstract;
    function _dispatch(const req: IStaticServerRequest): Boolean;
  public
    constructor Create();
  end;

implementation

uses
  static,sysutils,throw,exceptions;

//***********************************************************
// THelloWorld
//***********************************************************
function THelloWorld.narrow_helper(const str: string): Pointer;
begin
  result := nil;
  if str = 'IDL:HelloWorld:1.0' then
    begin
      result := Pointer(IHelloWorld(self));
      exit;
    end;
end;

class function THelloWorld._narrow(const obj : IORBObject): IHelloWorld;
var
  p: Pointer;
  stub: THelloWorld_stub;
begin
  result := nil;
  if obj = nil then exit;
  p := obj.narrow_helper('IDL:HelloWorld:1.0');
  if p <> nil then
    result := IHelloWorld(p)
  else
    begin
      if narrow_helper2(obj) or obj._is_a_remote('IDL:HelloWorld:1.0') then
        begin
          stub := THelloWorld_stub.Create();
          stub.assign(obj);
          result := stub;
        end;
    end;
end;

class function THelloWorld.narrow_helper2(const obj: IORBObject): Boolean;
begin
  result := obj.repoid = 'IDL:HelloWorld:1.0'
end;

//***********************************************************
// THelloWorld_stub
//***********************************************************
procedure THelloWorld_stub.hello;
var
  req: IStaticRequest;
begin
  req := TStaticRequest.Create(self,'hello');
  req.invoke;
  dorb_static_throw(req);
end;

//***********************************************************
// THelloWorld_skel
//***********************************************************
constructor THelloWorld_skel.Create;
var
  impl: IImplementationDef;
begin
  inherited Create();
  impl := find_impl('IDL:HelloWorld:1.0','HelloWorld');
  create_ref('',nil,impl,'IDL:HelloWorld:1.0');
  register_dispatcher(IStaticInterfaceDispatcher(self));
end;

function THelloWorld_skel._dispatch(const req: IStaticServerRequest): Boolean;
begin
  result := true;
  if req.op_name = 'hello' then
    begin
      if not req.read_args() then  exit;
      hello;
      req.write_results();
    end;
end;

end.
