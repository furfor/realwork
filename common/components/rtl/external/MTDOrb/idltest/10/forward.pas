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
// Compiled with parameters: " -i./ ./\forward.idl" 
//                                                                            
unit forward;

interface

uses
  Classes, orb_int, orb, req_int, code_int, env_int, stdstat, std_seq,imr, imr_int, 
  orbtypes, exceptions, except_int, forward_int, poa_int, poa;

type

  {** IDL:B:1.0 } 
  TB = class(TORBObject,IB)
  protected
    procedure op(const a: IA); virtual; abstract;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    class function _narrow(const obj : IORBObject): IB;
    class function narrow_helper2(const obj: IORBObject): Boolean;
  end;

  {** stub for interface IDL:B:1.0} 
  TB_stub = class(TB)
  protected
    procedure op(const a: IA); override;
  end;

  {** POA stub for interface IDL:B:1.0} 
  TB_stub_clp = class(TPOAStub,IPOAStub,IB)
  protected
    procedure op(const a: IA); virtual;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  end;

  {** servant for interface IDL:B:1.0} 
  TB_serv = class(TPOAStaticImplementation,IPOAStaticImplementation,IServant,IB)
  protected
    procedure op(const a: IA); virtual; abstract;
    function _primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID; override;
    function _make_stub(const poa: IPOA; const obj : IORBObject): IORBObject; override;
    function _is_a(const repoid: RepositoryID): Boolean; override;
    procedure invoke(const serv: IStaticServerRequest); override;
    function _dispatch(const req: IStaticServerRequest): Boolean;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    function _this(): IB;
    class function _narrow(const srv : IServant): IB;
  end;

  TB_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

  {** IDL:A:1.0 } 
  TA = class(TORBObject,IA)
  protected
    procedure op(const b: IB); virtual; abstract;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    class function _narrow(const obj : IORBObject): IA;
    class function narrow_helper2(const obj: IORBObject): Boolean;
  end;

  {** stub for interface IDL:A:1.0} 
  TA_stub = class(TA)
  protected
    procedure op(const b: IB); override;
  end;

  {** POA stub for interface IDL:A:1.0} 
  TA_stub_clp = class(TPOAStub,IPOAStub,IA)
  protected
    procedure op(const b: IB); virtual;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  end;

  {** servant for interface IDL:A:1.0} 
  TA_serv = class(TPOAStaticImplementation,IPOAStaticImplementation,IServant,IA)
  protected
    procedure op(const b: IB); virtual; abstract;
    function _primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID; override;
    function _make_stub(const poa: IPOA; const obj : IORBObject): IORBObject; override;
    function _is_a(const repoid: RepositoryID): Boolean; override;
    procedure invoke(const serv: IStaticServerRequest); override;
    function _dispatch(const req: IStaticServerRequest): Boolean;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    function _this(): IA;
    class function _narrow(const srv : IServant): IA;
  end;

  TA_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

var
  B_marshaller : IStaticTypeInfo;
  A_marshaller : IStaticTypeInfo;
  _tc_B : ITypeCodeConst;
  _tc_A : ITypeCodeConst;

implementation

uses
  SysUtils, any, tcode, static, throw;

//***********************************************************
// TB
//***********************************************************
function TB.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:B:1.0' then
    begin
      result := Pointer(self as IB);
      exit;
    end;
end;

class function TB._narrow(const obj : IORBObject): IB;
var
  p: Pointer;
  stub: TB_stub;
begin
  result := nil;
  if obj = nil then exit;
  p := obj.narrow_helper('IDL:B:1.0');
  if p <> nil then
    result := IB(p)
  else
    begin
      if narrow_helper2(obj) or obj._is_a_remote('IDL:B:1.0') then
        begin
          stub := TB_stub.Create();
          stub.assign(obj);
          result := stub;
        end;
    end;
end;

class function TB.narrow_helper2(const obj: IORBObject): Boolean;
begin
  result := obj._repoid = 'IDL:B:1.0'
end;

