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
// Compiled with parameters: " -notabs -i./ ./\typedef.idl" 
//                                                                            
unit typedef;

interface

uses
  Classes, orb_int, orb, req_int, code_int, env_int, stdstat, std_seq,imr, imr_int, 
  orbtypes, exceptions, except_int, typedef_int, poa_int, poa;

type

  TSS__marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

  Tfoo_S_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

  {** IDL:foo:1.0 } 
  Tfoo = class(TORBObject,Ifoo)
  protected
    procedure bar1(const s: AnsiString); virtual; abstract;
    procedure bar2(const l: Tfoo_L); virtual; abstract;
    procedure bar3(const s: Tfoo_S); virtual; abstract;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    class function _narrow(const obj : IORBObject): Ifoo;
    class function narrow_helper2(const obj: IORBObject): Boolean;
  end;

  {** stub for interface IDL:foo:1.0} 
  Tfoo_stub = class(Tfoo)
  protected
    procedure bar1(const s: AnsiString); override;
    procedure bar2(const l: Tfoo_L); override;
    procedure bar3(const s: Tfoo_S); override;
  end;

  {** POA stub for interface IDL:foo:1.0} 
  Tfoo_stub_clp = class(TPOAStub,IPOAStub,Ifoo)
  protected
    procedure bar1(const s: AnsiString); virtual;
    procedure bar2(const l: Tfoo_L); virtual;
    procedure bar3(const s: Tfoo_S); virtual;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  end;

  {** servant for interface IDL:foo:1.0} 
  Tfoo_serv = class(TPOAStaticImplementation,IPOAStaticImplementation,IServant,Ifoo)
  private
    FImplementation: Ifoo;
  protected
    procedure bar1(const s: AnsiString); virtual;
    procedure bar2(const l: Tfoo_L); virtual;
    procedure bar3(const s: Tfoo_S); virtual;
    function _primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID; override;
    function _make_stub(const poa: IPOA; const obj : IORBObject): IORBObject; override;
    function _is_a(const repoid: RepositoryID): Boolean; override;
    procedure invoke(const serv: IStaticServerRequest); override;
    function _dispatch(const req: IStaticServerRequest): Boolean;
    function narrow_helper(const str: RepositoryID): Pointer; override;
  public
    constructor Create(const AImpl: Ifoo = nil);
    function _this(): Ifoo;
    class function _narrow(const srv : IServant): Ifoo;
  end;

  Tfoo_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

var
  SS__marshaller : IStaticTypeInfo;
  foo_S_marshaller : IStaticTypeInfo;
  foo_marshaller : IStaticTypeInfo;
  _tc_SS_ : ITypeCodeConst;
  _tc_foo_S : ITypeCodeConst;
  _tc_foo : ITypeCodeConst;

implementation

uses
  SysUtils, any, tcode, static, throw;

//***********************************************************
// TSS__marshaller
//***********************************************************
function TSS__marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  struct: typedef_int.TSS_;
begin
  result := false;
  if not stat_octet.demarshal(dec,@struct.a) then exit;
  if not stat_octet.demarshal(dec,@struct.b) then exit;
  typedef_int.TSS_(addr^) := struct;
  result := true;
end;

procedure TSS__marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  struct: typedef_int.TSS_;
begin
  struct := typedef_int.TSS_(addr^);
  stat_octet.marshal(enc,@struct.a);
  stat_octet.marshal(enc,@struct.b);
end;

procedure TSS__marshaller._free(var addr: Pointer);
begin
{$HINTS OFF}
  System.Finalize(typedef_int.TSS_(addr^));
{$HINTS ON}
  FreeMem(addr);
end;

procedure TSS__marshaller._create(var addr: Pointer);
begin
  addr := AllocMem(sizeOf(typedef_int.TSS_));
{$HINTS OFF}
  System.Initialize(typedef_int.TSS_(addr^));
{$HINTS ON}
end;

procedure TSS__marshaller._assign(dst, src: Pointer);
begin
  typedef_int.TSS_(dst^) := typedef_int.TSS_(src^);
end;

function TSS__marshaller.typecode: ITypeCode;
begin
  result := _tc_SS_.typecode;
end;

//***********************************************************
// Tfoo_S_marshaller
//***********************************************************
function Tfoo_S_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  struct: typedef_int.Tfoo_S;
begin
  result := false;
  if not stat_long.demarshal(dec,@struct.a) then exit;
  if not stat_char.demarshal(dec,@struct.b) then exit;
  typedef_int.Tfoo_S(addr^) := struct;
  result := true;
end;

