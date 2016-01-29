// ***************************************************************************
//                                                                            
// Generated by the MTDORB IDL-to-Pascal Translator (1.0.1b1), 21.09.2010 13:26
//                                                                            
// Copyright (c) 2002 - 2004                                                  
// Millennium Group.                                                          
// Samara, Russia                                                             
//                                                                            
// All Rights Reserved                                                        
//                                                                            
// ***************************************************************************
// Compiled with parameters: " -i../..//idl -i./ ./\hello.idl" 
//                                                                            
unit hello;

interface

uses
  Classes, orb_int, orb, req_int, code_int, env_int, stdstat, std_seq,imr, imr_int, 
  orbtypes, exceptions, except_int, hello_int, poa_int, poa;

type

  {** IDL:Hello:1.0 } 
  THello = class(TORBObject,IHello)
  protected
    procedure hello; virtual; abstract;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    class function _narrow(const obj : IORBObject): IHello;
    class function narrow_helper2(const obj: IORBObject): Boolean;
  end;

  {** stub for interface IDL:Hello:1.0} 
  THello_stub = class(THello)
  protected
    procedure hello; override;
  end;

  {** POA stub for interface IDL:Hello:1.0} 
  THello_stub_clp = class(TPOAStub,IPOAStub,IHello)
  protected
    procedure hello; virtual;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  end;

  {** servant for interface IDL:Hello:1.0} 
  THello_serv = class(TPOAStaticImplementation,IPOAStaticImplementation,IServant,IHello)
  protected
    procedure hello; virtual; abstract;
    function _primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID; override;
    function _make_stub(const poa: IPOA; const obj : IORBObject): IORBObject; override;
    function _is_a(const repoid: RepositoryID): Boolean; override;
    procedure invoke(const serv: IStaticServerRequest); override;
    function _dispatch(const req: IStaticServerRequest): Boolean;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    function _this(): IHello;
    class function _narrow(const srv : IServant): IHello;
  end;

  THello_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

var
  Hello_marshaller : IStaticTypeInfo;
  _tc_Hello : ITypeCodeConst;

implementation

uses
  SysUtils, any, tcode, static, throw;

//***********************************************************
// THello
//***********************************************************
function THello.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:Hello:1.0' then
    begin
      result := Pointer(self as IHello);
      exit;
    end;
end;

class function THello._narrow(const obj : IORBObject): IHello;
var
  p: Pointer;
  stub: THello_stub;
begin
  result := nil;
  if obj = nil then exit;
  p := obj.narrow_helper('IDL:Hello:1.0');
  if p <> nil then
    result := IHello(p)
  else
    begin
      if narrow_helper2(obj) or obj._is_a_remote('IDL:Hello:1.0') then
        begin
          stub := THello_stub.Create();
          stub.assign(obj);
          result := stub;
        end;
    end;
end;

class function THello.narrow_helper2(const obj: IORBObject): Boolean;
begin
  result := obj._repoid = 'IDL:Hello:1.0'
end;

//***********************************************************
// THello_stub
//***********************************************************
procedure THello_stub.hello;
var
  req: IStaticRequest;
begin
  req := StaticRequest(self,'hello');
  req.invoke;
  dorb_static_throw(req);
end;

//***********************************************************
// THello_stub_clp
//***********************************************************
function THello_stub_clp.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:Hello:1.0' then
    begin
      result := Pointer(self as IHello);
      exit;
  end;
end;

procedure THello_stub_clp.hello;
var
  _srv: IServant;
  srv: IHello;
begin
  _srv := _preinvoke();
  if _srv <> nil then
    begin
      srv := THello_serv._narrow(_srv);
      if srv <> nil then
        srv.hello
    end;
  _postinvoke();
end;

//***********************************************************
// THello_serv
//***********************************************************
function THello_serv._this(): IHello;
var
  obj: IORBObject;
begin
  obj := this();
  result := THello._narrow(obj);
end;

function THello_serv._is_a(const repoid: RepositoryID): Boolean;
begin
  result := repoid = 'IDL:Hello:1.0';
end;

function THello_serv._primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID;
begin
  result := 'IDL:Hello:1.0';
end;

function THello_serv._make_stub(const poa: IPOA; const obj : IORBObject): IORBObject;
begin
  result := THello_stub_clp.Create(poa,obj);
end;

procedure THello_serv.invoke(const serv: IStaticServerRequest);
begin
  if not _dispatch(serv) then
    begin
      serv.set_exception(BAD_OPERATION.Create(0, COMPLETED_NO) as IORBException);
      serv.write_results();
    end;
end;

function THello_serv.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:Hello:1.0' then
    begin
      result := Pointer(IHello(self));
      exit;
    end;
end;

class function THello_serv._narrow(const srv : IServant): IHello;
var
  p: Pointer;
begin
  result := nil;
  if srv = nil then exit;
  p := srv.narrow_helper('IDL:Hello:1.0');
  if p <> nil then
    result := IHello(p)
end;

function THello_serv._dispatch(const req: IStaticServerRequest): Boolean;
begin
  result := true;
  if req.op_name = 'hello' then
    begin
      if not req.read_args() then  exit;
      hello;
      req.write_results();
      exit;
    end;
  result := false;
end;

//***********************************************************
// THello_marshaller
//***********************************************************
function THello_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  obj: IORBObject;
begin
  result := false;
  if not stat_Object.demarshal(dec,@obj) then exit;
  IHello(addr^) := THello._narrow(obj);
  result := (obj = nil) or (Pointer(addr^) <> nil);
end;

procedure THello_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  obj: IORBObject;
begin
  obj := IHello(addr^) as IORBObject;
  stat_Object.marshal(enc,@Pointer(obj));
end;

procedure THello_marshaller._free(var addr: Pointer);
begin
  IHello(addr^) := nil;
end;

procedure THello_marshaller._create(var addr: Pointer);
begin
  IHello(addr^) := THello_stub.Create();
end;

procedure THello_marshaller._assign(dst, src: Pointer);
begin
  IHello(dst^) := IHello(src^);
end;

function THello_marshaller.typecode: ITypeCode;
begin
  result := _tc_Hello.typecode;
end;

initialization
  Hello_marshaller := THello_marshaller.Create();
  _tc_Hello := CreateTypeCodeConst('010000000e00000022000000010000000e00000049444c3a48656c6c6f3a312e300000000600000048656c6c6f00');
end.