//***********************************************************
// TB_stub
//***********************************************************
procedure TB_stub.op(const a: IA);
var
  req: IStaticRequest;
  _a: IStaticAny;
begin
  _a := StaticAny(A_marshaller,@a);
  req := StaticRequest(self,'op');
  req.add_in_arg(_a);
  req.invoke;
  dorb_static_throw(req);
end;

//***********************************************************
// TB_stub_clp
//***********************************************************
function TB_stub_clp.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:B:1.0' then
    begin
      result := Pointer(self as IB);
      exit;
  end;
end;

procedure TB_stub_clp.op(const a: IA);
var
  _srv: IServant;
  srv: IB;
begin
  _srv := _preinvoke();
  if _srv <> nil then
    begin
      srv := TB_serv._narrow(_srv);
      if srv <> nil then
        srv.op(a)
    end;
  _postinvoke();
end;

//***********************************************************
// TB_serv
//***********************************************************
function TB_serv._this(): IB;
var
  obj: IORBObject;
begin
  obj := this();
  result := TB._narrow(obj);
end;

function TB_serv._is_a(const repoid: RepositoryID): Boolean;
begin
  result := repoid = 'IDL:B:1.0';
end;

function TB_serv._primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID;
begin
  result := 'IDL:B:1.0';
end;

function TB_serv._make_stub(const poa: IPOA; const obj : IORBObject): IORBObject;
begin
  result := TB_stub_clp.Create(poa,obj);
end;

procedure TB_serv.invoke(const serv: IStaticServerRequest);
begin
  if not _dispatch(serv) then
    begin
      serv.set_exception(BAD_OPERATION.Create(0, COMPLETED_NO) as IORBException);
      serv.write_results();
    end;
end;

function TB_serv.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:B:1.0' then
    begin
      result := Pointer(IB(self));
      exit;
    end;
end;

class function TB_serv._narrow(const srv : IServant): IB;
var
  p: Pointer;
begin
  result := nil;
  if srv = nil then exit;
  p := srv.narrow_helper('IDL:B:1.0');
  if p <> nil then
    result := IB(p)
end;

function TB_serv._dispatch(const req: IStaticServerRequest): Boolean;
var
  op_a: IA;
begin
  result := true;
  if req.op_name = 'op' then
    begin
      req.add_in_arg(StaticAny(A_marshaller,@op_a) as IStaticAny);
      if not req.read_args() then  exit;
      op(op_a);
      req.write_results();
      exit;
    end;
  result := false;
end;

//***********************************************************
// TB_marshaller
//***********************************************************
function TB_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  obj: IORBObject;
begin
  result := false;
  if not stat_Object.demarshal(dec,@obj) then exit;
  IB(addr^) := TB._narrow(obj);
  result := (obj = nil) or (Pointer(addr^) <> nil);
end;

procedure TB_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  obj: IORBObject;
begin
  obj := IB(addr^) as IORBObject;
  stat_Object.marshal(enc,@Pointer(obj));
end;

procedure TB_marshaller._free(var addr: Pointer);
begin
  IB(addr^) := nil;
end;

procedure TB_marshaller._create(var addr: Pointer);
begin
  IB(addr^) := TB_stub.Create();
end;

procedure TB_marshaller._assign(dst, src: Pointer);
begin
  IB(dst^) := IB(src^);
end;

function TB_marshaller.typecode: ITypeCode;
begin
  result := _tc_B.typecode;
end;

//***********************************************************
// TA
//***********************************************************
function TA.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:A:1.0' then
    begin
      result := Pointer(self as IA);
      exit;
    end;
end;

class function TA._narrow(const obj : IORBObject): IA;
var
  p: Pointer;
  stub: TA_stub;
begin
  result := nil;
  if obj = nil then exit;
  p := obj.narrow_helper('IDL:A:1.0');
  if p <> nil then
    result := IA(p)
  else
    begin
      if narrow_helper2(obj) or obj._is_a_remote('IDL:A:1.0') then
        begin
          stub := TA_stub.Create();
          stub.assign(obj);
          result := stub;
        end;
    end;
