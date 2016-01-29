// ***************************************************************************
//                                                                            
// Generated by the MTDORB IDL-to-Pascal Translator (1.0.1b1), 21.09.2010 13:25
//                                                                            
// Copyright (c) 2002 - 2004                                                  
// Millennium Group.                                                          
// Samara, Russia                                                             
//                                                                            
// All Rights Reserved                                                        
//                                                                            
// ***************************************************************************
// Compiled with parameters: " -any -i..\..\idl ..\..\idl\TimeBase.idl" 
//                                                                            
unit TimeBase;

interface

uses
  Classes, orb_int, orb, req_int, code_int, env_int, stdstat, std_seq,imr, imr_int, 
  orbtypes, exceptions, except_int, TimeBase_int, poa_int, poa;

type

  TTimeBase_UtcT_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

  TTimeBase_IntervalT_marshaller = class(TAbstractStat,IStaticTypeInfo)
  protected
    procedure _assign(dst,src: Pointer); override;
    function demarshal(dec: IDecoder;const addr : Pointer): Boolean;
    procedure marshal(enc: IEncoder; const addr : Pointer);
    procedure _create(var addr: Pointer); override;
    procedure _free(var addr: Pointer);
    function typecode: ITypeCode; override;
  end;

  function TimeBase_UtcT_to_any(const val: TTimeBase_UtcT): IAny;
  function any_to_TimeBase_UtcT(const a: IAny; var val: TTimeBase_UtcT): Boolean;

  function TimeBase_IntervalT_to_any(const val: TTimeBase_IntervalT): IAny;
  function any_to_TimeBase_IntervalT(const a: IAny; var val: TTimeBase_IntervalT): Boolean;

var
  TimeBase_UtcT_marshaller : IStaticTypeInfo;
  TimeBase_IntervalT_marshaller : IStaticTypeInfo;
  _tc_TimeBase_UtcT : ITypeCodeConst;
  _tc_TimeBase_IntervalT : ITypeCodeConst;

implementation

uses
  SysUtils, any, tcode, static, throw;

//***********************************************************
// TTimeBase_UtcT_marshaller
//***********************************************************
function TTimeBase_UtcT_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  struct: TimeBase_int.TTimeBase_UtcT;
begin
  result := false;
  if not stat_ulonglong.demarshal(dec,@struct.time) then exit;
  if not stat_ulong.demarshal(dec,@struct.inacclo) then exit;
  if not stat_ushort.demarshal(dec,@struct.inacchi) then exit;
  if not stat_short.demarshal(dec,@struct.tdf) then exit;
  TimeBase_int.TTimeBase_UtcT(addr^) := struct;
  result := true;
end;

procedure TTimeBase_UtcT_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  struct: TimeBase_int.TTimeBase_UtcT;
begin
  struct := TimeBase_int.TTimeBase_UtcT(addr^);
  stat_ulonglong.marshal(enc,@struct.time);
  stat_ulong.marshal(enc,@struct.inacclo);
  stat_ushort.marshal(enc,@struct.inacchi);
  stat_short.marshal(enc,@struct.tdf);
end;

procedure TTimeBase_UtcT_marshaller._free(var addr: Pointer);
begin
{$HINTS OFF}
  System.Finalize(TimeBase_int.TTimeBase_UtcT(addr^));
{$HINTS ON}
  FreeMem(addr);
end;

procedure TTimeBase_UtcT_marshaller._create(var addr: Pointer);
begin
  addr := AllocMem(sizeOf(TimeBase_int.TTimeBase_UtcT));
{$HINTS OFF}
  System.Initialize(TimeBase_int.TTimeBase_UtcT(addr^));
{$HINTS ON}
end;

procedure TTimeBase_UtcT_marshaller._assign(dst, src: Pointer);
begin
  TimeBase_int.TTimeBase_UtcT(dst^) := TimeBase_int.TTimeBase_UtcT(src^);
end;

function TTimeBase_UtcT_marshaller.typecode: ITypeCode;
begin
  result := _tc_TimeBase_UtcT.typecode;
end;

//***********************************************************
// TTimeBase_IntervalT_marshaller
//***********************************************************
function TTimeBase_IntervalT_marshaller.demarshal(dec: IDecoder;const addr : Pointer): Boolean;
var
  struct: TimeBase_int.TTimeBase_IntervalT;