procedure Tfoo_S_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  struct: typedef_int.Tfoo_S;
begin
  struct := typedef_int.Tfoo_S(addr^);
  stat_long.marshal(enc,@struct.a);
  stat_char.marshal(enc,@struct.b);
end;

procedure Tfoo_S_marshaller._free(var addr: Pointer);
begin
{$HINTS OFF}
  System.Finalize(typedef_int.Tfoo_S(addr^));
{$HINTS ON}
  FreeMem(addr);
end;

procedure Tfoo_S_marshaller._create(var addr: Pointer);
begin
  addr := AllocMem(sizeOf(typedef_int.Tfoo_S));
{$HINTS OFF}
  System.Initialize(typedef_int.Tfoo_S(addr^));
{$HINTS ON}
end;

procedure Tfoo_S_marshaller._assign(dst, src: Pointer);
begin
  typedef_int.Tfoo_S(dst^) := typedef_int.Tfoo_S(src^);
end;

function Tfoo_S_marshaller.typecode: ITypeCode;
begin
  result := _tc_foo_S.typecode;
end;

//***********************************************************
// Tfoo
//***********************************************************
function Tfoo.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:foo:1.0' then
    begin
      result := Pointer(self as Ifoo);
      exit;
    end;
end;

class function Tfoo._narrow(const obj : IORBObject): Ifoo;
var
  p: Pointer;
  stub: Tfoo_stub;
begin
  result := nil;
  if obj = nil then exit;
  p := obj.narrow_helper('IDL:foo:1.0');
  if p <> nil then
    result := Ifoo(p)
  else
    begin
      if narrow_helper2(obj) or obj._is_a_remote('IDL:foo:1.0') then
        begin
          stub := Tfoo_stub.Create();
          stub.assign(obj);
          result := stub;
        end;
    end;
end;

class function Tfoo.narrow_helper2(const obj: IORBObject): Boolean;
begin
  result := obj._repoid = 'IDL:foo:1.0'
end;

//***********************************************************
// Tfoo_stub
//***********************************************************
procedure Tfoo_stub.bar1(const s: AnsiString);
var
  req: IStaticRequest;
  _s: IStaticAny;
begin
  _s := StaticAny(stat_string,@s);
  req := StaticRequest(self,'bar1');
  req.add_in_arg(_s);
  req.invoke;
  dorb_static_throw(req);
end;

procedure Tfoo_stub.bar2(const l: Tfoo_L);
var
  req: IStaticRequest;
  _l: IStaticAny;
begin
  _l := StaticAny(stat_long,@l);
  req := StaticRequest(self,'bar2');
  req.add_in_arg(_l);
  req.invoke;
  dorb_static_throw(req);
end;

procedure Tfoo_stub.bar3(const s: Tfoo_S);
var
  req: IStaticRequest;
  _s: IStaticAny;
begin
  _s := StaticAny(foo_S_marshaller,@s);
  req := StaticRequest(self,'bar3');
  req.add_in_arg(_s);
  req.invoke;
  dorb_static_throw(req);
end;

//***********************************************************
// Tfoo_stub_clp
//***********************************************************
function Tfoo_stub_clp.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:foo:1.0' then
    begin
      result := Pointer(self as Ifoo);
      exit;
  end;
end;

procedure Tfoo_stub_clp.bar1(const s: AnsiString);
var
  _srv: IServant;
  srv: Ifoo;
begin
  _srv := _preinvoke();
  if _srv <> nil then
    begin
      srv := Tfoo_serv._narrow(_srv);
      if srv <> nil then
        srv.bar1(s)
    end;
  _postinvoke();
end;

procedure Tfoo_stub_clp.bar2(const l: Tfoo_L);
var
  _srv: IServant;
  srv: Ifoo;
begin
  _srv := _preinvoke();
  if _srv <> nil then
    begin
      srv := Tfoo_serv._narrow(_srv);
      if srv <> nil then
        srv.bar2(l)
    end;
  _postinvoke();
end;

procedure Tfoo_stub_clp.bar3(const s: Tfoo_S);
var
  _srv: IServant;
  srv: Ifoo;
begin
  _srv := _preinvoke();
  if _srv <> nil then
    begin
      srv := Tfoo_serv._narrow(_srv);
      if srv <> nil then
        srv.bar3(s)
    end;
  _postinvoke();
end;

//***********************************************************
// Tfoo_serv
//***********************************************************
constructor Tfoo_serv.Create(const AImpl: Ifoo);
begin
  inherited Create();
  FImplementation := AImpl;
end;

procedure Tfoo_serv.bar1(const s: AnsiString);
begin
  FImplementation.bar1(s);