end;

class function TA.narrow_helper2(const obj: IORBObject): Boolean;
begin
  result := obj._repoid = 'IDL:A:1.0'
end;

//***********************************************************
// TA_stub
//***********************************************************
procedure TA_stub.op(const b: IB);
var
  req: IStaticRequest;
  _b: IStaticAny;
begin
  _b := StaticAny(B_marshaller,@b);
  req := StaticRequest(self,'op');
  req.add_in_arg(_b);
  req.invoke;
  dorb_static_throw(req);
end;

//***********************************************************
// TA_stub_clp
//***********************************************************
function TA_stub_clp.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:A:1.0' then
    begin
      result := Pointer(self as IA);
      exit;
  end;
end;

procedure TA_stub_clp.op(const b: IB);
var
  _srv: IServant;
  srv: IA;
begin
  _srv := _preinvoke();
  if _srv <> nil then
    begin
      srv := TA_serv._narrow(_srv);
      if srv <> nil then
        srv.op(b)
    end;
  _postinvoke();
end;

//***********************************************************
// TA_serv
//***********************************************************
function TA_serv._this(): IA;
var
  obj: IORBObject;
begin
  obj := this();
  result := TA._narrow(obj);
end;

function TA_serv._is_a(const repoid: RepositoryID): Boolean;
begin
  result := repoid = 'IDL:A:1.0';
end;

function TA_serv._primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID;
begin
  result := 'IDL:A:1.0';
end;

function TA_serv._make_stub(const poa: IPOA; const obj : IORBObject): IORBObject;
begin
  result := TA_stub_clp.Create(poa,obj);
end;

procedure TA_serv.invoke(const serv: IStaticServerRequest);
begin
  if not _dispatch(serv) then
    begin
      serv.set_exception(BAD_OPERATION.Create(0, COMPLETED_NO) as IORBException);
      serv.write_results();
    end;
end;

function TA_serv.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:A:1.0' then
    begin
      result := Pointer(IA(self));
      exit;
    end;
end;

class function TA_serv._narrow(const srv : IServant): IA;
var
  p: Pointer;
begin
  result := nil;
  if srv = nil then exit;
  p := srv.narrow_helper('IDL:A:1.0');
  if p <> nil then
    result := IA(p)
end;

function TA_serv._dispatch(const req: IStaticServerRequest): Boolean;
var
  op_b: IB;
begin
  result := true;
  if req.op_name = 'op' then
    begin
      req.add_in_arg(StaticAny(B_marshaller,@op_b) as IStaticAny);
      if not req.read_args() then  exit;
      op(op_b);
      req.write_results();
      exit;
    end;
  result := false;
end;

//***********************************************************
// TA_marshaller
//***********************************************************
function TA_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  obj: IORBObject;
begin
  result := false;
  if not stat_Object.demarshal(dec,@obj) then exit;
  IA(addr^) := TA._narrow(obj);
  result := (obj = nil) or (Pointer(addr^) <> nil);
end;

procedure TA_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  obj: IORBObject;
begin
  obj := IA(addr^) as IORBObject;
  stat_Object.marshal(enc,@Pointer(obj));
end;

procedure TA_marshaller._free(var addr: Pointer);
begin
  IA(addr^) := nil;
end;

procedure TA_marshaller._create(var addr: Pointer);
begin
  IA(addr^) := TA_stub.Create();
end;

procedure TA_marshaller._assign(dst, src: Pointer);
begin
  IA(dst^) := IA(src^);
end;

function TA_marshaller.typecode: ITypeCode;
begin
  result := _tc_A.typecode;
end;

initialization
  B_marshaller := TB_marshaller.Create();
  A_marshaller := TA_marshaller.Create();
  _tc_B := CreateTypeCodeConst('010000000e0000001a000000010000000a00000049444c3a423a312e30000000020000004200');
  _tc_A := CreateTypeCodeConst('010000000e0000001a000000010000000a00000049444c3a413a312e30000000020000004100');
end.