begin
  result := false;
  if not stat_ulonglong.demarshal(dec,@struct.lower_bound) then exit;
  if not stat_ulonglong.demarshal(dec,@struct.upper_bound) then exit;
  TimeBase_int.TTimeBase_IntervalT(addr^) := struct;
  result := true;
end;

procedure TTimeBase_IntervalT_marshaller.marshal(enc: IEncoder;const addr : Pointer);
var
  struct: TimeBase_int.TTimeBase_IntervalT;
begin
  struct := TimeBase_int.TTimeBase_IntervalT(addr^);
  stat_ulonglong.marshal(enc,@struct.lower_bound);
  stat_ulonglong.marshal(enc,@struct.upper_bound);
end;

procedure TTimeBase_IntervalT_marshaller._free(var addr: Pointer);
begin
{$HINTS OFF}
  System.Finalize(TimeBase_int.TTimeBase_IntervalT(addr^));
{$HINTS ON}
  FreeMem(addr);
end;

procedure TTimeBase_IntervalT_marshaller._create(var addr: Pointer);
begin
  addr := AllocMem(sizeOf(TimeBase_int.TTimeBase_IntervalT));
{$HINTS OFF}
  System.Initialize(TimeBase_int.TTimeBase_IntervalT(addr^));
{$HINTS ON}
end;

procedure TTimeBase_IntervalT_marshaller._assign(dst, src: Pointer);
begin
  TimeBase_int.TTimeBase_IntervalT(dst^) := TimeBase_int.TTimeBase_IntervalT(src^);
end;

function TTimeBase_IntervalT_marshaller.typecode: ITypeCode;
begin
  result := _tc_TimeBase_IntervalT.typecode;
end;

function any_to_TimeBase_UtcT(const a: IAny; var val: TTimeBase_UtcT): Boolean;
var
  stat: IStaticAny;
begin
  stat := StaticAny(TimeBase_UtcT_marshaller,@val);
  result := a.to_static_any(stat);
end;

function TimeBase_UtcT_to_any(const val: TTimeBase_UtcT): IAny;
var
  stat: IStaticAny;
begin
  stat := StaticAny(TimeBase_UtcT_marshaller,@val);
  result := CreateAny;
  result.from_static_any(stat);
end;

function any_to_TimeBase_IntervalT(const a: IAny; var val: TTimeBase_IntervalT): Boolean;
var
  stat: IStaticAny;
begin
  stat := StaticAny(TimeBase_IntervalT_marshaller,@val);
  result := a.to_static_any(stat);
end;

function TimeBase_IntervalT_to_any(const val: TTimeBase_IntervalT): IAny;
var
  stat: IStaticAny;
begin
  stat := StaticAny(TimeBase_IntervalT_marshaller,@val);
  result := CreateAny;
  result.from_static_any(stat);
end;

initialization
  TimeBase_UtcT_marshaller := TTimeBase_UtcT_marshaller.Create();
  TimeBase_IntervalT_marshaller := TTimeBase_IntervalT_marshaller.Create();
  _tc_TimeBase_UtcT := CreateTypeCodeConst('010000000f000000ec000000010000001e00000049444c3a6f6d672e6f72672f54696d65426173652f557463543a312e30000000050000'+
    '005574635400000000040000000500000074696d65000000001500000038000000010000001f00000049444c3a6f6d672e6f72672f5469'+
    '6d65426173652f54696d65543a312e3000000600000054696d65540000001800000008000000696e6163636c6f00050000000800000069'+
    '6e6163636869000400000004000000746466001500000038000000010000001e00000049444c3a6f6d672e6f72672f54696d6542617365'+
    '2f546466543a312e3000000005000000546466540000000002000000');
  _tc_TimeBase_IntervalT := CreateTypeCodeConst('010000000f000000e0000000010000002300000049444c3a6f6d672e6f72672f54696d65426173652f496e74657276616c543a312e3000'+
    '000a000000496e74657276616c54000000020000000c0000006c6f7765725f626f756e64001500000038000000010000001f0000004944'+
    '4c3a6f6d672e6f72672f54696d65426173652f54696d65543a312e3000000600000054696d6554000000180000000c0000007570706572'+
    '5f626f756e64001500000038000000010000001f00000049444c3a6f6d672e6f72672f54696d65426173652f54696d65543a312e300000'+
    '0600000054696d655400000018000000');
end.