end;

procedure Tfoo_serv.bar2(const l: Tfoo_L);
begin
  FImplementation.bar2(l);
end;

procedure Tfoo_serv.bar3(const s: Tfoo_S);
begin
  FImplementation.bar3(s);
end;

function Tfoo_serv._this(): Ifoo;
var
  obj: IORBObject;
begin
  obj := this();
  result := Tfoo._narrow(obj);
end;

function Tfoo_serv._is_a(const repoid: RepositoryID): Boolean;
begin
  result := repoid = 'IDL:foo:1.0';
end;

function Tfoo_serv._primary_interface(const objid: ObjectID; const poa: IPOA): RepositoryID;
begin
  result := 'IDL:foo:1.0';
end;

function Tfoo_serv._make_stub(const poa: IPOA; const obj : IORBObject): IORBObject;
begin
  result := Tfoo_stub_clp.Create(poa,obj);
end;

procedure Tfoo_serv.invoke(const serv: IStaticServerRequest);
begin
  if not _dispatch(serv) then
    begin
      serv.set_exception(BAD_OPERATION.Create(0, COMPLETED_NO) as IORBException);
      serv.write_results();
    end;
end;

function Tfoo_serv.narrow_helper(const str: RepositoryID): Pointer;
begin
  result := nil;
  if str = 'IDL:foo:1.0' then
    begin
      result := Pointer(Ifoo(self));
      exit;
    end;
end;

class function Tfoo_serv._narrow(const srv : IServant): Ifoo;
var
  p: Pointer;
begin
  result := nil;
  if srv = nil then exit;
  p := srv.narrow_helper('IDL:foo:1.0');
  if p <> nil then
    result := Ifoo(p)
end;

function Tfoo_serv._dispatch(const req: IStaticServerRequest): Boolean;
var
  bar1_s: AnsiString;
  bar2_l: Tfoo_L;
  bar3_s: Tfoo_S;
begin
  result := true;
  if req.op_name = 'bar1' then
    begin
      req.add_in_arg(StaticAny(stat_string,@bar1_s) as IStaticAny);
      if not req.read_args() then  exit;
      bar1(bar1_s);
      req.write_results();
      exit;
    end
  else if req.op_name = 'bar2' then
    begin
      req.add_in_arg(StaticAny(stat_long,@bar2_l) as IStaticAny);
      if not req.read_args() then  exit;
      bar2(bar2_l);
      req.write_results();
      exit;
    end
  else if req.op_name = 'bar3' then
    begin
      req.add_in_arg(StaticAny(foo_S_marshaller,@bar3_s) as IStaticAny);
      if not req.read_args() then  exit;
      bar3(bar3_s);
      req.write_results();
      exit;
    end;
  result := false;
end;

//***********************************************************
// Tfoo_marshaller
//***********************************************************
function Tfoo_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  obj: IORBObject;
begin
  result := false;
  if not stat_Object.demarshal(dec,@obj) then exit;
  Ifoo(addr^) := Tfoo._narrow(obj);
  result := (obj = nil) or (Pointer(addr^) <> nil);
end;

procedure Tfoo_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  obj: IORBObject;
begin
  obj := Ifoo(addr^) as IORBObject;
  stat_Object.marshal(enc,@Pointer(obj));
end;

procedure Tfoo_marshaller._free(var addr: Pointer);
begin
  Ifoo(addr^) := nil;
end;

procedure Tfoo_marshaller._create(var addr: Pointer);
begin
  Ifoo(addr^) := Tfoo_stub.Create();
end;

procedure Tfoo_marshaller._assign(dst, src: Pointer);
begin
  Ifoo(dst^) := Ifoo(src^);
end;

function Tfoo_marshaller.typecode: ITypeCode;
begin
  result := _tc_foo.typecode;
end;

initialization
  SS__marshaller := TSS__marshaller.Create();
  foo_S_marshaller := Tfoo_S_marshaller.Create();
  foo_marshaller := Tfoo_marshaller.Create();
  _tc_SS_ := CreateTypeCodeConst('010000000f00000038000000010000000c00000049444c3a53535f3a312e30000400000053535f000200000002000000610000000a0000'+
    '0002000000620000000a000000');
  _tc_foo_S := CreateTypeCodeConst('010000000f0000003c000000010000000e00000049444c3a666f6f2f533a312e3000000002000000530000000200000002000000610000'+
    '0003000000020000006200000009000000');
  _tc_foo := CreateTypeCodeConst('010000000e0000001c000000010000000c00000049444c3a666f6f3a312e300004000000666f6f00');
end.
